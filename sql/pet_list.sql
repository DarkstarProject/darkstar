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
  `element` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`petid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Contenu de la table `pet_list`
--

INSERT INTO `pet_list` VALUES (0, 'FireSpirit', 1341, 1, 99, 0, 1);
INSERT INTO `pet_list` VALUES (1, 'IceSpirit', 2043, 1, 99, 0, 5);
INSERT INTO `pet_list` VALUES (2, 'AirSpirit', 71, 1, 99, 0, 4);
INSERT INTO `pet_list` VALUES (3, 'EarthSpirit', 1160, 1, 99, 0, 2);
INSERT INTO `pet_list` VALUES (4, 'ThunderSpirit', 3912, 1, 99, 0, 6);
INSERT INTO `pet_list` VALUES (5, 'WaterSpirit', 4309, 1, 99, 0, 3);
INSERT INTO `pet_list` VALUES (6, 'LightSpirit', 2413, 1, 99, 0, 7);
INSERT INTO `pet_list` VALUES (7, 'DarkSpirit', 913, 1, 99, 0, 8);
INSERT INTO `pet_list` VALUES (8, 'Carbuncle', 4588, 1, 99, 0, 7);
INSERT INTO `pet_list` VALUES (9, 'Fenrir', 4581, 1, 99, 0, 8);
INSERT INTO `pet_list` VALUES (10, 'Ifrit', 4582, 1, 99, 0, 1);
INSERT INTO `pet_list` VALUES (11, 'Titan', 4583, 1, 99, 0, 2);
INSERT INTO `pet_list` VALUES (12, 'Leviathan', 4584, 1, 99, 0, 3);
INSERT INTO `pet_list` VALUES (13, 'Garuda', 4585, 1, 99, 0, 4);
INSERT INTO `pet_list` VALUES (14, 'Shiva', 4586, 1, 99, 0, 5);
INSERT INTO `pet_list` VALUES (15, 'Ramuh', 4587, 1, 99, 0, 6);
INSERT INTO `pet_list` VALUES (16, 'Diabolos', 4590, 1, 99, 0, 8);
INSERT INTO `pet_list` VALUES (17, 'Alexander', 4589, 1, 99, 0, 7);
INSERT INTO `pet_list` VALUES (18, 'Odin', 4591, 1, 99, 0, 8);
INSERT INTO `pet_list` VALUES (19, 'Atomos', 1, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (20, 'CaitSith', 1, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (21, 'SheepFamiliar', 696, 23, 35, 3600, 0);
INSERT INTO `pet_list` VALUES (22, 'HareFamiliar', 4256, 23, 35, 5400, 0);
INSERT INTO `pet_list` VALUES (23, 'CrabFamiliar', 743, 23, 55, 1800, 0);
INSERT INTO `pet_list` VALUES (24, 'CourierCarrie', 1, 23, 75, 1800, 0);
INSERT INTO `pet_list` VALUES (25, 'Homunculus', 97, 23, 75, 3600, 0);
INSERT INTO `pet_list` VALUES (26, 'FlytrapFamiliar', 421, 28, 40, 3600, 0);
INSERT INTO `pet_list` VALUES (27, 'TigerFamiliar', 4050, 28, 40, 3600, 0);
INSERT INTO `pet_list` VALUES (28, 'FlowerpotBill', 4482, 28, 40, 3600, 0);
INSERT INTO `pet_list` VALUES (29, 'EftFamiliar', 1181, 33, 45, 3600, 0);
INSERT INTO `pet_list` VALUES (30, 'LizardFamiliar', 1956, 33, 45, 3600, 0);
INSERT INTO `pet_list` VALUES (31, 'MayflyFamiliar', 1454, 33, 45, 3600, 0);
INSERT INTO `pet_list` VALUES (32, 'FunguarFamiliar', 1271, 33, 65, 3600, 0);
INSERT INTO `pet_list` VALUES (33, 'BeetleFamiliar', 512, 38, 45, 3600, 0);
INSERT INTO `pet_list` VALUES (34, 'AntlionFamiliar', 3982, 38, 50, 3600, 0);
INSERT INTO `pet_list` VALUES (35, 'MiteFamiliar', 1040, 43, 55, 3600, 0);
INSERT INTO `pet_list` VALUES (36, 'LullabyMelodia', 539, 43, 55, 3600, 0);
INSERT INTO `pet_list` VALUES (37, 'KeenearedSteffi', 2107, 43, 55, 5400, 0);
INSERT INTO `pet_list` VALUES (38, 'FlowerpotBen', 2762, 51, 63, 3600, 0);
INSERT INTO `pet_list` VALUES (39, 'SaberSiravarde', 4079, 51, 63, 3600, 0);
INSERT INTO `pet_list` VALUES (40, 'ColdbloodComo', 2311, 53, 65, 3600, 0);
INSERT INTO `pet_list` VALUES (41, 'ShellbusterOrob', 1099, 53, 65, 3600, 0);
INSERT INTO `pet_list` VALUES (42, 'VoraciousAudrey', 2556, 53, 75, 3600, 0);
INSERT INTO `pet_list` VALUES (43, 'AmbusherAllie', 3848, 58, 75, 3600, 0);
INSERT INTO `pet_list` VALUES (44, 'LifedrinkerLars', 307, 63, 75, 3600, 0);
INSERT INTO `pet_list` VALUES (45, 'PanzerGalahad', 3755, 63, 75, 3600, 0);
INSERT INTO `pet_list` VALUES (46, 'ChopsueyChucky', 3983, 63, 85, 1800, 0);
INSERT INTO `pet_list` VALUES (47, 'AmigoSabotender', 3432, 75, 85, 1200, 0);
INSERT INTO `pet_list` VALUES (48, 'Wyvern', 4592, 1, 99, 0, 0);