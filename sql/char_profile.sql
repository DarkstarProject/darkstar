-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Dim 21 Octobre 2012 à 16:26
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
-- Structure de la table `char_profile`
--

DROP TABLE IF EXISTS `char_profile`;
CREATE TABLE IF NOT EXISTS `char_profile` (
  `charid` int(10) unsigned NOT NULL,
  `rank_points` int(10) unsigned NOT NULL DEFAULT '0',
  `rank_sandoria` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `rank_bastok` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `rank_windurst` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `fame_sandoria` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_bastok` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_windurst` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_norg` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_jeuno` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_aby_konschtat` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_aby_tahrongi` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_aby_latheine` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_aby_misareaux` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_aby_vunkerl` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_aby_attohwa` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_aby_altepa` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_aby_grauberg` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_aby_uleguerand` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_adoulin` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
