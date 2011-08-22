<?PHP
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  24th May,2011
	#	Test version  
	#	controller to process actions queued in the media_actions table and report status to the admin server
\*=========================================================================================*/

// Initialise objects
	$mysqli = new mysqli($dbLogin['dbhost'], $dbLogin['dbusername'], $dbLogin['dbuserpass'], $dbLogin['dbname']);
	$outObj = new Default_Model_Output_Class($mysqli);
	$dataObj = new Default_Model_Action_Class($mysqli,$outObj);
	
	$apCommand="curl -d \"number=5&time=2\" ".$destination['admin-api']."/poll.php";	

// Check and/or start 2s polling process

	$dataObj->startCheckProcess($apCommand); 

// Clean up old processes and api-log

	$mysqli->query("	DELETE FROM `api_process` 
							WHERE ap_timestamp < (now() - interval 5 minute)  
							AND `ap_status`='N' ");

	$mysqli->query("	DELETE FROM `api_log` 
							WHERE al_timestamp < (now() - interval 12 hour)");

// - Proccessing of  commands part -----------------------------------------------------------------------------------------

// Get the actions from the queue table
	$timeStart= time();

// Loop every 3 seconds if we can 
	while ( time() < $timeStart + 8 ) {

		$result1 = $mysqli->query("	SELECT mq.mq_index, mq.mq_status 
												FROM queue_messages AS mq 
												WHERE mq.mq_status IN('N') 
												ORDER BY mq.mq_time_start");
	
		if (isset($result1->num_rows)) {
		
	// Process the outstanding commands for each message
			$cqCommand="'queue','direct'";
			while(	$row1 = $result1->fetch_object()) { 
//			$debug[] = $row1;
				if ($row1->mq_status=='N') $m_data = $dataObj->doNextAction($row1->mq_index, $cqCommand);	
				$reply[] = $dataObj->doMessageCompletion($row1->mq_index);
			}
		}
	
	// - Proccessing callbacks part -----------------------------------------------------------------------------------------
	
		$dataObj->doCallback();

		ob_clean();
		sleep(3);
	}

// Clean up old completed commands

	$mysqli->query("	DELETE FROM `queue_commands` 
							WHERE cq_time < (now() - interval 12 hour) 
							AND `cq_status`='C' ");
	$mysqli->query("	DELETE FROM `queue_messages` 
							WHERE mq_time_start < (now() - interval 12 hour) 
							AND `mq_status`='C' ");

?>