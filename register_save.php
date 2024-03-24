<!DOCTYPE html>
<html>
<head>
    <title>Registration Page</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
	<h1>Registration Page</h1>
<h2>Here are your registration details<h2>
<?php

include "libs/User.class.php";
include('libs/config.php');

$user = new User();

session_start();

$errorMsgReg = '';

echo "<pre>";
echo $_SESSION["email"] . "\n";
echo $_SESSION["first_name"] . "\n";
echo $_SESSION["last_name"] . "\n";
#echo $_SESSION["password"] . "\n";
#echo $_SESSION["secret"] . "\n";
echo "</pre>";

echo "<a href='login.php'>Sign in</a>";

$user -> register($_SESSION["first_name"], $_SESSION["last_name"], $_SESSION["email"], $_SESSION["password"], $_SESSION["secret"])

?>

    </div>
</body>
</html>
