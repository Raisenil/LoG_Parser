<?php

	$HOST			= 'localhost';
	$DB_USERNAME 	= 'root';
	$DB_PASSWORD 	= '';
	$DB_NAME 		= 'log_parser';

	$filename 		= "../Purging_Script/access.log";


	function getConnection(){
		global $HOST;
		global $DB_USERNAME;
		global $DB_PASSWORD;
		global $DB_NAME;

		$conn = mysqli_connect($HOST, $DB_USERNAME, $DB_PASSWORD, $DB_NAME);
		return $conn;
	}
?>