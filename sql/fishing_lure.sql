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

-- Dumping structure for table dspdb.fishing_lure
DROP TABLE IF EXISTS `fishing_lure`;
CREATE TABLE IF NOT EXISTS `fishing_lure` (
  `lureid` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `luretype` tinyint(2) unsigned NOT NULL,
  `maxhook` tinyint(2) unsigned NOT NULL,
  `losable` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `mmm` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`lureid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table dspdb.fishing_lure: ~34 rows (approximately)
/*!40000 ALTER TABLE `fishing_lure` DISABLE KEYS */;
INSERT INTO `fishing_lure` (`lureid`, `name`, `luretype`, `maxhook`, `losable`, `mmm`) VALUES
	(16992, 'Slice of Bluetail', 0, 1, 1, 0),
	(16993, 'Peeled Crayfish', 0, 1, 1, 0),
	(16994, 'Slice of Moat Carp', 0, 1, 1, 0),
	(16995, 'Rotten Meat', 0, 1, 1, 0),
	(16996, 'Ball of Sardine Paste', 0, 1, 1, 0),
	(16997, 'Ball of Crayfish Paste', 0, 1, 1, 0),
	(16998, 'Ball of Insect Paste', 0, 1, 1, 0),
	(16999, 'Ball of Trout Paste', 0, 1, 1, 0),
	(17000, 'Meatball', 0, 1, 1, 0),
	(17001, 'Giant Shell Bug', 0, 1, 1, 0),
	(17002, 'Robber Rig', 1, 1, 1, 0),
	(17005, 'Lufaise Fly', 0, 1, 1, 0),
	(17006, 'Drill Calamary', 0, 1, 1, 0),
	(17007, 'Dwarf Pugil', 0, 1, 1, 0),
	(17008, 'Regular Maze Monger Ball', 1, 1, 1, 1),
	(17009, 'Large Maze Monger Ball', 1, 1, 1, 1),
	(17392, 'Slice of Sardine', 0, 1, 1, 0),
	(17393, 'Slice of Cod', 0, 1, 1, 0),
	(17394, 'Peeled Lobster', 0, 1, 1, 0),
	(17395, 'Lugworm', 0, 1, 1, 0),
	(17396, 'Little Worm', 0, 1, 1, 0),
	(17397, 'Shell Bug', 0, 1, 1, 0),
	(17398, 'Rogue Rig', 1, 1, 1, 0),
	(17399, 'Sabiki Rig', 1, 3, 1, 0),
	(17400, 'Sinking Minnow', 1, 1, 1, 0),
	(17401, 'Lizard Lure', 1, 1, 1, 0),
	(17402, 'Shrimp Lure', 1, 1, 1, 0),
	(17403, 'Frog Lure', 1, 1, 1, 0),
	(17404, 'Worm Lure', 1, 1, 1, 0),
	(17405, 'Fly Lure', 1, 1, 1, 0),
	(17407, 'Minnow', 1, 1, 1, 0),
	(19323, 'Maze Monger Minnow', 2, 1, 1, 1),
	(19324, 'Dried Squid', 2, 1, 1, 0),
	(19326, 'Sea Dragon Liver', 0, 1, 1, 0);
/*!40000 ALTER TABLE `fishing_lure` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;