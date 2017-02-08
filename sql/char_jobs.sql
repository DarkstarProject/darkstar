-- MySQL dump 10.13  Distrib 5.6.35, for Win64 (x86_64)
--
-- Host: localhost    Database: dspdb
-- ------------------------------------------------------
-- Server version	5.6.35-log

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
-- Table structure for table `char_jobs`
--

DROP TABLE IF EXISTS `char_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_jobs` (
  `charid` int(10) unsigned NOT NULL,
  `unlocked` int(10) unsigned NOT NULL DEFAULT '126',
  `genkai` tinyint(2) unsigned NOT NULL DEFAULT '50',
  `war` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `mnk` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `whm` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `blm` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `rdm` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `thf` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `pld` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `drk` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `bst` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `brd` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `rng` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `sam` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `nin` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `drg` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `smn` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `blu` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `cor` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `pup` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `dnc` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `sch` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `geo` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `run` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=95;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `char_jobs`
--

LOCK TABLES `char_jobs` WRITE;
/*!40000 ALTER TABLE `char_jobs` DISABLE KEYS */;
INSERT INTO `char_jobs` VALUES (21828,2097151,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99),(21829,2097151,99,99,99,99,99,99,99,99,0,7,0,0,0,75,0,0,0,99,0,99,0,0,0),(21830,126,50,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(21831,126,50,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(21832,113023,55,99,1,49,75,1,1,0,99,0,0,99,49,37,0,6,15,0,0,0,0,0,0),(21834,126,50,1,1,1,99,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(21835,525439,75,1,1,37,75,9,75,0,0,0,75,0,0,0,0,0,0,0,0,39,0,0,0),(21836,524415,75,1,1,75,37,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0),(21837,526463,75,37,75,1,1,1,1,0,0,0,0,75,0,0,0,0,0,0,0,40,0,0,0),(21838,126,50,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(21839,126,50,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(21840,126,50,12,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(21841,8319,75,1,1,1,37,75,1,0,0,0,0,0,0,37,0,0,0,0,0,0,0,0,0),(21842,1700863,75,66,20,27,47,60,1,43,20,37,0,0,18,75,13,23,8,0,0,37,64,0,0),(21843,126,50,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(21844,524415,50,41,26,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,18,0,0,0),(21845,127,55,1,1,1,50,37,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `char_jobs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-06  2:07:31
