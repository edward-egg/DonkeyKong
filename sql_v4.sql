-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: donkeykong
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `email` varchar(100) NOT NULL,
  `regist_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','21232f297a57a5a743894a0e4a801fc3','980639151@qq.com','2018-05-28 15:03:48','2018-05-28 15:03:53');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areas` (
  `area_id` varchar(64) NOT NULL,
  `area_name` varchar(1000) NOT NULL,
  `area_img` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`area_id`),
  UNIQUE KEY `area_id_UNIQUE` (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES ('050a6e78c8684bc585f64c9b1b48af7c','Zhejiang',''),('08e3ee5fcda248af8eac06f69018a305','Shandong',''),('81bed5b679fa49c0b042e2bdeb53fbd5','Sichuan',''),('86feeaafc2b143349e1cd152738d7347','Yunnan',''),('cd6d16d0b4e84518b6b85bcc2911f3a0','Guangdong','');
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `donkeykong`.`areas_AFTER_UPDATE` AFTER UPDATE ON `areas` FOR EACH ROW
BEGIN
UPDATE food_store SET `area_id`=new.area_id WHERE `area_id`=old.area_id;
UPDATE hotel SET `area_id`=new.area_id WHERE `area_id`=old.area_id;
UPDATE scenic SET `area_id`=new.area_id WHERE `area_id`=old.area_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `donkeykong`.`area_AFTER_DELETE` AFTER DELETE ON `areas` FOR EACH ROW
BEGIN
delete from food_store where area_id = old.area_id;
delete from hotel where area_id = old.area_id;
delete from scenic where area_id = old.area_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `food_store`
--

DROP TABLE IF EXISTS `food_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_store` (
  `food_store_id` varchar(64) NOT NULL,
  `food_store_name` varchar(255) NOT NULL,
  `avg_price` double(10,2) NOT NULL,
  `area_id` varchar(64) NOT NULL,
  `store_address` text NOT NULL,
  `liked` int(10) DEFAULT NULL,
  `store_img` varchar(100) DEFAULT NULL,
  `store_content` text,
  PRIMARY KEY (`food_store_id`),
  KEY `fsa__fk_idx` (`area_id`),
  CONSTRAINT `fsa__fk` FOREIGN KEY (`area_id`) REFERENCES `areas` (`area_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_store`
--

LOCK TABLES `food_store` WRITE;
/*!40000 ALTER TABLE `food_store` DISABLE KEYS */;
INSERT INTO `food_store` VALUES ('0726a1cbb0af405cb257dd93308ca223','YanXiaoGuan',135.00,'08e3ee5fcda248af8eac06f69018a305','A, block A, No. 18, Hongkong Road, Middle Road, Qingdao',0,NULL,NULL),('17503f918a52409fbdc04e26246ef83b','ChaoXiangSiHai',86.00,'cd6d16d0b4e84518b6b85bcc2911f3a0','No. 105, No. 106 Nan Hai Mansion, No. 1110 Nanshan Road, Nanshan District (line 11, south mountain station, D exit, right rear, 300 meters, next to Zhongyou building)',0,NULL,NULL),('2384028ed738479ba5eba72c79675aff','BaoRongYuGuan',94.00,'050a6e78c8684bc585f64c9b1b48af7c','Qiandao Lake scenic area fishing port bridge and Cultural Park intersection No. 54-10 Meng Gu Road',0,NULL,NULL),('28e4409ddf464cb08c9fccb782b76732','QiuJiSiFangCai',77.00,'050a6e78c8684bc585f64c9b1b48af7c','305--307, South Street, Wuzhen (South Gate old street, Wuzhen bridge, Hedong step bridge 100 meters south)',0,NULL,NULL),('3d7bcf2fda1c43e89fb9bf78b017794c','QiZhangZhuo',77.00,'050a6e78c8684bc585f64c9b1b48af7c','No. 11, North Gate Street, Jiashan County, Jiaxing, Zhejiang',0,NULL,NULL),('4ece66c5d7874b87959aa0029ff50b55','SiJiaXiaoChuFang',91.00,'050a6e78c8684bc585f64c9b1b48af7c','Room 101, room 101, room No. 82, Shanxi mountain, Putuo, Putuo',0,NULL,NULL),('513cad0449ac46ecb1ad0fd6e4531410','JingXiangYuJiaLe',83.00,'08e3ee5fcda248af8eac06f69018a305','No. 333, tsuankou village, Penglai, Penglai (north of Xinghai Road)',0,NULL,NULL),('7384c98dd0cb4ca28a5a6d2581d9bb35','JianBingJuanDaCong',51.00,'08e3ee5fcda248af8eac06f69018a305','Tai\'an Taishan Avenue Veterans Hospital West (Taishan Long Li supermarket next to)',0,NULL,NULL),('790db319fc074754bc0377e46e902ff2','FangZhouPanZi',97.00,'86feeaafc2b143349e1cd152738d7347','No. 498, lower section of Renmin Road, Dali (east corner of Yujie street and southwest corner of Renmin Road)',0,NULL,NULL),('92c46c89fe664878880ec7fa75a2e474','YunXueLi',94.00,'86feeaafc2b143349e1cd152738d7347','No. 95, 71 street, Xingwen lane, 71 street in the ancient city area of the city',0,NULL,NULL),('98999fd3bb994632baf0177cf8eb47c1','ZhuRouPO',213.00,'cd6d16d0b4e84518b6b85bcc2911f3a0','No. 31, fine cellar exhibition hall, Shunde District, Foshan (beside Guangxi high school)',0,NULL,NULL),('ae8cbc20796f48719a61fd6b4db7a220','LuChengWangShi',63.00,'08e3ee5fcda248af8eac06f69018a305','Qufu tourist center on the west side of the hospital',0,NULL,NULL),('b8aad16f5ea94042a743ea3d8f395b36','JinYueXuanHai',175.00,'cd6d16d0b4e84518b6b85bcc2911f3a0','1-3 floor, B District, 265, South China Commercial Plaza, No. 1-3 lovers\' South Road, Xiangzhou District, Zhuhai',0,NULL,NULL),('ba1b75c70d244aff95bab78d2a2f3e2d','MaWangZi',99.00,'81bed5b679fa49c0b042e2bdeb53fbd5','No. 1, East chaff street, Chunxi Road, Jinjiang District, Chengdu',0,NULL,NULL),('c46d9d4db4264e9dad27b469909a5021','YunHaiYao',92.00,'86feeaafc2b143349e1cd152738d7347','No. 88, south strong street and lanes of Wuhua District, Kunming',0,NULL,NULL),('d7838b10c2a044258fbca1e5104b78d2','HaiDiLao',114.00,'81bed5b679fa49c0b042e2bdeb53fbd5','No. 5, No. 5, Hao Hao Plaza, No. 998, Jiannan Avenue, Wuhou District high tech Zone, Chengdu, C507',0,NULL,NULL),('ec6a5f5897f14c8399f348c1b946ccf4','XiaoBingSheng',77.00,'cd6d16d0b4e84518b6b85bcc2911f3a0','No. 168, No. 168, Beijing Road, Beijing, Yuexiu District, Guangdong sea, Yang Zhong Hui, six layer B605',0,NULL,NULL),('ecf78fdb41714c92a0a5eee7823f0a2b','XinCaoTangGuoWuLiaoLi',154.00,'08e3ee5fcda248af8eac06f69018a305','6 layers of West Wing of Heng Long square, No. 188, Quancheng Road, Ji\'nan',0,NULL,NULL),('fd0c57cd45e143889ceb42ba1e0fda58','HangZhouJiuJia',89.00,'050a6e78c8684bc585f64c9b1b48af7c','1-3 floor, 205 Yanan Road, Hangzhou (Yanan Road Post Office junction)',0,NULL,NULL),('ff54d3604cc544709be07e210fa4a43f','ChengDuChiKe',80.00,'81bed5b679fa49c0b042e2bdeb53fbd5','No. 8, quay Tower Street, Chengdu',0,NULL,NULL);
/*!40000 ALTER TABLE `food_store` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `donkeykong`.`food_store_AFTER_DELETE` AFTER DELETE ON `food_store` FOR EACH ROW
BEGIN
delete from food_store_comment where food_store_id = old.food_store_id;
delete from report where food_id = old.food_store_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `food_store_comment`
--

DROP TABLE IF EXISTS `food_store_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_store_comment` (
  `store_comment_id` varchar(64) NOT NULL,
  `food_store_id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `comment_content` varchar(200) NOT NULL,
  `comment_time` datetime NOT NULL,
  PRIMARY KEY (`store_comment_id`),
  KEY `fst_fk_idx` (`food_store_id`),
  KEY `fcu_fk_idx` (`user_id`),
  CONSTRAINT `fcu_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fst_fk` FOREIGN KEY (`food_store_id`) REFERENCES `food_store` (`food_store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_store_comment`
--

LOCK TABLES `food_store_comment` WRITE;
/*!40000 ALTER TABLE `food_store_comment` DISABLE KEYS */;
INSERT INTO `food_store_comment` VALUES ('36c21c96442548c3bc5f1a8403daa49a','0726a1cbb0af405cb257dd93308ca223','jason_wu','中文测试','2018-06-14 13:21:47'),('d3dd7829f02742cfbb1a1bfd12ef3143','0726a1cbb0af405cb257dd93308ca223','jason_wu','test','2018-06-15 08:04:44');
/*!40000 ALTER TABLE `food_store_comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `donkeykong`.`food_store_comment_AFTER_DELETE` AFTER DELETE ON `food_store_comment` FOR EACH ROW
BEGIN
delete from report where food_comment_id = old.store_comment_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel` (
  `hotel_id` varchar(64) NOT NULL,
  `hotel_name` varchar(255) NOT NULL,
  `area_id` varchar(64) NOT NULL,
  `hotel_address` text NOT NULL,
  `hotel_like` int(255) DEFAULT NULL,
  `hotel_comment` varchar(100) DEFAULT NULL,
  `is_reserve` int(5) NOT NULL,
  `hotel_img` longblob,
  `hotel_content` text,
  PRIMARY KEY (`hotel_id`),
  KEY `ha_fk_idx` (`area_id`),
  CONSTRAINT `ha_fk` FOREIGN KEY (`area_id`) REFERENCES `areas` (`area_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES ('0c013828e9444745a3ac77e57c0ab38a','XingYuan','050a6e78c8684bc585f64c9b1b48af7c','Zhoushan Putuo District Putuo Shanxi mountain two district 10 buildings, 4 buildings, near Financial Street.',0,NULL,0,NULL,NULL),('0ef542fb74764dbcaa08442ef3edfc77','FaGe','cd6d16d0b4e84518b6b85bcc2911f3a0','Twelve floor, Wan Yi square, 12 overseas Chinese road, Yuexiu District, Yuexiu District, Guangzhou, China',0,NULL,0,NULL,NULL),('11cfbb722b5a4d25b52a6849335ed104','JiuShuiShuYuan','08e3ee5fcda248af8eac06f69018a305','Qingdao Laoshan District North residence Street View Lao community north nine water scenic area',0,NULL,0,NULL,NULL),('1fa870a87fca4cb99dff453f2eb4b8ea','WenHua','050a6e78c8684bc585f64c9b1b48af7c','No. 38, Wen two road, Xihu District, Hangzhou, near Mogan Shan Road, metro line two (Shentang Bridge Station) near B exit.',0,NULL,0,NULL,NULL),('274e5755fd8b46ff9fc7f71fddf7d05d','AiJinRong','86feeaafc2b143349e1cd152738d7347','Old Town of Lijiang District Shuhe ancient town Dongkang village six group 15, near Sifang street.',0,NULL,0,NULL,NULL),('4f16c8ea66d944929303494a2664690c','LongTingKaiYuan','050a6e78c8684bc585f64c9b1b48af7c','1 South Ring Road, near Qiandao Lake square, Chunan.',0,NULL,0,NULL,NULL),('54de8618fced44a4b4630766b3e7495d','HanTing','08e3ee5fcda248af8eac06f69018a305','No. 162 Luyuan street, Lixia District, Ji\'nan (opposite to Baotu Spring South Gate)',0,NULL,0,NULL,NULL),('61568d6e8a9f4e478e318a936e5664da','EmeiShan Hotel','81bed5b679fa49c0b042e2bdeb53fbd5','322 scenic road, Mount Emei, Leshan',0,NULL,0,NULL,NULL),('6b229e88c5694d45b7ae4f8c049670ee','YuLongYueGuang','86feeaafc2b143349e1cd152738d7347','Six group 5 of Yuhu village, the village committee of ERON jade lake in Lijiang',0,NULL,0,NULL,NULL),('7fb8a708e8e74060bf14c39e98c25c3f','QueLi','08e3ee5fcda248af8eac06f69018a305','No. 1 que street, Qufu',0,NULL,0,NULL,NULL),('8be0ac131a5745a091ae162a7b39d85b','HongYanHaiJing','86feeaafc2b143349e1cd152738d7347','E1, Dali, shaguan Town, ManJiang District, Shing House Hill Golden Coast Manor',0,NULL,0,NULL,NULL),('973b36220c324043b17c7d6cb0125c4e','QianHe','81bed5b679fa49c0b042e2bdeb53fbd5','Aba Tibetan and Qiang Autonomous Prefecture, Jiuzhaigou zhangzha Zhenlong Kang Town Fire dam',0,NULL,0,NULL,NULL),('a527890f9ce54a86afca7b3bd37c8909','BaiYunJu','08e3ee5fcda248af8eac06f69018a305','The eastern part of Taishan Ding Ding Tian Jie street, Taishan District, Tai\'an, is near the top of Tai mountain.',0,NULL,0,NULL,NULL),('bda26720af434c5bbf07067d68dbd911','JinPeng','cd6d16d0b4e84518b6b85bcc2911f3a0','Jinpeng Commercial Plaza, 252 people\'s road, Longhua street, Longhua District, Shenzhen, opposite to Longhua\'s land tax.',0,NULL,0,NULL,NULL),('c94fe7b802b744d89291545bd3005a82','GreenTree Inn','08e3ee5fcda248af8eac06f69018a305','No. 7, Hai Shi Road, Penglai, near three fairy hill, Ou Le Bao.',0,NULL,0,NULL,NULL),('cc470f7458744430b9f8f6e69924fe96','Shilin mountain villa','86feeaafc2b143349e1cd152738d7347','Shilin Yi Autonomous County, Kunming City, Yunnan Province',0,NULL,0,NULL,NULL),('d269f5eeefac4e9896489b4bc61d5cf3','JiangYe','86feeaafc2b143349e1cd152738d7347','Kunming Xishan District Gate Road 16-2 yuan (Dianchi resort area)',0,NULL,0,NULL,NULL),('ee2ef53280054a9ca5cb267fbfc0ecac','DuZi','81bed5b679fa49c0b042e2bdeb53fbd5','No. 123, Wuhou Temple street, Wuhou District, Chengdu, Chengdu, No. 9, No. 20 (Sichuan traffic department diagonally opposite, facing 20 meters on the right side of Jinli Street)',0,NULL,0,NULL,NULL),('efa254d6f8e84f14809814a7770927f7','BiGuiHuaCheng','cd6d16d0b4e84518b6b85bcc2911f3a0','Foshan Shunde District Chen Cun town Chen Chen bridge side, near Chen Village Flower world, South China Sea Road South passes Buddha Chen bridge, Foshan third middle, Vanke Crystal City.',0,NULL,0,NULL,NULL),('f75ec054fdf94b878120898034310a6e','LinJiaBieYuan','050a6e78c8684bc585f64c9b1b48af7c','No. 78-80, Chang Xin Street, Wuzhen, Tongxiang, near North Huaqiao.',0,NULL,0,NULL,NULL),('fc9fcb632190404387dd67a3d21e59b8','LiJingYuan','050a6e78c8684bc585f64c9b1b48af7c','No. 3, Sujia lane, Jiashan County, Jiaxing',0,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `donkeykong`.`hotel_AFTER_INSERT` AFTER INSERT ON `hotel` FOR EACH ROW
BEGIN
update hotel_room set `hotel_id` = new.hotel_id where `hotel_id` = old.hotel.id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `donkeykong`.`hotel_AFTER_DELETE` AFTER DELETE ON `hotel` FOR EACH ROW
BEGIN
delete from hotel_book where hotel_id = old.hotel_id;
delete from hotel_room where hotel_id = old.hotel_id;
delete from hotel_comment where hotel_id = old.hotel_id;
delete from report where hotel_id = old.hotel_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `hotel_book`
--

DROP TABLE IF EXISTS `hotel_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_book` (
  `book_id` varchar(64) NOT NULL,
  `hotel_id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `room_id` varchar(64) NOT NULL,
  `check_in_time` datetime NOT NULL,
  `check_out_time` datetime NOT NULL,
  PRIMARY KEY (`book_id`),
  KEY `bkh_fk_idx` (`hotel_id`),
  KEY `bkr_fk_idx` (`room_id`),
  KEY `bku_fk_idx` (`user_id`),
  KEY `bkuser_fk_idx` (`user_id`),
  CONSTRAINT `bkh_fk` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bkr_fk` FOREIGN KEY (`room_id`) REFERENCES `hotel_room` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bku_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_book`
--

LOCK TABLES `hotel_book` WRITE;
/*!40000 ALTER TABLE `hotel_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotel_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_comment`
--

DROP TABLE IF EXISTS `hotel_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_comment` (
  `hotel_comment_id` varchar(64) NOT NULL,
  `hotel_id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `comment_content` varchar(200) NOT NULL,
  `comment_time` datetime NOT NULL,
  PRIMARY KEY (`hotel_comment_id`),
  KEY `hc_fk_idx` (`hotel_id`),
  KEY `hcu_fk_idx` (`user_id`),
  CONSTRAINT `hc_fk` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hcu_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_comment`
--

LOCK TABLES `hotel_comment` WRITE;
/*!40000 ALTER TABLE `hotel_comment` DISABLE KEYS */;
INSERT INTO `hotel_comment` VALUES ('44616439359d4476b1d161a424d738c1','0ef542fb74764dbcaa08442ef3edfc77','jason_wu','test','2018-06-15 08:50:52'),('e956eaa340404823a33bf6109a0340fe','0c013828e9444745a3ac77e57c0ab38a','jason_wu','中文测试','2018-06-14 13:24:32'),('f5abdc5b0e24413a9ed030fffa0d79ae','0c013828e9444745a3ac77e57c0ab38a','jason_wu','test','2018-06-15 08:06:24');
/*!40000 ALTER TABLE `hotel_comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `donkeykong`.`hotel_comment_AFTER_DELETE` AFTER DELETE ON `hotel_comment` FOR EACH ROW
BEGIN
delete from report where hotel_comment_id = old.hotel_comment_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `hotel_room`
--

DROP TABLE IF EXISTS `hotel_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_room` (
  `room_id` varchar(64) NOT NULL COMMENT '房间id',
  `hotel_id` varchar(64) NOT NULL COMMENT '酒店id',
  `room_num` varchar(20) NOT NULL COMMENT '房间号',
  `room_type` varchar(20) NOT NULL COMMENT '房间类型',
  `room_price` double(10,2) NOT NULL COMMENT '价格',
  `is_use` int(4) NOT NULL COMMENT '是否可用',
  PRIMARY KEY (`room_id`),
  KEY `rh_fk_idx` (`hotel_id`),
  CONSTRAINT `rh_fk` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_room`
--

LOCK TABLES `hotel_room` WRITE;
/*!40000 ALTER TABLE `hotel_room` DISABLE KEYS */;
INSERT INTO `hotel_room` VALUES ('079d8be01d844f4680da19f6bac5b89d','bda26720af434c5bbf07067d68dbd911','B02','Janpan',348.00,0),('098c005b05894e64bae8e89e5d52ca52','8be0ac131a5745a091ae162a7b39d85b','C03','luxury',428.00,0),('0fa851fa4a634731b06562d27b681e1b','4f16c8ea66d944929303494a2664690c','B02','double',336.00,0),('1b937005666049a78c4a1571508d0ed0','6b229e88c5694d45b7ae4f8c049670ee','B02','suite',461.00,0),('1ff69aac30a143c7bd8b6140d61ae48e','d269f5eeefac4e9896489b4bc61d5cf3','B02','double',194.00,0),('2143d53ab0bd46fa994ca712bbbdace6','4f16c8ea66d944929303494a2664690c','C03','senior',436.00,0),('22149da31ba64a19bdb1376acad44d0e','f75ec054fdf94b878120898034310a6e','C03','European',131.00,0),('287998fdb2964cd8929455d3702bae60','cc470f7458744430b9f8f6e69924fe96','A01','normal',158.00,0),('2c59146d0e224dce968aed5c8c5cbe69','efa254d6f8e84f14809814a7770927f7','B02','garden',347.00,0),('2dd6b8fb0af845ef8dfd0581d6971bf2','c94fe7b802b744d89291545bd3005a82','B02','trio',157.00,0),('388f0ef2217c4db2b44bf1120ab6bc44','c94fe7b802b744d89291545bd3005a82','D05','marriage',529.00,0),('3bdebffd867241758f3e36aa0d888cd9','a527890f9ce54a86afca7b3bd37c8909','C03','quad',980.00,0),('3d0fa4c7e1814558a5e084adad79a2e2','bda26720af434c5bbf07067d68dbd911','A01','normal',242.00,0),('3d52eb3c2f4a4fdf87a099fba52b2b97','274e5755fd8b46ff9fc7f71fddf7d05d','C03','aesthetical',398.00,0),('4b71019bf2634977be40227a96cf1e0e','54de8618fced44a4b4630766b3e7495d','A01','normal',245.00,0),('4d87d89565a24b11974cefcaf5a3d340','efa254d6f8e84f14809814a7770927f7','C03','luxury',497.00,0),('51a7c6ee13294dc68667d99a59f912a6','0c013828e9444745a3ac77e57c0ab38a','B02','double',389.00,0),('52f94097d2c34827b6600af1770d44b9','0ef542fb74764dbcaa08442ef3edfc77','A01','normal',386.00,0),('537f9ea1e7cc4e6cbc51410b4268034c','973b36220c324043b17c7d6cb0125c4e','B02','luxury',256.00,0),('5581f0e7c8d746459a957a103b2f826e','973b36220c324043b17c7d6cb0125c4e','A01','normal',257.00,0),('589114e7ec0a4e269088eb540fd1f1dd','0c013828e9444745a3ac77e57c0ab38a','C03','family',447.00,0),('5ad58b235ff74b22834c7e7c2173cbd6','f75ec054fdf94b878120898034310a6e','D04','Tatami',136.00,0),('5fc4352a6cc54832aa42f06b144a443f','a527890f9ce54a86afca7b3bd37c8909','B02','trio',660.00,0),('602f50872de343568756c1b47c05057e','c94fe7b802b744d89291545bd3005a82','A01','normal',118.00,0),('683e08a15b334e60b2ed1e2818eb76cb','a527890f9ce54a86afca7b3bd37c8909','A01','normal',560.00,0),('6ca384354d844965ae33c2edda64f512','ee2ef53280054a9ca5cb267fbfc0ecac','B02','double',248.00,0),('71b7d0e21fb042a9a201535c8fd09d99','d269f5eeefac4e9896489b4bc61d5cf3','D04','luxury family',294.00,0),('7fdc603b4c3c465c8b71bc7dfcc97d12','4f16c8ea66d944929303494a2664690c','D04','luxury',538.00,0),('7fea5f42d02f4054923fd90b16fbf222','274e5755fd8b46ff9fc7f71fddf7d05d','B02','luxury',358.00,0),('80734b6fe5594efa8d3c5c1c347bd625','54de8618fced44a4b4630766b3e7495d','C03','family',303.00,0),('8387bceac3354cafbd4ba90492f5bfef','fc9fcb632190404387dd67a3d21e59b8','A01','normal',208.00,0),('8d49c42c29c2408c810df09caee38278','4f16c8ea66d944929303494a2664690c','A01','normal',346.00,0),('8eb78d7ac1ea46a990e9bb1b7f67ee79','274e5755fd8b46ff9fc7f71fddf7d05d','A01','normal',298.00,0),('9ad0c32fe5bf462fbda59448f7227269','7fb8a708e8e74060bf14c39e98c25c3f','B02','business',488.00,0),('9c29c0ea9ba64e7694e7197e4fd4629d','c94fe7b802b744d89291545bd3005a82','C03','luxury',255.00,0),('9c5cde8700f64fcd86867adbf5b11620','54de8618fced44a4b4630766b3e7495d','B02','double',284.00,0),('9d551a3bcee844f99c57b96103716c6b','11cfbb722b5a4d25b52a6849335ed104','B02','family',480.00,0),('9fe71a40b7cb40aba1d1f5fc3201b11d','cc470f7458744430b9f8f6e69924fe96','E06','super luxury',410.00,0),('a1986398a93d4c27bbf2d062c73240b0','11cfbb722b5a4d25b52a6849335ed104','A01','normal',380.00,0),('a316be5f1de945d29e2eb9416d0c735f','d269f5eeefac4e9896489b4bc61d5cf3','C03','luxury',263.00,0),('a5aaad5626f24312bdfb71062ef25fcc','8be0ac131a5745a091ae162a7b39d85b','A01','normal',338.00,0),('aabe8160002142f988ed40f6020b503a','f75ec054fdf94b878120898034310a6e','B02','circular bed',112.00,0),('b22ded5198c44b47b28b99f95709586b','ee2ef53280054a9ca5cb267fbfc0ecac','A01','normal',183.00,0),('b271ebd408564330b991f3af1fecfc31','cc470f7458744430b9f8f6e69924fe96','B02','luxury',188.00,0),('b7674d614d24490f80d3fceeb10c2835','cc470f7458744430b9f8f6e69924fe96','C03','more luxury',228.00,0),('c00a2db0d0d643f280b85782cb50c052','61568d6e8a9f4e478e318a936e5664da','A01','normal',219.00,0),('c01be4648d1d407a8de274d357c637ea','6b229e88c5694d45b7ae4f8c049670ee','A01','normal',330.00,0),('c2fea8569b914d29ad1971894179d423','1fa870a87fca4cb99dff453f2eb4b8ea','B02','double',357.00,0),('c30b00a139174241b6a7c49ccb0ae888','fc9fcb632190404387dd67a3d21e59b8','D04','by the river',580.00,0),('cd9770c7c2ab42d6a43d22e1a0285274','fc9fcb632190404387dd67a3d21e59b8','B02','double',227.00,0),('ce772c3bdaf240a7b34485c0a8bef911','11cfbb722b5a4d25b52a6849335ed104','C03','quad',561.00,0),('ce91b822b7344a338fd50272c17c0fd0','1fa870a87fca4cb99dff453f2eb4b8ea','C03','senior',496.00,0),('d01b86c500b647fcb6d7a7608c7876a3','7fb8a708e8e74060bf14c39e98c25c3f','A01','normal',345.00,0),('d0808a1be0544d9085b381d359fb4962','cc470f7458744430b9f8f6e69924fe96','D04','very luxury',359.00,0),('ddd624b9e39c450592a3a964c6210694','efa254d6f8e84f14809814a7770927f7','A01','normal',246.00,0),('dff81d0db03d401e96e5eff75759b009','0ef542fb74764dbcaa08442ef3edfc77','B02','double',426.00,0),('e5268ad088e54b3c9be6795451f5fd83','8be0ac131a5745a091ae162a7b39d85b','B02','lover',399.00,0),('e612f150a49c4af3b0efb02f9370e822','f75ec054fdf94b878120898034310a6e','A01','normal',84.00,0),('ea785c16edde4184b6229006b022bab6','7fb8a708e8e74060bf14c39e98c25c3f','C03','luxury',880.00,0),('ee494d555f4b4ab38414e9a29b4d55de','1fa870a87fca4cb99dff453f2eb4b8ea','A01','normal',296.00,0),('ef18254695e94f91a3bb472353e39344','fc9fcb632190404387dd67a3d21e59b8','C03','courtyard',300.00,0),('f15b02c8effb410d836001e134073815','274e5755fd8b46ff9fc7f71fddf7d05d','D04','luxury',446.00,0),('f5b5116351ab471eab50928d2d1e4492','0c013828e9444745a3ac77e57c0ab38a','A01','normal',287.00,0),('f670f47d21f94e79b591fd0efa19fe9f','8be0ac131a5745a091ae162a7b39d85b','D04','Open sea view',698.00,0),('f697da24464f48d19eb0b5226e788c98','bda26720af434c5bbf07067d68dbd911','C03','British',372.00,0),('fe2c6937213c432cbe8cf4d8b71f43b5','d269f5eeefac4e9896489b4bc61d5cf3','A01','normal',155.00,0);
/*!40000 ALTER TABLE `hotel_room` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `donkeykong`.`hotel_room_AFTER_DELETE` AFTER DELETE ON `hotel_room` FOR EACH ROW
BEGIN
delete from hotel_book where room_id = old.room_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note` (
  `note_id` varchar(64) NOT NULL,
  `note_title` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `note_like` int(255) DEFAULT NULL,
  `report` int(10) DEFAULT NULL,
  `note_content` longtext,
  `publish_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`note_id`),
  KEY `nu_fk_idx` (`user_id`),
  CONSTRAINT `nu_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
INSERT INTO `note` VALUES ('02e74f6a29774449956b78be3047d07d','中文测试==','jason_wu',270,NULL,'中文测试~~','2018-06-14 13:31:41','2018-06-14 13:31:41'),('05085597c230415da96016fab94e0622','awdfasdf','Edward',0,NULL,'asdfasdfasdf','2018-06-13 22:54:23','2018-06-13 22:54:23'),('0597629e50a344f2bbbb6c5ba93ad451','asdfasfasdfasdf','jason_wu',0,NULL,'asdfasdfasfasdfasdfasdfasdf','2018-06-07 22:55:33','2018-06-07 22:55:33'),('4e91b613da124a27a10ae092cbfe12fd','tesdsdfasdf','Edward',0,NULL,'asdfasdf','2018-06-13 22:57:29','2018-06-13 22:57:29'),('asdfasdfasfasfasdfasdfasfasdf','ddddd','Edward',4,NULL,'asdfasf','2018-06-02 21:57:53','2018-06-02 21:57:53'),('n01','testNote','jason_wu',1,NULL,'sdfasdfasfasdfasdfasddf','2018-06-02 21:57:53','2018-06-02 21:57:53');
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `donkeykong`.`note_AFTER_DELETE` AFTER DELETE ON `note` FOR EACH ROW
BEGIN
	delete from note_comment where note_id = old.note_id;
    delete from report where note_id = old.note_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `note_comment`
--

DROP TABLE IF EXISTS `note_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note_comment` (
  `note_comment_id` varchar(64) NOT NULL,
  `note_id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `comment_content` varchar(255) NOT NULL,
  `comment_time` datetime NOT NULL,
  PRIMARY KEY (`note_comment_id`),
  KEY `ntc_fk_idx` (`note_id`),
  KEY `ncu_fk_idx` (`user_id`),
  CONSTRAINT `ncu_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ntc_fk` FOREIGN KEY (`note_id`) REFERENCES `note` (`note_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note_comment`
--

LOCK TABLES `note_comment` WRITE;
/*!40000 ALTER TABLE `note_comment` DISABLE KEYS */;
INSERT INTO `note_comment` VALUES ('316e8b3d1fc24769b85f88e5718f5cad','n01','jason_wu','asdfasfasdf','2018-06-08 19:44:45'),('31d6fa9b2e3a48028d869a322e885f92','n01','jason_wu','65456465','2018-06-08 19:50:04'),('41c007af1e6248e4a9465144ef169fb5','asdfasdfasfasfasdfasdfasfasdf','jason_wu','测试中文','2018-06-13 23:09:38'),('4278783d911649e1bc7eba1c70894061','n01','jason_wu','wfasfsafsf','2018-06-08 19:53:44'),('6e13a202ece84fc186b1e93836b90fe3','n01','jason_wu','娶你打野的','2018-06-08 19:57:39'),('6f0c51c01b5642ae94c471977254505c','n01','jason_wu','test22222','2018-06-07 22:05:50'),('8c24bb2bc221452585d65ae71f2752e4','n01','jason_wu','asfasfsadf','2018-06-08 19:57:31'),('b6c14d8e7b884ef783a5d202c480a929','n01','jason_wu','test','2018-06-07 21:53:16'),('cf651602ec19467b922d3a4ddbd17b49','02e74f6a29774449956b78be3047d07d','jason_wu','头像测试','2018-06-15 09:03:56');
/*!40000 ALTER TABLE `note_comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `donkeykong`.`note_comment_AFTER_DELETE` AFTER DELETE ON `note_comment` FOR EACH ROW
BEGIN
delete from report where note_comment_id = old.note_comment_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `notify_id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `notify_content` varchar(64) NOT NULL,
  `send_time` datetime NOT NULL,
  PRIMARY KEY (`notify_id`),
  KEY `ntfu_fk_idx` (`user_id`),
  CONSTRAINT `ntfu_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `report_id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `food_id` varchar(64) DEFAULT NULL,
  `hotel_id` varchar(64) DEFAULT NULL,
  `note_id` varchar(64) DEFAULT NULL,
  `food_comment_id` varchar(64) DEFAULT NULL,
  `hotel_comment_id` varchar(64) DEFAULT NULL,
  `note_comment_id` varchar(64) DEFAULT NULL,
  `scenic_comment_id` varchar(64) DEFAULT NULL,
  `report_content` varchar(200) NOT NULL,
  `report_time` datetime NOT NULL,
  PRIMARY KEY (`report_id`),
  KEY `uid_fk_idx` (`user_id`),
  KEY `fid_fk_idx` (`food_id`),
  KEY `hid_fk_idx` (`hotel_id`),
  KEY `nid_fk_idx` (`note_id`),
  KEY `fcid_fk_idx` (`food_comment_id`),
  KEY `hcid_fk_idx` (`hotel_comment_id`),
  KEY `ncid_fk_idx` (`note_comment_id`),
  KEY `scid_fk_idx` (`scenic_comment_id`),
  CONSTRAINT `fcid_fk` FOREIGN KEY (`food_comment_id`) REFERENCES `food_store_comment` (`store_comment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fid_fk` FOREIGN KEY (`food_id`) REFERENCES `food_store` (`food_store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hcid_fk` FOREIGN KEY (`hotel_comment_id`) REFERENCES `hotel_comment` (`hotel_comment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hid_fk` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ncid_fk` FOREIGN KEY (`note_comment_id`) REFERENCES `note_comment` (`note_comment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `nid_fk` FOREIGN KEY (`note_id`) REFERENCES `note` (`note_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `scid_fk` FOREIGN KEY (`scenic_comment_id`) REFERENCES `scenic_comment` (`scenic_comment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uid_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES ('b8a4a94b546f4a8aac300b63cf7d1498','jason_wu',NULL,NULL,'02e74f6a29774449956b78be3047d07d',NULL,NULL,NULL,NULL,'test report','2018-06-17 18:43:04');
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenic`
--

DROP TABLE IF EXISTS `scenic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scenic` (
  `scenic_id` varchar(64) NOT NULL,
  `scenic_name` varchar(64) NOT NULL,
  `area_id` varchar(64) NOT NULL,
  `scenic_address` text NOT NULL,
  `scenic_like` int(255) NOT NULL,
  `scenic_comment` varchar(255) DEFAULT NULL,
  `scenic_img` varchar(100) DEFAULT NULL,
  `scenic_content` text NOT NULL,
  PRIMARY KEY (`scenic_id`),
  KEY `sa_fk_idx` (`area_id`),
  CONSTRAINT `sa_fk` FOREIGN KEY (`area_id`) REFERENCES `areas` (`area_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenic`
--

LOCK TABLES `scenic` WRITE;
/*!40000 ALTER TABLE `scenic` DISABLE KEYS */;
INSERT INTO `scenic` VALUES ('02cfac0e9b2b4aa68e5118de45f69fa2','DanXia MountaiN','cd6d16d0b4e84518b6b85bcc2911f3a0','Northeast suburb of Shaoguan, Guangdong',16,NULL,'13f4970fd0ef481983ba3e4779619a9d.jpeg','test content'),('1858772c0aec44db8287d3e61b781e10','Penglai','08e3ee5fcda248af8eac06f69018a305','Yantai,Shandong',0,NULL,'550bc2e518ba41038bd72ddd29109296.png','Penglai, in Yantai, Shandong Province, is located at the north end of the Jiaodong peninsula. It is an ancient city that leans the mountains and holds the sea. It has been known as \"the fairyland of the world\" since ancient times. The legend of the eight fairy tales of the sea took place here. The most immortal place in Penglai is Penglaige. Penglaige is located on the northern part of Penglai city on the cliff mountain, and Yellow Crane Tower, Yueyang Tower, Pavilion of Prince Teng, also known as the \"four famous buildings in the country\".'),('19958b3954e34d6288eb213548c8dcb3','Shenzhen','cd6d16d0b4e84518b6b85bcc2911f3a0','Guangdong',0,NULL,NULL,'Shenzhen is the first special economic zone in China. Now it has become the fourth largest city in the country and the fifth largest financial center in the world. Shenzhen is the city with the largest and only sea, land and air ports in China. It is one of the main portals of China\'s communication with the world. It has strong economic support and modern urban infrastructure.'),('21cb80315f7a4cd79a07d30bb21d6600','Mount Qingcheng','81bed5b679fa49c0b042e2bdeb53fbd5','southwest of Dujiangyan City, Sichuan',0,NULL,NULL,'Qingchengshan is located in the southwest of Dujiangyan City, Sichuan province. It is one of the birthplaces of Taoism in China. It is a famous Taoist mountain and a national 5A scenic spot. In 2000, together with Dujiangyan as a world cultural heritage, it has been listed in the world heritage list. The main peak of Qingchengshan is 1260 meters above sea level. All the forest trees are evergreen all the year round, so it is known as Qingchengshan.'),('3da63c78bdcf4b1ca167ee4a1bda898d','Shilin','86feeaafc2b143349e1cd152738d7347','Shilin Yi Autonomous County, Kunming City, Yunnan',0,NULL,NULL,'Shilin is a scenic area in Shilin Yi Autonomous County, Kunming City, Yunnan Province, and also a world natural heritage. It has the oldest, most widely distributed, complete and unique Palaeozoic karst geomorphology community in Karst geomorphology, which is known as the \"first wonders of the world\".'),('41c7d48e736a49fbb102a50c60986a5d','Laoshan','08e3ee5fcda248af8eac06f69018a305','Qingdao,Shandong',0,NULL,NULL,'Located in the eastern part of Qingdao, Laoshan is the main mountain range of Shandong peninsula. The highest peak is 1133 meters above sea level. Laoshan stands on the shore of the Yellow Sea. Its mountains and seas are connected. Laoshan is the only mountain in the country that rises in the seaside. It has the reputation of \"the first famous mountain on the sea\". It is said that Qin Shihuang and Emperor Wudi all come to ask for the immortals.'),('4ba2903e6ff84acdb29d332826f280ee','Jiuzhaigou','81bed5b679fa49c0b042e2bdeb53fbd5','Zhangzha Town,Jiuzhaigou County',0,NULL,NULL,'Jiuzhaigou is named after nine Tibetan stockade in the ditch. Located in zhangzha Town, Jiuzhaigou County, Aba Tibetan and Qiang Autonomous Prefecture, Sichuan, it is 540 kilometers away from Chengdu and 8-10 hours drive. In 1992, Jiuzhaigou was officially included in the list of world natural heritage. \"The return of the Jiuzhai does not look at the water\" is a true interpretation of the scenery of Jiuzhaigou.'),('4ede821665a0449abf4bc9219777acff','Guangzhou','cd6d16d0b4e84518b6b85bcc2911f3a0','southern China, south of Guangdong Province',0,NULL,NULL,'Guangzhou, for short, is called \"Yangcheng\", \"Sui Cheng\", \"Hogaki\", \"Xian Cheng\" and \"Flower City\". Located in southern China, south of Guangdong Province, the northern edge of the Pearl River Delta, the Xijiang, Beijiang and Dongjiang waterways are confluence, it is near the South China Sea, the Pearl River enters the mouth of the sea, adjacent to Hong Kong and Macao, the geographical position is superior, and Guangzhou is the starting point of the maritime Silk Road, which is called the \"South Grand gate\" of China.'),('592f383f098241d0af3295d4c28a2bd3','Erhai','86feeaafc2b143349e1cd152738d7347','northwest of Dali city of Yunnan',0,NULL,NULL,'Erhai is located in the northwest of Dali city of Yunnan. It is the second largest freshwater lake in Yunnan province. It is long and narrow. The lake water is clear and transparent. It has been known as \"the flawless jade of the mountains\" since ancient times. It is the place of \"Erhai month\", one of the four scenes of \"wind and snow moon\" in Dali. It is said that it is called \"Erhai\" because of its shape like an ear, and is known for its \"Plateau Pearl\".'),('5b64a15fa20c4e5f82e477c6f96b3099','Jinli','81bed5b679fa49c0b042e2bdeb53fbd5','Chengdu,Sichuan',0,NULL,NULL,'The Jinli Street is restored by the Wuhou Temple Museum in Chengdu. As part of Wuhou Temple (the Three Kingdoms historical sites, the folk custom area, the west area), the street is 550 meters long. It is now the famous pedestrian mall in Chengdu. It is known as \"the first street of West Shu\" and is known as the \"Chengdu version of the Qingming River map\".'),('622990b46c59427bac9ab1073bc14d05','Jade Dragon Snow Mountain','86feeaafc2b143349e1cd152738d7347','Naxi Autonomous County of ERON',0,NULL,NULL,'Jade Dragon Snow Mountain is located in the Naxi Autonomous County of ERON. It is the most southern snowy mountain in the northern hemisphere. Mountain snow area is located at 4000 meters above sea level. It is famous for its dangers, wonders, beauty and show.'),('652c7dafc30a4e25bd795cb1154eef4c','Taishan','08e3ee5fcda248af8eac06f69018a305','Taian,Shandong',0,NULL,NULL,'Taishan is the first of the five mountains in China. It is one of the first batch of state-level scenic spots in China. It is also a natural museum of art and history. Many pine and cypress trees in Taishan are more solemn, lofty and luxuriant. There are ten natural wonders, such as the rising sun, the jade plate of the cloud sea, the sunset glow of the sunset glow, the the Yellow River gold belt and so on, and the ten natural landscapes, such as the stone dock, the pine and the pine, the peach garden, the soul rock and so on.'),('a221592c7ec54dea8e5ca45cabbad022','Temple and Cemetery of Confucius','08e3ee5fcda248af8eac06f69018a305','Qufu,Shandong',0,NULL,NULL,'Qufu is located in the southwest of Shandong Province, the ancient name Lu County, the birthplace of Confucius, the great thinker, educator and founder of the Confucian School of ancient China, and the birthplace of Confucianism. Published by the State Council as the first famous historical and cultural city in 1982, it was praised by western people as \"Jerusalem of the East\" and one of the four great holy cities in the world. Thousands of Chinese and foreign tourists have been attracted to Pilgrims for thousands of years.'),('a843e393eae84c24a9f77a73505daff0','Mount Emei','81bed5b679fa49c0b042e2bdeb53fbd5','southwest of Sichuan basin',0,NULL,NULL,'Mount Emei is located in the southwest of Sichuan basin. It is 7 kilometers west of Mount Emei and 37 kilometers east of Leshan. It is one of the four famous Buddhist mountains in China. Mount Emei Leshan Giant Buddha, as a dual heritage of culture and nature, was listed in the world heritage list by UNESCO in 1996. The highest peak is 3099 meters above sea level.'),('bee9f9f461bd4a289de07abc751d4c6d','Qingdao Lake','050a6e78c8684bc585f64c9b1b48af7c','Chunan County, Zhejiang',0,NULL,NULL,'Qiandao Lake, located in Chunan County, Zhejiang Province, is the first artificial lake built by China in 1959, which is the first self designed and self-made hydraulic power station. It is the first level water body of the country. Due to the importance of environmental protection, Thousand Island Lake is the highest quality water in China\'s big rivers and lakes.'),('bfe624e2ae87401d9c7f6540eccab080','Nanaodao','cd6d16d0b4e84518b6b85bcc2911f3a0','Shantou,Guangdong',0,NULL,NULL,'Nanaodao is the only island county in Guangdong province. It is also the only county under the jurisdiction of Shantou. Blue sky, blue sea, green island, golden sand and white wave are the main hue of Nan\'ao\'s ecotourism. The Green Bay, known as \"Hawaii of the East\", is a rare shallow sea beach in China. The sand is white and the sea water is clean and free from pollution. It is one of the two bathing beaches in Guangdong province.'),('c20e7b70a6504ab6aab036ca269f0c1f','West Lake','050a6e78c8684bc585f64c9b1b48af7c','south of Hangzhou, Zhejiang',0,NULL,NULL,'West Lake, a few of the world heritage list, is the only cultural heritage of lakes in China. West Lake, Hangzhou, located in the south of Hangzhou, Zhejiang Province, has become a famous tourist resort with its beautiful lake and mountain color and many famous historic sites, and has been endowed with the reputation of \"paradise on earth\" by the world.'),('c6dbe4af61284962861dda00a8811bb0','Dianchi','86feeaafc2b143349e1cd152738d7347','southwest of Yunnan',0,NULL,NULL,'Dianchi is located in the southwest of Yunnan Province, the largest fresh water lake, known as Plateau Pearl. Dianchi is an earthquake fault subsided lake, its shape is like a crescent moon. The lakes and mountains in Dianchi are different in their evaluation. Perhaps there are no picturesque scenery such as Guilin, but it is rare to have such broad waters on the plateau. Standing in Longmen, commanding heights, Dianchi has a panoramic view, with the name of \"Plateau Pearl\".'),('d904114d5b3f4ed8b25694971c1b62a8','Xitang','050a6e78c8684bc585f64c9b1b48af7c','junction of Jiangsu, Zhejiang and Shanghai',0,NULL,NULL,'Xitang ancient town is located at the junction of Jiangsu, Zhejiang and Shanghai provinces in Jiashan County, Zhejiang Province, the ancient name of the slope pond, Hirakawa, 10 kilometers away from Jiashan city. As the first batch of historical and cultural towns in China, the ancient AAAA town of Xitang has been included in the world\'s historical and cultural heritage reserve list. Xitang has won the favor of the vast number of tourists with the three characteristics of \"bridge, multi lane and corridor shed\".'),('f249ed283ad04f2a9f5ca3d04c5e08c0','Mount Putuo','050a6e78c8684bc585f64c9b1b48af7c','eastern part of the Zhoushan archipelago',0,NULL,NULL,'Mount Putuo is located in the eastern part of the Zhoushan archipelago, and belongs to Zhoushan, Zhejiang. It is one of the four famous Buddhist mountains in China. In the 19th day of the second month of the Chinese lunar calendar, June, nineteen and September, nineteen were Avalokiteshvara\'s three major incense sessions, namely, the birthday, the monks and the way. Mount Putuo is the most famous Guanyin Taoist site in China. The sacred site of Buddhism is surrounded by the sea and has beautiful scenery. It is known as \"the first world\'s clean land\".'),('f2d3a32e87f248c28e0a6ef045f56eb1','Ranking seventy','08e3ee5fcda248af8eac06f69018a305','Jinan,Shandong',0,NULL,NULL,'Ranking seventy-two in the spring of Ji\'nan, it is known as \"the first spring in the world\" and the earliest known spring in Ji\'nan. Located in the downtown area of Ji\'nan, the middle section of Baotu Spring South Road and Yuan Yuan Street, south of Qianfo Hill, east of Quancheng Square, and north facing Daming Lake. Baotu Spring Park was built in 1956. Its historic sites and cultural connotation are very rich. It is one of the most representative landscape gardens with the characteristics of South and North Garden art.'),('fe68f0b9ba0d46738f6a5897ea5f54a8','Wuzhen','050a6e78c8684bc585f64c9b1b48af7c','north end of Tongxiang City, Zhejiang',0,NULL,NULL,'Wuzhen is located at the north end of Tongxiang City, Zhejiang Province, 13 kilometers away from Tongxiang City, and is known as \"the land of fish and rice and the house of silk\". Wuzhen is a national 5A level scenic spot, one of the twenty golden week forecast sites in the country, with a history of over six thousand years.');
/*!40000 ALTER TABLE `scenic` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `donkeykong`.`scenic_AFTER_DELETE` AFTER DELETE ON `scenic` FOR EACH ROW
BEGIN
delete from scenic_comment where scenic_id = old.scenic_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `scenic_comment`
--

DROP TABLE IF EXISTS `scenic_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scenic_comment` (
  `scenic_comment_id` varchar(64) NOT NULL,
  `scenic_id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `comment_content` varchar(200) NOT NULL,
  `comment_time` datetime NOT NULL,
  PRIMARY KEY (`scenic_comment_id`),
  KEY `sc_fk_idx` (`scenic_id`),
  KEY `scu_fk_idx` (`user_id`),
  CONSTRAINT `sc_fk` FOREIGN KEY (`scenic_id`) REFERENCES `scenic` (`scenic_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `scu_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenic_comment`
--

LOCK TABLES `scenic_comment` WRITE;
/*!40000 ALTER TABLE `scenic_comment` DISABLE KEYS */;
INSERT INTO `scenic_comment` VALUES ('515e7ae2acf641a9a11a65090ed1ab8c','02cfac0e9b2b4aa68e5118de45f69fa2','jason_wu','中文测试','2018-06-14 13:22:59'),('8a878b089ced4b15abfc9b5d29c1b4a9','1858772c0aec44db8287d3e61b781e10','jason_wu','test','2018-06-15 08:24:40');
/*!40000 ALTER TABLE `scenic_comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `donkeykong`.`scenic_comment_AFTER_DELETE` AFTER DELETE ON `scenic_comment` FOR EACH ROW
BEGIN
delete from report where scenic_comment_id = old.scenic_comment_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tour`
--

DROP TABLE IF EXISTS `tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tour` (
  `tour_id` varchar(64) NOT NULL,
  `tour_title` varchar(30) NOT NULL,
  `scenic_name` varchar(64) NOT NULL,
  `tour_price` double(10,2) NOT NULL,
  `limit_num` int(10) NOT NULL,
  `trip_mode` varchar(64) NOT NULL,
  `hotel_name` varchar(64) NOT NULL,
  `is_approve` int(4) NOT NULL,
  `tour_begin_time` datetime NOT NULL,
  `tour_end_time` datetime NOT NULL,
  `apply_end_time` datetime NOT NULL,
  PRIMARY KEY (`tour_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour`
--

LOCK TABLES `tour` WRITE;
/*!40000 ALTER TABLE `tour` DISABLE KEYS */;
INSERT INTO `tour` VALUES ('4011780b547b4854b42126204bfd0414','Let','sdlkj',21.00,123,'sdfklj','qwe',0,'2018-06-04 12:00:00','2018-06-29 12:00:00','2018-06-30 12:00:00');
/*!40000 ALTER TABLE `tour` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `donkeykong`.`tour_AFTER_DELETE` AFTER DELETE ON `tour` FOR EACH ROW
BEGIN
delete from tour_apply where tour_id = old.tour_id;
delete from tour_comment where tour_id = old.tour_id;
delete from tour_join where tour_id = old.tour_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tour_apply`
--

DROP TABLE IF EXISTS `tour_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tour_apply` (
  `apply_id` varchar(64) NOT NULL,
  `tour_id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  PRIMARY KEY (`apply_id`),
  KEY `at_fk_idx` (`tour_id`),
  KEY `au_fk_idx` (`user_id`),
  CONSTRAINT `at_fk` FOREIGN KEY (`tour_id`) REFERENCES `tour` (`tour_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `au_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_apply`
--

LOCK TABLES `tour_apply` WRITE;
/*!40000 ALTER TABLE `tour_apply` DISABLE KEYS */;
INSERT INTO `tour_apply` VALUES ('34c5fd0a0cb04e11a48c59871f81af06','4011780b547b4854b42126204bfd0414','jason_wu');
/*!40000 ALTER TABLE `tour_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_comment`
--

DROP TABLE IF EXISTS `tour_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tour_comment` (
  `tour_comment_id` varchar(64) NOT NULL,
  `tour_id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `comment_content` varchar(255) NOT NULL,
  `comment_time` datetime NOT NULL,
  PRIMARY KEY (`tour_comment_id`),
  KEY `tour_fk_idx` (`tour_id`),
  KEY `tcu_fk_idx` (`user_id`),
  CONSTRAINT `tcu_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tour_fk` FOREIGN KEY (`tour_id`) REFERENCES `tour` (`tour_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_comment`
--

LOCK TABLES `tour_comment` WRITE;
/*!40000 ALTER TABLE `tour_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tour_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_join`
--

DROP TABLE IF EXISTS `tour_join`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tour_join` (
  `tj_id` varchar(64) CHARACTER SET utf8 NOT NULL,
  `tour_id` varchar(64) CHARACTER SET utf8 NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`tj_id`),
  KEY `tjt_fk_idx` (`tour_id`) USING BTREE,
  KEY `tju_fk_idx` (`user_id`) USING BTREE,
  CONSTRAINT `tjt_fk` FOREIGN KEY (`tour_id`) REFERENCES `tour` (`tour_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tju_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_join`
--

LOCK TABLES `tour_join` WRITE;
/*!40000 ALTER TABLE `tour_join` DISABLE KEYS */;
/*!40000 ALTER TABLE `tour_join` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `email` varchar(100) NOT NULL,
  `freeze` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `tel` varchar(64) NOT NULL,
  `user_img` varchar(100) DEFAULT NULL,
  `user_regist_time` datetime DEFAULT NULL,
  `user_update_time` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('asd','a8f5f167f44f4964e6c998dee827110c','419387229@qq.com',0,0,'13206496991',NULL,'2018-06-15 16:23:39','2018-06-15 16:23:39'),('Edward','827ccb0eea8a706c4c34a16891f84e7b','980639151@qq.com',0,1,'17863955547',NULL,'2018-05-29 19:16:49','2018-05-29 19:16:52'),('Jack','827ccb0eea8a706c4c34a16891f84e7b','980639151@qq.com',0,0,'17863955547',NULL,'2018-06-02 20:33:58','2018-06-02 20:33:58'),('jason_wu','96e79218965eb72c92a549dd5a330112','wcz_jason@qq.com',0,0,'13206496992','dc43ee85909c4951ab51ed8b4f30a117.jpeg','2018-06-02 21:57:53','2018-06-14 17:45:48');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `donkeykong`.`users_AFTER_DELETE` AFTER DELETE ON `users` FOR EACH ROW
BEGIN
delete from food_store_comment where user_id = old.user_id;
delete from hotel_book where user_id = old.user_id;
delete from note where user_id = old.user_id;
delete from notification where user_id = old.user_id;
delete from tour_apply where user_id = old.user_id;
delete from tour_comment where user_id = old.user_id;
delete from scenic_comment where user_id = old.user_id;
delete from tour_join where user_id = old.user_id;
delete from hotel_comment where user_id = old.user_id;
delete from report where user_id = old.user_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'donkeykong'
--

--
-- Dumping routines for database 'donkeykong'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-17 18:51:08
