<!DOCTYPE html>
<html>
<head>
    <title>Interactive Online Learning Platform - Register Account</title>
    <link rel="stylesheet" type="text/css" href="libs/style.css" charset="utf-8" />
    <style>
        /* Additional CSS for styling */
        body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
            color: #333333;
            margin: 0;
            padding: 0;
        }

        #container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        #login {
            width: 400px;
            border: 2px solid #365D98;
            padding: 20px;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        #login h3 {
            margin: 0;
            font-size: 24px;
            color: #365D98;
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333333;
            text-align: left;
        }

        input[type="text"],
        input[type="password"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #BDC7D8;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .errorMsg {
            color: #cc0000;
            margin-bottom: 10px;
            text-align: center;
        }

        .button {
            background-color: #5fcf80 !important;
            border-color: #3ac162 !important;
            font-weight: bold;
            padding: 12px 15px;
            width: 100%;
            color: #ffffff;
            border-radius: 5px;
            cursor: pointer;
            display: block;
            margin: 0 auto;
        }

        .button:hover {
            background-color: #3ac162 !important;
        }

        a {
            color: #365D98;
            text-decoration: none;
        }

        a:hover {
            color: #3ac162;
        }

        .have-account {
            text-align: center;
            margin-top: 10px;
        }
    </style>
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

