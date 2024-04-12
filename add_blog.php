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

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $title = $_POST['title'];
    $content = $_POST['content'];
    $date = date('Y-m-d H:i:s');
    $user_id = $_SESSION['uid'];

    $db = getDB();
    $stmt = $db->prepare("INSERT INTO posts (title, content, date, user_id) VALUES (:title, :content, :date, :user_id)");
    $stmt->bindParam(':title', $title);
    $stmt->bindParam(':content', $content);
    $stmt->bindParam(':date', $date);
    $stmt->bindParam(':user_id', $user_id);
    $stmt->execute();

    header("Location: blog.php");
    exit;
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Add Blog</title>
    <link rel="stylesheet" type="text/css" href="libs/style.css">
    <link rel="stylesheet" type="text/css" href="libs/cont-style.css">
</head>
<body>
<div id="container">
    <h1>Blogs</h1>
    <div class="theader">
        <h3>Welcome <a href="userprofile.php"><?= $details->first_name . ' ' . $details->last_name ?></a></h3>
        <a href="logout.php">Logout</a>
    </div>

    <div id="buttons">
        <button onclick="location.href='home.php'" class="button">Home</button>
        <button onclick="location.href='browse_courses.php'" class="button">Browse Courses</button>
        <button onclick="location.href='enroll_courses.php'" class="button">Enroll in Courses</button>
        <button onclick="location.href='track_progress.php'" class="button">Dashboard</button>
        <button onclick="location.href='blog.php'" class="button">Blogs</button>
        <button onclick="location.href='search.php'" class="button">Search</button>
	<button onclick="location.href='logout.php'" class="button">Logout</button>
        <button onclick="location.href='contact.php'" class="button">Contact Us</button>

    </div>

    <div id="content">
        <h1>Add Blog</h1>
        <h3>Welcome <?= $details->first_name . ' ' . $details->last_name ?></h3>
        <form method="post">
            <label for="title"  style="padding-top: 20px;">Title:</label><br>
            <input type="text"  class="input-field" id="title" name="title" required><br>
            <label for="content"  style="padding-top: 20px;">Content:</label><br>
            <textarea id="content" class="tinput-field"  class="btn-submit" name="content" required></textarea><br><br>
            <input type="submit" value="Submit">
        </form>
    </div>
</div>
</body>
</html>

