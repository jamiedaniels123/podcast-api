<?PHP
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  25th May,2011
	#	Test version  
/*========================================================================================*/

//___Debug_________________________________________________________________________________________//

	ini_set(display_errors,On);

//___DB CONNECTION_________________________________________________________________________________//

$dbLogin = array ('dbhost' => "localhost", 'dbname' => "admin-api", 'dbusername' => "podcastapi", 'dbuserpass' => "CZJ5SWw2TBWueBmp");


//___TIME ZONE_________________________________________________________________________________//

date_default_timezone_set("Europe/London");
		
		$vleApiUrl="http://podcast-api-dev.open.ac.uk/vle/";
		$adminVleUrl="http://podcast-admin-dev.open.ac.uk/vles/add/";
		$adminUrl="http://podcast-api-dev.open.ac.uk/admin.php";
//		$mediaUrl="http://localhost/api-admin/";
//		$mediaUrl="http://podcast-api-dev.open.ac.uk/";
		$mediaUrl="http://podcast-api-dev.open.ac.uk/index.php";

?>