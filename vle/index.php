<?PHP
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  24th May,2011
	#	Test version  
	#	itest controller to send and display responses to simulate admin end
\*=========================================================================================*/

require_once("../lib/config0.php");
//require_once("../lib/classes/output.class.php");

$debug="";

// $mysqli = new mysqli($dbLogin['dbhost'], $dbLogin['dbusername'], $dbLogin['dbuserpass'], $dbLogin['dbname']);

// $outObj = new Default_Model_Output_Class();

// Grab the posted input stream and decode
	$dataStream = file_get_contents("php://input");
	$dataMess=explode('=',urldecode($dataStream));

	if (isset($dataMess[1])) {

// Decode the message
		$data=json_decode($dataMess[1],true);
//$data['request']=$_REQUEST['return'];	
	if (isset($data['request'])) {
	
	// - Command calls to Admin VLE interface -------------------------------------------------------------------------------------------------------------
			
		if ($data['request'] == 'create-container-co') {
			$fdata[]= array('title'=>'The container title1', 'description'=>'The container description1', 'weburl'=>'http://www.mysite.com/mypage.html', 'count'=>'1');
			$fdata[]= array('title'=>'The container title2', 'description'=>'The container description2', 'weburl'=>'http://www.mysite.com/mypage.html', 'count'=>'2');
			$fdata[]= array('title'=>'The container title3', 'description'=>'The container description3', 'weburl'=>'http://www.mysite.com/mypage.html', 'count'=>'3');
			$number=3;
			$action='create-container';
			$toUrl=$adminVleUrl;
	
		}else if ($data['request'] == 'delete-container-co'){
			$fdata[]= array('title'=>'The container title for easy tracking', 'containerID'=>'Container ID required', 'count'=>'1');
			$number=1;
			$action='delete-container';
			$toUrl=$adminVleUrl;
	
		}else if ($data['request'] == 'clone-container-co'){
			$fdata[]= array('containerID'=>'12345678', 'title'=>'The new container title', 'count'=>'1');
			$number=1;
			$action='clone-container';
			$toUrl=$adminVleUrl;
	
		}else if ($data['request'] == 'submit-media-co'){
			$fdata[]= array('containerID'=>'12345678', 'source_path'=>'12345678_container_title/', 'destination_path'=>'12345678_container_title/', 'filename'=>'dd205-globalised-world.avi', 'workflow'=>'video', 'count'=>'1');
			$number=1;
			$action='submit-media';
			$toUrl=$adminVleUrl;
	
		}else if ($data['request'] == 'delete-media-co'){
			$fdata[]= array('containerID'=>'12345678', 'mediaID'=>'3456789', 'count'=>'1');
			$number=1;
			$action='delete-media';
			$toUrl=$adminVleUrl;
	
		}else if ($data['request'] == 'get-media-endpoint-url-co'){
			$fdata[]= array('containerID'=>'12345678', 'mediaID'=>'3456789', 'count'=>'1');
			$number=1;
			$action='get-media-endpoint-url';
			$toUrl=$adminVleUrl;
	
	
			  $TagData['title'][] = $mArr['metaData']['title'];
			  $TagData['genre'][] = $mArr['metaData']['genere'];
			  $TagData['artist'][] = $mArr['metaData']['author'];
			  $TagData['album'][] = $mArr['metaData']['course_code']." ".$mArr['metaData']['podcast_title'];
			  $TagData['year'][] = date('Y');
			  $TagData['ape']['comments'] = "Item from ".$mArr['metaData']['podcast_title'];
	
			
		}else if ($data['request'] == 'metadata-update-co'){
			$fdata[]= array(	'containerID'=>'12345678', 'mediaID'=>'3456789', 'filename'=>'firstfile.mp3', 'title'=>'The media title', 'podcast_title'=>'The podcast container title', 'comments'=>'Some comments here', 'courseCode'=>'Course code',  
									'expirationDate'=>'24/09/2011',  'releaseDate'=>'24/09/2010',  'revision'=>'1.01', 'count'=>'1');
			$fdata[]= array(	'containerID'=>'12345678', 'mediaID'=>'3456790', 'filename'=>'secondfile.mp3', 'title'=>'The media title', 'podcast_title'=>'The podcast container title', 'comments'=>'Some comments here', 'courseCode'=>'Course code',  
									'expirationDate'=>'24/09/2011',  'releaseDate'=>'24/09/2010',  'revision'=>'1.01', 'count'=>'1');
			$number=2;
			$action='metadata-update';
			$toUrl=$adminVleUrl;
	
	// - Command callbacks to VLE API interface -------------------------------------------------------------------------------------------------------------
			
		}else if ($data['request'] == 'create-container-cb') {
			$fdata[]= array('containerID'=>'12345678', 'status'=>'OK', 'error'=>'debug error message', 'count'=>'1');
			$number=1;
			$action='create-container';
			$toUrl=$vleApiUrl;
	
		}else if ($data['request'] == 'delete-container-cb'){
			$fdata[]= array('containerID'=>'12345678', 'status'=>'OK', 'error'=>'debug error message', 'count'=>'1');
			$number=1;
			$action='delete-container';
			$toUrl=$vleApiUrl;
	
		}else if ($data['request'] == 'clone-container-cb'){
			$fdata[]= array('containerID'=>'12345678', 'newContainerID'=>'12345679', 'status'=>'OK', 'error'=>'debug error message', 'count'=>'1');
			$number=1;
			$action='clone-container';
			$toUrl=$vleApiUrl;
	
		}else if ($data['request'] == 'submit-media-cb'){
			$fdata[]= array('containerID'=>'12345678',  'mediaID'=>'3456789', 'status'=>'OK', 'error'=>'debug error message', 'count'=>'1');
			$number=1;
			$action='submit-media';
			$toUrl=$vleApiUrl;
	
		}else if ($data['request'] == 'delete-media-cb'){
			$fdata[]= array('containerID'=>'12345678',  'mediaID'=>'3456789', 'status'=>'OK', 'error'=>'debug error message', 'count'=>'1');
			$number=1;
			$action='delete-media';
			$toUrl=$vleApiUrl;
	
		}else if ($data['request'] == 'get-media-endpoint-url-cb'){
			$fdata[]= array('containerID'=>'12345678',  'mediaID'=>'3456789', 'url'=>'http://podcast.open.ac.uk/thefilename.m4v', 'status'=>'OK', 'error'=>'debug error message', 'count'=>'1');
			$number=4;
			$action='get-media-endpoint-url';
			$toUrl=$vleApiUrl;
			
		}else{
			$fdata[]= array('containerID'=>'12345678',  'mediaID'=>'3456786', 'status'=>'OK', 'error'=>'debug error message', 'count'=>'1');
			$fdata[]= array('containerID'=>'12345678',  'mediaID'=>'3456787', 'status'=>'OK', 'error'=>'debug error message', 'count'=>'2');
			$fdata[]= array('containerID'=>'12345678',  'mediaID'=>'3456788', 'status'=>'OK', 'error'=>'debug error message', 'count'=>'3');
			$fdata[]= array('containerID'=>'12345678',  'mediaID'=>'3456789', 'status'=>'OK', 'error'=>'debug error message', 'count'=>'4');
			$number=4;
			$action='metadata-update';
			$toUrl=$vleApiUrl;
		}
	}
//		}
// echo $action.", ".$mediaUrl.", ".$fdata.", ".$number;
	if (isset($action)) {
		ob_clean();	
		$m_data=array(	'command'=>$action, 'number'=>$number, 'data'=>$fdata, 'timestamp'=>time());
		file_put_contents("php://output", json_encode($m_data));
	}
}

?>
