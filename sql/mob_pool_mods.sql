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
-- Structure de la table `mob_pool_mods`
--

DROP TABLE IF EXISTS `mob_pool_mods`;
CREATE TABLE IF NOT EXISTS `mob_pool_mods` (
  `poolid` smallint(5) unsigned NOT NULL,
  `modid` smallint(5) unsigned NOT NULL,
  `value` smallint(5) NOT NULL DEFAULT '0',
  `type` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`poolid`,`modid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=13 PACK_KEYS=1;

--
-- Contenu de la table `mob_pool_mods`
--

INSERT INTO `mob_pool_mods` VALUES(519, 160, -50, 0);
INSERT INTO `mob_pool_mods` VALUES(532, 160, -50, 0);
INSERT INTO `mob_pool_mods` VALUES(676, 160, -50, 0);
INSERT INTO `mob_pool_mods` VALUES(2643, 160, -50, 0);
INSERT INTO `mob_pool_mods` VALUES(2647, 160, -50, 0);
INSERT INTO `mob_pool_mods` VALUES(733, 302, 5, 0);
INSERT INTO `mob_pool_mods` VALUES(2677, 288, 55, 0);
INSERT INTO `mob_pool_mods` VALUES(21, 29, 100, 0);
INSERT INTO `mob_pool_mods` VALUES(2156, 370, 30, 0);
INSERT INTO `mob_pool_mods` VALUES(2262, 370, 125, 0);
INSERT INTO `mob_pool_mods` VALUES(4261, 370, 125, 0);
INSERT INTO `mob_pool_mods` VALUES(4261, 29, 50, 0);
INSERT INTO `mob_pool_mods` VALUES(2420, 302, 10, 0);
INSERT INTO `mob_pool_mods` VALUES(1648, 224, 5, 0);
INSERT INTO `mob_pool_mods` VALUES(2790, 244, 7, 0);
INSERT INTO `mob_pool_mods` VALUES(2790, 240, 7, 0);
INSERT INTO `mob_pool_mods` VALUES(2790, 168, 50, 0);
INSERT INTO `mob_pool_mods` VALUES(3549, 370, 50, 0);
INSERT INTO `mob_pool_mods` VALUES(1648, 17, 1, 1);
INSERT INTO `mob_pool_mods` VALUES(3549, 1, 19000, 1);
INSERT INTO `mob_pool_mods` VALUES(3549, 2, 34000, 1);
INSERT INTO `mob_pool_mods` VALUES(3376, 1, 15000, 1);
INSERT INTO `mob_pool_mods` VALUES(3376, 2, 30545, 1);
INSERT INTO `mob_pool_mods` VALUES(3916, 370, 25, 0);
INSERT INTO `mob_pool_mods` VALUES(3916, 29, 50, 0);
INSERT INTO `mob_pool_mods` VALUES(3796, 21, 97, 1);
INSERT INTO `mob_pool_mods` VALUES(4396, 16, 1, 1);