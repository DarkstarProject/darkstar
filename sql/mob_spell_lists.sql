-- MySQL dump 10.13  Distrib 5.6.13, for Win64 (x86_64)
--
-- Host: localhost    Database: dspdb
-- ------------------------------------------------------
-- Server version   5.6.13-log

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
  `spell_list_name` varchar(30) DEFAULT NULL,
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
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_PLD',4,29,34,65);
INSERT INTO `mob_spell_lists` VALUES ('Beastmen_PLD',4,30,66,255);
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
INSERT INTO `mob_spell_lists` VALUES ('Casting_Behemoth', 126, 218, 1, 255);
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
INSERT INTO `mob_spell_lists` VALUES ('Alastor_Antlion', 132, 54, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Alastor_Antlion', 132, 162, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Alastor_Antlion', 132, 191, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Alastor_Antlion', 132, 210, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Alastor_Antlion', 132, 365, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Race_Runner', 133, 53, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Race_Runner', 133, 158, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Race_Runner', 133, 186, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Race_Runner', 133, 216, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Ajido_Marujido', 134, 166, 1, 255); -- Ajido-Marujido windurst 9-2
INSERT INTO `mob_spell_lists` VALUES ('Ajido_Marujido', 134, 167, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Ajido_Marujido', 134, 171, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Ajido_Marujido', 134, 172, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Ajido_Marujido', 134, 212, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Ajido_Marujido', 134, 214, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Yali', 135, 357, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Yali', 135, 360, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Aern_s_Wynav', 136, 382, 1, 255); -- Aern's Wynav (Ix'DRG BRD pets)
INSERT INTO `mob_spell_lists` VALUES ('Aern_s_Wynav', 136, 376, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Aern_s_Wynav', 136, 372, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Aern_s_Wynav', 136, 392, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Aern_s_Wynav', 136, 397, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Aern_s_Wynav', 136, 400, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Aern_s_Wynav', 136, 422, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Aern_s_Wynav', 136, 462, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Aern_s_Wynav', 136, 466, 1, 255); -- Virelai (charm)
INSERT INTO `mob_spell_lists` VALUES ('Sekhmet', 137, 34, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Sekhmet', 137, 260, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Sekhmet', 137, 221, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Sekhmet', 137, 258, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Sekhmet', 137, 259, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Sekhmet', 137, 254, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Sekhmet', 137, 253, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Sekhmet', 137, 216, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Sekhmet', 137, 58, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Sekhmet', 137, 59, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Sekhmet', 137, 56, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Faith', 138, 162, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Faith', 138, 191, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Faith', 138, 357, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Faith', 138, 365, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Sarameya', 139, 146, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Sarameya', 139, 147, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Sarameya', 139, 175, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Sarameya', 139, 176, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Sarameya', 139, 204, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Sarameya', 139, 205, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Sarameya', 139, 249, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Sarameya', 139, 235, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Hope', 140, 196, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Hope', 140, 213, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Avatar_SMN', 141, 296, 1, 255); -- SMN Dynamis / Maat spell list
INSERT INTO `mob_spell_lists` VALUES ('Avatar_SMN', 141, 298, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Avatar_SMN', 141, 299, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Avatar_SMN', 141, 300, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Avatar_SMN', 141, 301, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Avatar_SMN', 141, 302, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Avatar_SMN', 141, 303, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Charming_Trio', 142, 245, 1, 255); -- Prune
INSERT INTO `mob_spell_lists` VALUES ('Charming_Trio', 142, 247, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Onki', 143, 288, 1, 255);
INSERT INTO `mob_spell_lists` VALUES ('Bahamut', 144, 5, 1, 255);  -- Cure V
INSERT INTO `mob_spell_lists` VALUES ('Bahamut', 144, 106, 1, 255); -- Phalanx
INSERT INTO `mob_spell_lists` VALUES ('Bahamut', 144, 54, 1, 255);  -- Stoneskin
INSERT INTO `mob_spell_lists` VALUES ('Bahamut', 144, 47, 1, 255);  -- Protect V
INSERT INTO `mob_spell_lists` VALUES ('Bahamut', 144, 52, 1, 255);  -- Shell V
INSERT INTO `mob_spell_lists` VALUES ('Bahamut', 144, 148, 1, 255);  -- Fire V
INSERT INTO `mob_spell_lists` VALUES ('Bahamut', 144, 205, 1, 255);  -- Flare II
INSERT INTO `mob_spell_lists` VALUES ('Bahamut', 144, 177, 1, 255);  -- Firaga IV
INSERT INTO `mob_spell_lists` VALUES ('Bahamut', 144, 359, 1, 255);  -- Silencega
INSERT INTO `mob_spell_lists` VALUES ('Bahamut', 144, 360, 1, 255);  -- Dispelga
INSERT INTO `mob_spell_lists` VALUES ('Bahamut', 144, 366, 1, 255);  -- Graviga
INSERT INTO `mob_spell_lists` VALUES ('Dobsonfly', 145, 57, 1, 255);  -- Haste
INSERT INTO `mob_spell_lists` VALUES ('Dobsonfly', 145, 155, 1, 255);  -- Aero II
INSERT INTO `mob_spell_lists` VALUES ('Dobsonfly', 145, 357, 1, 255);  -- Slowga
INSERT INTO `mob_spell_lists` VALUES ('Duke_Decapod', 146, 169, 1, 10);  -- Water
INSERT INTO `mob_spell_lists` VALUES ('Ankou', 147, 230, 1, 255); -- Bio
INSERT INTO `mob_spell_lists` VALUES ('Ankou', 147, 245, 1, 255); -- Drain
INSERT INTO `mob_spell_lists` VALUES ('Ankou', 147, 247, 1, 255); -- Aspir
INSERT INTO `mob_spell_lists` VALUES ('Blighting_Brand', 148, 231, 1, 255); -- Bio II
INSERT INTO `mob_spell_lists` VALUES ('Blighting_Brand', 148, 58, 1, 255); -- Paralyze
INSERT INTO `mob_spell_lists` VALUES ('Blighting_Brand', 148, 254, 1, 255); -- Blind
INSERT INTO `mob_spell_lists` VALUES ('Blighting_Brand', 148, 253, 1, 255); -- Sleep
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Waking_Dream', 149, 245, 1, 255);  -- Drain
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Waking_Dream', 149, 247, 1, 255); -- Aspir
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Waking_Dream', 149, 274, 1, 255); -- Sleepga
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Waking_Dream', 149, 360, 1, 255); -- Dispelga
INSERT INTO `mob_spell_lists` VALUES ('Oupire', 150, 176, 1, 255); -- Firaga III
INSERT INTO `mob_spell_lists` VALUES ('Oupire', 150, 181, 1, 255); -- Blizzaga III
INSERT INTO `mob_spell_lists` VALUES ('Oupire', 150, 186, 1, 255); -- Aeroga III
INSERT INTO `mob_spell_lists` VALUES ('Oupire', 150, 191, 1, 255); -- Stonega III
INSERT INTO `mob_spell_lists` VALUES ('Oupire', 150, 196, 1, 255); -- Thundaga III
INSERT INTO `mob_spell_lists` VALUES ('Oupire', 150, 201, 1, 255); -- Waterga III
INSERT INTO `mob_spell_lists` VALUES ('Oupire', 150, 152, 1, 255); -- Blizzard IV
INSERT INTO `mob_spell_lists` VALUES ('Oupire', 150, 147, 1, 255); -- Fire IV
INSERT INTO `mob_spell_lists` VALUES ('Oupire', 150, 157, 1, 255); -- Aero IV
INSERT INTO `mob_spell_lists` VALUES ('Oupire', 150, 162, 1, 255); -- Stone IV
INSERT INTO `mob_spell_lists` VALUES ('Oupire', 150, 167, 1, 255); -- Thunder IV
INSERT INTO `mob_spell_lists` VALUES ('Oupire', 150, 172, 1, 255); -- Water IV
INSERT INTO `mob_spell_lists` VALUES ('Oupire', 150, 227, 1, 255); -- Poisonga III
INSERT INTO `mob_spell_lists` VALUES ('Oupire', 150, 360, 1, 255); -- Dispelga
INSERT INTO `mob_spell_lists` VALUES ('Oupire', 150, 365, 1, 255); -- Breakga
INSERT INTO `mob_spell_lists` VALUES ('Oupire', 150, 362, 1, 255); -- Bindga
INSERT INTO `mob_spell_lists` VALUES ('Oupire', 150, 361, 1, 255); -- Blindga
INSERT INTO `mob_spell_lists` VALUES ('Oupire', 150, 366, 1, 255); -- Graviga
INSERT INTO `mob_spell_lists` VALUES ('Oupire', 150, 274, 1, 255); -- Sleepga II
INSERT INTO `mob_spell_lists` VALUES ('Wake_Warder_Wanda', 151, 240, 1, 255);  -- Drown
INSERT INTO `mob_spell_lists` VALUES ('Lord_of_Onzozo',152,201,1,255); -- Waterga III
INSERT INTO `mob_spell_lists` VALUES ('Lord_of_Onzozo',152,362,1,255); -- Bindaga
INSERT INTO `mob_spell_lists` VALUES ('Lord_of_Onzozo',152,214,1,255); -- Flood
INSERT INTO `mob_spell_lists` VALUES ('Iratham_HP_50to100', 153, 176, 1, 255); -- Firaga 3 (Only used when over 50% HP)
INSERT INTO `mob_spell_lists` VALUES ('Iratham_HP_50to100', 153, 177, 1, 255); -- Firaga 4 (Only used when over 50% HP)
INSERT INTO `mob_spell_lists` VALUES ('Iratham_HP_50to100', 153, 204, 1, 255); -- Flare (Only used when over 50% HP)
INSERT INTO `mob_spell_lists` VALUES ('Iratham_HP_50to100', 153, 259, 1, 255); -- Sleepga 2
INSERT INTO `mob_spell_lists` VALUES ('Iratham_HP_under_50', 154, 181, 1, 255); -- Blizzaga 3 (Only used when under 50% HP)
INSERT INTO `mob_spell_lists` VALUES ('Iratham_HP_under_50', 154, 182, 1, 255); -- Blizzaga 4 (Only used when under 50% HP)
INSERT INTO `mob_spell_lists` VALUES ('Iratham_HP_under_50', 154, 206, 1, 255); -- Freeze 2 (Only used when under 50% HP)
INSERT INTO `mob_spell_lists` VALUES ('Iratham_HP_under_50', 154, 259, 1, 255); -- Sleepga 2
INSERT INTO `mob_spell_lists` VALUES ('Iratham_HP_under_20', 155, 181, 1, 255); -- Blizzaga 3 (Only used when under 50% HP)
INSERT INTO `mob_spell_lists` VALUES ('Iratham_HP_under_20', 155, 182, 1, 255); -- Blizzaga 4 (Only used when under 50% HP)
INSERT INTO `mob_spell_lists` VALUES ('Iratham_HP_under_20', 155, 206, 1, 255); -- Freeze 2 (Only used when under 50% HP)
INSERT INTO `mob_spell_lists` VALUES ('Iratham_HP_under_20', 155, 219, 1, 255); -- Comet (Only used when under 20% HP)
INSERT INTO `mob_spell_lists` VALUES ('Iratham_HP_under_20', 155, 259, 1, 255); -- Sleepga 2
INSERT INTO `mob_spell_lists` VALUES ('Yaanei', 156, 163, 1, 255); -- Stone 5
INSERT INTO `mob_spell_lists` VALUES ('Yaanei', 156, 168, 1, 255); -- Thunder 5
INSERT INTO `mob_spell_lists` VALUES ('Yaanei', 156, 192, 1, 255); -- Stonega 4
INSERT INTO `mob_spell_lists` VALUES ('Yaanei', 156, 197, 1, 255); -- Thundaga 4
INSERT INTO `mob_spell_lists` VALUES ('Yaanei', 156, 255, 1, 255); -- Break
INSERT INTO `mob_spell_lists` VALUES ('Yaanei', 156, 274, 1, 255); -- Sleepga 2
INSERT INTO `mob_spell_lists` VALUES ('Yaanei', 156, 357, 1, 255); -- Slowga
INSERT INTO `mob_spell_lists` VALUES ('Yaanei', 156, 365, 1, 255); -- Breakga
INSERT INTO `mob_spell_lists` VALUES ('Kutharei', 157, 147, 1, 255); -- Fire 5
INSERT INTO `mob_spell_lists` VALUES ('Kutharei', 157, 157, 1, 255); -- Aero 5
INSERT INTO `mob_spell_lists` VALUES ('Kutharei', 157, 177, 1, 255); -- Firaga 4
INSERT INTO `mob_spell_lists` VALUES ('Kutharei', 157, 187, 1, 255); -- Aeroga 4
INSERT INTO `mob_spell_lists` VALUES ('Kutharei', 157, 286, 1, 255); -- Addle
INSERT INTO `mob_spell_lists` VALUES ('Kutharei', 157, 359, 1, 255); -- Silencega
INSERT INTO `mob_spell_lists` VALUES ('Kutharei', 157, 360, 1, 255); -- Dispelga
INSERT INTO `mob_spell_lists` VALUES ('Kutharei', 157, 366, 1, 255); -- Graviga
INSERT INTO `mob_spell_lists` VALUES ('Sippoy_HP_50to100', 158, 153, 1, 255); -- Blizzard 5
INSERT INTO `mob_spell_lists` VALUES ('Sippoy_HP_50to100', 158, 173, 1, 255); -- Water 5
INSERT INTO `mob_spell_lists` VALUES ('Sippoy_HP_50to100', 158, 252, 1, 255); -- Stun
INSERT INTO `mob_spell_lists` VALUES ('Sippoy_HP_50to100', 158, 356, 1, 255); -- Paralyga
INSERT INTO `mob_spell_lists` VALUES ('Sippoy_HP_50to100', 158, 361, 1, 255); -- Blindga
INSERT INTO `mob_spell_lists` VALUES ('Sippoy_HP_50to100', 158, 362, 1, 255); -- Bindga
INSERT INTO `mob_spell_lists` VALUES ('Sippoy_HP_under_50', 159, 153, 1, 255); -- Blizzard 5
INSERT INTO `mob_spell_lists` VALUES ('Sippoy_HP_under_50', 159, 173, 1, 255); -- Water 5
INSERT INTO `mob_spell_lists` VALUES ('Sippoy_HP_under_50', 159, 182, 1, 255); -- Blizzaga 4
INSERT INTO `mob_spell_lists` VALUES ('Sippoy_HP_under_50', 159, 202, 1, 255); -- Waterga 4
INSERT INTO `mob_spell_lists` VALUES ('Sippoy_HP_under_50', 159, 252, 1, 255); -- Stun
INSERT INTO `mob_spell_lists` VALUES ('Sippoy_HP_under_50', 159, 356, 1, 255); -- Paralyga
INSERT INTO `mob_spell_lists` VALUES ('Sippoy_HP_under_50', 159, 361, 1, 255); -- Blindga
INSERT INTO `mob_spell_lists` VALUES ('Sippoy_HP_under_50', 159, 362, 1, 255); -- Bindga
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_75to100', 160, 112, 1, 255); -- Flash
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_75to100', 160, 176, 1, 255); -- Firaga 3
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_75to100', 160, 181, 1, 255); -- Blizzaga 3
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_75to100', 160, 186, 1, 255); -- Aeroga 3
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_75to100', 160, 191, 1, 255); -- Stonega 3
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_75to100', 160, 196, 1, 255); -- Thundaga 3
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_75to100', 160, 201, 1, 255); -- Waterga 3
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_75to100', 160, 222, 1, 255); -- Poisonga 3
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_75to100', 160, 245, 1, 255); -- Drain
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_75to100', 160, 247, 1, 255); -- Aspir
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_75to100', 160, 274, 1, 255); -- Sleepga 2
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_75to100', 160, 286, 1, 255); -- Addle
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_75to100', 160, 356, 1, 255); -- Paralyga
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_75to100', 160, 359, 1, 255); -- Silencega
-- Except for Addle, all magic cast is AoE, including Ancient Magic.
-- Above 50% HP, casts Tier 3 -ga spells.
-- Between 75% and 50%, can cast AoE Ancient Magic.
-- Under 50%, Casts tier 4 -ga spells.
-- Casts Meteor every 10%, starting at 50%. Exact % may vary. Can be stunned.
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_50to75', 161, 112, 1, 255); -- Flash
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_50to75', 161, 176, 1, 255); -- Firaga 3
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_50to75', 161, 181, 1, 255); -- Blizzaga 3
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_50to75', 161, 186, 1, 255); -- Aeroga 3
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_50to75', 161, 191, 1, 255); -- Stonega 3
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_50to75', 161, 196, 1, 255); -- Thundaga 3
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_50to75', 161, 201, 1, 255); -- Waterga 3
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_50to75', 161, 204, 1, 255); -- Flare
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_50to75', 161, 206, 1, 255); -- Freeze
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_50to75', 161, 208, 1, 255); -- Tornad
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_50to75', 161, 210, 1, 255); -- Quake
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_50to75', 161, 212, 1, 255); -- Burst
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_50to75', 161, 214, 1, 255); -- Flood
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_50to75', 161, 222, 1, 255); -- Poisonga 3
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_50to75', 161, 245, 1, 255); -- Drain
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_50to75', 161, 247, 1, 255); -- Aspir
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_50to75', 161, 274, 1, 255); -- Sleepga 2
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_50to75', 161, 286, 1, 255); -- Addle
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_50to75', 161, 356, 1, 255); -- Paralyga
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_50to75', 161, 359, 1, 255); -- Silencega
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_under_50', 162, 112, 1, 255); -- Flash
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_under_50', 162, 177, 1, 255); -- Firaga 4
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_under_50', 162, 182, 1, 255); -- Blizzaga 4
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_under_50', 162, 187, 1, 255); -- Aeroga 4
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_under_50', 162, 192, 1, 255); -- Stonega 4
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_under_50', 162, 197, 1, 255); -- Thundaga 4
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_under_50', 162, 202, 1, 255); -- Waterga 4
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_under_50', 162, 218, 1, 255); -- Meteor
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_under_50', 162, 222, 1, 255); -- Poisonga 3
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_under_50', 162, 245, 1, 255); -- Drain
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_under_50', 162, 247, 1, 255); -- Aspir
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_under_50', 162, 274, 1, 255); -- Sleepga 2
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_under_50', 162, 286, 1, 255); -- Addle
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_under_50', 162, 356, 1, 255); -- Paralyga
INSERT INTO `mob_spell_lists` VALUES ('Rani_HP_under_50', 162, 359, 1, 255); -- Silencega
INSERT INTO `mob_spell_lists` VALUES ('Raja', 163, 177, 1, 255); -- Firaga 4
INSERT INTO `mob_spell_lists` VALUES ('Raja', 163, 182, 1, 255); -- Blizzaga 4
INSERT INTO `mob_spell_lists` VALUES ('Raja', 163, 187, 1, 255); -- Aeroga 4
INSERT INTO `mob_spell_lists` VALUES ('Raja', 163, 192, 1, 255); -- Stonega 4
INSERT INTO `mob_spell_lists` VALUES ('Raja', 163, 197, 1, 255); -- Thundaga 4
INSERT INTO `mob_spell_lists` VALUES ('Raja', 163, 202, 1, 255); -- Waterga 4
INSERT INTO `mob_spell_lists` VALUES ('Raja', 163, 257, 1, 255); -- Curse (AoE)
INSERT INTO `mob_spell_lists` VALUES ('Raja', 163, 357, 1, 255); -- Slowga
INSERT INTO `mob_spell_lists` VALUES ('Raja', 163, 361, 1, 255); -- Blindga
INSERT INTO `mob_spell_lists` VALUES ('Lesser_Arimaspi',164,147,1,255); -- Fire IV
INSERT INTO `mob_spell_lists` VALUES ('Lesser_Arimaspi',164,148,1,255); -- Fire V
INSERT INTO `mob_spell_lists` VALUES ('Lesser_Arimaspi',164,152,1,255); -- Blizzard IV
INSERT INTO `mob_spell_lists` VALUES ('Lesser_Arimaspi',164,153,1,255); -- Blizzard V
INSERT INTO `mob_spell_lists` VALUES ('Lesser_Arimaspi',164,157,1,255); -- Aero IV
INSERT INTO `mob_spell_lists` VALUES ('Lesser_Arimaspi',164,158,1,255); -- Aero V
INSERT INTO `mob_spell_lists` VALUES ('Lesser_Arimaspi',164,162,1,255); -- Stone IV
INSERT INTO `mob_spell_lists` VALUES ('Lesser_Arimaspi',164,163,1,255); -- Stone V
INSERT INTO `mob_spell_lists` VALUES ('Lesser_Arimaspi',164,167,1,255); -- Thunder IV
INSERT INTO `mob_spell_lists` VALUES ('Lesser_Arimaspi',164,168,1,255); -- Thunder V
INSERT INTO `mob_spell_lists` VALUES ('Lesser_Arimaspi',164,172,1,255); -- Water IV
INSERT INTO `mob_spell_lists` VALUES ('Lesser_Arimaspi',164,173,1,255); -- Water V
INSERT INTO `mob_spell_lists` VALUES ('Lesser_Arimaspi',164,255,1,255); -- Break
INSERT INTO `mob_spell_lists` VALUES ('Lesser_Arimaspi',164,259,1,255); -- Sleep II
INSERT INTO `mob_spell_lists` VALUES ('Arimaspi',165,147,1,255); -- Fire IV
INSERT INTO `mob_spell_lists` VALUES ('Arimaspi',165,148,1,255); -- Fire V
INSERT INTO `mob_spell_lists` VALUES ('Arimaspi',165,152,1,255); -- Blizzard IV
INSERT INTO `mob_spell_lists` VALUES ('Arimaspi',165,153,1,255); -- Blizzard V
INSERT INTO `mob_spell_lists` VALUES ('Arimaspi',165,157,1,255); -- Aero IV
INSERT INTO `mob_spell_lists` VALUES ('Arimaspi',165,158,1,255); -- Aero V
INSERT INTO `mob_spell_lists` VALUES ('Arimaspi',165,162,1,255); -- Stone IV
INSERT INTO `mob_spell_lists` VALUES ('Arimaspi',165,163,1,255); -- Stone V
INSERT INTO `mob_spell_lists` VALUES ('Arimaspi',165,167,1,255); -- Thunder IV
INSERT INTO `mob_spell_lists` VALUES ('Arimaspi',165,168,1,255); -- Thunder V
INSERT INTO `mob_spell_lists` VALUES ('Arimaspi',165,172,1,255); -- Water IV
INSERT INTO `mob_spell_lists` VALUES ('Arimaspi',165,173,1,255); -- Water V
INSERT INTO `mob_spell_lists` VALUES ('Arimaspi',165,252,1,255); -- Stun
INSERT INTO `mob_spell_lists` VALUES ('Arimaspi',165,257,1,255); -- Curse
INSERT INTO `mob_spell_lists` VALUES ('Arimaspi',165,259,1,255); -- Sleep II
INSERT INTO `mob_spell_lists` VALUES ('Ashtaerh_the_Gallvexed',166,167,1,255); -- Thunder IV
INSERT INTO `mob_spell_lists` VALUES ('Ashtaerh_the_Gallvexed',166,168,1,255); -- Thunder V
INSERT INTO `mob_spell_lists` VALUES ('Ashtaerh_the_Gallvexed',166,196,1,255); -- Thundaga III
INSERT INTO `mob_spell_lists` VALUES ('Ashtaerh_the_Gallvexed',166,197,1,255); -- Thundaga IV
INSERT INTO `mob_spell_lists` VALUES ('Ashtaerh_the_Gallvexed',166,201,1,255); -- Waterga III
INSERT INTO `mob_spell_lists` VALUES ('Ashtaerh_the_Gallvexed',166,202,1,255); -- Waterga IV
INSERT INTO `mob_spell_lists` VALUES ('Bakka',167,152,1,255); -- Blizzard IV
INSERT INTO `mob_spell_lists` VALUES ('Bakka',167,153,1,255); -- Blizzard V
INSERT INTO `mob_spell_lists` VALUES ('Bakka',167,181,1,255); -- Blizzaga III
INSERT INTO `mob_spell_lists` VALUES ('Bakka',167,182,1,255); -- Blizzaga IV
INSERT INTO `mob_spell_lists` VALUES ('Bakka',167,206,1,255); -- Freeze
INSERT INTO `mob_spell_lists` VALUES ('Bakka',167,236,1,255); -- Frost
INSERT INTO `mob_spell_lists` VALUES ('Bakka',167,356,1,255); -- Paralyga
INSERT INTO `mob_spell_lists` VALUES ('Bakka',167,362,1,255); -- Bindga
INSERT INTO `mob_spell_lists` VALUES ('Bloodeye_Vileberry',168,176,1,255); -- Firga III
INSERT INTO `mob_spell_lists` VALUES ('Bloodeye_Vileberry',168,181,1,255); -- Blizzaga III
INSERT INTO `mob_spell_lists` VALUES ('Bloodeye_Vileberry',168,186,1,255); -- Aeroga III
INSERT INTO `mob_spell_lists` VALUES ('Bloodeye_Vileberry',168,191,1,255); -- Stonega III
INSERT INTO `mob_spell_lists` VALUES ('Bloodeye_Vileberry',168,196,1,255); -- Thundaga III
INSERT INTO `mob_spell_lists` VALUES ('Bloodeye_Vileberry',168,201,1,255); -- Waterga III
INSERT INTO `mob_spell_lists` VALUES ('Bloodeye_Vileberry',168,227,1,255); -- Poisonga III
INSERT INTO `mob_spell_lists` VALUES ('Bloodeye_Vileberry',168,255,1,255); -- Break
INSERT INTO `mob_spell_lists` VALUES ('Bloodeye_Vileberry',168,356,1,255); -- Paralyga
INSERT INTO `mob_spell_lists` VALUES ('Bloodeye_Vileberry',168,362,1,255); -- Bindga
INSERT INTO `mob_spell_lists` VALUES ('Bloodeye_Vileberry',168,366,1,255); -- Graviga
INSERT INTO `mob_spell_lists` VALUES ('Bloodeye_Vileberry',168,367,1,255); -- Death
INSERT INTO `mob_spell_lists` VALUES ('Gangly_Gean',169,167,1,255); -- Thunder IV
INSERT INTO `mob_spell_lists` VALUES ('Gangly_Gean',169,172,1,255); -- Water IV
INSERT INTO `mob_spell_lists` VALUES ('Gangly_Gean',169,196,1,255); -- Thundga III
INSERT INTO `mob_spell_lists` VALUES ('Gangly_Gean',169,201,1,255); -- Waterga III
INSERT INTO `mob_spell_lists` VALUES ('Gangly_Gean',169,226,1,255); -- Poisonga II
INSERT INTO `mob_spell_lists` VALUES ('Gangly_Gean',169,252,1,255); -- Stun
INSERT INTO `mob_spell_lists` VALUES ('Gangly_Gean',169,274,1,255); -- Sleepga II
INSERT INTO `mob_spell_lists` VALUES ('Guimauve',170,152,1,255); -- Blizzard IV
INSERT INTO `mob_spell_lists` VALUES ('Guimauve',170,184,1,255); -- Aeroga III
INSERT INTO `mob_spell_lists` VALUES ('Guimauve',170,191,1,255); -- Stonega III
INSERT INTO `mob_spell_lists` VALUES ('Guimauve',170,356,1,255); -- Paralyga
INSERT INTO `mob_spell_lists` VALUES ('Guimauve',170,357,1,255); -- Slowga
INSERT INTO `mob_spell_lists` VALUES ('Guimauve',170,359,1,255); -- Silencega
INSERT INTO `mob_spell_lists` VALUES ('Lentor',171,173,1,255); -- Water V
INSERT INTO `mob_spell_lists` VALUES ('Lentor',171,201,1,255); -- Waterga III
INSERT INTO `mob_spell_lists` VALUES ('Lentor',171,202,1,255); -- Waterga IV
INSERT INTO `mob_spell_lists` VALUES ('Siranpa-kamuy',172,157,1,255); -- Aero IV
INSERT INTO `mob_spell_lists` VALUES ('Siranpa-kamuy',172,162,1,255); -- Stone IV
INSERT INTO `mob_spell_lists` VALUES ('Siranpa-kamuy',172,186,1,255); -- Aeroga III
INSERT INTO `mob_spell_lists` VALUES ('Siranpa-kamuy',172,191,1,255); -- Stonega III
INSERT INTO `mob_spell_lists` VALUES ('Siranpa-kamuy',172,359,1,255); -- Silencega
INSERT INTO `mob_spell_lists` VALUES ('Tonberry_Lieje',173,147,1,255); -- Fire IV
INSERT INTO `mob_spell_lists` VALUES ('Tonberry_Lieje',173,148,1,255); -- Fire V
INSERT INTO `mob_spell_lists` VALUES ('Tonberry_Lieje',173,176,1,255); -- Firaga III
INSERT INTO `mob_spell_lists` VALUES ('Tonberry_Lieje',173,177,1,255); -- Firaga IV
INSERT INTO `mob_spell_lists` VALUES ('Tonberry_Lieje',173,204,1,255); -- Flare
INSERT INTO `mob_spell_lists` VALUES ('Tonberry_Lieje',173,205,1,255); -- Flare II
INSERT INTO `mob_spell_lists` VALUES ('Turul', 174, 157, 1, 255); -- Aero 4
INSERT INTO `mob_spell_lists` VALUES ('Turul', 174, 167, 1, 255); -- Thunder 4
INSERT INTO `mob_spell_lists` VALUES ('Turul', 174, 168, 1, 255); -- Thunder 5
INSERT INTO `mob_spell_lists` VALUES ('Turul', 174, 186, 1, 255); -- Aeroga 3
INSERT INTO `mob_spell_lists` VALUES ('Turul', 174, 196, 1, 255); -- Thundaga 3
INSERT INTO `mob_spell_lists` VALUES ('Turul', 174, 197, 1, 255); -- Thundaga 4
INSERT INTO `mob_spell_lists` VALUES ('Turul', 174, 359, 1, 255); -- Silencega
INSERT INTO `mob_spell_lists` VALUES ('Turul_low_HP', 175, 157, 1, 255); -- Aero 4
INSERT INTO `mob_spell_lists` VALUES ('Turul_low_HP', 175, 158, 1, 255); -- Aero 5
INSERT INTO `mob_spell_lists` VALUES ('Turul_low_HP', 175, 167, 1, 255); -- Thunder 4
INSERT INTO `mob_spell_lists` VALUES ('Turul_low_HP', 175, 168, 1, 255); -- Thunder 5
INSERT INTO `mob_spell_lists` VALUES ('Turul_low_HP', 175, 186, 1, 255); -- Aeroga 3
INSERT INTO `mob_spell_lists` VALUES ('Turul_low_HP', 175, 187, 1, 255); -- Aeroga 4
INSERT INTO `mob_spell_lists` VALUES ('Turul_low_HP', 175, 196, 1, 255); -- Thundaga 3
INSERT INTO `mob_spell_lists` VALUES ('Turul_low_HP', 175, 197, 1, 255); -- Thundaga 4
INSERT INTO `mob_spell_lists` VALUES ('Turul_low_HP', 175, 208, 1, 255); -- AoE Tornado
INSERT INTO `mob_spell_lists` VALUES ('Turul_low_HP', 175, 212, 1, 255); -- AoE Burst
INSERT INTO `mob_spell_lists` VALUES ('Turul_low_HP', 175, 252, 1, 255); -- AoE Stun
INSERT INTO `mob_spell_lists` VALUES ('Turul_low_HP', 175, 359, 1, 255); -- Silencega
INSERT INTO `mob_spell_lists` VALUES ('Baba_Yaga',176,186,1,255); -- Aeroga III
INSERT INTO `mob_spell_lists` VALUES ('Baba_Yaga',176,359,1,255); -- Silencega
INSERT INTO `mob_spell_lists` VALUES ('Baba_Yaga',176,366,1,255); -- Graviga
-- Carabosse changes casting habits mid fight. Starts as whm/cure AI. Begins mode changes after Benediction.
-- Also has rdm (enhancing), blm (nuking), and warrior (melee) "mode" that it switches to.
-- (see MOBMOD_BUFF_CHANCE and its relatives, as well as the setSpellList function)
-- Uncertain if actual full on job change, but DOES gain the traits (double attack, magic attack..)
-- http://ffxiclopedia.wikia.com/wiki/Carabosse
INSERT INTO `mob_spell_lists` VALUES ('Carabosse',177,5,1,255); -- Cure V
INSERT INTO `mob_spell_lists` VALUES ('Carabosse',177,6,1,255); -- Cure Vi
INSERT INTO `mob_spell_lists` VALUES ('Carabosse',177,47,1,255); -- Protect V
INSERT INTO `mob_spell_lists` VALUES ('Carabosse',177,52,1,255); -- Shell V
INSERT INTO `mob_spell_lists` VALUES ('Carabosse',177,54,1,255); -- Stoneskin
-- INSERT INTO `mob_spell_lists` VALUES ('Carabosse',177,157,1,255); -- Aero IV
-- INSERT INTO `mob_spell_lists` VALUES ('Carabosse',177,158,1,255); -- Aero V
-- INSERT INTO `mob_spell_lists` VALUES ('Carabosse',177,184,1,255); -- Aeroga III
-- INSERT INTO `mob_spell_lists` VALUES ('Carabosse',177,208,1,255); -- Tornado
-- INSERT INTO `mob_spell_lists` VALUES ('Carabosse',177,209,1,255); -- Tornado II
-- INSERT INTO `mob_spell_lists` VALUES ('Carabosse',177,365,1,255); -- Breakga
INSERT INTO `mob_spell_lists` VALUES ('Irrlicht',178,180,1,255); -- Blizzaga II
INSERT INTO `mob_spell_lists` VALUES ('Irrlicht',178,274,1,255); -- Sleepga II
INSERT INTO `mob_spell_lists` VALUES ('Irrlicht',178,360,1,255); -- Dispelga
INSERT INTO `mob_spell_lists` VALUES ('Irrlicht',178,362,1,255); -- Bindga
INSERT INTO `mob_spell_lists` VALUES ('La_Theine_Liege',179,184,1,255); -- aeroga III
INSERT INTO `mob_spell_lists` VALUES ('Megamaw_Mikey',180,163,1,255); -- Stone V
INSERT INTO `mob_spell_lists` VALUES ('Megamaw_Mikey',180,191,1,255); -- Stonega III
INSERT INTO `mob_spell_lists` VALUES ('Megamaw_Mikey',180,210,1,255); -- Quake
INSERT INTO `mob_spell_lists` VALUES ('Trembler_Tabitha',181,210,1,255); -- Quake
INSERT INTO `mob_spell_lists` VALUES ('Poroggo_Dom_Juan',182,201,1,255); -- Waterga III
INSERT INTO `mob_spell_lists` VALUES ('Poroggo_Dom_Juan',182,226,1,255); -- Poisonga II
INSERT INTO `mob_spell_lists` VALUES ('Abas',183,172,1,255); -- Water IV
INSERT INTO `mob_spell_lists` VALUES ('Abas',183,201,1,255); -- Waterga III
INSERT INTO `mob_spell_lists` VALUES ('Abas',183,214,1,255); -- Flood
INSERT INTO `mob_spell_lists` VALUES ('Abas',183,226,1,255); -- Poisonga II
INSERT INTO `mob_spell_lists` VALUES ('Cannered_Noz',184,152,1,255); -- Blizzard IV
INSERT INTO `mob_spell_lists` VALUES ('Cannered_Noz',184,153,1,255); -- Blizzard V
INSERT INTO `mob_spell_lists` VALUES ('Cannered_Noz',184,181,1,255); -- Blizzaga III
INSERT INTO `mob_spell_lists` VALUES ('Cannered_Noz',184,182,1,255); -- Blizzaga IV
INSERT INTO `mob_spell_lists` VALUES ('Cannered_Noz',184,206,1,255); -- Freeze
INSERT INTO `mob_spell_lists` VALUES ('Cannered_Noz',184,207,1,255); -- Freeze II
INSERT INTO `mob_spell_lists` VALUES ('Cannered_Noz',184,274,1,255); -- Sleepga II
INSERT INTO `mob_spell_lists` VALUES ('Cannered_Noz',184,356,1,255); -- Paralyga
INSERT INTO `mob_spell_lists` VALUES ('Cannered_Noz',184,359,1,255); -- Silencega
INSERT INTO `mob_spell_lists` VALUES ('Cannered_Noz',184,366,1,255); -- Graviga
INSERT INTO `mob_spell_lists` VALUES ('Cannered_Noz',184,367,1,255); -- Death
INSERT INTO `mob_spell_lists` VALUES ('Chukwa',185,192,1,255); -- Stonega IV
INSERT INTO `mob_spell_lists` VALUES ('Chukwa',185,202,1,255); -- Waterga IV
INSERT INTO `mob_spell_lists` VALUES ('Chukwa',185,211,1,255); -- Quake II
INSERT INTO `mob_spell_lists` VALUES ('Chukwa',185,215,1,255); -- Flood II
INSERT INTO `mob_spell_lists` VALUES ('Cuelebre',186,357,1,255); -- Slowga
INSERT INTO `mob_spell_lists` VALUES ('Cuelebre',186,365,1,255); -- Breakga
INSERT INTO `mob_spell_lists` VALUES ('Cuelebre',186,54,1,255);  -- Stoneskin
INSERT INTO `mob_spell_lists` VALUES ('Glavoid',187,192,1,255); -- Stonega IV
INSERT INTO `mob_spell_lists` VALUES ('Glavoid',187,211,1,255); -- Quake II
INSERT INTO `mob_spell_lists` VALUES ('Glavoid',187,357,1,255); -- Slowga
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Fireday',188,147,1,255); -- Fire IV
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Fireday',188,176,1,255); -- Firaga III
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Fireday',188,204,1,255); -- Flare
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Fireday',188,235,1,255); -- Burn
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Fireday',188,249,1,255); -- Blaze spikes
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Iceday',189,152,1,255); -- Blizzard IV
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Iceday',189,181,1,255); -- Blizzaga III
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Iceday',189,206,1,255); -- Freeze
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Iceday',189,236,1,255); -- Frost
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Iceday',189,250,1,255); -- Ice spikes
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Earthday',190,162,1,255); -- Stone IV
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Earthday',190,191,1,255); -- Stonega III
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Earthday',190,210,1,255); -- Quake
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Earthday',190,238,1,255); -- Rasp
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Thunderday',191,167,1,255); -- Thunder IV
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Thunderday',191,196,1,255); -- Thundaga III
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Thunderday',191,212,1,255); -- Burst
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Thunderday',191,251,1,255); -- Shock spikes
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Waterday',192,172,1,255); -- Water IV
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Waterday',192,201,1,255); -- Waterga III
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Waterday',192,214,1,255); -- Flood
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Waterday',192,240,1,255); -- Drown
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_windday',193,157,1,255); -- Aero IV
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_windday',193,186,1,255); -- Aeroga III
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_windday',193,208,1,255); -- Tornado
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_windday',193,237,1,255); -- Choke
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Darkday',194,231,1,255); -- Bio II
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Darkday',194,242,1,255); -- Absorb-acc
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Darkday',194,245,1,255); -- Drain
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Darkday',194,247,1,255); -- Aspir
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Darkday',194,266,1,255); -- Absorb-str
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Darkday',194,267,1,255); -- Absorb-dex
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Darkday',194,268,1,255); -- Absorb-vit
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Darkday',194,269,1,255); -- Absorb-agi
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Darkday',194,270,1,255); -- Absorb-int
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Darkday',194,271,1,255); -- Absorb-mnd
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Darkday',194,272,1,255); -- Absorb-chr
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Darkday',194,273,1,255); -- Sleepga
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Lightday',195,21,1,255); -- Holy
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Lightday',195,25,1,255); -- Dia III
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Lightday',195,31,1,255); -- Banish IV
INSERT INTO `mob_spell_lists` VALUES ('Lachrymater_Lightday',195,40,1,255); -- Banishga III
INSERT INTO `mob_spell_lists` VALUES ('Lacovie',196,163,1,255); -- Stone V
INSERT INTO `mob_spell_lists` VALUES ('Lacovie',196,210,1,255); -- Quake
INSERT INTO `mob_spell_lists` VALUES ('Lacovie',196,255,1,255); -- Break
INSERT INTO `mob_spell_lists` VALUES ('Lacovie',196,79,1,255);  -- Slow II
INSERT INTO `mob_spell_lists` VALUES ('Manananggal',197,150,1,255); -- Blizzard II
INSERT INTO `mob_spell_lists` VALUES ('Manananggal',197,231,1,255); -- Bio II
INSERT INTO `mob_spell_lists` VALUES ('Manananggal',197,267,1,255); -- Absorb-dex
INSERT INTO `mob_spell_lists` VALUES ('Manananggal',197,268,1,255); -- Absorb Vit
INSERT INTO `mob_spell_lists` VALUES ('Manananggal',197,275,1,255); -- Absorb tp
INSERT INTO `mob_spell_lists` VALUES ('Mictlantecuhtli',198,147,1,255); -- Fire IV
INSERT INTO `mob_spell_lists` VALUES ('Mictlantecuhtli',198,152,1,255); -- Blizzard IV
INSERT INTO `mob_spell_lists` VALUES ('Mictlantecuhtli',198,162,1,255); -- Stone IV
INSERT INTO `mob_spell_lists` VALUES ('Mictlantecuhtli',198,167,1,255); -- Thunder IV
INSERT INTO `mob_spell_lists` VALUES ('Mictlantecuhtli',198,172,1,255); -- Water IV
INSERT INTO `mob_spell_lists` VALUES ('Mictlantecuhtli',198,176,1,255); -- Firaga III
INSERT INTO `mob_spell_lists` VALUES ('Mictlantecuhtli',198,181,1,255); -- Blizzaga III
INSERT INTO `mob_spell_lists` VALUES ('Mictlantecuhtli',198,191,1,255); -- Stonega III
INSERT INTO `mob_spell_lists` VALUES ('Mictlantecuhtli',198,196,1,255); -- Thundaga III
INSERT INTO `mob_spell_lists` VALUES ('Mictlantecuhtli',198,201,1,255); -- Waterga III
INSERT INTO `mob_spell_lists` VALUES ('Mictlantecuhtli',198,204,1,255); -- Flare
INSERT INTO `mob_spell_lists` VALUES ('Mictlantecuhtli',198,206,1,255); -- Freeze
INSERT INTO `mob_spell_lists` VALUES ('Mictlantecuhtli',198,208,1,255); -- Tornado
INSERT INTO `mob_spell_lists` VALUES ('Mictlantecuhtli',198,210,1,255); -- Quake
INSERT INTO `mob_spell_lists` VALUES ('Mictlantecuhtli',198,212,1,255); -- Burst
INSERT INTO `mob_spell_lists` VALUES ('Mictlantecuhtli',198,214,1,255); -- Flood
INSERT INTO `mob_spell_lists` VALUES ('Mictlantecuhtli',198,245,1,255); -- Drain
INSERT INTO `mob_spell_lists` VALUES ('Mictlantecuhtli',198,259,1,255); -- Sleep II
INSERT INTO `mob_spell_lists` VALUES ('Mictlantecuhtli',198,274,1,255); -- Sleepga II
INSERT INTO `mob_spell_lists` VALUES ('Quetzalli',199,148,1,255); -- Fire V
INSERT INTO `mob_spell_lists` VALUES ('Quetzalli',199,177,1,255); -- Firaga IV
INSERT INTO `mob_spell_lists` VALUES ('Quetzalli',199,204,1,255); -- Flare
INSERT INTO `mob_spell_lists` VALUES ('Ophanim',200,176,1,255); -- Firaga III
INSERT INTO `mob_spell_lists` VALUES ('Ophanim',200,181,1,255); -- Blizzaga III
INSERT INTO `mob_spell_lists` VALUES ('Ophanim',200,191,1,255); -- Stonega III
INSERT INTO `mob_spell_lists` VALUES ('Ophanim',200,196,1,255); -- Thundaga III
INSERT INTO `mob_spell_lists` VALUES ('Ophanim',200,201,1,255); -- Waterga III
INSERT INTO `mob_spell_lists` VALUES ('Ophanim',200,231,1,255); -- Bio II
INSERT INTO `mob_spell_lists` VALUES ('Ophanim',200,245,1,255); -- Drain
INSERT INTO `mob_spell_lists` VALUES ('Ophanim',200,247,1,255); -- Aspir
INSERT INTO `mob_spell_lists` VALUES ('Ophanim',200,249,1,255); -- Blaze spikes
INSERT INTO `mob_spell_lists` VALUES ('Halimede',201,181,1,255); -- Blizzaga III
INSERT INTO `mob_spell_lists` VALUES ('Halimede',201,201,1,255); -- Waterga III
INSERT INTO `mob_spell_lists` VALUES ('Halimede',201,206,1,255); -- Freeze
INSERT INTO `mob_spell_lists` VALUES ('Halimede',201,214,1,255); -- Flood
INSERT INTO `mob_spell_lists` VALUES ('Halimede',201,226,1,255); -- Poisonga II
INSERT INTO `mob_spell_lists` VALUES ('Halimede',201,356,1,255); -- Paralyga
INSERT INTO `mob_spell_lists` VALUES ('Mindertaur',202,5,1,255); -- Cure V
INSERT INTO `mob_spell_lists` VALUES ('Mindertaur',202,29,1,255); -- Banish II
INSERT INTO `mob_spell_lists` VALUES ('Mindertaur',202,112,1,255); -- Flash
INSERT INTO `mob_spell_lists` VALUES ('Eldertaur',203,5,1,255); --  Cure V
INSERT INTO `mob_spell_lists` VALUES ('Eldertaur',203,46,1,255); -- Protect IV
INSERT INTO `mob_spell_lists` VALUES ('Eldertaur',203,50,1,255); -- Shell III
INSERT INTO `mob_spell_lists` VALUES ('FireSpirit',204,144,13,37); -- Fire
INSERT INTO `mob_spell_lists` VALUES ('FireSpirit',204,145,38,61); -- Fire II
INSERT INTO `mob_spell_lists` VALUES ('FireSpirit',204,146,62,72); -- Fire III
INSERT INTO `mob_spell_lists` VALUES ('FireSpirit',204,147,73,85); -- Fire IV
INSERT INTO `mob_spell_lists` VALUES ('FireSpirit',204,148,86,255); -- Fire V
INSERT INTO `mob_spell_lists` VALUES ('FireSpirit',204,204,60,255); -- Flare
INSERT INTO `mob_spell_lists` VALUES ('FireSpirit',204,235,24,255); -- Burn
INSERT INTO `mob_spell_lists` VALUES ('IceSpirit',205,58,4,255); -- Paralyze
INSERT INTO `mob_spell_lists` VALUES ('IceSpirit',205,149,17,41); -- Blizzard
INSERT INTO `mob_spell_lists` VALUES ('IceSpirit',205,150,42,63); -- Blizzard II
INSERT INTO `mob_spell_lists` VALUES ('IceSpirit',205,151,64,73); -- Blizzard III
INSERT INTO `mob_spell_lists` VALUES ('IceSpirit',205,152,74,88); -- Blizzard IV
INSERT INTO `mob_spell_lists` VALUES ('IceSpirit',205,153,89,255); -- Blizzard V
INSERT INTO `mob_spell_lists` VALUES ('IceSpirit',205,236,22,255); -- Frost
INSERT INTO `mob_spell_lists` VALUES ('IceSpirit',205,206,50,255); -- Freeze
INSERT INTO `mob_spell_lists` VALUES ('IceSpirit',205,258,7,255); -- Bind
INSERT INTO `mob_spell_lists` VALUES ('AirSpirit',206,216,21,255); -- Gravity
INSERT INTO `mob_spell_lists` VALUES ('AirSpirit',206,59,15,255); -- Silence
INSERT INTO `mob_spell_lists` VALUES ('AirSpirit',206,154,9,33); -- Aero
INSERT INTO `mob_spell_lists` VALUES ('AirSpirit',206,155,34,58); -- Aero II
INSERT INTO `mob_spell_lists` VALUES ('AirSpirit',206,156,59,71); -- Aero III
INSERT INTO `mob_spell_lists` VALUES ('AirSpirit',206,157,72,82); -- Aero IV
INSERT INTO `mob_spell_lists` VALUES ('AirSpirit',206,158,83,255); -- Aero V
INSERT INTO `mob_spell_lists` VALUES ('AirSpirit',206,237,20,255); -- Choke
INSERT INTO `mob_spell_lists` VALUES ('EarthSpirit',207,56,13,255); -- Slow
INSERT INTO `mob_spell_lists` VALUES ('EarthSpirit',207,238,18,255); -- Rasp
INSERT INTO `mob_spell_lists` VALUES ('EarthSpirit',207,159,1,25); -- Stone
INSERT INTO `mob_spell_lists` VALUES ('EarthSpirit',207,160,26,50); -- Stone II
INSERT INTO `mob_spell_lists` VALUES ('EarthSpirit',207,161,51,67); -- Stone III
INSERT INTO `mob_spell_lists` VALUES ('EarthSpirit',207,162,68,76); -- Stone IV
INSERT INTO `mob_spell_lists` VALUES ('EarthSpirit',207,163,77,255); -- Stone V
INSERT INTO `mob_spell_lists` VALUES ('EarthSpirit',207,210,54,255); -- Quake
INSERT INTO `mob_spell_lists` VALUES ('ThunderSpirit',208,164,21,45); -- Thunder
INSERT INTO `mob_spell_lists` VALUES ('ThunderSpirit',208,165,46,65); -- Thunder II
INSERT INTO `mob_spell_lists` VALUES ('ThunderSpirit',208,166,66,74); -- Thunder III
INSERT INTO `mob_spell_lists` VALUES ('ThunderSpirit',208,167,75,91); -- Thunder IV
INSERT INTO `mob_spell_lists` VALUES ('ThunderSpirit',208,168,92,255); -- Thunder V
INSERT INTO `mob_spell_lists` VALUES ('ThunderSpirit',208,239,16,50); -- Shock
INSERT INTO `mob_spell_lists` VALUES ('ThunderSpirit',208,212,56,255); -- Burst
INSERT INTO `mob_spell_lists` VALUES ('WaterSpirit',209,169,5,29); -- Water
INSERT INTO `mob_spell_lists` VALUES ('WaterSpirit',209,170,30,54); -- Water II
INSERT INTO `mob_spell_lists` VALUES ('WaterSpirit',209,171,55,69); -- Water III
INSERT INTO `mob_spell_lists` VALUES ('WaterSpirit',209,172,70,79); -- Water IV
INSERT INTO `mob_spell_lists` VALUES ('WaterSpirit',209,173,80,255); -- Water V
INSERT INTO `mob_spell_lists` VALUES ('WaterSpirit',209,240,27,255); -- Drown
INSERT INTO `mob_spell_lists` VALUES ('WaterSpirit',209,220,3,41); -- Poison
INSERT INTO `mob_spell_lists` VALUES ('WaterSpirit',209,221,42,255); -- Poison II
INSERT INTO `mob_spell_lists` VALUES ('WaterSpirit',209,214,58,255); -- Flood
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,1,1,10); -- Cure
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,2,11,20); -- Cure II
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,3,21,40); -- Cure III
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,4,41,60); -- Cure IV
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,5,61,255); -- Cure V
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,21,50,94); -- Holy
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,22,95,255); -- Holy II
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,23,1,30); -- Dia
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,24,31,255); -- Dia II
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,28,5,29); -- Banish
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,29,30,64); -- Banish II
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,30,65,89); -- Banish III
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,31,90,255); -- Banish IV
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,43,7,26); -- Protect
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,44,27,46); -- Protect II
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,45,47,62); -- Protect III
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,46,63,75); -- Protect IV
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,47,76,255); -- Protect V
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,48,17,36); -- Shell
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,49,37,56); -- Shell II
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,50,57,67); -- Shell III
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,51,68,75); -- Shell IV
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,52,76,255); -- Shell V
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,108,21,255); -- Regen
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,112,37,255); -- Flash
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,57,40,255); -- Haste
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,7,16,30); -- Curaga
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,8,31,50); -- Curaga II
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,9,51,70); -- Curaga III
INSERT INTO `mob_spell_lists` VALUES ('LightSpirit',210,10,71,255); -- Curaga IV
INSERT INTO `mob_spell_lists` VALUES ('DarkSpirit',211,254,1,255); -- Blind
INSERT INTO `mob_spell_lists` VALUES ('DarkSpirit',211,230,10,34); -- Bio
INSERT INTO `mob_spell_lists` VALUES ('DarkSpirit',211,231,35,255); -- Bio II
INSERT INTO `mob_spell_lists` VALUES ('DarkSpirit',211,245,10,255); -- Drain
INSERT INTO `mob_spell_lists` VALUES ('DarkSpirit',211,247,20,255); -- Aspir
INSERT INTO `mob_spell_lists` VALUES ('DarkSpirit',211,252,37,255); -- Stun
INSERT INTO `mob_spell_lists` VALUES ('DarkSpirit',211,253,20,255); -- Sleep
INSERT INTO `mob_spell_lists` VALUES ('DarkSpirit',211,259,41,255); -- Sleep II
INSERT INTO `mob_spell_lists` VALUES ('DarkSpirit',211,260,32,255); -- Dispel
INSERT INTO `mob_spell_lists` VALUES ('DarkSpirit',211,266,43,255); -- Absorb-STR
INSERT INTO `mob_spell_lists` VALUES ('DarkSpirit',211,267,41,255); -- Absorb-DEX
INSERT INTO `mob_spell_lists` VALUES ('DarkSpirit',211,268,35,255); -- Absorb-VIT
INSERT INTO `mob_spell_lists` VALUES ('DarkSpirit',211,269,37,255); -- Absorb-AGI
INSERT INTO `mob_spell_lists` VALUES ('DarkSpirit',211,270,39,255); -- Absorb-INT
INSERT INTO `mob_spell_lists` VALUES ('DarkSpirit',211,271,31,255); -- Absorb-MND
INSERT INTO `mob_spell_lists` VALUES ('DarkSpirit',211,272,33,255); -- Absorb-CHR
INSERT INTO `mob_spell_lists` VALUES ('DarkSpirit',211,273,31,55); -- Sleepga
INSERT INTO `mob_spell_lists` VALUES ('DarkSpirit',211,274,56,255); -- Sleepga II
INSERT INTO `mob_spell_lists` VALUES ('DarkSpirit',211,275,45,255); -- Absorb-TP
INSERT INTO `mob_spell_lists` VALUES ('Amnaf_blu',212,640,1,255); -- Tail Slap
INSERT INTO `mob_spell_lists` VALUES ('Amnaf_blu',212,641,1,255); -- Hysteric Barrage
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,557,1,255); -- Raubahn uses only "Eyes on Me" and nothing else.
INSERT INTO `mob_spell_lists` VALUES ('Alexander',214,22,1,255); -- Holy II
INSERT INTO `mob_spell_lists` VALUES ('Alexander',214,25,1,255); -- Dia III
INSERT INTO `mob_spell_lists` VALUES ('Alexander',214,31,1,255); -- Banish IV
INSERT INTO `mob_spell_lists` VALUES ('Alexander',214,35,1,255); -- Diaga III
INSERT INTO `mob_spell_lists` VALUES ('Alexander',214,40,1,255); -- Banishga III
INSERT INTO `mob_spell_lists` VALUES ('Amun',215,148,1,255); -- fire_v
INSERT INTO `mob_spell_lists` VALUES ('Amun',215,158,1,255); -- aero_v
INSERT INTO `mob_spell_lists` VALUES ('Amun',215,177,1,255); -- firaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Amun',215,187,1,255); -- aeroga_iv
INSERT INTO `mob_spell_lists` VALUES ('Amun',215,359,1,255); -- Silencega
INSERT INTO `mob_spell_lists` VALUES ('Berstuk',216,202,1,255); -- waterga_iv
INSERT INTO `mob_spell_lists` VALUES ('Berstuk',216,366,1,255); -- graviga
INSERT INTO `mob_spell_lists` VALUES ('Berstuk',216,501,1,255); -- waterja
INSERT INTO `mob_spell_lists` VALUES ('Berstuk',216,713,1,255); -- water_v
INSERT INTO `mob_spell_lists` VALUES ('Blazing_Eruca',217,286,1,255); -- addle
INSERT INTO `mob_spell_lists` VALUES ('Blazing_Eruca',217,148,1,255); -- fire_v
INSERT INTO `mob_spell_lists` VALUES ('Blazing_Eruca',217,177,1,255); -- firaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Drekavac',218,55,1,255); -- aquaveil
INSERT INTO `mob_spell_lists` VALUES ('Drekavac',218,113,1,255); -- rainstorm
INSERT INTO `mob_spell_lists` VALUES ('Drekavac',218,202,1,255); -- waterga_iv
INSERT INTO `mob_spell_lists` VALUES ('Drekavac',218,491,1,255); -- gain-mnd
INSERT INTO `mob_spell_lists` VALUES ('Drekavac',218,501,1,255); -- waterja
INSERT INTO `mob_spell_lists` VALUES ('Drekavac',218,713,1,255); -- water_v
INSERT INTO `mob_spell_lists` VALUES ('Granite_Borer',219,148,1,255); -- fire_v
INSERT INTO `mob_spell_lists` VALUES ('Granite_Borer',219,177,1,255); -- firaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Kharon',220,275,1,255); -- absorb-tp
INSERT INTO `mob_spell_lists` VALUES ('Kharon',220,277,1,255); -- dread_spikes
INSERT INTO `mob_spell_lists` VALUES ('Maahes',221,167,1,255); -- thunder_iv
INSERT INTO `mob_spell_lists` VALUES ('Maahes',221,168,1,255); -- thunder_v
INSERT INTO `mob_spell_lists` VALUES ('Maahes',221,196,1,255); -- thundaga_iii
INSERT INTO `mob_spell_lists` VALUES ('Maahes',221,197,1,255); -- thundaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Mielikki',222,99,1,255); -- sandstorm
INSERT INTO `mob_spell_lists` VALUES ('Mielikki',222,163,1,255); -- stone_v
INSERT INTO `mob_spell_lists` VALUES ('Mielikki',222,191,1,255); -- stonega_iii
INSERT INTO `mob_spell_lists` VALUES ('Mielikki',222,192,1,255); -- stonega_iv
INSERT INTO `mob_spell_lists` VALUES ('Mielikki',222,286,1,255); -- addle
INSERT INTO `mob_spell_lists` VALUES ('Mielikki',222,499,1,255); -- stoneja
INSERT INTO `mob_spell_lists` VALUES ('Pallid_Percy',223,158,1,255); -- aero_v
INSERT INTO `mob_spell_lists` VALUES ('Pallid_Percy',223,163,1,255); -- stone_v
INSERT INTO `mob_spell_lists` VALUES ('Pallid_Percy',223,187,1,255); -- aeroga_iv
INSERT INTO `mob_spell_lists` VALUES ('Pallid_Percy',223,192,1,255); -- stonega_iv
INSERT INTO `mob_spell_lists` VALUES ('Pallid_Percy',223,357,1,255); -- slowga
INSERT INTO `mob_spell_lists` VALUES ('Pallid_Percy',223,359,1,255); -- silencega
INSERT INTO `mob_spell_lists` VALUES ('Pallid_Percy',223,366,1,255); -- graviga
INSERT INTO `mob_spell_lists` VALUES ('Svarbhanu',224,255,1,255); -- break
INSERT INTO `mob_spell_lists` VALUES ('Svarbhanu',224,286,1,255); -- addle
INSERT INTO `mob_spell_lists` VALUES ('Svarbhanu',224,357,1,255); -- slowga
INSERT INTO `mob_spell_lists` VALUES ('Smok',225,148,1,255); -- fire_v
INSERT INTO `mob_spell_lists` VALUES ('Smok',225,177,1,255); -- firaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Smok',225,204,1,255); -- flare
INSERT INTO `mob_spell_lists` VALUES ('Smok',225,286,1,255); -- addle
INSERT INTO `mob_spell_lists` VALUES ('Titlacauan',226,177,1,255); -- firaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Titlacauan',226,182,1,255); -- blizzaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Titlacauan',226,219,1,255); -- comet
INSERT INTO `mob_spell_lists` VALUES ('Titlacauan',226,245,1,255); -- drain
INSERT INTO `mob_spell_lists` VALUES ('Titlacauan',226,356,1,255); -- paralyga
INSERT INTO `mob_spell_lists` VALUES ('Titlacauan',226,360,1,255); -- dispelga
INSERT INTO `mob_spell_lists` VALUES ('Titlacauan',226,367,1,255); -- death
INSERT INTO `mob_spell_lists` VALUES ('Tunga_mode1',227,191,1,255); -- stonega_iii
INSERT INTO `mob_spell_lists` VALUES ('Tunga_mode1',227,255,1,255); -- break
INSERT INTO `mob_spell_lists` VALUES ('Tunga_mode1',227,357,1,255); -- slowga
INSERT INTO `mob_spell_lists` VALUES ('Tunga_mode1',227,360,1,255); -- dispelga
INSERT INTO `mob_spell_lists` VALUES ('Tunga_mode1',227,365,1,255); -- breakga
INSERT INTO `mob_spell_lists` VALUES ('Tunga_mode2',228,163,1,255); -- stone_v
INSERT INTO `mob_spell_lists` VALUES ('Tunga_mode2',228,192,1,255); -- stonega_iv
INSERT INTO `mob_spell_lists` VALUES ('Tunga_mode2',228,255,1,255); -- break
INSERT INTO `mob_spell_lists` VALUES ('Tunga_mode2',228,365,1,255); -- breakga
INSERT INTO `mob_spell_lists` VALUES ('Ulhuadshi',229,192,1,255); -- stonega_iv
INSERT INTO `mob_spell_lists` VALUES ('Ulhuadshi',229,357,1,255); -- slowga
INSERT INTO `mob_spell_lists` VALUES ('Ulhuadshi',229,499,1,255); -- stoneja
INSERT INTO `mob_spell_lists` VALUES ('Abyssic_Cluster',230, 148, 1, 255); -- fire_v
INSERT INTO `mob_spell_lists` VALUES ('Abyssic_Cluster',230, 177, 1, 255); -- firaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Abyssic_Cluster',230, 205, 1, 255); -- flare_ii
INSERT INTO `mob_spell_lists` VALUES ('Abyssic_Cluster',230, 249, 1, 255); -- blaze_spikes
INSERT INTO `mob_spell_lists` VALUES ('Amhuluk', 231, 187, 1, 255); -- aeroga_iv
INSERT INTO `mob_spell_lists` VALUES ('Amhuluk', 231, 208, 1, 255); -- tornado
INSERT INTO `mob_spell_lists` VALUES ('Amhuluk', 231, 245, 1, 255); -- drain
INSERT INTO `mob_spell_lists` VALUES ('Amhuluk', 231, 359, 1, 255); -- silencga
INSERT INTO `mob_spell_lists` VALUES ('Amhuluk', 231, 366, 1, 255); -- graviga
INSERT INTO `mob_spell_lists` VALUES ('Athamas', 232, 286, 1, 255); -- addle
INSERT INTO `mob_spell_lists` VALUES ('Athamas', 232, 359, 1, 255); -- silencega
INSERT INTO `mob_spell_lists` VALUES ('Athamas', 232, 366, 1, 255); -- graviga
INSERT INTO `mob_spell_lists` VALUES ('Heqet', 233, 56, 1, 255); -- slow
INSERT INTO `mob_spell_lists` VALUES ('Heqet', 233, 199, 1, 255); -- waterga
INSERT INTO `mob_spell_lists` VALUES ('Heqet', 233, 200, 1, 255); -- waterga_ii
INSERT INTO `mob_spell_lists` VALUES ('Heqet', 233, 202, 1, 255); -- waterga_iv
INSERT INTO `mob_spell_lists` VALUES ('Heqet', 233, 286, 1, 255); -- addle
INSERT INTO `mob_spell_lists` VALUES ('Heqet', 233, 357, 1, 255); -- slowga
INSERT INTO `mob_spell_lists` VALUES ('Heqet', 233, 501, 1, 255); -- waterja
INSERT INTO `mob_spell_lists` VALUES ('Karkatakam', 234, 200, 1, 255); -- waterga_ii
INSERT INTO `mob_spell_lists` VALUES ('Karkatakam', 234, 214, 1, 255); -- flood
INSERT INTO `mob_spell_lists` VALUES ('Sobek',235, 182, 1, 255); -- blizzaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Sobek',235, 274, 1, 255); -- sleepga_ii
INSERT INTO `mob_spell_lists` VALUES ('Sobek',235, 356, 1, 255); -- paralyga
INSERT INTO `mob_spell_lists` VALUES ('Sobek',235, 360, 1, 255); -- dispelga
INSERT INTO `mob_spell_lists` VALUES ('Sobek',235, 362, 1, 255); -- bindga
INSERT INTO `mob_spell_lists` VALUES ('Itzpapalotl',236,177,1,255); -- firaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Likho',237,175,1,255); -- firaga_ii
INSERT INTO `mob_spell_lists` VALUES ('Hoar-knuckled_Rimberry',238,324,1,255); -- hyoton_ni
INSERT INTO `mob_spell_lists` VALUES ('Hoar-knuckled_Rimberry',238,342,1,255); -- jubaku_ni
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_85',239,154,1,255); -- aero
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_85',239,184,1,255); -- aeroga
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_85',239,232,1,255); -- bio_iii
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_85',239,274,1,255); -- sleepga_ii
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_85',239,252,1,255); -- stun
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_70',240,155,1,255); -- aero_ii
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_70',240,184,1,255); -- aeroga
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_70',240,232,1,255); -- bio_iii
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_70',240,274,1,255); -- sleepga_ii
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_70',240,252,1,255); -- stun
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_55',241,156,1,255); -- aero_iii
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_55',241,185,1,255); -- aeroga_ii
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_55',241,232,1,255); -- bio_iii
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_55',241,274,1,255); -- sleepga_ii
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_55',241,252,1,255); -- stun
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_40',242,157,1,255); -- aero_iv
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_40',242,185,1,255); -- aeroga_ii
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_40',242,232,1,255); -- bio_iii
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_40',242,274,1,255); -- sleepga_ii
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_40',242,252,1,255); -- stun
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_25',243,208,1,255); -- tornado
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_25',243,186,1,255); -- aeroga_iii
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_25',243,232,1,255); -- bio_iii
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_25',243,274,1,255); -- sleepga_ii
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_25',243,252,1,255); -- stun
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_0',244,209,1,255); -- tornado_ii
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_0',244,186,1,255); -- aeroga_iii
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_0',244,232,1,255); -- bio_iii
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_0',244,274,1,255); -- sleepga_ii
INSERT INTO `mob_spell_lists` VALUES ('Dee_Zelko_0',244,252,1,255); -- stun
INSERT INTO `mob_spell_lists` VALUES ('Bukhis',245,153,1,255); -- blizzard_v
INSERT INTO `mob_spell_lists` VALUES ('Bukhis',245,182,1,255); -- blizzaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Bukhis',245,356,1,255); -- paralyga
INSERT INTO `mob_spell_lists` VALUES ('Bukhis',245,362,1,255); -- bindga
INSERT INTO `mob_spell_lists` VALUES ('Chhir_Batti',246,53,1,255); -- blink
INSERT INTO `mob_spell_lists` VALUES ('Chhir_Batti',246,54,1,255); -- stoneskin
INSERT INTO `mob_spell_lists` VALUES ('Chhir_Batti',246,57,1,255); -- haste
INSERT INTO `mob_spell_lists` VALUES ('Chhir_Batti',246,118,1,255); -- voidstorm
INSERT INTO `mob_spell_lists` VALUES ('Chhir_Batti',246,356,1,255); -- paralyaga
INSERT INTO `mob_spell_lists` VALUES ('Chhir_Batti',246,357,1,255); -- slowga
INSERT INTO `mob_spell_lists` VALUES ('Chhir_Batti',246,359,1,255); -- silencega
INSERT INTO `mob_spell_lists` VALUES ('Chhir_Batti',246,362,1,255); -- bindga
INSERT INTO `mob_spell_lists` VALUES ('Durinn',247,177,1,255); -- firaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Durinn',247,182,1,255); -- blizzaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Durinn',247,187,1,255); -- aeroaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Durinn',247,192,1,255); -- stonega_iv
INSERT INTO `mob_spell_lists` VALUES ('Durinn',247,197,1,255); -- thundaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Durinn',247,202,1,255); -- waterga_iv
INSERT INTO `mob_spell_lists` VALUES ('Durinn',247,204,1,255); -- flare
INSERT INTO `mob_spell_lists` VALUES ('Durinn',247,206,1,255); -- freeze
INSERT INTO `mob_spell_lists` VALUES ('Durinn',247,208,1,255); -- tornado
INSERT INTO `mob_spell_lists` VALUES ('Durinn',247,210,1,255); -- quake
INSERT INTO `mob_spell_lists` VALUES ('Durinn',247,212,1,255); -- burst
INSERT INTO `mob_spell_lists` VALUES ('Durinn',247,214,1,255); -- flood
INSERT INTO `mob_spell_lists` VALUES ('Durinn',247,356,1,255); -- paralyga
INSERT INTO `mob_spell_lists` VALUES ('Durinn',247,359,1,255); -- silencega
INSERT INTO `mob_spell_lists` VALUES ('Dvalinn',248,176,1,255); -- firaga_iii
INSERT INTO `mob_spell_lists` VALUES ('Dvalinn',248,181,1,255); -- blizzaga_iii
INSERT INTO `mob_spell_lists` VALUES ('Dvalinn',248,186,1,255); -- aeroaga_iii
INSERT INTO `mob_spell_lists` VALUES ('Dvalinn',248,191,1,255); -- stonmega_iii
INSERT INTO `mob_spell_lists` VALUES ('Dvalinn',248,196,1,255); -- thundaga_iii
INSERT INTO `mob_spell_lists` VALUES ('Dvalinn',248,201,1,255); -- waterga_iii
INSERT INTO `mob_spell_lists` VALUES ('Dvalinn',248,356,1,255); -- paralyga
INSERT INTO `mob_spell_lists` VALUES ('Dvalinn',248,357,1,255); -- slowga
INSERT INTO `mob_spell_lists` VALUES ('Dvalinn',248,359,1,255); -- silencega
INSERT INTO `mob_spell_lists` VALUES ('Dvalinn',248,362,1,255); -- bindga
INSERT INTO `mob_spell_lists` VALUES ('Dvalinn',248,366,1,255); -- graviga
INSERT INTO `mob_spell_lists` VALUES ('Hanuman',249,186,1,255); -- aeroga_iii
INSERT INTO `mob_spell_lists` VALUES ('Hanuman',249,274,1,255); -- sleepga_ii
INSERT INTO `mob_spell_lists` VALUES ('Hanuman',249,359,1,255); -- silencega
INSERT INTO `mob_spell_lists` VALUES ('Hanuman',249,366,1,255); -- graviga
INSERT INTO `mob_spell_lists` VALUES ('Hrosshvalur',250,501,1,255); -- waterja
INSERT INTO `mob_spell_lists` VALUES ('Iku-Turso',251,173,1,255); -- water_v
INSERT INTO `mob_spell_lists` VALUES ('Iku-Turso',251,202,1,255); -- waterga_iv
INSERT INTO `mob_spell_lists` VALUES ('Iku-Turso',251,501,1,255); -- waterja
INSERT INTO `mob_spell_lists` VALUES ('Kadraeth_the_Hatespawn',252,197,1,255); -- thundaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Kadraeth_the_Hatespawn',252,252,1,255); -- stun
INSERT INTO `mob_spell_lists` VALUES ('Lord_Varney',253,53,1,255); -- blink
INSERT INTO `mob_spell_lists` VALUES ('Lord_Varney',253,57,1,255); -- haste
INSERT INTO `mob_spell_lists` VALUES ('Lord_Varney',253,157,1,255); -- aero_iv
INSERT INTO `mob_spell_lists` VALUES ('Lord_Varney',253,158,1,255); -- aero_v
INSERT INTO `mob_spell_lists` VALUES ('Lord_Varney',253,187,1,255); -- aeroga_iv
INSERT INTO `mob_spell_lists` VALUES ('Lord_Varney',253,366,1,255); -- graviga
INSERT INTO `mob_spell_lists` VALUES ('Lord_Varney',253,359,1,255); -- silencega
INSERT INTO `mob_spell_lists` VALUES ('Pascerpot',254,21,1,255); -- holy
INSERT INTO `mob_spell_lists` VALUES ('Pascerpot',254,22,1,255); -- holy_ii
INSERT INTO `mob_spell_lists` VALUES ('Pascerpot',254,40,1,255); -- banishga_iii
INSERT INTO `mob_spell_lists` VALUES ('Pascerpot',254,58,1,255); -- paralyze
INSERT INTO `mob_spell_lists` VALUES ('Pascerpot',254,59,1,255); -- silence
INSERT INTO `mob_spell_lists` VALUES ('Pascerpot',254,356,1,255); -- paralyga
INSERT INTO `mob_spell_lists` VALUES ('Pascerpot',254,357,1,255); -- slowga
INSERT INTO `mob_spell_lists` VALUES ('Pascerpot',254,359,1,255); -- silencega
INSERT INTO `mob_spell_lists` VALUES ('Rakshas',255,176,1,255); -- firega_iii
INSERT INTO `mob_spell_lists` VALUES ('Rakshas',255,191,1,255); -- stonega_iii
INSERT INTO `mob_spell_lists` VALUES ('Rakshas',255,255,1,255); -- break
INSERT INTO `mob_spell_lists` VALUES ('Rakshas',255,286,1,255); -- addle
INSERT INTO `mob_spell_lists` VALUES ('Rakshas',255,357,1,255); -- slowga
INSERT INTO `mob_spell_lists` VALUES ('Sedna',256,55,1,255); -- aquaveil
INSERT INTO `mob_spell_lists` VALUES ('Sedna',256,173,1,255); -- water_v
INSERT INTO `mob_spell_lists` VALUES ('Sedna',256,202,1,255); -- waterga_iv
INSERT INTO `mob_spell_lists` VALUES ('Sedna',256,214,1,255); -- flood
INSERT INTO `mob_spell_lists` VALUES ('Sedna',256,360,1,255); -- dispelga
INSERT INTO `mob_spell_lists` VALUES ('Sedna',256,501,1,255); -- waterja
INSERT INTO `mob_spell_lists` VALUES ('Karkadann',257,197,1,255); -- thundaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Amarok',258,147,1,255); -- fire_iv
INSERT INTO `mob_spell_lists` VALUES ('Amarok',258,176,1,255); -- firega_iii
INSERT INTO `mob_spell_lists` VALUES ('Amarok',258,286,1,255); -- addle
INSERT INTO `mob_spell_lists` VALUES ('Ansherekh',259,147,1,255); -- fire_iv
INSERT INTO `mob_spell_lists` VALUES ('Ansherekh',259,286,1,255); -- addle
INSERT INTO `mob_spell_lists` VALUES ('Battlerigged_Chariot',260,147,1,255); -- fire_iv
INSERT INTO `mob_spell_lists` VALUES ('Battlerigged_Chariot',260,176,1,255); -- firega_iii
INSERT INTO `mob_spell_lists` VALUES ('Battlerigged_Chariot',260,204,1,255); -- flare
INSERT INTO `mob_spell_lists` VALUES ('Battlerigged_Chariot',260,286,1,255); -- addle
INSERT INTO `mob_spell_lists` VALUES ('Cuijatender',261,356,1,255); -- paralyga
INSERT INTO `mob_spell_lists` VALUES ('Cuijatender',261,359,1,255); -- silencega
INSERT INTO `mob_spell_lists` VALUES ('Dragua',262,54,1,255); -- stoneskin
INSERT INTO `mob_spell_lists` VALUES ('Dragua',262,163,1,255); -- stone_v
INSERT INTO `mob_spell_lists` VALUES ('Dragua',262,192,1,255); -- stonega_iv
INSERT INTO `mob_spell_lists` VALUES ('Dragua',262,357,1,255); -- slowga
INSERT INTO `mob_spell_lists` VALUES ('Dragua',262,499,1,255); -- stoneja
INSERT INTO `mob_spell_lists` VALUES ('Hedjedjet_pre_50',263,362,1,255); -- bindga
INSERT INTO `mob_spell_lists` VALUES ('Hedjedjet_post_50',264,362,1,255); -- bindga
INSERT INTO `mob_spell_lists` VALUES ('Hedjedjet_post_50',264,363,1,255); -- breakga
INSERT INTO `mob_spell_lists` VALUES ('Orthrus',265,146,1,255); -- fire_iii
INSERT INTO `mob_spell_lists` VALUES ('Orthrus',265,147,1,255); -- fire_iv
INSERT INTO `mob_spell_lists` VALUES ('Orthrus',265,148,1,255); -- fire_v
INSERT INTO `mob_spell_lists` VALUES ('Orthrus',265,176,1,255); -- firaga_iii
INSERT INTO `mob_spell_lists` VALUES ('Orthrus',265,177,1,255); -- firaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Orthrus',265,204,1,255); -- flare
INSERT INTO `mob_spell_lists` VALUES ('Orthrus',265,249,1,255); -- blaze_spikes
INSERT INTO `mob_spell_lists` VALUES ('Ouzelum',266,147,1,255); -- fire_iv
INSERT INTO `mob_spell_lists` VALUES ('Ouzelum',266,148,1,255); -- fire_v
INSERT INTO `mob_spell_lists` VALUES ('Ouzelum',266,157,1,255); -- aero_iv
INSERT INTO `mob_spell_lists` VALUES ('Ouzelum',266,158,1,255); -- aero_v
INSERT INTO `mob_spell_lists` VALUES ('Ouzelum',266,286,1,255); -- addle
INSERT INTO `mob_spell_lists` VALUES ('Ouzelum',266,359,1,255); -- silencega
INSERT INTO `mob_spell_lists` VALUES ('Sharabha_100_to_50',267,162,1,255); -- stone_iv
INSERT INTO `mob_spell_lists` VALUES ('Sharabha_100_to_50',267,191,1,255); -- stonega_iii
INSERT INTO `mob_spell_lists` VALUES ('Sharabha_50_to_25',268,163,1,255); -- stone_v
INSERT INTO `mob_spell_lists` VALUES ('Sharabha_50_to_25',268,499,1,255); -- stoneja
INSERT INTO `mob_spell_lists` VALUES ('Sharabha_below_25',269,163,1,255); -- stone_v
INSERT INTO `mob_spell_lists` VALUES ('Sharabha_below_25',269,192,1,255); -- stonega_iv
INSERT INTO `mob_spell_lists` VALUES ('Sharabha_below_25',269,499,1,255); -- stoneja
INSERT INTO `mob_spell_lists` VALUES ('Vadleany',270,158,1,255); -- aero_v
INSERT INTO `mob_spell_lists` VALUES ('Vadleany',270,187,1,255); -- aeroga_iv
INSERT INTO `mob_spell_lists` VALUES ('Vadleany',270,208,1,255); -- tornado
INSERT INTO `mob_spell_lists` VALUES ('Vadleany',270,498,1,255); -- aeroja
INSERT INTO `mob_spell_lists` VALUES ('Waugyl',271,99,1,255); -- sandstorm
INSERT INTO `mob_spell_lists` VALUES ('Waugyl',271,113,1,255); -- rainstorm
INSERT INTO `mob_spell_lists` VALUES ('Waugyl',271,114,1,255); -- windstorm
INSERT INTO `mob_spell_lists` VALUES ('Waugyl',271,115,1,255); -- firestorm
INSERT INTO `mob_spell_lists` VALUES ('Waugyl',271,116,1,255); -- hailstorm
INSERT INTO `mob_spell_lists` VALUES ('Waugyl',271,117,1,255); -- thunderstorm
INSERT INTO `mob_spell_lists` VALUES ('Waugyl',271,118,1,255); -- voidstorm
INSERT INTO `mob_spell_lists` VALUES ('Waugyl',271,119,1,255); -- aurorastorm
INSERT INTO `mob_spell_lists` VALUES ('Anemic_Aloysius',272,163,1,255); -- stone_v
INSERT INTO `mob_spell_lists` VALUES ('Anemic_Aloysius',272,190,1,255); -- stonega_ii
INSERT INTO `mob_spell_lists` VALUES ('Anemic_Aloysius',272,191,1,255); -- stonega_iii
INSERT INTO `mob_spell_lists` VALUES ('Anemic_Aloysius',272,192,1,255); -- stonega_iv
INSERT INTO `mob_spell_lists` VALUES ('Anemic_Aloysius',272,357,1,255); -- slowga
INSERT INTO `mob_spell_lists` VALUES ('Anemic_Aloysius',272,499,1,255); -- stoneja
INSERT INTO `mob_spell_lists` VALUES ('Apademak',273,167,1,255); -- thunder_iv
INSERT INTO `mob_spell_lists` VALUES ('Apademak',273,168,1,255); -- thunder_v
INSERT INTO `mob_spell_lists` VALUES ('Apademak',273,196,1,255); -- thundaga_iii
INSERT INTO `mob_spell_lists` VALUES ('Apademak',273,197,1,255); -- thundaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Empousa',274,245,1,255); -- drain
INSERT INTO `mob_spell_lists` VALUES ('Empousa',274,277,1,255); -- dread_spikes
INSERT INTO `mob_spell_lists` VALUES ('Empousa',274,360,1,255); -- dispelga
INSERT INTO `mob_spell_lists` VALUES ('Isgebind',275,152,1,255); -- blizzard_iv
INSERT INTO `mob_spell_lists` VALUES ('Isgebind',275,153,1,255); -- blizzard_v
INSERT INTO `mob_spell_lists` VALUES ('Isgebind',275,181,1,255); -- blizzaga_iii
INSERT INTO `mob_spell_lists` VALUES ('Isgebind',275,182,1,255); -- blizzaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_100_to_25',276,148,1,255); -- fire_v
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_100_to_25',276,153,1,255); -- blizzard_v
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_100_to_25',276,158,1,255); -- aero_v
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_100_to_25',276,163,1,255); -- stone_v
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_100_to_25',276,168,1,255); -- thunder_v
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_100_to_25',276,173,1,255); -- water_v
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_100_to_25',276,176,1,255); -- firaga_iii
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_100_to_25',276,181,1,255); -- blizzaga_iii
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_100_to_25',276,186,1,255); -- aeroga_iii
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_100_to_25',276,191,1,255); -- stonega_iii
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_100_to_25',276,196,1,255); -- thundaga_iii
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_100_to_25',276,201,1,255); -- waterga_iii
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_100_to_25',276,357,1,255); -- slowga
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_100_to_25',276,359,1,255); -- silencega
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_100_to_25',276,366,1,255); -- graviga
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_below_25',277,148,1,255); -- fire_v
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_below_25',277,153,1,255); -- blizzard_v
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_below_25',277,158,1,255); -- aero_v
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_below_25',277,163,1,255); -- stone_v
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_below_25',277,168,1,255); -- thunder_v
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_below_25',277,173,1,255); -- water_v
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_below_25',277,177,1,255); -- firaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_below_25',277,182,1,255); -- blizzaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_below_25',277,187,1,255); -- aeroga_iv
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_below_25',277,192,1,255); -- stonega_iv
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_below_25',277,197,1,255); -- thundaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_below_25',277,202,1,255); -- waterga_iv
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_below_25',277,357,1,255); -- slowga
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_below_25',277,359,1,255); -- silencega
INSERT INTO `mob_spell_lists` VALUES ('Pantokrator_below_25',277,366,1,255); -- graviga
INSERT INTO `mob_spell_lists` VALUES ('Upas-Kamuy',278,152,1,255); -- blizzard_iv
INSERT INTO `mob_spell_lists` VALUES ('Upas-Kamuy',278,153,1,255); -- blizzard_v
INSERT INTO `mob_spell_lists` VALUES ('Upas-Kamuy',278,206,1,255); -- freeze
INSERT INTO `mob_spell_lists` VALUES ('Upas-Kamuy',278,207,1,255); -- freeze_ii
INSERT INTO `mob_spell_lists` VALUES ('Veri_Selen',279,157,1,255); -- aero_iv
INSERT INTO `mob_spell_lists` VALUES ('Veri_Selen',279,158,1,255); -- aero_v
INSERT INTO `mob_spell_lists` VALUES ('Veri_Selen',279,185,1,255); -- aeroga_ii
INSERT INTO `mob_spell_lists` VALUES ('Veri_Selen',279,186,1,255); -- aeroga_iii
INSERT INTO `mob_spell_lists` VALUES ('Veri_Selen',279,359,1,255); -- silencega
INSERT INTO `mob_spell_lists` VALUES ('Amphitrite',280,176,1,255); -- firaga_iii
INSERT INTO `mob_spell_lists` VALUES ('Amphitrite',280,191,1,255); -- stonega_iii
INSERT INTO `mob_spell_lists` VALUES ('Amphitrite',280,201,1,255); -- waterga_iii
INSERT INTO `mob_spell_lists` VALUES ('Assailer_Chariot',281,167,1,255); -- thunder_iv
INSERT INTO `mob_spell_lists` VALUES ('Assailer_Chariot',281,196,1,255); -- thundaga_iii
INSERT INTO `mob_spell_lists` VALUES ('Assailer_Chariot',281,239,1,255); -- shock
INSERT INTO `mob_spell_lists` VALUES ('Azdaja',282,177,1,255); -- firaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Azdaja',282,182,1,255); -- blizzaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Azdaja',282,187,1,255); -- aeroga_iv
INSERT INTO `mob_spell_lists` VALUES ('Azdaja',282,192,1,255); -- stonega_iv
INSERT INTO `mob_spell_lists` VALUES ('Azdaja',282,197,1,255); -- thundaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Azdaja',282,252,1,255); -- stun
INSERT INTO `mob_spell_lists` VALUES ('Azdaja',282,260,1,255); -- dispel
INSERT INTO `mob_spell_lists` VALUES ('Azdaja',282,274,1,255); -- sleepga_ii
INSERT INTO `mob_spell_lists` VALUES ('Azdaja',282,286,1,255); -- addle
INSERT INTO `mob_spell_lists` VALUES ('Azdaja',282,359,1,255); -- silencega
INSERT INTO `mob_spell_lists` VALUES ('Azdaja',282,362,1,255); -- bindga
INSERT INTO `mob_spell_lists` VALUES ('Azdaja',282,365,1,255); -- breakga
INSERT INTO `mob_spell_lists` VALUES ('Azdaja',282,366,1,255); -- graviga
INSERT INTO `mob_spell_lists` VALUES ('Aby_Grauberg_Goblin_NM',283,148,1,255); -- fire_v
INSERT INTO `mob_spell_lists` VALUES ('Aby_Grauberg_Goblin_NM',283,177,1,255); -- firaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Aby_Grauberg_Goblin_NM',283,496,1,255); -- firaja
-- Bomblix_Flamefinger, Burstrox_Powderpate NM both use Spell ID 283
INSERT INTO `mob_spell_lists` VALUES ('Fleshflayer_Killakriq',284,176,1,255); -- firaga_iii
INSERT INTO `mob_spell_lists` VALUES ('Fleshflayer_Killakriq',284,235,1,255); -- burn
INSERT INTO `mob_spell_lists` VALUES ('Fleshflayer_Killakriq',284,286,1,255); -- addle
INSERT INTO `mob_spell_lists` VALUES ('Fuath',285,176,1,255); -- firaga_iiii
INSERT INTO `mob_spell_lists` VALUES ('Fuath',285,181,1,255); -- blizzaga_iii
INSERT INTO `mob_spell_lists` VALUES ('Fuath',285,186,1,255); -- aeroga_iii
INSERT INTO `mob_spell_lists` VALUES ('Fuath',285,191,1,255); -- stonega_iii
INSERT INTO `mob_spell_lists` VALUES ('Fuath',285,196,1,255); -- thundaga_iii
INSERT INTO `mob_spell_lists` VALUES ('Fuath',285,201,1,255); -- waterga_iii
INSERT INTO `mob_spell_lists` VALUES ('Fuath',285,245,1,255); -- drain
INSERT INTO `mob_spell_lists` VALUES ('Fuath',285,247,1,255); -- aspir
INSERT INTO `mob_spell_lists` VALUES ('Ika-Roa',286,200,1,255); -- waterga_ii
INSERT INTO `mob_spell_lists` VALUES ('Ika-Roa',286,201,1,255); -- waterga_iii
INSERT INTO `mob_spell_lists` VALUES ('Ika-Roa',286,202,1,255); -- waterga_iv
INSERT INTO `mob_spell_lists` VALUES ('Ika-Roa',286,501,1,255); -- waterja
INSERT INTO `mob_spell_lists` VALUES ('Lorelei',287,35,1,255); -- diaga_iii
INSERT INTO `mob_spell_lists` VALUES ('Lorelei',287,158,1,255); -- aero_v
INSERT INTO `mob_spell_lists` VALUES ('Lorelei',287,187,1,255); -- aeroga_iv
INSERT INTO `mob_spell_lists` VALUES ('Lorelei',287,356,1,255); -- paralyga
INSERT INTO `mob_spell_lists` VALUES ('Lorelei',287,357,1,255); -- slowga
INSERT INTO `mob_spell_lists` VALUES ('Lorelei',287,359,1,255); -- silencega
INSERT INTO `mob_spell_lists` VALUES ('Lorelei',287,498,1,255); -- aeroja
INSERT INTO `mob_spell_lists` VALUES ('Minaruja',288,158,1,255); -- aero_v
INSERT INTO `mob_spell_lists` VALUES ('Minaruja',288,187,1,255); -- aeroga_iv
INSERT INTO `mob_spell_lists` VALUES ('Minaruja',288,357,1,255); -- slowga
INSERT INTO `mob_spell_lists` VALUES ('Minaruja',288,359,1,255); -- silencega
INSERT INTO `mob_spell_lists` VALUES ('Rencounter_Chariot',289,177,1,255); -- firaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Rencounter_Chariot',289,197,1,255); -- thundaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Rencounter_Chariot',289,235,1,255); -- burn
INSERT INTO `mob_spell_lists` VALUES ('Rencounter_Chariot',289,239,1,255); -- shock
INSERT INTO `mob_spell_lists` VALUES ('Rencounter_Chariot',289,270,1,255); -- absorb-int
INSERT INTO `mob_spell_lists` VALUES ('Rencounter_Chariot',289,271,1,255); -- absorb-mnd
INSERT INTO `mob_spell_lists` VALUES ('Teekesselchen',290,177,1,255); -- firaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Teekesselchen',290,182,1,255); -- blizzaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Teekesselchen',290,187,1,255); -- aeroga_iv
INSERT INTO `mob_spell_lists` VALUES ('Teekesselchen',290,192,1,255); -- stonega_iv
INSERT INTO `mob_spell_lists` VALUES ('Teekesselchen',290,197,1,255); -- thundaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Teekesselchen',290,202,1,255); -- waterga_iv
INSERT INTO `mob_spell_lists` VALUES ('Teekesselchen',290,274,1,255); -- sleepga_ii
INSERT INTO `mob_spell_lists` VALUES ('Teekesselchen',290,357,1,255); -- slowga
INSERT INTO `mob_spell_lists` VALUES ('Teekesselchen',290,359,1,255); -- silencega
INSERT INTO `mob_spell_lists` VALUES ('Teekesselchen',290,365,1,255); -- breakga
INSERT INTO `mob_spell_lists` VALUES ('Teugghia',291,177,1,255); -- firaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Teugghia',291,182,1,255); -- blizzaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Teugghia',291,187,1,255); -- aeroga_iv
INSERT INTO `mob_spell_lists` VALUES ('Teugghia',291,192,1,255); -- stonega_iv
INSERT INTO `mob_spell_lists` VALUES ('Teugghia',291,197,1,255); -- thundaga_iv
INSERT INTO `mob_spell_lists` VALUES ('Teugghia',291,202,1,255); -- waterga_iv
INSERT INTO `mob_spell_lists` VALUES ('Teugghia',291,274,1,255); -- sleepga_ii
INSERT INTO `mob_spell_lists` VALUES ('Teugghia',291,286,1,255); -- addle
INSERT INTO `mob_spell_lists` VALUES ('Teugghia',291,356,1,255); -- paralyga
INSERT INTO `mob_spell_lists` VALUES ('Teugghia',291,362,1,255); -- bindga
INSERT INTO `mob_spell_lists` VALUES ('Teugghia',291,366,1,255); -- graviga
INSERT INTO `mob_spell_lists` VALUES ('Xibalba',292,158,1,255); -- aero_v
INSERT INTO `mob_spell_lists` VALUES ('Xibalba',292,185,1,255); -- aeroga_iii
INSERT INTO `mob_spell_lists` VALUES ('Xibalba',292,186,1,255); -- aeroga_iv
INSERT INTO `mob_spell_lists` VALUES ('Xibalba',292,252,1,255); -- stun -- should actually be AOE
INSERT INTO `mob_spell_lists` VALUES ('Xibalba',292,273,1,255); -- sleepga
INSERT INTO `mob_spell_lists` VALUES ('Xibalba',292,359,1,255); -- silenga
INSERT INTO `mob_spell_lists` VALUES ('Xibalba',292,361,1,255); -- blindga
INSERT INTO `mob_spell_lists` VALUES ('Xibalba',292,366,1,255); -- graviga
INSERT INTO `mob_spell_lists` VALUES ('Xibalba',292,367,1,255); -- death
INSERT INTO `mob_spell_lists` VALUES ('Xibalba',292,498,1,255); -- aeroja
INSERT INTO `mob_spell_lists` VALUES ('Nosferatu',293,252,1,255); -- Stun
INSERT INTO `mob_spell_lists` VALUES ('Nosferatu',293,277,1,255); -- Dread Spikes
INSERT INTO `mob_spell_lists` VALUES ('Nosferatu',293,245,1,255); -- Drain
INSERT INTO `mob_spell_lists` VALUES ('Nosferatu',293,246,1,255); -- Drain II
INSERT INTO `mob_spell_lists` VALUES ('Nosferatu',293,275,1,255); -- Absorb-TP
INSERT INTO `mob_spell_lists` VALUES ('Nosferatu',293,242,1,255); -- Absorb-ACC
INSERT INTO `mob_spell_lists` VALUES ('Honor',294,356,1,255); -- paralyga
INSERT INTO `mob_spell_lists` VALUES ('Honor',294,359,1,255); -- silencega
INSERT INTO `mob_spell_lists` VALUES ('Bomb_Queen',295,147,73,85); -- Fire IV
INSERT INTO `mob_spell_lists` VALUES ('Bomb_Queen',295,204,60,255); -- Flare
INSERT INTO `mob_spell_lists` VALUES ('Bomb_Queen',295,235,24,255); -- Burn
INSERT INTO `mob_spell_lists` VALUES ('Bomb_Queen',295,176,69,255); -- Firaga III
INSERT INTO `mob_spell_lists` VALUES ('Bomb_Queen',295,100,24,255); -- Enfire
INSERT INTO `mob_spell_lists` VALUES ('Bomb_Queen',295,249,10,255); -- Blaze Spikes
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_BLM',296,147,1,255); -- Fire 4
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_BLM',296,152,1,255); -- Blizzard 4
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_BLM',296,157,1,255); -- Aero 4
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_BLM',296,162,1,255); -- Stone 4
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_BLM',296,167,1,255); -- Thunder 4
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_BLM',296,172,1,255); -- Water 4
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_BLM',296,176,1,255); -- Firaga 3
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_BLM',296,181,1,255); -- Blizzaga 3
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_BLM',296,186,1,255); -- Aeroga 3
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_BLM',296,191,1,255); -- Stonega 3
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_BLM',296,196,1,255); -- Thundaga 3
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_BLM',296,201,1,255); -- Waterga 3
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_BLM',296,251,1,255); -- Shock Spikes
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_BLM',296,273,1,255); -- Sleepga
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_BLM',296,274,1,255); -- Sleepga II
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_WHM',297,5,1,255);   -- Cure V
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_WHM',297,10,1,255);  -- Curaga IV
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_WHM',297,14,1,255);  -- Poisona
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_WHM',297,15,1,255);  -- Paralyna
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_WHM',297,16,1,255);  -- Blindna
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_WHM',297,17,1,255);  -- Silena
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_WHM',297,18,1,255);  -- Stona
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_WHM',297,19,1,255);  -- Viruna
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_WHM',297,20,1,255);  -- Cursna
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_WHM',297,21,1,255);  -- Holy
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_WHM',297,40,1,255);  -- Banishga III
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_WHM',297,46,1,255);  -- Protect IV
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_WHM',297,51,1,255);  -- Shell IV
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_WHM',297,55,1,255);  -- Aquaveil
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_WHM',297,57,1,255);  -- Haste
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_WHM',297,59,1,255);  -- Silence
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_WHM',297,61,1,255);  -- Barblizzard
INSERT INTO `mob_spell_lists` VALUES ('Gotoh_Zha_the_Redolent_WHM',297,112,1,255); -- Flash
INSERT INTO `mob_spell_lists` VALUES ('Drumskull_Zogdregg',298,191,1,255); -- stonega_iii
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,513,42,255); -- Venom Shell
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,517,61,255); -- Maelsotrm
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,519,26,255); -- Screwdriver
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,521,42,255); -- MP Drainkiss
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,522,34,255); -- Death Ray
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,524,1,255); -- Sandspin
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,527,34,255); -- Smaite of Rage
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,529,18,255); -- Bludgeon
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,530,48,255); -- Refueling
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,531,50,255); -- Ice Break
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,532,44,255); -- Blitzstrahl
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,533,50,255); -- self Destruct
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,534,40,255); -- Mysterious Light
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,535,52,255); -- Cold Wave
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,536,22,255); -- Poison Breath
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,537,44,255); -- Stinking Gas
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,538,62,255); -- Memento Mori
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,539,40,255); -- Terror Touch
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,540,63,255); -- Spinal Cleave
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,541,48,255); -- Blood Saber
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,542,36,255); -- Digest
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,543,44,255); -- Mandibular Bite
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,544,18,255); -- Cursed Sphere
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,545,48,255); -- Sickel Slash
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,547,8,255); -- Cocoon
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,548,52,255); -- Filamented Hold
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,549,1,29); -- Pollen
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,551,4,255); -- Power Attack
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,554,60,255); -- Death Scissors
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,555,46,255); -- Magnetite Cloud
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,557,61,255); -- Eyes on Me
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,560,63,255); -- Frenetoc Rip
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,561,50,255); -- Frightfull Roar
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,563,54,255); -- Hecatomb Wave
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,564,62,255); -- Body Slam
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,565,54,255); -- Radient Breath
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,567,16,255); -- Helldive
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,569,38,255); -- Jet Stream
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,570,20,255); -- Blood Drain
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,572,32,255); -- Sound Blast
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,573,64,255); -- Feather Tickle
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,574,56,255); -- feather Barrier
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,575,48,255); -- Jettatura
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,576,64,255); -- Yawn
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,577,1,255); -- Foot Kick
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,578,30,57); -- Wild Carrot
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,579,64,255); -- V. Trunk
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,581,16,255); -- Healing Breeze
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,582,32,255); -- Chaotic Eye
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,584,16,255); -- Sheep Song
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,585,73,255); -- Ram Charge
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,587,20,255); -- Claw Cyclone
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,588,71,255); -- Lowing
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,589,60,255); -- Dimensional Death
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,591,71,255); -- Heat Breath
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,592,38,255); -- Blank Gaze
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,593,58,255); -- Magic Fruit
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,594,38,255); -- UpperCut
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,595,62,255); -- 1000 Needles
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,596,36,255); -- Pinecone Bomb
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,597,4,255); -- Sprout Smack
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,598,24,255); -- Soporific
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,599,8,255); -- Queasyshroom
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,603,4,255); -- Wild Oats
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,604,61,255); -- Bad Breath
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,605,46,255); -- Giest Wall
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,606,46,255); -- Awful Eye
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,610,65,255); -- Infransonics
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,611,72,255); -- disseverment
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,612,74,255); -- actinic Burst
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,613,74,255); -- Reactor Cool
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,614,72,255); -- Saline Coat
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,615,75,255); -- Plasma Charge
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,616,73,255); -- Temporal Shift
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,617,75,255); -- Vertical Cleave
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,618,18,255); -- BlastBomb
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,620,12,255); -- Battle Dance
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,621,66,255); -- Sandspray
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,622,30,255); -- Grand Slam
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,623,12,255); -- Head Butt
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,626,28,255); -- Bomb Toss
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,628,63,255); -- Frypan
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,629,58,255); -- Flying Hip Press
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,631,63,255); -- Hydro Shot
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,632,67,255); -- Diamondhide
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,633,67,255); -- enervation
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,634,58,255); -- Light of Penace
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,636,68,255); -- Warm-up
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,637,68,255); -- Firespit
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,638,12,255); -- featherstorm
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,640,69,255); -- Tail Slap
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,641,69,255); -- Hysteric Barrage
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,642,70,255); -- Amplification
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,643,70,255); -- Cannonball
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,644,73,255); -- MindBlast
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,645,75,255); -- Exuvation
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,646,74,255); -- Magic Hammer
INSERT INTO `mob_spell_lists` VALUES ('Humanoid_BLU',299,647,65,255); -- Zephyr Mantle
INSERT INTO `mob_spell_lists` VALUES ('Velionis',300,146,1,255); -- Fire 3
INSERT INTO `mob_spell_lists` VALUES ('Velionis',300,151,1,255); -- Blizzard 3
INSERT INTO `mob_spell_lists` VALUES ('Velionis',300,156,1,255); -- Aero 3
INSERT INTO `mob_spell_lists` VALUES ('Velionis',300,161,1,255); -- Stone 3
INSERT INTO `mob_spell_lists` VALUES ('Velionis',300,166,1,255); -- Thunder 3
INSERT INTO `mob_spell_lists` VALUES ('Velionis',300,171,1,255); -- Water 3
INSERT INTO `mob_spell_lists` VALUES ('Velionis',300,175,1,255); -- Firaga 2
INSERT INTO `mob_spell_lists` VALUES ('Velionis',300,180,1,255); -- Blizzaga 2
INSERT INTO `mob_spell_lists` VALUES ('Velionis',300,185,1,255); -- Aeraga 2
INSERT INTO `mob_spell_lists` VALUES ('Velionis',300,190,1,255); -- Stonaga 2
INSERT INTO `mob_spell_lists` VALUES ('Velionis',300,195,1,255); -- Thundaga 2
INSERT INTO `mob_spell_lists` VALUES ('Velionis',300,200,1,255); -- Waterga 2
INSERT INTO `mob_spell_lists` VALUES ('Marquis_Forneus',301,242,1,255); -- absorb-acc
INSERT INTO `mob_spell_lists` VALUES ('Marquis_Forneus',301,245,1,255); -- drain
INSERT INTO `mob_spell_lists` VALUES ('Marquis_Forneus',301,247,1,255); -- aspir
INSERT INTO `mob_spell_lists` VALUES ('Marquis_Forneus',301,252,1,255); -- stun
INSERT INTO `mob_spell_lists` VALUES ('Marquis_Forneus',301,266,1,255); -- absorb-str
INSERT INTO `mob_spell_lists` VALUES ('Marquis_Forneus',301,267,1,255); -- absorb-dex
INSERT INTO `mob_spell_lists` VALUES ('Marquis_Forneus',301,268,1,255); -- absorb-vit
INSERT INTO `mob_spell_lists` VALUES ('Marquis_Forneus',301,269,1,255); -- absorb-agi
INSERT INTO `mob_spell_lists` VALUES ('Marquis_Forneus',301,270,1,255); -- absorb-int
INSERT INTO `mob_spell_lists` VALUES ('Marquis_Forneus',301,271,1,255); -- absorb-mnd
INSERT INTO `mob_spell_lists` VALUES ('Marquis_Forneus',301,272,1,255); -- absorb-chr
INSERT INTO `mob_spell_lists` VALUES ('Marquis_Forneus',301,275,1,255); -- absorb-tp
INSERT INTO `mob_spell_lists` VALUES ('Marquis_Forneus',301,277,1,255); -- dread_spikes
INSERT INTO `mob_spell_lists` VALUES ('Chamrosh',302,157,1,255); -- aero 4
INSERT INTO `mob_spell_lists` VALUES ('Chamrosh',302,185,1,255); -- aeroaga_ii
INSERT INTO `mob_spell_lists` VALUES ('Chamrosh',302,186,1,255); -- aeroaga_iii
INSERT INTO `mob_spell_lists` VALUES ('Chamrosh',302,208,1,255); -- tornado
INSERT INTO `mob_spell_lists` VALUES ('Chamrosh',302,359,1,255); -- silencega
INSERT INTO `mob_spell_lists` VALUES ('Lizardtrap',303,152,1,255); -- blizzard_iv
INSERT INTO `mob_spell_lists` VALUES ('Lizardtrap',303,181,1,255); -- blizzaga_iii
INSERT INTO `mob_spell_lists` VALUES ('Lizardtrap',303,356,1,255); -- paralyga

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
