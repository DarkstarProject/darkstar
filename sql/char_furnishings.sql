-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Dim 14 Octobre 2012 à 09:37
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
-- Structure de la table `char_furnishings`
--

DROP TABLE IF EXISTS `char_furnishings`;
CREATE TABLE IF NOT EXISTS `char_furnishings` (
  `charid` int(10) unsigned NOT NULL,
  `slot` tinyint(2) unsigned NOT NULL,
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `col` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `row` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `rotation` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charid`,`slot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
