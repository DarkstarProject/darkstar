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
-- Table structure for table `mob_spell_lists`
--

DROP TABLE IF EXISTS `mob_spell_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mob_spell_lists` (
  `spell_list_name` char(20) DEFAULT NULL,
  `spell_list_id` smallint(5) unsigned NOT NULL,
  `spell_id` smallint(3) unsigned NOT NULL,
  `min_level` tinyint(3) unsigned NOT NULL,
  `max_level` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`spell_list_id`,`spell_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mob_spell_lists`
--

LOCK TABLES `mob_spell_lists` WRITE;
/*!40000 ALTER TABLE `mob_spell_lists` DISABLE KEYS */;
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,1,1,10);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,2,11,20);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,3,21,40);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,4,41,60);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,5,61,79);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,6,80,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,14,6,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,15,9,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,16,14,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,17,19,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,18,39,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,19,34,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,20,29,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,21,50,94);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,22,95,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,23,3,35);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,24,36,64);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,25,65,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,28,5,29);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,29,30,60);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,30,61,72);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,31,73,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,33,18,54);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,34,60,73);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,35,74,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,38,15,39);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,39,40,68);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,40,69,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,43,7,26);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,44,27,46);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,45,47,62);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,46,63,75);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,47,80,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,48,17,36);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,49,37,56);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,50,57,67);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,51,68,75);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,52,80,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,53,19,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,54,28,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,55,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,56,13,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,57,40,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,58,4,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,59,15,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,108,21,43);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,110,44,65);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,111,66,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,112,45,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,143,32,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_WHM',1,477,86,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,144,13,22);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,145,38,47);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,146,62,67);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,147,73,85);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,148,86,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,149,17,27);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,150,42,53);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,151,64,68);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,152,74,88);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,153,89,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,154,9,18);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,155,34,44);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,156,59,66);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,157,72,82);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,158,83,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,159,1,10);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,160,26,35);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,161,51,60);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,162,68,73);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,163,77,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,164,21,46);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,165,46,55);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,166,66,70);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,167,75,92);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,168,92,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,169,5,12);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,170,30,40);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,171,55,61);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,172,70,78);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,173,80,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,174,28,35);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,175,53,60);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,176,69,90);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,179,32,39);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,180,57,62);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,181,71,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,184,23,31);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,185,48,56);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,186,67,71);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,189,15,22);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,190,40,47);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,191,63,67);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,194,36,43);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,195,61,65);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,196,73,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,199,19,27);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,200,44,52);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,201,65,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,204,60,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,206,50,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,208,52,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,210,54,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,212,56,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,214,58,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,220,3,17);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,221,43,64);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,225,24,71);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,226,72,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,230,10,34);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,231,35,59);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,232,60,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,235,24,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,236,22,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,237,20,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,238,18,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,239,16,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,240,27,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,245,12,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,247,25,82);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,248,83,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,249,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,252,45,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,253,20,40);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,254,4,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,258,7,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,259,41,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,273,31,55);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLM',2,274,56,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,1,3,13);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,2,14,25);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,3,26,48);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,4,48,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,23,1,30);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,24,31,59);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,25,60,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,33,15,54);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,34,55,70);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,35,71,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,43,7,26);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,44,27,46);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,45,47,62);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,46,63,76);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,47,80,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,48,17,36);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,49,37,56);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,50,57,67);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,51,68,86);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,52,87,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,53,23,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,54,34,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,55,12,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,56,13,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,57,48,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,58,6,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,59,18,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,100,24,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,101,22,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,102,20,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,103,18,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,104,16,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,105,27,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,108,21,75);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,110,80,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,144,19,49);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,145,50,70);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,146,71,85);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,147,86,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,149,24,54);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,150,55,72);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,151,73,88);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,152,89,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,154,14,44);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,155,45,68);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,156,69,82);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,157,83,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,159,4,34);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,160,35,64);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,161,65,76);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,162,77,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,164,29,59);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,165,60,74);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,166,75,91);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,167,89,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,169,9,39);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,170,40,66);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,171,67,88);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,172,80,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,216,21,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,220,5,45);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,221,46,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,230,10,35);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,231,36,70);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,232,71,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,253,25,45);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,254,8,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,258,11,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,259,46,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_RDM',3,260,32,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_PLD',4,1,5,16);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_PLD',4,2,17,29);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_PLD',4,3,30,54);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_PLD',4,4,55,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_PLD',4,21,55,98);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_PLD',4,22,99,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_PLD',4,28,7,33);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_PLD',4,29,34,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_PLD',4,43,10,29);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_PLD',4,44,30,49);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_PLD',4,45,50,69);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_PLD',4,46,70,89);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_PLD',4,47,90,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_PLD',4,48,20,39);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_PLD',4,49,40,59);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_PLD',4,50,60,79);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_PLD',4,51,80,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_PLD',4,112,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,144,23,34);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,145,60,71);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,146,88,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,149,29,41);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,150,66,78);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,151,92,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,154,17,28);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,155,54,65);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,156,84,91);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,159,5,16);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,160,42,53);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,161,76,83);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,164,35,71);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,165,72,83);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,166,96,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,169,11,22);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,170,48,59);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,171,80,87);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,220,6,45);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,221,46,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,225,26,50);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,230,15,39);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,231,40,69);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,232,68,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,242,61,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,245,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,247,20,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,252,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,253,30,55);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,258,20,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,259,56,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,266,43,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,267,41,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,268,35,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,269,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,270,39,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,271,31,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,272,33,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_DRK',5,275,45,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,368,7,16);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,369,17,36);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,370,37,46);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,371,47,56);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,372,57,66);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,373,67,75);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,374,76,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,376,27,91);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,377,92,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,378,5,14);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,379,15,34);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,380,35,44);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,381,45,64);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,382,65,77);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,383,78,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,389,1,20);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,390,21,40);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,391,41,60);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,392,61,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,394,3,22);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,395,23,42);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,396,43,62);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,397,63,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,399,11,50);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,400,51,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,403,13,52);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,404,53,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,419,29,59);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,420,60,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,421,39,58);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,422,59,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,462,33,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BRD',6,463,16,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,320,15,39);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,321,40,72);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,322,73,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,323,15,39);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,324,40,72);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,325,73,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,326,15,39);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,327,40,72);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,328,73,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,329,15,39);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,330,40,72);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,331,73,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,332,15,39);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,333,40,72);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,334,73,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,335,15,39);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,336,40,72);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,337,73,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,338,12,36);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,339,37,72);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,340,73,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,341,30,64);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,342,65,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,344,23,47);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,345,48,75);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,346,76,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,347,19,43);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,348,44,72);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,349,73,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,350,27,55);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,351,56,74);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_NIN',7,352,76,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLU',8,517,8,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLU',8,519,26,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLU',8,521,42,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLU',8,524,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLU',8,539,40,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLU',8,542,36,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLU',8,545,48,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLU',8,547,8,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLU',8,548,52,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLU',8,549,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLU',8,565,54,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLU',8,569,38,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLU',8,572,32,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLU',8,573,64,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLU',8,576,64,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLU',8,579,64,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLU',8,587,20,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLU',8,595,62,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLU',8,596,36,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLU',8,597,4,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLU',8,598,24,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLU',8,603,4,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLU',8,604,61,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLU',8,606,46,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLU',8,610,65,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLU',8,621,66,255);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_BLU',8,631,63,255);
INSERT INTO `mob_spell_lists` VALUES ('Worm',9,54,28,255);
INSERT INTO `mob_spell_lists` VALUES ('Worm',9,159,1,25);
INSERT INTO `mob_spell_lists` VALUES ('Worm',9,160,26,50);
INSERT INTO `mob_spell_lists` VALUES ('Worm',9,161,51,67);
INSERT INTO `mob_spell_lists` VALUES ('Worm',9,162,68,76);
INSERT INTO `mob_spell_lists` VALUES ('Worm',9,163,77,255);
INSERT INTO `mob_spell_lists` VALUES ('Worm',9,189,15,39);
INSERT INTO `mob_spell_lists` VALUES ('Worm',9,190,40,63);
INSERT INTO `mob_spell_lists` VALUES ('Worm',9,191,63,255);
INSERT INTO `mob_spell_lists` VALUES ('Worm',9,210,54,255);
INSERT INTO `mob_spell_lists` VALUES ('Worm',9,238,18,50);
INSERT INTO `mob_spell_lists` VALUES ('Worm',9,258,7,255);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,144,13,25);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,145,38,47);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,146,62,72);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,147,76,85);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,148,86,255);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,154,9,33);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,155,34,47);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,156,59,71);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,157,72,82);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,158,83,255);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,164,21,45);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,165,46,55);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,166,66,74);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,167,75,91);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,168,92,255);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,169,5,29);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,170,30,54);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,171,55,66);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,172,70,79);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,173,80,255);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,174,28,52);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,175,53,60);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,176,69,255);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,184,23,47);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,185,48,56);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,186,67,255);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,194,36,60);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,195,61,72);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,196,73,255);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,204,60,255);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,235,24,50);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,237,24,50);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,245,12,255);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,247,25,255);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,249,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,252,45,255);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,253,20,40);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,254,4,255);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,258,7,255);
INSERT INTO `mob_spell_lists` VALUES ('Hecteyes',10,259,41,55);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,144,13,22);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,145,38,47);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,146,62,67);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,147,73,85);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,148,86,255);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,154,9,16);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,155,34,41);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,156,59,64);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,157,72,82);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,158,83,255);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,164,21,34);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,165,46,54);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,166,66,70);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,167,75,91);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,168,92,255);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,179,32,39);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,180,57,62);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,181,71,255);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,184,23,31);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,185,48,57);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,186,67,255);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,194,36,43);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,195,61,66);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,196,73,255);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,199,19,27);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,200,44,53);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,201,65,70);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,230,10,34);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,231,35,59);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,232,60,255);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,245,12,255);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,249,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,258,7,255);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,273,31,55);
INSERT INTO `mob_spell_lists` VALUES ('Ahriman',11,274,56,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Air',12,53,19,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Air',12,59,15,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Air',12,102,20,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Air',12,154,9,33);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Air',12,155,34,58);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Air',12,156,59,71);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Air',12,157,72,82);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Air',12,158,83,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Air',12,184,23,47);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Air',12,185,48,66);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Air',12,186,67,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Air',12,216,21,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Air',12,237,20,50);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Earth',13,54,28,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Earth',13,56,13,74);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Earth',13,79,75,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Earth',13,103,18,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Earth',13,159,1,25);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Earth',13,160,26,50);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Earth',13,161,51,67);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Earth',13,162,68,76);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Earth',13,163,77,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Earth',13,189,15,39);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Earth',13,190,40,62);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Earth',13,191,63,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Earth',13,238,18,50);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Ice',14,58,4,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Ice',14,101,22,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Ice',14,149,17,41);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Ice',14,150,42,63);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Ice',14,151,64,73);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Ice',14,152,74,88);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Ice',14,153,89,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Ice',14,179,32,56);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Ice',14,180,57,70);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Ice',14,181,71,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Ice',14,236,22,50);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Ice',14,250,20,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Ice',14,258,7,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Water',15,55,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Water',15,105,27,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Water',15,169,5,29);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Water',15,170,30,54);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Water',15,171,55,69);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Water',15,172,70,79);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Water',15,173,80,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Water',15,199,19,43);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Water',15,200,44,64);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Water',15,201,65,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Water',15,220,3,42);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Water',15,221,43,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Water',15,225,24,59);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Water',15,240,27,50);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Thunder',16,104,16,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Thunder',16,164,21,45);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Thunder',16,165,46,65);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Thunder',16,166,66,74);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Thunder',16,167,75,91);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Thunder',16,168,92,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Thunder',16,194,36,60);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Thunder',16,195,61,72);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Thunder',16,196,73,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Thunder',16,239,16,50);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Thunder',16,251,30,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Thunder',16,252,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Fire',17,100,24,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Fire',17,144,13,37);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Fire',17,145,38,61);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Fire',17,146,62,72);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Fire',17,147,73,85);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Fire',17,148,86,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Fire',17,174,28,52);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Fire',17,175,53,68);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Fire',17,176,69,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Fire',17,235,24,50);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Fire',17,249,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Dark',18,230,10,35);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Dark',18,231,36,59);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Dark',18,232,60,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Dark',18,242,61,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Dark',18,245,12,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Dark',18,247,25,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Dark',18,252,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Dark',18,260,32,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Dark',18,266,43,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Dark',18,267,41,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Dark',18,268,35,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Dark',18,269,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Dark',18,270,39,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Dark',18,271,31,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Dark',18,272,33,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Dark',18,273,31,55);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Dark',18,274,56,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Dark',18,275,45,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,1,1,10);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,2,11,20);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,3,21,40);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,4,41,60);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,5,61,79);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,6,80,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,21,50,94);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,22,95,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,23,1,30);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,24,31,59);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,25,60,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,28,5,29);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,29,30,64);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,30,65,89);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,31,90,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,38,15,39);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,39,40,70);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,40,71,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,43,7,26);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,44,27,46);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,45,47,62);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,46,63,75);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,47,76,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,48,17,36);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,49,37,56);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,50,57,67);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,51,68,75);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,52,76,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,108,21,43);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,110,44,65);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,111,66,85);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,112,45,255);
INSERT INTO `mob_spell_lists` VALUES ('Elemental_Light',19,477,86,255);
INSERT INTO `mob_spell_lists` VALUES ('Shadow_Lord',20,175,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Shadow_Lord',20,180,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Shadow_Lord',20,185,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Shadow_Lord',20,190,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Shadow_Lord',20,195,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Shadow_Lord',20,200,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Shadow_Lord',20,235,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Shadow_Lord',20,236,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Shadow_Lord',20,237,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Shadow_Lord',20,238,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Shadow_Lord',20,239,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Shadow_Lord',20,240,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Shadow_Lord',20,245,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Shadow_Lord',20,247,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Shadow_Lord',20,250,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Shadow_Lord',20,254,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Kam_Lanaut',21,356,76,255);
INSERT INTO `mob_spell_lists` VALUES ('Kam_Lanaut',21,357,75,255);
INSERT INTO `mob_spell_lists` VALUES ('Kam_Lanaut',21,359,75,255);
INSERT INTO `mob_spell_lists` VALUES ('Kam_Lanaut',21,360,75,255);
INSERT INTO `mob_spell_lists` VALUES ('Kam_Lanaut',21,366,76,255);
INSERT INTO `mob_spell_lists` VALUES ('Eald_Narche',22,204,75,255);
INSERT INTO `mob_spell_lists` VALUES ('Eald_Narche',22,206,75,255);
INSERT INTO `mob_spell_lists` VALUES ('Eald_Narche',22,208,75,255);
INSERT INTO `mob_spell_lists` VALUES ('Eald_Narche',22,210,75,255);
INSERT INTO `mob_spell_lists` VALUES ('Eald_Narche',22,212,75,255);
INSERT INTO `mob_spell_lists` VALUES ('Eald_Narche',22,214,75,255);
INSERT INTO `mob_spell_lists` VALUES ('Eald_Narche',22,274,75,255);
INSERT INTO `mob_spell_lists` VALUES ('Kirin',23,163,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Kirin',23,192,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Kirin',23,210,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Kirin',23,238,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Kirin',23,273,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Genbu',24,172,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Genbu',24,201,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Genbu',24,214,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Genbu',24,227,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Genbu',24,240,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Seiryu',25,157,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Seiryu',25,186,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Seiryu',25,208,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Seiryu',25,237,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Byakko',26,21,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Byakko',26,25,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Byakko',26,31,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Byakko',26,35,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Byakko',26,40,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Suzaku',27,147,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Suzaku',27,176,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Suzaku',27,204,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Suzaku',27,235,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,144,13,20);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,145,38,45);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,146,62,72);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,147,73,85);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,148,86,255);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,149,17,25);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,150,42,54);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,151,64,67);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,152,74,88);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,153,89,255);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,154,9,15);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,155,34,41);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,156,59,63);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,157,72,82);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,158,83,255);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,159,1,8);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,160,26,34);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,161,51,58);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,162,68,72);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,163,77,255);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,164,21,30);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,165,46,54);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,166,66,69);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,167,75,92);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,168,92,255);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,169,5,29);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,170,30,37);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,171,55,61);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,172,70,79);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,173,80,255);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,174,28,35);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,175,53,60);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,176,69,255);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,179,32,39);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,180,57,61);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,181,71,255);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,184,23,31);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,185,48,55);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,186,67,255);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,189,15,22);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,190,40,47);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,191,63,72);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,194,36,44);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,195,61,64);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,196,73,255);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,199,19,27);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,200,44,47);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,206,50,255);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,210,54,255);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,220,3,25);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,221,43,64);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,225,24,69);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,226,70,255);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,230,10,34);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,231,35,59);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,232,60,255);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,236,22,50);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,245,12,255);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,247,25,82);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,248,83,255);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,250,20,255);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,252,45,255);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,253,20,255);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,254,4,255);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,258,7,255);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,259,41,255);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,273,31,55);
INSERT INTO `mob_spell_lists` VALUES ('Undead',28,274,56,255);
INSERT INTO `mob_spell_lists` VALUES ('Mammet-19',29,174,40,40);
INSERT INTO `mob_spell_lists` VALUES ('Mammet-19',29,179,40,40);
INSERT INTO `mob_spell_lists` VALUES ('Mammet-19',29,184,40,40);
INSERT INTO `mob_spell_lists` VALUES ('Mammet-19',29,189,40,40);
INSERT INTO `mob_spell_lists` VALUES ('Mammet-19',29,194,40,40);
INSERT INTO `mob_spell_lists` VALUES ('Mammet-19',29,199,40,40);
INSERT INTO `mob_spell_lists` VALUES ('Yagudo_SMN',30,288,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Yagudo_SMN',30,290,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Yagudo_SMN',30,291,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Kindred_SMN',31,289,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Kindred_SMN',31,292,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Kindred_SMN',31,295,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Tonberry_SMN',32,288,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Tonberry_SMN',32,293,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Tonberry_SMN',32,294,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Lamiae_SMN',33,289,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Lamiae_SMN',33,293,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Lamiae_SMN',33,295,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Fomor_SMN',34,288,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Fomor_SMN',34,289,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Fomor_SMN',34,290,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Fomor_SMN',34,291,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Fomor_SMN',34,292,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Aern_SMN',35,288,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Aern_SMN',35,290,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Aern_SMN',35,292,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Aern_SMN',35,293,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Aern_SMN',35,294,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Aern_SMN',35,295,1,255);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,144,13,22);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,145,38,47);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,146,62,67);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,147,73,85);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,148,86,255);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,149,17,27);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,150,42,53);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,151,64,68);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,152,74,88);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,153,89,255);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,154,9,18);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,155,34,44);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,156,59,66);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,157,72,82);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,158,83,255);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,159,1,10);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,160,26,35);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,161,51,60);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,162,68,73);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,163,77,255);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,164,21,46);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,165,46,55);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,166,66,70);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,167,75,92);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,168,92,255);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,169,5,12);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,170,30,40);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,171,55,61);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,172,70,78);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,173,80,255);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,174,28,35);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,175,53,60);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,176,69,90);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,179,32,39);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,180,57,62);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,181,71,255);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,184,23,31);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,185,48,56);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,186,67,71);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,189,15,22);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,190,40,47);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,191,63,67);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,194,36,43);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,195,61,65);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,196,73,255);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,199,19,27);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,200,44,52);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,201,65,255);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,204,60,255);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,208,52,255);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,214,58,255);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,220,3,17);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,221,43,64);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,225,24,71);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,226,72,255);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,230,10,34);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,231,35,64);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,232,65,255);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,247,25,82);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,248,83,255);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,249,10,255);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,252,45,255);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,253,20,40);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,254,4,255);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,258,7,255);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,259,41,255);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,273,31,55);
INSERT INTO `mob_spell_lists` VALUES ('MagicPot',36,274,56,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelEV',37,4,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelEV',37,14,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelEV',37,15,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelEV',37,16,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelEV',37,17,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelEV',37,18,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelEV',37,21,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelEV',37,25,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelEV',37,31,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelEV',37,34,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelEV',37,46,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelEV',37,51,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelEV',37,53,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelEV',37,54,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelEV',37,108,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelEV',37,112,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelHM',38,338,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelHM',38,339,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelHM',38,342,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelHM',38,345,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelHM',38,348,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelHM',38,351,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,147,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,152,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,157,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,162,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,167,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,172,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,176,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,181,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,186,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,191,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,196,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,201,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,204,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,206,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,208,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,210,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,212,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,214,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,220,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,225,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,231,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,245,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,247,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,249,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,252,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,259,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,266,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,267,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,268,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,269,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,270,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,271,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,272,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,274,1,255);
INSERT INTO `mob_spell_lists` VALUES ('ArkAngelTT',39,275,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Goblin_Statue',40,57,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Goblin_Statue',40,128,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Goblin_Statue',40,133,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Mother_Globe',41,167,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Mother_Globe',41,196,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Mother_Globe',41,212,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Mother_Globe',41,239,1,255);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,1,3,13);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,2,14,25);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,3,26,48);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,4,48,255);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,23,1,30);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,24,31,59);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,25,60,255);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,33,15,54);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,34,55,70);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,35,71,255);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,43,7,26);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,44,27,46);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,45,47,62);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,46,63,76);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,47,80,255);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,48,17,36);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,49,37,56);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,50,57,67);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,51,68,86);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,52,87,255);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,53,23,255);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,54,34,255);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,55,12,255);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,56,13,255);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,57,48,255);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,58,6,255);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,59,18,255);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,104,16,255);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,105,27,255);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,108,21,75);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,110,80,255);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,144,19,49);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,145,50,70);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,146,71,85);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,147,86,255);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,149,24,54);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,150,55,72);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,151,73,88);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,152,89,255);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,154,14,44);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,155,45,68);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,156,69,82);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,157,83,255);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,159,4,34);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,160,35,64);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,161,65,76);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,162,77,255);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,164,29,59);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,165,60,74);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,166,75,91);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,167,89,255);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,169,9,39);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,170,40,66);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,171,67,88);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,172,80,255);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,216,21,255);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,230,10,35);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,231,36,74);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,232,75,255);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,253,25,45);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,259,46,255);
INSERT INTO `mob_spell_lists` VALUES ('EvilWeapon',42,260,32,255);
INSERT INTO `mob_spell_lists` VALUES ('WesternSphinx',43,357,1,255);
INSERT INTO `mob_spell_lists` VALUES ('EasternSphinx',44,360,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Roc_BRD',45,376,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Roc_BRD',45,423,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Roc_BRD',45,462,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Serket',46,362,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Goblin_Golem',47,14,6,255);
INSERT INTO `mob_spell_lists` VALUES ('Goblin_Golem',47,15,9,255);
INSERT INTO `mob_spell_lists` VALUES ('Goblin_Golem',47,16,14,255);
INSERT INTO `mob_spell_lists` VALUES ('Goblin_Golem',47,17,19,255);
INSERT INTO `mob_spell_lists` VALUES ('Goblin_Golem',47,18,39,255);
INSERT INTO `mob_spell_lists` VALUES ('Goblin_Golem',47,19,34,255);
INSERT INTO `mob_spell_lists` VALUES ('Goblin_Golem',47,20,29,255);
INSERT INTO `mob_spell_lists` VALUES ('Goblin_Golem',47,57,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Goblin_Golem',47,128,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Goblin_Golem',47,133,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Goblin_Golem',47,367,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Gu_Dha_Effigy',48,367,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Gu_Dha_Effigy',48,273,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Gu_Dha_Effigy',48,362,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Gu_Dha_Effigy',48,365,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Gu_Dha_Effigy',48,366,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Overlord_s_Tombstone',49,273,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Overlord_s_Tombstone',49,356,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Overlord_s_Tombstone',49,362,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Overlord_s_Tombstone',49,366,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Overlord_s_Tombstone',49,367,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Tzee_Xicu_Idol',50,147,73,85);
INSERT INTO `mob_spell_lists` VALUES ('Tzee_Xicu_Idol',50,152,74,88);
INSERT INTO `mob_spell_lists` VALUES ('Tzee_Xicu_Idol',50,157,72,82);
INSERT INTO `mob_spell_lists` VALUES ('Tzee_Xicu_Idol',50,163,77,255);
INSERT INTO `mob_spell_lists` VALUES ('Tzee_Xicu_Idol',50,167,75,92);
INSERT INTO `mob_spell_lists` VALUES ('Tzee_Xicu_Idol',50,172,70,78);
INSERT INTO `mob_spell_lists` VALUES ('Tzee_Xicu_Idol',50,181,71,255);
INSERT INTO `mob_spell_lists` VALUES ('Tzee_Xicu_Idol',50,186,67,71);
INSERT INTO `mob_spell_lists` VALUES ('Tzee_Xicu_Idol',50,189,15,22);
INSERT INTO `mob_spell_lists` VALUES ('Tzee_Xicu_Idol',50,190,40,47);
INSERT INTO `mob_spell_lists` VALUES ('Tzee_Xicu_Idol',50,191,63,67);
INSERT INTO `mob_spell_lists` VALUES ('Tzee_Xicu_Idol',50,194,36,43);
INSERT INTO `mob_spell_lists` VALUES ('Tzee_Xicu_Idol',50,195,61,65);
INSERT INTO `mob_spell_lists` VALUES ('Tzee_Xicu_Idol',50,196,73,255);
INSERT INTO `mob_spell_lists` VALUES ('Tzee_Xicu_Idol',50,201,65,255);
INSERT INTO `mob_spell_lists` VALUES ('Tzee_Xicu_Idol',50,367,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Vanguard_s_Hecteyes',51,360,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Vanguard_s_Crow',52,359,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Vanguard_s_Scorpion',53,365,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Vanguard_s_Slime',54,356,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Waraxe_Beak',55,161,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Waraxe_Beak',55,162,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Waraxe_Beak',55,191,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Waraxe_Beak',55,192,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Waraxe_Beak',55,360,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Waraxe_Beak',55,365,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Waraxe_Beak',55,366,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Lumber_Jack',56,103,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Lumber_Jack',56,192,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Lumber_Jack',56,255,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Vrtra',57,233,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Vrtra',57,274,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Vrtra',57,360,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Vrtra',57,361,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Heavy_Metal_Crab',58,199,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Heavy_Metal_Crab',58,230,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Heavy_Metal_Crab',58,254,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Colo-Colo',59,225,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Colo-Colo',59,245,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Furies',60,245,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Macha',61,273,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Macha',61,360,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Bitoso',62,3,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Bitoso',62,356,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Huntfly',63,154,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Huntfly',63,216,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Huntfly',63,237,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Metsanneitsyt',64,160,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Metsanneitsyt',64,189,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Metsanneitsyt',64,245,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Metsanneitsyt',64,247,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Nenaunir',65,33,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Nenaunir',65,160,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Nenaunir',65,258,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Sobbing_Eyes',66,174,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Sobbing_Eyes',66,252,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Sobbing_Eyes',66,362,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Sobbing_Eyes',66,365,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Compound_Eyes',67,145,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Compound_Eyes',67,245,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Opo-opo_Monarch',68,189,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Opo-opo_Monarch',68,357,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Opo-opo_Monarch',68,358,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Dvorovoi',69,214,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Dvorovoi',69,356,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Dvorovoi',69,361,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Helltail_Harry',70,150,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Helltail_Harry',70,357,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Helltail_Harry',70,358,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Orcish_Onager',71,362,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Macan_Gadangan',72,164,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Macan_Gadangan',72,165,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Macan_Gadangan',72,166,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Macan_Gadangan',72,194,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Macan_Gadangan',72,195,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Macan_Gadangan',72,212,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Duke_Amduscias',73,191,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Duke_Amduscias',73,214,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Duke_Amduscias',73,258,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Beelzebub',74,5,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Beelzebub',74,356,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Beelzebub',74,359,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Sabotender_Campeon',75,5,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Dragonian_Minstrel',76,373,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Dragonian_Minstrel',76,376,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Dragonian_Minstrel',76,382,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Dragonian_Minstrel',76,387,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Dragonian_Minstrel',76,392,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Dragonian_Minstrel',76,421,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Dragonian_Minstrel',76,432,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Dragonian_Minstrel',76,434,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Tartaruga_Gigante',77,202,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Tartaruga_Gigante',77,214,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Tartaruga_Gigante',77,357,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Tartaruga_Gigante',77,359,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Tiamat',78,176,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Tiamat',78,249,1,255);
INSERT INTO `mob_spell_lists` VALUES ('King_Arthro',79,105,1,255);
INSERT INTO `mob_spell_lists` VALUES ('King_Arthro',79,202,1,255);
INSERT INTO `mob_spell_lists` VALUES ('King_Arthro',79,226,1,255);
INSERT INTO `mob_spell_lists` VALUES ('King_Arthro',79,240,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Citipati',80,166,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Citipati',80,172,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Citipati',80,180,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Citipati',80,226,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Citipati',80,232,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Citipati',80,236,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Citipati',80,237,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Citipati',80,240,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Citipati',80,245,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Citipati',80,247,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Citipati',80,250,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Citipati',80,273,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Citipati',80,359,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Taisaijin',81,109,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Taisaijin',81,146,62,72);
INSERT INTO `mob_spell_lists` VALUES ('Taisaijin',81,156,59,71);
INSERT INTO `mob_spell_lists` VALUES ('Taisaijin',81,166,66,74);
INSERT INTO `mob_spell_lists` VALUES ('Taisaijin',81,171,55,66);
INSERT INTO `mob_spell_lists` VALUES ('Taisaijin',81,175,53,60);
INSERT INTO `mob_spell_lists` VALUES ('Taisaijin',81,186,67,255);
INSERT INTO `mob_spell_lists` VALUES ('Taisaijin',81,195,61,72);
INSERT INTO `mob_spell_lists` VALUES ('Taisaijin',81,204,60,255);
INSERT INTO `mob_spell_lists` VALUES ('Taisaijin',81,210,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Taisaijin',81,232,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Taisaijin',81,245,12,255);
INSERT INTO `mob_spell_lists` VALUES ('Taisaijin',81,247,25,255);
INSERT INTO `mob_spell_lists` VALUES ('Taisaijin',81,249,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Taisaijin',81,252,45,255);
INSERT INTO `mob_spell_lists` VALUES ('Taisaijin',81,254,4,255);
INSERT INTO `mob_spell_lists` VALUES ('Taisaijin',81,258,7,255);
INSERT INTO `mob_spell_lists` VALUES ('Pyuu_The_Spatemaker',82,172,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Pyuu_The_Spatemaker',82,201,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Tros',83,200,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Tros',83,361,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Death_Clan_Destroyer',84,8,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Hydra_s_Hound',85,361,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Dynamis_Lord',86,176,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Dynamis_Lord',86,181,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Dynamis_Lord',86,186,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Dynamis_Lord',86,191,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Dynamis_Lord',86,196,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Dynamis_Lord',86,201,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Dynamis_Lord',86,273,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Dynamis_Lord',86,357,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Dynamis_Lord',86,359,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Dynamis_Lord',86,360,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Dynamis_Lord',86,362,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Dynamis_Lord',86,365,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Dynamis_Lord',86,367,10,255);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Longsword',87,1,5,16);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Longsword',87,2,17,29);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Longsword',87,3,30,54);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Longsword',87,4,55,255);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Longsword',87,21,55,98);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Longsword',87,22,99,255);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Longsword',87,28,7,33);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Longsword',87,29,34,255);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Longsword',87,43,10,29);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Longsword',87,44,30,49);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Longsword',87,45,50,69);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Longsword',87,46,70,89);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Longsword',87,47,90,255);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Longsword',87,48,20,39);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Longsword',87,49,40,59);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Longsword',87,50,60,79);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Longsword',87,51,80,255);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Longsword',87,112,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Longsword',87,360,30,49);
INSERT INTO `mob_spell_lists` VALUES ('Satellite_Staves',88,4,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Satellite_Staves',88,161,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Satellite_Staves',88,190,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Satellite_Staves',88,191,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Staff',89,161,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Staff',89,191,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Staff',89,192,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Staff',89,273,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Staff',89,365,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Tabar',90,273,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Tabar',90,356,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Claymore',91,181,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Claymore',91,250,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Claymore',91,273,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Scythe',92,361,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Tachi',93,359,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Dagger',94,186,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Dagger',94,226,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Knuckles',95,128,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Knuckles',95,249,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Knuckles',95,358,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Shield',96,106,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Animated_Shield',96,273,37,255);
INSERT INTO `mob_spell_lists` VALUES ('Stubborn_Dredvodd',97,54,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Demonic_Tiphia',98,5,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Demonic_Tiphia',98,143,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Demonic_Tiphia',98,274,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Demonic_Tiphia',98,356,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Mycophile',99,220,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Mycophile',99,230,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Mycophile',99,254,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Mycophile',99,256,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Mycophile',99,356,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Boreal_Hound',100,180,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Boreal_Hound',100,206,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Boreal_Hound',100,250,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Boreal_Tiger',101,175,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Boreal_Tiger',101,204,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Boreal_Tiger',101,249,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Boreal_Coerul',102,195,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Boreal_Coerul',102,212,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Boreal_Coerul',102,251,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Ultima',103,22,75,255);
INSERT INTO `mob_spell_lists` VALUES ('Cwn_Cyrff',104,245,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Cwn_Cyrff',104,247,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Cwn_Cyrff',104,257,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Cwn_Cyrff',104,274,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Cwn_Cyrff',104,356,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Cwn_Cyrff',104,361,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Nunyunuwi',105,360,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Nunyunuwi',105,362,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Heart',106,232,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Heart',106,367,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Heart',106,245,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Heart',106,247,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Heart',106,260,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Heart',106,274,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Heart',106,360,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Heart',106,361,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Diamond',107,232,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Diamond',107,367,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Diamond',107,245,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Diamond',107,247,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Diamond',107,274,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Diamond',107,361,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Club',108,232,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Club',108,367,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Club',108,245,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Club',108,247,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Club',108,274,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Club',108,360,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Club',108,361,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Ouryu',109,54,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Ouryu',109,190,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Ouryu',109,357,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Pasuk',110,245,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Pasuk',110,247,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Jormungand', 111, 250, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Jormungand', 111, 181, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Jormungand', 111, 356, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Jormungand', 111, 362, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Eald_Narche_2',112,204,75,255);
INSERT INTO `mob_spell_lists` VALUES ('Eald_Narche_2',112,206,75,255);
INSERT INTO `mob_spell_lists` VALUES ('Eald_Narche_2',112,208,75,255);
INSERT INTO `mob_spell_lists` VALUES ('Eald_Narche_2',112,210,75,255);
INSERT INTO `mob_spell_lists` VALUES ('Eald_Narche_2',112,212,75,255);
INSERT INTO `mob_spell_lists` VALUES ('Eald_Narche_2',112,214,75,255);
INSERT INTO `mob_spell_lists` VALUES ('Eald_Narche_2',112,274,75,255);
INSERT INTO `mob_spell_lists` VALUES ('Eald_Narche_2',112,362,75,255);
INSERT INTO `mob_spell_lists` VALUES ('Deviator',113,39,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Deviator',113,175,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Deviator',113,180,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Deviator',113,185,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Deviator',113,190,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Deviator',113,195,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Deviator',113,200,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Deviator',113,226,1,255); -- might not have access to poisonga 2
INSERT INTO `mob_spell_lists` VALUES ('Deviator',113,274,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Provoker',114,100,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Provoker',114,101,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Provoker',114,102,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Provoker',114,103,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Provoker',114,104,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Provoker',114,105,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Darkness_Named',115,254,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Darkness_Named',115,231,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Darkness_Named',115,245,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Darkness_Named',115,247,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Darkness_Named',115,273,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Darkness_Named',115,259,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Golden_Tongued_Culberry',116,367,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Golden_Tongued_Culberry',116,359,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Golden_Tongued_Culberry',116,356,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Golden_Tongued_Culberry',116,245,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Golden_Tongued_Culberry',116,274,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Golden_Tongued_Culberry',116,147,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Golden_Tongued_Culberry',116,152,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Golden_Tongued_Culberry',116,157,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Golden_Tongued_Culberry',116,162,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Golden_Tongued_Culberry',116,167,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Golden_Tongued_Culberry',116,172,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Golden_Tongued_Culberry',116,176,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Golden_Tongued_Culberry',116,181,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Golden_Tongued_Culberry',116,186,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Golden_Tongued_Culberry',116,191,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Golden_Tongued_Culberry',116,196,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Golden_Tongued_Culberry',116,201,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Golden_Tongued_Culberry',116,4,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Dark_Spark',117,232,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Dark_Spark',117,245,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Dark_Spark',117,247,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Firesday',118,147,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Firesday',118,148,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Firesday',118,176,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Firesday',118,235,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Firesday',118,204,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Firesday',118,100,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Firesday',118,249,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Earthsday',119,54,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Earthsday',119,103,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Earthsday',119,162,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Earthsday',119,163,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Earthsday',119,210,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Earthsday',119,238,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Earthsday',119,191,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Watersday',120,172,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Watersday',120,173,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Watersday',120,214,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Watersday',120,201,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Watersday',120,105,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Watersday',120,226,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Watersday',120,55,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Watersday',120,240,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Windsday',121,237,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Windsday',121,53,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Windsday',121,102,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Windsday',121,59,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Windsday',121,157,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Windsday',121,158,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Windsday',121,186,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Windsday',121,208,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Iceday',122,250,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Iceday',122,58,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Iceday',122,258,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Iceday',122,236,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Iceday',122,206,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Iceday',122,181,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Iceday',122,152,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Iceday',122,153,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Lightningsday',123,251,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Lightningsday',123,104,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Lightningsday',123,252,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Lightningsday',123,239,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Lightningsday',123,212,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Lightningsday',123,196,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Lightningsday',123,167,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Lightningsday',123,168,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Lightsday',124,53,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Lightsday',124,54,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Lightsday',124,57,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Lightsday',124,51,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Lightsday',124,46,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Lightsday',124,108,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Lightsday',124,112,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Lightsday',124,360,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Lightsday',124,24,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Lightsday',124,30,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Lightsday',124,34,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Lightsday',124,40,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Lightsday',124,21,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Lightsday',124,22,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Lightsday',124,31,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Darksday',125,254,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Darksday',125,232,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Darksday',125,247,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Darksday',125,245,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Darksday',125,273,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Darksday',125,274,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Darksday',125,260,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Darksday',125,266,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Darksday',125,267,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Darksday',125,268,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Darksday',125,269,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Darksday',125,270,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Darksday',125,271,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Darksday',125,272,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Darksday',125,242,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Disaster_Idol_Darksday',125,275,1,255);
INSERT INTO `mob_spell_lists` VALUES ('King_Behemoth', 126, 218, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Promathia_1', 127, 219, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Promathia_2', 128, 218, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Promathia_2', 128, 219, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Prishe', 129, 4, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Prishe', 129, 5, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Prishe', 129, 21, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Prishe', 129, 30, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Prishe', 129, 40, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Bedrock_Barry', 130, 238, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Tyrant', 131, 112, 1, 255);



-- ---------------------------------------------------------------------------
-- Custom Section
-- ---------------------------------------------------------------------------
-- INSERT INTO `mob_spell_lists` VALUES ('spell_list_name', spell_list_id, spell_id, min_level, max_level);
-- Place new stuff right after this line. Please use gaps and comment spell names for easy readability.

INSERT INTO `mob_spell_lists` VALUES ('Shinryu', 400, 148, 1, 255); -- Fire 5
INSERT INTO `mob_spell_lists` VALUES ('Shinryu', 400, 152, 1, 255); -- Blizzard 4
INSERT INTO `mob_spell_lists` VALUES ('Shinryu', 400, 153, 1, 255); -- Blizzard 5
INSERT INTO `mob_spell_lists` VALUES ('Shinryu', 400, 158, 1, 255); -- Aero 5
INSERT INTO `mob_spell_lists` VALUES ('Shinryu', 400, 162, 1, 255); -- Stone 4
INSERT INTO `mob_spell_lists` VALUES ('Shinryu', 400, 163, 1, 255); -- Stone 5
INSERT INTO `mob_spell_lists` VALUES ('Shinryu', 400, 168, 1, 255); -- Thunder 5
INSERT INTO `mob_spell_lists` VALUES ('Shinryu', 400, 172, 1, 255); -- Water 4
INSERT INTO `mob_spell_lists` VALUES ('Shinryu', 400, 173, 1, 255); -- Water 5
INSERT INTO `mob_spell_lists` VALUES ('Shinryu', 400, 177, 1, 255); -- Firaga 4
INSERT INTO `mob_spell_lists` VALUES ('Shinryu', 400, 182, 1, 255); -- Blizzaga 4
INSERT INTO `mob_spell_lists` VALUES ('Shinryu', 400, 187, 1, 255); -- Aeroga 4
INSERT INTO `mob_spell_lists` VALUES ('Shinryu', 400, 192, 1, 255); -- Stonega 4
INSERT INTO `mob_spell_lists` VALUES ('Shinryu', 400, 197, 1, 255); -- Thundaga 4
INSERT INTO `mob_spell_lists` VALUES ('Shinryu', 400, 202, 1, 255); -- Waterga 4
INSERT INTO `mob_spell_lists` VALUES ('Shinryu', 400, 204, 1, 255); -- Flare
INSERT INTO `mob_spell_lists` VALUES ('Shinryu', 400, 206, 1, 255); -- Freeze
INSERT INTO `mob_spell_lists` VALUES ('Shinryu', 400, 207, 1, 255); -- Freeze 2
INSERT INTO `mob_spell_lists` VALUES ('Shinryu', 400, 208, 1, 255); -- Tornado
INSERT INTO `mob_spell_lists` VALUES ('Shinryu', 400, 210, 1, 255); -- Quake
INSERT INTO `mob_spell_lists` VALUES ('Shinryu', 400, 211, 1, 255); -- Quake 2
INSERT INTO `mob_spell_lists` VALUES ('Shinryu', 400, 212, 1, 255); -- Burst
INSERT INTO `mob_spell_lists` VALUES ('Shinryu', 400, 214, 1, 255); -- Flood
INSERT INTO `mob_spell_lists` VALUES ('Shinryu', 400, 215, 1, 255); -- Flood 2
INSERT INTO `mob_spell_lists` VALUES ('Shinryu', 400, 218, 1, 255); -- Meteor
INSERT INTO `mob_spell_lists` VALUES ('Shinryu', 400, 219, 1, 255); -- Comet
INSERT INTO `mob_spell_lists` VALUES ('Shinryu', 400, 245, 1, 255); -- Drain
INSERT INTO `mob_spell_lists` VALUES ('Shinryu', 400, 247, 1, 255); -- Aspir

-- Hades_v1 (Possessing Melvien)
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 486, 1, 255); -- Gain-STR
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 487, 1, 255); -- Gain-DEX
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 488, 1, 255); -- Gain-VIT
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 489, 1, 255); -- Gain-AGI
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 490, 1, 255); -- Gain-INT
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 491, 1, 255); -- Gain-MND
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 492, 1, 255); -- Gain-CHR
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 177, 1, 255); -- Firaga 4
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 178, 1, 255); -- Firaga 5
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 182, 1, 255); -- Blizzaga 4
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 183, 1, 255); -- Blizzaga 5
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 187, 1, 255); -- Aeroga 4
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 188, 1, 255); -- Aeroga 5
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 192, 1, 255); -- Stonega 4
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 193, 1, 255); -- Stonega 5
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 197, 1, 255); -- Thundaga 4
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 198, 1, 255); -- Thundaga 5
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 202, 1, 255); -- Waterga 4
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 203, 1, 255); -- Waterga 5
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 204, 1, 255); -- Flare
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 205, 1, 255); -- Flare 2
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 206, 1, 255); -- Freeze
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 207, 1, 255); -- Freeze 2
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 208, 1, 255); -- Tornado
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 209, 1, 255); -- Tornado 2
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 210, 1, 255); -- Quake
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 211, 1, 255); -- Quake 2
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 212, 1, 255); -- Burst
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 213, 1, 255); -- Burst 2
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 214, 1, 255); -- Flood
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 215, 1, 255); -- Flood 2
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 247, 1, 255); -- Aspir
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 496, 1, 255); -- Firaja
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 497, 1, 255); -- Blizzaja
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 498, 1, 255); -- Stoneja
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 499, 1, 255); -- Aeroja
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 500, 1, 255); -- Thundaja
INSERT INTO `mob_spell_lists` VALUES ('Hades_v1', 599, 501, 1, 255); -- Waterja
-- Hades_v2 (True form)
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 242, 1, 255); -- Absorb-ACC
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 266, 1, 255); -- Absorb-STR
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 267, 1, 255); -- Absorb-DEX
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 268, 1, 255); -- Absorb-VIT
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 269, 1, 255); -- Absorb-AGI
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 270, 1, 255); -- Absorb-INT
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 271, 1, 255); -- Absorb-MND
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 272, 1, 255); -- Absorb-CHR
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 275, 1, 255); -- Absorb-TP
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 148, 1, 255); -- Fire 5
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 153, 1, 255); -- Blizzard 5
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 158, 1, 255); -- Aero 5
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 163, 1, 255); -- Stone 5
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 168, 1, 255); -- Thunder 5
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 173, 1, 255); -- Water 5
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 177, 1, 255); -- Firaga 4
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 182, 1, 255); -- Blizzaga 4
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 183, 1, 255); -- Blizzaga 5
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 187, 1, 255); -- Aeroga 4
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 192, 1, 255); -- Stonega 4
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 193, 1, 255); -- Stonega 5
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 197, 1, 255); -- Thundaga 4
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 202, 1, 255); -- Waterga 4
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 203, 1, 255); -- Waterga 5
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 204, 1, 255); -- Flare
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 206, 1, 255); -- Freeze
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 207, 1, 255); -- Freeze 2
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 208, 1, 255); -- Tornado
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 210, 1, 255); -- Quake
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 211, 1, 255); -- Quake 2
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 212, 1, 255); -- Burst
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 214, 1, 255); -- Flood
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 215, 1, 255); -- Flood 2
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 228, 1, 255); -- Poisonga 4
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 233, 1, 255); -- Bio 4
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 234, 1, 255); -- Bio 5
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 245, 1, 255); -- Drain
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 246, 1, 255); -- Drain 2
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 247, 1, 255); -- Aspir
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 248, 1, 255); -- Aspir 2
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 255, 1, 255); -- Break
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 256, 1, 255); -- Virus
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 257, 1, 255); -- Curse
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 277, 1, 255); -- Dread Spikes
-- INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 311, 1, 255); -- Endark (moving this to scripted perma effect later)
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 360, 1, 255); -- Dispelga
INSERT INTO `mob_spell_lists` VALUES ('Hades_v2', 600, 503, 1, 255); -- Impact

INSERT INTO `mob_spell_lists` VALUES ('Ravenous_Cracklaw', 990, 229, 1, 255); -- Spell Name?
INSERT INTO `mob_spell_lists` VALUES ('Ravenous_Cracklaw', 990, 246, 1, 255); -- Spell Name?
INSERT INTO `mob_spell_lists` VALUES ('Ravenous_Cracklaw', 990, 252, 1, 255); -- Spell Name?
INSERT INTO `mob_spell_lists` VALUES ('Ravenous_Cracklaw', 990, 277, 1, 255); -- Spell Name?
INSERT INTO `mob_spell_lists` VALUES ('Ravenous_Cracklaw', 990, 501, 1, 255); -- Spell Name?
INSERT INTO `mob_spell_lists` VALUES ('Ravenous_Cracklaw', 990, 503, 1, 255); -- Spell Name?

INSERT INTO `mob_spell_lists` VALUES ('Hurkan', 991, 168, 1, 255); -- Spell Name?
INSERT INTO `mob_spell_lists` VALUES ('Hurkan', 991, 197, 1, 255); -- Spell Name?
INSERT INTO `mob_spell_lists` VALUES ('Hurkan', 991, 198, 1, 255); -- Spell Name?
INSERT INTO `mob_spell_lists` VALUES ('Hurkan', 991, 229, 1, 255); -- Spell Name?
INSERT INTO `mob_spell_lists` VALUES ('Hurkan', 991, 277, 1, 255); -- Spell Name?
INSERT INTO `mob_spell_lists` VALUES ('Hurkan', 991, 286, 1, 255); -- Spell Name?
INSERT INTO `mob_spell_lists` VALUES ('Hurkan', 991, 316, 1, 255); -- Spell Name?
INSERT INTO `mob_spell_lists` VALUES ('Hurkan', 991, 356, 1, 255); -- Spell Name?
INSERT INTO `mob_spell_lists` VALUES ('Hurkan', 991, 357, 1, 255); -- Spell Name?
INSERT INTO `mob_spell_lists` VALUES ('Hurkan', 991, 359, 1, 255); -- Spell Name?
INSERT INTO `mob_spell_lists` VALUES ('Hurkan', 991, 360, 1, 255); -- Spell Name?
INSERT INTO `mob_spell_lists` VALUES ('Hurkan', 991, 503, 1, 255); -- Spell Name?
INSERT INTO `mob_spell_lists` VALUES ('Hurkan', 991, 504, 1, 255); -- Spell Name?

-- -----------------------------------
-- Customized Legion Mobs Mobs
-- -----------------------------------

INSERT INTO `mob_spell_lists` VALUES ('Lofty_Zilant', 601, 496, 1, 255); -- Fireja
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Zilant', 601, 497, 1, 255); -- Blizzaja
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Zilant', 601, 498, 1, 255); -- Aeroja
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Zilant', 601, 499, 1, 255); -- Stoneja
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Zilant', 601, 500, 1, 255); -- Thundaja
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Zilant', 601, 501, 1, 255); -- Waterja
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Zilant', 601, 277, 1, 255); -- Dread Spikes
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Zilant', 601, 274, 1, 255); -- Sleepga 2
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Zilant', 601, 275, 1, 255); -- Absorb TP
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Zilant', 601, 246, 1, 255); -- Drain 2
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Zilant', 601, 229, 1, 255); -- Poisionga 5
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Zilant', 601, 234, 1, 255); -- Bio 5

INSERT INTO `mob_spell_lists` VALUES ('Lofty_Harpeia', 602, 229, 1, 255); -- Poisonga 5
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Harpeia', 602, 493, 1, 255); -- Temper
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Harpeia', 602, 356, 1, 255); -- Parlyga
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Harpeia', 602, 357, 1, 255); -- Slowga
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Harpeia', 602, 359, 1, 255); -- Silencega
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Harpeia', 602, 360, 1, 255); -- Dispelga
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Harpeia', 602, 362, 1, 255); -- Bindga
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Harpeia', 602, 366, 1, 255); -- Graviga
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Harpeia', 602, 314, 1, 255); -- Enaero 2
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Harpeia', 602, 286, 1, 255); -- Addle
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Harpeia', 602, 274, 1, 255); -- Sleepga 2
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Harpeia', 602, 186, 1, 255); -- Aeroga 3
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Harpeia', 602, 187, 1, 255); -- Aeroga 4
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Harpeia', 602, 157, 1, 255); -- Aero 4
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Harpeia', 602, 158, 1, 255); -- Aero 5
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Harpeia', 602, 37, 1, 255); -- Diaga 5
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Harpeia', 602, 47, 1, 255); -- Protect 5
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Harpeia', 602, 52, 1, 255); -- Shell 5
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Harpeia', 602, 53, 1, 255); -- Blink
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Harpeia', 602, 54, 1, 255); -- Stoneskin

INSERT INTO `mob_spell_lists` VALUES ('Lofty_Elasmoth', 603, 168, 1, 255); -- Thunder 5
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Elasmoth', 603, 167, 1, 255); -- Thunder 4
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Elasmoth', 603, 196, 1, 255); -- Thundaga 3
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Elasmoth', 603, 197, 1, 255); -- Thundaga 4
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Elasmoth', 603, 500, 1, 255); -- Thundaja
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Elasmoth', 603, 198, 1, 255); -- Thundaga 5
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Elasmoth', 603, 277, 1, 255); -- Dread Spikes
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Elasmoth', 603, 274, 1, 255); -- Sleepga 2
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Elasmoth', 603, 275, 1, 255); -- Absorb TP
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Elasmoth', 603, 246, 1, 255); -- Drain 2
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Elasmoth', 603, 229, 1, 255); -- Poisionga 5
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Elasmoth', 603, 234, 1, 255); -- Bio 5

INSERT INTO `mob_spell_lists` VALUES ('Lofty_Ferromantoise', 604, 162, 1, 255); -- Stone 4
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Ferromantoise', 604, 163, 1, 255); -- Stone 5
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Ferromantoise', 604, 191, 1, 255); -- Stonega 3
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Ferromantoise', 604, 192, 1, 255); -- Stonega 4
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Ferromantoise', 604, 193, 1, 255); -- Stonega 5
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Ferromantoise', 604, 210, 1, 255); -- Quake
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Ferromantoise', 604, 211, 1, 255); -- Quake 2
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Ferromantoise', 604, 229, 1, 255); -- Poisonga 5
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Ferromantoise', 604, 315, 1, 255); -- Enstone 2
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Ferromantoise', 604, 357, 1, 255); -- Slowga
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Ferromantoise', 604, 360, 1, 255); -- Dispelga
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Ferromantoise', 604, 365, 1, 255); -- Breakga
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Ferromantoise', 604, 366, 1, 255); -- Graviga

INSERT INTO `mob_spell_lists` VALUES ('Lofty_Wyrm', 605, 47, 1, 255); -- Protect 5
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Wyrm', 605, 52, 1, 255); -- Shell 5
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Wyrm', 605, 42, 1, 255); -- Banihshga 5
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Wyrm', 605, 22, 1, 255); -- Holy 2
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Wyrm', 605, 112, 1, 255); -- Flash

INSERT INTO `mob_spell_lists` VALUES ('Lofty_Adamantoise', 606, 47, 1, 255); -- Protect 5
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Adamantoise', 606, 52, 1, 255); -- Shell 5
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Adamantoise', 606, 42, 1, 255); -- Banishga 5
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Adamantoise', 606, 22, 1, 255); -- Holy 2
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Adamantoise', 606, 112, 1, 255); -- Flash
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Adamantoise', 606, 360, 1, 255); -- Dispelga
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Adamantoise', 606, 357, 1, 255); -- Slowga
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Adamantoise', 606, 366, 1, 255); -- Graviga
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Adamantoise', 606, 162, 1, 255); -- Stone 4
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Adamantoise', 606, 163, 1, 255); -- Stone 5
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Adamantoise', 606, 191, 1, 255); -- Stoneage 3
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Adamantoise', 606, 192, 1, 255); -- Stoneaga 4
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Adamantoise', 606, 255, 1, 255); -- Break
INSERT INTO `mob_spell_lists` VALUES ('Lofty_Adamantoise', 606, 210, 1, 255); -- Quake

INSERT INTO `mob_spell_lists` VALUES ('Mired_Cerberus', 607, 496, 1, 255); -- Fireja
INSERT INTO `mob_spell_lists` VALUES ('Mired_Cerberus', 607, 148, 1, 255); -- Fire 4
INSERT INTO `mob_spell_lists` VALUES ('Mired_Cerberus', 607, 176, 1, 255); -- Firega 3
INSERT INTO `mob_spell_lists` VALUES ('Mired_Cerberus', 607, 277, 1, 255); -- Dread Spikes
INSERT INTO `mob_spell_lists` VALUES ('Mired_Cerberus', 607, 274, 1, 255); -- Sleepga 2
INSERT INTO `mob_spell_lists` VALUES ('Mired_Cerberus', 607, 275, 1, 255); -- Absorb TP
INSERT INTO `mob_spell_lists` VALUES ('Mired_Cerberus', 607, 246, 1, 255); -- Drain 2
INSERT INTO `mob_spell_lists` VALUES ('Mired_Cerberus', 607, 229, 1, 255); -- Poisionga 5
INSERT INTO `mob_spell_lists` VALUES ('Mired_Cerberus', 607, 234, 1, 255); -- Bio 5

INSERT INTO `mob_spell_lists` VALUES ('Mired_Khimaira', 608, 47, 1, 255); -- Protect 5
INSERT INTO `mob_spell_lists` VALUES ('Mired_Khimaira', 608, 52, 1, 255); -- Shell 5
INSERT INTO `mob_spell_lists` VALUES ('Mired_Khimaira', 608, 42, 1, 255); -- Banishga 5
INSERT INTO `mob_spell_lists` VALUES ('Mired_Khimaira', 608, 22, 1, 255); -- Holy 2
INSERT INTO `mob_spell_lists` VALUES ('Mired_Khimaira', 608, 112, 1, 255); -- Flash
INSERT INTO `mob_spell_lists` VALUES ('Mired_Khimaira', 608, 360, 1, 255); -- Dispelga
INSERT INTO `mob_spell_lists` VALUES ('Mired_Khimaira', 608, 357, 1, 255); -- Slowga
INSERT INTO `mob_spell_lists` VALUES ('Mired_Khimaira', 608, 366, 1, 255); -- Graviga
INSERT INTO `mob_spell_lists` VALUES ('Mired_Khimaira', 608, 167, 1, 255); -- Thunder 4
INSERT INTO `mob_spell_lists` VALUES ('Mired_Khimaira', 608, 168, 1, 255); -- Thunder 5
INSERT INTO `mob_spell_lists` VALUES ('Mired_Khimaira', 608, 196, 1, 255); -- Thundaga 3
INSERT INTO `mob_spell_lists` VALUES ('Mired_Khimaira', 608, 197, 1, 255); -- Thundaga 4
INSERT INTO `mob_spell_lists` VALUES ('Mired_Khimaira', 608, 212, 1, 255); -- Burst

INSERT INTO `mob_spell_lists` VALUES ('Mired_Orthrus', 609, 496, 1, 255); -- Fireja
INSERT INTO `mob_spell_lists` VALUES ('Mired_Orthrus', 609, 148, 1, 255); -- Fire 4
INSERT INTO `mob_spell_lists` VALUES ('Mired_Orthrus', 609, 149, 1, 255); -- Fire 5
INSERT INTO `mob_spell_lists` VALUES ('Mired_Orthrus', 609, 177, 1, 255); -- Firega 4
INSERT INTO `mob_spell_lists` VALUES ('Mired_Orthrus', 609, 178, 1, 255); -- Firega 5
INSERT INTO `mob_spell_lists` VALUES ('Mired_Orthrus', 609, 277, 1, 255); -- Dread Spikes
INSERT INTO `mob_spell_lists` VALUES ('Mired_Orthrus', 609, 274, 1, 255); -- Sleepga 2
INSERT INTO `mob_spell_lists` VALUES ('Mired_Orthrus', 609, 275, 1, 255); -- Absorb TP
INSERT INTO `mob_spell_lists` VALUES ('Mired_Orthrus', 609, 246, 1, 255); -- Drain 2
INSERT INTO `mob_spell_lists` VALUES ('Mired_Orthrus', 609, 229, 1, 255); -- Poisionga 5
INSERT INTO `mob_spell_lists` VALUES ('Mired_Orthrus', 609, 234, 1, 255); -- Bio 5

INSERT INTO `mob_spell_lists` VALUES ('Mired_Khrysokhimaira', 610, 47, 1, 255); -- Protect 5
INSERT INTO `mob_spell_lists` VALUES ('Mired_Khrysokhimaira', 610, 52, 1, 255); -- Shell 5
INSERT INTO `mob_spell_lists` VALUES ('Mired_Khrysokhimaira', 610, 42, 1, 255); -- Banishga 5
INSERT INTO `mob_spell_lists` VALUES ('Mired_Khrysokhimaira', 610, 22, 1, 255); -- Holy 2
INSERT INTO `mob_spell_lists` VALUES ('Mired_Khrysokhimaira', 610, 112, 1, 255); -- Flash
INSERT INTO `mob_spell_lists` VALUES ('Mired_Khrysokhimaira', 610, 360, 1, 255); -- Dispelga
INSERT INTO `mob_spell_lists` VALUES ('Mired_Khrysokhimaira', 610, 357, 1, 255); -- Slowga
INSERT INTO `mob_spell_lists` VALUES ('Mired_Khrysokhimaira', 610, 366, 1, 255); -- Graviga
INSERT INTO `mob_spell_lists` VALUES ('Mired_Khrysokhimaira', 610, 167, 1, 255); -- Thunder 4
INSERT INTO `mob_spell_lists` VALUES ('Mired_Khrysokhimaira', 610, 168, 1, 255); -- Thunder 5
INSERT INTO `mob_spell_lists` VALUES ('Mired_Khrysokhimaira', 610, 251, 1, 255); -- Shock Spikes
INSERT INTO `mob_spell_lists` VALUES ('Mired_Khrysokhimaira', 610, 197, 1, 255); -- Thundaga 4
INSERT INTO `mob_spell_lists` VALUES ('Mired_Khrysokhimaira', 610, 198, 1, 255); -- Thundaga 5
INSERT INTO `mob_spell_lists` VALUES ('Mired_Khrysokhimaira', 610, 213, 1, 255); -- Burst 2

INSERT INTO `mob_spell_lists` VALUES ('Soaring_Corse', 611, 277, 1, 255); -- Dread Spikes
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Corse', 611, 219, 1, 255); -- Comet
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Corse', 611, 218, 1, 255); -- Meteor
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Corse', 611, 503, 1, 255); -- Impact
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Corse', 611, 148, 1, 255); -- Fire 4
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Corse', 611, 149, 1, 255); -- Fire 5
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Corse', 611, 176, 1, 255); -- Firega 3
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Corse', 611, 177, 1, 255); -- Firega 4
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Corse', 611, 496, 1, 255); -- Fireja
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Corse', 611, 286, 1, 255); -- Addle
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Corse', 611, 362, 1, 255); -- Bindga
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Corse', 611, 357, 1, 255); -- Slowga
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Corse', 611, 274, 1, 255); -- Sleepga 2
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Corse', 611, 359, 1, 255); -- Silencega

INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dvergr', 612, 362, 1, 255); -- Bindga
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dvergr', 612, 357, 1, 255); -- Slowga
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dvergr', 612, 228, 1, 255); -- Poisonga 4
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dvergr', 612, 365, 1, 255); -- Breakga
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dvergr', 612, 205, 1, 255); -- Flare 2
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dvergr', 612, 207, 1, 255); -- freeze 2
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dvergr', 612, 209, 1, 255); -- Tornado 2
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dvergr', 612, 211, 1, 255); -- Quake 2
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dvergr', 612, 213, 1, 255); -- Burst 2
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dvergr', 612, 215, 1, 255); -- Flood 2

INSERT INTO `mob_spell_lists` VALUES ('Soaring_Vampyr', 613, 497, 1, 255); -- Blizzaja
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Vampyr', 613, 206, 1, 255); -- Freeze
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Vampyr', 613, 207, 1, 255); -- Feeze 2
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Vampyr', 613, 356, 1, 255); -- Paralyga
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Vampyr', 613, 182, 1, 255); -- Blizzaga 4

INSERT INTO `mob_spell_lists` VALUES ('Soaring_Kumakatok', 614, 148, 1, 255); -- Fire 5
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Kumakatok', 614, 158, 1, 255); -- Aero 5
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Kumakatok', 614, 173, 1, 255); -- Water 5
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Kumakatok', 614, 153, 1, 255); -- Blizzard 5
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Kumakatok', 614, 163, 1, 255); -- Stone 5
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Kumakatok', 614, 168, 1, 255); -- Thunder 5
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Kumakatok', 614, 177, 1, 255); -- Firega 4
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Kumakatok', 614, 187, 1, 255); -- Aeroga 4
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Kumakatok', 614, 182, 1, 255); -- Blizzaga 4
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Kumakatok', 614, 202, 1, 255); -- Waterga 4
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Kumakatok', 614, 192, 1, 255); -- Stonega 4
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Kumakatok', 614, 197, 1, 255); -- Thundaga 4
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Kumakatok', 614, 503, 1, 255); -- Impact
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Kumakatok', 614, 246, 1, 255); -- Drain 2
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Kumakatok', 614, 360, 1, 255); -- Dispelga
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Kumakatok', 614, 359, 1, 255); -- Silencega
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Kumakatok', 614, 174, 1, 255); -- Sleepga 2
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Kumakatok', 614, 286, 1, 255); -- Addle

INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dweorg', 615, 277, 1, 255); -- Dread Spikes
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dweorg', 615, 219, 1, 255); -- Comet
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dweorg', 615, 218, 1, 255); -- Meteor
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dweorg', 615, 503, 1, 255); -- Impact
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dweorg', 615, 192, 1, 255); -- Stonega 4
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dweorg', 615, 499, 1, 255); -- Stoneja
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dweorg', 615, 197, 1, 255); -- Thundaga 4
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dweorg', 615, 500, 1, 255); -- Thundaja
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dweorg', 615, 202, 1, 255); -- Waterga 4
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dweorg', 615, 501, 1, 255); -- Waterja
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dweorg', 615, 187, 1, 255); -- Aeroga 4
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dweorg', 615, 498, 1, 255); -- Aeroja
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dweorg', 615, 182, 1, 255); -- Blizzaga 4
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dweorg', 615, 497, 1, 255); -- Blizzaja
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dweorg', 615, 177, 1, 255); -- Firega 4
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dweorg', 615, 496, 1, 255); -- Fireja
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dweorg', 615, 286, 1, 255); -- Addle
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dweorg', 615, 362, 1, 255); -- Bindga
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dweorg', 615, 357, 1, 255); -- Slowga
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dweorg', 615, 274, 1, 255); -- Sleepga 2
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Dweorg', 615, 359, 1, 255); -- Silencega

INSERT INTO `mob_spell_lists` VALUES ('Soaring_Strigoi', 616, 168, 1, 255); -- Thunder 5
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Strigoi', 616, 174, 1, 255); -- Sleepga 2
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Strigoi', 616, 197, 1, 255); -- thundaga 4
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Strigoi', 616, 252, 1, 255); -- Stun
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Strigoi', 616, 277, 1, 255); -- Dread Spikes
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Strigoi', 616, 366, 1, 255); -- Graviga
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Strigoi', 616, 359, 1, 255); -- Silencega
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Strigoi', 616, 500, 1, 255); -- Thundaja

INSERT INTO `mob_spell_lists` VALUES ('Soaring_Naraka', 617, 148, 1, 255); -- Fire 5
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Naraka', 617, 153, 1, 255); -- Blizzard 5
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Naraka', 617, 163, 1, 255); -- Stone 5
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Naraka', 617, 168, 1, 255); -- Thunder 5
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Naraka', 617, 177, 1, 255); -- Firega 4
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Naraka', 617, 182, 1, 255); -- Blizzaga 4
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Naraka', 617, 192, 1, 255); -- Stonega 4
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Naraka', 617, 197, 1, 255); -- Thundaga 4
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Naraka', 617, 252, 1, 255); -- Stun
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Naraka', 617, 274, 1, 255); -- Sleepga 2
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Naraka', 617, 286, 1, 255); -- Addle
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Naraka', 617, 357, 1, 255); -- Slowga
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Naraka', 617, 359, 1, 255); -- Silencega
INSERT INTO `mob_spell_lists` VALUES ('Soaring_Naraka', 617, 362, 1, 255); -- Bindga

INSERT INTO `mob_spell_lists` VALUES ('Veiled_Amphiptere', 618, 177, 1, 255); -- Firega 4
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Amphiptere', 618, 187, 1, 255); -- Aeroga 4
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Amphiptere', 618, 359, 1, 255); -- Silencega
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Amphiptere', 618, 366, 1, 255); -- Graviga
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Amphiptere', 618, 496, 1, 255); -- Fireja
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Amphiptere', 618, 498, 1, 255); -- Aeroja

INSERT INTO `mob_spell_lists` VALUES ('Veiled_Sandworm', 619, 162, 1, 255); -- Stone 4
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Sandworm', 619, 163, 1, 255); -- Stone 5
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Sandworm', 619, 191, 1, 255); -- Stonega 3
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Sandworm', 619, 192, 1, 255); -- Stonega 4
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Sandworm', 619, 193, 1, 255); -- Stonega 5
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Sandworm', 619, 210, 1, 255); -- Quake
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Sandworm', 619, 211, 1, 255); -- Quake 2
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Sandworm', 619, 229, 1, 255); -- Poisonga 5
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Sandworm', 619, 315, 1, 255); -- Enstone 2
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Sandworm', 619, 357, 1, 255); -- Slowga
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Sandworm', 619, 360, 1, 255); -- Dispelga
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Sandworm', 619, 365, 1, 255); -- Breakga
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Sandworm', 619, 366, 1, 255); -- Graviga

INSERT INTO `mob_spell_lists` VALUES ('Veiled_Sanguiptere', 620, 182, 1, 255); -- Blizzaga 4
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Sanguiptere', 620, 187, 1, 255); -- Aeroga 4
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Sanguiptere', 620, 359, 1, 255); -- Silencega
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Sanguiptere', 620, 366, 1, 255); -- Graviga
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Sanguiptere', 620, 497, 1, 255); -- Blizzaja
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Sanguiptere', 620, 498, 1, 255); -- Aeroja

INSERT INTO `mob_spell_lists` VALUES ('Veiled_Gigaworm', 621, 163, 1, 255); -- Stone 5
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Gigaworm', 621, 192, 1, 255); -- Stonega 4
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Gigaworm', 621, 193, 1, 255); -- Stonega 5
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Gigaworm', 621, 210, 1, 255); -- Quake
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Gigaworm', 621, 211, 1, 255); -- Quake 2
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Gigaworm', 621, 315, 1, 255); -- Enstone 2
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Gigaworm', 621, 360, 1, 255); -- Dispelga
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Gigaworm', 621, 357, 1, 255); -- Slowga
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Gigaworm', 621, 365, 1, 255); -- Breakga
INSERT INTO `mob_spell_lists` VALUES ('Veiled_Gigaworm', 621, 366, 1, 255); -- Graviga

INSERT INTO `mob_spell_lists` VALUES ('Paramout_Gallu', 622, 218, 1, 255); -- Meteor
INSERT INTO `mob_spell_lists` VALUES ('Paramout_Gallu', 622, 219, 1, 255); -- Comet
INSERT INTO `mob_spell_lists` VALUES ('Paramout_Gallu', 622, 252, 1, 255); -- Stun
INSERT INTO `mob_spell_lists` VALUES ('Paramout_Gallu', 622, 277, 1, 255); -- Dread Spik
INSERT INTO `mob_spell_lists` VALUES ('Paramout_Gallu', 622, 366, 1, 255); -- Breakga
INSERT INTO `mob_spell_lists` VALUES ('Paramout_Gallu', 622, 367, 1, 255); -- Death
INSERT INTO `mob_spell_lists` VALUES ('Paramout_Gallu', 622, 503, 1, 255); -- Impact

INSERT INTO `mob_spell_lists` VALUES ('Paramount_Botulus', 623, 503, 1, 255); -- Impact
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Botulus', 623, 192, 1, 255); -- Stonega 4
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Botulus', 623, 499, 1, 255); -- Stoneja
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Botulus', 623, 197, 1, 255); -- Thundaga 4
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Botulus', 623, 500, 1, 255); -- Thundaja
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Botulus', 623, 202, 1, 255); -- Waterga 4
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Botulus', 623, 501, 1, 255); -- Waterja
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Botulus', 623, 187, 1, 255); -- Aeroga 4
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Botulus', 623, 498, 1, 255); -- Aeroja
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Botulus', 623, 182, 1, 255); -- Blizzaga 4
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Botulus', 623, 497, 1, 255); -- Blizzaja
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Botulus', 623, 177, 1, 255); -- Firega 4
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Botulus', 623, 496, 1, 255); -- Fireja
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Botulus', 623, 360, 1, 255); -- Dispelga
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Botulus', 623, 362, 1, 255); -- Bindga
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Botulus', 623, 357, 1, 255); -- Slowga
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Botulus', 623, 274, 1, 255); -- Sleepga 2
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Botulus', 623, 359, 1, 255); -- Silencega

INSERT INTO `mob_spell_lists` VALUES ('Paramount_Harpeia', 624, 493, 1, 255); -- Temper
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Harpeia', 624, 356, 1, 255); -- Parlyga
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Harpeia', 624, 357, 1, 255); -- Slowga
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Harpeia', 624, 359, 1, 255); -- Silencega
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Harpeia', 624, 360, 1, 255); -- Dispelga
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Harpeia', 624, 362, 1, 255); -- Bindga
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Harpeia', 624, 366, 1, 255); -- Graviga
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Harpeia', 624, 314, 1, 255); -- Enaero 2
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Harpeia', 624, 286, 1, 255); -- Addle
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Harpeia', 624, 274, 1, 255); -- Sleepga 2
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Harpeia', 624, 188, 1, 255); -- Aeroga 5
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Harpeia', 624, 187, 1, 255); -- Aeroga 4
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Harpeia', 624, 157, 1, 255); -- Aero 4
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Harpeia', 624, 158, 1, 255); -- Aero 5
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Harpeia', 624, 37, 1, 255); -- Diaga 5

INSERT INTO `mob_spell_lists` VALUES ('Paramount_Mantis', 625, 340, 1, 255); -- Utsu San
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Mantis', 625, 505, 1, 255); -- gekka
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Mantis', 625, 506, 1, 255); -- yain
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Mantis', 625, 507, 1, 255); -- myhoshu
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Mantis', 625, 508, 1, 255); -- yurin
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Mantis', 625, 509, 1, 255); -- kakka

INSERT INTO `mob_spell_lists` VALUES ('Paramount_Naraka', 626, 192, 1, 255); -- Stonega 4
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Naraka', 626, 163, 1, 255); -- Stone 5
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Naraka', 626, 197, 1, 255); -- Thundaga 4
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Naraka', 626, 168, 1, 255); -- Thunder 5
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Naraka', 626, 182, 1, 255); -- Blizzaga 4
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Naraka', 626, 153, 1, 255); -- Blizzard 5
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Naraka', 626, 177, 1, 255); -- Firega 4
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Naraka', 626, 148, 1, 255); -- Fire 5
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Naraka', 626, 366, 1, 255); -- Graviga
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Naraka', 626, 362, 1, 255); -- Bindga
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Naraka', 626, 357, 1, 255); -- Slowga
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Naraka', 626, 274, 1, 255); -- Sleepga 2
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Naraka', 626, 359, 1, 255); -- Silencega
INSERT INTO `mob_spell_lists` VALUES ('Paramount_Naraka', 626, 503, 1, 255); -- Impact

-- -----------------------------------
-- The SlenderMan custom NM
-- -----------------------------------

INSERT INTO `mob_spell_lists` VALUES ('SlenderMan', 666, 242, 1, 255); -- Absorb-ACC
INSERT INTO `mob_spell_lists` VALUES ('SlenderMan', 666, 257, 1, 255); -- Curse
INSERT INTO `mob_spell_lists` VALUES ('SlenderMan', 666, 266, 1, 255); -- Absorb-STR
INSERT INTO `mob_spell_lists` VALUES ('SlenderMan', 666, 267, 1, 255); -- Absorb-DEX
INSERT INTO `mob_spell_lists` VALUES ('SlenderMan', 666, 268, 1, 255); -- Absorb-VIT
INSERT INTO `mob_spell_lists` VALUES ('SlenderMan', 666, 269, 1, 255); -- Absorb-AGI
INSERT INTO `mob_spell_lists` VALUES ('SlenderMan', 666, 270, 1, 255); -- Absorb-INT
INSERT INTO `mob_spell_lists` VALUES ('SlenderMan', 666, 271, 1, 255); -- Absorb-MND
INSERT INTO `mob_spell_lists` VALUES ('SlenderMan', 666, 272, 1, 255); -- Absorb-CHR
INSERT INTO `mob_spell_lists` VALUES ('SlenderMan', 666, 275, 1, 255); -- Absorb-TP
INSERT INTO `mob_spell_lists` VALUES ('SlenderMan', 666, 322, 1, 255); -- Katon San
INSERT INTO `mob_spell_lists` VALUES ('SlenderMan', 666, 325, 1, 255); -- Hyoton San
INSERT INTO `mob_spell_lists` VALUES ('SlenderMan', 666, 328, 1, 255); -- Huton San
INSERT INTO `mob_spell_lists` VALUES ('SlenderMan', 666, 331, 1, 255); -- Doton San
INSERT INTO `mob_spell_lists` VALUES ('SlenderMan', 666, 334, 1, 255); -- Raiton San
INSERT INTO `mob_spell_lists` VALUES ('SlenderMan', 666, 337, 1, 255); -- Suiton San
INSERT INTO `mob_spell_lists` VALUES ('SlenderMan', 666, 343, 1, 255); -- Jubaku San
INSERT INTO `mob_spell_lists` VALUES ('SlenderMan', 666, 346, 1, 255); -- Hojo San
INSERT INTO `mob_spell_lists` VALUES ('SlenderMan', 666, 349, 1, 255); -- Kurayami San
INSERT INTO `mob_spell_lists` VALUES ('SlenderMan', 666, 352, 1, 255); -- Dokumori San
INSERT INTO `mob_spell_lists` VALUES ('SlenderMan', 666, 356, 1, 255); -- Paralyga
INSERT INTO `mob_spell_lists` VALUES ('SlenderMan', 666, 362, 1, 255); -- Bindga
INSERT INTO `mob_spell_lists` VALUES ('SlenderMan', 666, 365, 1, 255); -- Breakga
INSERT INTO `mob_spell_lists` VALUES ('SlenderMan', 666, 366, 1, 255); -- Graviga

-- -----------------------------------
-- Custom "Hall of Mars" Legion event
-- -----------------------------------

INSERT INTO `mob_spell_lists` VALUES ('Mars', 760, 106, 1, 255); -- Phalanx
INSERT INTO `mob_spell_lists` VALUES ('Mars', 760, 112, 1, 255); -- Flash
INSERT INTO `mob_spell_lists` VALUES ('Mars', 760, 177, 1, 255); -- Firaga 4
INSERT INTO `mob_spell_lists` VALUES ('Mars', 760, 182, 1, 255); -- Blizzaga 4
INSERT INTO `mob_spell_lists` VALUES ('Mars', 760, 187, 1, 255); -- Aeroga 4
INSERT INTO `mob_spell_lists` VALUES ('Mars', 760, 192, 1, 255); -- Stonega 4
INSERT INTO `mob_spell_lists` VALUES ('Mars', 760, 197, 1, 255); -- Thundaga 4
INSERT INTO `mob_spell_lists` VALUES ('Mars', 760, 202, 1, 255); -- Waterga 4
INSERT INTO `mob_spell_lists` VALUES ('Mars', 760, 275, 1, 255); -- Absorb-TP
INSERT INTO `mob_spell_lists` VALUES ('Mars', 760, 245, 1, 255); -- Drain
INSERT INTO `mob_spell_lists` VALUES ('Mars', 760, 247, 1, 255); -- Aspir
INSERT INTO `mob_spell_lists` VALUES ('Mars', 760, 502, 1, 255); -- Kaustra

-- -----------------------------------
-- Provenance Custom BCNM
-- -----------------------------------

-- Minerva's Baelfyr/Light/Fire/Fusion Elemental pet
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental', 775, 5, 1, 255); -- Cure 5
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental', 775, 14, 1, 255); -- Poisona
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental', 775, 15, 1, 255); -- Paralyna
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental', 775, 16, 1, 255); -- Blindna
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental', 775, 17, 1, 255); -- Silena
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental', 775, 18, 1, 255); -- Stona
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental', 775, 19, 1, 255); -- Viruna
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental', 775, 20, 1, 255); -- Cursna
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental', 775, 21, 1, 255); -- Holy
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental', 775, 26, 1, 255); -- Dia 4
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental', 775, 31, 1, 255); -- Banish 4
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental', 775, 98, 1, 255); -- Repose
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental', 775, 147, 1, 255); -- Fire 4
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental', 775, 176, 1, 255); -- Firaga 3
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental', 775, 204, 1, 255); -- Flare

-- Minerva's Ungeweder Wind/Lightning/Fragmentation Elemental pet
INSERT INTO `mob_spell_lists` VALUES ('Olympian_Elemental', 776, 59, 1, 255); -- Silence
INSERT INTO `mob_spell_lists` VALUES ('Olympian_Elemental', 776, 157, 1, 255); -- Aero 4
INSERT INTO `mob_spell_lists` VALUES ('Olympian_Elemental', 776, 167, 1, 255); -- Thunder 4
INSERT INTO `mob_spell_lists` VALUES ('Olympian_Elemental', 776, 186, 1, 255); -- Aeroga 3
INSERT INTO `mob_spell_lists` VALUES ('Olympian_Elemental', 776, 196, 1, 255); -- Thunderga 3
INSERT INTO `mob_spell_lists` VALUES ('Olympian_Elemental', 776, 208, 1, 255); -- Tornado
INSERT INTO `mob_spell_lists` VALUES ('Olympian_Elemental', 776, 252, 1, 255); -- Stun
INSERT INTO `mob_spell_lists` VALUES ('Olympian_Elemental', 776, 212, 1, 255); -- Burst

INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 5, 1, 255); -- Cure 5
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 14, 1, 255); -- Poisona
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 15, 1, 255); -- Paralyna
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 16, 1, 255); -- Blindna
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 17, 1, 255); -- Silena
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 18, 1, 255); -- Stona
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 19, 1, 255); -- Viruna
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 20, 1, 255); -- Cursna
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 21, 1, 255); -- Holy
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 22, 1, 255); -- Holy 2
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 27, 1, 255); -- Dia 5
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 31, 1, 255); -- Diaga 4
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 36, 1, 255); -- Banish 4
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 41, 1, 255); -- Banishga 4
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 47, 1, 255); -- Prot 5
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 52, 1, 255); -- Shell 5
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 53, 1, 255); -- Blink
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 54, 1, 255); -- Stoneskin
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 55, 1, 255); -- Aquaviel
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 58, 1, 255); -- Paralyze
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 59, 1, 255); -- Silence
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 98, 1, 255); -- Repose
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 106, 1, 255); -- Phalanx
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 112, 1, 255); -- Flash
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 143, 1, 255); -- Erase
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 147, 1, 255); -- Fire 4
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 157, 1, 255); -- Aero 4
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 167, 1, 255); -- Thunder 4
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 177, 1, 255); -- Firaga 4
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 187, 1, 255); -- Aeroga 4
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 197, 1, 255); -- Thunderga 4
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 204, 1, 255); -- Flare
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 206, 1, 255); -- Freeze
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 208, 1, 255); -- Tornado
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 210, 1, 255); -- Quake
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 212, 1, 255); -- Burst
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 214, 1, 255); -- Flood
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 219, 1, 255); -- Comet
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 222, 1, 255); -- Poison 3
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 235, 1, 255); -- Burn
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 237, 1, 255); -- Choke
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 239, 1, 255); -- Shock
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 257, 1, 255); -- Curse
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 280, 1, 255); -- Anemohelix
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 281, 1, 255); -- Pyrohelix
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 283, 1, 255); -- Ionohelix
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 285, 1, 255); -- Luminohelix
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 357, 1, 255); -- Slowga
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 361, 1, 255); -- Blindga
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 362, 1, 255); -- Bindga
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 366, 1, 255); -- Graviga
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 483, 1, 255); -- Boost-INT
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 484, 1, 255); -- Boost-MND
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 496, 1, 255); -- Firaja
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 498, 1, 255); -- Aeroja
INSERT INTO `mob_spell_lists` VALUES ('Minerva', 777, 500, 1, 255); -- Thundaja
-- Yeah, Minerva has a long list of spells she can use..And 2 lists..
INSERT INTO `mob_spell_lists` VALUES ('Minerva_Tabula_Rasa', 778, 11, 1, 255); -- Curaga 5
INSERT INTO `mob_spell_lists` VALUES ('Minerva_Tabula_Rasa', 778, 22, 1, 255); -- Holy 2
INSERT INTO `mob_spell_lists` VALUES ('Minerva_Tabula_Rasa', 778, 37, 1, 255); -- Diaga 5
INSERT INTO `mob_spell_lists` VALUES ('Minerva_Tabula_Rasa', 778, 42, 1, 255); -- Banishga 5
INSERT INTO `mob_spell_lists` VALUES ('Minerva_Tabula_Rasa', 778, 178, 1, 255); -- Firaga 5
INSERT INTO `mob_spell_lists` VALUES ('Minerva_Tabula_Rasa', 778, 188, 1, 255); -- Aeroga 5
INSERT INTO `mob_spell_lists` VALUES ('Minerva_Tabula_Rasa', 778, 198, 1, 255); -- Thunderga 5
INSERT INTO `mob_spell_lists` VALUES ('Minerva_Tabula_Rasa', 778, 205, 1, 255); -- Flare 2
INSERT INTO `mob_spell_lists` VALUES ('Minerva_Tabula_Rasa', 778, 209, 1, 255); -- Tornado 2
INSERT INTO `mob_spell_lists` VALUES ('Minerva_Tabula_Rasa', 778, 213, 1, 255); -- Burst 2
INSERT INTO `mob_spell_lists` VALUES ('Minerva_Tabula_Rasa', 778, 219, 1, 255); -- Comet
INSERT INTO `mob_spell_lists` VALUES ('Minerva_Tabula_Rasa', 778, 257, 1, 255); -- Curse
INSERT INTO `mob_spell_lists` VALUES ('Minerva_Tabula_Rasa', 778, 280, 1, 255); -- Anemohelix
INSERT INTO `mob_spell_lists` VALUES ('Minerva_Tabula_Rasa', 778, 281, 1, 255); -- Pyrohelix
INSERT INTO `mob_spell_lists` VALUES ('Minerva_Tabula_Rasa', 778, 283, 1, 255); -- Ionohelix
INSERT INTO `mob_spell_lists` VALUES ('Minerva_Tabula_Rasa', 778, 285, 1, 255); -- Luminohelix
INSERT INTO `mob_spell_lists` VALUES ('Minerva_Tabula_Rasa', 778, 478, 1, 255); -- Embrava
INSERT INTO `mob_spell_lists` VALUES ('Minerva_Tabula_Rasa', 778, 483, 1, 255); -- Boost-INT
INSERT INTO `mob_spell_lists` VALUES ('Minerva_Tabula_Rasa', 778, 484, 1, 255); -- Boost-MND
INSERT INTO `mob_spell_lists` VALUES ('Minerva_Tabula_Rasa', 778, 496, 1, 255); -- Firaja
INSERT INTO `mob_spell_lists` VALUES ('Minerva_Tabula_Rasa', 778, 498, 1, 255); -- Aeroja
INSERT INTO `mob_spell_lists` VALUES ('Minerva_Tabula_Rasa', 778, 500, 1, 255); -- Thundaja

-- Minerva's Boosted Baelfyr/Light/Fire/Fusion Elemental pet
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental_Boosted', 779, 5, 1, 255); -- Cure 5
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental_Boosted', 779, 14, 1, 255); -- Poisona
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental_Boosted', 779, 15, 1, 255); -- Paralyna
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental_Boosted', 779, 16, 1, 255); -- Blindna
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental_Boosted', 779, 17, 1, 255); -- Silena
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental_Boosted', 779, 18, 1, 255); -- Stona
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental_Boosted', 779, 19, 1, 255); -- Viruna
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental_Boosted', 779, 20, 1, 255); -- Cursna
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental_Boosted', 779, 21, 1, 255); -- Holy
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental_Boosted', 779, 27, 1, 255); -- Dia 5
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental_Boosted', 779, 32, 1, 255); -- Banish 5
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental_Boosted', 779, 37, 1, 255); -- Diaga 4
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental_Boosted', 779, 41, 1, 255); -- Banishga 4
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental_Boosted', 779, 98, 1, 255); -- Repose
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental_Boosted', 779, 115, 1, 255); -- Firestorm
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental_Boosted', 779, 119, 1, 255); -- Aurorastorm
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental_Boosted', 779, 148, 1, 255); -- Fire 5
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental_Boosted', 779, 177, 1, 255); -- Firaga 4
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental_Boosted', 779, 205, 1, 255); -- Flare 2
INSERT INTO `mob_spell_lists` VALUES ('Stellar_Elemental_Boosted', 779, 493, 1, 255); -- Temper

-- Minerva's Boosted Ungeweder Wind/Lightning/Fragmentation Elemental pet
INSERT INTO `mob_spell_lists` VALUES ('Olympian_Elemental_Boosted', 780, 59, 1, 255); -- Silence
INSERT INTO `mob_spell_lists` VALUES ('Olympian_Elemental_Boosted', 780, 114, 1, 255); -- Windstorm
INSERT INTO `mob_spell_lists` VALUES ('Olympian_Elemental_Boosted', 780, 117, 1, 255); -- Thunderstorm
INSERT INTO `mob_spell_lists` VALUES ('Olympian_Elemental_Boosted', 780, 158, 1, 255); -- Aero 5
INSERT INTO `mob_spell_lists` VALUES ('Olympian_Elemental_Boosted', 780, 168, 1, 255); -- Thunder 5
INSERT INTO `mob_spell_lists` VALUES ('Olympian_Elemental_Boosted', 780, 187, 1, 255); -- Aeroga 4
INSERT INTO `mob_spell_lists` VALUES ('Olympian_Elemental_Boosted', 780, 197, 1, 255); -- Thunderga 4
INSERT INTO `mob_spell_lists` VALUES ('Olympian_Elemental_Boosted', 780, 209, 1, 255); -- Tornado 2
INSERT INTO `mob_spell_lists` VALUES ('Olympian_Elemental_Boosted', 780, 213, 1, 255); -- Burst 2
INSERT INTO `mob_spell_lists` VALUES ('Olympian_Elemental_Boosted', 780, 252, 1, 255); -- Stun
INSERT INTO `mob_spell_lists` VALUES ('Olympian_Elemental_Boosted', 780, 493, 1, 255); -- Temper


/*!40000 ALTER TABLE `mob_spell_lists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-07 20:12:54
