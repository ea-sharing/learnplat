-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: demoappdb
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

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

DROP DATABASE IF EXISTS demoappdb;
CREATE DATABASE demoappdb CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
FLUSH PRIVILEGES;
USE demoappdb;

<<<<<<< HEAD
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_results`
--

LOCK TABLES `assessment_results` WRITE;
/*!40000 ALTER TABLE `assessment_results` DISABLE KEYS */;
INSERT INTO `assessment_results` VALUES (11,14,1,9,10,90.00,'Pass','2024-04-02 02:13:45');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessments`
--

LOCK TABLES `assessments` WRITE;
/*!40000 ALTER TABLE `assessments` DISABLE KEYS */;
INSERT INTO `assessments` VALUES (1,'DevOps Assessment');
/*!40000 ALTER TABLE `assessments` ENABLE KEYS */;
UNLOCK TABLES;

=======
>>>>>>> 09a1684da58d3623380cedd3206964bfbe9ddf8e
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
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
INSERT INTO `courses` VALUES (1,'Web Development','Learn HTML, CSS, and JavaScript to build modern websites.','In the Web Development course, you will delve into the world of HTML, CSS, and JavaScript. These fundamental technologies are essential for building modern, responsive websites. Whether you are a beginner or an experienced developer, this course will equip you with the skills needed to create stunning web applications.','2024-02-25'),(2,'Data Science','Explore data analysis, machine learning, and data visualization techniques.','Data science has emerged as a crucial field in the era of big data, enabling organizations to derive valuable insights and make data-driven decisions. This paper aims to provide an overview of key concepts and techniques in data analysis, machine learning, and data visualization within the realm of data science. We delve into the foundations of data science, explore various data analysis methods, discuss popular machine learning algorithms, and highlight the significance of data visualization in uncovering patterns and communicating insights effectively.<br><br>\n\nIntroduction<br>\nIn this section, we introduce the concept of data science and its importance in today data-driven world. We discuss the scope of data science, its applications across various industries, and provide an overview of the data science workflow, showcasing the iterative nature of the process.<br><br>\nFoundations of Data Analysis<br>\nIn this section, we delve into the fundamental concepts and techniques of data analysis. We explore the crucial steps of data cleaning and preprocessing, including handling missing data, dealing with outliers, and feature scaling. We then discuss exploratory data analysis (EDA), which involves using descriptive statistics and data visualization techniques to gain insights into the data. Additionally, we cover statistical analysis methods such as hypothesis testing, regression analysis, and analysis of variance (ANOVA).<br><br>\n\nMachine Learning Techniques<br>\nThis section focuses on machine learning, a key component of data science. We provide an overview of supervised learning algorithms, including linear regression, logistic regression, decision trees, support vector machines (SVM), and naive Bayes classifiers. We also explore unsupervised learning techniques such as clustering algorithms (K-means, hierarchical clustering) and dimensionality reduction techniques (Principal Component Analysis, t-SNE). Furthermore, we discuss model evaluation and validation techniques, emphasizing the importance of training/testing data splits, evaluation metrics, and cross-validation.<br><br>\n\nData Visualization<br>\nData visualization is a powerful tool that helps in understanding and communicating insights effectively. In this section, we highlight the significance of data visualization in data science. We discuss popular visualization libraries and tools such as Matplotlib, Seaborn, Plotly, and Tableau. Additionally, we explore various types of data visualizations, including bar charts, histograms, scatter plots, heatmaps, and interactive visualizations.<br><br>\n\nCase Studies and Applications<br>\nIn this section, we provide real-world examples of data science projects that demonstrate the application of data analysis, machine learning, and data visualization techniques. We showcase how these techniques are employed in different domains, such as finance, healthcare, marketing, and more. By analyzing these case studies, readers gain a deeper understanding of how data science is applied in practical scenarios.<br><br>\nChallenges and Future Directions<br>\nData science faces several challenges, including ethical considerations, bias, and fairness in algorithms. In this section, we explore these challenges and discuss the importance of addressing them in the field of data science. We also touch upon advancements in interpretability and explainability, which are critical for building trust in machine learning models. Additionally, we discuss potential future directions in the field, including emerging technologies and trends.<br><br>\nConclusion<br>\nIn the concluding section, we summarize the key concepts discussed throughout the paper. We emphasize the importance of data science in making data-driven decisions and gaining a competitive edge. We highlight how data analysis, machine learning, and data visualization techniques work together to extract insights from data. Finally, we express our optimism about the future of data science and its potential to revolutionize various industries.<br><br>\nIn conclusion, this paper provides a comprehensive overview of data analysis, machine learning, and data visualization techniques in the field of data science. By understanding and applying these techniques, organizations can unlock the power of their data, make informed decisions, and gain a competitive advantage in today data-driven world.','2024-02-25'),(3,'Mobile App Development','Build mobile applications for iOS and Android platforms.','Mobile App Development is an exciting journey that allows you to build innovative applications for iOS and Android platforms. Throughout this course, you will learn about mobile app design principles, user interface development, and backend integration. By mastering these skills, you will be able to create engaging mobile experiences for users around the world.','2024-02-25'),(4,'Python Programming for Beginners','Dive into the world of Python programming language. Learn basic syntax, data structures, and control flow to start building your own Python applications.','In this course, you will learn the fundamentals of Python programming, including variables, data types, conditional statements, loops, functions, and more. By the end of the course, you will be able to write simple Python programs to solve real-world problems.','2024-02-10'),(5,'Introduction to Artificial Intelligence','Explore the fascinating field of artificial intelligence (AI). Understand the concepts of machine learning, neural networks, and natural language processing.','This course introduces you to the principles and applications of artificial intelligence. You will learn about various machine learning algorithms, neural network architectures, and deep learning techniques. Get hands-on experience with AI tools and libraries.','2024-01-25'),(6,'Graphic Design Fundamentals','Master the essentials of graphic design. Learn about typography, color theory, layout design, and image manipulation techniques.','In this course, you will explore the principles of graphic design, including typography, color theory, composition, and visual hierarchy. Gain practical skills using industry-standard design software like Adobe Photoshop and Illustrator.','2024-02-18'),(7,'Introduction to Blockchain Technology','Delve into the revolutionary world of blockchain technology. Understand the underlying concepts of decentralized systems, cryptocurrencies, and smart contracts.','This course provides an overview of blockchain technology and its applications. You will learn about the architecture of blockchain networks, cryptographic principles, consensus mechanisms, and decentralized applications (DApps). Explore case studies and real-world examples.','2024-01-10'),(8,'Digital Marketing Essentials','Learn the fundamentals of digital marketing strategies. Explore topics such as search engine optimization (SEO), social media marketing, email marketing, and content creation.','This course covers essential digital marketing concepts and techniques. You will discover strategies for driving website traffic, engaging with online audiences, and converting leads into customers. Gain practical insights into building effective marketing campaigns.','2024-02-19'),(9,'Introduction to Cybersecurity','Gain insight into the field of cybersecurity. Understand common threats, security measures, encryption techniques, and risk management strategies.','In this course, you will learn about the fundamentals of cybersecurity, including threat detection, vulnerability assessment, incident response, and security best practices. Explore real-world cybersecurity challenges and practical solutions.','2024-02-04'),(10,'Financial Planning and Investment Strategies','Explore the world of personal finance and investment. Learn about budgeting, saving, investing, and retirement planning to achieve financial freedom.','This course provides comprehensive guidance on financial planning and investment strategies. You will learn how to set financial goals, create a budget, manage debt, build an investment portfolio, and plan for retirement. Gain valuable insights from industry experts.','2024-02-11');
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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolled_courses`
--

LOCK TABLES `enrolled_courses` WRITE;
/*!40000 ALTER TABLE `enrolled_courses` DISABLE KEYS */;
INSERT INTO `enrolled_courses` VALUES (57,14,8,0),(59,14,2,0),(60,14,3,0),(61,14,9,0),(62,14,4,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,1,'Continuous Integration',1),(2,1,'Continuous Deployment',0),(3,1,'Configuration Integration',0),(4,1,'Configuration Deployment',0),(5,2,'Continuous Integration',0),(6,2,'Continuous Deployment',1),(7,2,'Configuration Integration',0),(8,2,'Configuration Deployment',0),(9,3,'Git',0),(10,3,'Ansible',0),(11,3,'Puppet',0),(12,3,'Jenkins',1),(13,4,'To automate the deployment process',0),(14,4,'To ensure that the code is integrated frequently',1),(15,4,'To manage server configurations',0),(16,4,'To monitor application performance',0),(17,5,'To automate the deployment process',0),(18,5,'To ensure that the code is integrated frequently',0),(19,5,'To manage server configurations',0),(20,5,'To deploy code changes to production quickly and safely',1),(21,6,'Continuous integration and continuous delivery',1),(22,6,'Infrastructure as code',0),(23,6,'Automated testing',0),(24,6,'Agile development',0),(25,7,'To reduce manual work and human error',1),(26,7,'To increase the cost of operations',0),(27,7,'To slow down the development process',0),(28,7,'To make developers jobs harder',0),(29,8,'A lightweight, standalone, executable package that includes everything needed to run a piece of software, including the code, runtime, libraries, and dependencies',1),(30,8,'A virtual machine that runs multiple isolated applications',0),(31,8,'A process that runs in the background and performs tasks on a server',0),(32,8,'A tool for managing containers in a distributed environment',0),(33,9,'To automate the deployment process',0),(34,9,'To manage server configurations',0),(35,9,'To deploy code changes to production quickly and safely',0),(36,9,'To orchestrate and manage containers at scale',1),(37,10,'Faster delivery of features and updates',1),(38,10,'Increased collaboration between development and operations teams',1),(39,10,'More stable operating environments',1),(40,10,'Reduced risk of deployment failures',1);
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (6,'containerd vs. Docker: Understanding Their Relationship and How They Work Together','During past decade, containers have revolutionized software development by introducing higher levels of consistency and scalability. Now, developers can work without the challenges of dependency management, environment consistency, and collaborative workflows.\r\n\r\nWhen developers explore containerization, they might learn about container internals, architecture, and how everything fits together. And, eventually, they may find themselves wondering about the differences between containerd and Docker and how they relate to one another.\r\n\r\nIn this blog post, we’ll explain what containerd is, how Docker and containerd work together, and how their combined strengths can improve developer experience.','2024-04-01 16:28:49',14);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,1,'What does \"CI\" stand for in DevOps?'),(2,1,'What does \"CD\" stand for in DevOps?'),(3,1,'Which of the following tools is not typically used for configuration management in DevOps?'),(4,1,'What is the main goal of continuous integration (CI) in DevOps?'),(5,1,'What is the main goal of continuous delivery (CD) in DevOps?'),(6,1,'Which of the following is a key principle of DevOps?'),(7,1,'What is the role of automation in DevOps?'),(8,1,'What is a Docker container?'),(9,1,'What is the purpose of Kubernetes in DevOps?'),(10,1,'What are some benefits of using DevOps practices?');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (14,'Emil','Asg','emil.asg78@gmail.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','JUIYQ2DBKZCN4PBU');
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

-- Dump completed on 2024-04-02 19:27:02
