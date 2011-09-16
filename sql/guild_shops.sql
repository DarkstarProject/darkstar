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
-- 0201
-- Beugungel 
-- Carpenters' Landing
-- ---------------------------------

INSERT INTO `guild_shops` VALUES (513, 1657, 75, 75, 240, 150);
INSERT INTO `guild_shops` VALUES (513, 1021, 312, 312, 240, 120);
INSERT INTO `guild_shops` VALUES (513, 688, 12, 12, 240, 150);
INSERT INTO `guild_shops` VALUES (513, 698, 60, 60, 240, 150);
INSERT INTO `guild_shops` VALUES (513, 696, 330, 330, 180, 135);
INSERT INTO `guild_shops` VALUES (513, 695, 120, 120, 240, 150);
INSERT INTO `guild_shops` VALUES (513, 693, 640, 3142, 60, 45);
