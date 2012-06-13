-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Lun 05 Septembre 2011 à 22:45
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
-- Structure de la table `guild_shops`
--

DROP TABLE IF EXISTS `guild_shops`;
CREATE TABLE IF NOT EXISTS `guild_shops` (
  `guildid` smallint(5) unsigned NOT NULL,
  `itemid` smallint(5) unsigned NOT NULL,
  `min_price` int(10) unsigned NOT NULL DEFAULT '0',
  `max_price` int(10) unsigned NOT NULL DEFAULT '0',
  `quantity` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `daily_increase` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `guild_shops`
--

-- Note by Gamer7542: Prices for each guild are a combination of 
-- price ranges listed on multiple wiki pages and actual
-- screenshots taken from retail during the month of June, 2012.

-- ---------------------------------
-- 513 - Woodworking Guild
-- 514 - Bonecrafting Guild 
-- 515 - Windurst Clothcrafting Guild
-- 516 - Selbina Clothcrafting Guild
-- 517 - Windurst Fishing Guild 
-- 518 - Bibiki Bay Fishing Guild
-- 519 - Boat Routes Fishing Guilds
-- 520 - Selbina Fishing Guild
-- 521 - Alchemy Guild
-- ---------------------------------

INSERT INTO `guild_shops` VALUES (513, 688, 15, 28, 240, 150);
INSERT INTO `guild_shops` VALUES (513, 698, 72, 349, 240, 150);
INSERT INTO `guild_shops` VALUES (513, 696, 330, 699, 180, 135);
INSERT INTO `guild_shops` VALUES (513, 695, 120, 132, 240, 150);
INSERT INTO `guild_shops` VALUES (513, 693, 640, 3586, 60, 45);
INSERT INTO `guild_shops` VALUES (513, 705, 7, 18, 240, 150);
INSERT INTO `guild_shops` VALUES (513, 715, 72, 441, 240, 150);
INSERT INTO `guild_shops` VALUES (513, 702, 9600, 11520, 240, 150);
INSERT INTO `guild_shops` VALUES (513, 690, 2045, 10938, 240, 150);
INSERT INTO `guild_shops` VALUES (513, 707, 1723, 9651, 240, 150);
INSERT INTO `guild_shops` VALUES (513, 691, 45, 276, 240, 150);
INSERT INTO `guild_shops` VALUES (513, 708, 45, 276, 240, 150);
INSERT INTO `guild_shops` VALUES (513, 699, 4740, 24016, 240, 150);
INSERT INTO `guild_shops` VALUES (513, 713, 330, 1672, 240, 150);
INSERT INTO `guild_shops` VALUES (514, 880, 57, 349, 240, 150);
INSERT INTO `guild_shops` VALUES (514, 881, 1941, 13398, 240, 150);
INSERT INTO `guild_shops` VALUES (514, 882, 150, 190, 240, 150);
INSERT INTO `guild_shops` VALUES (514, 884, 4850, 12384, 240, 150);
INSERT INTO `guild_shops` VALUES (514, 885, 25584, 69888, 240, 150);
INSERT INTO `guild_shops` VALUES (514, 888, 84, 114, 240, 150);
INSERT INTO `guild_shops` VALUES (514, 889, 298, 1495, 240, 150);
INSERT INTO `guild_shops` VALUES (514, 893, 760, 4141, 240, 150);
INSERT INTO `guild_shops` VALUES (514, 894, 968, 2952, 240, 150);
INSERT INTO `guild_shops` VALUES (514, 896, 2044, 12166, 240, 150);
INSERT INTO `guild_shops` VALUES (514, 897, 1228, 7993, 240, 150);
INSERT INTO `guild_shops` VALUES (514, 864, 72, 203, 240, 150);
INSERT INTO `guild_shops` VALUES (515, 833, 15, 22, 240, 150);
INSERT INTO `guild_shops` VALUES (515, 834, 80, 200, 240, 150);
INSERT INTO `guild_shops` VALUES (515, 835, 187, 1000, 240, 150);
INSERT INTO `guild_shops` VALUES (515, 832, 675, 1620, 240, 150);
INSERT INTO `guild_shops` VALUES (515, 839, 137, 870, 240, 150);
INSERT INTO `guild_shops` VALUES (515, 817, 45, 240, 240, 150);
INSERT INTO `guild_shops` VALUES (515, 818, 120, 768, 240, 150);
INSERT INTO `guild_shops` VALUES (515, 819, 750, 4600, 240, 600);
INSERT INTO `guild_shops` VALUES (515, 820, 2700, 3312, 240, 100);
INSERT INTO `guild_shops` VALUES (515, 816, 596, 3540, 240, 150);
INSERT INTO `guild_shops` VALUES (515, 822, 600, 4480, 240, 150);
INSERT INTO `guild_shops` VALUES (515, 823, 18240, 18240, 240, 150);
INSERT INTO `guild_shops` VALUES (515, 821, 144144, 144144, 240, 150);
INSERT INTO `guild_shops` VALUES (515, 824, 240, 588, 240, 150);
INSERT INTO `guild_shops` VALUES (515, 825, 480, 2944, 240, 150);
INSERT INTO `guild_shops` VALUES (515, 826, 8040, 8040, 240, 150);
INSERT INTO `guild_shops` VALUES (515, 827, 53568, 53568, 240, 150);
INSERT INTO `guild_shops` VALUES (515, 841, 36, 200, 240, 150);
INSERT INTO `guild_shops` VALUES (516, 833, 15, 22, 240, 150);
INSERT INTO `guild_shops` VALUES (516, 835, 187, 1000, 240, 150);
INSERT INTO `guild_shops` VALUES (516, 832, 675, 1620, 240, 150);
INSERT INTO `guild_shops` VALUES (516, 839, 137, 870, 240, 150);
INSERT INTO `guild_shops` VALUES (516, 817, 45, 240, 240, 150);
INSERT INTO `guild_shops` VALUES (516, 818, 120, 768, 240, 150);
INSERT INTO `guild_shops` VALUES (516, 819, 750, 4600, 240, 600);
INSERT INTO `guild_shops` VALUES (516, 820, 2700, 3312, 240, 100);
INSERT INTO `guild_shops` VALUES (516, 816, 596, 3540, 240, 150);
INSERT INTO `guild_shops` VALUES (516, 822, 600, 4480, 240, 150);
INSERT INTO `guild_shops` VALUES (516, 823, 18240, 18240, 240, 150);
INSERT INTO `guild_shops` VALUES (516, 824, 240, 588, 240, 150);
INSERT INTO `guild_shops` VALUES (516, 825, 480, 2944, 240, 150);
INSERT INTO `guild_shops` VALUES (516, 847, 10, 40, 240, 8);
INSERT INTO `guild_shops` VALUES (516, 841, 36, 200, 240, 150);
INSERT INTO `guild_shops` VALUES (517, 17396, 3, 4, 240, 1);
INSERT INTO `guild_shops` VALUES (517, 17395, 9, 12, 240, 2);
INSERT INTO `guild_shops` VALUES (517, 16996, 52, 52, 240, 1);
INSERT INTO `guild_shops` VALUES (517, 16997, 52, 266, 240, 50);
INSERT INTO `guild_shops` VALUES (517, 16998, 30, 184, 240, 50);
INSERT INTO `guild_shops` VALUES (517, 16999, 52, 240, 240, 50);
INSERT INTO `guild_shops` VALUES (517, 17000, 52, 322, 240, 75);
INSERT INTO `guild_shops` VALUES (517, 17392, 213, 433, 240, 75);
INSERT INTO `guild_shops` VALUES (517, 17393, 213, 213, 240, 150);
INSERT INTO `guild_shops` VALUES (517, 17394, 220, 220, 240, 150);
INSERT INTO `guild_shops` VALUES (517, 16992, 52, 238, 240, 75);
INSERT INTO `guild_shops` VALUES (517, 16993, 52, 64, 240, 5);
INSERT INTO `guild_shops` VALUES (517, 16994, 52, 52, 240, 1);
INSERT INTO `guild_shops` VALUES (517, 17405, 540, 540, 240, 1);
INSERT INTO `guild_shops` VALUES (517, 17407, 270, 364, 240, 1);
INSERT INTO `guild_shops` VALUES (517, 17404, 540, 540, 240, 1);
INSERT INTO `guild_shops` VALUES (517, 17399, 2394, 2394, 240, 1);
INSERT INTO `guild_shops` VALUES (517, 17391, 44, 74, 240, 10);
INSERT INTO `guild_shops` VALUES (517, 17390, 145, 245, 240, 10);
INSERT INTO `guild_shops` VALUES (517, 17389, 332, 561, 240, 75);
INSERT INTO `guild_shops` VALUES (517, 17388, 934, 1667, 240, 150);
INSERT INTO `guild_shops` VALUES (517, 17387, 4077, 4077, 240, 1);
INSERT INTO `guild_shops` VALUES (517, 17380, 25740, 25740, 240, 1);
INSERT INTO `guild_shops` VALUES (517, 17383, 1980, 2640, 240, 200);
INSERT INTO `guild_shops` VALUES (517, 17382, 9657, 15398, 240, 1750);
INSERT INTO `guild_shops` VALUES (517, 4443, 24, 165, 240, 25);
INSERT INTO `guild_shops` VALUES (517, 4472, 30, 198, 240, 50);
INSERT INTO `guild_shops` VALUES (517, 624, 24, 156, 240, 25);
INSERT INTO `guild_shops` VALUES (517, 4484, 1350, 8784, 240, 1000);
INSERT INTO `guild_shops` VALUES (517, 4426, 195, 665, 240, 100);
INSERT INTO `guild_shops` VALUES (517, 4427, 1350, 1350, 240, 1);
INSERT INTO `guild_shops` VALUES (517, 4482, 1712, 2000, 240, 100);
INSERT INTO `guild_shops` VALUES (517, 4783, 195, 1248, 240, 300);
INSERT INTO `guild_shops` VALUES (517, 4428, 45, 396, 240, 1);
INSERT INTO `guild_shops` VALUES (517, 4361, 1196, 1289, 240, 25);
INSERT INTO `guild_shops` VALUES (517, 4304, 30520, 34720, 240, 1);
INSERT INTO `guild_shops` VALUES (517, 4481, 505, 748, 240, 75);
INSERT INTO `guild_shops` VALUES (517, 4385, 520, 748, 240, 75);
INSERT INTO `guild_shops` VALUES (517, 4402, 8064, 8568, 240, 100);
INSERT INTO `guild_shops` VALUES (517, 4383, 3225, 5621, 240, 900);
INSERT INTO `guild_shops` VALUES (517, 4399, 1350, 4680, 240, 750);
INSERT INTO `guild_shops` VALUES (517, 4485, 13888, 13888, 240, 1);
INSERT INTO `guild_shops` VALUES (517, 4290, 1008, 1289, 240, 50);
INSERT INTO `guild_shops` VALUES (517, 4451, 5440, 19520, 240, 1500);
INSERT INTO `guild_shops` VALUES (517, 4461, 4050, 4050, 240, 1);
INSERT INTO `guild_shops` VALUES (517, 4384, 5250, 5250, 240, 1);
INSERT INTO `guild_shops` VALUES (517, 4514, 60, 396, 240, 50);
INSERT INTO `guild_shops` VALUES (517, 4580, 4760, 4760, 240, 1);
INSERT INTO `guild_shops` VALUES (517, 4462, 1350, 8064, 240, 1250);
INSERT INTO `guild_shops` VALUES (517, 4480, 455, 2800, 240, 400);
INSERT INTO `guild_shops` VALUES (517, 4479, 7560, 8784, 240, 250);
INSERT INTO `guild_shops` VALUES (517, 4471, 11984, 13888, 240, 350);
INSERT INTO `guild_shops` VALUES (518, 17388, 766, 1667, 240, 150);
INSERT INTO `guild_shops` VALUES (518, 17382, 7081, 15398, 240, 1750);
INSERT INTO `guild_shops` VALUES (518, 4399, 1350, 4680, 240, 750);
INSERT INTO `guild_shops` VALUES (518, 4485, 2100, 13888, 240, 2500);
INSERT INTO `guild_shops` VALUES (518, 4317, 120, 120, 240, 1);
INSERT INTO `guild_shops` VALUES (518, 4484, 1350, 8784, 240, 1200);
INSERT INTO `guild_shops` VALUES (518, 4385, 115, 748, 240, 110);
INSERT INTO `guild_shops` VALUES (518, 5121, 2142, 2142, 240, 1);
INSERT INTO `guild_shops` VALUES (518, 4314, 300, 600, 240, 50);
INSERT INTO `guild_shops` VALUES (518, 4318, 3375, 3375, 240, 1);
INSERT INTO `guild_shops` VALUES (518, 624, 24, 156, 240, 25);
INSERT INTO `guild_shops` VALUES (518, 4443, 24, 165, 240, 25);
INSERT INTO `guild_shops` VALUES (519, 17395, 9, 12, 240, 2);
INSERT INTO `guild_shops` VALUES (519, 17399, 2394, 2394, 240, 1);
INSERT INTO `guild_shops` VALUES (519, 17407, 270, 364, 240, 1);
INSERT INTO `guild_shops` VALUES (519, 17400, 691, 4000, 240, 575);
INSERT INTO `guild_shops` VALUES (519, 17387, 4077, 4077, 240, 1);
INSERT INTO `guild_shops` VALUES (519, 4360, 25, 153, 240, 25);
INSERT INTO `guild_shops` VALUES (519, 4484, 1350, 8928, 240, 1200);
INSERT INTO `guild_shops` VALUES (519, 4399, 1350, 8856, 240, 1250);
INSERT INTO `guild_shops` VALUES (519, 4485, 2100, 13888, 240, 2500);
INSERT INTO `guild_shops` VALUES (519, 4451, 5440, 19520, 240, 1500);
INSERT INTO `guild_shops` VALUES (519, 4514, 60, 396, 240, 50);
INSERT INTO `guild_shops` VALUES (519, 4480, 455, 2800, 240, 400);
INSERT INTO `guild_shops` VALUES (520, 17399, 2394, 2394, 240, 1);
INSERT INTO `guild_shops` VALUES (520, 17387, 4077, 4077, 240, 1);
INSERT INTO `guild_shops` VALUES (520, 17383, 1980, 2640, 240, 200);
INSERT INTO `guild_shops` VALUES (520, 17388, 934, 1667, 240, 150);
INSERT INTO `guild_shops` VALUES (520, 17382, 9657, 15398, 240, 1750);
INSERT INTO `guild_shops` VALUES (520, 4472, 30, 198, 240, 50);
INSERT INTO `guild_shops` VALUES (520, 624, 24, 156, 240, 25);
INSERT INTO `guild_shops` VALUES (520, 4360, 25, 153, 240, 25);
INSERT INTO `guild_shops` VALUES (520, 4484, 1350, 8784, 240, 1000);
INSERT INTO `guild_shops` VALUES (520, 4385, 520, 775, 240, 75);
INSERT INTO `guild_shops` VALUES (520, 4399, 1350, 7920, 240, 1000);
INSERT INTO `guild_shops` VALUES (520, 4485, 12208, 13888, 240, 300);
INSERT INTO `guild_shops` VALUES (520, 4451, 3280, 19520, 240, 2500);
INSERT INTO `guild_shops` VALUES (520, 4461, 4050, 4995, 240, 175);
INSERT INTO `guild_shops` VALUES (520, 4384, 5250, 27160, 240, 3650);
INSERT INTO `guild_shops` VALUES (520, 4500, 29, 147, 240, 20);
INSERT INTO `guild_shops` VALUES (520, 4514, 60, 396, 240, 50);
INSERT INTO `guild_shops` VALUES (520, 4480, 455, 2800, 240, 400);
INSERT INTO `guild_shops` VALUES (521, 914, 1125, 5100, 240, 665);
INSERT INTO `guild_shops` VALUES (521, 920, 1084, 5494, 240, 150);
INSERT INTO `guild_shops` VALUES (521, 922, 297, 300, 240, 1);
INSERT INTO `guild_shops` VALUES (521, 925, 1012, 4017, 240, 500);
INSERT INTO `guild_shops` VALUES (521, 1108, 573, 795, 240, 40);
INSERT INTO `guild_shops` VALUES (521, 951, 90, 504, 240, 70);
INSERT INTO `guild_shops` VALUES (521, 621, 21, 30, 240, 2);
INSERT INTO `guild_shops` VALUES (521, 622, 36, 57, 240, 4);
INSERT INTO `guild_shops` VALUES (521, 636, 15, 97, 528, 75);
INSERT INTO `guild_shops` VALUES (521, 4165, 984, 5856, 240, 815);
INSERT INTO `guild_shops` VALUES (521, 638, 138, 777, 240, 125);
INSERT INTO `guild_shops` VALUES (521, 4443, 24, 165, 240, 25);
INSERT INTO `guild_shops` VALUES (521, 933, 600, 3360, 240, 500);
INSERT INTO `guild_shops` VALUES (521, 932, 1020, 5712, 240, 800);
INSERT INTO `guild_shops` VALUES (521, 4154, 6300, 7700, 240, 250);
INSERT INTO `guild_shops` VALUES (521, 4157, 800, 2240, 240, 240);
INSERT INTO `guild_shops` VALUES (521, 4150, 600, 3584, 240, 500);
INSERT INTO `guild_shops` VALUES (521, 4162, 810, 4284, 240, 600);
INSERT INTO `guild_shops` VALUES (521, 947, 3360, 21862, 240, 3100);
INSERT INTO `guild_shops` VALUES (521, 4166, 750, 4480, 240, 625);
INSERT INTO `guild_shops` VALUES (521, 4112, 682, 946, 240, 50);
INSERT INTO `guild_shops` VALUES (521, 4116, 3375, 5760, 240, 400);
INSERT INTO `guild_shops` VALUES (521, 4128, 4348, 22227, 240, 3025);
INSERT INTO `guild_shops` VALUES (521, 2131, 75, 150, 240, 15);
INSERT INTO `guild_shops` VALUES (521, 18228, 114, 114, 240, 1);
INSERT INTO `guild_shops` VALUES (521, 18232, 114, 114, 240, 1);
INSERT INTO `guild_shops` VALUES (521, 18236, 21, 28, 240, 2);
