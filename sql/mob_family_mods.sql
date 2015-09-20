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
-- Table structure for table `mob_family_mods`
--

DROP TABLE IF EXISTS `mob_family_mods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mob_family_mods` (
  `familyid` smallint(5) unsigned NOT NULL,
  `modid` smallint(5) unsigned NOT NULL,
  `value` smallint(5) NOT NULL DEFAULT '0',
  `type` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`familyid`,`modid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=13 PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mob_family_mods`
--

LOCK TABLES `mob_family_mods` WRITE;
/*!40000 ALTER TABLE `mob_family_mods` DISABLE KEYS */;
INSERT INTO `mob_family_mods` VALUES (175,29,50,0);
INSERT INTO `mob_family_mods` VALUES (4,29,25,0);
INSERT INTO `mob_family_mods` VALUES (4,7,60,1);
INSERT INTO `mob_family_mods` VALUES (74,29,25,0);
INSERT INTO `mob_family_mods` VALUES (61,29,25,0);
INSERT INTO `mob_family_mods` VALUES (169,29,25,0);
INSERT INTO `mob_family_mods` VALUES (110,29,13,0);
INSERT INTO `mob_family_mods` VALUES (111,29,13,0);
INSERT INTO `mob_family_mods` VALUES (171,29,13,0);
INSERT INTO `mob_family_mods` VALUES (47,240,2,0);
INSERT INTO `mob_family_mods` VALUES (46,240,2,0);
INSERT INTO `mob_family_mods` VALUES (4,244,2,0);
INSERT INTO `mob_family_mods` VALUES (193,3,40,1);
INSERT INTO `mob_family_mods` VALUES (34,3,100,1);
INSERT INTO `mob_family_mods` VALUES (267,4,20,1);
INSERT INTO `mob_family_mods` VALUES (87,4,18,1);

-- Define sublinks
INSERT INTO `mob_family_mods` VALUES (87,5,10,1);
INSERT INTO `mob_family_mods` VALUES (240,10,1,1);
INSERT INTO `mob_family_mods` VALUES (169,10,1,1);
INSERT INTO `mob_family_mods` VALUES (190,10,2,1);
INSERT INTO `mob_family_mods` VALUES (189,10,2,1);
INSERT INTO `mob_family_mods` VALUES (334,10,2,1);
INSERT INTO `mob_family_mods` VALUES (46,10,3,1);
INSERT INTO `mob_family_mods` VALUES (252,10,3,1);
INSERT INTO `mob_family_mods` VALUES (47,10,3,1);
INSERT INTO `mob_family_mods` VALUES (245,10,4,1);
INSERT INTO `mob_family_mods` VALUES (216,10,4,1);
INSERT INTO `mob_family_mods` VALUES (133,10,5,1);
INSERT INTO `mob_family_mods` VALUES (184,10,5,1);
INSERT INTO `mob_family_mods` VALUES (59,10,5,1);
INSERT INTO `mob_family_mods` VALUES (253,10,6,1);
INSERT INTO `mob_family_mods` VALUES (254,10,6,1);
INSERT INTO `mob_family_mods` VALUES (212,10,7,1);
INSERT INTO `mob_family_mods` VALUES (362,10,7,1);

INSERT INTO `mob_family_mods` VALUES (169,11,15,1);
INSERT INTO `mob_family_mods` VALUES (358,11,15,1);
INSERT INTO `mob_family_mods` VALUES (110,3,50,1);
INSERT INTO `mob_family_mods` VALUES (111,3,50,1);
INSERT INTO `mob_family_mods` VALUES (121,242,20,0);
INSERT INTO `mob_family_mods` VALUES (52,242,20,0);
INSERT INTO `mob_family_mods` VALUES (358,16,1,1);
INSERT INTO `mob_family_mods` VALUES (327,16,1,1);
INSERT INTO `mob_family_mods` VALUES (334,16,1,1);
INSERT INTO `mob_family_mods` VALUES (337,16,1,1);
INSERT INTO `mob_family_mods` VALUES (360,16,1,1);
INSERT INTO `mob_family_mods` VALUES (359,16,1,1);
INSERT INTO `mob_family_mods` VALUES (258,36,60,1);
INSERT INTO `mob_family_mods` VALUES (258,34,25,1);
INSERT INTO `mob_family_mods` VALUES (217,23,256,1);
INSERT INTO `mob_family_mods` VALUES (274,23,256,1);
INSERT INTO `mob_family_mods` VALUES (273,23,256,1);
INSERT INTO `mob_family_mods` VALUES (234,37,1,1);
INSERT INTO `mob_family_mods` VALUES (72,29,10,0);
INSERT INTO `mob_family_mods` VALUES (72,69,20,0);
INSERT INTO `mob_family_mods` VALUES (57,3,50,1);
INSERT INTO `mob_family_mods` VALUES (72,3,50,1);
INSERT INTO `mob_family_mods` VALUES (140,3,50,1);
INSERT INTO `mob_family_mods` VALUES (141,3,50,1);
INSERT INTO `mob_family_mods` VALUES (207,3,50,1);
INSERT INTO `mob_family_mods` VALUES (255,3,50,1);
INSERT INTO `mob_family_mods` VALUES (253,3,50,1);
INSERT INTO `mob_family_mods` VALUES (194,3,50,1);
INSERT INTO `mob_family_mods` VALUES (271,3,50,1);
INSERT INTO `mob_family_mods` VALUES (135,4,4,1);
INSERT INTO `mob_family_mods` VALUES (373,16,1,1);
INSERT INTO `mob_family_mods` VALUES (394,41,732,1);
INSERT INTO `mob_family_mods` VALUES (394,42,733,1);
INSERT INTO `mob_family_mods` VALUES (394,43,2,1);
INSERT INTO `mob_family_mods` VALUES (150,4,30,1);
INSERT INTO `mob_family_mods` VALUES (394,4,30,1);
INSERT INTO `mob_family_mods` VALUES (236,4,30,1);

-- Adjust magic damage taken
INSERT INTO `mob_family_mods` VALUES (4,389,-64,0);
INSERT INTO `mob_family_mods` VALUES (112,389,64,0);
INSERT INTO `mob_family_mods` VALUES (61,389,-64,0);
INSERT INTO `mob_family_mods` VALUES (74,389,-64,0);
INSERT INTO `mob_family_mods` VALUES (358,389,-64,0);
INSERT INTO `mob_family_mods` VALUES (169,389,-64,0);
INSERT INTO `mob_family_mods` VALUES (110,389,-32,0);
INSERT INTO `mob_family_mods` VALUES (122,389,-32,0);
INSERT INTO `mob_family_mods` VALUES (123,389,-32,0);
INSERT INTO `mob_family_mods` VALUES (124,389,-32,0);
INSERT INTO `mob_family_mods` VALUES (175,389,-128,0);
INSERT INTO `mob_family_mods` VALUES (171,389,-32,0);

-- Demons and fomors are highly resistant to lullaby
INSERT INTO `mob_family_mods` VALUES (358,254,200,0);
INSERT INTO `mob_family_mods` VALUES (169,254,200,0);
INSERT INTO `mob_family_mods` VALUES (115,254,200,0);
INSERT INTO `mob_family_mods` VALUES (359,254,200,0);

/*!40000 ALTER TABLE `mob_family_mods` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-09 17:42:22
