-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: demoappdb
-- ------------------------------------------------------
-- Server version       8.0.35-0ubuntu0.22.04.1

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


GRANT ALL PRIVILEGES ON demoappdb.* TO 'demo_app_admin'@'%';

USE demoappdb;


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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `completed_courses`
--

LOCK TABLES `completed_courses` WRITE;
/*!40000 ALTER TABLE `completed_courses` DISABLE KEYS */;
INSERT INTO `completed_courses` VALUES (13,1,1,1),(15,4,1,1);
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
INSERT INTO `courses` VALUES (1,'Web Development','Learn HTML, CSS, and JavaScript to build modern websites.','In the Web Development course, you will delve into the world of HTML, CSS, and JavaScript. These fundamental technologies are essential for building modern, responsive websites. Whether you are a beginner or an experienced developer, this course will equip you with the skills needed to create stunning web applications.','2024-02-25'),(2,'Data Science','Explore data analysis, machine learning, and data visualization techniques.','Data Science is a fascinating field that involves exploring and analyzing data to uncover insights and make informed decisions. In this course, you will learn about various data analysis techniques, machine learning algorithms, and data visualization tools. By the end of the course, you will be well-equipped to tackle real-world data science challenges.','2024-02-25'),(3,'Mobile App Development','Build mobile applications for iOS and Android platforms.','Mobile App Development is an exciting journey that allows you to build innovative applications for iOS and Android platforms. Throughout this course, you will learn about mobile app design principles, user interface development, and backend integration. By mastering these skills, you will be able to create engaging mobile experiences for users around the world.','2024-02-25'),(4,'Python Programming for Beginners','Dive into the world of Python programming language. Learn basic syntax, data structures, and control flow to start building your own Python applications.','In this course, you will learn the fundamentals of Python programming, including variables, data types, conditional statements, loops, functions, and more. By the end of the course, you will be able to write simple Python programs to solve real-world problems.','2024-02-10'),(5,'Introduction to Artificial Intelligence','Explore the fascinating field of artificial intelligence (AI). Understand the concepts of machine learning, neural networks, and natural language processing.','This course introduces you to the principles and applications of artificial intelligence. You will learn about various machine learning algorithms, neural network architectures, and deep learning techniques. Get hands-on experience with AI tools and libraries.','2024-01-25'),(6,'Graphic Design Fundamentals','Master the essentials of graphic design. Learn about typography, color theory, layout design, and image manipulation techniques.','In this course, you will explore the principles of graphic design, including typography, color theory, composition, and visual hierarchy. Gain practical skills using industry-standard design software like Adobe Photoshop and Illustrator.','2024-02-18'),(7,'Introduction to Blockchain Technology','Delve into the revolutionary world of blockchain technology. Understand the underlying concepts of decentralized systems, cryptocurrencies, and smart contracts.','This course provides an overview of blockchain technology and its applications. You will learn about the architecture of blockchain networks, cryptographic principles, consensus mechanisms, and decentralized applications (DApps). Explore case studies and real-world examples.','2024-01-10'),(8,'Digital Marketing Essentials','Learn the fundamentals of digital marketing strategies. Explore topics such as search engine optimization (SEO), social media marketing, email marketing, and content creation.','This course covers essential digital marketing concepts and techniques. You will discover strategies for driving website traffic, engaging with online audiences, and converting leads into customers. Gain practical insights into building effective marketing campaigns.','2024-02-19'),(9,'Introduction to Cybersecurity','Gain insight into the field of cybersecurity. Understand common threats, security measures, encryption techniques, and risk management strategies.','In this course, you will learn about the fundamentals of cybersecurity, including threat detection, vulnerability assessment, incident response, and security best practices. Explore real-world cybersecurity challenges and practical solutions.','2024-02-04'),(10,'Financial Planning and Investment Strategies','Explore the world of personal finance and investment. Learn about budgeting, saving, investing, and retirement planning to achieve financial freedom.','This course provides comprehensive guidance on financial planning and investment strategies. You will learn how to set financial goals, create a budget, manage debt, build an investment portfolio, and plan for retirement. Gain valuable insights from industry experts.','2024-02-11');
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolled_courses`
--

LOCK TABLES `enrolled_courses` WRITE;
/*!40000 ALTER TABLE `enrolled_courses` DISABLE KEYS */;
INSERT INTO `enrolled_courses` VALUES (36,4,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Emil','Asgarov','asga0006@algonquinlive.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','45D24YFR2KOTNFIC'),(4,'Jef','Ask','emil.asg78@gmail.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','XY5M36QOKLZUOIYY');
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
