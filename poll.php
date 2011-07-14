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
	$outObj = new Default_Model_Output_Class();
	$dataObj = new Default_Model_Action_Class($mysqli,$outObj,$apiName);	

if (isset($_REQUEST['time']) && $_REQUEST['time']>=1) $time = $_REQUEST['time']; else $time=1;
if (isset($_REQUEST['number']) && $_REQUEST['number']>=1) $number = $_REQUEST['number']; else $number=1;

// Poll for any completed or failed commands on Media and Encoder queues

	$sqlQuery0 = "SELECT ad.ad_url FROM api_destinations AS ad WHERE ad.ad_name = 'media-api'";
	$result0 = $mysqli->query($sqlQuery0);
	$row0 = $result0->fetch_object();
// echo $row->ad_url;
	$fdata0 = array('command'=>'poll_media');

	$sqlQuery1 = "SELECT ad.ad_url FROM api_destinations AS ad WHERE ad.ad_name = 'encoder-api'";
	$result1 = $mysqli->query($sqlQuery1);
	$row1 = $result1->fetch_object();
// echo $row->ad_url;
	$fdata1 = array('command'=>'poll_encoder');

	for ( $i = 1; $i <= $number; $i++) {
		$reply0=$outObj->message_send('poll-media', $row0->ad_url, $fdata0,1);
//		print_r($reply0['data']);
		if ($reply0['status']=='Y') {	
			foreach($reply0['data'] as $k0 => $v0){ 
				if ($v0['status']=='Y') {
					$sqlQuery2="SELECT aw.wf_steps, cq_wf_step  FROM queue_commands AS cq, command_routes AS cr, api_workflows AS aw WHERE cq.cq_command=cr.cr_action AND cr.cr_index=aw.wf_cr_index and aw.wf_step='".$v0['step']."' AND `cq_index`=  '".$v0['cqIndex']."' ";
// echo $sqlQuery2;
					$result2 = $mysqli->query($sqlQuery2);
					if ($result2->num_rows) {
						$row2=$result2->fetch_object();
						if ( $v0['step'] == $row2->wf_steps ) $status=$v0['status']; else $status='N';
						if ($v0['step'] == $row2->cq_wf_step && $v0['step'] != $row2->wf_steps ) $step= $v0['step']+1; else $step= $v0['step']; 
 
						$sqlQuery3="UPDATE `queue_commands` SET `cq_result`='".serialize($v0)."', `cq_status`='".$status."', `cq_wf_step`= '".$step."', `cq_update`='".date("Y-m-d H:i:s", time())."' WHERE `cq_index`=  '".$v0['cqIndex']."' ";
//	echo $sqlQuery3."<br>";
						$result3 = $mysqli->query($sqlQuery3);
						$mqToCheck0[$v0['mqIndex']]=$v0['mqIndex'];
					}
				}
			}
			if (isset($mqToCheck0)) {
// print_r($mqToCheck0);
				foreach($mqToCheck0 as $k10 => $v10) {
					$reply10 = $dataObj->doMessageCompletion($v10);
				}
			}
		}


		$reply1=$outObj->message_send('poll-encoder', $row1->ad_url, $fdata1,1);
//		print_r($reply1);
		if ($reply1['status']=='Y') {	
			foreach($reply1['data'] as $k1 => $v1){ 
				if ($v1['status']=='Y') {
					$sqlQuery4="SELECT aw.wf_steps, cq_wf_step  FROM queue_commands AS cq, command_routes AS cr, api_workflows AS aw WHERE cq.cq_command=cr.cr_action AND cr.cr_index=aw.wf_cr_index and aw.wf_step='".$v1['step']."' AND `cq_index`=  '".$v1['cqIndex']."' ";
					$result4 = $mysqli->query($sqlQuery4);
// echo $sqlQuery4;
					if ($result4->num_rows) {
						$row4=$result4->fetch_object();
						if ($v1['step'] == $row4->cq_wf_step ) $step= $v1['step']+1; else $step = $v1['step']; 
						if ( $v1['step'] == $row4->wf_steps ) {
							$status=$v1['status'];
							$step= $v1['step'];
						} else {
							$status='N'; 
						}
						$sqlQuery5="UPDATE `queue_commands` SET `cq_result`='".serialize($v1)."', `cq_status`='".$status."', `cq_wf_step`= '".$step."', `cq_update`='".date("Y-m-d H:i:s", time())."' WHERE `cq_index`=  '".$v1['cqIndex']."' ";
//	echo $sqlQuery5."<br>";
						$result5 = $mysqli->query($sqlQuery5);
						$mqToCheck1[$v1['mqIndex']]=$v1['mqIndex'];
					}
				}
			}
			if (isset($mqToCheck1)) {
				foreach($mqToCheck1 as $k11 => $v11) {
					$reply10 = $dataObj->doMessageCompletion($v11);
				}
			}
		}

// sleep for n seconds
flush();
//		echo $i." - ";
		sleep($_REQUEST['time']);
	}

?>
