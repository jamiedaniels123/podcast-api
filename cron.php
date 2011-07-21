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

// Check and/or start 2s polling process

	$dataObj->startCheckProcess($apCommand); 

// Clean up old processes and api-log

	$mysqli->query("	DELETE FROM `api_process` 
							WHERE ap_timestamp < (now() - interval 5 minute)  
							AND `ap_status`='N' ");

	$mysqli->query("	DELETE FROM `api_log` 
							WHERE al_timestamp < (now() - interval 30 minute)");

// - Proccessing of  commands part -----------------------------------------------------------------------------------------

// Get the actions from the queue table

	$result1 = $mysqli->query("	SELECT mq.mq_index, mq.mq_status 
											FROM queue_messages AS mq 
											WHERE mq.mq_status IN('N') 
											ORDER BY mq.mq_time_start");

	if (isset($result1->num_rows)) {
	
// Process the outstanding commands for each message
		$cqCommand="'queue','direct'";
		while(	$row1 = $result1->fetch_object()) { 
			if ($row1->mq_status=='N') $m_data = $dataObj->doNextAction($row1->mq_index, $cqCommand);	
			$reply = $dataObj->doMessageCompletion($row1->mq_index);
		}
	}

// - Proccessing callbacks part -----------------------------------------------------------------------------------------

	$dataObj->doCallback();

// Clean up old completed commands

	$mysqli->query("	DELETE FROM `queue_commands` 
							WHERE cq_time < (now() - interval 24 hour) 
							AND `cq_status`='C' ");
	$mysqli->query("	DELETE FROM `queue_messages` 
							WHERE mq_time_start < (now() - interval 24 hour) 
							AND `mq_status`='C' ");

// Report the status of completed tasks

?>