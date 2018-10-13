-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.20-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5244
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table dspdb.fishing_catch
DROP TABLE IF EXISTS `fishing_catch`;
CREATE TABLE IF NOT EXISTS `fishing_catch` (
  `zoneid` smallint(5) unsigned NOT NULL,
  `areaid` tinyint(3) unsigned NOT NULL,
  `groupid` smallint(5) NOT NULL,
  PRIMARY KEY (`zoneid`,`areaid`,`groupid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=27;

-- Dumping data for table dspdb.fishing_catch: 5 rows
/*!40000 ALTER TABLE `fishing_catch` DISABLE KEYS */;
INSERT INTO `fishing_catch` (`zoneid`, `areaid`, `groupid`) VALUES
	(116, 1, 2),
	(116, 2, 3),
	(116, 3, 3),
	(116, 4, 3),
	(116, 5, 1);
/*!40000 ALTER TABLE `fishing_catch` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;