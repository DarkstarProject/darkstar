-- MySQL dump 10.13  Distrib 5.6.13, for Win64 (x86_64)
--
-- Host: localhost    Database: dspdb
-- ------------------------------------------------------
-- Server version	5.6.13-log

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
-- Table structure for table `mob_spawn_mods`
--

DROP TABLE IF EXISTS `mob_spawn_mods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mob_spawn_mods` (
  `mobid` int(10) unsigned NOT NULL,
  `modid` smallint(5) unsigned NOT NULL,
  `value` smallint(5) NOT NULL DEFAULT '0',
  `type` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mobid`,`modid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=13 PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mob_spawn_mods`
--

LOCK TABLES `mob_spawn_mods` WRITE;
/*!40000 ALTER TABLE `mob_spawn_mods` DISABLE KEYS */;
INSERT INTO `mob_spawn_mods` VALUES (16806117,288,40,0); -- Sargas DA guestimate
INSERT INTO `mob_spawn_mods` VALUES (17240232,23,50,0); -- Tegmine attack bonus guestimate, he hits hard for a crab on retail
INSERT INTO `mob_spawn_mods` VALUES (17240232,288,40,0); -- Tegmine DA guestimate
INSERT INTO `mob_spawn_mods` VALUES (17186927,368,33,0);
INSERT INTO `mob_spawn_mods` VALUES (17195221,368,33,0);
INSERT INTO `mob_spawn_mods` VALUES (17363080,368,33,0);
INSERT INTO `mob_spawn_mods` VALUES (17424488,302,25,0); -- Autarch TA guestimate
INSERT INTO `mob_spawn_mods` VALUES (17424488,288,25,0); -- Autarch DA guestimate
INSERT INTO `mob_spawn_mods` VALUES (17424488,23,60,0); -- Autarch attack bonus guestimate
INSERT INTO `mob_spawn_mods` VALUES (17371142,16,-1,1);
INSERT INTO `mob_spawn_mods` VALUES (17371142,1,20,1);
INSERT INTO `mob_spawn_mods` VALUES (17371142,2,33,1);
INSERT INTO `mob_spawn_mods` VALUES (17371143,16,2,1);
INSERT INTO `mob_spawn_mods` VALUES (17371143,1,20,1);
INSERT INTO `mob_spawn_mods` VALUES (17371143,2,25,1);
INSERT INTO `mob_spawn_mods` VALUES (17433009,1,15000,1);
INSERT INTO `mob_spawn_mods` VALUES (17433009,2,18000,1);
INSERT INTO `mob_spawn_mods` VALUES (17433009,302,15,0);
INSERT INTO `mob_spawn_mods` VALUES (17596720,1,19000,1);
INSERT INTO `mob_spawn_mods` VALUES (17596720,2,32767,1);
INSERT INTO `mob_spawn_mods` VALUES (17269106,1,15000,1);
INSERT INTO `mob_spawn_mods` VALUES (17269106,2,30545,1);
INSERT INTO `mob_spawn_mods` VALUES (17485980,1,1200,1);
INSERT INTO `mob_spawn_mods` VALUES (17485980,2,1950,1);
INSERT INTO `mob_spawn_mods` VALUES (17486129,1,3600,1);
INSERT INTO `mob_spawn_mods` VALUES (17486129,2,6079,1);
INSERT INTO `mob_spawn_mods` VALUES (17486031,1,1200,1);
INSERT INTO `mob_spawn_mods` VALUES (17486031,2,1903,1);
INSERT INTO `mob_spawn_mods` VALUES (17228242,1,21000,1);
INSERT INTO `mob_spawn_mods` VALUES (17228242,2,31300,1);
INSERT INTO `mob_spawn_mods` VALUES (17289575,12,15,1);
INSERT INTO `mob_spawn_mods` VALUES (16887889,12,15,1);
INSERT INTO `mob_spawn_mods` VALUES (17297441,12,25,1);
INSERT INTO `mob_spawn_mods` VALUES (17408018,12,20,1);
INSERT INTO `mob_spawn_mods` VALUES (16806227,12,8,1);
INSERT INTO `mob_spawn_mods` VALUES (16896161,12,15,1);
INSERT INTO `mob_spawn_mods` VALUES (16797969,12,15,1);
INSERT INTO `mob_spawn_mods` VALUES (16900314,12,15,1);
INSERT INTO `mob_spawn_mods` VALUES (17309982,1,1500,1);
INSERT INTO `mob_spawn_mods` VALUES (17309982,2,18000,1);
INSERT INTO `mob_spawn_mods` VALUES (17309980,1,1500,1);
INSERT INTO `mob_spawn_mods` VALUES (17309980,2,29036,1);
INSERT INTO `mob_spawn_mods` VALUES (17309981,1,1500,1);
INSERT INTO `mob_spawn_mods` VALUES (17309981,2,28608,1);
INSERT INTO `mob_spawn_mods` VALUES (17309983,1,1500,1);
INSERT INTO `mob_spawn_mods` VALUES (17309983,2,28886,1);
INSERT INTO `mob_spawn_mods` VALUES (17236202,12,15,1);
INSERT INTO `mob_spawn_mods` VALUES (17236202,160,50,0);
INSERT INTO `mob_spawn_mods` VALUES (17236202,169,10,0);
INSERT INTO `mob_spawn_mods` VALUES (17236202,16,1,1);
INSERT INTO `mob_spawn_mods` VALUES (17236204,16,1,1);
INSERT INTO `mob_spawn_mods` VALUES (17236204,12,15,1);
INSERT INTO `mob_spawn_mods` VALUES (17236204,169,10,0);
INSERT INTO `mob_spawn_mods` VALUES (17236203,169,10,0);
INSERT INTO `mob_spawn_mods` VALUES (17236203,12,15,1);
INSERT INTO `mob_spawn_mods` VALUES (17236203,16,1,1);
INSERT INTO `mob_spawn_mods` VALUES (17236203,23,8,1);
INSERT INTO `mob_spawn_mods` VALUES (17367080,33,30,1);
INSERT INTO `mob_spawn_mods` VALUES (17367082,33,30,1);
INSERT INTO `mob_spawn_mods` VALUES (17367085,34,30,1);
INSERT INTO `mob_spawn_mods` VALUES (17375263,34,30,1);
INSERT INTO `mob_spawn_mods` VALUES (17375267,34,30,1);
INSERT INTO `mob_spawn_mods` VALUES (17465360,34,30,1);
INSERT INTO `mob_spawn_mods` VALUES (17465360,33,30,1);
INSERT INTO `mob_spawn_mods` VALUES (17465362,33,30,1);
INSERT INTO `mob_spawn_mods` VALUES (17465364,33,30,1);
INSERT INTO `mob_spawn_mods` VALUES (16806215,26,32,1);
INSERT INTO `mob_spawn_mods` VALUES (16806216,26,32,1);
INSERT INTO `mob_spawn_mods` VALUES (16806217,26,32,1);
INSERT INTO `mob_spawn_mods` VALUES (17207308,1,15000,1);
INSERT INTO `mob_spawn_mods` VALUES (17207308,2,20000,1);
INSERT INTO `mob_spawn_mods` VALUES (17235987,1,1076,1);
INSERT INTO `mob_spawn_mods` VALUES (17235987,2,2765,1);
INSERT INTO `mob_spawn_mods` VALUES (17203216,1,15000,1);
INSERT INTO `mob_spawn_mods` VALUES (17203216,2,20000,1);
INSERT INTO `mob_spawn_mods` VALUES (17555863,1,20000,1);
INSERT INTO `mob_spawn_mods` VALUES (17555863,2,30000,1);
INSERT INTO `mob_spawn_mods` VALUES (17309954,1,18000,1);
INSERT INTO `mob_spawn_mods` VALUES (17309954,2,29250,1);
INSERT INTO `mob_spawn_mods` VALUES (17506370,1,17986,1);
INSERT INTO `mob_spawn_mods` VALUES (17506370,2,27482,1);
INSERT INTO `mob_spawn_mods` VALUES (17502568,1,18227,1);
INSERT INTO `mob_spawn_mods` VALUES (17502568,2,18606,1);
INSERT INTO `mob_spawn_mods` VALUES (17629524,1,6000,1);
INSERT INTO `mob_spawn_mods` VALUES (17629524,2,9234,1);
INSERT INTO `mob_spawn_mods` VALUES (17629641,1,6000,1);
INSERT INTO `mob_spawn_mods` VALUES (17629641,2,9234,1);
INSERT INTO `mob_spawn_mods` VALUES (17629640,1,6000,1);
INSERT INTO `mob_spawn_mods` VALUES (17629640,2,9234,1);
INSERT INTO `mob_spawn_mods` VALUES (17629621,1,6000,1);
INSERT INTO `mob_spawn_mods` VALUES (17629621,2,9234,1);
INSERT INTO `mob_spawn_mods` VALUES (17629483,1,6000,1);
INSERT INTO `mob_spawn_mods` VALUES (17629483,2,9234,1);
INSERT INTO `mob_spawn_mods` VALUES (17629421,1,2100,1);
INSERT INTO `mob_spawn_mods` VALUES (17629421,2,4500,1);
INSERT INTO `mob_spawn_mods` VALUES (17629412,1,2100,1);
INSERT INTO `mob_spawn_mods` VALUES (17629412,2,4500,1);
INSERT INTO `mob_spawn_mods` VALUES (17629561,1,650,1);
INSERT INTO `mob_spawn_mods` VALUES (17629561,2,1450,1);
INSERT INTO `mob_spawn_mods` VALUES (17629281,1,2100,1);
INSERT INTO `mob_spawn_mods` VALUES (17629281,2,4500,1);
INSERT INTO `mob_spawn_mods` VALUES (17629643,1,6000,1);
INSERT INTO `mob_spawn_mods` VALUES (17629643,2,9234,1);
INSERT INTO `mob_spawn_mods` VALUES (17629403,1,4800,1);
INSERT INTO `mob_spawn_mods` VALUES (17629403,2,6000,1);
INSERT INTO `mob_spawn_mods` VALUES (17629238,1,2000,1);
INSERT INTO `mob_spawn_mods` VALUES (17629238,2,6000,1);
INSERT INTO `mob_spawn_mods` VALUES (17629301,1,1000,1);
INSERT INTO `mob_spawn_mods` VALUES (17629301,2,3000,1);
INSERT INTO `mob_spawn_mods` VALUES (17629264,1,10000,1);
INSERT INTO `mob_spawn_mods` VALUES (17629264,2,13640,1);
INSERT INTO `mob_spawn_mods` VALUES (17629644,1,6000,1);
INSERT INTO `mob_spawn_mods` VALUES (17629644,2,9234,1);
INSERT INTO `mob_spawn_mods` VALUES (17629430,1,1200,1);
INSERT INTO `mob_spawn_mods` VALUES (17629430,2,3000,1);
INSERT INTO `mob_spawn_mods` VALUES (16990474,1,5000,1);
INSERT INTO `mob_spawn_mods` VALUES (16990474,2,7000,1);
INSERT INTO `mob_spawn_mods` VALUES (17404333,1,20000,1);
INSERT INTO `mob_spawn_mods` VALUES (17404333,2,24000,1);
INSERT INTO `mob_spawn_mods` VALUES (17461478,1,3000,1);
INSERT INTO `mob_spawn_mods` VALUES (17461478,2,9900,1);
INSERT INTO `mob_spawn_mods` VALUES (17285460,1,379,1);
INSERT INTO `mob_spawn_mods` VALUES (17285460,2,900,1);
INSERT INTO `mob_spawn_mods` VALUES (17490231,1,6000,1);
INSERT INTO `mob_spawn_mods` VALUES (17490231,2,9500,1);
INSERT INTO `mob_spawn_mods` VALUES (17297440,13,1800,1);
INSERT INTO `mob_spawn_mods` VALUES (17297441,13,3600,1);
INSERT INTO `mob_spawn_mods` VALUES (17301537,13,1800,1);
INSERT INTO `mob_spawn_mods` VALUES (17301538,13,3600,1);
INSERT INTO `mob_spawn_mods` VALUES (17408018,13,3600,1);
INSERT INTO `mob_spawn_mods` VALUES (17408019,13,3600,1);
INSERT INTO `mob_spawn_mods` VALUES (17649731,13,1200,1);
INSERT INTO `mob_spawn_mods` VALUES (17613130,13,1800,1);
INSERT INTO `mob_spawn_mods` VALUES (17596720,13,1800,1);
INSERT INTO `mob_spawn_mods` VALUES (17649730,13,600,1);
INSERT INTO `mob_spawn_mods` VALUES (17269106,13,1200,1);
INSERT INTO `mob_spawn_mods` VALUES (17228242,13,1200,1);
INSERT INTO `mob_spawn_mods` VALUES (16990474,13,3600,1);
INSERT INTO `mob_spawn_mods` VALUES (17490016,1,6000,1);
INSERT INTO `mob_spawn_mods` VALUES (17490016,2,9100,1);
INSERT INTO `mob_spawn_mods` VALUES (17617158,1,15000,1);
INSERT INTO `mob_spawn_mods` VALUES (17617158,2,18000,1);
INSERT INTO `mob_spawn_mods` VALUES (17617158,12,20,1);
INSERT INTO `mob_spawn_mods` VALUES (17383433,16,1,1);
INSERT INTO `mob_spawn_mods` VALUES (17383441,16,1,1);
INSERT INTO `mob_spawn_mods` VALUES (17383440,16,1,1);
INSERT INTO `mob_spawn_mods` VALUES (17391765,16,1,1);
INSERT INTO `mob_spawn_mods` VALUES (17391802,16,1,1);
INSERT INTO `mob_spawn_mods` VALUES (17391806,16,1,1);
INSERT INTO `mob_spawn_mods` VALUES (17391848,16,1,1);
INSERT INTO `mob_spawn_mods` VALUES (17391727,16,1,1);
INSERT INTO `mob_spawn_mods` VALUES (17391766,16,1,1);
INSERT INTO `mob_spawn_mods` VALUES (17391803,16,1,1);
INSERT INTO `mob_spawn_mods` VALUES (17391849,16,1,1);
INSERT INTO `mob_spawn_mods` VALUES (17396127,16,1,1);
INSERT INTO `mob_spawn_mods` VALUES (17396133,16,1,1);
INSERT INTO `mob_spawn_mods` VALUES (17396132,16,1,1);
INSERT INTO `mob_spawn_mods` VALUES (17396134,16,1,1);
INSERT INTO `mob_spawn_mods` VALUES (17396137,16,1,1);
INSERT INTO `mob_spawn_mods` VALUES (16814432,1,18000,1);
INSERT INTO `mob_spawn_mods` VALUES (16814432,2,19800,1);
INSERT INTO `mob_spawn_mods` VALUES (16814432,9,80,1);
INSERT INTO `mob_spawn_mods` VALUES (16814432,170,50,0);
INSERT INTO `mob_spawn_mods` VALUES (16814432,168,2,0);
INSERT INTO `mob_spawn_mods` VALUES (16814432,29,33,0);
INSERT INTO `mob_spawn_mods` VALUES (16921015,387,-95,0); -- Jailer of Fortitude -95% phys damage mods
INSERT INTO `mob_spawn_mods` VALUES (16921015,390,-95,0);
INSERT INTO `mob_spawn_mods` VALUES (16921016,60,100,0); -- Kf'ghrah res mods
INSERT INTO `mob_spawn_mods` VALUES (16921016,61,-100,0); 
INSERT INTO `mob_spawn_mods` VALUES (16921017,60,-100,0);
INSERT INTO `mob_spawn_mods` VALUES (16921017,61,100,0); 
INSERT INTO `mob_spawn_mods` VALUES (16912838,407,150,0); -- Jailer of Hope fastcast, -ga chance, 2hr/2hr multi
INSERT INTO `mob_spawn_mods` VALUES (16912838,7,60,1);
INSERT INTO `mob_spawn_mods` VALUES (16912838,16,1,1);
INSERT INTO `mob_spawn_mods` VALUES (16912838,32,1,1);
/*!40000 ALTER TABLE `mob_spawn_mods` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-20 13:55:18
