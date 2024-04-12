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
// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Check if unenroll button is clicked
    if (isset($_POST['unenroll'])) {
        $course_id = $_POST['course_id'];
        $unenrolled = unenrollFromCourse($_SESSION['uid'], $course_id);

        if ($unenrolled) {
            $message = "Successfully unenrolled from the course.";
        } else {
            $error = "Failed to unenroll from the course. Please try again.";
        }
    } else {
        // Assuming your form has a select dropdown for courses
        $course_id = $_POST['course_id'];

        // Enroll the user in the selected course
        $enrolled = enrollInCourse($_SESSION['uid'], $course_id);

        if ($enrolled) {
            $message = "Successfully enrolled in the course.";
        } else {
            $error = "You are already enrolled in this course.";
        }
    }
}

function enrollInCourse($uid, $course_id) {
    try {
        $db = getDB();

        // Check if the user is already enrolled in the course
        $stmt = $db->prepare("SELECT * FROM enrolled_courses WHERE uid = :uid AND course_id = :course_id");
        $stmt->bindParam(":uid", $uid, PDO::PARAM_INT);
        $stmt->bindParam(":course_id", $course_id, PDO::PARAM_INT);
        $stmt->execute();
        $count = $stmt->rowCount();

        if ($count == 0) {
            // If not already enrolled, insert the enrollment record
            $stmt = $db->prepare("INSERT INTO enrolled_courses (uid, course_id) VALUES (:uid, :course_id)");
            $stmt->bindParam(":uid", $uid, PDO::PARAM_INT);
            $stmt->bindParam(":course_id", $course_id, PDO::PARAM_INT);
            $stmt->execute();
            return true;
        } else {
            // User is already enrolled
            return false;
        }
    } catch (PDOException $e) {
        // Handle database errors
        echo "Error: " . $e->getMessage();
        return false;
    }
}

function unenrollFromCourse($uid, $course_id) {
    try {
        $db = getDB();

        // Delete the enrollment record
        $stmt = $db->prepare("DELETE FROM enrolled_courses WHERE uid = :uid AND course_id = :course_id");
        $stmt->bindParam(":uid", $uid, PDO::PARAM_INT);
        $stmt->bindParam(":course_id", $course_id, PDO::PARAM_INT);
        $stmt->execute();
        $count = $stmt->rowCount();

        if ($count > 0) {
            return true;
        } else {
            return false;
        }
    } catch (PDOException $e) {
        // Handle database errors
        echo "Error: " . $e->getMessage();
        return false;
    }
}

function getCourses() {
    try {
        $db = getDB();
        $stmt = $db->prepare("SELECT c.*, uc.id AS user_course_id FROM courses c LEFT JOIN enrolled_courses uc ON c.course_id = uc.course_id AND uc.uid = :uid");
        $stmt->bindParam(":uid", $_SESSION['uid'], PDO::PARAM_INT);
        $stmt->execute();
        $courses = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $courses;
    } catch (PDOException $e) {
        // Handle database errors
        echo "Error: " . $e->getMessage();
        return false;
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Enroll in Courses</title>
    <link rel="stylesheet" type="text/css" href="libs/style.css" charset="utf-8"/>
    <style>
        .course-item {
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            overflow: hidden;
        }

        .course-name {
            font-size: 18px;
            margin-bottom: 5px;
        }

        .description {
            margin-bottom: 10px;
        }

        .enroll-button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            float: right;
        }

        .enroll-button:hover {
            background-color: #45a049;
        }

        .unenroll-button {
            background-color: #f44336;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            float: right;
        }

        .unenroll-button:hover {
            background-color: #d32f2f;
        }

        .message {
            margin-top: 10px;
            padding: 10px;
            border-radius: 5px;
        }

        .success {
            background-color: #4CAF50;
            color: white;
        }

        .error {
            background-color: #f44336;
            color: white;
        }
    </style>
</head>
<body>
<div id="container">
    <h1>Enroll in Courses</h1>
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
    <h2>Available Courses:</h2>
    <p></p>
    <?php if (isset($message)) { ?>
        <div class="message success"><?php echo $message; ?></div>
    <?php } ?>
    <?php if (isset($error)) { ?>
        <div class="message error"><?php echo $error; ?></div>
    <?php } ?>
    <p></p>
    <?php
    $courses = getCourses();
    foreach ($courses as $course):
        ?>
        <div class="course-item">
            <div class="course-info">
                <span class="course-name"><?php echo $course['course_name']; ?></span>
                <p class="description"><?php echo $course['description']; ?></p>
            </div>
            <?php if ($course['user_course_id']): ?>
                <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
                    <input type="hidden" name="course_id" value="<?php echo $course['course_id']; ?>">
                    <button type="submit" name="unenroll" class="unenroll-button">Unenroll</button>
                </form>
            <?php else: ?>
                <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
                    <input type="hidden" name="course_id" value="<?php echo $course['course_id']; ?>">
                    <button type="submit" class="enroll-button">Enroll</button>
                </form>
            <?php endif; ?>
        </div>
    <?php endforeach; ?>
</div>
</body>
</html>

