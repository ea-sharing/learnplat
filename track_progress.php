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

// Fetch completed courses for the current user
$stmt = $pdo->prepare("SELECT courses.course_id, courses.course_name FROM courses JOIN completed_courses ON courses.course_id = completed_courses.course_id WHERE completed_courses.uid = :uid AND completed_courses.completed = 1");
$stmt->bindParam(":uid", $_SESSION['uid']);
$stmt->execute();
$completed_courses = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html>
<head>
    <title>Track Progress</title>
    <link rel="stylesheet" type="text/css" href="style.css" charset="utf-8"/>
</head>
<body>
<div id="container">
    <h1>Track Progress</h1>
    <h3>Welcome <a href="userprofile.php?uid=<?= $_SESSION['uid'] ?>"><?= $details->first_name . ' ' . $details->last_name ?></a></h3>
    <div id="buttons">
        <button onclick="location.href='home.php'" class="button">Home</button>
        <button onclick="location.href='browse_courses.php'" class="button">Browse Courses</button>
        <button onclick="location.href='enroll_courses.php'" class="button">Enroll in Courses</button>
        <button onclick="location.href='track_progress.php'" class="button">Track Progress</button>
        <button onclick="location.href='search.php'" class="button">Search</button>
        <button onclick="location.href='logout.php'" class="button">Logout</button>
    </div>

    <h2>Completed Courses:</h2>
    <?php if (empty($completed_courses)): ?>
        <p>No courses completed yet.</p>
    <?php else: ?>
        <ul>
            <?php foreach ($completed_courses as $course): ?>
                <li><?= $course['course_name'] ?></li>
            <?php endforeach; ?>
        </ul>
    <?php endif; ?>
</div>
</body>
</html>

