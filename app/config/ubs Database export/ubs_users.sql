-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: ubs-rds.cx9ieclkbphh.us-east-1.rds.amazonaws.com    Database: ubs
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `u_no` int NOT NULL AUTO_INCREMENT,
  `log_id` varchar(45) NOT NULL,
  `log_pass` varchar(255) NOT NULL,
  `u_name` varchar(45) NOT NULL,
  `u_about` varchar(300) DEFAULT NULL,
  `u_country` varchar(45) DEFAULT NULL,
  `u_phone` varchar(10) DEFAULT NULL,
  `u_email` varchar(70) DEFAULT NULL,
  `u_photo` varchar(255) DEFAULT NULL,
  `login_with` varchar(45) NOT NULL,
  PRIMARY KEY (`u_no`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'917499604663','$2b$10$nwvI7yNEkDvQkTzABQ0k0.QeQOKfyCT6R4wSu5jBV2wkCW4jqKjza','sanaulla shaikh - Mob1','I am very bad person111',NULL,'9174996046','sana12311@gmail.com',NULL,'phone'),(13,'sanaullashaikh191@gmail.com','$2b$10$rzFmE9r7hAOHQstY8s096uf/Nc3hovBkL/MoYFWV4XXUbAaxbw5AG','sanaulla','hello',NULL,NULL,'sanaullashaikh191@gmail.com','url','email'),(14,'tofique4@gmail.com','$2b$10$ABUgjinIipJEBMKO4F61Y.AATb7Dsic26HQdGfRhp5qJ0vdjLBV5a','Tofique Shaikh',NULL,NULL,NULL,'tofique4@gmail.com',NULL,'email'),(24,'sanaullashaikh1991@gmail.com','$2b$10$5vYLP6z8fE54YRiH3b3YhetJ7FPETd0yfai1O7MpT.0t7Po.O/KL2','Sanaulla shaikh','I am accountant in solapur',NULL,NULL,'sanaullashaikh1991@gmail.com',NULL,'google');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-13  9:57:10
