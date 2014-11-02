-- MySQL dump 10.13  Distrib 5.6.15, for Win64 (x86_64)
--
-- Host: localhost    Database: dspdb
-- ------------------------------------------------------
-- Server version	5.6.15

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
-- Table structure for table `instance_entities`
--

DROP TABLE IF EXISTS `instance_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_entities` (
  `instanceid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`instanceid`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_entities`
--

LOCK TABLES `instance_entities` WRITE;
/*!40000 ALTER TABLE `instance_entities` DISABLE KEYS */;
-- Leujaoam Cleansing
-- Mobs
INSERT INTO `instance_entities` VALUES (1,17059841);
INSERT INTO `instance_entities` VALUES (1,17059842);
INSERT INTO `instance_entities` VALUES (1,17059843);
INSERT INTO `instance_entities` VALUES (1,17059844);
INSERT INTO `instance_entities` VALUES (1,17059845);
INSERT INTO `instance_entities` VALUES (1,17059846);
INSERT INTO `instance_entities` VALUES (1,17059847);
INSERT INTO `instance_entities` VALUES (1,17059848);
INSERT INTO `instance_entities` VALUES (1,17059849);
INSERT INTO `instance_entities` VALUES (1,17059850);
INSERT INTO `instance_entities` VALUES (1,17059851);
INSERT INTO `instance_entities` VALUES (1,17059852);
INSERT INTO `instance_entities` VALUES (1,17059853);
INSERT INTO `instance_entities` VALUES (1,17059854);
INSERT INTO `instance_entities` VALUES (1,17059855);
-- Npcs
INSERT INTO `instance_entities` VALUES (1,17060014);
INSERT INTO `instance_entities` VALUES (1,17060015);
INSERT INTO `instance_entities` VALUES (1,17060138);
INSERT INTO `instance_entities` VALUES (1,17060146);
INSERT INTO `instance_entities` VALUES (1,17060147);

-- Wamoura Farm Raid
INSERT INTO `instance_entities` VALUES (27,17035359);
INSERT INTO `instance_entities` VALUES (27,17035360);
INSERT INTO `instance_entities` VALUES (27,17035361);
INSERT INTO `instance_entities` VALUES (27,17035362);
INSERT INTO `instance_entities` VALUES (27,17035363);
INSERT INTO `instance_entities` VALUES (27,17035365);
INSERT INTO `instance_entities` VALUES (27,17035367);
INSERT INTO `instance_entities` VALUES (27,17035368);
INSERT INTO `instance_entities` VALUES (27,17035369);
INSERT INTO `instance_entities` VALUES (27,17035370);
INSERT INTO `instance_entities` VALUES (27,17035371);
INSERT INTO `instance_entities` VALUES (27,17035372);
INSERT INTO `instance_entities` VALUES (27,17035376);
INSERT INTO `instance_entities` VALUES (27,17035377);
INSERT INTO `instance_entities` VALUES (27,17035378);
INSERT INTO `instance_entities` VALUES (27,17035478);
INSERT INTO `instance_entities` VALUES (27,17035479);
INSERT INTO `instance_entities` VALUES (27,17035508);
INSERT INTO `instance_entities` VALUES (27,17035538);
INSERT INTO `instance_entities` VALUES (27,17035539);
INSERT INTO `instance_entities` VALUES (27,17035541);
INSERT INTO `instance_entities` VALUES (27,17035542);
INSERT INTO `instance_entities` VALUES (27,17035543);
INSERT INTO `instance_entities` VALUES (27,17035544);
INSERT INTO `instance_entities` VALUES (27,17035545);
INSERT INTO `instance_entities` VALUES (27,17035546);

-- Seagull Grounded
-- Mobs
INSERT INTO `instance_entities` VALUES (31,17006593);
INSERT INTO `instance_entities` VALUES (31,17006594);
INSERT INTO `instance_entities` VALUES (31,17006595);
INSERT INTO `instance_entities` VALUES (31,17006596);
INSERT INTO `instance_entities` VALUES (31,17006597);
INSERT INTO `instance_entities` VALUES (31,17006598);
INSERT INTO `instance_entities` VALUES (31,17006599);
INSERT INTO `instance_entities` VALUES (31,17006600);
INSERT INTO `instance_entities` VALUES (31,17006601);
INSERT INTO `instance_entities` VALUES (31,17006602);
INSERT INTO `instance_entities` VALUES (31,17006603);
INSERT INTO `instance_entities` VALUES (31,17006604);
INSERT INTO `instance_entities` VALUES (31,17006605);
INSERT INTO `instance_entities` VALUES (31,17006606);
INSERT INTO `instance_entities` VALUES (31,17006607);
INSERT INTO `instance_entities` VALUES (31,17006608);
INSERT INTO `instance_entities` VALUES (31,17006610);
INSERT INTO `instance_entities` VALUES (31,17006611);
-- Npcs
INSERT INTO `instance_entities` VALUES (31,17006809);
INSERT INTO `instance_entities` VALUES (31,17006810);
INSERT INTO `instance_entities` VALUES (31,17006836);
INSERT INTO `instance_entities` VALUES (31,17006841);
INSERT INTO `instance_entities` VALUES (31,17006842);
INSERT INTO `instance_entities` VALUES (31,17006843);
INSERT INTO `instance_entities` VALUES (31,17006848);
INSERT INTO `instance_entities` VALUES (31,17006852);
INSERT INTO `instance_entities` VALUES (31,17006868);
INSERT INTO `instance_entities` VALUES (31,17006870);
INSERT INTO `instance_entities` VALUES (31,17006872);
INSERT INTO `instance_entities` VALUES (31,17006874);

INSERT INTO `instance_entities` VALUES (41,17002497);
INSERT INTO `instance_entities` VALUES (41,17002498);
INSERT INTO `instance_entities` VALUES (41,17002499);
INSERT INTO `instance_entities` VALUES (41,17002500);
INSERT INTO `instance_entities` VALUES (41,17002501);
INSERT INTO `instance_entities` VALUES (41,17002502);
INSERT INTO `instance_entities` VALUES (41,17002503);
INSERT INTO `instance_entities` VALUES (41,17002504);
INSERT INTO `instance_entities` VALUES (41,17002505);
INSERT INTO `instance_entities` VALUES (41,17002506);
INSERT INTO `instance_entities` VALUES (41,17002507);
INSERT INTO `instance_entities` VALUES (41,17002508);
INSERT INTO `instance_entities` VALUES (41,17002509);
INSERT INTO `instance_entities` VALUES (41,17002510);
INSERT INTO `instance_entities` VALUES (41,17002511);
INSERT INTO `instance_entities` VALUES (41,17002512);
INSERT INTO `instance_entities` VALUES (41,17002513);
INSERT INTO `instance_entities` VALUES (41,17002514);
INSERT INTO `instance_entities` VALUES (41,17002515);
INSERT INTO `instance_entities` VALUES (41,17002516);

/*!40000 ALTER TABLE `instance_entities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-24  5:06:02
