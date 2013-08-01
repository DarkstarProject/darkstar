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
INSERT INTO `mob_family_mods` VALUES(4, 7, 60, 1);
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
INSERT INTO `mob_family_mods` VALUES(240, 10, 1, 1);
INSERT INTO `mob_family_mods` VALUES(169, 10, 1, 1);
INSERT INTO `mob_family_mods` VALUES(190, 10, 2, 1);
INSERT INTO `mob_family_mods` VALUES(189, 10, 2, 1);
INSERT INTO `mob_family_mods` VALUES(46, 10, 3, 1);
INSERT INTO `mob_family_mods` VALUES(252, 10, 3, 1);
INSERT INTO `mob_family_mods` VALUES(47, 10, 3, 1);
INSERT INTO `mob_family_mods` VALUES(245, 10, 4, 1);
INSERT INTO `mob_family_mods` VALUES(216, 10, 4, 1);
INSERT INTO `mob_family_mods` VALUES(133, 10, 5, 1);
INSERT INTO `mob_family_mods` VALUES(184, 10, 5, 1);
INSERT INTO `mob_family_mods` VALUES(59, 10, 5, 1);
INSERT INTO `mob_family_mods` VALUES(253, 10, 6, 1);
INSERT INTO `mob_family_mods` VALUES(254, 10, 6, 1);
INSERT INTO `mob_family_mods` VALUES(212, 10, 7, 1);
INSERT INTO `mob_family_mods` VALUES(362, 10, 7, 1);
INSERT INTO `mob_family_mods` VALUES(169, 11, 15, 1);
INSERT INTO `mob_family_mods` VALUES(358, 11, 15, 1);
INSERT INTO `mob_family_mods` VALUES(110, 3, 50, 1);
INSERT INTO `mob_family_mods` VALUES(111, 3, 50, 1);
INSERT INTO `mob_family_mods` VALUES(121, 242, 20, 0);
INSERT INTO `mob_family_mods` VALUES(52, 242, 20, 0);
INSERT INTO `mob_family_mods` VALUES(358, 16, 1, 1);
INSERT INTO `mob_family_mods` VALUES(327, 16, 1, 1);
INSERT INTO `mob_family_mods` VALUES(334, 16, 1, 1);
INSERT INTO `mob_family_mods` VALUES(337, 16, 1, 1);
INSERT INTO `mob_family_mods` VALUES(360, 16, 1, 1);
INSERT INTO `mob_family_mods` VALUES(359, 16, 1, 1);
INSERT INTO `mob_family_mods` VALUES(258, 36, 60, 1);
INSERT INTO `mob_family_mods` VALUES(258, 34, 25, 1);
INSERT INTO `mob_family_mods` VALUES(217, 23, 5, 1);
INSERT INTO `mob_family_mods` VALUES(274, 23, 5, 1);
INSERT INTO `mob_family_mods` VALUES(273, 23, 5, 1);
INSERT INTO `mob_family_mods` VALUES(234, 37, 1, 1);
INSERT INTO `mob_family_mods` VALUES(72, 29, 10, 0);
INSERT INTO `mob_family_mods` VALUES(72, 69, 20, 0);
INSERT INTO `mob_family_mods` VALUES(57, 3, 50, 1);
INSERT INTO `mob_family_mods` VALUES(72, 3, 50, 1);
INSERT INTO `mob_family_mods` VALUES(140, 3, 50, 1);
INSERT INTO `mob_family_mods` VALUES(141, 3, 50, 1);
INSERT INTO `mob_family_mods` VALUES(207, 3, 50, 1);
INSERT INTO `mob_family_mods` VALUES(255, 3, 50, 1);
INSERT INTO `mob_family_mods` VALUES(253, 3, 50, 1);
INSERT INTO `mob_family_mods` VALUES(194, 3, 50, 1);
INSERT INTO `mob_family_mods` VALUES(271, 3, 50, 1);
INSERT INTO `mob_family_mods` VALUES(135, 4, 4, 1);
INSERT INTO `mob_family_mods` VALUES(193, 14, 704, 1);