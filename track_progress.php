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

// Fetch completed courses count
$stmt = $db->prepare("SELECT COUNT(*) as completed_count FROM completed_courses WHERE uid = :uid AND completed = 1");
$stmt->bindParam(':uid', $_SESSION['uid']);
$stmt->execute();
$completed_count = $stmt->fetch(PDO::FETCH_ASSOC)['completed_count'];

// Fetch enrolled courses count
$stmt = $db->prepare("SELECT COUNT(*) as enrolled_count FROM enrolled_courses WHERE uid = :uid");
$stmt->bindParam(':uid', $_SESSION['uid']);
$stmt->execute();
$enrolled_count = $stmt->fetch(PDO::FETCH_ASSOC)['enrolled_count'];

// Fetch completed courses details
$stmt = $db->prepare("SELECT c.course_name, cer.download_link FROM completed_courses cc JOIN courses c ON cc.course_id = c.course_id LEFT JOIN certificates cer ON cc.uid = cer.user_id AND cc.course_id = cer.course_id WHERE cc.uid = :uid AND cc.completed = 1");
$stmt->bindParam(':uid', $_SESSION['uid']);
$stmt->execute();
$completed_courses = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Fetch passed assessments details
$stmt = $db->prepare("SELECT ar.percentage, a.title, COUNT(q.id) as question_count FROM assessment_results ar JOIN assessments a ON ar.assessment_id = a.id JOIN questions q ON a.id = q.assessment_id WHERE ar.user_id = :uid AND ar.result = 'Pass' GROUP BY ar.assessment_id, ar.percentage, a.title");
$stmt->bindParam(':uid', $_SESSION['uid']);
$stmt->execute();
$passed_assessments = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Fetch user's blogs
$stmt = $db->prepare("SELECT title FROM posts WHERE user_id = :uid");
$stmt->bindParam(':uid', $_SESSION['uid']);
$stmt->execute();
$blogs = $stmt->fetchAll(PDO::FETCH_ASSOC);
$blog_count = count($blogs);

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="libs/style.css" charset="utf-8"/>
</head>

<body>
<div id="container">
    <h1>Track Progress</h1>
    <div id="user-profile">
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

    <div class="course-list">
        <h2>Course Statistics</h2>
        <p>Completed Courses: <?php echo $completed_count; ?></p>
        <p>Enrolled Courses: <?php echo $enrolled_count; ?></p>
    </div>

    <div class="course-list">
        <h2>Completed Courses</h2>
        <?php if ($completed_courses): ?>
            <ul>
                <?php foreach ($completed_courses as $course): ?>
                    <li><?php echo $course['course_name']; ?> <a href="<?php echo $course['download_link']; ?>">Download Certificate</a></li>
                <?php endforeach; ?>
            </ul>
        <?php else: ?>
            <p>No completed courses yet.</p>
        <?php endif; ?>
    </div>

    <div class="course-list">
        <h2>Passed Assessments</h2>
        <?php if ($passed_assessments): ?>
            <ul>
                <?php foreach ($passed_assessments as $assessment): ?>
                    <li><?php echo $assessment['title']; ?> (<?php echo $assessment['question_count']; ?> Questions) - Score <?php echo $assessment['percentage']; ?>%</li>
                <?php endforeach; ?>
            </ul>
        <?php else: ?>
            <p>No passed assessments yet.</p>
        <?php endif; ?>
    </div>

    <div class="course-list">
        <h2>My Blogs</h2>
        <ul>
            <?php foreach ($blogs as $blog): ?>
               <li><a href="blog.php?id=<?php echo $blog['id']; ?>"><?= htmlspecialchars($blog['title']); ?></a></li>
            <?php endforeach; ?>
        </ul>
        <h2>Total Blogs: <?php echo $blog_count; ?></h2>
    </div>

</div>
</body>

</html>

