-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: ubs
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

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `log_id` varchar(45) NOT NULL,
  `log_pass` varchar(255) NOT NULL,
  `u_name` varchar(45) NOT NULL,
  `u_about` varchar(300) DEFAULT NULL,
  `u_country` varchar(45) DEFAULT NULL,
  `u_phone` varchar(10) DEFAULT NULL,
  `u_email` varchar(70) DEFAULT NULL,
  `u_photo` varchar(255) DEFAULT NULL,
  `login_with` varchar(45) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (5,'hello','$2b$10$LvC3dgjKvzio0qfJBpbame62INyj30JVzflXVc','sanaulla',NULL,NULL,'9421071420',NULL,NULL,'phone'),(6,'hello','$2b$10$5IpTUNrynImuuO/TCtakYuA5ZVv29qTawKLlWL','sanaulla',NULL,NULL,NULL,'sanualla@gmail.com',NULL,'email'),(8,'hello','$2b$10$OT7SS7foKZadr4wTXeQCqO.yBHWBcYPmkpVefi','sanaulla',NULL,NULL,NULL,'Sanualla1991@gmail.com',NULL,'email'),(9,'tofo','$2b$10$caRYXJ6jE4UDAQAiMtW4Pu7ajILG2EuWqc67Nv','tofique',NULL,NULL,NULL,'tofique@gmail.com',NULL,'email'),(10,'tofo1','$2b$10$4MaVC.rnlNldtp6kMhfGIuvZdt6dGvZR0m20vd','tofique1',NULL,NULL,NULL,'tofique1@gmail.com',NULL,'email'),(11,'tofo2','$2b$10$SfOJz10Gadwii9pjDz.IuupO1tjM9GrcbIl3FW','tofique2',NULL,NULL,NULL,'tofique2@gmail.com',NULL,'email'),(13,'sanaullashaikh1991@gmail.com','$2b$10$rzFmE9r7hAOHQstY8s096uf/Nc3hovBkL/MoYFWV4XXUbAaxbw5AG','sanaulla',NULL,NULL,NULL,'sanaullashaikh1991@gmail.com',NULL,'email'),(14,'tofique4@gmail.com','$2b$10$ABUgjinIipJEBMKO4F61Y.AATb7Dsic26HQdGfRhp5qJ0vdjLBV5a','sanaulla',NULL,NULL,NULL,'tofique4@gmail.com',NULL,'email');
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

-- Dump completed on 2022-10-20  2:18:49
