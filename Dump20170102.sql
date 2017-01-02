-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: estoresystem
-- ------------------------------------------------------
-- Server version	5.7.13-log

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
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `pid` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coll_user` (`uid`),
  KEY `coll_pro` (`pid`),
  CONSTRAINT `coll_pro` FOREIGN KEY (`pid`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `coll_user` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
INSERT INTO `collection` VALUES (1,10,'3e78b529-e60a-482f-af56-efcb0a7de7f8'),(2,1,'a4070f64-bf9c-445e-a75d-97d4330d350c');
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitem` (
  `order_id` varchar(100) NOT NULL DEFAULT '',
  `product_id` varchar(100) NOT NULL DEFAULT '',
  `buynum` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` varchar(100) NOT NULL,
  `money` double DEFAULT NULL,
  `receiverinfo` varchar(255) DEFAULT NULL,
  `paystate` int(11) DEFAULT NULL,
  `ordertime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privileges`
--

DROP TABLE IF EXISTS `privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privileges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privileges`
--

LOCK TABLES `privileges` WRITE;
/*!40000 ALTER TABLE `privileges` DISABLE KEYS */;
INSERT INTO `privileges` VALUES (1,'添加商品'),(2,'查看订单'),(3,'生成订单'),(4,'下载榜单');
/*!40000 ALTER TABLE `privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` varchar(100) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `category` varchar(40) DEFAULT NULL,
  `imgurl` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `dealps` varchar(50) DEFAULT NULL,
  `discount` tinyint(1) DEFAULT NULL,
  `QQ` varchar(15) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `owner` int(10) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `pro_user` (`owner`),
  CONSTRAINT `pro_user` FOREIGN KEY (`owner`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('07cc2988-2fd5-4c5a-b205-fac36add605d','全新台式苹果',4000,'computer','/upload/2016/12/29/20/f34f7a18-fec7-45d4-9538-48c428b585e8.jpg','全新台式苹果电脑，明码实价，正品行货，买贵包退!K30BF内置四核处理器A10-7800，主频高达3.5GHz，睿频至3.9GHz，128GMLC固态硬盘.8GB大内存，系统更流畅，游戏更上一层楼，图书馆级别的静音效果','快递',1,'25252525','15352525252',10,'2016-12-29 12:24:00'),('1f91c252-d0e3-43b3-b900-e6433538c649','创意雨伞',40,'daily','/upload/2016/12/29/20/2dffbc86-96cd-41d3-995f-e0dd0b8d6592.jpg','创意雨伞，时尚的化身，物美价廉！','食堂',1,'25252525','15352525252',10,'2016-12-29 12:36:56'),('3e78b529-e60a-482f-af56-efcb0a7de7f8','创意书',60,'books','/upload/2016/12/29/20/f8acc4fa-4bb8-4c5c-b475-20b14396045e.jpg','创意书创意书创意书创意书创意书创意书创意书创意书创意书创意书创意书创意书创意书','食堂',1,'25252525','15352525252',10,'2016-12-29 12:37:56'),('56de7c97-abbe-44b7-a80d-4d8374fa5473','宠物二哈',250,'other','/upload/2016/12/29/20/9d5e4408-52d8-478b-8537-9664c35543cf.jpeg','超萌宠物二哈！很像你哦！超萌宠物二哈！很像你哦！超萌宠物二哈！很像你哦！超萌宠物二哈！很像你哦！超萌宠物二哈！很像你哦！超萌宠物二哈！很像你哦！超萌宠物二哈！很像你哦！','食堂',1,'25252525','15352525252',10,'2016-12-29 12:39:43'),('79db50fe-357e-4805-87d9-8108b974013f','健身套装',80,'exercise','/upload/2016/12/29/20/ab136cda-f14c-451e-8aec-e171fa35f5e8.jpg','健身套装，包括炫酷夜光跳绳和一对哑铃，你，值得拥有！','宿舍',1,'25252525','15352525252',10,'2016-12-29 12:33:32'),('89111dd3-57f9-4991-8d62-41a0992a3b1b','神书',50,'books','/upload/2016/12/29/20/bc84ff81-3c7c-43fa-957a-5ba74e5b1d98.jpg','神书！神书！神书！神书！神书！神书！神书！神书！神书！神书！神书！神书！神书！神书！神书！神书！神书！神书！神书！神书！神书！神书！神书！神书！神书！神书！神书！','宿舍',1,'25252525','15352525252',10,'2016-12-29 12:38:27'),('922699b7-1e1a-4be4-ab40-92b365065aa7','iPhone9 plus',8000,'electronics','/upload/2016/12/29/20/def3adf4-ed54-41ad-b722-89924f775676.jpg','八成新iPhone9 plus，有了 Apple Pay，轻轻一触*，你就可以使用 iPhone 在全国数百万家商店及众多 app 内安全、简单地进行支付。','宿舍',1,'25252525','15352525252',10,'2016-12-29 12:28:47'),('a4070f64-bf9c-445e-a75d-97d4330d350c','山地自行车',500,'transport','/upload/2016/12/29/20/8aa9d583-a891-4100-a366-d4e08be64287.jpg','专业山地自行车，全能高配，智能骑行。双碟刹系统，航空铝合金材质。正品凤凰山地自行车21/24/27速双碟刹26寸铝合金减震学生变速车','食堂',1,'25252525','15352525252',10,'2016-12-29 12:26:44'),('d2df58ee-4db0-4d0f-b34d-cf2cb0b66ccb','哑铃',200,'exercise','/upload/2016/12/29/20/145885c6-4b54-419a-9d71-6a9995f7e77a.jpg','全新哑铃，华亚哑铃盒装电镀20公斤15kg运动健身器材男士家用杠铃组合练臂肌，送加长连接器 升级版螺母 一款三用 破损补寄','快递',1,'25252525','15352525252',10,'2016-12-29 12:31:53');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `dealps` varchar(20) DEFAULT NULL,
  `price` int(5) DEFAULT NULL,
  `category` varchar(10) DEFAULT NULL,
  `owner` int(10) DEFAULT NULL,
  `QQ` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role` varchar(100) NOT NULL,
  PRIMARY KEY (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('admin'),('user');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userprivilege`
--

DROP TABLE IF EXISTS `userprivilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userprivilege` (
  `privilege_id` int(11) NOT NULL DEFAULT '0',
  `role` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`privilege_id`,`role`),
  KEY `userprivilege` (`role`),
  CONSTRAINT `userprivilege_ibfk_1` FOREIGN KEY (`privilege_id`) REFERENCES `privileges` (`id`),
  CONSTRAINT `userprivilege_ibfk_2` FOREIGN KEY (`role`) REFERENCES `role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userprivilege`
--

LOCK TABLES `userprivilege` WRITE;
/*!40000 ALTER TABLE `userprivilege` DISABLE KEYS */;
INSERT INTO `userprivilege` VALUES (1,'admin'),(2,'admin'),(3,'admin'),(4,'admin'),(2,'user'),(3,'user');
/*!40000 ALTER TABLE `userprivilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `nickname` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `state` int(2) DEFAULT '0',
  `activecode` varchar(100) DEFAULT NULL,
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `phone` varchar(20) DEFAULT '',
  `QQ` varchar(20) DEFAULT '',
  `header` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role` (`role`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'周周','202cb962ac59075b964b07152d234b70','fox','22597927@qq.com','admin',1,'12481b35-5f08-42c5-8e68-bcf66f02f64d','2016-12-29 11:15:24','13518136593','1095121033','/header/2016/12/29/19/859f995b-0230-45dd-bced-4bad361d4daf.jpg'),(2,'周成','6dce759ecd0ebb1743eeb0c8e5fad9ec','大雪无寒','1095121033@qq.com','admin',1,'57ff239a-ae21-4a3e-9208-cf48ec8a364e','2016-12-28 07:05:32','1527777777','271058976','/header/2016/12/28/15/bde020f6-9985-4183-98c6-fb04f1f1a19e.jpg'),(9,'二狗','202cb962ac59075b964b07152d234b70','二狗','1095121033@qq.com','admin',1,'d1cf94ff-54b1-4dce-a401-7ff1d976cef6','2016-12-29 10:25:24',NULL,NULL,'/header/2016/12/29/18/5bdb72ae-c021-4ccd-91fe-92766355a4dd.jpeg'),(10,'三狗','202cb962ac59075b964b07152d234b70','三狗','1095121033@qq.com','admin',1,'b067f527-0dd3-409f-ba69-53028f5c786f','2016-12-29 10:35:23','15352525252','25252525','/header/2016/12/29/18/68ff5afe-65ec-4413-94e3-171525e5e4ab.jpg');
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

-- Dump completed on 2017-01-02 19:00:40
