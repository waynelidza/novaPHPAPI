<?php 
	define("HOSTNAME", "localhost");
	define("USERNAME", "root");
	define("PASSWORD", "");
	define("DATABASE", "novaz");

	$dbhandle = new mysqli(HOSTNAME,USERNAME,PASSWORD,DATABASE) or die("Unable to connect to the DB");

?>