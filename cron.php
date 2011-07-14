<?PHP
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  24th May,2011
	#	Test version  
	#	controller to process actions queued in the media_actions table and report status to the admin server
\*=========================================================================================*/



// Initialise objects
	$mysqli = new mysqli($dbLogin['dbhost'], $dbLogin['dbusername'], $dbLogin['dbuserpass'], $dbLogin['dbname']);
	$outObj = new Default_Model_Output_Class();
	$dataObj = new Default_Model_Action_Class($mysqli,$outObj,$apiName);
	
	$apCommand="curl -d \"number=10&time1\" http://podcast-api-dev.open.ac.uk/poll.php";	

// - Polling process part -------------------------------------------------------------------------------------------------------

// Check poll process and launch if not running. The Poll process polls both Media and Encoder APIs for completed tasks.
	$sqlQuery0 = "SELECT ap_process_id, ap_script, ap_status FROM api_process WHERE ap_status = 'Y' ORDER BY ap_timestamp DESC";
// echo $sqlQuery0;
	$result0 = $mysqli->query($sqlQuery0);
	$j=0;
	if ($result0->num_rows >=1) {
		while(	$row0 = $result0->fetch_object()) {
			if (PsExists($row0->ap_process_id)) {
//				echo " - ".$row0->ap_process_id;
				if ($j==0) {
					$sqlQuery2="UPDATE `api_process` SET `ap_status`='Y', `ap_last_checked`='".date("Y-m-d H:i:s", time())."' WHERE `ap_process_id`=  '".$row0->ap_process_id."' ";
					$mysqli->query($sqlQuery2);
// echo "<br />process still alive - ".$sqlQuery2;
 					$j=1;
				} else {
					PsKill($row0->ap_process_id);
					$sqlQuery3="UPDATE `api_process` SET `ap_status`='N', `ap_last_checked`='".date("Y-m-d H:i:s", time())."' WHERE `ap_process_id`=  '".$row0->ap_process_id."' ";						
					$mysqli->query($sqlQuery3);
//echo "<br />process killed - ".$sqlQuery3;
				}
			} else  {
					$sqlQuery4="UPDATE `api_process` SET `ap_status`='N', `ap_last_checked`='".date("Y-m-d H:i:s", time())."' WHERE `ap_process_id`=  '".$row0->ap_process_id."' ";						
					$mysqli->query($sqlQuery4);
//echo "<br />process died - ".$sqlQuery4;
			}
		}
	}
	if ($j==0) {
			$processID=PsExec($apCommand);
			if ($processID==false) $status='N'; else $status='Y';  
			$sqlQuery5 = "INSERT INTO `api_process` (`ap_process_id`, `ap_script`, `ap_timestamp`, `ap_status`) VALUES ( '".$processID."',  '".$apCommand."', '".date("Y-m-d H:i:s", time())."', '".$status."' )";
// echo "<br />New process - ".$sqlQuery5;
			$result = $mysqli->query($sqlQuery5);
	}
// Clean up old processes

	$sqlQuery6="DELETE FROM `api_process` WHERE ap_timestamp < (now() - interval 5 minute)  AND `ap_status`='N' ";
	$mysqli->query($sqlQuery6);

	$sqlQuery7="DELETE FROM `api_log` WHERE al_timestamp < (now() - interval 60 minute)";
	//  AND `al_message`='' ";
	$mysqli->query($sqlQuery7);

// - Proccessing of  commands part -----------------------------------------------------------------------------------------

// Get the actions from the queue table

	$sqlQuery1 = "SELECT mq.mq_index, mq.mq_status FROM queue_messages AS mq WHERE mq.mq_status IN('N') ORDER BY mq.mq_time_start";
	$result1 = $mysqli->query($sqlQuery1);
	if (isset($result1->num_rows)) {
	
// Process the outstanding commands for each message
		$cqCommand="'queue','direct'";
		while(	$row1 = $result1->fetch_object()) { 
			if ($row1->mq_status=='N') $m_data = $dataObj->doNextAction($row1->mq_index, $cqCommand);	
			$reply = $dataObj->doMessageCompletion($row1->mq_index);
		}
	}


// - Proccessing of  callbacks part -----------------------------------------------------------------------------------------

	$sqlQuery2 = "SELECT mq.mq_index, mq.mq_status, mq.mq_number, mq.mq_result, mq_retry_count, ad.ad_url, cr.cr_callback FROM queue_messages AS mq, command_routes AS cr, api_destinations AS ad WHERE cr.cr_action=mq.mq_command AND cr.cr_source=ad.ad_name AND mq.mq_status IN('S','R') ORDER BY mq.mq_time_start";
	$result2 = $mysqli->query($sqlQuery2);
	if (isset($result2->num_rows)) {

		while(	$row2 = $result2->fetch_object()) { 

			$mqResArr = unserialize($row2->mq_result);
		
			$result3=$outObj->message_send($row2->cr_callback, $row2->ad_url, $mqResArr, $row2->mq_number);
// $result3['status']="ACK"; // Fix the result until the admin can return a useful response.
			if ($result3['status'] == "NACK" ) {
				$sqlQuery7 = "UPDATE `queue_messages` SET `mq_status`= 'F' where mq_index='".$row2->mq_index."' ";
				$result7 = $mysqli->query($sqlQuery7);
			}  else  if ($result3['status'] == "ACK"){
				$sqlQuery8 = "UPDATE `queue_messages` SET `mq_status`= 'C' where mq_index='".$row2->mq_index."' ";
				$result8 = $mysqli->query($sqlQuery8);					
				$sqlQuery9 = "UPDATE `queue_commands` SET `cq_status`= 'C' where cq_mq_index='".$row2->mq_index."' AND `cq_status`='Y' ";
				$result9 = $mysqli->query($sqlQuery9);					
			} else if ($row2->mq_retry_count<1) {
				$sqlQuery7 = "UPDATE `queue_messages` SET `mq_status`= 'R', `mq_retry_count`= mq_retry_count + 1 where mq_index='".$row2->mq_index."' ";
				$result7 = $mysqli->query($sqlQuery7);
			} else {
				$sqlQuery7 = "UPDATE `queue_messages` SET `mq_status`= 'T' where mq_index='".$row2->mq_index."' ";
				$result7 = $mysqli->query($sqlQuery7);
			}			
		}
	}
// Clean up old completed commands

	$sqlQuery6="DELETE FROM `queue_commands` WHERE cq_time < (now() - interval 1 hour) AND `cq_status`='C' ";
	$mysqli->query($sqlQuery6);
	$sqlQuery7="DELETE FROM `queue_messages` WHERE mq_time_start < (now() - interval 1 hour) AND `mq_status`='C' ";
	$mysqli->query($sqlQuery7);

// Report the status of completed tasks

?>