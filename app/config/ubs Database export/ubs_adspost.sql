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
-- Table structure for table `adspost`
--

DROP TABLE IF EXISTS `adspost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adspost` (
  `p_id` int NOT NULL AUTO_INCREMENT,
  `p_date` datetime NOT NULL,
  `p_title` varchar(255) NOT NULL,
  `p_brand` varchar(255) NOT NULL,
  `p_describe` varchar(550) DEFAULT NULL,
  `p_img1` varchar(255) NOT NULL,
  `p_img2` varchar(255) DEFAULT NULL,
  `p_img3` varchar(255) DEFAULT NULL,
  `p_img4` varchar(255) DEFAULT NULL,
  `p_img5` varchar(255) DEFAULT NULL,
  `p_price` double DEFAULT NULL,
  `p_location` varchar(45) NOT NULL,
  `p_mcat` int NOT NULL,
  `p_scat` int NOT NULL,
  `p_uid` varchar(45) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adspost`
--

LOCK TABLES `adspost` WRITE;
/*!40000 ALTER TABLE `adspost` DISABLE KEYS */;
INSERT INTO `adspost` VALUES (42,'2022-09-28 17:29:10','Dauk 125CC ','KTM','5 year old bike with all document ready','upload/postImages/Solapur/ktm-1.jpg','upload/postImages/Solapur/ktm-2.jpg','','','',850000,'Solapur',4,27,'sanaullashaikh191@gmail.com'),(43,'2022-09-28 17:30:59','redmi 10 note pro','redme','2 year old mobile','upload/postImages/Pune/redmi_10_note-1.jpeg','upload/postImages/Pune/redmi_10_note-2.jpeg','upload/postImages/Pune/redmi_10_note-3.jpeg','','',6500,'pune',2,18,'sanaullashaikh191@gmail.com'),(44,'2022-09-28 18:18:25','LED TV 32\"\"','LG','Working condication','upload/postImages/Pune/LG32.jpeg','','','','',8900,'Pune',5,31,'917499604663'),(45,'2022-09-28 18:44:59','Premium Quality T-shirts','Local','Premium quality T-shirts available only RS.300 delivery all over inida COD ','upload/postImages/Solapur/shirts.jpeg','','','','',300,'Solapur',8,42,'917499604663'),(46,'2022-09-28 18:46:47','I am selling my sherwani 1 time use','Local','Sell my sherwani 1 ime use only MRP.800 sell only 300 interest person message me','upload/postImages/Solapur/sherwani-1.jpeg','upload/postImages/Solapur/sherwani-2.jpeg','','','',2000,'Solapur',8,42,'917499604663'),(48,'2022-09-28 18:50:40','Super carry disel MH13','Ashok leland','PIckup van Year 2020 single owner and singal hand used','upload/postImages/Solapur/Ashok leland-1.jpeg','upload/postImages/Solapur/Ashok leland-2.jpeg','','','',490000,'Solapur',6,35,'sanaullashaikh191@gmail.com'),(49,'2022-09-28 18:52:39','IQOO Z6 Pro 5G new mobile phone','IQOO','IQOO Z6 Pro 5G new mobile phone ( 8GB RAM and 128 GB ROM) Gamming phone Sanpdragon778 processr','upload/postImages/Solapur/IQOO-1.jpeg','upload/postImages/Solapur/IQOO-2.jpeg','','','',20000,'Solapur',2,18,'sanaullashaikh191@gmail.com'),(50,'2022-09-28 18:53:54','Refrigerator for sell','LG','New Refrigerator working condiation','upload/postImages/Solapur/Refrigerator.jpeg','upload/postImages/Solapur/Refrigerator.jpeg','','','',5200,'Solapur',5,31,'tofique4@gmail.com'),(51,'2022-09-28 18:56:09','Pleasure Hero Honda','HERO','Model 2008 KM-200000 New tyres','upload/postImages/Solapur/Pleasure-1.jpeg','upload/postImages/Solapur/Pleasure-2.jpeg','upload/postImages/Solapur/Pleasure-3.jpeg','','',17000,'Solapur',4,27,'tofique4@gmail.com'),(52,'2022-09-28 18:57:32','Good condition','Suzuki','Kik sprinas kharab ahe baki condition OK ahe','upload/postImages/Solapur/Suzuki-1.jpeg','upload/postImages/Solapur/Suzuki-2.jpeg','upload/postImages/Solapur/Suzuki-3.jpeg','','',18000,'Solapur',4,27,'tofique4@gmail.com'),(53,'2022-09-28 18:59:51','Iphone 7','Apple','32BG 83 Battery health Camera glass damage, Bill cale only','upload/postImages/Solapur/Iphone7-1.jpeg','upload/postImages/Solapur/Iphone7-2.jpeg','upload/postImages/Solapur/Iphone7-3.jpeg','upload/postImages/Solapur/Iphone7-4.jpeg','',75000,'Solapur',2,27,'tofique4@gmail.com');
/*!40000 ALTER TABLE `adspost` ENABLE KEYS */;
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

-- Dump completed on 2022-11-13  9:56:51
