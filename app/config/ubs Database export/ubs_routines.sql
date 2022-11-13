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
-- Temporary view structure for view `ads_post_view`
--

DROP TABLE IF EXISTS `ads_post_view`;
/*!50001 DROP VIEW IF EXISTS `ads_post_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ads_post_view` AS SELECT 
 1 AS `p_id`,
 1 AS `p_date`,
 1 AS `p_title`,
 1 AS `p_brand`,
 1 AS `p_describe`,
 1 AS `p_img1`,
 1 AS `p_img2`,
 1 AS `p_img3`,
 1 AS `p_img4`,
 1 AS `p_img5`,
 1 AS `p_price`,
 1 AS `p_location`,
 1 AS `p_mcat`,
 1 AS `p_scat`,
 1 AS `p_uid`,
 1 AS `mainCat`,
 1 AS `subCat`,
 1 AS `userId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `keyword_search`
--

DROP TABLE IF EXISTS `keyword_search`;
/*!50001 DROP VIEW IF EXISTS `keyword_search`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `keyword_search` AS SELECT 
 1 AS `keyword`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `ads_post_view`
--

/*!50001 DROP VIEW IF EXISTS `ads_post_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ads_post_view` AS select `ads`.`p_id` AS `p_id`,`ads`.`p_date` AS `p_date`,`ads`.`p_title` AS `p_title`,`ads`.`p_brand` AS `p_brand`,`ads`.`p_describe` AS `p_describe`,`ads`.`p_img1` AS `p_img1`,`ads`.`p_img2` AS `p_img2`,`ads`.`p_img3` AS `p_img3`,`ads`.`p_img4` AS `p_img4`,`ads`.`p_img5` AS `p_img5`,`ads`.`p_price` AS `p_price`,`ads`.`p_location` AS `p_location`,`ads`.`p_mcat` AS `p_mcat`,`ads`.`p_scat` AS `p_scat`,`ads`.`p_uid` AS `p_uid`,`cat`.`cat_name` AS `mainCat`,`subcat`.`cat_name` AS `subCat`,`users`.`log_id` AS `userId` from (((`adspost` `ads` join `category` `cat` on((`ads`.`p_mcat` = `cat`.`cat_id`))) join `category` `subcat` on((`ads`.`p_scat` = `subcat`.`cat_id`))) join `users` on((`ads`.`p_uid` = `users`.`log_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `keyword_search`
--

/*!50001 DROP VIEW IF EXISTS `keyword_search`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `keyword_search` AS select `ul`.`keyword` AS `keyword` from (select `category`.`cat_name` AS `keyword` from `category` union all select `adspost`.`p_title` AS `keyword` from `adspost`) `ul` order by `ul`.`keyword` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping routines for database 'ubs'
--
/*!50003 DROP PROCEDURE IF EXISTS `all_favoriteList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `all_favoriteList`(IN uid varchar(50))
BEGIN
select ads.*,p.p_favorite,p.p_view  from 
(select a.*, us.u_name,us.u_photo from ubs.adspost as a 
join ubs.users as us on a.p_uid = us.log_id where a.p_uid <> uid) 
as ads left join 
(select * from ubs.post_reaction as b where b.uid= uid) as p on ads.p_id = p.pid where p.p_favorite = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_postDetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `get_postDetail`(IN uid varchar(50), In pid int)
BEGIN
Select podb.*, pr.p_favorite,pr.p_view from 
(select a.*, us.u_name,us.u_photo from ubs.adspost as a 
join ubs.users as us on a.p_uid = us.log_id where a.p_id = pid) as podb
left join
(select * from ubs.post_reaction where uid= uid) as pr on podb.p_id = pr.pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `my_sellAds` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `my_sellAds`(IN uid varchar(50))
BEGIN
select ads.*,p.p_favorite,p.p_view  from 
(select a.*, us.u_name,us.u_photo from ubs.adspost as a 
join ubs.users as us on a.p_uid = us.log_id where a.p_uid = uid) 
as ads left join 
(select pid,CAST(SUM(p_favorite) as SIGNED) as p_favorite,CAST(SUM(p_view) as SIGNED) as p_view from ubs.post_reaction group by pid) as p 
on ads.p_id = p.pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `related_ads` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `related_ads`(IN uid varchar(50) , IN mid int)
BEGIN
select ads.*,p.p_favorite,p.p_view  from 
(select a.*, us.u_name,us.u_photo from ubs.adspost as a 
join ubs.users as us on a.p_uid = us.log_id where a.p_uid <> uid and a.p_mcat = mid) 
as ads left join 
(select * from ubs.post_reaction as b where b.uid= uid) as p on ads.p_id = p.pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_recentAds` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `sp_recentAds`(IN uid varchar(50))
BEGIN
select ads.*,p.p_favorite,p.p_view  from 
(select a.*, us.u_name,us.u_photo from ubs.adspost as a 
join ubs.users as us on a.p_uid = us.log_id where a.p_uid <> uid) 
as ads left join 
(select * from ubs.post_reaction as b where b.uid= uid) as p on ads.p_id = p.pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_userAds` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `sp_userAds`(IN uid varchar(50),IN uid_reaction varchar(50))
BEGIN
select ads.*,p.p_favorite,p.p_view  from 
(select a.*, us.u_name,us.u_photo from ubs.adspost as a 
join ubs.users as us on a.p_uid = us.log_id where a.p_uid = uid) 
as ads left join 
(select * from ubs.post_reaction as b where b.uid= uid_reaction) as p on ads.p_id = p.pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-13  9:58:08
