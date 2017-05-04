-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- G?n?r? le : Dim 07 Octobre 2012 ? 09:39
-- Version du serveur: 6.0.0
-- Version de PHP: 5.2.9-2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de donn?es: `dspdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `item_mods_pet`
--

DROP TABLE IF EXISTS `item_mods_pet`;
CREATE TABLE IF NOT EXISTS `item_mods_pet` (
 `itemId` smallint(5) unsigned NOT NULL,
 `modId` smallint(5) unsigned NOT NULL,
 `value` smallint(5) NOT NULL DEFAULT '0',
 PRIMARY KEY (`itemId`, `modId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=13 PACK_KEYS=1;

-- Please keep mods that apply to same item ID together
-- (easy way is to just keep item ID sequential)


INSERT INTO `item_mods_pet` VALUES (10296,25,3); -- AUTOMATON:ACC
INSERT INTO `item_mods_pet` VALUES (10296,26,3); -- AUTOMATON:RACC
INSERT INTO `item_mods_pet` VALUES (10296,30,3); -- AUTOMATON:MACC
INSERT INTO `item_mods_pet` VALUES (10299,288,2); -- Pet:Double Atk+2%
INSERT INTO `item_mods_pet` VALUES (10440,384,61); -- Automaton: Haste+6%
INSERT INTO `item_mods_pet` VALUES (10530,28,5); -- AVATAR:MAB
INSERT INTO `item_mods_pet` VALUES (10531,28,5); -- AVATAR:MAB
INSERT INTO `item_mods_pet` VALUES (10532,28,5); -- AVATAR:MAB
INSERT INTO `item_mods_pet` VALUES (10664,28,4); -- AVATAR:MAB
INSERT INTO `item_mods_pet` VALUES (10684,165,6); -- Pet: Critical Hit Rate +6%
INSERT INTO `item_mods_pet` VALUES (10704,25,10); -- AVATAR Acc +10
INSERT INTO `item_mods_pet` VALUES (10724,30,5); -- Avatar MMACC +5
INSERT INTO `item_mods_pet` VALUES (10744,23,10); -- AVATAR ATTACK +10
INSERT INTO `item_mods_pet` VALUES (10744,165,5); -- AVATAR MCR
INSERT INTO `item_mods_pet` VALUES (11338,25,3); -- Pet: accuracy +3
INSERT INTO `item_mods_pet` VALUES (11338,289,3); -- Pet: Subtle Blow +3
INSERT INTO `item_mods_pet` VALUES (11497,384,51); -- Pet: Haste+5% (Gear)
INSERT INTO `item_mods_pet` VALUES (11531,73,3); -- Pet: Store TP +3
INSERT INTO `item_mods_pet` VALUES (11612,28,2); -- Pet: MAB +2
INSERT INTO `item_mods_pet` VALUES (11619,368,25); -- Pet: Regain + 25
INSERT INTO `item_mods_pet` VALUES (11739,28,2); -- Pet: MAB +2
INSERT INTO `item_mods_pet` VALUES (11739,27,2); -- Pet: Enmity +2
INSERT INTO `item_mods_pet` VALUES (14228,25,14); -- Pet: Accuracy +14
INSERT INTO `item_mods_pet` VALUES (14468,27,5); -- Pet: Enmity +5
INSERT INTO `item_mods_pet` VALUES (14514,165,4); -- Pet: Critical Hit Rate +4%
INSERT INTO `item_mods_pet` VALUES (14923,25,14); -- Pet: Accuracy +14
INSERT INTO `item_mods_pet` VALUES (14958,63,5); -- Pet: Defense Bonus 5%
INSERT INTO `item_mods_pet` VALUES (15101,165,3); -- Pet: Critical Hit Rate +3%
INSERT INTO `item_mods_pet` VALUES (15116,25,14); -- Pet: Accuracy +14
INSERT INTO `item_mods_pet` VALUES (15146,23,14); -- Pet: Attack +14
INSERT INTO `item_mods_pet` VALUES (15575,25,14); -- Pet: Accuracy +14
INSERT INTO `item_mods_pet` VALUES (15647,1,10); -- Pet: DEF +10
INSERT INTO `item_mods_pet` VALUES (15649,1,10); -- Pet: DEF +10
INSERT INTO `item_mods_pet` VALUES (15679,23,14); -- Pet: Attack +14
INSERT INTO `item_mods_pet` VALUES (15944,163,-7); -- Pet: Magic Damage taken -3%
INSERT INTO `item_mods_pet` VALUES (16173,1,10); -- Pet: DEF +10
INSERT INTO `item_mods_pet` VALUES (16297,161,-2); -- Pet: Damage taken -2%
INSERT INTO `item_mods_pet` VALUES (16368,25,10); -- Pet: accuracy +10
INSERT INTO `item_mods_pet` VALUES (17961,1,10); -- Pet: DEF +10
INSERT INTO `item_mods_pet` VALUES (18999,23,40); -- Pet: Attack +40
INSERT INTO `item_mods_pet` VALUES (19005,28,20); -- Pet: MAB +20
INSERT INTO `item_mods_pet` VALUES (19772,28,1); -- Pet: MAB +1
INSERT INTO `item_mods_pet` VALUES (21361,28,6); -- Pet: MAB +6
INSERT INTO `item_mods_pet` VALUES (27080,25,20);	-- Avatar. ACC
INSERT INTO `item_mods_pet` VALUES (27081,25,30);	--Avatar. ACC
INSERT INTO `item_mods_pet` VALUES (27265,345,550);	-- Avatar. TP Bonus
INSERT INTO `item_mods_pet` VALUES (27266,345,600);	-- Avatar. TP Bonus
INSERT INTO `item_mods_pet` VALUES (27439,30,17);	-- Avatar. MACC
INSERT INTO `item_mods_pet` VALUES (27440,30,27);	-- Avatar. MACC
INSERT INTO `item_mods_pet` VALUES (28119,65,2); -- Pet: Evasion +2
INSERT INTO `item_mods_pet` VALUES (28356,28,5); -- Pet: MAB +5
