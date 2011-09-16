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