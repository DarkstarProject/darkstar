-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- GÃ©nÃ©rÃ© le : Dim 07 Octobre 2012 Ã  09:39
-- Version du serveur: 6.0.0
-- Version de PHP: 5.2.9-2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de donnÃ©es: `dspdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `mob_pool_mods`
--

DROP TABLE IF EXISTS `mob_pool_mods`;
CREATE TABLE IF NOT EXISTS `mob_pool_mods` (
  `poolid` smallint(5) unsigned NOT NULL,
  `modid` smallint(5) unsigned NOT NULL,
  `value` smallint(5) NOT NULL DEFAULT '0',
  `type` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`poolid`,`modid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=13 PACK_KEYS=1;

--
-- Contenu de la table `mob_pool_mods`
--

INSERT INTO `mob_pool_mods` VALUES(519, 160, -50, 0);
INSERT INTO `mob_pool_mods` VALUES(532, 160, -50, 0);
INSERT INTO `mob_pool_mods` VALUES(676, 160, -50, 0);
INSERT INTO `mob_pool_mods` VALUES(2643, 160, -50, 0);
INSERT INTO `mob_pool_mods` VALUES(2647, 160, -50, 0);
INSERT INTO `mob_pool_mods` VALUES(733, 302, 5, 0);
INSERT INTO `mob_pool_mods` VALUES(2677, 288, 55, 0);
INSERT INTO `mob_pool_mods` VALUES(21, 29, 100, 0);
INSERT INTO `mob_pool_mods` VALUES(2156, 370, 30, 0);
INSERT INTO `mob_pool_mods` VALUES(2262, 370, 125, 0);
INSERT INTO `mob_pool_mods` VALUES(4261, 370, 125, 0);
INSERT INTO `mob_pool_mods` VALUES(4261, 29, 50, 0);
INSERT INTO `mob_pool_mods` VALUES(2420, 302, 10, 0);
INSERT INTO `mob_pool_mods` VALUES(1648, 224, 5, 0);
INSERT INTO `mob_pool_mods` VALUES(2790, 244, 7, 0);
INSERT INTO `mob_pool_mods` VALUES(2790, 240, 7, 0);
INSERT INTO `mob_pool_mods` VALUES(2790, 168, 50, 0);
INSERT INTO `mob_pool_mods` VALUES(3549, 370, 50, 0);
INSERT INTO `mob_pool_mods` VALUES(1648, 17, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(3916, 370, 50, 0);
INSERT INTO `mob_pool_mods` VALUES(3916, 29, 50, 0);
INSERT INTO `mob_pool_mods` VALUES(3796, 21, 97, 1);
INSERT INTO `mob_pool_mods` VALUES(4396, 16, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(979, 8, 60, 1);
INSERT INTO `mob_pool_mods` VALUES(979, 9, 60, 1);
INSERT INTO `mob_pool_mods` VALUES(639, 63, 25, 0);
INSERT INTO `mob_pool_mods` VALUES(2271, 64, 15, 0);
INSERT INTO `mob_pool_mods` VALUES(2271, 65, 15, 0);
INSERT INTO `mob_pool_mods` VALUES(2271, 165, 15, 0);
INSERT INTO `mob_pool_mods` VALUES(2254, 407, 100, 0);
INSERT INTO `mob_pool_mods` VALUES(1719, 29, 2, 1);
INSERT INTO `mob_pool_mods` VALUES(1663, 29, 3, 1);
INSERT INTO `mob_pool_mods` VALUES(3824, 29, 2, 1);
INSERT INTO `mob_pool_mods` VALUES(2255, 368, 70, 0);
INSERT INTO `mob_pool_mods` VALUES(2255, 370, 50, 0);
INSERT INTO `mob_pool_mods` VALUES(3598, 368, 70, 0);
INSERT INTO `mob_pool_mods` VALUES(3600, 368, 70, 0);
INSERT INTO `mob_pool_mods` VALUES(3601, 368, 70, 0);
INSERT INTO `mob_pool_mods` VALUES(1280, 368, 70, 0);
INSERT INTO `mob_pool_mods` VALUES(2840, 370, 50, 0);
INSERT INTO `mob_pool_mods` VALUES(2840, 368, 70, 0);
INSERT INTO `mob_pool_mods` VALUES(2047, 163, -100, 0);
INSERT INTO `mob_pool_mods` VALUES(1178, 163, -100, 0);
INSERT INTO `mob_pool_mods` VALUES(3759, 163, -100, 0);
INSERT INTO `mob_pool_mods` VALUES(3941, 163, -100, 0);
INSERT INTO `mob_pool_mods` VALUES(1792, 368, 70, 0);
INSERT INTO `mob_pool_mods` VALUES(2973, 370, 1, 0);
INSERT INTO `mob_pool_mods` VALUES(4083, 370, 1, 0);
INSERT INTO `mob_pool_mods` VALUES(2265, 368, 150, 0);
INSERT INTO `mob_pool_mods` VALUES(2265, 370, 50, 0);
INSERT INTO `mob_pool_mods` VALUES(44, 368, 150, 0);
INSERT INTO `mob_pool_mods` VALUES(268, 370, 50, 0);
INSERT INTO `mob_pool_mods` VALUES(268, 368, 150, 0);
INSERT INTO `mob_pool_mods` VALUES(979, 14, 700, 1);
INSERT INTO `mob_pool_mods` VALUES(370, 28, 105, 1);
INSERT INTO `mob_pool_mods` VALUES(768, 28, 105, 1);
INSERT INTO `mob_pool_mods` VALUES(958, 28, 105, 1);
INSERT INTO `mob_pool_mods` VALUES(978, 28, 123, 1);
INSERT INTO `mob_pool_mods` VALUES(2745, 28, 123, 1);
INSERT INTO `mob_pool_mods` VALUES(1806, 28, 110, 1);
INSERT INTO `mob_pool_mods` VALUES(1429, 28, 110, 1);
INSERT INTO `mob_pool_mods` VALUES(2314, 28, 123, 1);
INSERT INTO `mob_pool_mods` VALUES(3168, 28, 110, 1);
INSERT INTO `mob_pool_mods` VALUES(1841, 28, 110, 1);
INSERT INTO `mob_pool_mods` VALUES(3853, 28, 123, 1);
INSERT INTO `mob_pool_mods` VALUES(2675, 4, 20, 1);
INSERT INTO `mob_pool_mods` VALUES(1517, 31, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(1518, 31, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(1511, 31, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(844, 31, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(1214, 31, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(1283, 31, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(1290, 31, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(1291, 31, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(1433, 31, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(1835, 31, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(2442, 31, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(4320, 31, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(4337, 31, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(4516, 31, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(1267, 31, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(3170, 31, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(483, 31, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(900, 31, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(868, 31, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(980, 31, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(1456, 368, 20, 0);
INSERT INTO `mob_pool_mods` VALUES(1154, 16, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(1798, 16, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(2729, 16, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(4052, 16, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(4670, 16, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(4673, 16, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(4671, 16, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(4672, 16, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(1491, 16, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(3816, 16, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(3540, 16, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(592, 16, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(592, 302, 45, 0);
INSERT INTO `mob_pool_mods` VALUES(592, 68, 15, 0);
INSERT INTO `mob_pool_mods` VALUES(235, 16, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(236, 16, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(237, 16, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(238, 16, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(242, 16, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(2460, 16, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(1773, 16, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(387, 13, 1800, 1);
INSERT INTO `mob_pool_mods` VALUES(2255, 13, 3600, 1);
INSERT INTO `mob_pool_mods` VALUES(1731, 14, 701, 1);
INSERT INTO `mob_pool_mods` VALUES(2107, 14, 701, 1);
INSERT INTO `mob_pool_mods` VALUES(4040, 14, 701, 1);
INSERT INTO `mob_pool_mods` VALUES(4204, 14, 702, 1);
INSERT INTO `mob_pool_mods` VALUES(3168, 14, 702, 1);
INSERT INTO `mob_pool_mods` VALUES(595, 14, 703, 1);
INSERT INTO `mob_pool_mods` VALUES(595, 169, 250, 0);
INSERT INTO `mob_pool_mods` VALUES(595, 171, 40, 0);
INSERT INTO `mob_pool_mods` VALUES(595, 23, 15, 1);
INSERT INTO `mob_pool_mods` VALUES(2083, 29, 25, 0);
INSERT INTO `mob_pool_mods` VALUES(2664, 12, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(276, 12, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(1027, 12, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(912, 12, 25, 1);
INSERT INTO `mob_pool_mods` VALUES(3540, 3, 100, 1);
INSERT INTO `mob_pool_mods` VALUES(592, 3, 100, 1);
INSERT INTO `mob_pool_mods` VALUES(1491, 3, 100, 1);
INSERT INTO `mob_pool_mods` VALUES(3816, 3, 100, 1);
INSERT INTO `mob_pool_mods` VALUES(4670, 3, 100, 1);
INSERT INTO `mob_pool_mods` VALUES(4671, 3, 100, 1);
INSERT INTO `mob_pool_mods` VALUES(4672, 3, 100, 1);
INSERT INTO `mob_pool_mods` VALUES(4673, 3, 100, 1);
INSERT INTO `mob_pool_mods` VALUES(154, 163, -70, 0);
INSERT INTO `mob_pool_mods` VALUES(3208, 370, 20, 0);
INSERT INTO `mob_pool_mods` VALUES(876, 16, 1, 1);