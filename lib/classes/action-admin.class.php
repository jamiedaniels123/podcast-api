<?php
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  20th Feb,2011
	#	Test version  
	#  Class File to handle file service actions and provide responses.
\*=========================================================================================*/

class Default_Model_Action_Class 
// extends Default_Model_DB_Class
  {
	
	/**  * Constructor  */
    function Default_Model_Action_Class($mysqli,$outObj,$apiName){}  

// ------ User stuff

	function objectToArray($d) {
		if (is_object($d)) {
			$d = get_object_vars($d);
		}
	
		if (is_array($d)) {
			return array_map(__FUNCTION__, $d);
		}
		else {
			return $d;
		}
	}
	
	public function transfer($src, $dest) {
			
		$cmdline = "/usr/bin/scp -p ".escapeshellcmd($src)." ".escapeshellcmd($dest)." 2>&1";
//		echo "<p>Transfer cmd line =".$cmdline."</p>\n";  // debug
		//error_log("Transfer cmd line =".$cmdline);  // debug
		exec($cmdline, $out, $code);
	  
		return array($code, $out);
	  }
	   
	public function transfer1($src, $dest, $srcfile, $destfile) {
			
		$connection = ssh2_connect($dest['server'], 22, array('hostkey'=>'ssh-rsa'));
		
		if (ssh2_auth_hostbased_file($connection, $dest['user'], $src['server'],
									 '/usr/local/etc/hostkey_rsa.pub',
									 '/usr/local/etc/hostkey_rsa', 'secret',
									  $src['user'])) {
		  echo "Public Key Hostbased Authentication Successful\n";
		  ssh2_scp_send($connection, '/local/filename', '/remote/filename', 0644);

		} else {
		  die('Public Key Hostbased Authentication Failed');
		}
		
		return array($code, $out);
	}

	public function getStatus($mArr,$mNum,$mCommand)
	{
		$retData= array( 'command'=>'statusReply', 'number'=>'',  'data'=>'') ;
		$dataArr='';		$i=0;		
		while (isset($mArr[$i])){
			
			$i++;
		}
		if ($retData!='') $retData['number']=$i; else $retData['number']=0;
		return $retData;
	}

	public function queueAction($mArr,$mNum,$action,$timestamp)
	{
		global $mysqli;

		$retData= array( 'command'=>$action, 'number'=>'', 'data'=>'Queued admin-api!', 'status'=>'', 'timestamp'=>time()) ;
		$dataArr='';	
		$sqlMessages = "INSERT INTO `queue_messages` (`mq_command`, `mq_number`, `mq_time_start`, `mq_status`) VALUES ( '".$action."',  '".$mNum."', '".date("Y-m-d H:i:s", $timestamp)."', 'N' )";
//	echo $sqlMessages;
		$result = $mysqli->query($sqlMessages);
		$mess_id = $mysqli->insert_id;
		$sqlCommands = "INSERT INTO `queue_commands` (`cq_command`, `cq_mq_index`, `cq_data`, `cq_time`, `cq_update`, `cq_status`) VALUES ";
		$i=0;
		while (isset($mArr[$i])){
			if($i!=0) $sqlCommands.= ", ";
			$sqlCommands.= "('".$action."', '".$mess_id."','".serialize($mArr[$i])."','".date("Y-m-d H:i:s", $timestamp)."', '', 'N')"; 
			$i++;
		}
//	echo $sqlCommands;
		$result = $mysqli->query($sqlCommands);
//		$error .= "queueAcction - ".$mysqli->info;
		
		if ($retData!='') {$retData['number']=$i;$retData['status']='ACK'; $retData['mqIndex']=$mess_id;} else {$retData['number']=0;$retData['status']='NACK';}
		return $retData;
	}

	public function doNextAction($mqIndex,$cqCommand){
		
		global $mysqli, $apiName, $error;

//		for ( $i = 0; $i <= 4; $i++) {
			$sqlQuery1 = "SELECT * FROM queue_commands AS cq, command_routes AS cr,api_workflows AS wf WHERE cq.cq_command=cr.cr_action AND wf.wf_cr_index=cr.cr_index AND cq.cq_wf_step=wf.wf_step AND  cq.cq_status = 'N' AND cq.cq_mq_index='".$mqIndex."' AND wf.wf_route_type IN (".$cqCommand.") ";

//	 echo $sqlQuery1;
			$result4 = $mysqli->query($sqlQuery1);
			if ($result4->num_rows >= 1) $this->processActions($result4);
//		}
		 return array('mqIndex'=>$mqIndex);
	}

	function processActions($resultObj) {

		global $mysqli, $error;

// Process the outstanding actions 
			while(	$row = $resultObj->fetch_object()) {
				$cqResult=unserialize($row->cq_result); 

					$function=$row->wf_function;
//	 print_r($function);
	// Call the action with the data
					$retData = $this->$function(unserialize($row->cq_data),1,$row->cq_index);
					if ($row->wf_steps > $row->wf_step && $retData['result']=='Y') $step=$row->wf_step +1; else $step=$row->wf_step;
					if ($row->wf_steps == $row->wf_step) $status='Y'; else  $status='N';
					$sqlQuery="UPDATE `queue_commands` SET `cq_result`='".serialize($retData)."', `cq_status`='".$status."', `cq_wf_step`='".$step."', `cq_update`='".date("Y-m-d H:i:s", time())."' WHERE `cq_index`=  '".$row->cq_index."' ";
					$result = $mysqli->query($sqlQuery);
//					$error .= "ProcessActions - ".$mysqli->info;

			}
	}

	function doMediaPushFile($mArr,$mNum,$cqIndex)
	{
		global $source, $destination; 

		$retData= array('cqIndex'=>$cqIndex, 'filename'=> $mArr['filename'], 'source_path'=> $mArr['source_path'], 'destination_path'=> $mArr['destination_path'], 'number'=> 0, 'result'=> 'N') ;
		$outFile = urlencode($mArr['destination_path'].$mArr['filename']);
 		$retData['scp'] = $this->transfer($source['admin'].$mArr['source_path'].$mArr['filename'] , $destination['media'].$outFile);
		if ($retData['scp'][0]==0) $retData['result']='Y';
		return $retData;
	}

	function doPushNextCommand($mArr,$mNum,$cqIndex)
	{
		global $mysqli, $outObj;

		$retData= array('cqIndex'=>$cqIndex, 'number'=> $mNum, 'result'=> 'N') ;
		$postRetData['status']='N';
		$sqlQuery = "SELECT * FROM queue_commands AS cq, api_workflows AS wf, command_routes AS cr, api_destinations as ad WHERE cq.cq_command=cr.cr_action AND cr.cr_index=wf.wf_cr_index AND wf.wf_ad_index=ad.ad_index AND wf.wf_step = 1 + cq.cq_wf_step AND cq.cq_index='".$cqIndex."'";
//		echo $sqlQuery;
 		$result5 = $mysqli->query($sqlQuery);
		$row5 = $result5->fetch_object();

//		if (isset($mArr) && isset($mArr['command']) && $mArr['command']!= '') {
			$postRetData=$outObj->message_send_next_command($row5->wf_command,  $row5->ad_url, $cqIndex,  $row5->cq_mq_index, $row5->wf_step, $mArr, $mNum);
//		}
// print_r($postRetData);
		// if ($postRetData['status']=='ACK') 
		$retData['result']='Y';
		$retData['debug']=$postRetData;
// print_r($postRetData);
		return $retData;
	}

	public function doMessageCompletion($mqIndex)
	{
		global $mysqli, $outObj;
		
		$result="Checking - ".$mqIndex;
		
		$sqlQuery6 = "SELECT count(cq.cq_index) AS num, mq.mq_number, ad.ad_url, cr.cr_callback FROM queue_messages AS mq, queue_commands cq, command_routes AS cr, api_destinations as ad WHERE mq.mq_index=cq.cq_mq_index AND cr.cr_action=mq.mq_command AND cr.cr_source=ad.ad_name AND mq.mq_index = '".$mqIndex."' AND cq.cq_status='Y'";
// echo $sqlQuery6;
		$result6 = $mysqli->query($sqlQuery6);
		if ($result6->num_rows!=0) {
			$row6 = $result6->fetch_object();
			if ($row6->num == $row6->mq_number) {
				$sqlQuery3 = "SELECT * FROM queue_messages AS mq, queue_commands cq WHERE mq.mq_index=cq.cq_mq_index AND mq.mq_index = '".$mqIndex."'";
				$result3 = $mysqli->query($sqlQuery3);
				$i=0;
				while(	$row3 = $result3->fetch_object()){
					$r_data[]= unserialize($row3->cq_result); 
					$i++;
				}
				$sqlQuery2 = "UPDATE `queue_messages` SET `mq_time_complete` = '".date("Y-m-d H:i:s", time())."' ,`mq_status`= 'R', `mq_result`='".serialize($r_data)."' where mq_index='".$mqIndex."' ";
// echo $sqlQuery2;
				$result2 = $mysqli->query($sqlQuery2);

			}
		}
		return $result;

	}

}
?>