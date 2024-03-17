<!DOCTYPE html>
<html>
<head>
    <title>Interactive Online Learning Platform</title>
    <link rel="stylesheet" type="text/css" href="style.css" charset="utf-8"/>
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
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            text-align: center;
        }

        h1 {
            color: #365D98;
            font-size: 36px;
            margin-bottom: 30px;
        }

        #signup, #login {
            display: inline-block;
            width: 45%;
            border: 2px solid #365D98;
            padding: 20px;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        #signup h3, #login h3 {
            margin: 0;
            font-size: 24px;
            color: #365D98;
        }

        #signup a, #login a {
            color: #365D98;
            text-decoration: none;
            font-weight: bold;
        }

        #signup a:hover, #login a:hover {
            color: #3ac162;
        }

        .info {
            margin-top: 40px;
            text-align: left;
            padding: 20px;
            border: 2px solid #365D98;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        @media only screen and (max-width: 600px) {
            #signup, #login {
                width: 100%;
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body>
<div id="container">
    <h1>Interactive Online Learning Platform</h1>

    <div id="signup">
        <h3><a href='register.php'>Register an account</a></h3>
        <p>Join our platform and start your learning journey today!</p>
    </div>

    <div id="login">
        <h3><a href='login.php'>Already registered? Sign in</a></h3>
        <p>Access a wide range of courses and educational resources.</p>
    </div>

    <div class="info">
        <h2>About the Platform</h2>
        <p>The platform aims to create an accessible and engaging online learning experience by:</p>
        <ul>
            <li>Developing a user-friendly and intuitive platform</li>
            <li>Curating a diverse collection of courses and materials</li>
            <li>Enhancing engagement through multimedia content</li>
            <li>Personalizing learning paths with adaptive algorithms</li>
            <li>Fostering collaboration with discussion forums and chat</li>
            <li>Implementing assessment tools for feedback and improvement</li>
        </ul>

        <h2>User Deliverables</h2>
        <p>Users can expect:</p>
        <ul>
            <li>Intuitive interfaces and diverse content</li>
            <li>Interactive multimedia resources and engaging activities</li>
            <li>Personalized learning paths and recommendations</li>
            <li>Discussion forums and chat features</li>
            <li>Comprehensive progress tracking and analytics</li>
        </ul>

        <h2>Functionalities</h2>
        <p>The platform offers features such as:</p>
        <ul>
            <li>User-friendly registration and course discovery</li>
            <li>Interactive multimedia resources</li>
            <li>Real-time communication and comprehensive assessment</li>
            <li>Robust data security and content moderation</li>
        </ul>
    </div>
</div>
</body>
</html>

