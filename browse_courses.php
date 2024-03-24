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

// Fetch courses from the database
$stmt = $pdo->prepare("SELECT courses.course_id, courses.course_name, courses.description, enrolled_courses.id AS user_course_id FROM courses LEFT JOIN enrolled_courses ON courses.course_id = enrolled_courses.course_id AND enrolled_courses.uid = :uid");
$stmt->bindParam(":uid", $_SESSION['uid']);
$stmt->execute();
$courses = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html>
<head>
    <title>Browse Courses</title>
    <link rel="stylesheet" type="text/css" href="libs/style.css" charset="utf-8"/>
    <style>
        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            padding: 10px;
            margin-bottom: 10px;
            background-color: #f9f9f9;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease;
        }

        li:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        li a {
            color: #333;
            text-decoration: none;
            font-weight: bold;
        }

        li a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div id="container">
    <h1>Browse Courses</h1>
    <h3>Welcome <a href="userprofile.php?uid=<?= $_SESSION['uid'] ?>"><?= $details->first_name . ' ' . $details->last_name ?></a></h3>
    <div id="buttons">
        <button onclick="location.href='home.php'" class="button">Home</button>
        <button onclick="location.href='browse_courses.php'" class="button">Browse Courses</button>
        <button onclick="location.href='enroll_courses.php'" class="button">Enroll in Courses</button>
        <button onclick="location.href='track_progress.php'" class="button">Track Progress</button>
        <button onclick="location.href='search.php'" class="button">Search</button>
        <button onclick="location.href='logout.php'" class="button">Logout</button>
    </div>

    <h2>Available Courses:</h2>
    <ul>
        <?php foreach ($courses as $course): ?>
            <li>
                <?php if ($course['user_course_id']): ?>
                    <a href="course_details.php?course_id=<?= $course['course_id'] ?>">
                        <?= $course['course_name'] ?> - <?= $course['description'] ?>
                    </a>
                <?php else: ?>
                    <?= $course['course_name'] ?> - <?= $course['description'] ?>
                <?php endif; ?>
            </li>
        <?php endforeach; ?>
    </ul>
</div>
</body>
</html>

