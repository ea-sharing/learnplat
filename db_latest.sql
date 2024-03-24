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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates`
--

LOCK TABLES `certificates` WRITE;
/*!40000 ALTER TABLE `certificates` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `completed_courses`
--

LOCK TABLES `completed_courses` WRITE;
/*!40000 ALTER TABLE `completed_courses` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolled_courses`
--

LOCK TABLES `enrolled_courses` WRITE;
/*!40000 ALTER TABLE `enrolled_courses` DISABLE KEYS */;
INSERT INTO `enrolled_courses` VALUES (37,1,2,0),(43,4,2,0),(44,4,1,0),(45,4,3,0);
/*!40000 ALTER TABLE `enrolled_courses` ENABLE KEYS */;
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
INSERT INTO `userprofile` VALUES (1,1,'Ontario','43899333','1980-02-28'),(2,1,'Ontario','43899333','1980-02-28'),(3,1,'Ontario','43899333','1980-02-28'),(4,1,'Ontario','43899333','1980-02-28'),(5,1,'Ontario','43899333','1980-02-28'),(6,1,'Ontario','43899333','1980-02-28'),(7,1,'Ontario','43899333','1980-02-28'),(8,1,'Ontario','43899333','1980-02-28'),(9,1,'Ontario','43899333','1980-02-28'),(10,1,'Ontario','43899333','1980-02-28'),(11,1,'Ontario','43899333','1980-02-28'),(12,1,'Ontario','43899333','1980-02-28'),(13,1,'Ontario','43899333','1980-02-28'),(14,1,'Ontario','43899333','1980-02-28'),(15,1,'Ontario','43899333','1980-02-28');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Emil','Asgarov','asga0006@algonquinlive.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','45D24YFR2KOTNFIC'),(4,'Jef','Ask','emil.asg78@gmail.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','XY5M36QOKLZUOIYY'),(5,'Ferhad','Asgarli','emil.ask78@gmail.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','GWFWNNK4ERRRDLDP'),(6,'Ferhad','Asgarli','emil.ask78@gmail.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','GWFWNNK4ERRRDLDP');
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

-- Dump completed on 2024-03-24 17:53:38
