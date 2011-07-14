<?php
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  26th May,2011
	#	Test version  
	#  Class File to handle output CURL response.
\*=========================================================================================*/

class Default_Model_Output_Class
 {
	
	/**  * Constructor  */
	function Default_Model_Output_Class(){}


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

	function message_send($command, $mediaUrl, $data, $number){
		
		global $mysqli, $error;
		
		$postData=array(	'command'=>$command, 'number'=>$number, 'data'=>$data, 'timestamp'=>time());
//		print_r($postData);
//		echo $mediaUrl;
		$messData=json_encode($postData);
		$postData=array('mess'=>json_encode($postData));
		$response=$this->rest_helper($mediaUrl, $postData, 'POST', 'json');

		if ((isset($command) && $command!='poll-media' && $command!='poll-encoder') || (isset($response['status']) && $response['status'] =='NACK')) {
			$sqlLogging = "INSERT INTO `api_log` (`al_message`, `al_reply`, `al_dest`, `al_timestamp`) VALUES ( '".$messData."', '".serialize($response)."', '".$mediaUrl."', '".date("Y-m-d H:i:s", time())."' )";
			$result = $mysqli->query($sqlLogging);
		}
		
		return $response;
	} 

	
	function message_send_next_command($command, $mediaUrl, $cqIndex, $mqIndex, $step, $mArr, $mNum){
		
		global $mysqli, $error;
		
		$postData=array(	'command'=>$command, 'number'=>$mNum, 'data'=>$mArr, 'cqIndex'=>$cqIndex,  'mqIndex'=>$mqIndex, 'step'=>$step, 'timestamp'=>time());
//		print_r($postData);
		$messData=json_encode($postData);
		$postData=array('mess'=>json_encode($postData));
		$response=$this->rest_helper($mediaUrl, $postData, 'POST', 'json');

		if ((isset($command) && $command!='') || (isset($response['status']) && $response['status'] !='')) {
			$sqlLogging = "INSERT INTO `api_log` (`al_message`, `al_reply`, `al_dest`, `al_timestamp`) VALUES ( '".$messData."', '".serialize($response)."', '".$mediaUrl."', '".date("Y-m-d H:i:s", time())."' )";
			$result = $mysqli->query($sqlLogging);
		}

		return $response;
	} 
	
	function rest_helper($url, $params = null, $verb = 'GET', $format = 'json'){

		$cparams = array('http' => array( 'method' => $verb, 'ignore_errors' => true));
		if ($params !== null) {
			$params = http_build_query($params);
			if ($verb == 'POST') {
			  $cparams['http']['content'] = $params;
			  $cparams['http']['header'] = 'Content-Type: application/x-www-form-urlencoded\r\n';
			} else {
			  $url .= '?' . $params;
			}
		}

		$context = stream_context_create($cparams);
		$timeout = 5;
		$old = ini_set('default_socket_timeout', $timeout);

		$fp = fopen($url, 'rb', false, $context);

		ini_set('default_socket_timeout', $old);
		stream_set_timeout($fp, $timeout);
		stream_set_blocking($fp, 0);

		if (!$fp) {
			$res = false;
		} else {
			// If you're trying to troubleshoot problems, try uncommenting the
			// next two lines; it will show you the HTTP response headers across
			// all the redirects:
//			 $meta = stream_get_meta_data($fp);
//			 var_dump($meta['wrapper_data']);
			$res = stream_get_contents($fp);
		}
		
		if ($res === false) {
//			throw new Exception("$verb $url failed: $php_errormsg");
		  	$r['status']='NACK';
		  	$r['error']='message timeout or response fail';
			return $r;
		}
		
		switch ($format) {
		case 'json':
//		$r=$res;
 		  $r = json_decode($res,true);

		  if ($r === null) {
			  $r['status']='NACK';
//			throw new Exception("failed to decode $res as json");
		  }
		  return $r;
		
		case 'xml':
		  $r = simplexml_load_string($res);
		  if ($r === null) {
			throw new Exception("failed to decode $res as xml");
		  }
		  return $r;
		}
		return $res;
	}

}


?>