<?php
session_start();

include "libs/config.php";
include 'libs/User.class.php';
require_once 'libs/GoogleAuthenticator.class.php';

$email = $_POST["email"];
$password = $_POST["password"];
$totp = $_POST["totp"];

$user = new User();

if ($user -> authenticate($email, $password)) {
  // Username and password checks out. Check the 2FA code.
  $ga = new GoogleAuthenticator();
  $current_code = $ga-> getCode($_SESSION["secret"]);

  if ($current_code == $totp) {
    // The 2FA checks out, the user is fully authenticated.
    header("Location: home.php");
    exit;
  }
  else {
    // The 2FA failed. Back to login with error message.
    $_SESSION["uid"] = "";
    header("Location: login.php?msg=TOTP%20Failed");
    exit;
  }
}
else {
  // The 2FA failed. Back to login with error message.
    $_SESSION["uid"] = "";
    header("Location: login.php?msg=Wrong%20Username%20or%20Password");
    exit;
}

?>
