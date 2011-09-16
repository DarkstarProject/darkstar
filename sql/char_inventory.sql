-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Ven 24 Juin 2011 à 08:04
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
-- Structure de la table `char_inventory`
--

DROP TABLE IF EXISTS `char_inventory`;
CREATE TABLE IF NOT EXISTS `char_inventory` (
  `charid` int(10) unsigned NOT NULL,
  `location` tinyint(1) unsigned NOT NULL,
  `slot` tinyint(2) unsigned NOT NULL,
  `itemId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `bazaar` int(8) unsigned NOT NULL DEFAULT '0',
  `signature` varchar(12) DEFAULT NULL,
  `currCharges` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `lastUseTime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charid`,`slot`,`location`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=28;