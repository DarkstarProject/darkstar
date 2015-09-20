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
-- Table structure for table `mob_pool_mods`
--

DROP TABLE IF EXISTS `mob_pool_mods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mob_pool_mods` (
  `poolid` smallint(5) unsigned NOT NULL,
  `modid` smallint(5) unsigned NOT NULL,
  `value` smallint(5) NOT NULL DEFAULT '0',
  `type` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`poolid`,`modid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=13 PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mob_pool_mods`
--

LOCK TABLES `mob_pool_mods` WRITE;
/*!40000 ALTER TABLE `mob_pool_mods` DISABLE KEYS */;
INSERT INTO `mob_pool_mods` VALUES (519,160,-50,0);
INSERT INTO `mob_pool_mods` VALUES (532,160,-50,0);
INSERT INTO `mob_pool_mods` VALUES (676,160,-50,0);
INSERT INTO `mob_pool_mods` VALUES (697,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (2643,160,-50,0);
INSERT INTO `mob_pool_mods` VALUES (2647,160,-50,0);
INSERT INTO `mob_pool_mods` VALUES (733,302,5,0);
INSERT INTO `mob_pool_mods` VALUES (2677,288,55,0);
INSERT INTO `mob_pool_mods` VALUES (21,29,100,0);
INSERT INTO `mob_pool_mods` VALUES (2156,370,25,0);
INSERT INTO `mob_pool_mods` VALUES (2262,370,125,0);
INSERT INTO `mob_pool_mods` VALUES (4261,370,25,0);
INSERT INTO `mob_pool_mods` VALUES (4261,29,50,0);
INSERT INTO `mob_pool_mods` VALUES (2420,302,10,0);
INSERT INTO `mob_pool_mods` VALUES (1648,224,5,0);
INSERT INTO `mob_pool_mods` VALUES (2790,244,7,0);
INSERT INTO `mob_pool_mods` VALUES (2790,240,7,0);
INSERT INTO `mob_pool_mods` VALUES (2790,168,50,0);
INSERT INTO `mob_pool_mods` VALUES (3549,370,50,0);
INSERT INTO `mob_pool_mods` VALUES (1648,17,1,1);
INSERT INTO `mob_pool_mods` VALUES (3916,370,25,0);
INSERT INTO `mob_pool_mods` VALUES (3916,164,-50,0);
INSERT INTO `mob_pool_mods` VALUES (3916,29,50,0);
INSERT INTO `mob_pool_mods` VALUES (3796,21,97,1);
INSERT INTO `mob_pool_mods` VALUES (4396,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (979,8,60,1);
INSERT INTO `mob_pool_mods` VALUES (979,9,60,1);
INSERT INTO `mob_pool_mods` VALUES (639,63,25,0);
INSERT INTO `mob_pool_mods` VALUES (2271,64,15,0);
INSERT INTO `mob_pool_mods` VALUES (2271,65,15,0);
INSERT INTO `mob_pool_mods` VALUES (2271,165,15,0);
INSERT INTO `mob_pool_mods` VALUES (2254,407,100,0);
INSERT INTO `mob_pool_mods` VALUES (1719,29,2,1);
INSERT INTO `mob_pool_mods` VALUES (1663,29,3,1);
INSERT INTO `mob_pool_mods` VALUES (3824,29,2,1);
INSERT INTO `mob_pool_mods` VALUES (2255,368,70,0);
INSERT INTO `mob_pool_mods` VALUES (2255,34,60,1);
INSERT INTO `mob_pool_mods` VALUES (2255,3,100,1);
INSERT INTO `mob_pool_mods` VALUES (2180,3,100,1);
INSERT INTO `mob_pool_mods` VALUES (3598,368,70,0);
INSERT INTO `mob_pool_mods` VALUES (3600,368,70,0);
INSERT INTO `mob_pool_mods` VALUES (3601,368,70,0);
INSERT INTO `mob_pool_mods` VALUES (1280,368,70,0);
INSERT INTO `mob_pool_mods` VALUES (2840,370,50,0);
INSERT INTO `mob_pool_mods` VALUES (2840,368,70,0);
INSERT INTO `mob_pool_mods` VALUES (2047,163,-100,0);
INSERT INTO `mob_pool_mods` VALUES (1178,163,-100,0);
INSERT INTO `mob_pool_mods` VALUES (3759,163,-100,0);
INSERT INTO `mob_pool_mods` VALUES (3941,163,-100,0);
INSERT INTO `mob_pool_mods` VALUES (1792,368,70,0);
INSERT INTO `mob_pool_mods` VALUES (2973,370,1,0);
INSERT INTO `mob_pool_mods` VALUES (4083,370,1,0);
INSERT INTO `mob_pool_mods` VALUES (2265,368,150,0);
INSERT INTO `mob_pool_mods` VALUES (2265,370,50,0);
INSERT INTO `mob_pool_mods` VALUES (44,368,150,0);
INSERT INTO `mob_pool_mods` VALUES (268,370,50,0);
INSERT INTO `mob_pool_mods` VALUES (268,368,150,0);
INSERT INTO `mob_pool_mods` VALUES (370,28,5,1);
INSERT INTO `mob_pool_mods` VALUES (768,28,5,1);
INSERT INTO `mob_pool_mods` VALUES (958,28,5,1);
INSERT INTO `mob_pool_mods` VALUES (978,28,23,1);
INSERT INTO `mob_pool_mods` VALUES (2745,28,23,1);
INSERT INTO `mob_pool_mods` VALUES (1806,28,10,1);
INSERT INTO `mob_pool_mods` VALUES (1429,28,10,1);
INSERT INTO `mob_pool_mods` VALUES (2314,28,23,1);
INSERT INTO `mob_pool_mods` VALUES (3168,28,10,1);
INSERT INTO `mob_pool_mods` VALUES (1841,28,10,1);
INSERT INTO `mob_pool_mods` VALUES (3853,28,23,1);
INSERT INTO `mob_pool_mods` VALUES (2675,4,25,1);
INSERT INTO `mob_pool_mods` VALUES (1456,368,20,0);
INSERT INTO `mob_pool_mods` VALUES (1154,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (1798,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (2729,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (4052,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (4670,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (4673,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (4671,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (4672,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (1491,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (3816,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (3540,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (592,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (592,302,45,0);
INSERT INTO `mob_pool_mods` VALUES (592,68,15,0);
INSERT INTO `mob_pool_mods` VALUES (2460,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (1773,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (595,14,703,1);
INSERT INTO `mob_pool_mods` VALUES (595,169,250,0);
INSERT INTO `mob_pool_mods` VALUES (595,171,40,0);
INSERT INTO `mob_pool_mods` VALUES (595,23,15,1);
INSERT INTO `mob_pool_mods` VALUES (2083,29,25,0);
INSERT INTO `mob_pool_mods` VALUES (2664,12,1,1);
INSERT INTO `mob_pool_mods` VALUES (276,12,1,1);
INSERT INTO `mob_pool_mods` VALUES (1027,12,1,1);
INSERT INTO `mob_pool_mods` VALUES (912,12,25,1);
INSERT INTO `mob_pool_mods` VALUES (3540,3,100,1);
INSERT INTO `mob_pool_mods` VALUES (592,3,100,1);
INSERT INTO `mob_pool_mods` VALUES (1491,3,100,1);
INSERT INTO `mob_pool_mods` VALUES (3816,3,100,1);
INSERT INTO `mob_pool_mods` VALUES (4670,3,100,1);
INSERT INTO `mob_pool_mods` VALUES (4671,3,100,1);
INSERT INTO `mob_pool_mods` VALUES (4672,3,100,1);
INSERT INTO `mob_pool_mods` VALUES (4673,3,100,1);
INSERT INTO `mob_pool_mods` VALUES (154,163,-70,0);
INSERT INTO `mob_pool_mods` VALUES (3208,370,20,0);
INSERT INTO `mob_pool_mods` VALUES (4504,4,30,1);
INSERT INTO `mob_pool_mods` VALUES (1306,4,30,1);
INSERT INTO `mob_pool_mods` VALUES (1461,4,4,1);
INSERT INTO `mob_pool_mods` VALUES (1754,4,4,1);
INSERT INTO `mob_pool_mods` VALUES (4082,4,4,1);
INSERT INTO `mob_pool_mods` VALUES (3781,4,4,1);
INSERT INTO `mob_pool_mods` VALUES (3051,4,4,1);
INSERT INTO `mob_pool_mods` VALUES (3379,4,4,1);
INSERT INTO `mob_pool_mods` VALUES (770,4,4,1);
INSERT INTO `mob_pool_mods` VALUES (2793,4,4,1);
INSERT INTO `mob_pool_mods` VALUES (1234,4,4,1);
INSERT INTO `mob_pool_mods` VALUES (906,4,4,1);
INSERT INTO `mob_pool_mods` VALUES (289,4,4,1);
INSERT INTO `mob_pool_mods` VALUES (4222,4,4,1);
INSERT INTO `mob_pool_mods` VALUES (2748,370,5,0);
INSERT INTO `mob_pool_mods` VALUES (3129,370,50,0);
INSERT INTO `mob_pool_mods` VALUES (2922,370,100,0);
INSERT INTO `mob_pool_mods` VALUES (930,370,15,0);
INSERT INTO `mob_pool_mods` VALUES (4494,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (1034,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (1100,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (1101,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (4224,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (4235,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (3425,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (877,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (60,370,20,0);
INSERT INTO `mob_pool_mods` VALUES (410,236,20,0);
INSERT INTO `mob_pool_mods` VALUES (237,44,1,1);
INSERT INTO `mob_pool_mods` VALUES (4361,5,16,1);
INSERT INTO `mob_pool_mods` VALUES (4361,288,55,0);
INSERT INTO `mob_pool_mods` VALUES (4361,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (2766,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (3828,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (707,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (4005,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (559,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (2916,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (242,40,30,1);
INSERT INTO `mob_pool_mods` VALUES (242,41,680,1);
INSERT INTO `mob_pool_mods` VALUES (242,42,706,1);
INSERT INTO `mob_pool_mods` VALUES (242,43,1,1);
INSERT INTO `mob_pool_mods` VALUES (242,47,22,1);
INSERT INTO `mob_pool_mods` VALUES (3124,48,434,1);
INSERT INTO `mob_pool_mods` VALUES (2105,48,434,1);
INSERT INTO `mob_pool_mods` VALUES (70,48,434,1);
INSERT INTO `mob_pool_mods` VALUES (1270,39,-1,1);
INSERT INTO `mob_pool_mods` VALUES (1851,16,1,1);
INSERT INTO `mob_pool_mods` VALUES (1851,32,1,1);

-- -------------------------
--  Antlion MOBMOD_SPECIAL_SKILL Pit_Ambush 
-- -------------------------
INSERT INTO `mob_pool_mods` VALUES (586,30,22,1); -- Burrow Antlion 
INSERT INTO `mob_pool_mods` VALUES (3141,30,22,1); -- Pit Antlion 
INSERT INTO `mob_pool_mods` VALUES (3996,30,22,1); -- Trench Antlion 
INSERT INTO `mob_pool_mods` VALUES (662,30,22,1); -- Cave Antlion 

-- -------------------------
--  Race Runner
-- -------------------------
INSERT INTO `mob_pool_mods` VALUES (3301, 29, 100, 0); -- Magic Def 
INSERT INTO `mob_pool_mods` VALUES (3301, 302, 10, 0); -- Triple Attack 

-- -------------------------
--  Bloodlapper
-- -------------------------
INSERT INTO `mob_pool_mods` VALUES (459, 430, 20, 0); -- Quad Attack 
INSERT INTO `mob_pool_mods` VALUES (459, 23, 50, 0); -- Attack 
INSERT INTO `mob_pool_mods` VALUES (459, 73, 25, 0); -- Store TP  

-- Add promyvian boss mods
INSERT INTO `mob_pool_mods` VALUES (681,14,706,1);
INSERT INTO `mob_pool_mods` VALUES (681,368,10,0);
INSERT INTO `mob_pool_mods` VALUES (4382,14,706,1);
INSERT INTO `mob_pool_mods` VALUES (3172,14,706,1);
INSERT INTO `mob_pool_mods` VALUES (760,14,706,1);
INSERT INTO `mob_pool_mods` VALUES (782,14,706,1);
INSERT INTO `mob_pool_mods` VALUES (63,14,706,1);
INSERT INTO `mob_pool_mods` VALUES (820,368,10,0);
INSERT INTO `mob_pool_mods` VALUES (820,14,707,1);
INSERT INTO `mob_pool_mods` VALUES (861,14,707,1);
INSERT INTO `mob_pool_mods` VALUES (966,14,707,1);
INSERT INTO `mob_pool_mods` VALUES (1237,14,707,1);
INSERT INTO `mob_pool_mods` VALUES (3351,14,707,1);
INSERT INTO `mob_pool_mods` VALUES (3699,14,707,1);
INSERT INTO `mob_pool_mods` VALUES (3206,14,708,1);
INSERT INTO `mob_pool_mods` VALUES (2080,14,708,1);
INSERT INTO `mob_pool_mods` VALUES (2081,14,708,1);
INSERT INTO `mob_pool_mods` VALUES (2824,14,708,1);
INSERT INTO `mob_pool_mods` VALUES (2825,14,708,1);
INSERT INTO `mob_pool_mods` VALUES (2826,14,708,1);
INSERT INTO `mob_pool_mods` VALUES (2827,14,708,1);
INSERT INTO `mob_pool_mods` VALUES (3202,14,708,1);
INSERT INTO `mob_pool_mods` VALUES (3204,14,708,1);
INSERT INTO `mob_pool_mods` VALUES (3483,14,708,1);

/*!40000 ALTER TABLE `mob_pool_mods` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-20 13:54:52
