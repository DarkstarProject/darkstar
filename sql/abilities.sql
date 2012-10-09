-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Mar 09 Octobre 2012 à 21:57
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
-- Structure de la table `abilities`
--

DROP TABLE IF EXISTS `abilities`;
CREATE TABLE IF NOT EXISTS `abilities` (
  `abilityId` smallint(5) unsigned NOT NULL,
  `name` tinytext,
  `job` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `validTarget` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `recastTime` smallint(5) unsigned NOT NULL DEFAULT '0',
  `recastId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `message` smallint(5) unsigned NOT NULL DEFAULT '0',
  `animation` smallint(5) unsigned NOT NULL DEFAULT '0',
  `range` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `isAOE` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `CE` smallint(5) NOT NULL DEFAULT '0',
  `VE` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`abilityId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=56;

--
-- Contenu de la table `abilities`
--

INSERT INTO `abilities` VALUES(0, 'mighty_strikes', 1, 0, 1, 7200, 0, 0, 33, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(1, 'hundred_fists', 2, 0, 1, 7200, 0, 0, 34, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(2, 'benediction', 3, 0, 1, 7200, 0, 0, 35, 20, 1, 0, 0);
INSERT INTO `abilities` VALUES(3, 'manafont', 4, 0, 1, 7200, 0, 0, 36, 20, 0, 1, 0);
INSERT INTO `abilities` VALUES(4, 'chainspell', 5, 0, 1, 7200, 0, 0, 37, 20, 0, 1, 0);
INSERT INTO `abilities` VALUES(5, 'perfect_dodge', 6, 0, 1, 7200, 0, 0, 38, 20, 0, 1, 0);
INSERT INTO `abilities` VALUES(6, 'invincible', 7, 0, 1, 7200, 0, 0, 18, 20, 0, 1, 7200);
INSERT INTO `abilities` VALUES(7, 'blood_weapon', 8, 0, 1, 7200, 0, 0, 19, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(8, 'familiar', 9, 0, 1, 7200, 0, 0, 39, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(9, 'soul_voice', 10, 0, 1, 7200, 0, 0, 40, 20, 0, 1, 0);
INSERT INTO `abilities` VALUES(10, 'eagle_eye_shot', 11, 0, 4, 7200, 0, 0, 186, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(11, 'meikyo_shisui', 12, 0, 1, 7200, 0, 0, 96, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(12, 'mijin_gakure', 13, 0, 4, 7200, 0, 0, 93, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(13, 'spirit_surge', 14, 0, 1, 7200, 0, 0, 97, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(14, 'astral_flow', 15, 0, 1, 7200, 0, 0, 95, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(15, 'berserk', 1, 15, 1, 300, 1, 0, 0, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(16, 'warcry', 1, 35, 1, 300, 2, 0, 28, 20, 1, 1, 300);
INSERT INTO `abilities` VALUES(17, 'defender', 1, 25, 1, 180, 3, 0, 1, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(18, 'aggressor', 1, 45, 1, 300, 4, 0, 2, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(19, 'provoke', 1, 5, 4, 30, 5, 0, 3, 18, 0, 1, 1800);
INSERT INTO `abilities` VALUES(20, 'focus', 2, 25, 1, 300, 13, 0, 4, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(21, 'dodge', 2, 15, 1, 300, 14, 0, 5, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(22, 'chakra', 2, 35, 1, 300, 15, 0, 6, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(23, 'boost', 2, 5, 1, 15, 16, 0, 7, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(24, 'counterstance', 2, 45, 1, 300, 17, 0, 8, 20, 0, 1, 900);
INSERT INTO `abilities` VALUES(25, 'steal', 6, 5, 4, 300, 61, 0, 181, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(26, 'flee', 6, 25, 1, 300, 62, 0, 9, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(27, 'hide', 6, 45, 1, 300, 63, 0, 10, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(28, 'sneak_attack', 6, 15, 1, 60, 64, 0, 17, 20, 0, 1, 0);
INSERT INTO `abilities` VALUES(29, 'mug', 6, 35, 4, 900, 65, 0, 183, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(30, 'shield_bash', 7, 15, 4, 300, 73, 0, 185, 20, 0, 1, 900);
INSERT INTO `abilities` VALUES(31, 'holy_circle', 7, 5, 1, 600, 74, 0, 29, 20, 1, 1, 20);
INSERT INTO `abilities` VALUES(32, 'sentinel', 7, 30, 1, 300, 75, 0, 11, 20, 0, 1, 1800);
INSERT INTO `abilities` VALUES(33, 'souleater', 8, 30, 1, 360, 85, 0, 20, 20, 0, 1, 1300);
INSERT INTO `abilities` VALUES(34, 'arcane_circle', 8, 5, 1, 600, 86, 0, 30, 20, 1, 1, 20);
INSERT INTO `abilities` VALUES(35, 'last_resort', 8, 15, 1, 300, 87, 0, 12, 20, 0, 1, 1300);
INSERT INTO `abilities` VALUES(36, 'charm', 9, 1, 4, 15, 97, 0, 13, 18, 0, 320, 0);
INSERT INTO `abilities` VALUES(37, 'gauge', 9, 10, 4, 30, 98, 0, 14, 18, 0, 0, 0);
INSERT INTO `abilities` VALUES(38, 'tame', 9, 30, 4, 600, 99, 0, 15, 18, 0, 0, 0);
INSERT INTO `abilities` VALUES(39, 'pet_commands', 9, 1, 1, 0, 0, 0, 0, 18, 0, 0, 0);
INSERT INTO `abilities` VALUES(40, 'scavenge', 11, 10, 1, 300, 121, 0, 21, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(41, 'shadowbind', 11, 40, 4, 300, 122, 0, 188, 18, 0, 1, 800);
INSERT INTO `abilities` VALUES(42, 'camouflage', 11, 20, 1, 300, 123, 0, 10, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(43, 'sharpshot', 11, 1, 1, 300, 124, 0, 22, 20, 0, 1, 600);
INSERT INTO `abilities` VALUES(44, 'barrage', 11, 30, 1, 300, 125, 0, 23, 20, 0, 1, 600);
INSERT INTO `abilities` VALUES(45, 'call_wyvern', 14, 1, 1, 1200, 163, 0, 94, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(46, 'third_eye', 12, 15, 1, 60, 133, 0, 24, 20, 0, 1, 0);
INSERT INTO `abilities` VALUES(47, 'meditate', 12, 30, 1, 180, 134, 0, 25, 20, 0, 320, 0);
INSERT INTO `abilities` VALUES(48, 'warding_circle', 12, 5, 1, 600, 135, 0, 32, 20, 1, 1, 20);
INSERT INTO `abilities` VALUES(49, 'ancient_circle', 14, 5, 1, 600, 157, 0, 31, 20, 1, 1, 20);
INSERT INTO `abilities` VALUES(50, 'jump', 14, 10, 4, 90, 158, 0, 204, 20, 0, 1000, 1000);
INSERT INTO `abilities` VALUES(51, 'high_jump', 14, 35, 4, 180, 159, 0, 209, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(52, 'super_jump', 14, 50, 4, 180, 160, 0, 214, 20, 0, 1000, 1000);
INSERT INTO `abilities` VALUES(53, 'fight', 9, 1, 4, 10, 100, 0, 83, 18, 0, 0, 0);
INSERT INTO `abilities` VALUES(54, 'heel', 9, 10, 1, 5, 101, 0, 83, 18, 0, 0, 0);
INSERT INTO `abilities` VALUES(55, 'leave', 9, 35, 1, 10, 101, 0, 83, 18, 0, 0, 0);
INSERT INTO `abilities` VALUES(56, 'sic', 9, 25, 1, 120, 102, 0, 83, 18, 0, 0, 0);
INSERT INTO `abilities` VALUES(57, 'stay', 9, 15, 1, 5, 101, 0, 83, 18, 0, 0, 0);
INSERT INTO `abilities` VALUES(58, 'divine_seal', 3, 15, 1, 600, 26, 0, 81, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(59, 'elemental_seal', 4, 15, 1, 600, 38, 0, 80, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(60, 'trick_attack', 6, 30, 1, 60, 66, 0, 82, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(61, 'weapon_bash', 8, 20, 4, 300, 88, 0, 201, 20, 0, 1, 900);
INSERT INTO `abilities` VALUES(62, 'reward', 9, 12, 1, 90, 103, 0, 84, 18, 0, 0, 0);
INSERT INTO `abilities` VALUES(63, 'cover', 7, 35, 2, 180, 76, 0, 86, 20, 0, 0, 35);
INSERT INTO `abilities` VALUES(64, 'spirit_link', 14, 25, 1, 90, 162, 0, 196, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(66, 'chi_blast', 2, 41, 4, 180, 18, 0, 92, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(67, 'convert', 5, 40, 1, 600, 49, 0, 88, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(68, 'accomplice', 6, 65, 2, 300, 69, 0, 220, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(69, 'call_beast', 9, 23, 1, 300, 104, 0, 83, 18, 0, 0, 0);
INSERT INTO `abilities` VALUES(70, 'unlimited_shot', 11, 51, 1, 180, 126, 0, 90, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(71, 'dismiss', 14, 1, 1, 300, 161, 0, 94, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(72, 'assault', 15, 1, 4, 10, 170, 0, 94, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(73, 'retreat', 15, 1, 1, 10, 171, 0, 94, 20, 0, -10, 0);
INSERT INTO `abilities` VALUES(74, 'release', 15, 1, 1, 10, 172, 0, 94, 20, 0, -10, 0);
INSERT INTO `abilities` VALUES(75, 'blood_pact_rage', 15, 1, 1, 0, 173, 0, 0, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(76, 'rampart', 7, 62, 1, 300, 77, 0, 91, 20, 1, 1, 300);
INSERT INTO `abilities` VALUES(77, 'azure_lore', 16, 0, 1, 7200, 0, 0, 142, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(78, 'chain_affinity', 16, 25, 1, 120, 181, 0, 140, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(79, 'burst_affinity', 16, 40, 1, 120, 182, 0, 141, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(80, 'wild_card', 17, 0, 1, 7200, 0, 0, 132, 20, 1, 1, 300);
INSERT INTO `abilities` VALUES(81, 'phantom_roll', 17, 5, 1, 0, 193, 0, 0, 18, 0, 1, 80);
INSERT INTO `abilities` VALUES(82, 'fighters_roll', 17, 49, 1, 60, 193, 0, 98, 20, 1, 1, 80);
INSERT INTO `abilities` VALUES(83, 'monks_roll', 17, 31, 1, 60, 193, 0, 99, 20, 1, 1, 80);
INSERT INTO `abilities` VALUES(84, 'healers_roll', 17, 20, 1, 60, 193, 0, 100, 20, 1, 1, 80);
INSERT INTO `abilities` VALUES(85, 'wizards_roll', 17, 58, 1, 60, 193, 0, 111, 20, 1, 1, 80);
INSERT INTO `abilities` VALUES(86, 'warlocks_roll', 17, 46, 1, 60, 193, 0, 102, 20, 1, 1, 80);
INSERT INTO `abilities` VALUES(87, 'rogues_roll', 17, 43, 1, 60, 193, 0, 103, 20, 1, 1, 80);
INSERT INTO `abilities` VALUES(88, 'gallants_roll', 17, 55, 1, 60, 193, 0, 101, 20, 1, 1, 80);
INSERT INTO `abilities` VALUES(89, 'chaos_roll', 17, 14, 1, 60, 193, 0, 105, 20, 1, 1, 80);
INSERT INTO `abilities` VALUES(90, 'beast_roll', 17, 34, 1, 60, 193, 0, 106, 20, 1, 1, 80);
INSERT INTO `abilities` VALUES(91, 'choral_roll', 17, 26, 1, 60, 193, 0, 107, 20, 1, 1, 80);
INSERT INTO `abilities` VALUES(92, 'hunters_roll', 17, 11, 1, 60, 193, 0, 108, 20, 1, 1, 80);
INSERT INTO `abilities` VALUES(93, 'samurai_roll', 17, 34, 1, 60, 193, 0, 109, 20, 1, 1, 80);
INSERT INTO `abilities` VALUES(94, 'ninja_roll', 17, 8, 1, 60, 193, 0, 110, 20, 1, 1, 80);
INSERT INTO `abilities` VALUES(95, 'drachen_roll', 17, 52, 1, 60, 193, 0, 104, 20, 1, 1, 80);
INSERT INTO `abilities` VALUES(96, 'evokers_roll', 17, 40, 1, 60, 193, 0, 112, 20, 1, 1, 80);
INSERT INTO `abilities` VALUES(97, 'maguss_roll', 17, 17, 1, 60, 193, 0, 113, 20, 1, 1, 80);
INSERT INTO `abilities` VALUES(98, 'corsairs_roll', 17, 5, 1, 60, 193, 0, 114, 20, 1, 1, 80);
INSERT INTO `abilities` VALUES(99, 'puppet_roll', 17, 23, 1, 60, 193, 0, 115, 20, 1, 1, 80);
INSERT INTO `abilities` VALUES(100, 'dancers_roll', 17, 61, 1, 60, 193, 0, 167, 20, 1, 1, 80);
INSERT INTO `abilities` VALUES(101, 'scholars_roll', 17, 64, 1, 60, 193, 0, 168, 20, 1, 1, 80);
INSERT INTO `abilities` VALUES(107, 'double-up', 17, 5, 1, 8, 194, 0, 116, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(108, 'quick_draw', 17, 40, 1, 0, 0, 0, 0, 18, 0, 0, 0);
INSERT INTO `abilities` VALUES(109, 'fire_shot', 17, 40, 4, 60, 195, 0, 125, 18, 0, 0, 0);
INSERT INTO `abilities` VALUES(110, 'ice_shot', 17, 40, 4, 60, 195, 0, 126, 18, 0, 0, 0);
INSERT INTO `abilities` VALUES(111, 'wind_shot', 17, 40, 4, 60, 195, 0, 127, 18, 0, 0, 0);
INSERT INTO `abilities` VALUES(112, 'earth_shot', 17, 40, 4, 60, 195, 0, 128, 18, 0, 0, 0);
INSERT INTO `abilities` VALUES(113, 'thunder_shot', 17, 40, 4, 60, 195, 0, 129, 18, 0, 0, 0);
INSERT INTO `abilities` VALUES(114, 'water_shot', 17, 40, 4, 60, 195, 0, 130, 18, 0, 0, 0);
INSERT INTO `abilities` VALUES(115, 'light_shot', 17, 40, 4, 60, 195, 0, 123, 18, 0, 0, 0);
INSERT INTO `abilities` VALUES(116, 'dark_shot', 17, 40, 4, 60, 195, 0, 124, 18, 0, 0, 0);
INSERT INTO `abilities` VALUES(117, 'random_deal', 17, 50, 1, 1200, 196, 0, 131, 20, 1, 1, 300);
INSERT INTO `abilities` VALUES(119, 'overdrive', 18, 0, 1, 7200, 0, 0, 143, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(120, 'activate', 18, 1, 1, 1200, 205, 0, 83, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(121, 'repair', 18, 15, 1, 180, 206, 0, 83, 18, 0, 0, 0);
INSERT INTO `abilities` VALUES(122, 'deploy', 18, 1, 4, 10, 207, 0, 83, 18, 0, 0, 0);
INSERT INTO `abilities` VALUES(123, 'deactivate', 18, 1, 1, 60, 208, 0, 83, 18, 0, 0, 0);
INSERT INTO `abilities` VALUES(124, 'retrieve', 18, 10, 1, 10, 209, 0, 83, 18, 0, 0, 0);
INSERT INTO `abilities` VALUES(125, 'fire_maneuver', 18, 1, 1, 10, 210, 0, 83, 18, 0, 1, 0);
INSERT INTO `abilities` VALUES(126, 'ice_maneuver', 18, 1, 1, 10, 210, 0, 83, 18, 0, 1, 0);
INSERT INTO `abilities` VALUES(127, 'wind_maneuver', 18, 1, 1, 10, 210, 0, 83, 18, 0, 1, 0);
INSERT INTO `abilities` VALUES(128, 'earth_maneuver', 18, 1, 1, 10, 210, 0, 83, 18, 0, 1, 0);
INSERT INTO `abilities` VALUES(129, 'thunder_maneuver', 18, 1, 1, 10, 210, 0, 83, 18, 0, 1, 0);
INSERT INTO `abilities` VALUES(130, 'water_maneuver', 18, 1, 1, 10, 210, 0, 83, 18, 0, 1, 0);
INSERT INTO `abilities` VALUES(131, 'light_maneuver', 18, 1, 1, 10, 210, 0, 83, 18, 0, 1, 0);
INSERT INTO `abilities` VALUES(132, 'dark_maneuver', 18, 1, 1, 10, 210, 0, 83, 18, 0, 1, 0);
INSERT INTO `abilities` VALUES(133, 'warriors_charge', 1, 75, 1, 900, 6, 0, 154, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(134, 'tomahawk', 1, 75, 4, 180, 7, 0, 244, 20, 0, 1, 600);
INSERT INTO `abilities` VALUES(135, 'mantra', 2, 75, 1, 600, 19, 0, 155, 20, 1, 1, 60);
INSERT INTO `abilities` VALUES(136, 'formless_strikes', 2, 75, 1, 600, 20, 0, 156, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(137, 'martyr', 3, 75, 3, 1200, 27, 0, 157, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(138, 'devotion', 3, 75, 3, 1200, 28, 0, 158, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(139, 'assassins_charge', 6, 75, 1, 900, 67, 0, 160, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(140, 'feint', 6, 75, 1, 600, 68, 0, 159, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(141, 'fealty', 7, 75, 1, 1200, 78, 0, 148, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(142, 'chivalry', 7, 75, 1, 1200, 79, 0, 149, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(143, 'dark_seal', 8, 75, 1, 900, 89, 0, 144, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(144, 'diabolic_eye', 8, 75, 1, 900, 90, 0, 145, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(145, 'feral_howl', 9, 75, 4, 900, 105, 0, 146, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(146, 'killer_instinct', 9, 75, 1, 900, 106, 0, 147, 20, 1, 0, 0);
INSERT INTO `abilities` VALUES(147, 'nightingale', 10, 75, 1, 1200, 109, 0, 161, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(148, 'troubadour', 10, 75, 1, 1200, 110, 0, 162, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(149, 'stealth_shot', 11, 75, 1, 300, 127, 0, 150, 20, 0, 1, 3000);
INSERT INTO `abilities` VALUES(150, 'flashy_shot', 11, 75, 1, 1200, 128, 0, 151, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(151, 'shikikoyo', 12, 75, 2, 900, 136, 0, 152, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(152, 'blade_bash', 12, 75, 1, 900, 137, 0, 202, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(153, 'deep_breathing', 14, 75, 1, 900, 164, 0, 153, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(154, 'angon', 14, 75, 4, 180, 165, 0, 245, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(155, 'sange', 13, 75, 1, 900, 145, 0, 200, 20, 0, 1, 0);
INSERT INTO `abilities` VALUES(156, 'blood_pact_ward', 15, 1, 1, 0, 174, 0, 0, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(157, 'hasso', 12, 25, 1, 60, 138, 0, 163, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(158, 'seigan', 12, 35, 1, 60, 139, 0, 164, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(159, 'convergence', 16, 75, 1, 600, 183, 0, 165, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(160, 'diffusion', 16, 75, 1, 1200, 184, 0, 166, 20, 1, 1, 300);
INSERT INTO `abilities` VALUES(161, 'snake_eye', 17, 75, 1, 900, 197, 0, 220, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(162, 'fold', 17, 75, 1, 900, 198, 0, 220, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(163, 'role_reversal', 18, 75, 1, 240, 211, 0, 169, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(164, 'ventriloquy', 18, 75, 4, 120, 212, 0, 170, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(165, 'trance', 19, 0, 1, 7200, 0, 0, 184, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(166, 'sambas', 19, 5, 1, 0, 216, 0, 0, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(167, 'waltzes', 19, 15, 1, 0, 216, 0, 0, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(168, 'drain_samba', 19, 5, 1, 60, 216, 0, 0, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(169, 'drain_samba_ii', 19, 35, 1, 60, 216, 0, 1, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(170, 'drain_samba_iii', 19, 64, 1, 60, 216, 0, 2, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(171, 'aspir_samba', 19, 25, 1, 60, 216, 0, 3, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(172, 'aspir_samba_ii', 19, 60, 1, 60, 216, 0, 4, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(173, 'haste_samba', 19, 45, 1, 60, 216, 0, 5, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(174, 'curing_waltz', 19, 15, 27, 6, 217, 0, 6, 20, 0, 3, 3);
INSERT INTO `abilities` VALUES(175, 'curing_waltz_ii', 19, 30, 27, 8, 217, 0, 7, 20, 0, 3, 3);
INSERT INTO `abilities` VALUES(176, 'curing_waltz_iii', 19, 50, 27, 10, 217, 0, 8, 20, 0, 3, 3);
INSERT INTO `abilities` VALUES(177, 'curing_waltz_iv', 19, 70, 27, 17, 217, 0, 9, 20, 0, 3, 3);
INSERT INTO `abilities` VALUES(178, 'healing_waltz', 19, 35, 27, 15, 217, 0, 10, 20, 1, 1, 300);
INSERT INTO `abilities` VALUES(179, 'divine_waltz', 19, 25, 27, 13, 217, 0, 11, 20, 1, 3, 3);
INSERT INTO `abilities` VALUES(180, 'spectral_jig', 19, 25, 1, 30, 218, 0, 12, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(181, 'chocobo_jig', 19, 55, 1, 60, 218, 0, 13, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(182, 'jigs', 19, 25, 1, 0, 0, 0, 0, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(183, 'steps', 19, 20, 1, 0, 0, 0, 0, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(184, 'flourishes_i', 19, 20, 1, 0, 0, 0, 0, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(185, 'quickstep', 19, 20, 4, 15, 220, 0, 220, 20, 0, 1, 0);
INSERT INTO `abilities` VALUES(186, 'box_step', 19, 30, 4, 15, 220, 0, 220, 20, 0, 1, 0);
INSERT INTO `abilities` VALUES(187, 'stutter_step', 19, 40, 4, 15, 220, 0, 220, 20, 0, 1, 0);
INSERT INTO `abilities` VALUES(188, 'animated_flourish', 19, 20, 4, 30, 221, 0, 181, 20, 0, 1, 1000);
INSERT INTO `abilities` VALUES(189, 'desperate_flourish', 19, 30, 4, 20, 221, 0, 220, 20, 0, 1, 0);
INSERT INTO `abilities` VALUES(190, 'reverse_flourish', 19, 40, 1, 30, 222, 0, 182, 20, 0, 1, 0);
INSERT INTO `abilities` VALUES(191, 'violent_flourish', 19, 45, 4, 20, 221, 0, 220, 20, 0, 1, 0);
INSERT INTO `abilities` VALUES(192, 'building_flourish', 19, 50, 1, 10, 222, 0, 220, 20, 0, 1, 0);
INSERT INTO `abilities` VALUES(193, 'wild_flourish', 19, 60, 4, 30, 222, 0, 220, 20, 0, 1, 0);
INSERT INTO `abilities` VALUES(194, 'tabula_rasa', 20, 0, 1, 7200, 0, 0, 190, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(195, 'light_arts', 20, 10, 1, 60, 228, 0, 191, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(196, 'dark_arts', 20, 10, 1, 60, 231, 0, 192, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(197, 'flourishes_ii', 19, 40, 1, 0, 0, 0, 0, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(198, 'modus_veritas', 20, 65, 4, 600, 230, 0, 188, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(199, 'penury', 20, 10, 1, 0, 231, 0, 172, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(200, 'celerity', 20, 25, 1, 0, 231, 0, 173, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(201, 'rapture', 20, 55, 1, 0, 231, 0, 174, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(202, 'accession', 20, 40, 1, 0, 231, 0, 175, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(203, 'parsimony', 20, 10, 1, 0, 231, 0, 177, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(204, 'alacrity', 20, 25, 1, 0, 231, 0, 178, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(205, 'ebullience', 20, 55, 1, 0, 231, 0, 179, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(206, 'manifestation', 20, 40, 1, 0, 231, 0, 180, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(207, 'stratagems', 20, 10, 1, 0, 231, 0, 0, 20, 0, 1111, 1111);
INSERT INTO `abilities` VALUES(208, 'velocity_shot', 11, 45, 1, 300, 129, 0, 186, 20, 0, 1, 300);
INSERT INTO `abilities` VALUES(209, 'snarl', 9, 45, 1, 30, 107, 0, 87, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(210, 'retaliation', 1, 60, 1, 180, 8, 0, 185, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(211, 'footwork', 2, 65, 1, 300, 21, 0, 197, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(213, 'pianissimo', 10, 45, 1, 15, 111, 0, 194, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(214, 'sekkanoki', 12, 60, 1, 300, 140, 0, 199, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(216, 'elemental_siphon', 15, 50, 1, 300, 175, 0, 201, 20, 0, 1, 0);
INSERT INTO `abilities` VALUES(217, 'sublimation', 20, 35, 1, 30, 234, 0, 189, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(218, 'addendum_white', 20, 10, 1, 0, 231, 0, 171, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(219, 'addendum_black', 20, 30, 1, 0, 231, 0, 176, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(220, 'collaborator', 6, 65, 2, 60, 17, 0, 220, 20, 0, 0, 0);
INSERT INTO `abilities` VALUES(221, 'saber_dance', 19, 75, 1, 300, 217, 0, 207, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(222, 'fan_dance', 19, 75, 1, 300, 216, 0, 208, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(223, 'no_foot_rise', 19, 75, 1, 180, 223, 0, 209, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(224, 'altruism', 20, 75, 1, 0, 231, 0, 210, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(225, 'focalization', 20, 75, 1, 0, 231, 0, 212, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(226, 'tranquility', 20, 75, 1, 0, 231, 0, 211, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(227, 'equanimity', 20, 75, 1, 0, 231, 0, 213, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(228, 'enlightenment', 20, 75, 1, 600, 231, 0, 214, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(229, 'afflatus_solace', 3, 40, 1, 60, 29, 0, 216, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(230, 'afflatus_misery', 3, 40, 1, 60, 30, 0, 217, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(231, 'composure', 5, 50, 1, 300, 50, 0, 215, 20, 0, 1, 80);
INSERT INTO `abilities` VALUES(232, 'yonin', 13, 40, 1, 180, 146, 0, 218, 20, 0, 1, 600);
INSERT INTO `abilities` VALUES(233, 'innin', 13, 40, 1, 180, 147, 0, 219, 20, 0, 1, 60);
INSERT INTO `abilities` VALUES(496, 'healing_ruby', 15, 1, 3, 60, 174, 0, 6, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(497, 'poison_nails', 15, 5, 4, 60, 173, 0, 11, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(498, 'shining_ruby', 15, 24, 1, 60, 174, 0, 44, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(499, 'glittering_ruby', 15, 44, 1, 60, 174, 0, 62, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(500, 'meteorite', 15, 55, 4, 60, 173, 0, 108, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(501, 'healing_ruby_ii', 15, 65, 1, 60, 174, 0, 124, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(502, 'searing_light', 15, 1, 4, 60, 173, 0, 0, 18, 1, 1, 60);
INSERT INTO `abilities` VALUES(512, 'moonlit_charge', 15, 5, 4, 60, 173, 0, 17, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(513, 'crescent_fang', 15, 10, 4, 60, 173, 0, 19, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(514, 'lunar_cry', 15, 21, 4, 60, 174, 0, 41, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(515, 'lunar_roar', 15, 32, 4, 60, 174, 0, 27, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(516, 'ecliptic_growl', 15, 43, 1, 60, 174, 0, 46, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(517, 'ecliptic_howl', 15, 54, 1, 60, 174, 0, 57, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(518, 'eclipse_bite', 15, 65, 4, 60, 173, 0, 109, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(520, 'howling_moon', 15, 1, 4, 60, 173, 0, 0, 18, 1, 1, 60);
INSERT INTO `abilities` VALUES(528, 'punch', 15, 1, 4, 60, 173, 0, 9, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(529, 'fire_ii', 15, 10, 4, 60, 173, 0, 24, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(530, 'burning_strike', 15, 23, 4, 60, 173, 0, 48, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(531, 'double_punch', 15, 30, 4, 60, 173, 0, 56, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(532, 'crimson_howl', 15, 38, 1, 60, 174, 0, 84, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(533, 'fire_iv', 15, 60, 4, 60, 173, 0, 118, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(534, 'flaming_crush', 15, 70, 4, 60, 173, 0, 164, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(535, 'meteor_strike', 15, 75, 4, 60, 173, 0, 182, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(536, 'inferno', 15, 1, 4, 60, 173, 0, 0, 18, 1, 1, 60);
INSERT INTO `abilities` VALUES(544, 'rock_throw', 15, 1, 4, 60, 173, 0, 10, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(545, 'stone_ii', 15, 10, 4, 60, 173, 0, 24, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(546, 'rock_buster', 15, 21, 4, 60, 173, 0, 39, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(547, 'megalith_throw', 15, 35, 4, 60, 173, 0, 62, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(548, 'earten_ward', 15, 46, 1, 60, 174, 0, 92, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(549, 'stone_iv', 15, 60, 4, 60, 173, 0, 118, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(550, 'mountain_buster', 15, 70, 4, 60, 173, 0, 164, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(551, 'geocrush', 15, 75, 4, 60, 173, 0, 182, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(552, 'earthen_fury', 15, 1, 4, 60, 173, 0, 0, 18, 1, 1, 60);
INSERT INTO `abilities` VALUES(560, 'barracuda_dive', 15, 1, 4, 60, 173, 0, 8, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(561, 'water_ii', 15, 10, 4, 60, 173, 0, 24, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(562, 'tail_whip', 15, 26, 4, 60, 173, 0, 49, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(564, 'slowga', 15, 33, 4, 60, 174, 0, 48, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(563, 'spring_water', 15, 47, 1, 60, 174, 0, 99, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(565, 'water_iv', 15, 60, 4, 60, 173, 0, 118, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(566, 'spinning_dive', 15, 70, 4, 60, 173, 0, 164, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(567, 'grand_fall', 15, 75, 4, 60, 173, 0, 182, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(568, 'tidal_wave', 15, 1, 4, 60, 173, 0, 0, 18, 1, 1, 60);
INSERT INTO `abilities` VALUES(576, 'claw', 15, 1, 4, 60, 173, 0, 7, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(577, 'aero_ii', 15, 10, 4, 60, 173, 0, 24, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(578, 'whispering_wind', 15, 36, 1, 60, 174, 0, 119, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(579, 'hastega', 15, 48, 1, 60, 174, 0, 112, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(580, 'aerial_armor', 15, 25, 1, 60, 174, 0, 92, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(581, 'aero_iv', 15, 60, 4, 60, 173, 0, 118, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(582, 'predator_claws', 15, 70, 4, 60, 173, 0, 164, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(583, 'wind_blade', 15, 75, 4, 60, 173, 0, 182, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(584, 'aerial_blast', 15, 1, 4, 60, 173, 0, 0, 18, 1, 1, 60);
INSERT INTO `abilities` VALUES(592, 'axe_kick', 15, 1, 4, 60, 173, 0, 10, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(593, 'blizzard_ii', 15, 10, 4, 60, 173, 0, 24, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(594, 'frost_armor', 15, 28, 1, 60, 174, 0, 63, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(595, 'sleepga', 15, 39, 4, 60, 174, 0, 56, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(596, 'double_slap', 15, 50, 4, 60, 173, 0, 96, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(597, 'blizzard_iv', 15, 60, 4, 60, 173, 0, 118, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(598, 'rush', 15, 70, 4, 60, 173, 0, 164, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(599, 'heavenly_strike', 15, 75, 4, 60, 173, 0, 182, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(600, 'diamond_dust', 15, 1, 4, 60, 173, 0, 0, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(608, 'shock_strike', 15, 1, 4, 60, 173, 0, 6, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(609, 'thunder_ii', 15, 10, 4, 60, 173, 0, 24, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(611, 'thunderspark', 15, 19, 4, 60, 173, 0, 38, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(610, 'rolling_thunder', 15, 31, 1, 60, 174, 0, 52, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(612, 'lightning_armor', 15, 42, 1, 60, 174, 0, 91, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(613, 'thunder_iv', 15, 60, 4, 60, 173, 0, 118, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(614, 'chaotic_strike', 15, 70, 4, 60, 173, 0, 164, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(615, 'thunderstorm', 15, 75, 4, 60, 173, 0, 182, 18, 0, 1, 60);
INSERT INTO `abilities` VALUES(616, 'judgment_bolt', 15, 1, 4, 60, 173, 0, 0, 18, 0, 1, 60);
