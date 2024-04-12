<?php
session_start();

if (!isset($_SESSION['uid']) || $_SESSION['uid'] == '') {
    // Redirect if user is not logged in
    header("Location: index.php");
    exit;
}

// Include the database configuration file
include('libs/config.php');
include('libs/User.class.php');

$user = new User();

// Check if the connection to the database is successful
$pdo = getDB();
$details = $user->getDetails($_SESSION['uid']);
if (!$pdo) {
    // Handle the error, display an error message, or redirect the user
    echo "Failed to connect to the database.";
    exit;
}
 
// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get form data
    $userName = $_POST['userName'];
    // $userEmail = $_POST['userEmail'];
    $userEmail = $details->email;
    $subject = $_POST['subject'];
    $content = $_POST['content'];

    // Recipient email
    $to = "emil.ask78@gmail.com";

    // Sender email
    $from = $userEmail;

    // Email subject
    $emailSubject = $subject;

    // Email message
    $emailMessage = "Name: $userName\n";
    $emailMessage .= "Email: $userEmail\n";
    $emailMessage .= "Message: $content\n";

    // Send email
    if (mail($to, $emailSubject, $emailMessage, "From: $from")) {
        $message = "Your message has been sent successfully.";
        $type = "success";
    } else {
        $message = "Failed to send your message. Please try again later.";
        $type = "error";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Contact Us</title>
    <link rel="stylesheet" type="text/css" href="libs/style.css" charset="utf-8"/>
    <link rel="stylesheet" type="text/css" href="libs/cont-style.css" charset="utf-8"/>
</head>
<body>
<div id="container">
    <h1>Contact Us</h1>
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
    <div class="container">
        <div class="form-container">
            <form name="frmContact" id="" frmContact"" method="post" action="" enctype="multipart/form-data"
                  onsubmit="return validateContactForm()">
                <div class="input-row">
                    <label style="padding-top: 20px;">Name</label>
                    <span id="userName-info" class="info"></span><br/>
                    <input type="text" class="input-field" name="userName" id="userName"/>
                </div>
                <div class="input-row">
                    <label>Subject</label>
                    <span id="subject-info" class="info"></span><br/>
                    <input type="text" class="input-field" name="subject" id="subject"/>
                </div>
                <div class="input-row">
                    <label>Message</label>
                    <span id="userMessage-info" class="info"></span><br/>
                    <textarea name="content" id="content" class="input-field" cols="60" rows="6"></textarea>
                </div>
                <div>
                    <input type="submit" name="send" class="btn-submit" value="Send"/>
                    <div id="statusMessage">
                        <?php
                        if (!empty($message)) {
                            ?>
                            <p class='<?php echo $type; ?>Message'><?php echo $message; ?></p>
                            <?php
                        }
                        ?>
                    </div>
                </div>
            </form>
        </div>
        <div class="contact-info">
            <h2>Our Contact Information</h2>
            <p>
                We would love to hear from you! For any inquiries, feedback, or questions, please feel free to reach out to us using the contact details provided below:
            </p>
            <h3>Email</h3>
            <p>Email: info@learnplatform.com</p>
            <h3>Phone</h3>
            <p>Phone: +1 123-456-7890</p>
            <h3>Address</h3>
            <p>123 Main Street, Ottawa, Canada</p>
        </div>
    </div>


    <script src="https://code.jquery.com/jquery-2.1.1.min.js"
            type="text/javascript"></script>
    <script type="text/javascript">
        function validateContactForm() {
            var valid = true;

            $(".info").html("");
            $(".input-field").css('border', '#e0dfdf 1px solid');
            var userName = $("#userName").val();
            var userEmail = $("#userEmail").val();
            var subject = $("#subject").val();
            var content = $("#content").val();

            if (userName == "") {
                $("#userName-info").html("Required.");
                $("#userName").css('border', '#e66262 1px solid');
                valid = false;
            }

            if (subject == "") {
                $("#subject-info").html("Required.");
                $("#subject").css('border', '#e66262 1px solid');
                valid = false;
            }
            if (content == "") {
                $("#userMessage-info").html("Required.");
                $("#content").css('border', '#e66262 1px solid');
                valid = false;
            }
            return valid;
        }
    </script>
</body>
</html>

