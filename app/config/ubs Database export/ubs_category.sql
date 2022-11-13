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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `cat_id` int DEFAULT NULL,
  `cat_name` text,
  `cat_subid` int DEFAULT NULL,
  `cat_img` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Property',0,'assets\\Icon\\property.png'),(2,'Mobiles',0,'assets\\Icon\\mobiles.png'),(3,'Jobs',0,'assets\\Icon\\jobs.png'),(4,'Bikes',0,'assets\\Icon\\bikes.png'),(5,'Elections appliances ',0,'assets\\Icon\\elections_appliances.png'),(6,'Commercial vehicles & spare parts',0,'assets\\Icon\\commercial_vehicles.png'),(7,'Furniture',0,'assets\\Icon\\furniture.png'),(8,'Fashion',0,'assets\\Icon\\fashion.png'),(9,'Book, Sports & hobbies',0,'assets\\Icon\\hobbies.png'),(10,'Pets',0,'assets\\Icon\\pets.png'),(11,'Services',0,'assets\\Icon\\services.png'),(12,'For Sale: Houses & Apartments',1,''),(13,'For Rent: Houses & Apartments',1,''),(14,'Lands & Posts',1,''),(15,'For Sale : Shops & Offices',1,''),(16,'For Rent : Shops & Offices',1,''),(17,'PG & Gueses',1,''),(18,'Mobile Phone',2,''),(19,'Accessories',2,''),(20,'Tablets',2,''),(21,'Sales & Marketing',3,''),(22,'BPO & Telecaller',3,''),(23,'Driver',3,''),(24,'Office Assistant',3,''),(25,'Teacher',3,''),(26,'Cook',3,''),(27,'Motorcycles',4,''),(28,'Scooters',4,''),(29,'Spare Parts',4,''),(30,'Bicycles',4,''),(31,'TVs, Video – Audio',5,''),(32,'Kitchen & Other Appliances',5,''),(33,'Computer Accessories',5,''),(34,'ACs',5,''),(35,'Commercial & other Vehicles',6,''),(36,'Spare Parts',6,''),(37,'Sofa & Dining',7,''),(38,'Beds & Wardrobes',7,''),(39,'Home Décor & Garden',7,''),(40,'Kids Furniture',7,''),(41,'Other Household Items',7,''),(42,'Man',8,''),(43,'Woman',8,''),(44,'Kids',8,''),(45,'Books',9,''),(46,'Gym & Fitness',9,''),(47,'Musical Instruments',9,''),(48,'Sports Equipment',9,''),(49,'Other Hobbies',9,''),(50,'Fishes & Aquarium',10,''),(51,'Pet Food & Accessories',10,''),(52,'Dogs',10,''),(53,'Cats',10,''),(54,'Other Pets',10,''),(55,'Electronics & Computer',11,''),(56,'Education & Classes',11,''),(57,'Driver & Taxi',11,''),(58,'Health & Beauty',11,''),(59,'Other Services',11,'');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
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

-- Dump completed on 2022-11-13  9:57:01
