CREATE SCHEMA `ubs`;

------------------------ Category/ Sub-category Table -------------------------------
CREATE TABLE `category` (
  `cat_id` int NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(45) NOT NULL,
  `cat_subid` int DEFAULT '0',
  `cat_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
);

------------------------ Type List Table -------------------------------
CREATE TABLE `ubs`.`type_list` (
  `ty_id` INT NOT NULL AUTO_INCREMENT,
  `ty_name` VARCHAR(45) NULL,
  `subcat_id` INT NULL,
  PRIMARY KEY (`ty_id`)
);

------------------------ Category default Values -------------------------------
INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('For Sale: Houses & Apartments', '1');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('For Rent: Houses & Apartments', '1');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Lands & Posts', '1');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('For Sale : Shops & Offices', '1');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('For Rent : Shops & Offices', '1');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('PG & Gueses', '1');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Mobile Phone', '2');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Accessories', '2');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Tablets', '2');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Sales & Marketing', '3');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('BPO & Telecaller', '3');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Driver', '3');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Office Assistant', '3');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Teacher', '3');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Cook', '3');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Motorcycles', '4');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Scooters', '4');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Spare Parts', '4');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Bicycles', '4');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('TVs, Video – Audio', '5');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Kitchen & Other Appliances', '5');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Computer Accessories', '5');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('ACs', '5');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Commercial & other Vehicles', '6');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Spare Parts', '6');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Sofa & Dining', '7');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Beds & Wardrobes', '7');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Home Décor & Garden', '7');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Kids Furniture', '7');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Other Household Items', '7');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Man', '8');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Woman', '8');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Kids', '8');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Books', '9');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Gym & Fitness', '9');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Musical Instruments', '9');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Sports Equipment', '9');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Other Hobbies', '9');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Fishes & Aquarium', '10');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Pet Food & Accessories', '10');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Dogs', '10');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Cats', '10');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Other Pets', '10');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Electronics & Computer', '11');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Education & Classes', '11');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Driver & Taxi', '11');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Health & Beauty', '11');

INSERT INTO
  `ubs`.`category` (`cat_name`, `cat_subid`)
VALUES
  ('Other Services', '11');

------------------------ User Table -------------------------------
CREATE TABLE `users` (
  `uid` INT NOT NULL AUTO_INCREMENT,
  `log_id` varchar(45) NOT NULL,
  `log_pass` varchar(45) NOT NULL,
  `u_name` varchar(45) NOT NULL,
  `u_about` varchar(300) DEFAULT NULL,
  `u_country` varchar(45) DEFAULT NULL,
  `u_phone` VARCHAR(12) NULL DEFAULT NULL,
  `u_email` varchar(70) DEFAULT NULL,
  `u_photo` varchar(255) DEFAULT NULL,
  `login_with` varchar(45) NOT NULL,
  PRIMARY KEY (`uid`)
);

------------------------ Add Post -------------------------------
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
);

------------------------ Table Chats -------------------------------
CREATE TABLE `chats_info` (
  `chat_id` int NOT NULL AUTO_INCREMENT,
  `chat_date` datetime NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `user_from` int NOT NULL,
  `user_to` int NOT NULL,
  `chat_status` varchar(45) NOT NULL,
  PRIMARY KEY (`chat_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

------------------------ post_reaction -------------------------------
CREATE TABLE `post_reaction` (
  `pr_id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) NOT NULL,
  `pid` int DEFAULT NULL,
  `p_favorite` int DEFAULT NULL,
  `p_view` int DEFAULT NULL,
  PRIMARY KEY (`pr_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- SELECT chats_info.user_from,user_info.uname FROM chats_info inner join user_info on chats_info.user_from=user_info.uid where (user_from = 1 or user_to = 1) group by chats_info.user_from,chats_info.user_touser_info.uname;
-- ******************************* Store Procedure ******************************* --
------- 1) list of recent Ads with user post reaction
DELIMITER $ $ CREATE DEFINER = `admin` @`%` PROCEDURE `sp_recentAds`(IN uid varchar(50)) BEGIN
select
  ads.*,
  p.p_favorite,
  p.p_view
from
  (
    select
      a.*,
      us.u_name,
      us.u_photo
    from
      ubs.adspost as a
      join ubs.users as us on a.p_uid = us.log_id
    where
      a.p_uid <> uid
  ) as ads
  left join (
    select
      *
    from
      ubs.post_reaction as b
    where
      b.uid = uid
  ) as p on ads.p_id = p.pid;

END $ $ DELIMITER;

--------------------------- 2)  for one post details with user post reaction
DELIMITER $ $ CREATE DEFINER = `admin` @`%` PROCEDURE `get_postDetail`(IN uid varchar(50), In pid int) BEGIN
Select
  podb.*,
  pr.p_favorite,
  pr.p_view
from
  (
    select
      a.*,
      us.u_name,
      us.u_photo
    from
      ubs.adspost as a
      join ubs.users as us on a.p_uid = us.log_id
    where
      a.p_id = pid
  ) as podb
  left join (
    select
      *
    from
      ubs.post_reaction as post_r
    where
      post_r.uid = uid
      and post_r.pid = pid
  ) as pr on podb.p_id = pr.pid;

END $ $ DELIMITER;

---------------------------- 3) related ads list --------------------------
DELIMITER $ $ CREATE DEFINER = `admin` @`%` PROCEDURE `related_ads`(IN uid varchar(50), IN mid int) BEGIN
select
  ads.*,
  p.p_favorite,
  p.p_view
from
  (
    select
      a.*,
      us.u_name,
      us.u_photo
    from
      ubs.adspost as a
      join ubs.users as us on a.p_uid = us.log_id
    where
      a.p_uid <> uid
      and a.p_mcat = mid
  ) as ads
  left join (
    select
      *
    from
      ubs.post_reaction as b
    where
      b.uid = uid
  ) as p on ads.p_id = p.pid;

END $ $ DELIMITER;

----------------------- 4) get all favorites -------------------------
DELIMITER $ $ CREATE DEFINER = `admin` @`%` PROCEDURE `all_favoriteList`(IN uid varchar(50)) BEGIN
select
  ads.*,
  p.p_favorite,
  p.p_view
from
  (
    select
      a.*,
      us.u_name,
      us.u_photo
    from
      ubs.adspost as a
      join ubs.users as us on a.p_uid = us.log_id
    where
      a.p_uid <> uid
  ) as ads
  left join (
    select
      *
    from
      ubs.post_reaction as b
    where
      b.uid = uid
  ) as p on ads.p_id = p.pid
where
  p.p_favorite = 1;

END $ $ DELIMITER;

-------------------------- 5) get user profile ads ----------------------
DELIMITER $ $ CREATE DEFINER = `admin` @`%` PROCEDURE `sp_userAds`(IN uid varchar(50), IN uid_reaction varchar(50)) BEGIN
select
  ads.*,
  p.p_favorite,
  p.p_view
from
  (
    select
      a.*,
      us.u_name,
      us.u_photo
    from
      ubs.adspost as a
      join ubs.users as us on a.p_uid = us.log_id
    where
      a.p_uid = uid
  ) as ads
  left join (
    select
      *
    from
      ubs.post_reaction as b
    where
      b.uid = uid_reaction
  ) as p on ads.p_id = p.pid;

END $ $ DELIMITER;

-------------------------- 6) get user Selling ads ----------------------
DELIMITER $ $ CREATE DEFINER = `admin` @`%` PROCEDURE `my_sellAds`(IN uid varchar(50)) BEGIN
select
  ads.*,
  p.p_favorite,
  p.p_view
from
  (
    select
      a.*,
      us.u_name,
      us.u_photo
    from
      ubs.adspost as a
      join ubs.users as us on a.p_uid = us.log_id
    where
      a.p_uid = uid
  ) as ads
  left join (
    select
      pid,
      CAST(SUM(p_favorite) as SIGNED) as p_favorite,
      CAST(SUM(p_view) as SIGNED) as p_view
    from
      ubs.post_reaction
    group by
      pid
  ) as p on ads.p_id = p.pid;

END $ $ DELIMITER;

-------------------------- 7) Get Chats Room details  ----------------------
CREATE DEFINER = `root` @`localhost` PROCEDURE `chat_room_details`(IN uid varchar(50), In pid int) BEGIN
Select
  *,
  null as lastMag,
  null as postType
from
  (
    select
      ads.p_id as pId,
      ads.p_title as pTitle,
      ads.p_price as pPrice,
      ads.p_img1 as pImage
    from
      ubs.adspost as ads
    where
      ads.p_id = pid
  ) as postdb
  join (
    select
      us.log_id as userId,
      us.u_name as userName,
      us.u_photo as userPhoto
    from
      ubs.users as us
    where
      us.log_id = uid
  ) as pr;

END --********************************** viewa*******************************
------------------------------------- 1) Ads Post View -------------------------
CREATE ALGORITHM = UNDEFINED DEFINER = `admin` @`%` SQL SECURITY DEFINER VIEW `ads_post_view` AS
select
  `ads`.`p_id` AS `p_id`,
  `ads`.`p_date` AS `p_date`,
  `ads`.`p_title` AS `p_title`,
  `ads`.`p_brand` AS `p_brand`,
  `ads`.`p_describe` AS `p_describe`,
  `ads`.`p_img1` AS `p_img1`,
  `ads`.`p_img2` AS `p_img2`,
  `ads`.`p_img3` AS `p_img3`,
  `ads`.`p_img4` AS `p_img4`,
  `ads`.`p_img5` AS `p_img5`,
  `ads`.`p_price` AS `p_price`,
  `ads`.`p_location` AS `p_location`,
  `ads`.`p_mcat` AS `p_mcat`,
  `ads`.`p_scat` AS `p_scat`,
  `ads`.`p_uid` AS `p_uid`,
  `cat`.`cat_name` AS `mainCat`,
  `subcat`.`cat_name` AS `subCat`,
  `users`.`log_id` AS `userId`
from
  (
    (
      (
        `adspost` `ads`
        join `category` `cat` on((`ads`.`p_mcat` = `cat`.`cat_id`))
      )
      join `category` `subcat` on((`ads`.`p_scat` = `subcat`.`cat_id`))
    )
    join `users` on((`ads`.`p_uid` = `users`.`log_id`))
  );

------------------------------------- 2) Keyword Search ---------------------------------
CREATE ALGORITHM = UNDEFINED DEFINER = `admin` @`%` SQL SECURITY DEFINER VIEW `keyword_search` AS
select
  `ul`.`keyword` AS `keyword`
from
  (
    select
      `category`.`cat_name` AS `keyword`
    from
      `category`
    union
    all
    select
      `adspost`.`p_title` AS `keyword`
    from
      `adspost`
  ) `ul`
order by
  `ul`.`keyword`;