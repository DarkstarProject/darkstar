-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: dspdb
-- ------------------------------------------------------
-- Server version	5.6.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `fishing_rod_break`
--

DROP TABLE IF EXISTS `fishing_rod_break`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fishing_rod_break` (
  `fishid` int(11) DEFAULT NULL,
  `rodid` int(11) DEFAULT NULL,
  `break` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fishing_rod_break`
--

INSERT INTO `fishing_rod_break` VALUES (4288,17015,1);
INSERT INTO `fishing_rod_break` VALUES (4289,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4291,17015,1);
INSERT INTO `fishing_rod_break` VALUES (4291,17385,1);
INSERT INTO `fishing_rod_break` VALUES (4304,17015,1);
INSERT INTO `fishing_rod_break` VALUES (4304,17380,1);
INSERT INTO `fishing_rod_break` VALUES (4306,17380,1);
INSERT INTO `fishing_rod_break` VALUES (4307,17380,1);
INSERT INTO `fishing_rod_break` VALUES (4354,17014,1);
INSERT INTO `fishing_rod_break` VALUES (4354,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4354,17385,1);
INSERT INTO `fishing_rod_break` VALUES (4354,17387,1);
INSERT INTO `fishing_rod_break` VALUES (4354,17388,1);
INSERT INTO `fishing_rod_break` VALUES (4360,17014,1);
INSERT INTO `fishing_rod_break` VALUES (4360,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4360,17385,1);
INSERT INTO `fishing_rod_break` VALUES (4360,17387,1);
INSERT INTO `fishing_rod_break` VALUES (4360,17388,1);
INSERT INTO `fishing_rod_break` VALUES (4360,17389,1);
INSERT INTO `fishing_rod_break` VALUES (4360,17391,1);
INSERT INTO `fishing_rod_break` VALUES (4361,17014,1);
INSERT INTO `fishing_rod_break` VALUES (4361,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4361,17387,1);
INSERT INTO `fishing_rod_break` VALUES (4361,17388,1);
INSERT INTO `fishing_rod_break` VALUES (4379,17014,1);
INSERT INTO `fishing_rod_break` VALUES (4379,17382,1);
INSERT INTO `fishing_rod_break` VALUES (4379,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4379,17385,1);
INSERT INTO `fishing_rod_break` VALUES (4379,17387,1);
INSERT INTO `fishing_rod_break` VALUES (4379,17388,1);
INSERT INTO `fishing_rod_break` VALUES (4383,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4384,17015,1);
INSERT INTO `fishing_rod_break` VALUES (4384,17380,1);
INSERT INTO `fishing_rod_break` VALUES (4384,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4385,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4399,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4399,17385,1);
INSERT INTO `fishing_rod_break` VALUES (4401,17385,1);
INSERT INTO `fishing_rod_break` VALUES (4401,17387,1);
INSERT INTO `fishing_rod_break` VALUES (4401,17388,1);
INSERT INTO `fishing_rod_break` VALUES (4401,17389,1);
INSERT INTO `fishing_rod_break` VALUES (4401,17391,1);
INSERT INTO `fishing_rod_break` VALUES (4402,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4403,17014,1);
INSERT INTO `fishing_rod_break` VALUES (4403,17385,1);
INSERT INTO `fishing_rod_break` VALUES (4403,17388,1);
INSERT INTO `fishing_rod_break` VALUES (4403,17389,1);
INSERT INTO `fishing_rod_break` VALUES (4426,17014,1);
INSERT INTO `fishing_rod_break` VALUES (4426,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4426,17385,1);
INSERT INTO `fishing_rod_break` VALUES (4426,17387,1);
INSERT INTO `fishing_rod_break` VALUES (4426,17388,1);
INSERT INTO `fishing_rod_break` VALUES (4426,17390,1);
INSERT INTO `fishing_rod_break` VALUES (4426,17391,1);
INSERT INTO `fishing_rod_break` VALUES (4427,17014,1);
INSERT INTO `fishing_rod_break` VALUES (4427,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4427,17387,1);
INSERT INTO `fishing_rod_break` VALUES (4428,17014,1);
INSERT INTO `fishing_rod_break` VALUES (4428,17385,1);
INSERT INTO `fishing_rod_break` VALUES (4429,17014,1);
INSERT INTO `fishing_rod_break` VALUES (4429,17015,1);
INSERT INTO `fishing_rod_break` VALUES (4429,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4443,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4443,17385,1);
INSERT INTO `fishing_rod_break` VALUES (4443,17387,1);
INSERT INTO `fishing_rod_break` VALUES (4443,17388,1);
INSERT INTO `fishing_rod_break` VALUES (4443,17389,1);
INSERT INTO `fishing_rod_break` VALUES (4443,17390,1);
INSERT INTO `fishing_rod_break` VALUES (4443,17391,1);
INSERT INTO `fishing_rod_break` VALUES (4451,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4451,17387,1);
INSERT INTO `fishing_rod_break` VALUES (4451,17388,1);
INSERT INTO `fishing_rod_break` VALUES (4454,17380,1);
INSERT INTO `fishing_rod_break` VALUES (4461,17015,1);
INSERT INTO `fishing_rod_break` VALUES (4461,17380,1);
INSERT INTO `fishing_rod_break` VALUES (4461,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4461,17387,1);
INSERT INTO `fishing_rod_break` VALUES (4461,17389,1);
INSERT INTO `fishing_rod_break` VALUES (4461,17390,1);
INSERT INTO `fishing_rod_break` VALUES (4461,17391,1);
INSERT INTO `fishing_rod_break` VALUES (4462,17015,1);
INSERT INTO `fishing_rod_break` VALUES (4463,17380,1);
INSERT INTO `fishing_rod_break` VALUES (4464,17014,1);
INSERT INTO `fishing_rod_break` VALUES (4464,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4464,17385,1);
INSERT INTO `fishing_rod_break` VALUES (4464,17387,1);
INSERT INTO `fishing_rod_break` VALUES (4464,17388,1);
INSERT INTO `fishing_rod_break` VALUES (4469,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4470,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4471,17380,1);
INSERT INTO `fishing_rod_break` VALUES (4472,17014,1);
INSERT INTO `fishing_rod_break` VALUES (4472,17385,1);
INSERT INTO `fishing_rod_break` VALUES (4472,17387,1);
INSERT INTO `fishing_rod_break` VALUES (4472,17388,1);
INSERT INTO `fishing_rod_break` VALUES (4472,17390,1);
INSERT INTO `fishing_rod_break` VALUES (4472,17391,1);
INSERT INTO `fishing_rod_break` VALUES (4473,17015,1);
INSERT INTO `fishing_rod_break` VALUES (4473,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4474,17380,1);
INSERT INTO `fishing_rod_break` VALUES (4474,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4474,17389,1);
INSERT INTO `fishing_rod_break` VALUES (4474,17390,1);
INSERT INTO `fishing_rod_break` VALUES (4475,17380,1);
INSERT INTO `fishing_rod_break` VALUES (4475,17381,1);
INSERT INTO `fishing_rod_break` VALUES (4476,17380,1);
INSERT INTO `fishing_rod_break` VALUES (4476,17381,1);
INSERT INTO `fishing_rod_break` VALUES (4477,17380,1);
INSERT INTO `fishing_rod_break` VALUES (4477,17382,1);
INSERT INTO `fishing_rod_break` VALUES (4477,17383,1);
INSERT INTO `fishing_rod_break` VALUES (4478,17380,1);
INSERT INTO `fishing_rod_break` VALUES (4479,17015,1);
INSERT INTO `fishing_rod_break` VALUES (4479,17380,1);
INSERT INTO `fishing_rod_break` VALUES (4479,17382,1);
INSERT INTO `fishing_rod_break` VALUES (4480,17015,1);
INSERT INTO `fishing_rod_break` VALUES (4480,17380,1);
INSERT INTO `fishing_rod_break` VALUES (4480,17383,1);
INSERT INTO `fishing_rod_break` VALUES (4480,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4481,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4482,17388,1);
INSERT INTO `fishing_rod_break` VALUES (4483,17014,1);
INSERT INTO `fishing_rod_break` VALUES (4483,17385,1);
INSERT INTO `fishing_rod_break` VALUES (4483,17388,1);
INSERT INTO `fishing_rod_break` VALUES (4484,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4485,17014,1);
INSERT INTO `fishing_rod_break` VALUES (4485,17015,1);
INSERT INTO `fishing_rod_break` VALUES (4485,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4500,17014,1);
INSERT INTO `fishing_rod_break` VALUES (4500,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4500,17385,1);
INSERT INTO `fishing_rod_break` VALUES (4500,17387,1);
INSERT INTO `fishing_rod_break` VALUES (4500,17389,1);
INSERT INTO `fishing_rod_break` VALUES (4501,17014,1);
INSERT INTO `fishing_rod_break` VALUES (4501,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4501,17389,1);
INSERT INTO `fishing_rod_break` VALUES (4514,17014,1);
INSERT INTO `fishing_rod_break` VALUES (4514,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4514,17385,1);
INSERT INTO `fishing_rod_break` VALUES (4514,17387,1);
INSERT INTO `fishing_rod_break` VALUES (4514,17388,1);
INSERT INTO `fishing_rod_break` VALUES (4514,17389,1);
INSERT INTO `fishing_rod_break` VALUES (4514,17391,1);
INSERT INTO `fishing_rod_break` VALUES (4515,17014,1);
INSERT INTO `fishing_rod_break` VALUES (4515,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4515,17385,1);
INSERT INTO `fishing_rod_break` VALUES (4515,17387,1);
INSERT INTO `fishing_rod_break` VALUES (4515,17388,1);
INSERT INTO `fishing_rod_break` VALUES (4515,17389,1);
INSERT INTO `fishing_rod_break` VALUES (4515,17390,1);
INSERT INTO `fishing_rod_break` VALUES (4515,17391,1);
INSERT INTO `fishing_rod_break` VALUES (4528,17014,1);
INSERT INTO `fishing_rod_break` VALUES (4528,17384,1);
INSERT INTO `fishing_rod_break` VALUES (4528,17385,1);
INSERT INTO `fishing_rod_break` VALUES (4528,17387,1);
INSERT INTO `fishing_rod_break` VALUES (4579,17380,1);
INSERT INTO `fishing_rod_break` VALUES (4580,17380,1);
INSERT INTO `fishing_rod_break` VALUES (4580,17384,1);
INSERT INTO `fishing_rod_break` VALUES (5120,17386,1);
INSERT INTO `fishing_rod_break` VALUES (5126,17014,1);
INSERT INTO `fishing_rod_break` VALUES (5126,17015,1);
INSERT INTO `fishing_rod_break` VALUES (5126,17381,1);
INSERT INTO `fishing_rod_break` VALUES (5126,17384,1);
INSERT INTO `fishing_rod_break` VALUES (5133,17381,1);
INSERT INTO `fishing_rod_break` VALUES (5134,17386,1);
INSERT INTO `fishing_rod_break` VALUES (5448,17014,1);
INSERT INTO `fishing_rod_break` VALUES (5454,17015,1);
INSERT INTO `fishing_rod_break` VALUES (5455,17014,1);
INSERT INTO `fishing_rod_break` VALUES (5455,17015,1);
INSERT INTO `fishing_rod_break` VALUES (5461,17014,1);
INSERT INTO `fishing_rod_break` VALUES (5461,17384,1);
INSERT INTO `fishing_rod_break` VALUES (5461,17385,1);
INSERT INTO `fishing_rod_break` VALUES (5461,17387,1);
INSERT INTO `fishing_rod_break` VALUES (5461,17388,1);
INSERT INTO `fishing_rod_break` VALUES (5463,17384,1);
INSERT INTO `fishing_rod_break` VALUES (5466,17015,1);
INSERT INTO `fishing_rod_break` VALUES (5470,17014,1);
INSERT INTO `fishing_rod_break` VALUES (5470,17015,1);
INSERT INTO `fishing_rod_break` VALUES (5470,17380,1);
INSERT INTO `fishing_rod_break` VALUES (5470,17381,1);
INSERT INTO `fishing_rod_break` VALUES (5470,17382,1);
INSERT INTO `fishing_rod_break` VALUES (5470,17383,1);
INSERT INTO `fishing_rod_break` VALUES (5470,17384,1);
INSERT INTO `fishing_rod_break` VALUES (5470,17385,1);
INSERT INTO `fishing_rod_break` VALUES (5470,17386,1);
INSERT INTO `fishing_rod_break` VALUES (5470,17387,1);
INSERT INTO `fishing_rod_break` VALUES (5470,17388,1);
INSERT INTO `fishing_rod_break` VALUES (5470,17389,1);
INSERT INTO `fishing_rod_break` VALUES (5470,17390,1);
INSERT INTO `fishing_rod_break` VALUES (5470,17391,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-23 14:37:55
