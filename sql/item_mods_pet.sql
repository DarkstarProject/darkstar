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

-- -------------------------------------------------------
-- Aega's Doublet - LVL 32
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(11338, 25, 3); -- Pet: accuracy +3
INSERT INTO `item_mods_pet` VALUES(11338, 289, 3); -- Pet: Subtle Blow +3

-- -------------------------------------------------------
-- Spurrer Beret - LVL 75
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(11497, 384, 51); -- Pet: Haste+5% (Gear)

-- -------------------------------------------------------
-- Fidelity Mantle - LVL 30
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(11531, 73, 3); -- Pet: Store TP +3

-- -------------------------------------------------------
-- Beast Bazubands - LVL 70
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(14958, 63, 5); -- Pet: Defense Bonus 5%

-- -------------------------------------------------------
-- Askar Dirs - LVL 75
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(15647, 1, 10); -- Pet: DEF +10

-- -------------------------------------------------------
-- Goliard Trews - 75
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(15649, 1, 10); -- Pet: DEF +10

-- -------------------------------------------------------
-- Selemnus Belt - LVL 70
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(15944, 163, -7); -- Pet: Magic Damage taken -3%

-- -------------------------------------------------------
-- Pallas's Shield - LVL 72
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(16173, 1, 10); -- Pet: DEF +10

-- -------------------------------------------------------
-- Shepherd's Chain - LVL 60
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(16297, 161, -2); -- Pet: Damage taken -2%

-- -------------------------------------------------------
-- Herder's Subligar - LVL 25
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(16368, 25, 10); -- Pet: accuracy +10

-- -------------------------------------------------------
-- Lion Tamer - LVL 74
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(17961, 1, 10); -- Pet: DEF +10

-- -------------------------------------------------------
-- Aymur *Mythic* - LVL 75 - ignored the Aftermath acc, atk occ.attacks twice
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(18999, 23, 40); -- Pet: Attack +40

-- -------------------------------------------------------
-- Idi's Ledelsens - LVL 45
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(28119, 65, 2); -- Pet: Evasion +2

-- -------------------------------------------------------
-- Summoner's Bracers - LVL 72
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(15116, 25, 14); -- Pet: Accuracy +14

-- -------------------------------------------------------
-- Summoner's Bracers + 1 - LVL 75
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(14923, 25, 14); -- Pet: Accuracy +14

-- -------------------------------------------------------
-- Evoker's Spats - LVL 52
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(14228, 25, 14); -- Pet: Accuracy +14

-- -------------------------------------------------------
-- Evoker's Spats + 1 - LVL 74
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(15575, 25, 14); -- Pet: Accuracy +14

-- -------------------------------------------------------
-- Summoner's Pigaches - LVL 73
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(15146, 23, 14); -- Pet: Attack +14

-- -------------------------------------------------------
-- Summoner's Pigaches + 1 - LVL 75
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(15679, 23, 14); -- Pet: Attack +14

-- -------------------------------------------------------
-- Yinyang Robe - LVL 71
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(14468, 27, 5); -- Pet: Enmity +5

-- -------------------------------------------------------
-- Summoner's Doublet - LVL 74
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(15101, 165, 3); -- Pet: Critical Hit Rate +3%

-- -------------------------------------------------------
-- Summoner's Doublet + 1 - LVL 75
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(14514, 165, 4); -- Pet: Critical Hit Rate +4%

-- -------------------------------------------------------
-- Summoner's Doublet + 2 - LVL 90
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(10684, 165, 6); -- Pet: Critical Hit Rate +6%

-- -------------------------------------------------------
-- Nirvana *Mythic* - LVL 75 - ignored the Aftermath acc, atk occ.attacks twice
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(19005, 28, 20); -- Pet: MAB +20

-- -------------------------------------------------------
-- Esper Stone - LVL 94
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(19772, 28, 1); -- Pet: MAB +1

-- -------------------------------------------------------
-- Esper Stone + 1 - LVL 99
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(21361, 28, 6); -- Pet: MAB +6

-- -------------------------------------------------------
-- Caller's Pendant - LVL 84
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(11619, 368, 25); -- Pet: Regain + 25

-- -------------------------------------------------------
-- Eidolon Pendant - LVL 79
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(11612, 28, 2); -- Pet: MAB +2

-- -------------------------------------------------------
-- Eidolon Pendant + 1 - LVL 99
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(28356, 28, 5); -- Pet: MAB +5

-- -------------------------------------------------------
-- Caller's Sash - LVL 80
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(11739, 28, 2); -- Pet: MAB +2
INSERT INTO `item_mods_pet` VALUES(11739, 27, 2); -- Pet: Enmity +2
-- -------------------------------------------------------
-- Sabong Earring - LVL 99
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (10299,288,2); -- Pet:Double Atk+2%
-- -------------------------------------------------------
-- Charivari Earring - LVL 99
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (10296,25,3); -- AUTOMATON:ACC
INSERT INTO `item_mods_pet` VALUES (10296,26,3); -- AUTOMATON:RACC
INSERT INTO `item_mods_pet` VALUES (10296,30,3); -- AUTOMATON:MACC
-- -------------------------------------------------------
-- Tethyan Cuffs +1 - LVL 99
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (10530,28,5); -- AVATAR:MAB
-- -------------------------------------------------------
-- Tethyan Cuffs +2 - LVL 99
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (10531,28,5); -- AVATAR:MAB
-- -------------------------------------------------------
-- Tethyan Cuffs +3 - LVL 99
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (10532,28,5); -- AVATAR:MAB
-- -------------------------------------------------------
-- Smn. Horn +2 - LVL 90
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (10664,28,4); -- AVATAR:MAB

-- -------------------------------------------------------
-- Smn. Bracers +2 - LVL 90
-- -------------------------------------------------------
-- INSERT INTO `item_mods_pet` VALUES (10704,AVATAR:ENHANCES ACC,1);
-- -------------------------------------------------------
-- Smn. Spats +2 - LVL 90
-- -------------------------------------------------------
-- INSERT INTO `item_mods_pet` VALUES (10724,AVATAR:ENHANCES MACC,1);
-- -------------------------------------------------------
-- Smn. Pigaches +2 - LVL 90
-- -------------------------------------------------------
-- INSERT INTO `item_mods_pet` VALUES (10744,AVATAR:ENHANCES ATTACK,1);
INSERT INTO `item_mods_pet` VALUES (10744,165,5); -- AVATAR MCR