<?php
session_start();

if (!isset($_SESSION['uid']) || $_SESSION['uid'] == '') {
    // Redirect if user is not logged in
    header("Location: index.php");
    exit;
}

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    include('libs/config.php');

    $db = getDB();
    $stmt = $db->prepare("DELETE FROM posts WHERE id = :id AND user_id = :user_id");
    $stmt->bindParam(':id', $id);
    $stmt->bindParam(':user_id', $_SESSION['uid']);
    $stmt->execute();

    header("Location: blog.php");
    exit;
}
?>

