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
  PRIMARY KEY (`familyid`,`modid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=13 PACK_KEYS=1;

--
-- Contenu de la table `mob_family_mods`
--

INSERT INTO `mob_family_mods` VALUES(175, 29, 50);
INSERT INTO `mob_family_mods` VALUES(4, 29, 25);
INSERT INTO `mob_family_mods` VALUES(74, 29, 25);
INSERT INTO `mob_family_mods` VALUES(61, 29, 25);
INSERT INTO `mob_family_mods` VALUES(169, 29, 25);
INSERT INTO `mob_family_mods` VALUES(110, 29, 13);
INSERT INTO `mob_family_mods` VALUES(111, 29, 13);
INSERT INTO `mob_family_mods` VALUES(171, 29, 13);
INSERT INTO `mob_family_mods` VALUES(139, 31, 10);
INSERT INTO `mob_family_mods` VALUES(176, 31, 10);
INSERT INTO `mob_family_mods` VALUES(47, 240, 2);
INSERT INTO `mob_family_mods` VALUES(46, 240, 2);
INSERT INTO `mob_family_mods` VALUES(4, 244, 2);