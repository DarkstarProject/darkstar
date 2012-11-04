-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Dim 04 Novembre 2012 à 11:43
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
-- Structure de la table `merits`
--

DROP TABLE IF EXISTS `merits`;
CREATE TABLE IF NOT EXISTS `merits` (
  `meritid` smallint(5) unsigned NOT NULL,
  `name` char(25) NOT NULL,
  `upgrade` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `value` smallint(5) NOT NULL DEFAULT '0',
  `jobs` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`meritid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `merits`
--

INSERT INTO `merits` VALUES(64, 'max_hp', 8, 10, 1048575);
INSERT INTO `merits` VALUES(66, 'max_mp', 8, 10, 1048575);
INSERT INTO `merits` VALUES(222, 'guarding_skill', 4, 2, 131074);
