<?php
session_start();

if (!isset($_SESSION['uid']) || $_SESSION['uid'] == '') {
    // Redirect if user is not logged in
    header("Location: index.php");
    exit;
}

// Include the database configuration file
include('libs/config.php');

// Include the User class
include('libs/User.class.php');

// Create a new instance of the User class
$user = new User();

// Get user details
$details = $user->getDetails($_SESSION['uid']);

// Get the database connection using the getDB() function
$pdo = getDB();

// Check if the connection to the database is successful
if (!$pdo) {
    // Handle the error, display an error message, or redirect the user
    echo "Failed to connect to the database.";
    exit;
}

// Fetch fictitious courses from the database
try {
    $stmt = $pdo->query("SELECT * FROM courses");
    $courses = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

?>
<!DOCTYPE html>
<html>
<head>
    <title>User Home Page</title>
    <link rel="stylesheet" type="text/css" href="libs/style.css" charset="utf-8"/>
</head>
<body>
<div id="container">
    <h1>Interactive Online Learning Platform</h1>
    <div class="theader">
        <h3>Welcome <a href="userprofile.php"><?= $details->first_name . ' ' . $details->last_name ?></a></h3>
        <a href="logout.php">Logout</a>
    </div>
    <div id="buttons">
        <button onclick="location.href='home.php'" class="button">Home</button>
        <button onclick="location.href='browse_courses.php'" class="button">Browse Courses</button>
        <button onclick="location.href='enroll_courses.php'" class="button">Enroll in Courses</button>
        <button onclick="location.href='assessments.php'" class="button">Assessments</button>
        <button onclick="location.href='blog.php'" class="button">Blogs</button>
        <button onclick="location.href='track_progress.php'" class="button">Dashboard</button>
	<button onclick="location.href='search.php'" class="button">Search</button>
        <button onclick="location.href='contact.php'" class="button">Contact Us</button>

    </div>
    <!-- General Information about the Interactive Learning Platform -->
    <div id="platform-info">
        <h2>About the Interactive Online Learning Platform</h2>
        <p>
            The Interactive Online Learning Platform is a comprehensive e-learning solution designed to provide users with access to high-quality educational resources and interactive learning experiences. Our platform aims to increase accessibility to education, foster engagement through multimedia content, personalize the learning journey, and facilitate collaboration among learners and instructors.
        </p>

        <!-- Include the project objectives -->
        <h2>Project Objectives</h2>
        <ul>
            <li>Increase accessibility to education</li>
            <li>Curate a diverse collection of courses</li>
            <li>Enhance engagement with multimedia content</li>
            <li>Personalize the learning journey</li>
            <li>Foster collaboration and communication</li>
            <li>Implement formative and comprehensive assessment</li>
        </ul>

        <!-- Include the user deliverables -->
        <h2>User Deliverables</h2>
        <ul>
            <li>Intuitive and user-friendly interfaces</li>
            <li>Diverse library of courses and resources</li>
            <li>Interactive multimedia content</li>
            <li>Engaging exercises and quizzes</li>
            <li>Personalized learning paths</li>
            <li>Discussion forums and chat features</li>
            <li>Comprehensive progress tracking</li>
        </ul>

        <!-- Include the functionalities -->
        <h2>Functionalities</h2>
        <p>
            This innovative online learning platform offers a wide range of functionalities, including user-friendly registration, intuitive course discovery, content creation tools, interactive multimedia resources, personalized learning paths, real-time communication, comprehensive assessment, and robust data security.
        </p>

        <!-- Include the technologies/frameworks -->
        <h2>Technologies/Frameworks</h2>
        <p>
            In crafting the architecture for the Interactive Online Learning Platform, careful consideration has been given to selecting technologies and frameworks that align seamlessly with the project's goals. Technologies such as [list technologies/frameworks here] have been chosen to create an online learning environment that is user-friendly, engaging, and personalized.
        </p>
    </div>

</div>
</body>
</html>

