<?PHP
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  25th May,2011
	#	Admin-api config file
/*========================================================================================*/

//___Debug_________________________________________________________________________________________//

//	ini_set(display_errors,On);
	$error='';
	$debug='';

//___DB CONNECTION_________________________________________________________________________________//

	$dbLogin = array ('dbhost' => "localhost", 'dbname' => "admin-api", 'dbusername' => "podcastapi", 'dbuserpass' => "CZJ5SWw2TBWueBmp");

//___TIME ZONE_________________________________________________________________________________//

	date_default_timezone_set("Europe/London");

//___API_NAME_________________________________________________________________________________//

	$apiName= "admin-api";
	
//____SCP SOURCE/DESTINATIONS_________________________________________________________________//

	$source = array( 
		'admin' => '/data/web/podcast-admin-dev.open.ac.uk/www/app/webroot/upload/files/', 
		'vle' => '/data/web/podcast-admin-dev.open.ac.uk/www/app/webroot/upload/files/' 
	);
  
	$destination = array( 
		'media' => 'media-transfer-dev@media-podcast-api-dev.open.ac.uk:/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/' 
	);

?>