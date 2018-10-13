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

-- Dumping structure for table dspdb.fishing_rod
DROP TABLE IF EXISTS `fishing_rod`;
CREATE TABLE IF NOT EXISTS `fishing_rod` (
  `rodid` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `material` tinyint(2) unsigned NOT NULL,
  `min_fishsize` tinyint(3) unsigned NOT NULL,
  `max_fishsize` tinyint(3) unsigned NOT NULL,
  `fish_attack` tinyint(3) unsigned NOT NULL,
  `lgd_bonus_attack` tinyint(3) unsigned NOT NULL,
  `miss_regen` tinyint(3) unsigned NOT NULL,
  `lgd_miss_regen` tinyint(3) unsigned NOT NULL,
  `fish_time` tinyint(3) unsigned NOT NULL,
  `lgd_bonus_time` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sm_delay_bonus` tinyint(2) unsigned NOT NULL,
  `sm_move_bonus` tinyint(2) unsigned NOT NULL,
  `lg_delay_bonus` tinyint(2) unsigned NOT NULL,
  `lg_move_bonus` tinyint(2) unsigned NOT NULL,
  `breakable` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `broken_rodid` int(10) unsigned NOT NULL,
  `mmm` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`rodid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table dspdb.fishing_rod: ~19 rows (approximately)
/*!40000 ALTER TABLE `fishing_rod` DISABLE KEYS */;
INSERT INTO `fishing_rod` (`rodid`, `name`, `material`, `min_fishsize`, `max_fishsize`, `fish_attack`, `lgd_bonus_attack`, `miss_regen`, `lgd_miss_regen`, `fish_time`, `lgd_bonus_time`, `sm_delay_bonus`, `sm_move_bonus`, `lg_delay_bonus`, `lg_move_bonus`, `breakable`, `broken_rodid`, `mmm`) VALUES
	(17011, 'Ebisu Fishing Rod', 2, 0, 0, 0, 50, 100, 0, 30, 10, 2, 1, 1, 0, 0, 0, 0),
	(17012, 'Judges Rod', 2, 0, 0, 100, 100, 100, 50, 60, 30, 2, 1, 1, 0, 0, 0, 0),
	(17014, 'Hume Fishing Rod', 0, 0, 0, 25, 0, 188, 0, 30, 0, 2, 1, 0, 2, 1, 1832, 0),
	(17015, 'Halcyon Rod', 1, 0, 0, 0, 0, 140, 0, 41, 0, 2, 1, 0, 2, 1, 1833, 0),
	(17380, 'Mithran Fishing Rod', 0, 0, 0, 30, 0, 166, 0, 20, 0, 0, 0, 1, 0, 1, 483, 0),
	(17381, 'Composite Fishing Rod', 1, 0, 0, 0, 0, 140, 0, 33, 0, 0, 0, 1, 0, 1, 473, 0),
	(17382, 'Single Hook Fishing Rod', 1, 0, 0, 0, 0, 156, 0, 35, 0, 0, 0, 1, 0, 1, 472, 0),
	(17383, 'Clothespole', 0, 0, 0, 70, 0, 170, 0, 20, 0, 0, 0, 1, 0, 1, 482, 0),
	(17384, 'Carbon Fishing Rod', 1, 0, 0, 0, 0, 150, 0, 43, 0, 2, 1, 1, 0, 1, 490, 0),
	(17385, 'Glass Fiber Fishing Rod', 1, 0, 0, 0, 0, 164, 0, 45, 0, 2, 1, 1, 0, 1, 491, 0),
	(17386, 'Lu Shang\'s Fishing Rod', 0, 0, 0, 10, 20, 220, 200, 40, 10, 2, 1, 1, 0, 1, 489, 0),
	(17387, 'Tarutaru Fishing Rod', 0, 0, 0, 30, 0, 180, 0, 30, 0, 2, 1, 1, 0, 1, 484, 0),
	(17388, 'Fastwater Fishing Rod', 0, 0, 0, 35, 0, 180, 0, 30, 0, 2, 1, 1, 0, 1, 488, 0),
	(17389, 'Bamboo Fishing Rod', 0, 0, 0, 40, 0, 174, 0, 30, 0, 2, 1, 1, 0, 1, 487, 0),
	(17390, 'Yew Fishing Rod', 0, 0, 0, 45, 0, 156, 0, 30, 0, 2, 1, 1, 0, 1, 486, 0),
	(17391, 'Willow Fishing Rod', 0, 0, 0, 50, 0, 150, 0, 30, 0, 2, 1, 1, 0, 1, 485, 0),
	(19319, 'Maze Monger Fishing Rod', 1, 0, 0, 0, 0, 100, 0, 30, 0, 2, 1, 1, 10, 1, 2526, 1),
	(19320, 'Lu Shang\'s Fishing Rod +1', 0, 0, 0, 10, 20, 220, 200, 50, 10, 2, 1, 1, 0, 1, 9091, 0),
	(19321, 'Ebisu Fishing Rod +1', 2, 0, 0, 0, 50, 100, 0, 40, 10, 2, 1, 1, 0, 0, 0, 0);
/*!40000 ALTER TABLE `fishing_rod` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;