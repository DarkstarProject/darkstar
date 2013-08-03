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
INSERT INTO `mob_spawn_mods` VALUES(17433009, 1, 15000, 1);
INSERT INTO `mob_spawn_mods` VALUES(17433009, 2, 18000, 1);
INSERT INTO `mob_spawn_mods` VALUES(17433009, 302, 15, 0);
INSERT INTO `mob_spawn_mods` VALUES(17596720, 1, 19000, 1);
INSERT INTO `mob_spawn_mods` VALUES(17596720, 2, 34000, 1);
INSERT INTO `mob_spawn_mods` VALUES(17269106, 1, 15000, 1);
INSERT INTO `mob_spawn_mods` VALUES(17269106, 2, 30545, 1);
INSERT INTO `mob_spawn_mods` VALUES(17485980, 1, 1200, 1);
INSERT INTO `mob_spawn_mods` VALUES(17485980, 2, 1950, 1);
INSERT INTO `mob_spawn_mods` VALUES(17486129, 1, 3600, 1);
INSERT INTO `mob_spawn_mods` VALUES(17486129, 2, 6079, 1);
INSERT INTO `mob_spawn_mods` VALUES(17486031, 1, 1200, 1);
INSERT INTO `mob_spawn_mods` VALUES(17486031, 2, 1903, 1);
INSERT INTO `mob_spawn_mods` VALUES(17228242, 1, 21000, 1);
INSERT INTO `mob_spawn_mods` VALUES(17228242, 2, 31300, 1);
INSERT INTO `mob_spawn_mods` VALUES(17289575, 12, 1, 1);
INSERT INTO `mob_spawn_mods` VALUES(16887889, 12, 1, 1);
INSERT INTO `mob_spawn_mods` VALUES(17297441, 12, 25, 1);
INSERT INTO `mob_spawn_mods` VALUES(17408018, 12, 20, 1);
INSERT INTO `mob_spawn_mods` VALUES(16806227, 12, 1, 1);
INSERT INTO `mob_spawn_mods` VALUES(16896161, 12, 1, 1);
INSERT INTO `mob_spawn_mods` VALUES(16797969, 12, 1, 1);
INSERT INTO `mob_spawn_mods` VALUES(16900314, 12, 1, 1);
INSERT INTO `mob_spawn_mods` VALUES(17309982, 1, 1500, 1);
INSERT INTO `mob_spawn_mods` VALUES(17309982, 2, 18000, 1);
INSERT INTO `mob_spawn_mods` VALUES(17309982, 15, 3128, 1);
INSERT INTO `mob_spawn_mods` VALUES(17309980, 1, 1500, 1);
INSERT INTO `mob_spawn_mods` VALUES(17309980, 2, 29036, 1);
INSERT INTO `mob_spawn_mods` VALUES(17309980, 15, 3855, 1);
INSERT INTO `mob_spawn_mods` VALUES(17309981, 1, 1500, 1);
INSERT INTO `mob_spawn_mods` VALUES(17309981, 2, 28608, 1);
INSERT INTO `mob_spawn_mods` VALUES(17309981, 15, 3855, 1);
INSERT INTO `mob_spawn_mods` VALUES(17309983, 1, 1500, 1);
INSERT INTO `mob_spawn_mods` VALUES(17309983, 2, 28886, 1);
INSERT INTO `mob_spawn_mods` VALUES(17309983, 15, 3855, 1);
INSERT INTO `mob_spawn_mods` VALUES(17236202, 12, 15, 1);
INSERT INTO `mob_spawn_mods` VALUES(17236202, 160, 50, 0);
INSERT INTO `mob_spawn_mods` VALUES(17236202, 169, 10, 0);
INSERT INTO `mob_spawn_mods` VALUES(17236202, 16, 1, 1);
INSERT INTO `mob_spawn_mods` VALUES(17236204, 16, 1, 1);
INSERT INTO `mob_spawn_mods` VALUES(17236204, 12, 15, 1);
INSERT INTO `mob_spawn_mods` VALUES(17236204, 169, 10, 0);
INSERT INTO `mob_spawn_mods` VALUES(17236203, 169, 10, 0);
INSERT INTO `mob_spawn_mods` VALUES(17236203, 12, 15, 1);
INSERT INTO `mob_spawn_mods` VALUES(17236203, 16, 1, 1);
INSERT INTO `mob_spawn_mods` VALUES(17236203, 23, 8, 1);
INSERT INTO `mob_spawn_mods` VALUES(17367080, 33, 30, 1);
INSERT INTO `mob_spawn_mods` VALUES(17367082, 33, 30, 1);
INSERT INTO `mob_spawn_mods` VALUES(17367085, 34, 30, 1);
INSERT INTO `mob_spawn_mods` VALUES(17375263, 34, 30, 1);
INSERT INTO `mob_spawn_mods` VALUES(17375267, 34, 30, 1);
INSERT INTO `mob_spawn_mods` VALUES(17465360, 34, 30, 1);
INSERT INTO `mob_spawn_mods` VALUES(17465360, 33, 30, 1);
INSERT INTO `mob_spawn_mods` VALUES(17465362, 33, 30, 1);
INSERT INTO `mob_spawn_mods` VALUES(17465364, 33, 30, 1);