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
  `family_id` smallint(3) unsigned NOT NULL,
  `mob_anim_id` smallint(4) unsigned NOT NULL,
  `mob_skill_name` char(20) CHARACTER SET latin1 NOT NULL,
  `mob_skill_aoe` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `mob_skill_distance` float(3,1) NOT NULL DEFAULT '6.0',
  `mob_anim_time` smallint(4) unsigned NOT NULL DEFAULT '2000',
  `mob_prepare_time` smallint(4) unsigned NOT NULL DEFAULT '1500',
  `mob_valid_targets` smallint(4) unsigned NOT NULL DEFAULT '4',
  `mob_skill_flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mob_skill_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `mob_skill`
--
INSERT INTO `mob_skill` VALUES(334, 133, 334, 'Goblin_Rush', 0, 6.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES(335, 133, 335, 'Bomb_Toss', 1, 7.0, 2000, 1500, 4, 0);
INSERT INTO `mob_skill` VALUES(336, 133, 336, 'Bomb_Toss', 1, 7.0, 2000, 1500, 4, 0);
