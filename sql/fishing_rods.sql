-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
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
-- Table structure for table `fishing_rods`
--

DROP TABLE IF EXISTS `fishing_rods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fishing_rods` (
  `rodid` int(11) DEFAULT NULL,
  `name` text,
  `type` int(11) DEFAULT NULL,
  `brokenid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fishing_rods`
--

LOCK TABLES `fishing_rods` WRITE;
/*!40000 ALTER TABLE `fishing_rods` DISABLE KEYS */;
INSERT INTO `fishing_rods` VALUES (17389,'Bamboo Fishing Rod',0,487);
INSERT INTO `fishing_rods` VALUES (17384,'Carbon Fishing Rod',1,490);
INSERT INTO `fishing_rods` VALUES (17383,'Clothespole',0,482);
INSERT INTO `fishing_rods` VALUES (17381,'Composite Fishing Rod',1,473);
INSERT INTO `fishing_rods` VALUES (17011,'Ebisu Fishing Rod',0,0);
INSERT INTO `fishing_rods` VALUES (17388,'Fastwater Fishing Rod',0,488);
INSERT INTO `fishing_rods` VALUES (17385,'Glass Fiber Fishing Rod',1,491);
INSERT INTO `fishing_rods` VALUES (17015,'Halcyon Fishing Rod',1,1833);
INSERT INTO `fishing_rods` VALUES (17014,'Hume Fishing Rod',0,1832);
INSERT INTO `fishing_rods` VALUES (17386,'Lu Shang\'s Fishing Rod',0,489);
INSERT INTO `fishing_rods` VALUES (17380,'Mithran Fishing Rod',0,483);
INSERT INTO `fishing_rods` VALUES (17382,'Single Hook Fishing Rod',1,472);
INSERT INTO `fishing_rods` VALUES (17387,'Tarutaru Fishing Rod',0,484);
INSERT INTO `fishing_rods` VALUES (17391,'Willow Fishing Rod',0,485);
INSERT INTO `fishing_rods` VALUES (17390,'Yew Fishing Rod',0,486);
INSERT INTO `fishing_rods` VALUES (17012,'Judges Fishing Rod',1,0);
/*!40000 ALTER TABLE `fishing_rods` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-08 15:58:00
