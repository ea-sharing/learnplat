<?php

/* DATABASE CONFIGURATION */
define('DB_SERVER', 'localhost'); // Replace
define('DB_USERNAME', 'demo_app_admin'); 
define('DB_PASSWORD', 'secret_password'); // Replace
define('DB_DATABASE', 'demoappdb');

/* AWS S3 CONFIGURATION */
define('AWS_REGION', 'your-region'); // Replace 'yourregion' with your actual AWS region
define('AWS_VERSION', 'latest');
define('AWS_ACCESS_KEY', 'your-access-key'); // Replace 'youraccesskey' with your actual AWS access key
define('AWS_SECRET_KEY', 'your-secret-key'); // Replace 'yoursecretkey' with your actual AWS secret key
define('AWS_BUCKET', 'your-bucket'); // Replace 'yourbucket' with your actual AWS S3 bucket name


function getDB() 
{
  $dbhost = DB_SERVER;
  $dbuser = DB_USERNAME;
  $dbpass = DB_PASSWORD;
  $dbname = DB_DATABASE;
  try {
    $dbConnection = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);	
    $dbConnection -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	return $dbConnection;
  }
  catch (PDOException $e) {
    echo 'Connection failed: ' . $e->getMessage();
  }
}
?>
