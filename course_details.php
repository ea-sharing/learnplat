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

    // Fetch course name from the database
    $stmt = $pdo->prepare("SELECT course_name FROM courses WHERE course_id = :course_id");
    $stmt->bindParam(":course_id", $course_id);
    $stmt->execute();
    $course_data = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($course_data) {
        $course_name = $course_data['course_name'];
    } else {
        // Handle if course not found
        echo "Course not found";
        exit;
    }

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

// Paginate course content by sentences
$per_page = 7; // Number of sentences per page

// Split the content into sentences
$sentences = preg_split('/(?<=[.?!])\s+(?=[a-z])/i', $course_content);
$total_sentences = count($sentences);
$page = isset($_GET['page']) ? $_GET['page'] : 1;
$start = ($page - 1) * $per_page;
$end = min($start + $per_page, $total_sentences);

$course_page_content = implode(' ', array_slice($sentences, $start, $end - $start));

// Update completed_courses table to mark the course as completed if it's the last page
if ($page * $per_page >= $total_sentences) {
    // mark course as completed and trigger certificate generation
    $stmt = $pdo->prepare("INSERT INTO completed_courses (uid, course_id, completed) VALUES (:uid, :course_id, 1) ON DUPLICATE KEY UPDATE completed = 1");
    $stmt->bindParam(":uid", $_SESSION['uid']);
    $stmt->bindParam(":course_id", $course_id);
    $stmt->execute();

    // Trigger PDF generation and S3 upload
    require_once 'gen_cert.php'; // Include the certificate generation script
    $pdfFilePath = generateCertificate($_SESSION['uid'], $details->first_name, $course_name); // Generate certificate PDF
    $courseN = preg_replace('/\s+/', '', $course_name);
    $keyName = 'certificates/' . $details->first_name . '_' . $_SESSION['uid'] . '_' . $courseN . '_certificate.pdf'; // Define S3 key name
    $downloadLink = uploadToS3($pdfFilePath, $keyName); // Upload PDF to S3 and get the download link

    // Store download link in the database
    if ($downloadLink) {
        $stmt = $pdo->prepare("INSERT INTO certificates (user_id, download_link, course_id) VALUES (:userId, :downloadLink, :course_id)");
        $stmt->bindParam(":userId", $_SESSION['uid']);
        $stmt->bindParam(":downloadLink", $downloadLink);
        $stmt->bindParam(":course_id", $course_id);
        $stmt->execute();
    }
    // Display results in a popup
    echo "<script>
        window.onload = function() {
            var modal = document.getElementById('resultModal');
            modal.style.display = 'block';

            // Close the modal when the user clicks outside of it
            window.onclick = function(event) {
                if (event.target === modal) {
                    modal.style.display = 'none';
                }
            };
        };
    </script>";
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Course Details</title>
    <link rel="stylesheet" type="text/css" href="libs/style.css" charset="utf-8"/>
</head>
<body>
<div id="container">
    <h1>Course Details</h1>
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
	
    <h2><?= $course_name ?> Course Content</h2>
    <p><?= $course_page_content ?></p>
	

    <?php if ($page > 1): ?>
        <a href="course_details.php?course_id=<?= $course_id ?>&page=<?= ($page - 1) ?>">Previous Page</a>
    <?php endif; ?>

    <?php if ($end < $total_sentences): ?>
        <a href="course_details.php?course_id=<?= $course_id ?>&page=<?= ($page + 1) ?>">Next Page</a>
    <?php endif; ?>
</div>

<!-- Modal for displaying course completion -->
<div id="resultModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="document.getElementById('resultModal').style.display = 'none';">&times;</span>
        <h2>Course Completed!</h2>
        <p>Congratulations! You have completed the course. You can visit <a href="track_progress.php">dashboard</a> for details.</p>
        <p>Download your certificate:</p>
        <a href="<?= $downloadLink ?>" download>Download Certificate</a>
    </div>
</div>

</body>
</html>
