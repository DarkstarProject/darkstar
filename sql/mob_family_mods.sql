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
-- Structure de la table `mob_family_mods`
--

DROP TABLE IF EXISTS `mob_family_mods`;
CREATE TABLE IF NOT EXISTS `mob_family_mods` (
  `familyid` smallint(5) unsigned NOT NULL,
  `modid` smallint(5) unsigned NOT NULL,
  `value` smallint(5) NOT NULL DEFAULT '0',
  `type` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`familyid`,`modid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=13 PACK_KEYS=1;

--
-- Contenu de la table `mob_family_mods`
--

INSERT INTO `mob_family_mods` VALUES(175, 29, 50, 0);
INSERT INTO `mob_family_mods` VALUES(4, 29, 25, 0);
INSERT INTO `mob_family_mods` VALUES(74, 29, 25, 0);
INSERT INTO `mob_family_mods` VALUES(61, 29, 25, 0);
INSERT INTO `mob_family_mods` VALUES(169, 29, 25, 0);
INSERT INTO `mob_family_mods` VALUES(110, 29, 13, 0);
INSERT INTO `mob_family_mods` VALUES(111, 29, 13, 0);
INSERT INTO `mob_family_mods` VALUES(171, 29, 13, 0);
INSERT INTO `mob_family_mods` VALUES(139, 31, 10, 0);
INSERT INTO `mob_family_mods` VALUES(176, 31, 10, 0);
INSERT INTO `mob_family_mods` VALUES(47, 240, 2, 0);
INSERT INTO `mob_family_mods` VALUES(46, 240, 2, 0);
INSERT INTO `mob_family_mods` VALUES(4, 244, 2, 0);
INSERT INTO `mob_family_mods` VALUES(193, 3, 40, 1);
INSERT INTO `mob_family_mods` VALUES(34, 3, 100, 1);
INSERT INTO `mob_family_mods` VALUES(267, 4, 20, 1);
INSERT INTO `mob_family_mods` VALUES(87, 4, 18, 1);
INSERT INTO `mob_family_mods` VALUES(87, 5, 10, 1);
INSERT INTO `mob_family_mods` VALUES(240, 10, 169, 1);
INSERT INTO `mob_family_mods` VALUES(169, 10, 240, 1);
INSERT INTO `mob_family_mods` VALUES(190, 10, 189, 1);
INSERT INTO `mob_family_mods` VALUES(189, 10, 190, 1);
INSERT INTO `mob_family_mods` VALUES(46, 10, 47, 1);
INSERT INTO `mob_family_mods` VALUES(46, 11, 253, 1);
INSERT INTO `mob_family_mods` VALUES(47, 10, 46, 1);
INSERT INTO `mob_family_mods` VALUES(245, 10, 216, 1);
INSERT INTO `mob_family_mods` VALUES(216, 10, 245, 1);
INSERT INTO `mob_family_mods` VALUES(133, 10, 184, 1);
INSERT INTO `mob_family_mods` VALUES(133, 11, 59, 1);
INSERT INTO `mob_family_mods` VALUES(184, 10, 133, 1);
INSERT INTO `mob_family_mods` VALUES(184, 11, 59, 1);
INSERT INTO `mob_family_mods` VALUES(59, 10, 133, 1);
INSERT INTO `mob_family_mods` VALUES(59, 11, 184, 1);
INSERT INTO `mob_family_mods` VALUES(253, 10, 254, 1);
INSERT INTO `mob_family_mods` VALUES(254, 10, 253, 1);
INSERT INTO `mob_family_mods` VALUES(252, 10, 46, 1);
INSERT INTO `mob_family_mods` VALUES(359, 10, 4, 1);
INSERT INTO `mob_family_mods` VALUES(358, 10, 4, 1);
INSERT INTO `mob_family_mods` VALUES(4, 10, 359, 1);
INSERT INTO `mob_family_mods` VALUES(4, 11, 358, 1);
INSERT INTO `mob_family_mods` VALUES(92, 10, 327, 1);
INSERT INTO `mob_family_mods` VALUES(327, 10, 92, 1);
INSERT INTO `mob_family_mods` VALUES(93, 10, 334, 1);
INSERT INTO `mob_family_mods` VALUES(334, 10, 93, 1);
INSERT INTO `mob_family_mods` VALUES(94, 10, 337, 1);
INSERT INTO `mob_family_mods` VALUES(95, 10, 360, 1);
INSERT INTO `mob_family_mods` VALUES(360, 10, 95, 1);
INSERT INTO `mob_family_mods` VALUES(362, 10, 212, 1);
INSERT INTO `mob_family_mods` VALUES(212, 10, 362, 1);