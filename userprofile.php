<?php
session_start();

// Include configuration and User class
include('libs/config.php');
include('libs/User.class.php');

// Redirect if user is not logged in
if (!isset($_SESSION['uid']) || empty($_SESSION['uid'])) {
    header("Location: index.php");
    exit;
}

// Fetch user details
$user = new User();
$details = $user->getDetails($_SESSION['uid']);

// Fetch user profile information
$pdo = getDB();
$stmt = $pdo->prepare("SELECT * FROM userprofile WHERE uid = :uid");
$stmt->bindParam(":uid", $_SESSION['uid']);
$stmt->execute();
$userprofile = $stmt->fetch(PDO::FETCH_ASSOC);

// Handle form submission for updating profile
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['update_profile'])) {
    // Validate and sanitize input fields
    $address = htmlspecialchars($_POST['address']);
    $phone = htmlspecialchars($_POST['phone']);
    $dob = htmlspecialchars($_POST['dob']);

    // Update user profile information
    $updateStmt = $pdo->prepare("UPDATE userprofile SET address = :address, phone = :phone, date_of_birth = :dob WHERE uid = :uid");
    $updateStmt->bindParam(":address", $address);
    $updateStmt->bindParam(":phone", $phone);
    $updateStmt->bindParam(":dob", $dob);
    $updateStmt->bindParam(":uid", $_SESSION['uid']);

    if ($updateStmt->execute()) {
        header("Location: userprofile.php?update=success");
        exit;
    } else {
        header("Location: userprofile.php?update=error");
        exit;
    }
}

// Handle form submission for updating password
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['update_password'])) {
    // Validate and sanitize input fields
    $currentPassword = htmlspecialchars($_POST['current_password']);
    $newPassword = htmlspecialchars($_POST['new_password']);
    $confirmPassword = htmlspecialchars($_POST['confirm_password']);

    // Verify current password
    if ($user->verifyPassword($_SESSION['uid'], $currentPassword)) {
        // Check if new password and confirm password match
        if ($newPassword === $confirmPassword) {
            // Update password
            $hashedPassword = password_hash($newPassword, PASSWORD_DEFAULT);
            $updatePasswordStmt = $pdo->prepare("UPDATE users SET password = :password WHERE uid = :uid");
            $updatePasswordStmt->bindParam(":password", $hashedPassword);
            $updatePasswordStmt->bindParam(":uid", $_SESSION['uid']);

            if ($updatePasswordStmt->execute()) {
                header("Location: userprofile.php?update_password=success");
                exit;
            } else {
                header("Location: userprofile.php?update_password=error");
                exit;
            }
        } else {
            header("Location: userprofile.php?update_password=mismatch");
            exit;
        }
    } else {
        header("Location: userprofile.php?update_password=incorrect");
        exit;
    }
}

?>

<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <link rel="stylesheet" type="text/css" href="libs/style.css" charset="utf-8"/>
</head>
<body>
<div id="container">
    <h1>User Profile</h1>
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
    </div>

  <p></p>

   <p>Email: <?= $details->email ?></p>

    <h3>User Profile Information</h3>
    <?php
    // Display success or error message if provided via URL parameters
    if (isset($_GET['update'])) {
        if ($_GET['update'] == 'success') {
            echo "<p style='color: green;'>Profile updated successfully.</p>";
        } elseif ($_GET['update'] == 'error') {
            echo "<p style='color: red;'>Failed to update profile. Please try again.</p>";
        }
    }
    ?>

    <form id="updateProfileForm" method="post">
        <label for="address">Address*:</label><br>
        <input type="text" id="address" name="address" value="<?= $userprofile['address'] ?>" required><br>

        <label for="phone">Phone*:</label><br>
        <input type="text" id="phone" name="phone" value="<?= $userprofile['phone'] ?>" required><br>

        <label for="dob">Date of Birth*:</label><br>
        <input type="date" id="dob" name="dob" value="<?= $userprofile['date_of_birth'] ?>" required><br><br>

        <input type="submit" name="update_profile" value="Update Profile">
    </form>

    <h3>Update Password</h3>
    <?php
    // Display success or error message if provided via URL parameters
    if (isset($_GET['update_password'])) {
        if ($_GET['update_password'] == 'success') {
            echo "<p style='color: green;'>Password updated successfully.</p>";
        } elseif ($_GET['update_password'] == 'error') {
            echo "<p style='color: red;'>Failed to update password. Please try again.</p>";
        } elseif ($_GET['update_password'] == 'mismatch') {
            echo "<p style='color: red;'>New password and confirm password do not match.</p>";
        } elseif ($_GET['update_password'] == 'incorrect') {
            echo "<p style='color: red;'>Current password is incorrect.</p>";
        }
    }
    ?>

    <form id="updatePasswordForm" method="post">
        <label for="current_password">Current Password*:</label><br>
        <input type="password" id="current_password" name="current_password" required><br>

        <label for="new_password">New Password*:</label><br>
        <input type="password" id="new_password" name="new_password" required><br>

        <label for="confirm_password">Confirm Password*:</label><br>
        <input type="password" id="confirm_password" name="confirm_password" required><br><br>

        <input type="submit" name="update_password" value="Update Password">
    </form>

</div>
</body>
</html>

