CREATE DATABASE  IF NOT EXISTS `dspdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dspdb`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dspdb
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `trust_ability_lists`
--

DROP TABLE IF EXISTS `trust_ability_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trust_ability_lists` (
  `ability_list_name` varchar(30) DEFAULT NULL,
  `ability_list_id` smallint(3) unsigned NOT NULL,
  `ability_id` smallint(3) unsigned NOT NULL,
  `recastTime` smallint(5) unsigned NOT NULL,
  `recastId` smallint(5) unsigned NOT NULL,
  `min_level` tinyint(3) unsigned NOT NULL,
  `max_level` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`ability_list_id`,`ability_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trust_ability_lists`
--

LOCK TABLES `trust_ability_lists` WRITE;
/*!40000 ALTER TABLE `trust_ability_lists` DISABLE KEYS */;
INSERT INTO `trust_ability_lists` VALUES ('Trust_Naji_Provoke',2,19,30,5,5,255);
INSERT INTO `trust_ability_lists` VALUES ('Trust_Excenmille_Sentinel',4,32,250,75,30,255);
INSERT INTO `trust_ability_lists` VALUES ('Trust_Ayame_ThirdEye',5,46,60,133,15,255);
INSERT INTO `trust_ability_lists` VALUES ('Trust_Ayame_Hasso',5,157,180,134,25,255);
INSERT INTO `trust_ability_lists` VALUES ('Trust_Ayame_Meditate',5,47,60,138,30,255);
INSERT INTO `trust_ability_lists` VALUES ('Trust_Curilla_Sentinel',7,32,250,75,30,255);
INSERT INTO `trust_ability_lists` VALUES ('Trust_Trion_Provoke',10,19,30,5,5,255);
INSERT INTO `trust_ability_lists` VALUES ('Trust_NanaaMihgo_Despoil',6,212,300,61,77,255);
INSERT INTO `trust_ability_lists` VALUES ('Trust_Volker_Provoke',8,19,30,5,5,255);
INSERT INTO `trust_ability_lists` VALUES ('Trust_Trion_Sentinel',10,32,250,75,30,255);
INSERT INTO `trust_ability_lists` VALUES ('Trust_Volker_Berserk',8,15,300,1,15,255);
INSERT INTO `trust_ability_lists` VALUES ('Trust_Volker_Defender',8,17,180,3,25,255);
INSERT INTO `trust_ability_lists` VALUES ('Trust_Volker_Warcry',8,16,300,75,35,255);
INSERT INTO `trust_ability_lists` VALUES ('Trust_Volker_Retaliation',8,210,180,8,60,255);
INSERT INTO `trust_ability_lists` VALUES ('Trust_Volker_WarriorsCharge',8,133,300,6,75,255);
/*!40000 ALTER TABLE `trust_ability_lists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-24  2:46:10
