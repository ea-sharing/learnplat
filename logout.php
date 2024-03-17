<?php
session_start();

session_destroy();
?>

<!DOCTYPE html>
<html>
  <head>
    <title>Session Termination</title>
    <link rel="stylesheet" type="text/css" href="style.css" charset="utf-8" />
  </head>
  <body>
    <div id="container">
    <h1>Session has been successfully terminated</h1>

    <h3>Your session has been terminated and you are now signed out of the system.</h3>
  
    <a href="login.php">Sign back into the application</a>
    </div>
  </body>
</html>
