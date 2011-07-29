<?PHP
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  24th May,2011
	#	Test version  
	#	Admin-api input controller to accept post requests from the admin server
\*=========================================================================================*/

require_once("./lib/config.php");
// require_once("./lib/classes/db.class.php");
require_once("./lib/classes/action-admin.class.php");
require_once("./lib/classes/output.class.php");

// Initialise objects etc.
	$r_data= '';
	$mysqli = new mysqli($dbLogin['dbhost'], $dbLogin['dbusername'], $dbLogin['dbuserpass'], $dbLogin['dbname']);
	$outObj = new Default_Model_Output_Class();
	$dataObj = new Default_Model_Action_Class($mysqli,$outObj,$apiName);	
	
// Grab the posted input stream and decode
	$dataStream = file_get_contents("php://input");
	$dataMess=explode('=',urldecode($dataStream));

	if (isset($dataMess[1])) {

// Decode the message
		$data=json_decode($dataMess[1],true);
	
// Check we know this command/action
		$result = $mysqli->query(" SELECT * 
											FROM command_routes AS cr 
											WHERE cr.cr_action = '".$data['command']."'");
		$row = $result->fetch_object();
		if ($result->num_rows) {
//  && count($data['data'])>1	
// Put command message on message queue and data for each request on the command queue

			$m_data = $dataObj->queueAction($data['data'],$data['number'],$data['command'],$data['timestamp']);
	
// Do anything now which needs to be done directly	
			$cqCommand="'direct'";
			$r_data = $dataObj->doNextAction($m_data['mqIndex'], $cqCommand);
	
		}else{
			$m_data = array('status'=>'NACK', 'data'=>'Command not known on admin-api or data payload supplied!', 'sqlQuery'=>$sqlQuery, 'timestamp'=>time());
		}
	
	}else{
		$m_data = array('status'=>'NACK', 'data'=>'No request values set!', 'timestamp'=>time());
	}
	
// Log the command and response
	if (isset($dataMess[1]) && strlen($dataMess[1])>10) {
		$result = $mysqli->query("	INSERT INTO `api_log` (`al_message`, `al_reply`, `al_source_ip`,`al_timestamp`) 
								VALUES ( '".$dataMess[1]."', '".serialize($m_data)."', '".serialize($r_data)."', '".date("Y-m-d H:i:s", time())."' )");
	}
// print_r ($m_data);

// Get rid of any debug and output the result to the caller
	ob_clean();
	file_put_contents("php://output", json_encode($m_data));
//	ob_end_clean();

?>