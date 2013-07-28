-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Dim 07 Octobre 2012 à 09:39
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
-- Structure de la table `mob_spawn_mods`
--

DROP TABLE IF EXISTS `mob_spawn_mods`;
CREATE TABLE IF NOT EXISTS `mob_spawn_mods` (
  `mobid` int(10) unsigned NOT NULL,
  `modid` smallint(5) unsigned NOT NULL,
  `value` smallint(5) NOT NULL DEFAULT '0',
  `type` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mobid`,`modid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=13 PACK_KEYS=1;

--
-- Contenu de la table `mob_spawn_mods`
--

INSERT INTO `mob_spawn_mods` VALUES(17371142, 16, -1, 1);
INSERT INTO `mob_spawn_mods` VALUES(17371142, 1, 20, 1);
INSERT INTO `mob_spawn_mods` VALUES(17371142, 2, 33, 1);
INSERT INTO `mob_spawn_mods` VALUES(17371143, 16, 2, 1);
INSERT INTO `mob_spawn_mods` VALUES(17371143, 1, 20, 1);
INSERT INTO `mob_spawn_mods` VALUES(17371143, 2, 25, 1);