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
-- Table structure for table `trust_list`
--

DROP TABLE IF EXISTS `trust_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trust_list` (
  `trustid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(15) NOT NULL,
  `spellid` int(4) unsigned NOT NULL DEFAULT '0',
  `poolid` int(10) unsigned NOT NULL DEFAULT '0',
  `minLevel` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `maxLevel` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `element` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`trustid`)
) ENGINE=MyISAM AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trust_list`
--

LOCK TABLES `trust_list` WRITE;
/*!40000 ALTER TABLE `trust_list` DISABLE KEYS */;
INSERT INTO `trust_list` VALUES (1,'Shantotto',896,5896,1,99,0,0);
INSERT INTO `trust_list` VALUES (2,'Naji',897,5897,1,99,0,0);
INSERT INTO `trust_list` VALUES (3,'Kupipi',898,5898,1,99,0,0);
INSERT INTO `trust_list` VALUES (4,'Excenmille',899,5899,1,99,0,0);
INSERT INTO `trust_list` VALUES (5,'Ayame',900,5900,1,99,0,0);
INSERT INTO `trust_list` VALUES (6,'Nanaa_Mihgo',901,5901,1,99,0,0);
INSERT INTO `trust_list` VALUES (7,'Curilla',902,5902,1,99,0,0);
INSERT INTO `trust_list` VALUES (124,'Shantotto_II',1019,6019,1,99,0,0);
INSERT INTO `trust_list` VALUES (8,'Volker',903,5903,1,99,0,0);
INSERT INTO `trust_list` VALUES (9,'Ajido-Marujido',904,5904,1,99,0,0);
INSERT INTO `trust_list` VALUES (10,'Trion',905,5905,1,99,0,0);
/*!40000 ALTER TABLE `trust_list` ENABLE KEYS */;
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
