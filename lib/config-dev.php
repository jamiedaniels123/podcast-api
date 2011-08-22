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

	$dbLogin = array ('dbhost' => "localhost", 'dbname' => "admin-api-dev", 'dbusername' => "podcastapi", 'dbuserpass' => "CZJ5SWw2TBWueBmp");

//___TIME ZONE_________________________________________________________________________________//

	date_default_timezone_set("Europe/London");

//___API_NAME_________________________________________________________________________________//

	$apiName = "admin-api";
	$version = "dev";

//____SCP/FILE/API - SOURCE/DESTINATIONS_________________________________________________________________//

	$source = array( 
		'admin-files' => '/data/web/podcast-admin-dev.open.ac.uk/www/app/webroot/upload/files/', // Set the Admin file source if needed
		'vle-files' => '/data/web/podcast-api-dev.open.ac.uk/www/vle/upload/files/', // Set the VLE file source if needed for testing
		'vle-app' => 'http://podcast-api-dev.open.ac.uk/vle/', // Set for testing only this is the VLE URL (api) which we poll for commands
		'admin-app' => 'http://podcast-admin-dev.open.ac.uk/', // This is for completeness so we know where messages come from
	  	'media-scp' => 'media-transfer-dev@media-podcast-api-dev.open.ac.uk:/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/source/',
  		'encoder-scp' => '/Volumes/Data/Episode/EpisodeEngine/Outputs/'
	);
  
	$destination = array( 
		'media-scp' => 'media-transfer-dev@media-podcast-api-dev.open.ac.uk:/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/', 
  		'encoder-scp' => '/Volumes/Data/Episode/EpisodeEngine/Inputs/',
		'admin-api' => 'http://podcast-api-dev.open.ac.uk', 
		'media-api' => 'http://media-podcast-api-dev.open.ac.uk', 
		'encoder-api' => 'http://kmi-encoder-api-dev.open.ac.uk', 
		'admin-vle' => 'http://podcast-admin-dev.open.ac.uk/vles/add/', 
		'admin-app' => 'http://podcast-admin-dev.open.ac.uk/callbacks/add/' 
	);

?>