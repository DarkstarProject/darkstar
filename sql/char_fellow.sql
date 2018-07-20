SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

DROP TABLE IF EXISTS `char_fellow`;
CREATE TABLE `char_fellow` (
  `charId` int(10) unsigned NOT NULL,
  `fellowNameId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `optionsMask` int(11) unsigned NOT NULL DEFAULT '0',
  `lvlCap` tinyint(2) unsigned NOT NULL DEFAULT '50',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '30',
  `exp` smallint(5) unsigned NOT NULL DEFAULT '0',
  `bond` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `bondCap` tinyint(3) unsigned NOT NULL DEFAULT '30',
  `face` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `size` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `personality` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `race` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `head` smallint(4) unsigned NOT NULL DEFAULT '0',
  `body` smallint(4) unsigned NOT NULL DEFAULT '8',
  `hands` smallint(4) unsigned NOT NULL DEFAULT '8',
  `legs` smallint(4) unsigned NOT NULL DEFAULT '8',
  `feet` smallint(4) unsigned NOT NULL DEFAULT '8',
  `main` smallint(4) unsigned NOT NULL DEFAULT '0',
  `sub` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;