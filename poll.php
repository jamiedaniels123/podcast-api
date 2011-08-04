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

	$result0 = $mysqli->query("SELECT ad.ad_url FROM api_destinations AS ad WHERE ad.ad_name = 'media-api'");
	$row0 = $result0->fetch_object();
	$fdata0 = array('command'=>'poll_media');

	$result1 = $mysqli->query("SELECT ad.ad_url FROM api_destinations AS ad WHERE ad.ad_name = 'encoder-api'");
	$row1 = $result1->fetch_object();
	$fdata1 = array('command'=>'poll_encoder');

	$result2 = $mysqli->query("SELECT ad.ad_url, ad.ad_callback_url FROM api_destinations AS ad WHERE ad.ad_name = 'vle-api'");
	$row2 = $result2->fetch_object();
	$fdata2= array('command'=>'poll_vle');

	for ( $i = 1; $i <= $number; $i++) {

		$dataObj->pollMedia($row0, $fdata0);

		$dataObj->pollEncoder($row1, $fdata1);

//		$dataObj->pollVLE($row2, $fdata2);

// sleep for n seconds
flush();
//		echo $i." - ";
		sleep($time);
	}

?>
