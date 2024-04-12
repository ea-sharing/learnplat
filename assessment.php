<?php
session_start();

if (!isset($_SESSION['uid']) || $_SESSION['uid'] == '') {
    // Redirect if user is not logged in
    header("Location: index.php");
    exit;
}

if (!isset($_GET['id'])) {
    // Redirect if assessment ID is not provided
    header("Location: assessments.php");
    exit;
}

$assessment_id = $_GET['id'];

include('libs/config.php');
include('libs/User.class.php');

$user = new User();
$details = $user->getDetails($_SESSION['uid']);

$db = getDB();

// Fetch the assessment details
$stmt = $db->prepare("SELECT * FROM assessments WHERE id = :id");
$stmt->bindParam(':id', $assessment_id);
$stmt->execute();
$assessment = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$assessment) {
    // Redirect if assessment not found
    header("Location: assessments.php");
    exit;
}

// Fetch questions for the assessment
$stmt = $db->prepare("SELECT * FROM questions WHERE assessment_id = :assessment_id");
$stmt->bindParam(':assessment_id', $assessment_id);
$stmt->execute();
$questions = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Initialize variables for assessment result calculation
$total_questions = count($questions);
$correct_answers = 0;

// Check if the form has been submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Loop through each question and check the selected answer
    foreach ($questions as $question) {
        $selected_option = $_POST['answer'][$question['id']];
        $stmt = $db->prepare("SELECT is_correct FROM options WHERE id = :option_id");
        $stmt->bindParam(':option_id', $selected_option);
        $stmt->execute();
        $option = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($option['is_correct'] == 1) {
            $correct_answers++;
        }
    }

    // Calculate the percentage score
    $percentage = ($correct_answers / $total_questions) * 100;

    // Determine if the user passed or failed the assessment
    $result = ($percentage >= 70) ? 'Pass' : 'Fail';

    // Check if the user's result is greater than 70%
    if ($percentage >= 70) {
        // Check if the user has already attempted the assessment
        $stmt = $db->prepare("SELECT * FROM assessment_results WHERE user_id = :user_id AND assessment_id = :assessment_id");
        $stmt->bindParam(':user_id', $_SESSION['uid']);
        $stmt->bindParam(':assessment_id', $assessment_id);
        $stmt->execute();
        $existing_result = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($existing_result) {
            // Update the existing assessment result in the database
            $stmt = $db->prepare("UPDATE assessment_results SET correct_answers = :correct_answers, total_questions = :total_questions, percentage = :percentage, result = :result WHERE user_id = :user_id AND assessment_id = :assessment_id");
        } else {
            // Insert the new assessment result into the database
            $stmt = $db->prepare("INSERT INTO assessment_results (user_id, assessment_id, correct_answers, total_questions, percentage, result) VALUES (:user_id, :assessment_id, :correct_answers, :total_questions, :percentage, :result)");
        }

        $stmt->bindParam(':user_id', $_SESSION['uid']);
        $stmt->bindParam(':assessment_id', $assessment_id);
        $stmt->bindParam(':correct_answers', $correct_answers);
        $stmt->bindParam(':total_questions', $total_questions);
        $stmt->bindParam(':percentage', $percentage);
        $stmt->bindParam(':result', $result);
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
    <title><?= $assessment['title'] ?></title>
    <link rel="stylesheet" type="text/css" href="libs/style.css">
    <style>
        /* Modal styles */
        .modal {
            display: none; /* Hidden by default */
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 600px;
            border-radius: 5px;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div id="container">
    <h1><?= $assessment['title'] ?></h1>
    <h3>Welcome <?= $details->first_name . ' ' . $details->last_name ?></h3>
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
    <p></p>
    <h2>Assessment Questions:</h2>
    <p></p>
    <form method="post">
        <?php foreach ($questions as $question): ?>
            <div class="question-container">
                <div class="question-text"><?= $question['question_text']; ?></div>
                <?php
                // Fetch options for the current question
                $stmt = $db->prepare("SELECT * FROM options WHERE question_id = :question_id");
                $stmt->bindParam(':question_id', $question['id']);
                $stmt->execute();
                $options = $stmt->fetchAll(PDO::FETCH_ASSOC);
                ?>
                <div class="option-container">
                    <?php foreach ($options as $option): ?>
                        <label class="option-label">
                            <input type="radio" name="answer[<?= $question['id']; ?>]" class="option-radio"
                                   value="<?= $option['id']; ?>">
                            <?= $option['option_text']; ?>
                        </label>
                    <?php endforeach; ?>
                </div>
            </div>
        <?php endforeach; ?>
        <button type="submit" class="submit-button">Submit</button>
    </form>

    <!-- Modal for displaying assessment result -->
    <div id="resultModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="document.getElementById('resultModal').style.display = 'none';">&times;</span>
            <h2>Assessment Result:</h2>
            <p>Total Questions: <?= $total_questions ?></p>
            <p>Correct Answers: <?= $correct_answers ?></p>
            <p>Percentage: <?= $percentage ?>%</p>
            <p>Result: <?= $result ?></p>
        </div>
    </div>

</div>

</body>
</html>

