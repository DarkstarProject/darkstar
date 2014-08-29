-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Sam 01 Septembre 2012 à 17:04
-- Version du serveur: 6.0.0
-- Version de PHP: 5.2.9-2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `dspdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `zone_weather`
--

DROP TABLE IF EXISTS `zone_weather`;
CREATE TABLE IF NOT EXISTS `zone_weather` (
  `zoneid` smallint(3) unsigned NOT NULL DEFAULT '0',
  `shared` smallint(3) unsigned NOT NULL DEFAULT '0',
  `none` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sunshine` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `clouds` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fog` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hot_spell` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `heat_wave` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rain` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `squall` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dust_storm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sand_storm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `wind` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `gales` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `snow` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `blizzards` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `thunder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `thunder_storms` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `auroras` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stellar_glares` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `gloom` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `darkness` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`zoneid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=3;

--
-- Contenu de la table `zone_weather`
--

INSERT INTO `zone_weather` VALUES(0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(1, 0, 50, 0, 0, 0, 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 25, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(2, 0, 50, 0, 0, 0, 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 25, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(3, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(4, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(5, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55, 35, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(6, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(7, 0, 60, 0, 0, 0, 0, 0, 0, 0, 20, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(8, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 50, 0);
INSERT INTO `zone_weather` VALUES(10, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 50, 0);
INSERT INTO `zone_weather` VALUES(11, 0, 60, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(12, 0, 60, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(13, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(14, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(15, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(16, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(17, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(18, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(19, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(20, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(21, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(22, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(23, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 20, 0, 0, 0, 20, 0);
INSERT INTO `zone_weather` VALUES(25, 0, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 20, 0, 0, 0, 20, 0);
INSERT INTO `zone_weather` VALUES(26, 0, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 20, 0, 0, 0, 20, 0);
INSERT INTO `zone_weather` VALUES(27, 0, 20, 10, 10, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 20, 0, 0, 0, 20, 0);
INSERT INTO `zone_weather` VALUES(28, 0, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 20, 0, 0, 0, 20, 0);
INSERT INTO `zone_weather` VALUES(29, 0, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 20, 0, 0, 20, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(30, 0, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 20, 0, 0, 20, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(31, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(32, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(33, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(34, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(35, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(36, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(37, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 20, 0, 0);
INSERT INTO `zone_weather` VALUES(38, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 20);
INSERT INTO `zone_weather` VALUES(39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100);
INSERT INTO `zone_weather` VALUES(40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100);
INSERT INTO `zone_weather` VALUES(41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100);
INSERT INTO `zone_weather` VALUES(42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100);
INSERT INTO `zone_weather` VALUES(43, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(44, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(45, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(46, 0, 60, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(47, 0, 60, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(48, 0, 60, 0, 0, 0, 0, 0, 0, 0, 20, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(49, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(50, 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(51, 0, 30, 50, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(52, 0, 30, 50, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(53, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(54, 0, 20, 25, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 20, 0);
INSERT INTO `zone_weather` VALUES(55, 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0);
INSERT INTO `zone_weather` VALUES(56, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(57, 0, 60, 0, 0, 0, 20, 0, 20, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(58, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 20, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(59, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 20, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(60, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 20);
INSERT INTO `zone_weather` VALUES(61, 0, 30, 0, 20, 0, 20, 0, 0, 0, 20, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(62, 0, 60, 0, 0, 0, 20, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(63, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(64, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(65, 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(66, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(67, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(68, 0, 60, 0, 0, 0, 0, 0, 0, 0, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(69, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(70, 0, 60, 0, 0, 0, 0, 0, 20, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(71, 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(72, 0, 60, 0, 0, 0, 0, 0, 20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(73, 0, 60, 0, 0, 0, 20, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(74, 0, 60, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0);
INSERT INTO `zone_weather` VALUES(75, 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(76, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(77, 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0);
INSERT INTO `zone_weather` VALUES(78, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 20);
INSERT INTO `zone_weather` VALUES(79, 0, 20, 0, 30, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 10, 0);
INSERT INTO `zone_weather` VALUES(80, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(81, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(82, 0, 60, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(83, 0, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 20, 0, 0, 20, 20, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(84, 0, 80, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(85, 0, 60, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(86, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(87, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(88, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(89, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 20, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(90, 0, 60, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(91, 0, 40, 0, 0, 0, 20, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(92, 0, 60, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(93, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(94, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(95, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(96, 0, 60, 0, 0, 0, 0, 0, 0, 0, 20, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(97, 0, 60, 0, 0, 0, 20, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(98, 0, 60, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(99, 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(100, 0, 30, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(101, 100, 30, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(102, 0, 10, 15, 10, 0, 0, 0, 40, 0, 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(103, 0, 30, 40, 0, 0, 20, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(104, 0, 0, 20, 20, 0, 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(105, 0, 20, 0, 15, 0, 0, 0, 0, 0, 30, 10, 0, 0, 20, 5, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(106, 0, 10, 50, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(107, 106, 10, 50, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(108, 0, 15, 20, 15, 0, 0, 0, 0, 0, 15, 0, 0, 0, 0, 0, 25, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(109, 0, 0, 20, 15, 0, 0, 0, 40, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(110, 0, 15, 25, 15, 0, 20, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(111, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 35, 0, 0, 0, 0, 15, 5);
INSERT INTO `zone_weather` VALUES(112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 50, 0);
INSERT INTO `zone_weather` VALUES(113, 0, 40, 25, 0, 0, 15, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(114, 125, 15, 35, 0, 0, 15, 0, 0, 0, 25, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(115, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(116, 115, 50, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(117, 0, 40, 20, 0, 0, 0, 0, 0, 0, 20, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(118, 0, 15, 10, 15, 0, 0, 0, 10, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(119, 0, 30, 30, 0, 0, 20, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(120, 0, 20, 20, 20, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(121, 0, 10, 15, 20, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 25, 10, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(122, 0, 40, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 20, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(123, 0, 50, 0, 0, 0, 25, 0, 15, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(124, 0, 50, 0, 0, 0, 20, 0, 20, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(125, 0, 15, 35, 0, 0, 15, 0, 0, 0, 25, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(126, 0, 10, 10, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 45, 10, 5, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(127, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 10, 0, 10, 0, 0);
INSERT INTO `zone_weather` VALUES(128, 0, 60, 0, 0, 0, 20, 0, 0, 0, 0, 0, 15, 5, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(129, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(130, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(131, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(132, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(133, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(134, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100);
INSERT INTO `zone_weather` VALUES(135, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100);
INSERT INTO `zone_weather` VALUES(136, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74, 40, 0, 0, 0, 0, 10, 2);
INSERT INTO `zone_weather` VALUES(137, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 60, 10, 0, 0, 0, 0, 20, 10);
INSERT INTO `zone_weather` VALUES(138, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 20);
INSERT INTO `zone_weather` VALUES(139, 100, 30, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(140, 100, 30, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(141, 0, 30, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(142, 100, 30, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(143, 0, 30, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(144, 0, 30, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(145, 115, 50, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(146, 115, 50, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(147, 0, 30, 0, 0, 0, 0, 0, 25, 10, 0, 0, 0, 0, 0, 0, 25, 10, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(148, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(149, 0, 40, 0, 10, 0, 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 25, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(150, 0, 60, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(151, 0, 55, 0, 0, 0, 10, 0, 0, 0, 25, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(152, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(153, 0, 50, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(154, 0, 50, 0, 0, 0, 0, 0, 20, 5, 0, 0, 0, 0, 0, 0, 20, 5, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(155, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 60, 40);
INSERT INTO `zone_weather` VALUES(156, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 100);
INSERT INTO `zone_weather` VALUES(157, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 5, 10, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(158, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 0, 10, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(159, 0, 45, 0, 0, 0, 10, 0, 25, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(160, 0, 45, 0, 0, 0, 10, 0, 25, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(161, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40, 0, 0, 0, 0, 0, 35, 25);
INSERT INTO `zone_weather` VALUES(162, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 10, 0, 0, 0, 0, 30, 20);
INSERT INTO `zone_weather` VALUES(163, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(164, 0, 60, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(165, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(166, 111, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 35, 0, 0, 0, 0, 15, 5);
INSERT INTO `zone_weather` VALUES(167, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(168, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(169, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(170, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(171, 0, 60, 0, 0, 0, 10, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(172, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(173, 0, 50, 0, 0, 0, 0, 0, 20, 5, 0, 0, 0, 0, 0, 0, 20, 5, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(174, 0, 45, 0, 0, 0, 10, 0, 0, 0, 0, 0, 30, 15, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(175, 0, 60, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(176, 0, 45, 0, 0, 0, 0, 0, 25, 5, 0, 0, 0, 0, 0, 0, 20, 5, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(177, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(178, 0, 0, 0, 0, 0, 20, 0, 20, 0, 20, 0, 20, 0, 20, 0, 20, 0, 20, 0, 20, 0);
INSERT INTO `zone_weather` VALUES(179, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(180, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(181, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(182, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 20);
INSERT INTO `zone_weather` VALUES(183, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(184, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 20, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(185, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100);
INSERT INTO `zone_weather` VALUES(186, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100);
INSERT INTO `zone_weather` VALUES(187, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100);
INSERT INTO `zone_weather` VALUES(188, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100);
INSERT INTO `zone_weather` VALUES(189, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(190, 100, 30, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(191, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(192, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(193, 0, 60, 0, 0, 0, 0, 0, 20, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(194, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(195, 0, 60, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(196, 0, 50, 0, 0, 0, 0, 0, 0, 0, 20, 5, 0, 0, 0, 0, 20, 5, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(197, 0, 70, 0, 0, 0, 10, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(198, 0, 60, 0, 0, 0, 0, 0, 0, 0, 20, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(199, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(200, 0, 60, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(201, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(202, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(203, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(204, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 20, 0);
INSERT INTO `zone_weather` VALUES(205, 0, 35, 0, 0, 0, 25, 15, 20, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(206, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(207, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(208, 0, 40, 0, 0, 0, 10, 0, 0, 0, 30, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(209, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(210, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(211, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(212, 0, 40, 0, 0, 0, 10, 0, 0, 0, 25, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(213, 0, 60, 0, 0, 0, 0, 0, 20, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(214, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(215, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(216, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(217, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(218, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(219, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(220, 0, 10, 25, 25, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(221, 0, 10, 25, 25, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(222, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(223, 0, 30, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(224, 0, 30, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(225, 0, 30, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(226, 0, 35, 35, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(227, 0, 15, 25, 20, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(228, 0, 15, 25, 20, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(229, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(230, 100, 30, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(231, 100, 30, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(232, 100, 30, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(233, 100, 30, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(234, 107, 10, 50, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(235, 107, 10, 50, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(236, 107, 10, 50, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(237, 107, 10, 50, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(238, 115, 50, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(239, 115, 50, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(240, 115, 50, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(241, 115, 50, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(242, 115, 50, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(243, 0, 30, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(244, 243, 30, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(245, 243, 30, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(246, 243, 30, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(247, 0, 60, 0, 0, 0, 10, 0, 0, 0, 20, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(248, 103, 25, 35, 0, 0, 25, 0, 0, 0, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(249, 118, 15, 10, 15, 0, 0, 0, 10, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(250, 0, 30, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(251, 0, 30, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(252, 0, 30, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(253, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(254, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(255, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(256, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(257, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(258, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(259, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(260, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(261, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(262, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(263, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(264, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(265, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(266, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(267, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(268, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(269, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(270, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(271, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(272, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(273, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(274, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 50);
INSERT INTO `zone_weather` VALUES(275, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(276, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(277, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(278, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(279, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(280, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(281, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(282, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(283, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(284, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `zone_weather` VALUES(285, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
