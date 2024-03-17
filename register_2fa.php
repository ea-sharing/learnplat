<?php
include 'libs/config.php';
include 'libs/User.class.php';
include 'libs/GoogleAuthenticator.class.php';

session_start();

$user = new User();

if ($user -> exists(strtolower($_POST["email"]))) {
  // Cannot pursue, the email is already in the database.
  header("Location: register.php?msg=User%20already%20exists");
  exit;
}




$_SESSION["uid"] = '';
$_SESSION["email"] = $_POST["email"];
$_SESSION["first_name"] = $_POST["first_name"];
$_SESSION["last_name"] = $_POST["last_name"];
$_SESSION["password"] = $_POST["password"];

// Check if the registration is using an already registered email address.
$user = new User();


$ga = new GoogleAuthenticator();
$_SESSION["secret"] = $ga -> createSecret();

$qrCodeUrl = $ga->getQRCodeGoogleUrl($_SESSION["email"], $_SESSION["secret"], "Algonquin College Demo App");

?>
<!DOCTYPE html>
<html>
  <head>
    <title>2-Step Verification using Google Authenticator</title>
    <link rel="stylesheet" type="text/css" href="style.css" charset="utf-8" />
  </head>
  <body>
    <div id="container">
      <h1>Adding 2-Step Verification using Time-based One-time-password</h1>
      
      <div id="login">
        <h3>Flash QR Code with Authenticator App</h3>
        <div id="img">
         <img src='<?php echo $qrCodeUrl; ?>' />
        </div>
        <form method="post" action="register_save.php">
        <input type="submit" value="2FA Registration is complete">
      </form>
      </div>
      
    </div>
  </body>
</html>
