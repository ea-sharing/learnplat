Title: Interactive Online Learning Platform

Project Description: The Interactive Online Learning Platform is a web-based application designed to provide users with access to a variety of courses, allowing them to learn at their own pace from anywhere with an internet connection. The platform offers features such as course browsing, enrollment, progress tracking, content search, user profile management, and more.

Project Contents:

1. Codebase: The project includes a set of PHP files organized into different functionalities. These files collectively implement the backend logic of the online learning platform, including user authentication, course management, search functionality, user profile management, and progress tracking.

2. Database Dump: The database dump file contains the SQL statements to create and populate the necessary tables in the MySQL database. These tables store information related to users, courses, enrollment status, completed courses, and user profiles.

Instructions for Running the Application:

1. Setting up the Database:
   - Ensure that MySQL is installed on your system.
   - Create a new database named `demoappdb`.
   - Import the database dump file provided (`demoappdb_dump.sql`) to create the necessary tables and populate them with sample data.

2. Configuring the Application:
   - Update the `libs/config.php` file with your AWS / MySQL database credentials.

3. Running the Application:
   - Place all PHP files in the root directory of your web server (e.g., Apache or Nginx).
   - Access the application through your web browser by navigating to the appropriate URL (e.g., `http://localhost or published http://publicip`).

4. User Instructions:
   - Users can register for an account on the platform by providing their personal details.
   - After registration, users can log in using their email and password.
   - Upon logging in, users can browse available courses, enroll in courses, track their progress, search for course content, and manage their user profile.

File Descriptions:

1. browse_courses.php: PHP file responsible for displaying a list of available courses for users to browse and enroll in.

2. check_login.php: PHP file handling the authentication process when users attempt to log in to the platform.

3. course_details.php: PHP file displaying detailed information about a specific course, including its description and content.

4. demoappdb_backup.sql: SQL dump file containing backup data for the `demoappdb` database.

5. demoappdb.sql: SQL dump file containing the schema and initial data for the `demoappdb` database.

6. enroll_courses.php: PHP file handling the enrollment process when users select and enroll in courses.

7. home.php: PHP file serving as the homepage of the platform, providing an overview of featured courses or recent updates.

8. index.php: Main entry point for the application, directing users to the appropriate page based on their login status.

9. libs/: Directory containing PHP library files for configuration, user authentication, and user management.

    - config.php: Configuration file containing database credentials and other settings for the application.
    - GoogleAuthenticator.class.php: PHP class implementing Two-Factor Authentication (2FA) using Google Authenticator.
    - User.class.php: PHP class handling user-related functionalities such as registration, login, and profile management.

10. login.php: PHP file containing the login form for users to enter their credentials.

11. logout.php: PHP file handling the logout process, destroying the user's session and redirecting them to the login page.

12. register_2fa.php: PHP file guiding users through the process of setting up Two-Factor Authentication (2FA) during registration.

13. register.php: PHP file containing the registration form for users to create a new account.

14. register_save.php: PHP file processing the registration form data and saving the user's information to the database.

15. search.php: PHP file handling search functionality, allowing users to search for courses based on keywords.

16. style.css: CSS file containing styles for formatting and styling the HTML elements of the web pages.

17. track_progress.php: PHP file displaying a user's progress in enrolled courses, including completed modules or assessments.

18. userprofile.php: PHP file displaying and allowing users to manage their profile information, such as address, phone number, and date of birth.

These additional files complement the project's functionality and contribute to the overall user experience and system management.

Conclusion:

The Interactive Online Learning Platform project aims to provide a seamless and engaging learning experience for users. With its intuitive user interface, comprehensive course offerings, and robust backend functionality, the platform empowers learners to acquire new skills and knowledge conveniently. This README file serves as a guide for setting up and running the application, enabling users and developers to utilize the platform effectively.
