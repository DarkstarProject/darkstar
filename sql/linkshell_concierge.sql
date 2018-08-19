-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dspdb
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `linkshell_concierge`
--

DROP TABLE IF EXISTS `linkshell_concierge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linkshell_concierge` (
  `listingid` int(10) NOT NULL AUTO_INCREMENT,
  `npcid` int(10) unsigned NOT NULL DEFAULT '0',
  `linkshellid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `lslanguage` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `lspearlcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lsactivedays` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `lstimezone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `lstimeofday` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `madebyplayerid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`listingid`),
  UNIQUE KEY `listingid_UNIQUE` (`listingid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Contains information about what linkshell the linkshell concierges have';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linkshell_concierge`
--

--
-- Dumping events for database 'dspdb'
--

--
-- Dumping routines for database 'dspdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-05 14:59:17
