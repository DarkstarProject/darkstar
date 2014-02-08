# Host: 192.168.1.17  (Version: 5.6.15)
# Date: 2014-02-06 17:14:54
# Generator: MySQL-Front 5.3  (Build 4.102)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "fishing_rods"
#

DROP TABLE IF EXISTS `fishing_rods`;
CREATE TABLE `fishing_rods` (
  `rodid` int(11) DEFAULT NULL,
  `name` text,
  `type` int(11) DEFAULT NULL,
  `brokenid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "fishing_rods"
#

INSERT INTO `fishing_rods` VALUES (17389,'Bamboo Fishing Rod',0,487),(17384,'Carbon Fishing Rod',1,490),(17383,'Clothespole',0,482),(17381,'Composite Fishing Rod',1,473),(17011,'Ebisu Fishing Rod',0,0),(17388,'Fastwater Fishing Rod',0,488),(17385,'Glass Fiber Fishing Rod',1,491),(17015,'Halcyon Fishing Rod',1,1833),(17014,'Hume Fishing Rod',0,1832),(17386,'Lu Shang\'s Fishing Rod',0,489),(17380,'Mithran Fishing Rod',0,483),(17382,'Single Hook Fishing Rod',1,472),(17387,'Tarutaru Fishing Rod',0,484),(17391,'Willow Fishing Rod',0,485),(17390,'Yew Fishing Rod',0,486),(17012,'Judges Fishing Rod',1,0);
