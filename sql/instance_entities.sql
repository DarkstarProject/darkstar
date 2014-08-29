-- MySQL dump 10.13  Distrib 5.6.15, for Win64 (x86_64)
--
-- Host: localhost    Database: dspdb
-- ------------------------------------------------------
-- Server version	5.6.15

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
-- Table structure for table `instance_entities`
--

DROP TABLE IF EXISTS `instance_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_entities` (
  `instanceid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`instanceid`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_entities`
--

LOCK TABLES `instance_entities` WRITE;
/*!40000 ALTER TABLE `instance_entities` DISABLE KEYS */;
INSERT INTO `instance_entities` VALUES (27,17035359);
INSERT INTO `instance_entities` VALUES (27,17035360);
INSERT INTO `instance_entities` VALUES (27,17035361);
INSERT INTO `instance_entities` VALUES (27,17035362);
INSERT INTO `instance_entities` VALUES (27,17035363);
INSERT INTO `instance_entities` VALUES (27,17035365);
INSERT INTO `instance_entities` VALUES (27,17035367);
INSERT INTO `instance_entities` VALUES (27,17035368);
INSERT INTO `instance_entities` VALUES (27,17035369);
INSERT INTO `instance_entities` VALUES (27,17035370);
INSERT INTO `instance_entities` VALUES (27,17035371);
INSERT INTO `instance_entities` VALUES (27,17035372);
INSERT INTO `instance_entities` VALUES (27,17035376);
INSERT INTO `instance_entities` VALUES (27,17035377);
INSERT INTO `instance_entities` VALUES (27,17035378);
INSERT INTO `instance_entities` VALUES (27,17035478);
INSERT INTO `instance_entities` VALUES (27,17035479);
INSERT INTO `instance_entities` VALUES (27,17035508);
INSERT INTO `instance_entities` VALUES (27,17035538);
INSERT INTO `instance_entities` VALUES (27,17035539);
INSERT INTO `instance_entities` VALUES (27,17035541);
INSERT INTO `instance_entities` VALUES (27,17035542);
INSERT INTO `instance_entities` VALUES (27,17035543);
INSERT INTO `instance_entities` VALUES (27,17035544);
INSERT INTO `instance_entities` VALUES (27,17035545);
INSERT INTO `instance_entities` VALUES (27,17035546);
/*!40000 ALTER TABLE `instance_entities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-24  5:06:02
