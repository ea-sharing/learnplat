-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: demoappdb
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assessment_results`
--

DROP TABLE IF EXISTS `assessment_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessment_results` (
  `result_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `assessment_id` int NOT NULL,
  `correct_answers` int NOT NULL,
  `total_questions` int NOT NULL,
  `percentage` decimal(5,2) NOT NULL,
  `result` enum('Pass','Fail') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`result_id`),
  KEY `user_id` (`user_id`),
  KEY `assessment_id` (`assessment_id`),
  CONSTRAINT `assessment_results_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`uid`),
  CONSTRAINT `assessment_results_ibfk_2` FOREIGN KEY (`assessment_id`) REFERENCES `assessments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_results`
--

LOCK TABLES `assessment_results` WRITE;
/*!40000 ALTER TABLE `assessment_results` DISABLE KEYS */;
INSERT INTO `assessment_results` VALUES (12,14,2,9,10,90.00,'Pass','2024-04-19 02:42:13');
/*!40000 ALTER TABLE `assessment_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessments`
--

DROP TABLE IF EXISTS `assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessments`
--

LOCK TABLES `assessments` WRITE;
/*!40000 ALTER TABLE `assessments` DISABLE KEYS */;
INSERT INTO `assessments` VALUES (1,'DevOps Assessment'),(2,'Python Programming Assessment');
/*!40000 ALTER TABLE `assessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (6,'Containerd vs. Docker: Understanding Their Relationship and How They Work Together','During past decade, containers have revolutionized software development by introducing higher levels of consistency and scalability. Now, developers can work without the challenges of dependency management, environment consistency, and collaborative workflows.\r\n\r\nWhen developers explore containerization, they might learn about container internals, architecture, and how everything fits together. And, eventually, they may find themselves wondering about the differences between containerd and Docker and how they relate to one another.\r\n\r\nIn this blog post, we’ll explain what containerd is, how Docker and containerd work together, and how their combined strengths can improve developer experience.','2024-04-01 16:28:49',14),(7,'Evolution of Artificial Intelligence','Artificial Intelligence (AI) has come a long way since its inception, and in the year 2024, it continues to shape the world as we know it. What began as a concept in science fiction has now become an integral part of our daily lives. AI is no longer just a distant dream; it is a reality that has revolutionized industries across the board. We will explore the basics of AI, how it works, its impact on various industries, and the incredible opportunities it presents for the future.\r\nArtificial Intelligence and How it Works\r\n\r\nAt its core, Artificial Intelligence refers to the simulation of human intelligence in machines, enabling them to perform tasks that would typically require human cognitive abilities. AI systems are designed to learn from data, recognize patterns, and make decisions with minimal human intervention.\r\n\r\nThe two primary forms of AI are Narrow AI (Weak AI) and General AI (Strong AI). Narrow AI is designed to perform specific tasks, such as voice assistants like Siri or recommendation algorithms on streaming platforms like Netflix. On the other hand, General AI aims to possess human-like cognitive abilities and understanding, but it remains a theoretical concept and is yet to be fully realized.\r\n\r\nThe foundation of AI lies in Machine Learning (ML) and Deep Learning (DL). Machine Learning involves training algorithms on vast amounts of data to make predictions or decisions. Deep Learning, a subset of Machine Learning, uses artificial neural networks to process data and learn complex patterns.','2024-04-12 18:07:09',14),(8,'Azure: The Future of IoT Security','Internet of Things (IoT) has emerged as a game-changer, it has transformed industries, improved efficiency, and changed the way we interact with the world around us. However, as IoT devices become more prevalent in our lives, so do the security concerns associated with them. Azure, Microsoft’s cloud computing platform, is poised to be at the forefront of IoT security, shaping the future of this rapidly growing field.\r\nAzure’s Role in IoT Security\r\n\r\nMicrosoft Azure has positioned itself as a comprehensive platform for addressing these IoT security challenges, offering a range of tools and services to protect IoT ecosystems. Here’s how Azure is shaping the future of IoT security\r\n\r\n    Azure Sphere: To combat the issue of outdated firmware and software, Microsoft introduced Azure Sphere. It’s a comprehensive solution that includes a secured OS, a microcontroller unit (MCU), and cloud-based security services. Azure Sphere ensures that even low-power IoT devices remain protected with regular updates and security monitoring.\r\n    Azure Security Center: Azure Security Center extends its robust security features to IoT devices. It offers threat detection, security policy management, and continuous monitoring capabilities for IoT workloads. It helps organizations identify and respond to security threats in real-time, making it a crucial part of IoT security.\r\n    Azure Sphere Guardian: Azure Sphere Guardian is a new service that enables organizations to extend Azure Sphere’s security benefits to legacy and brownfield IoT devices. This allows businesses to secure their existing IoT investments without costly hardware upgrades.\r\n    Azure Key Vault: Protecting sensitive data is a priority in IoT security. Azure Key Vault provides a secure way to manage cryptographic keys and secrets used by IoT applications, ensuring that data remains confidential and protected.\r\n','2024-04-12 18:08:29',14);
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates`
--

DROP TABLE IF EXISTS `certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `download_link` varchar(255) DEFAULT NULL,
  `course_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `fk_certificates_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates`
--

LOCK TABLES `certificates` WRITE;
/*!40000 ALTER TABLE `certificates` DISABLE KEYS */;
INSERT INTO `certificates` VALUES (39,14,'https://learnplat2024s3.s3.amazonaws.com/certificates/Emil_14_WebDevelopment_certificate.pdf',1),(40,14,'https://learnplat2024s3.s3.amazonaws.com/certificates/Emil_14_DigitalMarketingEssentials_certificate.pdf',8),(41,14,'https://learnplat2024s3.s3.amazonaws.com/certificates/Emil_14_MobileAppDevelopment_certificate.pdf',3),(42,14,'https://learnplat2024s3.s3.amazonaws.com/certificates/Emil_14_DataScience_certificate.pdf',2),(43,14,'https://learnplat2024s3.s3.amazonaws.com/certificates/Emil_14_MobileAppDevelopment_certificate.pdf',3),(44,14,'https://learnplat2024s3.s3.amazonaws.com/certificates/Emil_14_DataScience_certificate.pdf',2);
/*!40000 ALTER TABLE `certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `completed_assessments`
--

DROP TABLE IF EXISTS `completed_assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `completed_assessments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `assessment_id` int NOT NULL,
  `question_id` int NOT NULL,
  `option_id` int NOT NULL,
  `is_correct` tinyint(1) DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_question` (`user_id`,`question_id`),
  KEY `assessment_id` (`assessment_id`),
  CONSTRAINT `completed_assessments_ibfk_1` FOREIGN KEY (`assessment_id`) REFERENCES `assessments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `completed_assessments`
--

LOCK TABLES `completed_assessments` WRITE;
/*!40000 ALTER TABLE `completed_assessments` DISABLE KEYS */;
/*!40000 ALTER TABLE `completed_assessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `completed_courses`
--

DROP TABLE IF EXISTS `completed_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `completed_courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `course_id` int NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_course_id` (`uid`,`course_id`),
  KEY `fk_ucp_course_id` (`course_id`),
  CONSTRAINT `fk_ucp_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ucp_uid` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `completed_courses`
--

LOCK TABLES `completed_courses` WRITE;
/*!40000 ALTER TABLE `completed_courses` DISABLE KEYS */;
INSERT INTO `completed_courses` VALUES (111,14,1,1),(112,14,8,1),(113,14,3,1),(114,14,2,1);
/*!40000 ALTER TABLE `completed_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(100) NOT NULL,
  `description` text,
  `coursecontent` text,
  `createddate` date DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Web Development','Learn HTML, CSS, and JavaScript to build modern websites.','Welcome to the world of web development! In the \'Web Development Fundamentals: HTML, CSS, and JavaScript Mastery\' course, you will embark on a journey to master the essential building blocks of modern web development. Whether you are a complete beginner or an aspiring web developer looking to enhance your skills, this course will equip you with the knowledge and practical experience needed to create stunning, responsive websites from scratch.<br> Throughout this comprehensive online learning experience, you will delve deep into the core concepts, techniques, and best practices for designing and developing dynamic web pages and interactive user interfaces. From structuring content with HTML to styling layouts with CSS and adding interactivity with JavaScript, each module will provide you with the tools and insights necessary to build professional-grade websites with confidence.<br><br> Module 1: Introduction to Web Development<br> In this module, you will delve into the foundational aspects of web development. you will learn about the core technologies that power the web, including HTML, CSS, and JavaScript, and understand their respective roles in creating modern websites. We will guide you through setting up your development environment, introduce you to essential tools and resources, and provide an overview of the web development landscape.<br><br>Module 2: HTML Essentials<br>This module focuses on HTML (Hypertext Markup Language), the standard markup language for creating web pages. you will learn the basics of HTML5, including its document structure and syntax. We will cover essential HTML elements for structuring content, such as headings, paragraphs, lists, and images. Additionally, you will explore semantic markup for improving accessibility and search engine optimization (SEO) of your web pages.<br><br>Module 3: Styling with CSS<br>CSS (Cascading Style Sheets) is the language used to style the presentation of HTML elements on a web page. In this module, you will dive into CSS3, the latest version of CSS, and learn how to apply styles to HTML elements using selectors, properties, and values. you will discover techniques for formatting text, controlling layout, and creating visually appealing designs. We will also introduce CSS frameworks and libraries for streamlining the styling process.<br><br>Module 4: Responsive Web Design<br>With the increasing variety of devices and screen sizes accessing the web, it is essential to design websites that adapt to different viewport sizes. This module covers the principles of responsive web design, including fluid layouts, media queries, and flexible images. you will learn how to create websites that look great and function seamlessly across desktops, tablets, and smartphones.<br><br>Module 5: Introduction to JavaScript<br>JavaScript is a powerful programming language that adds interactivity and dynamic behavior to web pages. In this module, you will get started with JavaScript syntax and grammar, including variables, data types, and control structures. you will learn how to write JavaScript code to manipulate the content and behavior of HTML elements on a web page, paving the way for more advanced JavaScript concepts.<br><br>Module 6: DOM Manipulation with JavaScript<br>The Document Object Model (DOM) is a programming interface that represents the structure of HTML documents as a tree of objects. This module explores how JavaScript interacts with the DOM to dynamically update web pages. you will learn how to access and manipulate DOM elements, handle events, and create interactive features such as form validation and dynamic content generation.<br><br>Module 7: Building Interactive Web Applications<br>In this module, you will take your JavaScript skills to the next level by exploring front-end frameworks and libraries. you will get introduced to popular frameworks like React, Angular, and Vue.js, and learn how to build interactive components and user interfaces. you will also discover how to consume APIs (Application Programming Interfaces) and handle asynchronous requests to create dynamic web applications.<br><br>Module 8: Project Work and Hands-on Exercises<br>Putting theory into practice, this module focuses on applying your newfound knowledge to real-world projects. you will work on building a responsive website from scratch, incorporating HTML, CSS, and JavaScript functionalities. Through hands-on exercises and project work, you will gain practical experience in web development and learn valuable problem-solving skills.<br><br>Module 9: Deployment and Hosting<br>Once you\'ve developed your website or web application, you will need to deploy it to a web server and make it accessible to the world. This module covers various web hosting options, including shared hosting, VPS (Virtual Private Server), and cloud hosting. you will learn how to upload files to a web server, configure domain names, and deploy web applications to cloud platforms like AWS, Azure, or Google Cloud.<br><br>Module 10: Continuous Learning and Career Development<br>Web development is a dynamic field that requires continuous learning and adaptation to new technologies. In this final module, We will provide resources for further learning and skill enhancement. you will learn how to build a portfolio of web development projects, explore career paths in web development, and stay updated with the latest trends and technologies. We will also discuss networking opportunities and community engagement to support your career growth in web development.','2024-02-25'),(2,'Data Science','Explore data analysis, machine learning, and data visualization techniques.','Data science has emerged as a crucial field in the era of big data, enabling organizations to derive valuable insights and make data-driven decisions. This paper aims to provide an overview of key concepts and techniques in data analysis, machine learning, and data visualization within the realm of data science. We delve into the foundations of data science, explore various data analysis methods, discuss popular machine learning algorithms, and highlight the significance of data visualization in uncovering patterns and communicating insights effectively.<br><br>\n\nIntroduction<br>\nIn this section, we introduce the concept of data science and its importance in today data-driven world. We discuss the scope of data science, its applications across various industries, and provide an overview of the data science workflow, showcasing the iterative nature of the process.<br><br>\nFoundations of Data Analysis<br>\nIn this section, we delve into the fundamental concepts and techniques of data analysis. We explore the crucial steps of data cleaning and preprocessing, including handling missing data, dealing with outliers, and feature scaling. We then discuss exploratory data analysis (EDA), which involves using descriptive statistics and data visualization techniques to gain insights into the data. Additionally, we cover statistical analysis methods such as hypothesis testing, regression analysis, and analysis of variance (ANOVA).<br><br>\n\nMachine Learning Techniques<br>\nThis section focuses on machine learning, a key component of data science. We provide an overview of supervised learning algorithms, including linear regression, logistic regression, decision trees, support vector machines (SVM), and naive Bayes classifiers. We also explore unsupervised learning techniques such as clustering algorithms (K-means, hierarchical clustering) and dimensionality reduction techniques (Principal Component Analysis, t-SNE). Furthermore, we discuss model evaluation and validation techniques, emphasizing the importance of training/testing data splits, evaluation metrics, and cross-validation.<br><br>\n\nData Visualization<br>\nData visualization is a powerful tool that helps in understanding and communicating insights effectively. In this section, we highlight the significance of data visualization in data science. We discuss popular visualization libraries and tools such as Matplotlib, Seaborn, Plotly, and Tableau. Additionally, we explore various types of data visualizations, including bar charts, histograms, scatter plots, heatmaps, and interactive visualizations.<br><br>\n\nCase Studies and Applications<br>\nIn this section, we provide real-world examples of data science projects that demonstrate the application of data analysis, machine learning, and data visualization techniques. We showcase how these techniques are employed in different domains, such as finance, healthcare, marketing, and more. By analyzing these case studies, readers gain a deeper understanding of how data science is applied in practical scenarios.<br><br>\nChallenges and Future Directions<br>\nData science faces several challenges, including ethical considerations, bias, and fairness in algorithms. In this section, we explore these challenges and discuss the importance of addressing them in the field of data science. We also touch upon advancements in interpretability and explainability, which are critical for building trust in machine learning models. Additionally, we discuss potential future directions in the field, including emerging technologies and trends.<br><br>\nConclusion<br>\nIn the concluding section, we summarize the key concepts discussed throughout the paper. We emphasize the importance of data science in making data-driven decisions and gaining a competitive edge. We highlight how data analysis, machine learning, and data visualization techniques work together to extract insights from data. Finally, we express our optimism about the future of data science and its potential to revolutionize various industries.<br><br>\nIn conclusion, this paper provides a comprehensive overview of data analysis, machine learning, and data visualization techniques in the field of data science. By understanding and applying these techniques, organizations can unlock the power of their data, make informed decisions, and gain a competitive advantage in today data-driven world.','2024-02-25'),(3,'Mobile App Development','Build mobile applications for iOS and Android platforms.','Welcome to the world of mobile app development! In the \"Mobile App Development - Build mobile applications for iOS and Android platforms\" course, you will embark on a journey to master the essential skills for creating mobile applications for both iOS and Android platforms. Whether you are a beginner or an experienced developer, this course will provide you with the knowledge and practical experience needed to build innovative and user-friendly mobile apps from scratch.<br> Throughout this comprehensive online learning experience, you will learn the fundamentals of mobile app development, including app design principles, user interface development, data management, and app deployment. From prototyping and wireframing to coding and testing, each module will guide you through the process of creating high-quality mobile apps that meet user needs and adhere to industry standards.<br><br> Module 1: Introduction to Mobile App Development<br> In this module, you will explore the fundamentals of mobile app development. you will learn about the different platforms and tools available for building mobile apps, including iOS and Android. We will discuss the key considerations for mobile app design, development, and distribution, and provide an overview of the mobile app development landscape.<br><br>Module 2: App Design and Prototyping<br>This module focuses on the design aspects of mobile app development. you will learn how to create user-friendly interfaces and engaging user experiences (UX) for mobile apps. We will cover principles of mobile app design, including layout, navigation, and usability. Additionally, you will explore prototyping tools and techniques for visualizing app concepts and gathering user feedback.<br><br>Module 3: Developing for iOS<br>With a focus on the iOS platform, this module covers the essentials of iOS app development. you will learn how to use Xcode, Apple\'s integrated development environment (IDE), to create iOS apps using Swift, Apple\'s programming language for iOS development. We will explore iOS app architecture, user interface design, and app navigation, and demonstrate how to build and test iOS apps on simulators and real devices.<br><br>Module 4: Developing for Android<br>This module delves into Android app development, focusing on building apps for the Android platform. you will learn how to set up Android Studio, Google\'s official IDE for Android development, and create Android apps using Java or Kotlin, Google\'s recommended programming languages for Android development. We will cover Android app components, user interface design principles, and app deployment to the Google Play Store.<br><br>Module 5: Working with Data and APIs<br>Mobile apps often require data storage and integration with external services through APIs (Application Programming Interfaces). In this module, you will learn how to manage data in mobile apps using local storage options like SQLite databases and SharedPreferences on Android, as well as Core Data and UserDefaults on iOS. We will also explore how to consume RESTful APIs to retrieve and manipulate data from remote servers.<br><br>Module 6: User Authentication and Security<br>Security is a crucial aspect of mobile app development, especially when handling sensitive user data and transactions. In this module, you will learn best practices for implementing user authentication and securing data transmission in mobile apps. We will cover authentication methods like OAuth and OpenID Connect, as well as techniques for encrypting data and protecting against common security threats.<br><br>Module 7: Testing and Debugging<br>Ensuring the quality and reliability of mobile apps requires thorough testing and debugging. In this module, you will learn different testing strategies and tools for identifying and fixing bugs in mobile apps. We will cover manual testing, automated testing, and beta testing approaches, and demonstrate how to use debugging tools and techniques to diagnose and resolve issues.<br><br>Module 8: App Deployment and Distribution<br>Once you have developed your mobile app, you will need to deploy it to app stores and make it available to users. This module covers the process of app deployment and distribution on both the Apple App Store and Google Play Store. you will learn how to create developer accounts, prepare app submissions, and navigate the app review process to ensure successful publication.<br><br>Module 9: Performance Optimization<br>Optimizing mobile app performance is essential for delivering a smooth and responsive user experience. In this module, you will learn techniques for optimizing app performance, including optimizing app startup time, reducing memory usage, and minimizing network latency. We will discuss common performance bottlenecks and performance monitoring tools for identifying and addressing performance issues.<br><br>Module 10: Continuous Learning and Career Development<br>Mobile app development is a rapidly evolving field that requires continuous learning and adaptation to new technologies. In this final module, We will provide resources for further learning and skill enhancement. you will learn how to build a portfolio of mobile app projects, explore career paths in mobile app development, and stay updated with the latest trends and technologies. We will also discuss networking opportunities and community engagement to support your career growth in mobile app development.','2024-02-25'),(4,'Python Programming for Beginners','Dive into the world of Python programming language. Learn basic syntax, data structures, and control flow to start building your own Python applications.','Welcome to the world of Python programming! In the \"Python Programming for Beginners\" course, you will embark on a journey to learn one of the most versatile and widely-used programming languages in the world. Whether you are new to programming or looking to expand your skillset, this course will provide you with the knowledge and practical experience needed to write Python code, solve problems, and build applications.<br> Throughout this comprehensive online learning experience, you will explore the fundamentals of Python programming, including syntax, data types, control structures, functions, and object-oriented programming (OOP). From writing simple scripts to building complex applications, each module will guide you through the process of becoming proficient in Python programming.<br><br> Module 1: Introduction to Python<br> In this module, you will be introduced to the basics of Python programming. you will learn about Python\'s history, features, and applications, and understand why it is a popular choice for beginners and experienced developers alike. We will guide you through setting up your Python development environment, introduce you to essential tools and resources, and provide an overview of the Python programming landscape.<br><br>Module 2: Python Basics<br>This module focuses on the fundamental concepts of Python programming. you will learn about Python syntax, variables, data types, and operators. We will cover basic input and output operations, as well as control structures such as loops and conditional statements. Additionally, you will explore best practices for writing clean and readable code in Python.<br><br>Module 3: Working with Functions<br>Functions are a fundamental building block of Python programming. In this module, you will learn how to define and use functions to encapsulate reusable code and perform specific tasks. We will cover function parameters, return values, and scope, and demonstrate how to write modular and efficient code using functions.<br><br>Module 4: Data Structures and Collections<br>Data structures are essential for organizing and manipulating data in Python. In this module, you will explore built-in data structures such as lists, tuples, dictionaries, and sets. We will discuss their properties, operations, and common use cases, and demonstrate how to leverage these data structures to solve real-world problems.<br><br>Module 5: File Handling and I/O Operations<br>File handling is an important aspect of Python programming, allowing you to read from and write to files on your computer. In this module, you will learn how to work with files in Python, including opening, reading, writing, and closing files. We will cover different file modes, error handling, and best practices for file operations.<br><br>Module 6: Error Handling and Exceptions<br>Error handling is crucial for writing robust and reliable Python code. In this module, you will learn how to handle errors and exceptions gracefully using Python\'s built-in exception handling mechanism. We will discuss common types of errors, raise and catch exceptions, and demonstrate how to use try-except blocks to handle exceptional conditions in your code.<br><br>Module 7: Introduction to Object-Oriented Programming (OOP)<br>Object-oriented programming (OOP) is a powerful paradigm for organizing and structuring code. In this module, you will be introduced to the principles of OOP and learn how to create and use classes and objects in Python. We will cover concepts such as encapsulation, inheritance, polymorphism, and abstraction, and demonstrate how to apply these concepts to solve complex problems.<br><br>Module 8: Working with Modules and Packages<br>Modules and packages are essential for organizing and distributing Python code. In this module, you will learn how to create and use modules to organize related code into reusable units. We will cover module importing, module search paths, and package structure, and demonstrate how to create and distribute your own Python packages.<br><br>Module 9: Working with External Libraries<br>Python has a rich ecosystem of external libraries and packages that extend its capabilities. In this module, you will learn how to install, import, and use external libraries in your Python projects. We will cover popular libraries for tasks such as data analysis, web development, and scientific computing, and demonstrate how to leverage these libraries to enhance your Python programs.<br><br>Module 10: Project Work and Hands-on Exercises<br>Putting theory into practice, this module focuses on applying your newfound knowledge to real-world projects. you will work on building Python applications from scratch, incorporating concepts learned throughout the course. Through hands-on exercises and project work, you will gain practical experience in Python programming and learn valuable problem-solving skills.<br><br>Module 11: Continuous Learning and Career Development<br>Python programming offers endless opportunities for learning and career advancement. In this final module, We will provide resources for further learning and skill enhancement. you will learn how to build a portfolio of Python projects, explore career paths in Python development, and stay updated with the latest trends and technologies. We will also discuss networking opportunities and community engagement to support your career growth in Python programming.','2024-02-10'),(5,'Introduction to Artificial Intelligence','Explore the fascinating field of artificial intelligence (AI). Understand the concepts of machine learning, neural networks, and natural language processing.','This course introduces you to the principles and applications of artificial intelligence. You will learn about various machine learning algorithms, neural network architectures, and deep learning techniques. Get hands-on experience with AI tools and libraries.','2024-01-25'),(6,'Graphic Design Fundamentals','Master the essentials of graphic design. Learn about typography, color theory, layout design, and image manipulation techniques.','In this course, you will explore the principles of graphic design, including typography, color theory, composition, and visual hierarchy. Gain practical skills using industry-standard design software like Adobe Photoshop and Illustrator.','2024-02-18'),(7,'Introduction to Blockchain Technology','Delve into the revolutionary world of blockchain technology. Understand the underlying concepts of decentralized systems, cryptocurrencies, and smart contracts.','This course provides an overview of blockchain technology and its applications. You will learn about the architecture of blockchain networks, cryptographic principles, consensus mechanisms, and decentralized applications (DApps). Explore case studies and real-world examples.','2024-01-10'),(8,'Digital Marketing Essentials','Learn the fundamentals of digital marketing strategies. Explore topics such as search engine optimization (SEO), social media marketing, email marketing, and content creation.','This course covers essential digital marketing concepts and techniques. You will discover strategies for driving website traffic, engaging with online audiences, and converting leads into customers. Gain practical insights into building effective marketing campaigns.','2024-02-19'),(9,'Introduction to Cybersecurity','Gain insight into the field of cybersecurity. Understand common threats, security measures, encryption techniques, and risk management strategies.','In this course, you will learn about the fundamentals of cybersecurity, including threat detection, vulnerability assessment, incident response, and security best practices. Explore real-world cybersecurity challenges and practical solutions.','2024-02-04'),(10,'Financial Planning and Investment Strategies','Explore the world of personal finance and investment. Learn about budgeting, saving, investing, and retirement planning to achieve financial freedom.','This course provides comprehensive guidance on financial planning and investment strategies. You will learn how to set financial goals, create a budget, manage debt, build an investment portfolio, and plan for retirement. Gain valuable insights from industry experts.','2024-02-11');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolled_courses`
--

DROP TABLE IF EXISTS `enrolled_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrolled_courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `course_id` int NOT NULL,
  `enrolled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `fk_user_courses_courses` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_courses_users` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolled_courses`
--

LOCK TABLES `enrolled_courses` WRITE;
/*!40000 ALTER TABLE `enrolled_courses` DISABLE KEYS */;
INSERT INTO `enrolled_courses` VALUES (64,15,1,0);
/*!40000 ALTER TABLE `enrolled_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_id` int NOT NULL,
  `option_text` varchar(255) NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,1,'Continuous Integration',1),(2,1,'Continuous Deployment',0),(3,1,'Configuration Integration',0),(4,1,'Configuration Deployment',0),(5,2,'Continuous Integration',0),(6,2,'Continuous Deployment',1),(7,2,'Configuration Integration',0),(8,2,'Configuration Deployment',0),(9,3,'Git',0),(10,3,'Ansible',0),(11,3,'Puppet',0),(12,3,'Jenkins',1),(13,4,'To automate the deployment process',0),(14,4,'To ensure that the code is integrated frequently',1),(15,4,'To manage server configurations',0),(16,4,'To monitor application performance',0),(17,5,'To automate the deployment process',0),(18,5,'To ensure that the code is integrated frequently',0),(19,5,'To manage server configurations',0),(20,5,'To deploy code changes to production quickly and safely',1),(21,6,'Continuous integration and continuous delivery',1),(22,6,'Infrastructure as code',0),(23,6,'Automated testing',0),(24,6,'Agile development',0),(25,7,'To reduce manual work and human error',1),(26,7,'To increase the cost of operations',0),(27,7,'To slow down the development process',0),(28,7,'To make developers jobs harder',0),(29,8,'A lightweight, standalone, executable package that includes everything needed to run a piece of software, including the code, runtime, libraries, and dependencies',1),(30,8,'A virtual machine that runs multiple isolated applications',0),(31,8,'A process that runs in the background and performs tasks on a server',0),(32,8,'A tool for managing containers in a distributed environment',0),(33,9,'To automate the deployment process',0),(34,9,'To manage server configurations',0),(35,9,'To deploy code changes to production quickly and safely',0),(36,9,'To orchestrate and manage containers at scale',1),(37,10,'Faster delivery of features and updates',1),(38,10,'Increased collaboration between development and operations teams',1),(39,10,'More stable operating environments',1),(40,10,'Reduced risk of deployment failures',1),(41,11,'A programming language',1),(42,11,'A type of snake',0),(43,11,'A computer software',0),(44,11,'An operating system',0),(45,12,'Easy to learn and use',1),(46,12,'Wide range of libraries and frameworks',0),(47,12,'High performance and efficiency',0),(48,12,'Cross-platform compatibility',0),(49,13,'Supports multiple programming paradigms',1),(50,13,'Scalability and robustness',0),(51,13,'Integration with other languages and tools',0),(52,13,'Built-in testing and debugging capabilities',0),(53,14,'Platform-independent',1),(54,14,'Highly scalable',0),(55,14,'Easy integration with web development frameworks',0),(56,14,'Large standard library',0),(57,15,'Integer',0),(58,15,'Float',0),(59,15,'String',0),(60,15,'Boolean',1),(61,16,'A block of reusable code',1),(62,16,'A data structure',0),(63,16,'A built-in Python module',0),(64,16,'A loop construct',0),(65,17,'To repeat a block of code',1),(66,17,'To execute code conditionally',0),(67,17,'To define a function',0),(68,17,'To define a class',0),(69,18,'An immutable sequence of elements',1),(70,18,'A built-in Python module',0),(71,18,'A loop construct',0),(72,18,'A data structure',0),(73,19,'To store key-value pairs',1),(74,19,'To repeat a block of code',0),(75,19,'To execute code conditionally',0),(76,19,'To define a function',0),(77,20,'A programming paradigm based on objects',1),(78,20,'A built-in Python module',0),(79,20,'A loop construct',0),(80,20,'A data structure',0);
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assessment_id` int NOT NULL,
  `question_text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,1,'What does \"CI\" stand for in DevOps?'),(2,1,'What does \"CD\" stand for in DevOps?'),(3,1,'Which of the following tools is not typically used for configuration management in DevOps?'),(4,1,'What is the main goal of continuous integration (CI) in DevOps?'),(5,1,'What is the main goal of continuous delivery (CD) in DevOps?'),(6,1,'Which of the following is a key principle of DevOps?'),(7,1,'What is the role of automation in DevOps?'),(8,1,'What is a Docker container?'),(9,1,'What is the purpose of Kubernetes in DevOps?'),(10,1,'What are some benefits of using DevOps practices?'),(11,2,'What is Python?'),(12,2,'What are the advantages of using Python?'),(13,2,'What are the basic data types in Python?'),(14,2,'What is a function in Python?'),(15,2,'What is the purpose of loops in Python?'),(16,2,'What are tuples in Python?'),(17,2,'What is the purpose of dictionaries in Python?'),(18,2,'What is object-oriented programming (OOP) in Python?'),(19,2,'What is exception handling in Python?'),(20,2,'What is the difference between list and tuple in Python?');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userprofile`
--

DROP TABLE IF EXISTS `userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userprofile` (
  `profile_id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`profile_id`),
  KEY `fk_userprofile_users` (`uid`),
  CONSTRAINT `fk_userprofile_users` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userprofile`
--

LOCK TABLES `userprofile` WRITE;
/*!40000 ALTER TABLE `userprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `auth_seed_value` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (14,'Emil','Asg','emil.asg78@gmail.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','JUIYQ2DBKZCN4PBU'),(15,'Nur','Asgarli','nurana.asgarli@gmail.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','P6ZXG7BTLHUZHUCI');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-18 23:22:44
