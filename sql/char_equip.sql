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
-- Table structure for table `char_equip`
--

DROP TABLE IF EXISTS `char_equip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_equip` (
  `charid` int(10) unsigned NOT NULL,
  `slotid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `equipslotid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `containerid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charid`,`equipslotid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=41;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `char_equip`
--

LOCK TABLES `char_equip` WRITE;
/*!40000 ALTER TABLE `char_equip` DISABLE KEYS */;
INSERT INTO `char_equip` VALUES (21828,3,10,0),(21828,15,0,0),(21828,19,11,0),(21828,18,12,0),(21828,7,5,0),(21828,5,6,0),(21828,14,4,0),(21828,77,1,0),(21828,16,14,0),(21828,17,9,0),(21828,4,13,0),(21828,11,7,0),(21828,12,8,0),(21829,39,0,0),(21829,16,13,0),(21829,23,5,0),(21845,16,15,0),(21829,24,6,0),(21829,25,14,0),(21829,20,9,0),(21829,21,11,0),(21829,27,7,0),(21829,18,3,0),(21829,26,15,0),(21829,22,12,0),(21829,13,1,0),(21829,17,10,0),(21829,19,4,0),(21830,1,5,0),(21830,2,6,0),(21830,3,7,0),(21830,4,8,0),(21831,1,5,0),(21831,2,6,0),(21831,3,7,0),(21831,4,8,0),(21841,8,16,0),(21836,73,7,0),(21842,24,8,0),(21836,55,0,0),(21836,67,5,0),(21829,2,16,0),(21840,6,13,0),(21837,23,11,0),(21842,50,5,0),(21841,26,11,0),(21839,3,7,0),(21842,4,1,0),(21845,18,12,0),(21837,18,10,0),(21842,39,13,0),(21844,52,15,0),(21834,15,5,0),(21834,14,6,0),(21834,10,7,0),(21834,11,8,0),(21834,9,0,0),(21834,12,4,0),(21834,16,10,0),(21834,18,13,0),(21834,19,14,0),(21834,20,12,0),(21834,21,11,0),(21834,22,3,0),(21834,23,1,0),(21834,25,9,0),(21834,24,15,0),(21840,4,8,0),(21840,17,7,0),(21840,2,6,0),(21840,16,5,0),(21835,8,16,0),(21840,9,16,0),(21845,8,16,0),(21837,14,6,0),(21842,41,14,0),(21842,63,10,0),(21835,23,6,10),(21836,8,16,0),(21835,17,7,11),(21837,7,4,0),(21842,23,6,0),(21836,77,11,0),(21837,12,16,0),(21842,67,15,0),(21840,14,0,0),(21835,51,15,10),(21836,76,15,0),(21836,50,9,0),(21836,48,4,0),(21838,1,5,0),(21838,2,6,0),(21838,3,7,0),(21838,4,8,0),(21838,5,0,0),(21838,7,13,0),(21839,4,8,0),(21839,2,6,0),(21839,1,5,0),(21836,71,6,0),(21842,32,12,0),(21835,49,11,8),(21837,13,5,0),(21842,25,11,0),(21836,19,14,0),(21842,53,9,0),(21841,32,9,0),(21841,43,13,0),(21841,68,8,0),(21836,62,10,0),(21841,65,7,0),(21841,69,15,0),(21841,5,5,0),(21841,9,10,0),(21841,60,14,0),(21836,18,13,0),(21836,17,12,0),(21836,49,3,0),(21845,10,10,0),(21832,14,16,0),(21837,15,7,0),(21842,73,16,0),(21836,1,8,0),(21841,62,0,0),(21841,71,6,0),(21841,57,3,0),(21841,72,1,0),(21841,58,12,0),(21829,28,8,0),(21843,1,5,0),(21843,2,6,0),(21843,3,7,0),(21843,4,8,0),(21843,7,16,0),(21843,5,0,0),(21835,45,10,10),(21835,79,3,10),(21835,75,0,10),(21828,50,2,0),(21842,47,7,0),(21837,29,9,0),(21835,41,9,10),(21842,22,4,0),(21844,66,9,0),(21837,17,8,0),(21836,60,1,0),(21845,21,14,0),(21835,55,12,10),(21844,27,16,0),(21844,40,0,0),(21837,26,12,0),(21845,15,8,0),(21837,2,3,0),(21837,9,14,0),(21845,73,0,0),(21828,80,16,0),(21845,76,5,0),(21845,22,13,0),(21842,21,3,0),(21845,75,9,0),(21845,12,6,0),(21845,19,11,0),(21845,14,7,0),(21845,54,4,0),(21845,68,2,0),(21844,53,4,0),(21844,74,8,0),(21844,59,5,0),(21844,51,10,0),(21844,60,6,0),(21844,68,7,0),(21844,62,13,0),(21837,19,15,0),(21837,42,13,0),(21835,35,8,10),(21844,61,14,0),(21837,11,0,0),(21842,6,0,0),(21841,28,4,0),(21835,49,4,11),(21835,18,5,10),(21835,69,13,10),(21835,70,14,10);
/*!40000 ALTER TABLE `char_equip` ENABLE KEYS */;
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
