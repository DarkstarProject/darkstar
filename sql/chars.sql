-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Sam 31 Décembre 2011 à 22:01
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
-- Structure de la table `chars`
--

DROP TABLE IF EXISTS `chars`;
CREATE TABLE IF NOT EXISTS `chars` (
  `charid` int(10) unsigned NOT NULL,
  `accid` int(10) unsigned NOT NULL,
  `charname` varchar(15) NOT NULL,
  `pos_zone` tinyint(3) unsigned NOT NULL,
  `pos_prevzone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pos_rot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pos_x` float(7,3) NOT NULL DEFAULT '0.000',
  `pos_y` float(7,3) NOT NULL DEFAULT '0.000',
  `pos_z` float(7,3) NOT NULL DEFAULT '0.000',
  `boundary` smallint(5) unsigned NOT NULL DEFAULT '0',
  `home_zone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `home_rot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `home_x` float(7,3) NOT NULL DEFAULT '0.000',
  `home_y` float(7,3) NOT NULL DEFAULT '0.000',
  `home_z` float(7,3) NOT NULL DEFAULT '0.000',
  `nation` tinyint(1) unsigned NOT NULL,
  `rankPoints` int(10) unsigned NOT NULL DEFAULT '0',
  `rankSandoria` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `rankBastok` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `rankWindurst` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `fameSandoria` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fameBastok` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fameWindurst` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fameNorg` smallint(5) unsigned NOT NULL DEFAULT '0',
  `missions` blob,
  `quests` blob,
  `keyitems` blob,
  `spells` blob,
  `zones` blob,
  `inventory` tinyint(2) unsigned NOT NULL DEFAULT '30',
  `safe` tinyint(2) unsigned NOT NULL DEFAULT '50',
  `storage` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `locker` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `satchel` tinyint(2) unsigned NOT NULL DEFAULT '30',
  `sack` tinyint(2) unsigned NOT NULL DEFAULT '30',
  PRIMARY KEY (`charid`),
  FULLTEXT KEY `charname` (`charname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
