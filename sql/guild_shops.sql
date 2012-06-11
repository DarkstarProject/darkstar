-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Lun 05 Septembre 2011 à 22:45
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
-- Structure de la table `guild_shops`
--

DROP TABLE IF EXISTS `guild_shops`;
CREATE TABLE IF NOT EXISTS `guild_shops` (
  `guildid` smallint(5) unsigned NOT NULL,
  `itemid` smallint(5) unsigned NOT NULL,
  `min_price` int(10) unsigned NOT NULL DEFAULT '0',
  `max_price` int(10) unsigned NOT NULL DEFAULT '0',
  `quantity` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `daily_increase` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `guild_shops`
--

-- ---------------------------------
-- 513 - Woodworking Guild
--  
-- 
-- ---------------------------------

INSERT INTO `guild_shops` VALUES (513, 688, 15, 28, 240, 150);
INSERT INTO `guild_shops` VALUES (513, 698, 72, 349, 240, 150);
INSERT INTO `guild_shops` VALUES (513, 696, 330, 699, 180, 135);
INSERT INTO `guild_shops` VALUES (513, 695, 120, 132, 240, 150);
INSERT INTO `guild_shops` VALUES (513, 693, 640, 3586, 60, 45);
INSERT INTO `guild_shops` VALUES (513, 705, 7, 18, 240, 150);
INSERT INTO `guild_shops` VALUES (513, 715, 72, 441, 240, 150);
INSERT INTO `guild_shops` VALUES (513, 702, 9600, 11520, 240, 150);
INSERT INTO `guild_shops` VALUES (513, 690, 2045, 10938, 240, 150);
INSERT INTO `guild_shops` VALUES (513, 707, 1723, 9651, 240, 150);
INSERT INTO `guild_shops` VALUES (513, 691, 45, 276, 240, 150);
INSERT INTO `guild_shops` VALUES (513, 708, 45, 276, 240, 150);
INSERT INTO `guild_shops` VALUES (513, 699, 4740, 24016, 240, 150);
INSERT INTO `guild_shops` VALUES (513, 713, 330, 1672, 240, 150);
INSERT INTO `guild_shops` VALUES (514, 880, 57, 349, 240, 150);
INSERT INTO `guild_shops` VALUES (514, 881, 1941, 13398, 240, 150);
INSERT INTO `guild_shops` VALUES (514, 882, 150, 190, 240, 150);
INSERT INTO `guild_shops` VALUES (514, 884, 4850, 12384, 240, 150);
INSERT INTO `guild_shops` VALUES (514, 885, 25584, 69888, 240, 150);
INSERT INTO `guild_shops` VALUES (514, 888, 84, 114, 240, 150);
INSERT INTO `guild_shops` VALUES (514, 889, 298, 1495, 240, 150);
INSERT INTO `guild_shops` VALUES (514, 893, 760, 4141, 240, 150);
INSERT INTO `guild_shops` VALUES (514, 894, 968, 2952, 240, 150);
INSERT INTO `guild_shops` VALUES (514, 896, 2044, 12166, 240, 150);
INSERT INTO `guild_shops` VALUES (514, 897, 1228, 7993, 240, 150);
INSERT INTO `guild_shops` VALUES (514, 864, 72, 203, 240, 150);











