<?PHP
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  24th May,2011
	#	Test version  
	#	controller to process actions queued in the media_actions table and report status to the admin server
\*=========================================================================================*/

require_once("./lib/config.php");
require_once("./lib/classes/action-admin.class.php");
require_once("./lib/classes/output.class.php");
require_once("./lib/pstools.inc.php");

ini_set(display_errors,On);

require_once("./cron.php");

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Admin post command</title>
<script type="application/x-javascript">
<!--
function submitform()
{
	document.getElementById('action').submit();
}
-->
</script>
</head>

<body>
<br /><?PHP  if (isset($debug)) print_r($debug);?><br /><br /> 
<br /><?PHP  if (isset($error)) print_r($error);?><br /><br /> 
<br /><?PHP // if (isset($reply2)) print_r($reply2);?><br /><br /> 
<br /><?PHP // if (isset($r_data)) print_r($r_data);?><br /><br /> 
<br /><?PHP // if (isset($m_data)) print_r($m_data);?><br /><br /> 
<br /><?PHP // if (isset($query)) print_r($query);?><br /><br /> 
 <form action="" method="post" enctype="application/x-www-form-urlencoded" name="action" id="action">
 
 <select name="action_select" onchange="javascript:submitform();">
 <option value="">Select action ...</option>
 <option value="execute">Execute items in admin queue</option>
 </select>
 
 </form>
 <?PHP // phpinfo(); ?>
</body>
</html>