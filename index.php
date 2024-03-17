<?php 

if(!empty($_SESSION['uid'])) {
  // User is already logged in.
  header("Location: home.php");
}

?>
<!DOCTYPE html>
<html>
  <head>
    <title>Algonquin Online College</title>
    <link rel="stylesheet" type="text/css" href="style.css" charset="utf-8" />
  </head>
  <body>
    <div id="container">
      <h1>2FA Protected Website</h1>
      
      <div id="signup">
        <h3><a href='register.php'>Register an account</a></h3>
      </div>

      <div id="login">
        <h3><a href='login.php'>Already registered? Sign in</a></h3>
      </div>
    </div>
  </body>
</html>
