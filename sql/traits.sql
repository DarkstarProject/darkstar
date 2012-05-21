-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Sam 07 Avril 2012 à 12:43
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
-- Structure de la table `traits`
--

DROP TABLE IF EXISTS `traits`;
CREATE TABLE IF NOT EXISTS `traits` (
  `traitid` tinyint(3) unsigned NOT NULL,
  `name` text NOT NULL,
  `job` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '99',
  `effect` smallint(5) unsigned NOT NULL DEFAULT '0',
  `modifier` smallint(5) unsigned NOT NULL DEFAULT '0',
  `value` smallint(5) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `traits`
--

INSERT INTO `traits` VALUES(55, 'resist curse', 0, 0, 0, 248, 0);
INSERT INTO `traits` VALUES(56, 'resist stun', 0, 0, 0, 251, 0);
INSERT INTO `traits` VALUES(60, 'resist charm', 0, 0, 0, 252, 0);
INSERT INTO `traits` VALUES(65, 'gilfinder ii', 0, 0, 0, 0, 0);
INSERT INTO `traits` VALUES(4, 'defense bonus', 1, 10, 0, 1, 10);
INSERT INTO `traits` VALUES(54, 'resist virus', 1, 15, 0, 245, 0);
INSERT INTO `traits` VALUES(15, 'double attack', 1, 25, 0, 288, 10);
INSERT INTO `traits` VALUES(3, 'attack bonus', 1, 30, 0, 23, 10);
INSERT INTO `traits` VALUES(54, 'resist virus', 1, 35, 0, 245, 0);
INSERT INTO `traits` VALUES(54, 'resist virus', 1, 55, 0, 245, 0);
INSERT INTO `traits` VALUES(54, 'resist virus', 1, 70, 0, 245, 0);
INSERT INTO `traits` VALUES(71, 'savagery', 1, 75, 0, 0, 0);
INSERT INTO `traits` VALUES(72, 'aggressive aim', 1, 75, 0, 0, 0);
INSERT INTO `traits` VALUES(23, 'martial arts', 2, 1, 0, 173, 80);
INSERT INTO `traits` VALUES(67, 'subtle blow', 2, 5, 0, 289, 5);
INSERT INTO `traits` VALUES(17, 'counter', 2, 10, 0, 291, 10);
INSERT INTO `traits` VALUES(7, 'max hp boost', 2, 15, 0, 2, 30);
INSERT INTO `traits` VALUES(23, 'martial arts', 2, 16, 0, 173, 20);
INSERT INTO `traits` VALUES(23, 'martial arts', 2, 31, 0, 173, 20);
INSERT INTO `traits` VALUES(7, 'max hp boost', 2, 35, 0, 2, 30);
INSERT INTO `traits` VALUES(23, 'martial arts', 2, 46, 0, 173, 20);
INSERT INTO `traits` VALUES(66, 'kick attacks', 2, 51, 0, 292, 0);
INSERT INTO `traits` VALUES(7, 'max hp boost', 2, 55, 0, 2, 60);
INSERT INTO `traits` VALUES(23, 'martial arts', 2, 61, 0, 173, 20);
INSERT INTO `traits` VALUES(7, 'max hp boost', 2, 70, 0, 2, 60);
INSERT INTO `traits` VALUES(66, 'kick attacks', 2, 71, 0, 292, 0);
INSERT INTO `traits` VALUES(23, 'martial arts', 2, 75, 0, 173, 20);
INSERT INTO `traits` VALUES(73, 'invigorate', 2, 75, 0, 0, 0);
INSERT INTO `traits` VALUES(74, 'penance', 2, 75, 0, 0, 0);
INSERT INTO `traits` VALUES(6, 'magic def. bonus', 3, 10, 0, 29, 10);
INSERT INTO `traits` VALUES(24, 'clear mind', 3, 20, 0, 295, 0);
INSERT INTO `traits` VALUES(9, 'auto regen', 3, 25, 42, 0, 1);
INSERT INTO `traits` VALUES(6, 'magic def. bonus', 3, 30, 0, 29, 2);
INSERT INTO `traits` VALUES(24, 'clear mind', 3, 35, 0, 295, 0);
INSERT INTO `traits` VALUES(6, 'magic def. bonus', 3, 50, 0, 29, 2);
INSERT INTO `traits` VALUES(24, 'clear mind', 3, 50, 0, 295, 0);
INSERT INTO `traits` VALUES(69, 'divine veil', 3, 50, 0, 0, 0);
INSERT INTO `traits` VALUES(24, 'clear mind', 3, 60, 0, 295, 0);
INSERT INTO `traits` VALUES(6, 'magic def. bonus', 3, 70, 0, 29, 2);
INSERT INTO `traits` VALUES(5, 'magic atk. bonus', 4, 10, 0, 28, 20);
INSERT INTO `traits` VALUES(24, 'clear mind', 4, 15, 0, 295, 0);
INSERT INTO `traits` VALUES(13, 'conserve mp', 4, 20, 0, 296, 0);
INSERT INTO `traits` VALUES(5, 'magic atk. bonus', 4, 30, 0, 28, 4);
INSERT INTO `traits` VALUES(24, 'clear mind', 4, 30, 0, 295, 0);
INSERT INTO `traits` VALUES(24, 'clear mind', 4, 45, 0, 295, 0);
INSERT INTO `traits` VALUES(5, 'magic atk. bonus', 4, 50, 0, 28, 4);
INSERT INTO `traits` VALUES(24, 'clear mind', 4, 60, 0, 295, 0);
INSERT INTO `traits` VALUES(5, 'magic atk. bonus', 4, 70, 0, 28, 4);
INSERT INTO `traits` VALUES(24, 'clear mind', 4, 75, 0, 295, 0);
INSERT INTO `traits` VALUES(53, 'resist petrify', 5, 10, 0, 246, 0);
INSERT INTO `traits` VALUES(12, 'fast cast', 5, 15, 0, 170, 10);
INSERT INTO `traits` VALUES(5, 'magic atk. bonus', 5, 20, 0, 28, 20);
INSERT INTO `traits` VALUES(6, 'magic def. bonus', 5, 25, 0, 29, 10);
INSERT INTO `traits` VALUES(53, 'resist petrify', 5, 30, 0, 246, 0);
INSERT INTO `traits` VALUES(24, 'clear mind', 5, 31, 0, 295, 0);
INSERT INTO `traits` VALUES(12, 'fast cast', 5, 35, 0, 170, 5);
INSERT INTO `traits` VALUES(5, 'magic atk. bonus', 5, 40, 0, 28, 4);
INSERT INTO `traits` VALUES(6, 'magic def. bonus', 5, 45, 0, 29, 2);
INSERT INTO `traits` VALUES(53, 'resist petrify', 5, 50, 0, 246, 0);
INSERT INTO `traits` VALUES(24, 'clear mind', 5, 53, 0, 295, 0);
INSERT INTO `traits` VALUES(12, 'fast cast', 5, 55, 0, 170, 5);
INSERT INTO `traits` VALUES(53, 'resist petrify', 5, 70, 0, 246, 0);
INSERT INTO `traits` VALUES(24, 'clear mind', 5, 75, 0, 295, 0);
INSERT INTO `traits` VALUES(20, 'gilfinder', 6, 5, 0, 0, 0);
INSERT INTO `traits` VALUES(2, 'evasion bonus', 6, 10, 0, 69, 10);
INSERT INTO `traits` VALUES(19, 'treasure hunter', 6, 15, 0, 303, 0);
INSERT INTO `traits` VALUES(58, 'resist gravity', 6, 20, 0, 249, 0);
INSERT INTO `traits` VALUES(2, 'evasion bonus', 6, 30, 0, 69, 12);
INSERT INTO `traits` VALUES(58, 'resist gravity', 6, 40, 0, 249, 0);
INSERT INTO `traits` VALUES(64, 'treasure hunter ii', 6, 45, 0, 303, 0);
INSERT INTO `traits` VALUES(2, 'evasion bonus', 6, 50, 0, 69, 13);
INSERT INTO `traits` VALUES(16, 'triple attack', 6, 55, 0, 302, 5);
INSERT INTO `traits` VALUES(58, 'resist gravity', 6, 60, 0, 249, 0);
INSERT INTO `traits` VALUES(68, 'assassin', 6, 60, 0, 0, 0);
INSERT INTO `traits` VALUES(2, 'evasion bonus', 6, 70, 0, 69, 13);
INSERT INTO `traits` VALUES(58, 'resist gravity', 6, 75, 0, 249, 0);
INSERT INTO `traits` VALUES(75, 'aura steal', 6, 75, 0, 0, 0);
INSERT INTO `traits` VALUES(76, 'ambush', 6, 75, 0, 0, 0);
INSERT INTO `traits` VALUES(39, 'undead killer', 7, 5, 0, 231, 0);
INSERT INTO `traits` VALUES(4, 'defense bonus', 7, 10, 0, 1, 10);
INSERT INTO `traits` VALUES(48, 'resist sleep', 7, 20, 0, 240, 0);
INSERT INTO `traits` VALUES(25, 'shield mastery', 7, 25, 0, 0, 0);
INSERT INTO `traits` VALUES(4, 'defense bonus', 7, 30, 0, 1, 12);
INSERT INTO `traits` VALUES(10, 'auto refresh', 7, 35, 43, 0, 1);
INSERT INTO `traits` VALUES(48, 'resist sleep', 7, 40, 0, 240, 0);
INSERT INTO `traits` VALUES(4, 'defense bonus', 7, 50, 0, 1, 13);
INSERT INTO `traits` VALUES(48, 'resist sleep', 7, 60, 0, 240, 0);
INSERT INTO `traits` VALUES(4, 'defense bonus', 7, 70, 0, 1, 13);
INSERT INTO `traits` VALUES(48, 'resist sleep', 7, 75, 0, 240, 0);
INSERT INTO `traits` VALUES(77, 'iron will', 7, 75, 0, 0, 0);
INSERT INTO `traits` VALUES(78, 'guardian', 7, 75, 0, 0, 0);
INSERT INTO `traits` VALUES(3, 'attack bonus', 8, 10, 0, 23, 10);
INSERT INTO `traits` VALUES(50, 'resist paralyze', 8, 20, 0, 242, 0);
INSERT INTO `traits` VALUES(41, 'arcana killer', 8, 25, 0, 232, 0);
INSERT INTO `traits` VALUES(3, 'attack bonus', 8, 30, 0, 23, 12);
INSERT INTO `traits` VALUES(50, 'resist paralyze', 8, 40, 0, 242, 0);
INSERT INTO `traits` VALUES(3, 'attack bonus', 8, 50, 0, 23, 13);
INSERT INTO `traits` VALUES(50, 'resist paralyze', 8, 60, 0, 242, 0);
INSERT INTO `traits` VALUES(3, 'attack bonus', 8, 70, 0, 23, 13);
INSERT INTO `traits` VALUES(50, 'resist paralyze', 8, 75, 0, 242, 0);
INSERT INTO `traits` VALUES(79, 'muted soul', 8, 75, 0, 0, 0);
INSERT INTO `traits` VALUES(80, 'desperate blows', 8, 75, 0, 0, 0);
INSERT INTO `traits` VALUES(34, 'vermin killer', 9, 10, 0, 224, 0);
INSERT INTO `traits` VALUES(59, 'resist slow', 9, 15, 0, 250, 0);
INSERT INTO `traits` VALUES(36, 'bird killer', 9, 20, 0, 225, 0);
INSERT INTO `traits` VALUES(37, 'amorph killer', 9, 30, 0, 226, 0);
INSERT INTO `traits` VALUES(59, 'resist slow', 9, 35, 0, 250, 0);
INSERT INTO `traits` VALUES(35, 'lizard killer', 9, 40, 0, 227, 0);
INSERT INTO `traits` VALUES(38, 'aquan killer', 9, 50, 0, 228, 0);
INSERT INTO `traits` VALUES(59, 'resist slow', 9, 55, 0, 250, 0);
INSERT INTO `traits` VALUES(33, 'plantoid killer', 9, 60, 0, 229, 0);
INSERT INTO `traits` VALUES(32, 'beast killer', 9, 70, 0, 230, 0);
INSERT INTO `traits` VALUES(59, 'resist slow', 9, 75, 0, 250, 0);
INSERT INTO `traits` VALUES(81, 'beast affinity ', 9, 75, 0, 0, 0);
INSERT INTO `traits` VALUES(82, 'beast healer', 9, 75, 0, 0, 0);
INSERT INTO `traits` VALUES(52, 'resist silence', 10, 5, 0, 244, 0);
INSERT INTO `traits` VALUES(52, 'resist silence', 10, 25, 0, 244, 0);
INSERT INTO `traits` VALUES(52, 'resist silence', 10, 45, 0, 244, 0);
INSERT INTO `traits` VALUES(52, 'resist silence', 10, 65, 0, 244, 0);
INSERT INTO `traits` VALUES(21, 'alertness', 11, 5, 0, 0, 0);
INSERT INTO `traits` VALUES(1, 'accuracy bonus', 11, 10, 0, 64, 10);
INSERT INTO `traits` VALUES(11, 'rapid shot', 11, 15, 0, 0, 0);
INSERT INTO `traits` VALUES(49, 'resist poison', 11, 20, 0, 241, 0);
INSERT INTO `traits` VALUES(1, 'accuracy bonus', 11, 30, 0, 64, 12);
INSERT INTO `traits` VALUES(49, 'resist poison', 11, 40, 0, 241, 0);
INSERT INTO `traits` VALUES(1, 'accuracy bonus', 11, 50, 0, 64, 13);
INSERT INTO `traits` VALUES(49, 'resist poison', 11, 60, 0, 241, 0);
INSERT INTO `traits` VALUES(1, 'accuracy bonus', 11, 70, 0, 64, 13);
INSERT INTO `traits` VALUES(83, 'snapshot', 11, 75, 0, 0, 0);
INSERT INTO `traits` VALUES(84, 'recycle', 11, 75, 0, 305, 0);
INSERT INTO `traits` VALUES(51, 'resist blind', 12, 5, 0, 243, 0);
INSERT INTO `traits` VALUES(14, 'store tp', 12, 10, 0, 73, 10);
INSERT INTO `traits` VALUES(70, 'zanshin', 12, 20, 0, 306, 0);
INSERT INTO `traits` VALUES(51, 'resist blind', 12, 25, 0, 243, 0);
INSERT INTO `traits` VALUES(14, 'store tp', 12, 30, 0, 73, 5);
INSERT INTO `traits` VALUES(42, 'demon killer', 12, 40, 0, 234, 0);
INSERT INTO `traits` VALUES(51, 'resist blind', 12, 45, 0, 243, 0);
INSERT INTO `traits` VALUES(14, 'store tp', 12, 50, 0, 73, 5);
INSERT INTO `traits` VALUES(70, 'zanshin', 12, 60, 0, 306, 0);
INSERT INTO `traits` VALUES(51, 'resist blind', 12, 65, 0, 243, 0);
INSERT INTO `traits` VALUES(14, 'store tp', 12, 70, 0, 73, 5);
INSERT INTO `traits` VALUES(85, 'ikishoten', 12, 75, 0, 0, 0);
INSERT INTO `traits` VALUES(86, 'overwhelm', 12, 75, 0, 0, 0);
INSERT INTO `traits` VALUES(22, 'stealth', 13, 5, 0, 0, 0);
INSERT INTO `traits` VALUES(18, 'dual wield', 13, 10, 0, 259, 10);
INSERT INTO `traits` VALUES(57, 'resist bind', 13, 10, 0, 247, 0);
INSERT INTO `traits` VALUES(67, 'subtle blow', 13, 15, 0, 289, 5);
INSERT INTO `traits` VALUES(18, 'dual wield', 13, 25, 0, 259, 5);
INSERT INTO `traits` VALUES(57, 'resist bind', 13, 30, 0, 247, 0);
INSERT INTO `traits` VALUES(18, 'dual wield', 13, 45, 0, 259, 10);
INSERT INTO `traits` VALUES(57, 'resist bind', 13, 50, 0, 247, 0);
INSERT INTO `traits` VALUES(18, 'dual wield', 13, 65, 0, 259, 5);
INSERT INTO `traits` VALUES(57, 'resist bind', 13, 70, 0, 247, 0);
INSERT INTO `traits` VALUES(87, 'ninja tool expert.', 13, 75, 0, 308, 0);
INSERT INTO `traits` VALUES(3, 'attack bonus', 14, 10, 0, 23, 10);
INSERT INTO `traits` VALUES(43, 'dragon killer', 14, 25, 0, 233, 0);
INSERT INTO `traits` VALUES(1, 'accuracy bonus', 14, 30, 0, 64, 10);
INSERT INTO `traits` VALUES(88, 'empathy', 14, 75, 0, 0, 0);
INSERT INTO `traits` VALUES(89, 'strafe', 14, 75, 0, 0, 0);
INSERT INTO `traits` VALUES(8, 'max mp boost', 15, 10, 0, 5, 10);
INSERT INTO `traits` VALUES(24, 'clear mind', 15, 15, 0, 295, 0);
INSERT INTO `traits` VALUES(59, 'resist slow', 15, 20, 0, 250, 0);
INSERT INTO `traits` VALUES(10, 'auto refresh', 15, 25, 0, 0, 0);
INSERT INTO `traits` VALUES(8, 'max mp boost', 15, 30, 0, 5, 10);
INSERT INTO `traits` VALUES(24, 'clear mind', 15, 30, 0, 295, 0);
INSERT INTO `traits` VALUES(59, 'resist slow', 15, 40, 0, 250, 0);
INSERT INTO `traits` VALUES(24, 'clear mind', 15, 45, 0, 295, 0);
INSERT INTO `traits` VALUES(8, 'max mp boost', 15, 50, 0, 5, 20);
INSERT INTO `traits` VALUES(24, 'clear mind', 15, 60, 0, 295, 0);
INSERT INTO `traits` VALUES(59, 'resist slow', 15, 60, 0, 250, 0);
INSERT INTO `traits` VALUES(8, 'max mp boost', 15, 70, 0, 5, 20);
INSERT INTO `traits` VALUES(24, 'clear mind', 15, 70, 0, 295, 0);
INSERT INTO `traits` VALUES(90, 'enchainment', 16, 75, 0, 0, 0);
INSERT INTO `traits` VALUES(91, 'assimilation', 16, 75, 0, 0, 0);
INSERT INTO `traits` VALUES(50, 'resist paralyze', 17, 5, 0, 242, 0);
INSERT INTO `traits` VALUES(11, 'rapid shot', 17, 15, 0, 0, 0);
INSERT INTO `traits` VALUES(92, 'winning streak', 17, 75, 0, 0, 0);
INSERT INTO `traits` VALUES(93, 'loaded deck', 17, 75, 0, 0, 0);
INSERT INTO `traits` VALUES(59, 'resist slow', 18, 10, 0, 250, 0);
INSERT INTO `traits` VALUES(2, 'evasion bonus', 18, 20, 0, 69, 10);
INSERT INTO `traits` VALUES(23, 'martial arts', 18, 25, 0, 173, 20);
INSERT INTO `traits` VALUES(94, 'fine-tuning', 18, 75, 0, 0, 0);
INSERT INTO `traits` VALUES(95, 'optimization', 18, 75, 0, 0, 0);
INSERT INTO `traits` VALUES(2, 'evasion bonus', 19, 15, 0, 69, 10);
INSERT INTO `traits` VALUES(59, 'resist slow', 19, 20, 0, 250, 0);
INSERT INTO `traits` VALUES(67, 'subtle blow', 19, 25, 0, 289, 5);
INSERT INTO `traits` VALUES(1, 'accuracy bonus', 19, 30, 0, 64, 10);
INSERT INTO `traits` VALUES(96, 'closed position', 19, 75, 0, 0, 0);
INSERT INTO `traits` VALUES(52, 'resist silence', 20, 10, 0, 244, 0);
INSERT INTO `traits` VALUES(24, 'clear mind', 20, 20, 0, 295, 0);
INSERT INTO `traits` VALUES(13, 'conserve mp', 20, 25, 0, 296, 0);
INSERT INTO `traits` VALUES(8, 'max mp boost', 20, 30, 0, 5, 10);
INSERT INTO `traits` VALUES(97, 'stormsurge', 20, 75, 0, 0, 0);
-- trait id, job, lvl, effect, mod, value 
INSERT INTO `traits` VALUES(59, 'widescan', 9, 1, 0, 340, 50);
INSERT INTO `traits` VALUES(59, 'widescan', 11, 1, 0, 340, 150);
INSERT INTO `traits` VALUES(59, 'widescan', 11, 20, 0, 340, 50);
INSERT INTO `traits` VALUES(59, 'widescan', 11, 40, 0, 340, 50);
INSERT INTO `traits` VALUES(59, 'widescan', 11, 60, 0, 340, 50);
INSERT INTO `traits` VALUES(59, 'widescan', 9, 20, 0, 340, 100);
INSERT INTO `traits` VALUES(59, 'widescan', 9, 40, 0, 340, 50);
INSERT INTO `traits` VALUES(59, 'widescan', 9, 60, 0, 340, 50);