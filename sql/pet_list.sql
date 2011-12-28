-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Sam 25 Juin 2011 à 10:09
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
-- Structure de la table `pet_list`
--

DROP TABLE IF EXISTS `pet_list`;
CREATE TABLE IF NOT EXISTS `pet_list` (
  `petid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(15) NOT NULL,
  `poolid` int(10) unsigned NOT NULL DEFAULT '0',
  `minLevel` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `maxLevel` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`petid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Contenu de la table `pet_list`
--

INSERT INTO `pet_list` VALUES (0, 'FireSpirit', 1341, 1, 99, 0);
INSERT INTO `pet_list` VALUES (1, 'IceSpirit', 2043, 1, 99, 0);
INSERT INTO `pet_list` VALUES (2, 'AirSpirit', 71, 1, 99, 0);
INSERT INTO `pet_list` VALUES (3, 'EarthSpirit', 1160, 1, 99, 0);
INSERT INTO `pet_list` VALUES (4, 'ThunderSpirit', 3912, 1, 99, 0);
INSERT INTO `pet_list` VALUES (5, 'WaterSpirit', 4309, 1, 99, 0);
INSERT INTO `pet_list` VALUES (6, 'LightSpirit', 2413, 1, 99, 0);
INSERT INTO `pet_list` VALUES (7, 'DarkSpirit', 913, 1, 99, 0);
INSERT INTO `pet_list` VALUES (8, 'Carbuncle', 636, 1, 99, 0);
INSERT INTO `pet_list` VALUES (9, 'Fenrir', 1322, 1, 99, 0);
INSERT INTO `pet_list` VALUES (10, 'Ifrit', 2050, 1, 99, 0);
INSERT INTO `pet_list` VALUES (11, 'Titan', 3931, 1, 99, 0);
INSERT INTO `pet_list` VALUES (12, 'Leviathan', 2402, 1, 99, 0);
INSERT INTO `pet_list` VALUES (13, 'Garuda', 1473, 1, 99, 0);
INSERT INTO `pet_list` VALUES (14, 'Shiva', 3607, 1, 99, 0);
INSERT INTO `pet_list` VALUES (15, 'Ramuh', 3317, 1, 99, 0);
INSERT INTO `pet_list` VALUES (16, 'Diabolos', 0, 1, 99, 0);
INSERT INTO `pet_list` VALUES (17, 'Sheep Familiar', 696, 23, 35, 3600);
INSERT INTO `pet_list` VALUES (18, 'Hare Familiar', 4256, 23, 35, 5400);
INSERT INTO `pet_list` VALUES (19, 'Crab Familiar', 743, 23, 55, 1800);
INSERT INTO `pet_list` VALUES (20, 'Courier Carrie', 0, 23, 75, 1800);
INSERT INTO `pet_list` VALUES (21, 'Homunculus', 97, 23, 75, 3600);
INSERT INTO `pet_list` VALUES (22, 'Flytrap Familiar', 421, 28, 40, 3600);
INSERT INTO `pet_list` VALUES (23, 'Tiger Familiar', 4050, 28, 40, 3600);
INSERT INTO `pet_list` VALUES (24, 'Flowerpot Bill', 4482, 28, 40, 3600);
INSERT INTO `pet_list` VALUES (25, 'Eft Familiar', 1181, 33, 45, 3600);
INSERT INTO `pet_list` VALUES (26, 'Lizard Familiar', 1956, 33, 45, 3600);
INSERT INTO `pet_list` VALUES (27, 'Mayfly Familiar', 1454, 33, 45, 3600);
INSERT INTO `pet_list` VALUES (28, 'Funguar Familiar', 1271, 33, 65, 3600);
INSERT INTO `pet_list` VALUES (29, 'Beetle Familiar', 512, 38, 45, 3600);
INSERT INTO `pet_list` VALUES (30, 'Antlion Familiar', 3141, 38, 50, 3600);
INSERT INTO `pet_list` VALUES (31, 'Mite Familiar', 1040, 43, 55, 3600);
INSERT INTO `pet_list` VALUES (32, 'Lullaby Melodia', 539, 43, 55, 3600);
INSERT INTO `pet_list` VALUES (33, 'Keeneared Steffi', 2107, 43, 55, 5400);
INSERT INTO `pet_list` VALUES (34, 'Flowerpot Ben', 2762, 51, 63, 3600);
INSERT INTO `pet_list` VALUES (35, 'Saber Siravarde', 4079, 51, 63, 3600);
INSERT INTO `pet_list` VALUES (36, 'Coldblood Como', 2311, 53, 65, 3600);
INSERT INTO `pet_list` VALUES (37, 'Shellbuster Orob', 1099, 53, 65, 3600);
INSERT INTO `pet_list` VALUES (38, 'Voracious Audrey', 2556, 53, 75, 3600);
INSERT INTO `pet_list` VALUES (39, 'Ambusher Allie', 3848, 58, 75, 3600);
INSERT INTO `pet_list` VALUES (40, 'Lifedrinker Lars', 307, 63, 75, 3600);
INSERT INTO `pet_list` VALUES (41, 'Panzer Galahad', 3755, 63, 75, 3600);
INSERT INTO `pet_list` VALUES (42, 'Chopsuey Chucky', 3983, 63, 85, 1800);
INSERT INTO `pet_list` VALUES (43, 'Amigo Sabotender', 3432, 75, 85, 1200);