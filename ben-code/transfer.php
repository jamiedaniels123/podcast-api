<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Transfer Example</title>
	</head>
	<body>

  <?php 
  $source = array(
  	'admin' => '/data/web/podcast-api-dev.open.ac.uk/file-transfer/source/'
  );
  
  $destination = array(
  	'media' => 'media-transfer-dev@media-podcast-api-dev.open.ac.uk:/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/',
  );
  
  // Notes: 1. It is intended that podcast-api (aka podcast-admin) can only transfer files via SCP to media-podcast
  //           and any files intended for the encoder cluster should be 'pulled' by the encoder cluster.
  //        2. the scp transfer is done using 'webmgr' so keys must be generated for webmgr and shared to the relevant
  //           user account on media-podcast-api
  //        3. FILENAMES AND PATHS MUST NOT HAVE SPACES IN THEM
  //        4. Use of only scp in this function means it is not possible to create remote directories, these must already exist
  //
  //        5. Strongly suggest files before transfering have permissions set to 0664 so that webmgr on other server has RW access
  //           via the 'group'.  The use of SETGID and Sticky bits on destination folder ensures that the group permission on target
  //           file is 'webmgr'.
  
  function transfer($src, $dest) {
  	  	
    $cmdline = "/usr/bin/scp -p ".escapeshellcmd($src)." ".escapeshellcmd($dest)." 2>&1";
  	echo "<p>Transfer cmd line =".$cmdline."</p>\n";  // debug
  	
  	//error_log("Transfer cmd line =".$cmdline);  // debug
  
  	exec($cmdline, $out, $code);
  
  	return array($code, $out);
  }
    
  $worflowFolder="";
  $filename="dd205-globalised-world-rss2.xml";
  
  $transfer = transfer($source['admin'].$worflowFolder.$filename, $destination['media'].$worflowFolder.$filename);
  
  print_r($transfer);
  echo "<br>\n";
  
  if ($transfer[0] == 0) {
    echo "<p>Transfered file successful</p>\n";
  } else {
    echo "<p>Failed to transfered file</p>\n";
  }
  
  ?>

	</body>
</html>
