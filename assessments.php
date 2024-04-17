<?php
session_start();

if (!isset($_SESSION['uid']) || $_SESSION['uid'] == '') {
    // Redirect if user is not logged in
    header("Location: index.php");
    exit;
}

include('libs/config.php');
include('libs/User.class.php');

$user = new User();
$details = $user->getDetails($_SESSION['uid']);

$db = getDB();

// Fetch all assessments from the database
$result = $db->query("SELECT * FROM assessments");

// Check for errors
if (!$result) {
    die('Error: ' . $db->errorInfo()[2]);
}

// Fetch all assessments as an associative array
$assessments = $result->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Assessments</title>
    <link rel="stylesheet" type="text/css" href="libs/style.css">
</head>
<body>
<div id="container">
    <h1>Assessments</h1>
    <h3>Welcome <a href="userprofile.php?uid=<?= $_SESSION['uid'] ?>"><?= $details->first_name . ' ' . $details->last_name ?></a></h3>
        <button id="logout-button" onclick="location.href='logout.php'">Logout</button>
    </div>
    <div id="toolbar">
        <button onclick="location.href='home.php'" class="button">Home</button>
        <button onclick="location.href='browse_courses.php'" class="button">Browse Courses</button>
        <button onclick="location.href='enroll_courses.php'" class="button">Enroll in Courses</button>
        <button onclick="location.href='assessments.php'" class="button">Assessments</button>
        <button onclick="location.href='blog.php'" class="button">Blogs</button>
        <button onclick="location.href='track_progress.php'" class="button">Dashboard</button>
    	<button onclick="location.href='search.php'" class="button">Search</button>
        <button onclick="location.href='about_us.php'">About Us</button>
        <button onclick="location.href='contact.php'" class="button">Contact Us</button>
        
    </div>

    <p></p>
    <h2>Available Assessments:</h2>
    <p></p>

    <main>
        <ul>
            <?php foreach ($assessments as $assessment): ?>
                <li><a href="assessment.php?id=<?= $assessment['id'] ?>"><?= $assessment['title'] ?></a></li>
            <?php endforeach; ?>
        </ul>
    </main>
</div>
</body>
</html>

