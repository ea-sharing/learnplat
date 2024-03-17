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
$pdo = getDB();

// Check if course_id is provided in the URL
if (isset($_GET['course_id'])) {
    $course_id = $_GET['course_id'];

    // Check if the user is already enrolled in the course
    $stmt = $pdo->prepare("SELECT id FROM enrolled_courses WHERE uid = :uid AND course_id = :course_id");
    $stmt->bindParam(":uid", $_SESSION['uid']);
    $stmt->bindParam(":course_id", $course_id);
    $stmt->execute();
    $enrollment = $stmt->fetch(PDO::FETCH_ASSOC);

    // If the user is not enrolled, enroll them in the course
    if (!$enrollment) {
        $stmt = $pdo->prepare("INSERT INTO enrolled_courses (uid, course_id) VALUES (:uid, :course_id)");
        $stmt->bindParam(":uid", $_SESSION['uid']);
        $stmt->bindParam(":course_id", $course_id);
        $stmt->execute();
    }

    // Update completed_courses table to mark the course as completed
    $stmt = $pdo->prepare("INSERT INTO completed_courses (uid, course_id, completed) VALUES (:uid, :course_id, 1) ON DUPLICATE KEY UPDATE completed = 1");
    $stmt->bindParam(":uid", $_SESSION['uid']);
    $stmt->bindParam(":course_id", $course_id);
    $stmt->execute();

    // Fetch course content from the database
    $stmt = $pdo->prepare("SELECT coursecontent FROM courses WHERE course_id = :course_id");
    $stmt->bindParam(":course_id", $course_id);
    $stmt->execute();
    $course_content = $stmt->fetchColumn();
} else {
    // Redirect if course_id is not provided
    header("Location: browse_courses.php");
    exit;
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Course Details</title>
    <link rel="stylesheet" type="text/css" href="style.css" charset="utf-8"/>
</head>
<body>
<div id="container">
    <h1>Course Details</h1>
    <h3>Welcome <a href="userprofile.php?uid=<?= $_SESSION['uid'] ?>"><?= $details->first_name . ' ' . $details->last_name ?></a></h3>
    <div id="buttons">
        <button onclick="location.href='home.php'" class="button">Home</button>
        <button onclick="location.href='browse_courses.php'" class="button">Browse Courses</button>
        <button onclick="location.href='enroll_courses.php'" class="button">Enroll in Courses</button>
        <button onclick="location.href='track_progress.php'" class="button">Track Progress</button>
        <button onclick="location.href='search.php'" class="button">Search</button>
        <button onclick="location.href='logout.php'" class="button">Logout</button>
    </div>

    <h2>Course Content</h2>
    <p><?= $course_content ?></p>
</div>
</body>
</html>

