-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Jeu 05 Janvier 2012 à 14:39
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
-- Structure de la table `transport`
--

DROP TABLE IF EXISTS `transport`;
CREATE TABLE IF NOT EXISTS `transport` (
  `id` tinyint(3) unsigned NOT NULL,
  `name` tinytext NOT NULL,
  `transport` int(10) unsigned NOT NULL DEFAULT '0',
  `door` int(10) unsigned NOT NULL DEFAULT '0',
  `dock_x` float(7,3) NOT NULL DEFAULT '0.000',
  `dock_y` float(7,3) NOT NULL DEFAULT '0.000',
  `dock_z` float(7,3) NOT NULL DEFAULT '0.000',
  `dock_rot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `boundary` smallint(5) unsigned NOT NULL DEFAULT '0',
  `anim_arrive` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `anim_depart` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `time_offset` smallint(5) unsigned NOT NULL DEFAULT '0',
  `time_interval` smallint(5) unsigned NOT NULL DEFAULT '0',
  `time_anim_arrive` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `time_waiting` smallint(5) unsigned NOT NULL DEFAULT '0',
  `time_anim_depart` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `zone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `transport`
--

INSERT INTO `transport` VALUES (1, 'Kazham-Jeuno_Airship', 17801316, 17801315, -4.000, -3.497, 32.125, 128, 512, 18, 19, 90, 360, 20, 50, 20, 226);
INSERT INTO `transport` VALUES (2, 'Jeuno-Kazham_Airship', 17784932, 17784931, -4.000, 10.450, 117.000, 64, 477, 24, 25, 270, 360, 20, 50, 20, 226);
INSERT INTO `transport` VALUES (3, 'Jeuno-Sandoria_Airship', 17784932, 17784928, -68.000, 10.450, 117.000, 64, 474, 18, 19, 0, 360, 12, 60, 12, 223);
INSERT INTO `transport` VALUES (4, 'Jeuno-Windurst_Airship', 17784932, 17784930, -6.000, 10.450, -117.000, 192, 476, 22, 23, 90, 360, 12, 60, 12, 225);
INSERT INTO `transport` VALUES (5, 'Jeuno-Bastok_Airship', 17784932, 17784929, -70.000, 10.450, -117.000, 192, 475, 20, 21, 180, 360, 12, 60, 16, 224);
INSERT INTO `transport` VALUES (6, 'Sandoria-Jeuno_Airship', 17727593, 17727590, 20.000, -2.000, 44.000, 64, 369, 18, 19, 180, 360, 12, 60, 16, 223);
INSERT INTO `transport` VALUES (7, 'Windurst-Jeuno_Airship', 17760415, 17760414, 242.281, -3.522, 61.994, 96, 416, 18, 19, 270, 360, 18, 60, 14, 225);
INSERT INTO `transport` VALUES (8, 'Bastok-Jeuno_Airship', 17743967, 17743961, -36.458, 6.365, -77.322, 128, 315, 18, 19, 0, 360, 14, 60, 16, 224);
