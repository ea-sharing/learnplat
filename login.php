<!DOCTYPE html>
<html>
<head>
    <title>Interactive Online Learning Program - Sign in</title>
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
            justify-content: space-between;
            align-items: flex-start;
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
        }

        #login,
        .platform-info {
            width: 45%;
            padding: 20px;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        #login {
            border: 2px solid #365D98;
            margin-bottom: 20px;
        }

        #login h3,
        .platform-info h2 {
            margin-top: 0;
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

        .no-account {
            margin-top: 10px;
            text-align: center;
        }

        .platform-info p {
            margin-bottom: 10px;
            line-height: 1.5;
            text-align: justify;
        }

        .platform-info ul {
            padding-left: 20px;
        }
    </style>
</head>
<body>
<div id="container">
    <div class="platform-info">
        <h2>About the Interactive Online Learning Platform</h2>
        <p>The Interactive Online Learning Platform is an innovative educational platform designed to offer high-quality learning resources and engaging learning experiences for users.</p>
        <p>Key features of the platform include:</p>
        <ul>
            <li>Intuitive and user-friendly interfaces</li>
            <li>Diverse library of courses and educational resources</li>
            <li>Interactive multimedia content</li>
            <li>Engaging exercises, quizzes, and assignments</li>
            <li>Personalized learning paths and recommendations</li>
            <li>Real-time communication tools</li>
            <li>Comprehensive progress tracking and performance analytics</li>
        </ul>
        <p>The platform aims to revolutionize online learning by providing dynamic and interactive learning experiences tailored to each user's needs and preferences.</p>
    </div>

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

            <div class="no-account">No account? <a href="register.php">Register</a></div>
        </form>
    </div>
</div>
</body>
</html>
