CREATE SCHEMA `ubs` ;

------------------------ Category/ Sub-category Table -------------------------------
  CREATE TABLE `category` (
  `cat_id` int NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(45) NOT NULL,
  `cat_subid` int DEFAULT '0',
  `cat_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



------------------------ Category default Values -------------------------------
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Property', '0');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Mobiles', '0');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Jobs', '0');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Bikes', '0');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Elections appliances ', '0');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Commercial vehicles & spare parts', '0');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Furniture', '0');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Fashion', '0');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Book, Sports & hobbies', '0');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Pets', '0');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Services', '0');


------------------------ Sub-category Default value -------------------------------
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('For Sale: Houses & Apartments', '1');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('For Rent: Houses & Apartments', '1');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Lands & Posts', '1');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('For Sale : Shops & Offices', '1');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('For Rent : Shops & Offices', '1');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('PG & Gueses', '1');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Sales & Marketing', '3');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('BPO & Telecaller', '3');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Driver', '3');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Office Assistant', '3');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Teacher', '3');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Cook', '3');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Motorcycles', '4');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Scooters', '4');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Spare Parts', '4');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Bicycles', '4');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('TVs, Video – Audio', '5');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Kitchen & Other Appliances', '5');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Computer Accessories', '5');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('ACs', '5');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Commercial & other Vehicles', '6');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Spare Parts', '6');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Sofa & Dining', '7');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Beds & Wardrobes', '7');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Home Décor & Garden', '7');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Kids Furniture', '7');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Other Household Items', '7');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Man', '8');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Woman', '8');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Kids', '8');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Books', '9');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Gym & Fitness', '9');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Musical Instruments', '9');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Sports Equipment', '9');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Other Hobbies', '9');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Fishes & Aquarium', '10');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Pet Food & Accessories', '10');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Dogs', '10');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Cats', '10');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Other Pets', '10');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Electronics & Computer', '11');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Education & Classes', '11');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Driver & Taxi', '11');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Health & Beauty', '11');
INSERT INTO `ubs`.`category` (`cat_name`, `cat_subid`) VALUES ('Other Services', '11');


------------------------ User Table -------------------------------

CREATE TABLE `user_info` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `uname` varchar(150) NOT NULL,
  `udesc` varchar(255) NOT NULL,
  `umob` varchar(45) NOT NULL,
  `uemail` varchar(45) NOT NULL,
  `uimg` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


------------------------ Add Post -------------------------------
CREATE TABLE `addpost` (
  `p_id` int NOT NULL AUTO_INCREMENT,
  `p_date` datetime NOT NULL,
  `p_title` varchar(255) NOT NULL,
  `p_price` varchar(45) DEFAULT NULL,
  `p_describe` varchar(550) DEFAULT NULL,
  `p_uid` varchar(45) NOT NULL,
  `p_imgcover` varchar(255) NOT NULL,
  `p_img2` varchar(255) DEFAULT NULL,
  `p_img3` varchar(255) DEFAULT NULL,
  `p_details` json DEFAULT NULL,
  `p_location` varchar(45) NOT NULL,
  `p_mcat` int NOT NULL,
  `p_scat` int NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



------------------------ Table Chats -------------------------------
CREATE TABLE `chats_info` (
  `chat_id` int NOT NULL AUTO_INCREMENT,
  `chat_date` datetime NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `user_from` int NOT NULL,
  `user_to` int NOT NULL,
  `chat_status` varchar(45) NOT NULL,
  PRIMARY KEY (`chat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


------------------------ post_status -------------------------------
CREATE TABLE `post_status` (
  `uid` int NOT NULL,
  `pid` int NOT NULL,
  `p_favorite` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- SELECT chats_info.user_from,user_info.uname FROM chats_info inner join user_info on chats_info.user_from=user_info.uid where (user_from = 1 or user_to = 1) group by chats_info.user_from,chats_info.user_touser_info.uname;