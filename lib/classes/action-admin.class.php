<?php
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  20th Feb,2011
	#	Test version  
	#  Admin-api Class File to handle file service actions and provide responses.
\*=========================================================================================*/

class Default_Model_Action_Class 

  {
    protected $m_mysqli,$m_outObj;
	
	/**  * Constructor  */
    function Default_Model_Action_Class($mysqli,$outObj){
		$this->m_mysqli = $mysqli;
		$this->m_outObj = $outObj;
	}  

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

    function PsExec($commandJob) {

        $command = $commandJob.' > /dev/null 2>&1 & echo $!';
        exec($command ,$op);
        $pid = (int)$op[0];
        if($pid!="") return $pid;

        return false;
    }

    function PsExists($pid) {

        exec("ps ax | grep $pid 2>&1", $output);

        while( list(,$row) = each($output) ) {

                $row_array = explode(" ", $row);
                $check_pid = $row_array[0];

                if($pid == $check_pid) {
                        return true;
                }

        }

        return false;
    }

    function PsKill($pid) {
        exec("kill -9 $pid", $output);
    }

	public function startCheckProcess($apCommand) {

		$result0 = $this->m_mysqli->query("
			SELECT ap_process_id, ap_script, ap_status 
			FROM api_process 
			WHERE ap_status = 'Y' 
			ORDER BY ap_timestamp DESC");
		$j=0;
		if ($result0->num_rows >=1) {
			while(	$row0 = $result0->fetch_object()) {
				if ($this->PsExists($row0->ap_process_id)) {
					if ($j==0) {
						$this->m_mysqli->query("
							UPDATE `api_process` 
							SET `ap_status`='Y', `ap_last_checked`='".date("Y-m-d H:i:s", time())."' 
							WHERE `ap_process_id`=  '".$row0->ap_process_id."' ");
						$j=1;
					} else {
						$this->PsKill($row0->ap_process_id);
						$this->m_mysqli->query("
							UPDATE `api_process` 
							SET `ap_status`='N', `ap_last_checked`='".date("Y-m-d H:i:s", time())."' 
							WHERE `ap_process_id`=  '".$row0->ap_process_id."' ");
					}
				} else  {
						$this->m_mysqli->query("
							UPDATE `api_process` 
							SET `ap_status`='N', `ap_last_checked`='".date("Y-m-d H:i:s", time())."' 
							WHERE `ap_process_id`=  '".$row0->ap_process_id."' ");
				}
			}
		}
		if ($j==0) {
				$processID=$this->PsExec($apCommand);
				if ($processID==false) $status='N'; else $status='Y';  
				$result = $this->m_mysqli->query("
					INSERT INTO `api_process` (`ap_process_id`, `ap_script`, `ap_timestamp`, `ap_status`) 
					VALUES ( '".$processID."',  '".$apCommand."', '".date("Y-m-d H:i:s", time())."', '".$status."' )");
		}

	}
	
	function transfer($src, $dest) {
			
		$cmdline = "/usr/bin/scp -p ".escapeshellcmd($src)." ".escapeshellcmd($dest)." 2>&1";
//		echo "<p>Transfer cmd line =".$cmdline."</p>\n";  // debug
		//error_log("Transfer cmd line =".$cmdline);  // debug
		exec($cmdline, $out, $code);
	  
		return array($code, $out);
	 }

	public function pollMedia() {

		global $source,$destination;

		$fdata0 = array('command'=>'poll_media');

		$reply0=$this->m_outObj->message_send('poll-media', $destination['media-api'], $fdata0,1);
		
		if ($reply0['status']=='Y') {	
			foreach($reply0['data'] as $k0 => $v0){ 
				if ($v0['status']=='Y' || $v0['status']=='F') {
					$result2 = $this->m_mysqli->query("
						SELECT aw.wf_steps, cq_wf_step  
						FROM queue_commands AS cq, command_routes AS cr, api_workflows AS aw 
						WHERE cq.cq_command=cr.cr_action 
						AND cr.cr_index=aw.wf_cr_index 
						AND aw.wf_step='".$v0['step']."' 
						AND `cq_index`=  '".$v0['cqIndex']."' ");
					if ($result2->num_rows) {
						$row2=$result2->fetch_object();
						if ( $v0['step'] == $row2->wf_steps || $v0['status']=='F') $status=$v0['status']; else $status='N';
						if ($v0['step'] == $row2->cq_wf_step && $v0['step'] != $row2->wf_steps && $v0['status']=='Y') $step= $v0['step']+1; else $step= $v0['step']; 
 
						if(isset($v0['meta_data'])) 
							$v0['meta_data'] = unserialize(gzuncompress(stripslashes(base64_decode(strtr($v0['meta_data'], '-_,', '+/=')))));
						if(isset($v0['debug'])) 
							$v0['debug'] = unserialize(gzuncompress(stripslashes(base64_decode(strtr($v0['debug'], '-_,', '+/=')))));

						$result3 = $this->m_mysqli->query("
							UPDATE `queue_commands` 
							SET `cq_result`='".serialize($v0)."', `cq_status`='".$status."', `cq_wf_step`= '".$step."', `cq_update`='".date("Y-m-d H:i:s", time())."' 
							WHERE `cq_index`=  '".$v0['cqIndex']."' ");
						$mqToCheck0[$v0['mqIndex']]=$v0['mqIndex'];
					}
				}
			}
			if (isset($mqToCheck0) && is_array($mqToCheck0)) {
				foreach($mqToCheck0 as $k10 => $v10) {
					$reply10 = $this->doMessageCompletion($v10);
				}
			}
		}

	}

	public function pollEncoder() {

		global $source,$destination;

		$fdata1 = array('command'=>'poll_encoder');
		
		$reply1=$this->m_outObj->message_send('poll-encoder', $destination['encoder-api'], $fdata1,1);
		
		if ($reply1['status']=='Y') {	
			foreach($reply1['data'] as $k1 => $v1){ 
				if ($v1['status']=='Y' || $v1['status']=='F') {
					$result4 = $this->m_mysqli->query("
						SELECT aw.wf_steps, `cq_mq_index`, `cq_command`,  `cq_filename`, `cq_data`, `cq_result`, `cq_time`, `cq_update`, `cq_wf_step`, `cq_status` 
						FROM queue_commands AS cq, command_routes AS cr, api_workflows AS aw 
						WHERE cq.cq_command=cr.cr_action 
						AND cr.cr_index=aw.wf_cr_index and aw.wf_step='".$v1['step']."' 
						AND `cq_index`=  '".$v1['cqIndex']."' ");
					if ($result4->num_rows) {
						$row4=$result4->fetch_object();
						if ($v1['step'] == $row4->cq_wf_step ) $step= $v1['step']+1; else $step = $v1['step']; 
						if ( $v1['step'] == $row4->wf_steps  || $v1['status']=='F') {
							$status=$v1['status'];
							$step= $v1['step'];
						} else {
							$status='N'; 
						}
						if ( $row4->cq_filename != $v1['source_filename']){
							$step= $v1['step']+1;
							$mData = unserialize($row4->cq_data);
							$mData['source_filename'] = $v1['source_filename'];
							if (!strpos( $v1['source_filename'], '-____')) 
								$mData['destination_filename'] = $v1['destination_filename']; 
							$mData['destination_path'] = $v1['destination_path']; 
							$mData['original_filename'] = $v1['original_filename'];
							$mData['flavour'] = $v1['flavour'];
							$mData['duration'] = $v1['duration'];
							if(isset($v1['debug'])) 
								$mData['debug'] = unserialize(gzuncompress(stripslashes(base64_decode(strtr($v1['debug'], '-_,', '+/=')))));
							$this->m_mysqli->query("
								INSERT INTO `queue_commands` ( `cq_mq_index`, `cq_command`,  `cq_filename`, `cq_data`, `cq_result`, `cq_time`, `cq_update`, `cq_wf_step`, `cq_status`) 
								VALUES	('".$row4->cq_mq_index."','".$row4->cq_command."','".$v1['source_filename']."','".serialize($mData)."','".serialize($v1)."','".$row4->cq_time."','".date("Y-m-d H:i:s", time())."','".$step."', 'N')");
							$this->m_mysqli->query("
								UPDATE `queue_messages` 
								SET `mq_number`= mq_number + 1 
								WHERE mq_index='".$row4->cq_mq_index."' ");
						}else{ 
							if(isset($v1['debug'])) 
								$v1['debug'] = unserialize(gzuncompress(stripslashes(base64_decode(strtr($v1['debug'], '-_,', '+/=')))));
							$result5 = $this->m_mysqli->query("
								UPDATE `queue_commands` 
								SET `cq_result`='".serialize($v1)."', `cq_status`='".$status."', `cq_wf_step`= '".$step."', `cq_update`='".date("Y-m-d H:i:s", time())."' 
								WHERE `cq_index`=  '".$v1['cqIndex']."' ");
						}
						$mqToCheck1[$v1['mqIndex']]=$v1['mqIndex'];
					}
				}
			}
			if (isset($mqToCheck1) && is_array($mqToCheck1)) {
				foreach($mqToCheck1 as $k11 => $v11) {
					$reply10 = $this->doMessageCompletion($v11);
				}
			}
		}

	}

	public function pollVLE($request = '') {

		global $source,$destination;

		$fdata2= array('command'=>'poll_vle');

		$replyMess=$this->m_outObj->message_send_vle('poll-vle', $request, $source['vle-app'], $fdata2,1);

		print_r( $replyMess);
//		$data=json_decode($replyMess,true);
		$data=$replyMess;

// Check we know this command/action
		$result = $this->m_mysqli->query("
			SELECT * 
			FROM api_workflows AS wf, command_routes AS cr  
			WHERE cr.cr_index=wf.wf_cr_index 
			AND wf.wf_step = cq.cq_wf_step 
			AND cr.cr_action = '".$data['command']."'
			AND cr.cr_source = 'vle-api' ");
		$row = $result->fetch_object();
		
		if ($result->num_rows) {
// Put the command on the queue
			if ($row->cr_route_type=='direct'){
				$m_data = $this->doDirectAction($data['command'], $row->cr_function, $destination[$row5->wf_destination], $data['data'], $data['number']);
			}
		}else{
			$m_data = array('status'=>'NACK', 'data'=>'Command not known!', 'timestamp'=>time());
		}


	}

	function dataCheck($data,$rowArr) {

		$error='';

		foreach($rowArr as $v){
			
			if ($v != "") {
				if (isset($data[$v])){
					if (strlen($data[$v])<2)	 {
						if (is_array($data[$v])) 
							$add_to_error=""; 
						else 
							$add_to_error=" ".$v.":".$data[$v]." - ";	
						$error .=  $add_to_error;					
					}
				} else {
					$error.=" ".$v." field empty or missing - ";
				}
			} 

		}
		return $error;

	}


	public function queueAction($mArr,$mNum,$action,$timestamp,$rowArr){
		
		$retData= array( 'command'=>$action, 'number'=>'', 'data'=>'Queued admin-api!', 'status'=>'', 'error' =>'', 'timestamp'=>time()) ;
		$dataArr='';	
		$result = $this->m_mysqli->query("	
			INSERT INTO `queue_messages` (`mq_command`, `mq_number`, `mq_time_start`, `mq_status`) 
			VALUES ( '".$action."',  '".$mNum."', '".date("Y-m-d H:i:s", $timestamp)."', 'N' )");
		$mess_id = $this->m_mysqli->insert_id;
		$sqlCommands = "INSERT INTO `queue_commands` (`cq_command`, `cq_filename`, `cq_mq_index`, `cq_data`, `cq_time`, `cq_update`, `cq_status`) VALUES ";
		$i=0;
		$dataOK=true;
// Build a multiple row insert using the data array
		while (isset($mArr[$i]) && $dataOK==true){
			$retData['error'][$i]=$this->dataCheck($mArr[$i],$rowArr);
			if ($retData['error'][$i]=="") {
				if (isset($mArr[$i]['source_filename']) && $mArr[$i]['source_filename']!='') 
					$srcFileName = $mArr[$i]['source_filename']; 
				else if (isset($mArr[$i]['destination_filename']) && $mArr[$i]['destination_filename']!='')
					$srcFileName = $mArr[$i]['destination_filename']; 
				else	
					$srcFileName = "";
				if($i!=0) 
					$sqlCommands.= ", ";
				if(isset($mArr[$i]['meta_data'])) $mArr[$i]['meta_data'] = unserialize(gzuncompress(stripslashes(base64_decode(strtr($mArr[$i]['meta_data'], '-_,', '+/='))))); 
				$sqlCommands.= "('".$action."', '".$srcFileName."', '".$mess_id."','".serialize($mArr[$i])."','".date("Y-m-d H:i:s", $timestamp)."', '', 'N')"; 
				
				$i++;
			} else{
				$dataOK=false;
			}
		}

		if ($dataOK==false) {
			$retData['number']=0;$retData['status']='NACK';
			$this->m_mysqli->query("
				UPDATE `queue_messages` 
				SET `mq_status`= 'F', `mq_failed`= ".$i.", `mq_result`= '".serialize($retData)."' 
				WHERE mq_index='".$mess_id."' ");
		}else{
			$result = $this->m_mysqli->query($sqlCommands);
			$retData['number']=$i;$retData['status']='ACK'; $retData['mqIndex']=$mess_id;
		
		}

		return $retData;
	}

	public function doNextAction($mqIndex,$cqCommand){
		
		global $debug;
		
		$result4 = $this->m_mysqli->query("
			SELECT * 
			FROM queue_commands AS cq, command_routes AS cr,api_workflows AS wf 
			WHERE cq.cq_command=cr.cr_action AND wf.wf_cr_index=cr.cr_index AND cq.cq_wf_step=wf.wf_step AND  cq.cq_status = 'N' AND cq.cq_mq_index='".$mqIndex."' AND wf.wf_route_type IN (".$cqCommand.") ");
		if ($result4->num_rows >= 1) {
// Process the outstanding actions 
			while(	$row = $result4->fetch_object()) {
			$debug[] = $row;

				$cqResult=unserialize($row->cq_result); 
					$function=$row->wf_function;
// Call the action with the data
					$retData = $this->$function(unserialize($row->cq_data),1,$row->cq_index);
					if ($retData['result']=='F') {
						$status='F';
						$step=$row->wf_step;
					} else {
						if ($row->wf_steps > $row->wf_step) $step=$row->wf_step +1; else $step=$row->wf_step;
						if ($row->wf_steps == $row->wf_step) $status='Y'; else  $status='N';
					}
					$result = $this->m_mysqli->query("	
						UPDATE `queue_commands` 
						SET `cq_result`='".serialize($retData)."', `cq_status`='".$status."', `cq_wf_step`='".$step."', `cq_update`='".date("Y-m-d H:i:s", time())."' 
						WHERE `cq_index`=  '".$row->cq_index."' ");
			}
		}

		return array('mqIndex'=>$mqIndex, 'command'=>$cqCommand);
	}

	public function doDirectAction($command, $function, $callbackUrl,$mArr, $number){
		
//		echo $function;
		
		$retData = $this->$function($command, $callbackUrl, $mArr,$number);
		
		return $retData;
	}


	function doMediaPushFile($mArr,$mNum,$cqIndex){

		global $source,$destination;

		$retData= array('cqIndex'=>$cqIndex, 'source_path'=> $mArr['source_path'], 'source_filename'=> $mArr['source_filename'], 'number'=> 0, 'result'=> 'N') ;

		$inFile = $mArr['source_path'].$mArr['source_filename'];
		$outFile = urlencode($mArr['source_path'].$mArr['source_filename']);
		$retData['scp'] = $this->transfer($source['admin-files'].$mArr['source_path'].$mArr['source_filename'] , $destination['media-scp'].$cqIndex."_".$outFile);
		if ($retData['scp'][0]==0) $retData['result']='Y'; else $retData['result']='F'; 

		return $retData;
	}

	function doPushNextCommand($mArr,$mNum,$cqIndex){

		global $source,$destination;
		
		$retData= array('cqIndex'=>$cqIndex, 'number'=> $mNum, 'result'=> 'N') ;
		$postRetData['status']='N';
 		$result5 = $this->m_mysqli->query("
			SELECT * 
			FROM queue_commands AS cq, api_workflows AS wf, command_routes AS cr  
			WHERE cq.cq_command=cr.cr_action AND cr.cr_index=wf.wf_cr_index AND wf.wf_step = 1 + cq.cq_wf_step AND cq.cq_index='".$cqIndex."'");
		$row5 = $result5->fetch_object();

		if(isset($mArr['meta_data'])) $mArr['meta_data'] = strtr(base64_encode(addslashes(gzcompress(serialize($mArr['meta_data']),9))), '+/=', '-_,');

		$postRetData=$this->m_outObj->message_send_next_command($row5->wf_command, $destination[$row5->wf_destination], $cqIndex, $row5->cq_mq_index, $row5->wf_step, $mArr, $mNum);

		if (isset($postRetData['status'] ) && $postRetData['status'] == 'TIMEOUT'){
			$retData['result']='N';
			$retData['debug']=$postRetData;
		} else {
			$retData['result']='Y';
			$retData['debug']=$postRetData;
		}
		return $retData;
	}

	function doPassToAdmin($command, $callbackUrl, $mArr, $number){

			$result3=$this->m_outObj->message_send($command, $callbackUrl, $mArr, $number);
						
	}

	public function doMessageCompletion($mqIndex){
		
		$result="Checking - ".$mqIndex;
		
		$result6 = $this->m_mysqli->query("
			SELECT count(cq.cq_index) AS num, mq.mq_number, cr.cr_callback, cr.cr_delivery 
			FROM queue_messages AS mq, queue_commands cq, command_routes AS cr 
			WHERE mq.mq_index=cq.cq_mq_index AND cr.cr_action=mq.mq_command AND mq.mq_index = '".$mqIndex."' AND cq.cq_status IN ('Y','F')");
		if ($result6->num_rows!=0) {
			$row6 = $result6->fetch_object();
			if ($row6->num == $row6->mq_number && $row6->cr_delivery == 'single') {
				$result3 = $this->m_mysqli->query("
					SELECT * 
					FROM queue_messages AS mq, queue_commands cq 
					WHERE mq.mq_index=cq.cq_mq_index AND mq.mq_index = '".$mqIndex."'");
				$i=0;
				$j=0;
				while(	$row3 = $result3->fetch_object()){
					$r_data[$i]= unserialize($row3->cq_result); 
					$r_data[$i]['number']=$i+1;
					if ($row3->cq_status=='F') $j++;
					$i++;
				}
				$result2 = $this->m_mysqli->query("
					UPDATE `queue_messages` 
					SET `mq_time_complete` = '".date("Y-m-d H:i:s", time())."' ,`mq_status`= 'S', `mq_failed`= ".$j.", `mq_result`='".serialize($r_data)."' 
					WHERE mq_index='".$mqIndex."' ");
			} else {
				if ($row6->cr_delivery == 'multiple'){
					$result3 = $this->m_mysqli->query("
						SELECT * 
						FROM queue_messages AS mq, queue_commands cq 
						WHERE mq.mq_index=cq.cq_mq_index AND mq.mq_index = '".$mqIndex."'  AND cq.cq_status IN('Y','F') LIMIT 1");
					$j=0;
					$row3 = $result3->fetch_object();
					if ($row3->mq_status=='N') {
						$r_data[0]= unserialize($row3->cq_result); 
						$r_data[0]['number']=1;
						if ($row3->cq_status=='F') $j++;					
						$result2 = $this->m_mysqli->query("
							UPDATE `queue_messages` 
							SET `mq_time_complete` = '".date("Y-m-d H:i:s", time())."' ,`mq_status`= 'S', `mq_failed`= ".$j.", `mq_returned`= mq_returned + 1, `mq_retry_count`= 0, `mq_result`='".serialize($r_data)."' 
							WHERE mq_index='".$mqIndex."' ");
					}
				}
			}
		}
		return $result;

	}
	
	public function doCallback(){

		global $source,$destination;
		
		$result2 = $this->m_mysqli->query( "
			SELECT mq.mq_index, mq.mq_status, mq.mq_number, mq.mq_returned, mq.mq_failed, mq.mq_result, mq_retry_count, cr.cr_callback, cr.cr_source, cr.cr_delivery 
			FROM queue_messages AS mq, command_routes AS cr 
			WHERE cr.cr_action=mq.mq_command AND mq.mq_status IN('S','R') ORDER BY mq.mq_time_start");
		if (isset($result2->num_rows)) {
	
			while(	$row2 = $result2->fetch_object()) { 
	
				$mqResArr = unserialize($row2->mq_result);
				$result3=$this->m_outObj->message_send_callback($row2->cr_callback, $destination[$row2->cr_source], $mqResArr, $row2->mq_number, $row2->mq_failed);

				$s = $row2->mq_status;
				
				if ($result3['status'] == "NACK" ) {
					$s='F';
					mail ("i.newton@open.ac.uk", "Admin API callback error", "Sent:\n\n".$row2->mq_result."\n\nReply:\n\n".json_encode($result3),"From:i.newton@open.ac.uk");
				}  else  if ($result3['status'] == "ACK" && $row2->cr_delivery=='single'){
					$s='C';
					$this->m_mysqli->query("
						UPDATE `queue_commands` 
						SET `cq_status`= 'C' 
						WHERE cq_mq_index='".$row2->mq_index."' AND `cq_status`='Y' ");					
				}  else  if ($result3['status'] == "ACK" && $row2->cr_delivery=='multiple'){
					if ($row2->mq_number == $row2->mq_returned || ($row2->mq_number == 1 && $row2->mq_returned == 1 )) $s='C'; else $s='N';
					$cqIndex=$mqResArr['0']['cqIndex'];
					$this->m_mysqli->query("
						UPDATE `queue_commands` 
						SET `cq_status`= 'C' 
						WHERE cq_index='".$cqIndex."'");					
				} else if ($row2->mq_retry_count<2) {
					mail ("i.newton@open.ac.uk", "Admin API callback warning resending ->", "Sent:\n\n".$row2->mq_result."\n\nReply:\n\n".json_encode($result3),"From:i.newton@open.ac.uk");
				} else {
					$s='T';
					mail ("i.newton@open.ac.uk", "Admin API callback error connection timed out!", "Sent:\n\n".$row2->mq_result."\n\nReply:\n\nNone","From:i.newton@open.ac.uk");
				}
				$this->m_mysqli->query("
					UPDATE `queue_messages` 
					SET `mq_status`= '".$s."', `mq_retry_count`= mq_retry_count + 1 
					WHERE mq_index='".$row2->mq_index."' ");
			
			}
		}
	}

}
?>