

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

// Initialize the search query variable
$search_query = "";

// Check if the search form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sanitize and validate the search query
    $search_query = trim($_POST["search_query"]);

    // Perform a search query to find course content
    try {
        $stmt = $pdo->prepare("SELECT * FROM courses WHERE coursecontent LIKE :search_query");
        $stmt->bindValue(':search_query', '%' . $search_query . '%', PDO::PARAM_STR);
        $stmt->execute();
        $search_results = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        // Handle database errors
        echo "Error: " . $e->getMessage();
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Course Content Search</title>
    <link rel="stylesheet" type="text/css" href="libs/style.css" charset="utf-8"/>
</head>
<body>
<div id="container">
    <h1>Search for Course Content</h1>
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
    <!-- Search form -->
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
        <label for="search_query">Search for course content:</label>
        <input type="text" id="search_query" name="search_query" value="<?php echo $search_query; ?>">
        <button type="submit">Search</button>
    </form>

    <!-- Display search results -->
    <?php if (!empty($search_results)) : ?>
        <h2>Search Results:</h2>
        <ul>
            <?php foreach ($search_results as $course) : ?>
                <li>
                    <h3><?php echo $course['course_name']; ?></h3>
                    <p><?php echo $course['coursecontent']; ?></p>
                </li>
            <?php endforeach; ?>
        </ul>
    <?php endif; ?>
</div>
</body>
</html>

