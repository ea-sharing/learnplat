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

// Select all blogs from the "blogs" table, ordered by the "date" column
$result = $db->query("SELECT * FROM blogs ORDER BY date DESC");

// Check for errors
if (!$result) {
    die('Error: ' . $db->errorInfo()[2]);
}

// Fetch all blogs as an associative array
$blogs = $result->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Learn Platform Blog</title>
<link rel="stylesheet" type="text/css" href="libs/style.css" charset="utf-8"/>
</head>
<body>
<div id="container">
    <h1>Blogs</h1>
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

    <p></p>
    <h2>Blog blogs</h2>
    <p></p>

<main> 
<?php if (empty($blogs)): ?>
    <p>There are no blogs.</p>
    <p><a href="add_blog.php">Click here to add a new blog.</a></p>
<?php else: ?>
    <?php foreach ($blogs as $blog): ?>
        <div class="blog-post">
            <h2><?= htmlspecialchars($blog['title']); ?></h2>
            <p><?= htmlspecialchars($blog['content']); ?></p>
            <p>Posted on <?= htmlspecialchars($blog['date']); ?></p>
            <?php if ($blog['user_id'] == $_SESSION['uid']): ?>
                <p>
                    <a href="edit_blog.php?id=<?= $blog['id'] ?>">Edit</a>
                    <a href="del_blog.php?id=<?= $blog['id'] ?>">Delete</a>
                </p>
            <?php endif; ?>
        </div>
    <?php endforeach; ?>
<?php endif; ?>
<p><a href="add_blog.php">Click here to add a new blog.</a></p>

</main>
</div>
</body>
</html>

