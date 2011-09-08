<?PHP
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  24th May,2011
	#	Test version  
	#	Admin-api input controller to accept post requests from the admin server
\*=========================================================================================*/
require_once("./lib/config.php");
require_once("./lib/classes/action-admin.class.php");
require_once("./lib/classes/output.class.php");

// Initialise objects etc.
	$r_data= '';
	$mysqli = new mysqli($dbLogin['dbhost'], $dbLogin['dbusername'], $dbLogin['dbuserpass'], $dbLogin['dbname']);
	$outObj = new Default_Model_Output_Class($mysqli);
	$dataObj = new Default_Model_Action_Class($mysqli,$outObj);	
	
// Grab the posted input stream and decode
	$dataStream = file_get_contents("php://input");
	$dataMess=explode('=',urldecode($dataStream));

	if (isset($dataMess[1])) {

// Decode the message
		$data=json_decode($dataMess[1],true);
	
// Check we know this command/action
		$result = $mysqli->query("
			SELECT  dc_field1, dc_field2, dc_field3, dc_field4, dc_field5, dc_field6
			FROM command_routes AS cr, api_datacheck AS dc 
			WHERE dc.dc_index=cr.cr_datacheck AND cr.cr_action = '".$data['command']."'");
		$row = $result->fetch_array();
		if ($result->num_rows) {
//  && count($data['data'])>1	
		if (is_array($data['data'])) {
// Put command message on message queue and data for each request on the command queue

			$m_data = $dataObj->queueAction($data['data'],$data['number'],$data['command'],$data['timestamp'],$row);
	
// Do anything now which needs to be done directly	
			$cqCommand="'direct'";
			if ( isset($m_data['mqIndex']) )
				$r_data = $dataObj->doNextAction($m_data['mqIndex'], $cqCommand);
		} else {
			$m_data = array('status'=>'NACK', 'data'=>'Empty data array of commands! - '.$apiName.'-'.$version, 'timestamp'=>time());
		}
	}else{
		$m_data = array('status'=>'NACK', 'data'=>'Command not known! - '.$apiName.'-'.$version, 'timestamp'=>time());
	}

}else{
	$m_data = array('status'=>'NACK', 'data'=>'No request values set! - '.$apiName.'-'.$version, 'timestamp'=>time());
}
	
// Log the command and response
	if (isset($data)) {
		$result = $mysqli->query(" INSERT INTO `api_log` (`al_message`, `al_reply`, `al_result_data`, `al_debug`,`al_timestamp`) 
			VALUES ( '".json_encode($data)."', '".json_encode($m_data)."', '', '', '".date("Y-m-d H:i:s", time())."' )");
	}
// print_r ($m_data);

// Get rid of any debug and output the result to the caller
	ob_clean();
	file_put_contents("php://output", json_encode($m_data));

?>