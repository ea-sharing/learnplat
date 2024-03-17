<?php

$error_message = "";
if (isset($_GET['msg']))
  $error_message = $_GET['msg'];

?>
<!DOCTYPE html>
<html>
  <head>
    <title>Register Account with Two-Factor Authentication</title>
    <link rel="stylesheet" type="text/css" href="style.css" charset="utf-8" />
  </head>
  <body>
    <div id="container">
      <h1>Register your account</h1>
      <div id="login">
        <h3>Registration</h3>
        <form method="post" action="register_2fa.php" name="signup">
        <label>First Name</label>
        <input type="text" name="first_name" autocomplete="off" />
        <label>Last Name</label>
        <input type="text" name="last_name" autocomplete="off" />

        <label>Email</label>
        <input type="text" name="email" autocomplete="off" />
        
        <label>Password</label>
        <input type="password" name="password" autocomplete="off"/>

        <div class="errorMsg"><?=$error_message?></div>
        <input type="submit" class="button" name="add2FA" value="Next Step">
        <div>Have an account? <a href="login.php">Login</a></div>
        </form>
      </div>
    </div>
  </body>
</html>
