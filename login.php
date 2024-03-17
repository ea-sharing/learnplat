<?php
$error_message = "";
if (isset($_GET['msg']))
  $error_message = $_GET['msg'];
?>
<!DOCTYPE html>
<html>
  <head>
    <title>Sign in with Two-Factor Authentication</title>
    <link rel="stylesheet" type="text/css" href="style.css" charset="utf-8" />
  </head>
  <body>
    <div id="container">
      <h1>Sign in to your account</h1>
      <div id="login">
        <h3>Sign in</h3>
        <form method="post" action="check_login.php" name="signup">
        <label>Email address</label>
        <input type="text" name="email" autocomplete="off" />
        <label>Password</label>
        <input type="password" name="password" autocomplete="off" />

        <label>TOTP Code in app</label>
        <input type="text" name="totp" autocomplete="off" />
        <div class="errorMsg"><?=$error_message?></div>
        <input type="submit" class="button" name="sign_in" value="Validate">

        <div>No account? <a href="register.php">Register</a></div>
        </form>
      </div>
    </div>
  </body>
</html>
