-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Ven 03 Février 2012 à 22:54
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
-- Structure de la table `mob_skill`
--

DROP TABLE IF EXISTS `mob_skill`;
CREATE TABLE IF NOT EXISTS `mob_skill` (
  `mob_skill_id` smallint(4) unsigned NOT NULL,
  `mob_skill_name` char(20) CHARACTER SET latin1 NOT NULL,
  `family_id` smallint(3) unsigned NOT NULL,
  `mob_skill_type` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `mob_skill_element` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `mob_skill_critical` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `mob_skill_num_hit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `mob_skill_aoe` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `mob_skill_distance` float(3,1) NOT NULL DEFAULT '0.0',
  `mob_skill_flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `mob_skill_effect` smallint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`mob_skill_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `mob_skill`
--

INSERT INTO `mob_skill` VALUES(1, 'foot_kick', 206, 1, 0, 1, 1, 0, 3.4, 2, 0);
INSERT INTO `mob_skill` VALUES(2, 'Dust_Cloud', 206, 3, 2, 0, 0, 1, 10.0, 0, 5);
INSERT INTO `mob_skill` VALUES(3, 'Whirl_Claws', 206, 1, 0, 0, 2, 3, 5.0, 4, 0);
INSERT INTO `mob_skill` VALUES(44, 'head_butt', 178, 0, 0, 0, 0, 0, 0.0, 0, 0);
INSERT INTO `mob_skill` VALUES(45, 'dream_flower', 178, 0, 0, 0, 0, 0, 0.0, 0, 0);
INSERT INTO `mob_skill` VALUES(46, 'wild_oats', 178, 0, 0, 0, 0, 0, 0.0, 0, 0);
INSERT INTO `mob_skill` VALUES(48, 'photosynthesis', 178, 0, 0, 0, 0, 0, 0.0, 0, 0);
INSERT INTO `mob_skill` VALUES(49, 'leaf_dagger', 178, 0, 0, 0, 0, 0, 0.0, 0, 0);
INSERT INTO `mob_skill` VALUES(50, 'scream', 178, 0, 0, 0, 0, 0, 0.0, 0, 0);
INSERT INTO `mob_skill` VALUES(168, 'Full-force_Blow', 258, 1, 0, 0, 1, 0, 3.4, 2, 0);
INSERT INTO `mob_skill` VALUES(169, 'Gastric_Bomb', 258, 3, 3, 0, 0, 0, 26.8, 0, 147);
INSERT INTO `mob_skill` VALUES(170, 'Sandspin', 258, 3, 2, 0, 0, 3, 26.8, 0, 146);
INSERT INTO `mob_skill` VALUES(171, 'Tremors', 258, 3, 2, 0, 0, 3, 15.8, 8, 137);
INSERT INTO `mob_skill` VALUES(172, 'MP_Absorption', 258, 3, 0, 0, 0, 0, 3.4, 0, 0);
INSERT INTO `mob_skill` VALUES(173, 'Sound_Vacuum', 258, 6, 0, 0, 0, 0, 15.8, 0, 6);
INSERT INTO `mob_skill` VALUES(334, 'goblin_rush', 133, 0, 0, 0, 0, 0, 0.0, 0, NULL);
INSERT INTO `mob_skill` VALUES(335, 'bomb_toss', 133, 0, 0, 0, 0, 0, 0.0, 0, NULL);
INSERT INTO `mob_skill` VALUES(336, 'bomb_toss', 133, 0, 0, 0, 0, 0, 0.0, 0, NULL);
