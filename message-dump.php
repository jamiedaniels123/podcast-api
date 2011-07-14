<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>

<?PHP
require_once("./lib/config.php");
	$mysqli = new mysqli($dbLogin['dbhost'], $dbLogin['dbusername'], $dbLogin['dbuserpass'], $dbLogin['dbname']);

	$sqlQuery1 = "SELECT * FROM api_log WHERE al_index='".$_REQUEST['n']."' ";
// echo $sqlQuery1;
	$result1 = $mysqli->query($sqlQuery1);
	$row1 = $result1->fetch_object();


print_r(json_decode($row1->al_message,true));



?>
</body>
</html>