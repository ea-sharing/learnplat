<?php

session_start();

if (! isset($_SESSION['uid']) || $_SESSION['uid'] == '') {
  //header("Location: index.php");
  echo $_SESSION['uid'];
  exit;
}


include('libs/config.php');
include('libs/User.class.php');

$user = new User();
$details = $user -> getDetails($_SESSION['uid']);


?>
<!DOCTYPE html>
<html>
  <head>
    <title>User Home Page</title>
    <link rel="stylesheet" type="text/css" href="style.css" charset="utf-8" />
  </head>
  <body>
	<div id="container">
    <h1>Welcome <?=$details -> first_name . ' ' . $details -> last_name?></h1>
    <h4><a href="logout.php">Logout</a></h4>
    </div>
  </body>
</html>
