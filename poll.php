<?PHP
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  24th May,2011
	#	Test version  
	#	controller to process actions queued in the media_actions table and report status to the admin server
\*=========================================================================================*/

require_once("lib/config.php");
require_once("lib/classes/action-admin.class.php");
require_once("lib/classes/output.class.php");

// Initialise objects
	$mysqli = new mysqli($dbLogin['dbhost'], $dbLogin['dbusername'], $dbLogin['dbuserpass'], $dbLogin['dbname']);
	$outObj = new Default_Model_Output_Class($mysqli);
	$dataObj = new Default_Model_Action_Class($mysqli,$outObj);	

if (isset($_REQUEST['time']) && $_REQUEST['time']>=1) $time = $_REQUEST['time']; else $time=1;
if (isset($_REQUEST['number']) && $_REQUEST['number']>=1) $number = $_REQUEST['number']; else $number=1;

// Poll for any completed or failed commands on Media and Encoder queues

	for ( $i = 1; $i <= $number; $i++) {

		$dataObj->pollMedia();

		$dataObj->pollEncoder();

//		$dataObj->pollVLE();

// sleep for n seconds
flush();
//		echo $i." - ";
		sleep($time);
	}

?>
