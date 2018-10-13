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

-- Dumping structure for table dspdb.fishing_mob
DROP TABLE IF EXISTS `fishing_mob`;
CREATE TABLE IF NOT EXISTS `fishing_mob` (
  `mobid` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `zoneid` smallint(5) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `size` tinyint(3) unsigned NOT NULL,
  `base_delay` tinyint(2) unsigned NOT NULL,
  `base_move` tinyint(2) unsigned NOT NULL,
  `log` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `quest` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `nm` tinyint(2) unsigned NOT NULL,
  `rarity` tinyint(3) unsigned NOT NULL,
  `required_key_item` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`mobid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table dspdb.fishing_mob: ~6 rows (approximately)
/*!40000 ALTER TABLE `fishing_mob` DISABLE KEYS */;
INSERT INTO `fishing_mob` (`mobid`, `name`, `zoneid`, `level`, `size`, `base_delay`, `base_move`, `log`, `quest`, `nm`, `rarity`, `required_key_item`) VALUES
	(17252353, 'Palm_Crab', 116, 10, 16, 14, 15, 255, 255, 0, 0, 0),
	(17252354, 'Savanna_Crab', 116, 20, 15, 11, 15, 255, 255, 0, 0, 0),
	(17252355, 'Mud_Pugil', 116, 30, 16, 10, 15, 255, 255, 0, 0, 0),
	(17252356, 'Pug_Pugil', 116, 40, 17, 9, 15, 255, 255, 0, 0, 0),
	(17252357, 'Fighting_Pugil', 116, 50, 19, 8, 15, 255, 255, 0, 0, 0),
	(17396141, 'Odontotyrannus', 151, 20, 15, 10, 15, 0, 91, 0, 0, 0);
/*!40000 ALTER TABLE `fishing_mob` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;