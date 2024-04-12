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

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_GET['id'])) {
    $id = $_GET['id'];
    $title = $_POST['title'];
    $content = $_POST['content'];

    $db = getDB();
    $stmt = $db->prepare("UPDATE posts SET title = :title, content = :content WHERE id = :id AND user_id = :user_id");
    $stmt->bindParam(':title', $title);
    $stmt->bindParam(':content', $content);
    $stmt->bindParam(':id', $id);
    $stmt->bindParam(':user_id', $_SESSION['uid']);
    $stmt->execute();

    header("Location: blog.php");
    exit;
}

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    $db = getDB();
    $stmt = $db->prepare("SELECT * FROM posts WHERE id = :id AND user_id = :user_id");
    $stmt->bindParam(':id', $id);
    $stmt->bindParam(':user_id', $_SESSION['uid']);
    $stmt->execute();
    $blog = $stmt->fetch(PDO::FETCH_ASSOC);
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Blog</title>
    <link rel="stylesheet" type="text/css" href="libs/style.css">
    <link rel="stylesheet" type="text/css" href="libs/cont-style.css" charset="utf-8"/>
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
        <button onclick="location.href='assessments.php'" class="button">Assessments</button>
        <button onclick="location.href='blog.php'" class="button">Blogs</button>
        <button onclick="location.href='track_progress.php'" class="button">Dashboard</button>
        <button onclick="location.href='search.php'" class="button">Search</button>
        <button onclick="location.href='contact.php'" class="button">Contact Us</button>

    </div>

    <p></p>

    <p></p>


    <div id="content">
        <h1>Edit Blog</h1>
        <form method="post">
            <label for="title">Title:</label><br>
            <input type="text" class="input-field"  id="title" name="title" value="<?= htmlspecialchars($blog['title']) ?>" required><br>
            <label for="content">Content:</label><br>
            <textarea id="content" class="tinput-field" name="content" required><?= htmlspecialchars($blog['content']) ?></textarea><br><br>
            <input type="submit" value="Submit" class="btn-submit">
        </form>
    </div>
</div>
</body>
</html>

