-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Ven 24 Juin 2011 à 08:10
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
-- Structure de la table `exp_table`
--

DROP TABLE IF EXISTS `exp_table`;
CREATE TABLE IF NOT EXISTS `exp_table` (
  `level` tinyint(2) NOT NULL,
  `r1` smallint(4) unsigned NOT NULL DEFAULT '0',
  `r2` smallint(4) unsigned NOT NULL DEFAULT '0',
  `r3` smallint(4) unsigned NOT NULL DEFAULT '0',
  `r4` smallint(4) unsigned NOT NULL DEFAULT '0',
  `r5` smallint(4) unsigned NOT NULL DEFAULT '0',
  `r6` smallint(4) unsigned NOT NULL DEFAULT '0',
  `r7` smallint(4) unsigned NOT NULL DEFAULT '0',
  `r8` smallint(4) unsigned NOT NULL DEFAULT '0',
  `r9` smallint(4) unsigned NOT NULL DEFAULT '0',
  `r10` smallint(4) unsigned NOT NULL DEFAULT '0',
  `r11` smallint(4) unsigned NOT NULL DEFAULT '0',
  `r12` smallint(4) unsigned NOT NULL DEFAULT '0',
  `r13` smallint(4) unsigned NOT NULL DEFAULT '0',
  `r14` smallint(4) unsigned NOT NULL DEFAULT '0',
  `r15` smallint(4) unsigned NOT NULL DEFAULT '0',
  `r16` smallint(4) unsigned NOT NULL DEFAULT '0',
  `r17` smallint(4) unsigned NOT NULL DEFAULT '0',
  `r18` smallint(4) unsigned NOT NULL DEFAULT '0',
  `r19` smallint(4) unsigned NOT NULL DEFAULT '0',
  `r20` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=65;

--
-- Contenu de la table `exp_table`
--

INSERT INTO `exp_table` VALUES (15, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800);
INSERT INTO `exp_table` VALUES (14, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 720, 720, 720, 640, 640, 640, 640, 640);
INSERT INTO `exp_table` VALUES (13, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 630, 630, 630, 580, 580, 580, 580, 580);
INSERT INTO `exp_table` VALUES (12, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 580, 580, 580, 520, 520, 520, 520, 520);
INSERT INTO `exp_table` VALUES (11, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 580, 530, 530, 530, 460, 460, 460, 460, 460);
INSERT INTO `exp_table` VALUES (10, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 800, 530, 480, 480, 480, 430, 430, 430, 430, 430);
INSERT INTO `exp_table` VALUES (9, 800, 800, 800, 800, 800, 800, 600, 600, 600, 600, 530, 480, 440, 440, 440, 400, 400, 400, 400, 400);
INSERT INTO `exp_table` VALUES (8, 600, 600, 600, 600, 600, 600, 550, 550, 550, 530, 480, 430, 400, 400, 400, 380, 380, 380, 380, 380);
INSERT INTO `exp_table` VALUES (7, 550, 550, 550, 550, 550, 550, 500, 500, 500, 470, 430, 380, 360, 360, 360, 340, 340, 340, 340, 340);
INSERT INTO `exp_table` VALUES (6, 450, 450, 450, 450, 450, 450, 450, 450, 450, 400, 370, 330, 320, 320, 320, 300, 300, 300, 300, 300);
INSERT INTO `exp_table` VALUES (5, 350, 350, 350, 350, 350, 350, 400, 400, 400, 340, 310, 280, 280, 280, 280, 260, 260, 260, 260, 260);
INSERT INTO `exp_table` VALUES (4, 200, 200, 200, 200, 200, 200, 300, 300, 300, 270, 250, 240, 240, 240, 240, 230, 230, 230, 230, 230);
INSERT INTO `exp_table` VALUES (3, 160, 160, 160, 160, 160, 160, 200, 200, 200, 200, 200, 200, 200, 200, 200, 220, 220, 220, 220, 220);
INSERT INTO `exp_table` VALUES (2, 140, 140, 140, 140, 140, 140, 150, 150, 150, 150, 150, 160, 160, 160, 160, 180, 180, 180, 180, 180);
INSERT INTO `exp_table` VALUES (1, 120, 120, 120, 120, 120, 120, 125, 125, 125, 125, 125, 130, 130, 130, 130, 140, 140, 140, 140, 140);
INSERT INTO `exp_table` VALUES (0, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100);
INSERT INTO `exp_table` VALUES (-1, 90, 90, 90, 90, 90, 90, 93, 95, 95, 95, 96, 96, 96, 96, 96, 97, 97, 97, 98, 98);
INSERT INTO `exp_table` VALUES (-2, 80, 80, 80, 80, 80, 80, 86, 86, 90, 90, 93, 93, 93, 93, 94, 95, 95, 95, 96, 96);
INSERT INTO `exp_table` VALUES (-3, 70, 70, 75, 75, 75, 75, 75, 80, 86, 86, 88, 88, 91, 91, 92, 92, 92, 92, 93, 93);
INSERT INTO `exp_table` VALUES (-4, 65, 65, 70, 70, 70, 70, 72, 76, 80, 80, 82, 84, 86, 86, 90, 90, 90, 90, 90, 90);
INSERT INTO `exp_table` VALUES (-5, 60, 60, 65, 65, 65, 65, 68, 72, 76, 76, 78, 80, 83, 83, 86, 86, 86, 86, 87, 87);
INSERT INTO `exp_table` VALUES (-6, 50, 50, 60, 60, 60, 60, 65, 70, 72, 72, 74, 76, 80, 80, 83, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-7, 0, 40, 50, 50, 55, 55, 60, 65, 68, 68, 70, 72, 76, 77, 80, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-8, 0, 30, 40, 40, 50, 50, 55, 60, 65, 65, 68, 68, 73, 75, 77, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-9, 0, 0, 30, 30, 40, 40, 50, 55, 60, 60, 65, 65, 70, 72, 75, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-10, 0, 0, 0, 0, 30, 30, 40, 50, 55, 56, 60, 62, 66, 70, 73, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-11, 0, 0, 0, 0, 0, 0, 30, 40, 50, 53, 56, 58, 63, 66, 70, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-12, 0, 0, 0, 0, 0, 0, 0, 30, 40, 50, 53, 56, 60, 63, 66, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-13, 0, 0, 0, 0, 0, 0, 0, 0, 30, 40, 50, 53, 56, 60, 63, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 40, 50, 53, 56, 60, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 40, 50, 53, 56, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 40, 50, 53, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 40, 50, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 40, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);