<!DOCTYPE html>
<html>
<head>
    <title>Interactive Online Learning Platform - Register Account</title>
    <link rel="stylesheet" type="text/css" href="libs/style.css" charset="utf-8" />
    
</head>
<body>
<div id="container">
    <div id="login">
        <h3>Register your account</h3>
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
            <div class="have-account">Have an account? <a href="login.php">Login</a></div>
        </form>
    </div>
</div>
</body>
</html>

