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
-- Dumping structure for table dspdb.fishing_area
DROP TABLE IF EXISTS `fishing_area`;
CREATE TABLE IF NOT EXISTS `fishing_area` (
  `zoneid` smallint(5) unsigned NOT NULL,
  `areaid` smallint(5) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `water_type` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `bound_type` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `bound_height` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `bound_radius` smallint(5) unsigned NOT NULL DEFAULT '0',
  `bounds` blob,
  `center_x` float(7,3) NOT NULL DEFAULT '0.000',
  `center_y` float(7,3) NOT NULL DEFAULT '0.000',
  `center_z` float(7,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`zoneid`,`areaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table dspdb.fishing_area: ~12 rows (approximately)
/*!40000 ALTER TABLE `fishing_area` DISABLE KEYS */;
INSERT INTO `fishing_area` (`zoneid`, `areaid`, `name`, `water_type`, `bound_type`, `bound_height`, `bound_radius`, `bounds`, `center_x`, `center_y`, `center_z`) VALUES
	(115, 1, 'Seaside', 1, 2, 0, 0, _binary '', 0.000, 0.000, 0.000),
	(115, 2, 'Pond', 0, 1, 0, 0, _binary '', 0.000, 0.000, 0.000),
	(116, 1, 'Seaside', 1, 2, 20, 0, _binary 0x6666E2C1000000000A372AC49A9941C1000000005C3F32C43333BEC200000000D79333C4004006C300000000F6F825C4291C03C3000000009AA920C4, 0.000, 9.000, 0.000),
	(116, 2, 'Other Waterside (south)', 0, 1, 20, 25, _binary '', -144.690, -5.000, -360.580),
	(116, 3, 'Other Waterside (west)', 0, 1, 20, 25, _binary '', -237.236, -1.000, -224.762),
	(116, 4, 'Other Waterside (rivers)', 0, 2, 50, 0, _binary 0x7B146DC2000000007B1477C2D763A7C300000000CDCC78C2C355A3C300000000CD6C3644B89E054400000000F638364400800644000000009A597BC348E158C200000000AE074CC3, 0.000, -12.000, 0.000),
	(116, 5, 'Lake Tepokalipuka', 0, 2, 20, 0, _binary 0x0000B4C30000000000004CC30000B4C300000000000096C2A4707FC300000000000096C233F36BC300000000EC51E6C2523894C200000000F628E7C266E6A2C2000000003D8A2AC37BD478C3000000007B1429C3CD8C83C3000000005CCF46C3, 0.000, -1.000, 0.000),
	(238, 1, 'Whole Zone', 0, 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(239, 1, 'Whole Zone', 0, 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(240, 1, 'Whole Zone', 0, 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(241, 1, 'Whole Zone', 0, 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(242, 1, 'Whole Zone', 0, 0, 0, 0, NULL, 0.000, 0.000, 0.000);
/*!40000 ALTER TABLE `fishing_area` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;