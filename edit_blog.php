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
    $stmt = $db->prepare("UPDATE blogs SET title = :title, content = :content WHERE id = :id AND user_id = :user_id");
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
    $stmt = $db->prepare("SELECT * FROM blogs WHERE id = :id AND user_id = :user_id");
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
    <style>

        .container {
            display: flex;
        }

        .form-container {
            flex: 1;
        }

        .contact-info {
            flex: 1;
                }
        .form-container {
        #    background: #f1ecdf;
        #    border: #e2ddd2 1px solid;
            padding: 20px;
            border-radius: 2px;
        }

        .input-row {
            margin-bottom: 20px;
        }

        .input-row label {
            color: #75726c;
        }

        .input-field {
            width: 80%;
            border-radius: 2px;
            padding: 10px;
            border: #e0dfdf 1px solid;
            box-sizing: border-box;
            margin-top: 2px;
        }

        .tinput-field {
            width: 80%;
            height: 200px;
            border-radius: 2px;
            padding: 10px;
            border: #e0dfdf 1px solid;
            box-sizing: border-box;
            margin-top: 2px;
        }

        .span-field {
            font: Arial;
            font-size: small;
            text-decoration: none;
        }

        .btn-submit {
            width: 40%;
            padding: 10px 30px;
            background: #9e9a91;
            border: #8c8880 1px solid;
            color: #ffffff;
            font-size: 0.9em;
            border-radius: 2px;
            cursor: pointer;
        }

        .errorMessage {
            background-color: #e66262;
            border: #AA4502 1px solid;
            padding: 5px 10px;
            color: #FFFFFF;
            border-radius: 3px;
        }

        .successMessage {
            background-color: #9fd2a1;
            border: #91bf93 1px solid;
            padding: 5px 10px;
            color: #3d503d;
            border-radius: 3px;
            cursor: pointer;
            font-size: 0.9em;
        }

        .info {
            font-size: .8em;
            color: #e66262;
            letter-spacing: 2px;
            padding-left: 5px;
        }
    </style>
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
       <button onclick="location.href='about_us.php'"class="button">About Us</button>
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

