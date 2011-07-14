<?PHP
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  25th May,2011
	#	Test version  
/*========================================================================================*/

//___Debug_________________________________________________________________________________________//

//	ini_set(display_errors,On);
	$error='';

//___DB CONNECTION_________________________________________________________________________________//

$dbLogin = array ('dbhost' => "localhost", 'dbname' => "admin-api", 'dbusername' => "podcastapi", 'dbuserpass' => "CZJ5SWw2TBWueBmp");

//___TIME ZONE_________________________________________________________________________________//

date_default_timezone_set("Europe/London");

//___API_NAME_________________________________________________________________________________//

$apiName= "admin-api";
	
//____SCP SOURCE/DESTINATIONS_________________________________________________________________//

$source = array(
  	'admin' => '/data/web/podcast-admin-dev.open.ac.uk/www/app/webroot/upload/files/'
	);
  
$destination = array(
  	'media' => 'media-transfer-dev@media-podcast-api-dev.open.ac.uk:/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/'
	);

$source1 = array( 
  	'admin' => array (
  		'user'=> 'admin-transfer-dev', 
		'server'=> 'podcast-api-dev.open.ac.uk', 
		'path'=> '/data/web/podcast-api-dev.open.ac.uk/file-transfer/source/', 
		'privatekey'=>'', 'publickey'=>'') ,
  	'media' => array (
		'user'=> 'media-transfer-dev', 
		'server'=> 'media-podcast-api-dev.open.ac.uk', 
		'path'=> '/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/source/', 
		'privatekey'=>'', 
		'publickey'=>'') ,
  	'encoder' => array (
		'user'=>'', 
		'server'=>'', 
		'path'=> '/Volumes/Data/Episode/EpisodeEngine/Outputs/', 
		'privatekey'=>'', 
		'publickey'=>'')
  );
  
$destination1 = array(
  	'admin' => array (
		'user'=> 'admin-transfer-dev', 
		'server'=> 'podcast-api-dev.open.ac.uk', 
		'path'=> '/data/web/podcast-api-dev.open.ac.uk/file-transfer/destination/', 
		'privatekey'=>'', 
		'publickey'=>'') ,
  	'media' => array (
		'user'=> 'media-transfer-dev', 
		'server'=> 'media-podcast-api-dev.open.ac.uk', 
		'path'=> '/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/', 
		'privatekey'=>'', 
		'publickey'=>'') ,
  	'encoder' => array (
		'user'=>'', 
		'server'=>'', 
		'path'=> '/Volumes/Data/Episode/EpisodeEngine/Inputs/', 
		'privatekey'=>'', 
		'publickey'=>'')
  );

?>