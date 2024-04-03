<?php
session_start();

if (!isset($_SESSION['uid']) || $_SESSION['uid'] == '') {
    // Redirect if user is not logged in
    header("Location: index.php");
    exit;
}

if ($_SERVER['REQUEST_METHOD'] != 'POST') {
    // Redirect if the form is not submitted via POST method
    header("Location: assessments.php");
    exit;
}

if (!isset($_POST['answer'])) {
    // Redirect if answers are not provided
    header("Location: assessments.php");
    exit;
}

$user_id = $_SESSION['uid'];

include('libs/config.php');

$db = getDB();

// Loop through submitted answers
foreach ($_POST['answer'] as $question_id => $option_id) {
    // Check if the selected option is correct
    $stmt = $db->prepare("SELECT is_correct FROM options WHERE id = :option_id");
    $stmt->bindParam(':option_id', $option_id);
    $stmt->execute();
    $option = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$option) {
        continue; // Skip if option not found
    }

    $is_correct = $option['is_correct'];

    // Insert or update the user's answer in the completed_assessments table
    $stmt = $db->prepare("INSERT INTO completed_assessments (user_id, question_id, option_id, is_correct) 
                          VALUES (:user_id, :question_id, :option_id, :is_correct)
                          ON DUPLICATE KEY UPDATE option_id = :option_id, is_correct = :is_correct");
    $stmt->bindParam(':user_id', $user_id);
    $stmt->bindParam(':question_id', $question_id);
    $stmt->bindParam(':option_id', $option_id);
    $stmt->bindParam(':is_correct', $is_correct);
    $stmt->execute();
}

// Redirect back to assessments page after submission
header("Location: assessments.php");
exit;
?>

