<?php
session_start();

if (!isset($_SESSION['uid']) || $_SESSION['uid'] == '') {
    // Redirect if user is not logged in
    header("Location: index.php");
    exit;
}

// Include the database configuration file
include('libs/config.php');

// Include the User class
include('libs/User.class.php');

// Create a new instance of the User class
$user = new User();

// Get user details
$details = $user->getDetails($_SESSION['uid']);

?>







<!DOCTYPE html>
<html>
<head>
    <title>About Us</title>
    <link rel="stylesheet" type="text/css" href="style.css">
<style>
        /* Additional styles specific to the about_us page */
        .about-us {
            text-align: center;
        }

        .about-us h1 {
            font-size: 32px;
            margin-bottom: 20px;
        }

        .about-us .info {
            text-align: left;
        }

        .about-us p {
            font-size: 20px;
            line-height: 1.5;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div id="container">
    <h1>About Us</h1>
    <!-- Include information about your team, mission, etc. -->

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
    <div class="container about-us">
        <div class="info">
                <p>Welcome to our online platform! Established in February 2024 by a team of three dedicated developers, our mission is to provide access to cutting-edge technology, cater to seasoned professionals, and empower individuals at any stage of their tech journey.</p>

                <p>We recognize the importance of staying up-to-date with the rapidly evolving tech industry. Therefore, our primary goal is to ensure that our platform offers the latest and most relevant materials and resources. With a focus on flexibility, learners can access our content at their convenience, enabling them to learn at their own pace and on their own schedule.</p>

                <p>At our core, we believe that knowledge is power. By offering comprehensive and current content, we aim to equip our users with the skills and expertise needed to thrive in today's competitive tech landscape.</p>
            </div>
        </div>
</div>
</body>
</html>
