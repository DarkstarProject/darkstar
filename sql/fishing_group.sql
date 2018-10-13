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

-- Dumping structure for table dspdb.fishing_group
DROP TABLE IF EXISTS `fishing_group`;
CREATE TABLE IF NOT EXISTS `fishing_group` (
  `groupid` int(10) NOT NULL,
  `fishid` int(10) NOT NULL,
  `rarity` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `requiredmoon` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `moonbonus` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `requiredtime` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `timebonus` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `requiredday` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `daybonus` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `requiredweather` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `weatherbonus` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fishing_groupcol` varchar(45) DEFAULT '0',
  PRIMARY KEY (`groupid`,`fishid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table dspdb.fishing_group: ~19 rows (approximately)
/*!40000 ALTER TABLE `fishing_group` DISABLE KEYS */;
INSERT INTO `fishing_group` (`groupid`, `fishid`, `rarity`, `requiredmoon`, `moonbonus`, `requiredtime`, `timebonus`, `requiredday`, `daybonus`, `requiredweather`, `weatherbonus`, `fishing_groupcol`) VALUES
	(1, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
	(1, 4401, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
	(1, 4462, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
	(1, 4464, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
	(1, 4472, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
	(1, 4473, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
	(1, 14117, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
	(1, 14242, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
	(2, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
	(2, 624, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
	(2, 4360, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
	(2, 4383, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
	(2, 4399, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
	(2, 4461, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
	(2, 4471, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
	(2, 4481, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
	(2, 4514, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
	(2, 14117, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
	(2, 14242, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
	(3, 4472, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
	(3, 14242, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0');
/*!40000 ALTER TABLE `fishing_group` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;