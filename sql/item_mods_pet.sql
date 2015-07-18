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
--   Aega's Doublet - LVL 32
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(11338, 25, 3); --  Pet: accuracy +3
INSERT INTO `item_mods_pet` VALUES(11338, 289, 3); -- Pet: Subtle Blow +3

-- -------------------------------------------------------
--   Spurrer Beret - LVL 75
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(11497, 384, 51); -- Pet: Haste+5% (Gear)

-- -------------------------------------------------------
--  Fidelity Mantle - LVL 30
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(11531, 73, 3); -- Pet: Store TP +3

-- -------------------------------------------------------
--  Beast Bazubands - LVL 70
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(14958, 63, 5); -- Pet: Defense Bonus 5%

-- -------------------------------------------------------
--  Askar Dirs - LVL 75
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(15647, 1, 10); -- Pet: DEF +10

-- -------------------------------------------------------
--  Goliard Trews - 75
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(15649, 1, 10); -- Pet: DEF +10

-- -------------------------------------------------------
--  Selemnus Belt - LVL 70
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(15944, 163, -7); -- Pet: Magic Damage taken -3%

-- -------------------------------------------------------
--  Pallas's Shield - LVL 72
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(16173, 1, 10); -- Pet: DEF +10

-- -------------------------------------------------------
--  Shepherd's Chain - LVL 60
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(16297, 161, -2); -- Pet: Damage taken -2%

-- -------------------------------------------------------
--  Herder's Subligar - LVL 25
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(16368, 25, 10); -- Pet: accuracy +10

-- -------------------------------------------------------
--  Lion Tamer - LVL 74
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(17961, 1, 10); -- Pet: DEF +10

-- -------------------------------------------------------
--  Aymur *Mythic* - LVL 75 - ignored the Aftermath acc, atk occ.attacks twice
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(18999, 23, 40); -- Pet: Attack +40

-- -------------------------------------------------------
--  Idi's Ledelsens - LVL 45 
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(28119, 65, 2); -- Pet: Evasion +2

-- -------------------------------------------------------
--  Summoner's Bracers - LVL 72
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(15116, 25, 14); -- Pet: Accuracy +14

-- -------------------------------------------------------
--  Summoner's Bracers + 1 - LVL 75
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(14923, 25, 14); -- Pet: Accuracy +14

-- -------------------------------------------------------
--  Evoker's Spats - LVL 52
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(14228, 25, 14); -- Pet: Accuracy +14

-- -------------------------------------------------------
--  Evoker's Spats + 1 - LVL 74
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES(15575, 25, 14); -- Pet: Accuracy +14

-- -------------------------------------------------------
-- Asn. Armlets +2 
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10695, 1, 21); -- DEF:21
INSERT INTO `item_mods` VALUES (10695, 14, 7); -- CHR+7
INSERT INTO `item_mods` VALUES (10695, 25, 9); -- ACC+9
INSERT INTO `item_mods` VALUES (10695, 68, 9); -- EVA+9
INSERT INTO `item_mods` VALUES (10695, 27, 5); -- Enmity+5
-- [NOT CODED] Treasure Hunter already coded


-- -------------------------------------------------------
-- Raid. Poulaines +2
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11149, 1, 23); -- DEF:23
INSERT INTO `item_mods` VALUES (11149, 11, 15); -- AGI+15 
INSERT INTO `item_mods` VALUES (11149, 68, 11); -- EVA+11

-- [NOT CODED] Treasure Hunter already coded


-- -------------------------------------------------------
-- Toro Cape
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28615, 1, 10); -- DEF:10
INSERT INTO `item_mods` VALUES (28615, 12, 8); -- INT+8
INSERT INTO `item_mods` VALUES (28615, 28, 10); -- Magic Attack Bonus+10
INSERT INTO `item_mods` VALUES (28615, 55, 20); -- Ice resist+20
-- [NOT CODED]  Occasionally absorbs ice elemental damage


-- -------------------------------------------------------
-- Atheling Mantle 
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16260, 1, 15); -- DEF:10
INSERT INTO `item_mods` VALUES (16260, 23, 20); -- Attack+20
INSERT INTO `item_mods` VALUES (16260, 288, 3); -- double attack 3%



-- -------------------------------------------------------
--  Friomisi Earring 
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28514, 28, 10); -- Magic Attack Bonus+10
INSERT INTO `item_mods` VALUES (28514, 27, 2); -- Enmity+2


-- -------------------------------------------------------
--   Ifrit Ring +1 
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27565, 8, 9); -- STR+9
INSERT INTO `item_mods` VALUES (27565, 54, 16); -- Fire resist+16
INSERT INTO `item_mods` VALUES (27565, 23, 5); -- Attack+5


-- -------------------------------------------------------
--    Shiva Ring +1 
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27575, 12, 9); -- INT+9
INSERT INTO `item_mods` VALUES (27575, 55, 16 16); -- Ice resist+16
INSERT INTO `item_mods` VALUES (27575, 28, 3); -- Magic Attack Bonus+3


-- -------------------------------------------------------
--     Mes. Haubergeon  
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27886, 1, 140); -- DEF:140
INSERT INTO `item_mods` VALUES (27886, 2, 63); -- HP+63
INSERT INTO `item_mods` VALUES (27886, 5, 35); -- MP+35
INSERT INTO `item_mods` VALUES (27886, 8, 29); -- STR+29
INSERT INTO `item_mods` VALUES (27886, 9, 29); -- DEX+29
INSERT INTO `item_mods` VALUES (27886, 10, 29); -- VIT+29
INSERT INTO `item_mods` VALUES (27886, 11, 6); -- AGI+6
INSERT INTO `item_mods` VALUES (27886, 12, 6); -- INT+6
INSERT INTO `item_mods` VALUES (27886, 13, 6); -- MND+6
INSERT INTO `item_mods` VALUES (27886, 14, 6); -- CHR+6
INSERT INTO `item_mods` VALUES (27886, 25, 30); -- Accuracy+30
INSERT INTO `item_mods` VALUES (27886, 23, 30); -- Attack+30
INSERT INTO `item_mods` VALUES (27886, 384, 30); -- Haste+3
INSERT INTO `item_mods` VALUES (27886, 288, 2); -- "Double Attack"+2%


-- -------------------------------------------------------
--     Mes'yohi Slacks  
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (228172, 1, 107); -- DEF:107
INSERT INTO `item_mods` VALUES (228172, 2, 43); -- HP+43
INSERT INTO `item_mods` VALUES (228172, 5, 29); -- MP+29
INSERT INTO `item_mods` VALUES (228172, 8, 25); -- STR+25
INSERT INTO `item_mods` VALUES (228172, 10, 12); -- VIT+12
INSERT INTO `item_mods` VALUES (228172, 11, 17); -- AGI+17
INSERT INTO `item_mods` VALUES (228172, 12, 39); -- INT+39
INSERT INTO `item_mods` VALUES (228172, 13, 6); -- MND+29
INSERT INTO `item_mods` VALUES (228172, 14, 6); -- CHR+19
INSERT INTO `item_mods` VALUES (228172, 30, 20); -- Magic Accuracy+20
INSERT INTO `item_mods` VALUES (228172, 31, 107); -- Magic Evasion+107
INSERT INTO `item_mods` VALUES (228172, 29, 8; -- "Magic Def. Bonus"+8
INSERT INTO `item_mods` VALUES (228172, 384, 50); -- Haste+5
-- [NOT CODED] Depending on day: Magic Accuracy+25


-- -------------------------------------------------------
--     Cetl Belt  
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28460, 1, 14); -- DEF:14
INSERT INTO `item_mods` VALUES (28460, 288, 4); -- "Double Attack"+2%
INSERT INTO `item_mods` VALUES (28460, 384, 50); -- Haste+5


-- -------------------------------------------------------
-- Hagondes Coat +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27878, 1, 123);
INSERT INTO `item_mods` VALUES (27878, 2, 54);
INSERT INTO `item_mods` VALUES (27878, 5, 59);
INSERT INTO `item_mods` VALUES (27878, 8, 19);
INSERT INTO `item_mods` VALUES (27878, 9, 19);
INSERT INTO `item_mods` VALUES (27878, 10, 19);
INSERT INTO `item_mods` VALUES (27878, 11, 19);
INSERT INTO `item_mods` VALUES (27878, 12, 32);
INSERT INTO `item_mods` VALUES (27878, 13, 27);
INSERT INTO `item_mods` VALUES (27878, 14, 27);
INSERT INTO `item_mods` VALUES (27878, 28, 10);
INSERT INTO `item_mods` VALUES (27878, 68, 41);
INSERT INTO `item_mods` VALUES (27878, 31, 80);
INSERT INTO `item_mods` VALUES (27878, 29, 6);
INSERT INTO `item_mods` VALUES (27878, 384, 300);
INSERT INTO `item_mods` VALUES (27878, 369, 20);


-- -------------------------------------------------------
-- Hag. Sabots +1 
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28301, 1, 62);
INSERT INTO `item_mods` VALUES (28301, 2, 23);
INSERT INTO `item_mods` VALUES (28301, 5, 24);
INSERT INTO `item_mods` VALUES (28301, 8, 8);
INSERT INTO `item_mods` VALUES (28301, 9, 9);
INSERT INTO `item_mods` VALUES (28301, 10, 8);
INSERT INTO `item_mods` VALUES (28301, 11, 31);
INSERT INTO `item_mods` VALUES (28301, 12, 17);
INSERT INTO `item_mods` VALUES (28301, 13, 17);
INSERT INTO `item_mods` VALUES (28301, 14, 32);
INSERT INTO `item_mods` VALUES (28301, 68, 55);
INSERT INTO `item_mods` VALUES (28301, 31, 107);
INSERT INTO `item_mods` VALUES (28301, 29, 5);
INSERT INTO `item_mods` VALUES (28301, 384, 40);
INSERT INTO `item_mods` VALUES (28301, 312, 25);
INSERT INTO `item_mods` VALUES (28301, 27, -8);


-- -------------------------------------------------------
--  Hagondes Pants +1 
-- ------------------------------------------------------
INSERT INTO `item_mods` VALUES (28164, 1, 102);
INSERT INTO `item_mods` VALUES (28164, 2, 43);
INSERT INTO `item_mods` VALUES (28164, 5, 29);
INSERT INTO `item_mods` VALUES (28164, 8, 23);
INSERT INTO `item_mods` VALUES (28164, 10, 10);
INSERT INTO `item_mods` VALUES (28164, 11, 15);
INSERT INTO `item_mods` VALUES (28164, 12, 32);
INSERT INTO `item_mods` VALUES (28164, 13, 22);
INSERT INTO `item_mods` VALUES (28164, 14, 17);
INSERT INTO `item_mods` VALUES (28164, 28, 25);
INSERT INTO `item_mods` VALUES (28164, 163, 10);
INSERT INTO `item_mods` VALUES (28164, 68, 27);
INSERT INTO `item_mods` VALUES (28164, 31, 107);
INSERT INTO `item_mods` VALUES (28164, 29, 6);
INSERT INTO `item_mods` VALUES (28164, 384, 50);


-- -------------------------------------------------------
--   Hagondes Cuffs +1 
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28022, 1, 82);
INSERT INTO `item_mods` VALUES (28022, 2, 30);
INSERT INTO `item_mods` VALUES (28022, 5, 22);
INSERT INTO `item_mods` VALUES (28022, 8, 6);
INSERT INTO `item_mods` VALUES (28022, 9, 26);
INSERT INTO `item_mods` VALUES (28022, 10, 23);
INSERT INTO `item_mods` VALUES (28022, 11, 3);
INSERT INTO `item_mods` VALUES (28022, 12, 17);
INSERT INTO `item_mods` VALUES (28022, 13, 31);
INSERT INTO `item_mods` VALUES (28022, 14, 17);
INSERT INTO `item_mods` VALUES (28022, 30, 20);
INSERT INTO `item_mods` VALUES (28022, 68, 37);
INSERT INTO `item_mods` VALUES (28022, 29, 3);
INSERT INTO `item_mods` VALUES (28022, 384, 30);
INSERT INTO `item_mods` VALUES (28022, 27, -8);


-- -------------------------------------------------------
--  Hagondes Hat +1 
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27732, 1, 93);
INSERT INTO `item_mods` VALUES (27732, 2, 36);
INSERT INTO `item_mods` VALUES (27732, 5, 32);
INSERT INTO `item_mods` VALUES (27732, 8, 16);
INSERT INTO `item_mods` VALUES (27732, 9, 16);
INSERT INTO `item_mods` VALUES (27732, 10, 16);
INSERT INTO `item_mods` VALUES (27732, 11, 16);
INSERT INTO `item_mods` VALUES (27732, 12, 21);
INSERT INTO `item_mods` VALUES (27732, 13, 21);
INSERT INTO `item_mods` VALUES (27732, 14, 21);
INSERT INTO `item_mods` VALUES (27732, 28, 13);
INSERT INTO `item_mods` VALUES (27732, 68, 36);
INSERT INTO `item_mods` VALUES (27732, 31, 75);
INSERT INTO `item_mods` VALUES (27732, 29, 5);
INSERT INTO `item_mods` VALUES (27732, 384, 60);


-- -------------------------------------------------------
--  Hecate's Earring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11698, 28, 6);
INSERT INTO `item_mods` VALUES (11698, 165, 3);


-- -------------------------------------------------------
--  Cizin Helm +1  
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27728, 1, 111);
INSERT INTO `item_mods` VALUES (27728, 2, 41);
INSERT INTO `item_mods` VALUES (27728, 5, 23);
INSERT INTO `item_mods` VALUES (27728, 8, 23);
INSERT INTO `item_mods` VALUES (27728, 9, 17);
INSERT INTO `item_mods` VALUES (27728, 10, 23);
INSERT INTO `item_mods` VALUES (27728, 11, 17);
INSERT INTO `item_mods` VALUES (27728, 12, 15);
INSERT INTO `item_mods` VALUES (27728, 13, 15);
INSERT INTO `item_mods` VALUES (27728, 14, 15);
INSERT INTO `item_mods` VALUES (27728, 68, 33);
INSERT INTO `item_mods` VALUES (27728, 31, 32);
INSERT INTO `item_mods` VALUES (27728, 29, 2);
INSERT INTO `item_mods` VALUES (27728, 384, 81);
INSERT INTO `item_mods` VALUES (27728, 27, 5);
INSERT INTO `item_mods` VALUES (27728, 170, 50);


-- -------------------------------------------------------
--  Cizin Mail +1  
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27874, 1, 142);
INSERT INTO `item_mods` VALUES (27874, 2, 63);
INSERT INTO `item_mods` VALUES (27874, 5, 35);
INSERT INTO `item_mods` VALUES (27874, 8, 29);
INSERT INTO `item_mods` VALUES (27874, 9, 19);
INSERT INTO `item_mods` VALUES (27874, 1, 29);
INSERT INTO `item_mods` VALUES (27874, 11, 19);
INSERT INTO `item_mods` VALUES (27874, 12, 19);
INSERT INTO `item_mods` VALUES (27874, 13, 19);
INSERT INTO `item_mods` VALUES (27874, 14, 19);
INSERT INTO `item_mods` VALUES (27874, 15, 10);
INSERT INTO `item_mods` VALUES (27874, 68, 41);
INSERT INTO `item_mods` VALUES (27874, 31, 48);
INSERT INTO `item_mods` VALUES (27874, 29, 4);
INSERT INTO `item_mods` VALUES (27874, 384, 30);



-- -------------------------------------------------------
--  Cizin Mufflers +1 
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28018, 1, 100);
INSERT INTO `item_mods` VALUES (28018, 2, 29);
INSERT INTO `item_mods` VALUES (28018, 8, 8);
INSERT INTO `item_mods` VALUES (28018, 9, 27);
INSERT INTO `item_mods` VALUES (28018, 10, 31);
INSERT INTO `item_mods` VALUES (28018, 12, 8);
INSERT INTO `item_mods` VALUES (28018, 13, 23);
INSERT INTO `item_mods` VALUES (28018, 14, 17);
INSERT INTO `item_mods` VALUES (28018, 23, 8);
INSERT INTO `item_mods` VALUES (28018, 68, 22);
INSERT INTO `item_mods` VALUES (28018, 31, 26);
INSERT INTO `item_mods` VALUES (28018, 29, 1);
INSERT INTO `item_mods` VALUES (28018, 384, 40);
INSERT INTO `item_mods` VALUES (28018, 27, 3);
INSERT INTO `item_mods` VALUES (28018, 73, 5);


-- -------------------------------------------------------
--  Cizin Breeches +1  
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28160, 1, 123);
INSERT INTO `item_mods` VALUES (28160, 2, 52);
INSERT INTO `item_mods` VALUES (28160, 8, 33);
INSERT INTO `item_mods` VALUES (28160, 10, 19);
INSERT INTO `item_mods` VALUES (28160, 11, 14);
INSERT INTO `item_mods` VALUES (28160, 12, 23);
INSERT INTO `item_mods` VALUES (28160, 13, 10);
INSERT INTO `item_mods` VALUES (28160, 14, 8);
INSERT INTO `item_mods` VALUES (28160, 23, 10);
INSERT INTO `item_mods` VALUES (28160, 68, 22);
INSERT INTO `item_mods` VALUES (28160, 31, 64);
INSERT INTO `item_mods` VALUES (28160, 29, 3);
INSERT INTO `item_mods` VALUES (28160, 384, 50);


-- -------------------------------------------------------
--  Cizin Greaves +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28297, 1, 82);
INSERT INTO `item_mods` VALUES (28297, 2, 18);
INSERT INTO `item_mods` VALUES (28297, 8, 14);
INSERT INTO `item_mods` VALUES (28297, 9, 10);
INSERT INTO `item_mods` VALUES (28297, 10, 15);
INSERT INTO `item_mods` VALUES (28297, 11, 27);
INSERT INTO `item_mods` VALUES (28297, 13, 8);
INSERT INTO `item_mods` VALUES (28297, 14, 24);
INSERT INTO `item_mods` VALUES (28297, 25, 8);
INSERT INTO `item_mods` VALUES (28297, 68, 49);
INSERT INTO `item_mods` VALUES (28297, 31, 64);
INSERT INTO `item_mods` VALUES (28297, 29, 2);
INSERT INTO `item_mods` VALUES (28297, 384, 50);
INSERT INTO `item_mods` VALUES (28297, 288, 30);



-- -------------------------------------------------------
--   Gende. Bilaut +1 
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27877, 1, 124);
INSERT INTO `item_mods` VALUES (27877, 2, 54);
INSERT INTO `item_mods` VALUES (27877, 5, 59);
INSERT INTO `item_mods` VALUES (27877, 8, 21);
INSERT INTO `item_mods` VALUES (27877, 9, 21);
INSERT INTO `item_mods` VALUES (27877, 10, 21);
INSERT INTO `item_mods` VALUES (27877, 11, 21);
INSERT INTO `item_mods` VALUES (27877, 12, 29);
INSERT INTO `item_mods` VALUES (27877, 13, 29);
INSERT INTO `item_mods` VALUES (27877, 14, 29);
INSERT INTO `item_mods` VALUES (27877, 68, 41);
INSERT INTO `item_mods` VALUES (27877, 31, 80);
INSERT INTO `item_mods` VALUES (27877, 29, 6);
INSERT INTO `item_mods` VALUES (27877, 38, 11);
INSERT INTO `item_mods` VALUES (27877, 374, 81);
INSERT INTO `item_mods` VALUES (27877, 369, 20);

-- -------------------------------------------------------
--  Gende. Caubeen +1  
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27731, 1, 94);
INSERT INTO `item_mods` VALUES (27731, 2, 36);
INSERT INTO `item_mods` VALUES (27731, 5, 32);
INSERT INTO `item_mods` VALUES (27731, 8, 17);
INSERT INTO `item_mods` VALUES (27731, 9, 17);
INSERT INTO `item_mods` VALUES (27731, 10, 17);
INSERT INTO `item_mods` VALUES (27731, 11, 17);
INSERT INTO `item_mods` VALUES (27731, 12, 22);
INSERT INTO `item_mods` VALUES (27731, 13, 22);
INSERT INTO `item_mods` VALUES (27731, 14, 22);
INSERT INTO `item_mods` VALUES (27731, 68, 36);
INSERT INTO `item_mods` VALUES (27731, 31, 75);
INSERT INTO `item_mods` VALUES (27731, 29, 5);
INSERT INTO `item_mods` VALUES (27731, 384, 61);
INSERT INTO `item_mods` VALUES (27731, 27, -8);
INSERT INTO `item_mods` VALUES (27731, 374, 101);


-- -------------------------------------------------------
--   Gende. Gages +1 
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28021, 1, 83);
INSERT INTO `item_mods` VALUES (28021, 2, 30);
INSERT INTO `item_mods` VALUES (28021, 5, 22);
INSERT INTO `item_mods` VALUES (28021, 8, 6);
INSERT INTO `item_mods` VALUES (28021, 9, 28);
INSERT INTO `item_mods` VALUES (28021, 10, 25);
INSERT INTO `item_mods` VALUES (28021, 11, 5);
INSERT INTO `item_mods` VALUES (28021, 12, 19);
INSERT INTO `item_mods` VALUES (28021, 13, 33);
INSERT INTO `item_mods` VALUES (28021, 14, 19);
INSERT INTO `item_mods` VALUES (28021, 3, 15);
INSERT INTO `item_mods` VALUES (28021, 68, 22);
INSERT INTO `item_mods` VALUES (28021, 31, 37);
INSERT INTO `item_mods` VALUES (28021, 29, 3);
INSERT INTO `item_mods` VALUES (28021, 384, 11);
INSERT INTO `item_mods` VALUES (28021, 170, 70);

-- -------------------------------------------------------
--  Gende. Spats +1  
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28163, 1, 106);
INSERT INTO `item_mods` VALUES (28163, 2, 43);
INSERT INTO `item_mods` VALUES (28163, 5, 29);
INSERT INTO `item_mods` VALUES (28163, 8, 23);
INSERT INTO `item_mods` VALUES (28163, 10, 10);
INSERT INTO `item_mods` VALUES (28163, 11, 15);
INSERT INTO `item_mods` VALUES (28163, 12, 32);
INSERT INTO `item_mods` VALUES (28163, 13, 22);
INSERT INTO `item_mods` VALUES (28163, 14, 17);
INSERT INTO `item_mods` VALUES (28163, 28, 8);
INSERT INTO `item_mods` VALUES (28163, 68, 27);
INSERT INTO `item_mods` VALUES (28163, 31, 107);
INSERT INTO `item_mods` VALUES (28163, 29, 6);
INSERT INTO `item_mods` VALUES (28163, 384, 51);
INSERT INTO `item_mods` VALUES (28163, 489, -51);

-- -------------------------------------------------------
--  Gende. Galosh. +1 
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28300, 1, 64);
INSERT INTO `item_mods` VALUES (28300, 2, 26);
INSERT INTO `item_mods` VALUES (28300, 5, 27);
INSERT INTO `item_mods` VALUES (28300, 8, 10);
INSERT INTO `item_mods` VALUES (28300, 9, 11);
INSERT INTO `item_mods` VALUES (28300, 10, 10);
INSERT INTO `item_mods` VALUES (28300, 11, 33);
INSERT INTO `item_mods` VALUES (28300, 12, 17);
INSERT INTO `item_mods` VALUES (28300, 13, 19);
INSERT INTO `item_mods` VALUES (28300, 14, 34);
INSERT INTO `item_mods` VALUES (28300, 28, 8);
INSERT INTO `item_mods` VALUES (28300, 68, 55);
INSERT INTO `item_mods` VALUES (28300, 31, 107);
INSERT INTO `item_mods` VALUES (28300, 29, 5);
INSERT INTO `item_mods` VALUES (28300, 384, 41);
INSERT INTO `item_mods` VALUES (28300, 111, 10);


-- -------------------------------------------------------
--   Iuitl Gaiters +1 
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28299, 1, 69);
INSERT INTO `item_mods` VALUES (28299, 2, 13);
INSERT INTO `item_mods` VALUES (28299, 8, 10);
INSERT INTO `item_mods` VALUES (28299, 9, 22);
INSERT INTO `item_mods` VALUES (28299, 10, 10);
INSERT INTO `item_mods` VALUES (28299, 11, 35);
INSERT INTO `item_mods` VALUES (28299, 13, 10);
INSERT INTO `item_mods` VALUES (28299, 14, 28);
INSERT INTO `item_mods` VALUES (28299, 23, 10);
INSERT INTO `item_mods` VALUES (28299, 24, 10);
INSERT INTO `item_mods` VALUES (28299, 30, 15);
INSERT INTO `item_mods` VALUES (28299, 68, 72);
INSERT INTO `item_mods` VALUES (28299, 31, 69);
INSERT INTO `item_mods` VALUES (28299, 29, 5);
INSERT INTO `item_mods` VALUES (28299, 384, 51);



-- -------------------------------------------------------
--  Iuitl Headgear +1  
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27730, 1, 98);
INSERT INTO `item_mods` VALUES (27730, 2, 36);
INSERT INTO `item_mods` VALUES (27730, 5, 23);
INSERT INTO `item_mods` VALUES (27730, 8, 18);
INSERT INTO `item_mods` VALUES (27730, 9, 22);
INSERT INTO `item_mods` VALUES (27730, 10, 18);
INSERT INTO `item_mods` VALUES (27730, 11, 22);
INSERT INTO `item_mods` VALUES (27730, 12, 18);
INSERT INTO `item_mods` VALUES (27730, 13, 18);
INSERT INTO `item_mods` VALUES (27730, 14, 19);
INSERT INTO `item_mods` VALUES (27730, 68, 44);
INSERT INTO `item_mods` VALUES (27730, 31, 53);
INSERT INTO `item_mods` VALUES (27730, 29, 2);
INSERT INTO `item_mods` VALUES (27730, 384, 81);
INSERT INTO `item_mods` VALUES (27730, 302, 21);


-- -------------------------------------------------------
--   Iuitl Tights +1  
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28162, 1, 111);
INSERT INTO `item_mods` VALUES (28162, 2, 47);
INSERT INTO `item_mods` VALUES (28162, 8, 27);
INSERT INTO `item_mods` VALUES (28162, 10, 14);
INSERT INTO `item_mods` VALUES (28162, 11, 18);
INSERT INTO `item_mods` VALUES (28162, 12, 28);
INSERT INTO `item_mods` VALUES (28162, 13, 15);
INSERT INTO `item_mods` VALUES (28162, 14, 9);
INSERT INTO `item_mods` VALUES (28162, 30, 10);
INSERT INTO `item_mods` VALUES (28162, 28, 10);
INSERT INTO `item_mods` VALUES (28162, 68, 48);
INSERT INTO `item_mods` VALUES (28162, 31, 69);
INSERT INTO `item_mods` VALUES (28162, 29, 5);
INSERT INTO `item_mods` VALUES (28162, 384, 61);
INSERT INTO `item_mods` VALUES (28162, 73, 5);



-- -------------------------------------------------------
--   Iuitl Vest +1  
-- ------------------------------------------------------
INSERT INTO `item_mods` VALUES (27876, 1, 128);
INSERT INTO `item_mods` VALUES (27876, 2, 59);
INSERT INTO `item_mods` VALUES (27876, 5, 44);
INSERT INTO `item_mods` VALUES (27876, 8, 22);
INSERT INTO `item_mods` VALUES (27876, 9, 27);
INSERT INTO `item_mods` VALUES (27876, 10, 22);
INSERT INTO `item_mods` VALUES (27876, 11, 26);
INSERT INTO `item_mods` VALUES (27876, 12, 21);
INSERT INTO `item_mods` VALUES (27876, 13, 21);
INSERT INTO `item_mods` VALUES (27876, 14, 21);
INSERT INTO `item_mods` VALUES (27876, 25, 10);
INSERT INTO `item_mods` VALUES (27876, 26, 10);
INSERT INTO `item_mods` VALUES (27876, 68, 49);
INSERT INTO `item_mods` VALUES (27876, 31, 64);
INSERT INTO `item_mods` VALUES (27876, 29, 6);
INSERT INTO `item_mods` VALUES (27876, 384, 41);
INSERT INTO `item_mods` VALUES (27876, 289, 8);


-- -------------------------------------------------------
--  Iuitl Wristbands +1 
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28020, 1, 86);
INSERT INTO `item_mods` VALUES (28020, 2, 25);
INSERT INTO `item_mods` VALUES (28020, 8, 9);
INSERT INTO `item_mods` VALUES (28020, 9, 33);
INSERT INTO `item_mods` VALUES (28020, 10, 30);
INSERT INTO `item_mods` VALUES (28020, 11, 15);
INSERT INTO `item_mods` VALUES (28020, 12, 10);
INSERT INTO `item_mods` VALUES (28020, 13, 28);
INSERT INTO `item_mods` VALUES (28020, 14, 15);
INSERT INTO `item_mods` VALUES (28020, 25, 8);
INSERT INTO `item_mods` VALUES (28020, 26, 8);
INSERT INTO `item_mods` VALUES (28020, 68, 24);
INSERT INTO `item_mods` VALUES (28020, 31, 37);
INSERT INTO `item_mods` VALUES (28020, 29, 2);
INSERT INTO `item_mods` VALUES (28020, 384, 51);
INSERT INTO `item_mods` VALUES (28020, 27, -6);
INSERT INTO `item_mods` VALUES (28020, 365, 5);


-- -------------------------------------------------------
--  Otro. Harness +1 
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27875, 1, 129);
INSERT INTO `item_mods` VALUES (27875, 2, 59);
INSERT INTO `item_mods` VALUES (27875, 8, 23);
INSERT INTO `item_mods` VALUES (27875, 9, 24);
INSERT INTO `item_mods` VALUES (27875, 10, 20);
INSERT INTO `item_mods` VALUES (27875, 11, 24);
INSERT INTO `item_mods` VALUES (27875, 12, 23);
INSERT INTO `item_mods` VALUES (27875, 13, 23);
INSERT INTO `item_mods` VALUES (27875, 14, 23);
INSERT INTO `item_mods` VALUES (27875, 25, 10);
INSERT INTO `item_mods` VALUES (27875, 68, 52);
INSERT INTO `item_mods` VALUES (27875, 31, 53);
INSERT INTO `item_mods` VALUES (27875, 29, 4);
INSERT INTO `item_mods` VALUES (27875, 384, 40);
INSERT INTO `item_mods` VALUES (27875, 291, 3);



-- -------------------------------------------------------
--  Otronif Boots +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28298, 1, 70);
INSERT INTO `item_mods` VALUES (28298, 2, 13);
INSERT INTO `item_mods` VALUES (28298, 8, 12);
INSERT INTO `item_mods` VALUES (28298, 9, 13);
INSERT INTO `item_mods` VALUES (28298, 10, 9);
INSERT INTO `item_mods` VALUES (28298, 11, 32);
INSERT INTO `item_mods` VALUES (28298, 13, 10);
INSERT INTO `item_mods` VALUES (28298, 14, 27);
INSERT INTO `item_mods` VALUES (28298, 23, 5);
INSERT INTO `item_mods` VALUES (28298, 68, 69);
INSERT INTO `item_mods` VALUES (28298, 31, 64);
INSERT INTO `item_mods` VALUES (28298, 29, 3);
INSERT INTO `item_mods` VALUES (28298, 384,'51);
INSERT INTO `item_mods` VALUES (28298, 73, 7);


-- -------------------------------------------------------
--   Otronif Brais +1 
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28161, 1, 112);
INSERT INTO `item_mods` VALUES (28161, 2, 47);
INSERT INTO `item_mods` VALUES (28161, 8, 30);
INSERT INTO `item_mods` VALUES (28161, 10, 12);
INSERT INTO `item_mods` VALUES (28161, 11, 19);
INSERT INTO `item_mods` VALUES (28161, 12, 30);
INSERT INTO `item_mods` VALUES (28161, 13, 15);
INSERT INTO `item_mods` VALUES (28161, 14, 8);
INSERT INTO `item_mods` VALUES (28161, 23, 10);
INSERT INTO `item_mods` VALUES (28161, 68, 33);
INSERT INTO `item_mods` VALUES (28161, 31, 64);
INSERT INTO `item_mods` VALUES (28161, 29, 3);
INSERT INTO `item_mods` VALUES (28161, 384, 61);
INSERT INTO `item_mods` VALUES (28161, 73, 6);



-- -------------------------------------------------------
--  Otronif Gloves +1 
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28019, 1, 87);
INSERT INTO `item_mods` VALUES (28019, 2, 30);
INSERT INTO `item_mods` VALUES (28019, 8, 8);
INSERT INTO `item_mods` VALUES (28019, 9, 32);
INSERT INTO `item_mods` VALUES (28019, 10, 26);
INSERT INTO `item_mods` VALUES (28019, 11, 6);
INSERT INTO `item_mods` VALUES (28019, 12, 8);
INSERT INTO `item_mods` VALUES (28019, 13, 26);
INSERT INTO `item_mods` VALUES (28019, 14, 14);
INSERT INTO `item_mods` VALUES (28019, 25, 8);
INSERT INTO `item_mods` VALUES (28019, 68, 22);
INSERT INTO `item_mods` VALUES (28019, 31, 26);
INSERT INTO `item_mods` VALUES (28019, 29, 1);
INSERT INTO `item_mods` VALUES (28019, 384, 51);
INSERT INTO `item_mods` VALUES (28019, 73, 7);


-- -------------------------------------------------------
--  Otronif Mask +1 
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27729, 1, 99);
INSERT INTO `item_mods` VALUES (27729, 2, 36);
INSERT INTO `item_mods` VALUES (27729, 8, 17);
INSERT INTO `item_mods` VALUES (27729, 9, 17);
INSERT INTO `item_mods` VALUES (27729, 10, 19);
INSERT INTO `item_mods` VALUES (27729, 11, 19);
INSERT INTO `item_mods` VALUES (27729, 12, 18);
INSERT INTO `item_mods` VALUES (27729, 13, 18);
INSERT INTO `item_mods` VALUES (27729, 14, 18);
INSERT INTO `item_mods` VALUES (27729, 68, 38);
INSERT INTO `item_mods` VALUES (27729, 29, 43);
INSERT INTO `item_mods` VALUES (27729, 31, 4);
INSERT INTO `item_mods` VALUES (27729, 384, 81);
INSERT INTO `item_mods` VALUES (27729, 73, 5);


-- -------------------------------------------------------
-- Arch. Coat +1  
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (26807, 1, 125);
INSERT INTO `item_mods` VALUES (26807, 2, 54);
INSERT INTO `item_mods` VALUES (26807, 5, 59);
INSERT INTO `item_mods` VALUES (26807, 8, 21);
INSERT INTO `item_mods` VALUES (26807, 9, 21);
INSERT INTO `item_mods` VALUES (26807, 10, 21);
INSERT INTO `item_mods` VALUES (26807, 11, 21);
INSERT INTO `item_mods` VALUES (26807, 12, 36);
INSERT INTO `item_mods` VALUES (26807, 13, 29);
INSERT INTO `item_mods` VALUES (26807, 14, 29);
INSERT INTO `item_mods` VALUES (26807, 68, 41);
INSERT INTO `item_mods` VALUES (26807, 31, 80);
INSERT INTO `item_mods` VALUES (26807, 28, 10);
INSERT INTO `item_mods` VALUES (26807, 29, 29);
INSERT INTO `item_mods` VALUES (26807, 115, 20);
INSERT INTO `item_mods` VALUES (26807, 384, 31);
INSERT INTO `item_mods` VALUES (26807, 27, -10);
INSERT INTO `item_mods` VALUES (26807, 369, 20);


-- -------------------------------------------------------
--  	Arch. Gloves +1  
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (26983, 1, 82);
INSERT INTO `item_mods` VALUES (26983, 2, 30);
INSERT INTO `item_mods` VALUES (26983, 5, 22);
INSERT INTO `item_mods` VALUES (26983, 8, 6);
INSERT INTO `item_mods` VALUES (26983, 9, 28);
INSERT INTO `item_mods` VALUES (26983, 10, 25);
INSERT INTO `item_mods` VALUES (26983, 11, 5);
INSERT INTO `item_mods` VALUES (26983, 12, 26);
INSERT INTO `item_mods` VALUES (26983, 13, 33);
INSERT INTO `item_mods` VALUES (26983, 14, 19);
INSERT INTO `item_mods` VALUES (26983, 68, 22);
INSERT INTO `item_mods` VALUES (26983, 31, 27);
INSERT INTO `item_mods` VALUES (26983, 29, 3);
INSERT INTO `item_mods` VALUES (26983, 115, 19);
INSERT INTO `item_mods` VALUES (26983, 116, 19);
INSERT INTO `item_mods` VALUES (26983, 384, 31);
INSERT INTO `item_mods` VALUES (26983, 27, -8);
INSERT INTO `item_mods` VALUES (26983, 25, 20);
INSERT INTO `item_mods` VALUES (26983, 487, 16);
INSERT INTO `item_mods` VALUES (26983, 30, 20);


-- -------------------------------------------------------
--  	Arch. Gloves +1  
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (26631, 1, 95);
INSERT INTO `item_mods` VALUES (26631, 2, 36);
INSERT INTO `item_mods` VALUES (26631, 5, 32);
INSERT INTO `item_mods` VALUES (26631, 8, 16);
INSERT INTO `item_mods` VALUES (26631, 9, 16);
INSERT INTO `item_mods` VALUES (26631, 10, 16);
INSERT INTO `item_mods` VALUES (26631, 11, 16);
INSERT INTO `item_mods` VALUES (26631, 12, 26);
INSERT INTO `item_mods` VALUES (26631, 13, 33);
INSERT INTO `item_mods` VALUES (26631, 14, 19);
INSERT INTO `item_mods` VALUES (26631, 30, 12);
INSERT INTO `item_mods` VALUES (26631, 28, 13);
INSERT INTO `item_mods` VALUES (26631, 68, 36);
INSERT INTO `item_mods` VALUES (26631, 31, 75);
INSERT INTO `item_mods` VALUES (26631, 29, 5);
INSERT INTO `item_mods` VALUES (26631, 384, 61);
INSERT INTO `item_mods` VALUES (26631, 27, -5);
INSERT INTO `item_mods` VALUES (26631, 115, 17);


-- -------------------------------------------------------
--  	 Arch. Sabots +1  
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27335, 1, 63);
INSERT INTO `item_mods` VALUES (27335, 2, 23);
INSERT INTO `item_mods` VALUES (27335, 5, 24);
INSERT INTO `item_mods` VALUES (27335, 8, 10);
INSERT INTO `item_mods` VALUES (27335, 9, 11);
INSERT INTO `item_mods` VALUES (27335, 10, 10);
INSERT INTO `item_mods` VALUES (27335, 11, 33);
INSERT INTO `item_mods` VALUES (27335, 30, 12);
INSERT INTO `item_mods` VALUES (27335, 28, 12);
INSERT INTO `item_mods` VALUES (27335, 68, 55);
INSERT INTO `item_mods` VALUES (27335, 31, 107);
INSERT INTO `item_mods` VALUES (27335, 29, 5);
INSERT INTO `item_mods` VALUES (27335, 115, 13);
INSERT INTO `item_mods` VALUES (27335, 384, 33);
INSERT INTO `item_mods` VALUES (27335, 27, -4);


-- -------------------------------------------------------
--  	 Arch. Sabots +1  
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27159, 1, 103);
INSERT INTO `item_mods` VALUES (27159, 2, 43);
INSERT INTO `item_mods` VALUES (27159, 5, 65);
INSERT INTO `item_mods` VALUES (27159, 8, 25);
INSERT INTO `item_mods` VALUES (27159, 10, 12);
INSERT INTO `item_mods` VALUES (27159, 11, 17);
INSERT INTO `item_mods` VALUES (27159, 12, 43);
INSERT INTO `item_mods` VALUES (27159, 13, 44);
INSERT INTO `item_mods` VALUES (27159, 14, 33);
INSERT INTO `item_mods` VALUES (27159, 30, 14);
INSERT INTO `item_mods` VALUES (27159, 28, 29);
INSERT INTO `item_mods` VALUES (27159, 68, 27);
INSERT INTO `item_mods` VALUES (27159, 31, 107);
INSERT INTO `item_mods` VALUES (27159, 29, 6);
INSERT INTO `item_mods` VALUES (27159, 384, 51);
INSERT INTO `item_mods` VALUES (27159, 27, -5);
INSERT INTO `item_mods` VALUES (27159, 163, 10);

-- -------------------------------------------------------
--  	 Locus ring 
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28582, 28, 5);
INSERT INTO `item_mods` VALUES (28582, 487, 5);


-- -------------------------------------------------------
--  	 Patricius Ring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28578, 25, 7);
INSERT INTO `item_mods` VALUES (28578, 16, -5);


-- -------------------------------------------------------
--  	 Kunaji Ring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28577, 2, 40);
INSERT INTO `item_mods` VALUES (28577, 18, 20);
INSERT INTO `item_mods` VALUES (28577, 375, 5);


-- -------------------------------------------------------
--  	 Paqichikaji Ring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28576, 26, 14);
INSERT INTO `item_mods` VALUES (28576, 289, 5);
INSERT INTO `item_mods` VALUES (28576, 27, -3);


-- -------------------------------------------------------
--  	 Cho'j Band
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28575, 23, 14);
INSERT INTO `item_mods` VALUES (28575, 27, -3);


-- -------------------------------------------------------
--  	 Dumakulem's Ring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28530, 9, 4);
INSERT INTO `item_mods` VALUES (28530, 11, 4);
INSERT INTO `item_mods` VALUES (28530, 23, 3);
INSERT INTO `item_mods` VALUES (28530, 68, 3);
INSERT INTO `item_mods` VALUES (28530, 73, 2);


-- -------------------------------------------------------
--  	 Dynamic Belt
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28466, 8, 3);
INSERT INTO `item_mods` VALUES (28466, 25, 10);
INSERT INTO `item_mods` VALUES (28466, 384, 50);


-- -------------------------------------------------------
--  	 Dynamic Belt +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28467, 8, 4);
INSERT INTO `item_mods` VALUES (28467, 25, 11);
INSERT INTO `item_mods` VALUES (28467, 384, 60);
INSERT INTO `item_mods` VALUES (28580, 27, -2);
INSERT INTO `item_mods` VALUES (28579, 2, 70);


-- -------------------------------------------------------
--  	 Whirlpool Mask
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27774, 1, 102);
INSERT INTO `item_mods` VALUES (27774, 2, 38);
INSERT INTO `item_mods` VALUES (27774, 5, 23);
INSERT INTO `item_mods` VALUES (27774, 8, 24);
INSERT INTO `item_mods` VALUES (27774, 9, 20);
INSERT INTO `item_mods` VALUES (27774, 10, 22);
INSERT INTO `item_mods` VALUES (27774, 11, 20);
INSERT INTO `item_mods` VALUES (27774, 12, 19);
INSERT INTO `item_mods` VALUES (27774, 13, 19);
INSERT INTO `item_mods` VALUES (27774, 14, 19);
INSERT INTO `item_mods` VALUES (27774, 25, 25);
INSERT INTO `item_mods` VALUES (27774, 23, 25);
INSERT INTO `item_mods` VALUES (27774, 68, 33);
INSERT INTO `item_mods` VALUES (27774, 29, 2);
INSERT INTO `item_mods` VALUES (27774, 31, 43);
INSERT INTO `item_mods` VALUES (27774, 289, 4);
INSERT INTO `item_mods` VALUES (27774, 384, 70);


-- -------------------------------------------------------
--  	 Whirlpool Greaves
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28337, 1, 84);
INSERT INTO `item_mods` VALUES (28337, 2, 15);
INSERT INTO `item_mods` VALUES (28337, 8, 15);
INSERT INTO `item_mods` VALUES (28337, 9, 17);
INSERT INTO `item_mods` VALUES (28337, 10, 15);
INSERT INTO `item_mods` VALUES (28337, 11, 32);
INSERT INTO `item_mods` VALUES (28337, 13, 15);
INSERT INTO `item_mods` VALUES (28337, 14, 26);
INSERT INTO `item_mods` VALUES (28337, 25, 13);
INSERT INTO `item_mods` VALUES (28337, 23, 20);
INSERT INTO `item_mods` VALUES (28337, 68, 52);
INSERT INTO `item_mods` VALUES (28337, 29, 2);
INSERT INTO `item_mods` VALUES (28337, 31, 75);
INSERT INTO `item_mods` VALUES (28337, 384, 50);


-- Thurandaut set
INSERT INTO `item_mods` VALUES (27784, 1, 46);
INSERT INTO `item_mods` VALUES (27784, 5, 16);
INSERT INTO `item_mods` VALUES (27784, 8, 12);
INSERT INTO `item_mods` VALUES (27784, 9, 14);
INSERT INTO `item_mods` VALUES (27784, 10, 4);
INSERT INTO `item_mods` VALUES (27784, 11, 6);
INSERT INTO `item_mods` VALUES (27784, 12, 4);
INSERT INTO `item_mods` VALUES (27784, 13, 4);
INSERT INTO `item_mods` VALUES (27784, 14, 5);
INSERT INTO `item_mods` VALUES (27784, 25, 10);
INSERT INTO `item_mods` VALUES (27784, 31, 21);
INSERT INTO `item_mods` VALUES (27784, 259, 5);
INSERT INTO `item_mods` VALUES (28064, 1, 40);
INSERT INTO `item_mods` VALUES (28064, 8, 3);
INSERT INTO `item_mods` VALUES (28064, 9, 14);
INSERT INTO `item_mods` VALUES (28064, 10, 10);
INSERT INTO `item_mods` VALUES (28064, 11, 14);
INSERT INTO `item_mods` VALUES (28064, 12, 4);
INSERT INTO `item_mods` VALUES (28064, 13, 9);
INSERT INTO `item_mods` VALUES (28064, 14, 5);
INSERT INTO `item_mods` VALUES (28064, 25, 10);
INSERT INTO `item_mods` VALUES (28064, 68, 14);
INSERT INTO `item_mods` VALUES (28064, 384, 30);
INSERT INTO `item_mods` VALUES (27924, 1, 64);
INSERT INTO `item_mods` VALUES (27924, 5, 30);
INSERT INTO `item_mods` VALUES (27924, 8, 17);
INSERT INTO `item_mods` VALUES (27924, 9, 9);
INSERT INTO `item_mods` VALUES (27924, 10, 7);
INSERT INTO `item_mods` VALUES (27924, 11, 17);
INSERT INTO `item_mods` VALUES (27924, 12, 7);
INSERT INTO `item_mods` VALUES (27924, 13, 7);
INSERT INTO `item_mods` VALUES (27924, 14, 7);
INSERT INTO `item_mods` VALUES (27924, 23, 15);
INSERT INTO `item_mods` VALUES (27924, 31, 25);
INSERT INTO `item_mods` VALUES (27924, 384, 50);
INSERT INTO `item_mods` VALUES (28204, 1, 54);
INSERT INTO `item_mods` VALUES (28204, 8, 9);
INSERT INTO `item_mods` VALUES (28204, 10, 5);
INSERT INTO `item_mods` VALUES (28204, 11, 17);
INSERT INTO `item_mods` VALUES (28204, 12, 9);
INSERT INTO `item_mods` VALUES (28204, 13, 5);
INSERT INTO `item_mods` VALUES (28204, 14, 3);
INSERT INTO `item_mods` VALUES (28204, 26, 17);
INSERT INTO `item_mods` VALUES (28204, 31, 27);
INSERT INTO `item_mods` VALUES (28204, 27, -5);
INSERT INTO `item_mods` VALUES (28344, 1, 32);
INSERT INTO `item_mods` VALUES (28344, 8, 4);
INSERT INTO `item_mods` VALUES (28344, 9, 7);
INSERT INTO `item_mods` VALUES (28344, 10, 14);
INSERT INTO `item_mods` VALUES (28344, 14, 9);
INSERT INTO `item_mods` VALUES (28344, 31, 27);
INSERT INTO `item_mods` VALUES (28344, 11, 11);
INSERT INTO `item_mods` VALUES (28344, 13, 14);
INSERT INTO `item_mods` VALUES (28344, 161, -3);
INSERT INTO `item_mods` VALUES (28344, 384, 30);
-- Chocobo Suit
INSERT INTO `item_mods` VALUES (27911, 1, 1);
INSERT INTO `item_mods` VALUES (27765, 1, 1);
-- Karieyh set
INSERT INTO `item_mods` VALUES (27785, 1, 51);
INSERT INTO `item_mods` VALUES (27785, 5, 16);
INSERT INTO `item_mods` VALUES (27785, 8, 16);
INSERT INTO `item_mods` VALUES (27785, 9, 16);
INSERT INTO `item_mods` VALUES (27785, 10, 9);
INSERT INTO `item_mods` VALUES (27785, 11, 7);
INSERT INTO `item_mods` VALUES (27785, 12, 7);
INSERT INTO `item_mods` VALUES (27785, 13, 7);
INSERT INTO `item_mods` VALUES (27785, 14, 7);
INSERT INTO `item_mods` VALUES (27785, 25, 10);
INSERT INTO `item_mods` VALUES (27785, 31, 12);
INSERT INTO `item_mods` VALUES (27785, 384, 60);
INSERT INTO `item_mods` VALUES (27925, 1, 79);
INSERT INTO `item_mods` VALUES (27925, 5, 24);
INSERT INTO `item_mods` VALUES (27925, 8, 18);
INSERT INTO `item_mods` VALUES (27925, 9, 18);
INSERT INTO `item_mods` VALUES (27925, 10, 9);
INSERT INTO `item_mods` VALUES (27925, 11, 6);
INSERT INTO `item_mods` VALUES (27925, 12, 6);
INSERT INTO `item_mods` VALUES (27925, 13, 6);
INSERT INTO `item_mods` VALUES (27925, 14, 6);
INSERT INTO `item_mods` VALUES (27925, 23, 25);
INSERT INTO `item_mods` VALUES (27925, 31, 18);
INSERT INTO `item_mods` VALUES (27925, 288, 2);
INSERT INTO `item_mods` VALUES (27925, 384, 20);
INSERT INTO `item_mods` VALUES (28065, 1, 46);
INSERT INTO `item_mods` VALUES (28065, 8, 3);
INSERT INTO `item_mods` VALUES (28065, 9, 14);
INSERT INTO `item_mods` VALUES (28065, 10, 14);
INSERT INTO `item_mods` VALUES (28065, 12, 2);
INSERT INTO `item_mods` VALUES (28065, 13, 8);
INSERT INTO `item_mods` VALUES (28065, 14, 6);
INSERT INTO `item_mods` VALUES (28065, 25, 10);
INSERT INTO `item_mods` VALUES (28065, 31, 10);
INSERT INTO `item_mods` VALUES (28065, 384, 40);
INSERT INTO `item_mods` VALUES (28205, 1, 56);
INSERT INTO `item_mods` VALUES (28205, 5, 65);
INSERT INTO `item_mods` VALUES (28205, 8, 16);
INSERT INTO `item_mods` VALUES (28205, 10, 16);
INSERT INTO `item_mods` VALUES (28205, 11, 5);
INSERT INTO `item_mods` VALUES (28205, 12, 8);
INSERT INTO `item_mods` VALUES (28205, 13, 4);
INSERT INTO `item_mods` VALUES (28205, 14, 3);
INSERT INTO `item_mods` VALUES (28205, 23, 20);
INSERT INTO `item_mods` VALUES (28205, 31, 25);
INSERT INTO `item_mods` VALUES (28205, 384, 40);
INSERT INTO `item_mods` VALUES (28345, 1, 37);
INSERT INTO `item_mods` VALUES (28345, 8, 11);
INSERT INTO `item_mods` VALUES (28345, 9, 11);
INSERT INTO `item_mods` VALUES (28345, 10, 11);
INSERT INTO `item_mods` VALUES (28345, 11, 9);
INSERT INTO `item_mods` VALUES (28345, 13, 3);
INSERT INTO `item_mods` VALUES (28345, 14, 8);
INSERT INTO `item_mods` VALUES (28345, 23, 10);
INSERT INTO `item_mods` VALUES (28345, 25, 10);
INSERT INTO `item_mods` VALUES (28345, 31, 25);
INSERT INTO `item_mods` VALUES (28345, 73, 5);
INSERT INTO `item_mods` VALUES (28345, 384, 20);
-- Orvail set
INSERT INTO `item_mods` VALUES (27782, 1, 43);
INSERT INTO `item_mods` VALUES (27782, 5, 22);
INSERT INTO `item_mods` VALUES (27782, 8, 12);
INSERT INTO `item_mods` VALUES (27782, 9, 12);
INSERT INTO `item_mods` VALUES (27782, 10, 12);
INSERT INTO `item_mods` VALUES (27782, 11, 12);
INSERT INTO `item_mods` VALUES (27782, 12, 14);
INSERT INTO `item_mods` VALUES (27782, 13, 14);
INSERT INTO `item_mods` VALUES (27782, 14, 14);
INSERT INTO `item_mods` VALUES (27782, 30, 8);
INSERT INTO `item_mods` VALUES (27782, 31, 29);
INSERT INTO `item_mods` VALUES (27782, 71, 4);
INSERT INTO `item_mods` VALUES (27922, 1, 56);
INSERT INTO `item_mods` VALUES (27922, 5, 40);
INSERT INTO `item_mods` VALUES (27922, 8, 9);
INSERT INTO `item_mods` VALUES (27922, 9, 9);
INSERT INTO `item_mods` VALUES (27922, 10, 9);
INSERT INTO `item_mods` VALUES (27922, 11, 9);
INSERT INTO `item_mods` VALUES (27922, 12, 18);
INSERT INTO `item_mods` VALUES (27922, 13, 18);
INSERT INTO `item_mods` VALUES (27922, 14, 18);
INSERT INTO `item_mods` VALUES (27922, 31, 31);
INSERT INTO `item_mods` VALUES (27922, 27, -5);
INSERT INTO `item_mods` VALUES (27922, 369, 2);
INSERT INTO `item_mods` VALUES (28061, 1, 37);
INSERT INTO `item_mods` VALUES (28061, 5, 10);
INSERT INTO `item_mods` VALUES (28061, 8, 2);
INSERT INTO `item_mods` VALUES (28061, 9, 8);
INSERT INTO `item_mods` VALUES (28061, 10, 8);
INSERT INTO `item_mods` VALUES (28061, 11, 1);
INSERT INTO `item_mods` VALUES (28061, 12, 6);
INSERT INTO `item_mods` VALUES (28061, 13, 15);
INSERT INTO `item_mods` VALUES (28061, 14, 15);
INSERT INTO `item_mods` VALUES (28061, 30, 5);
INSERT INTO `item_mods` VALUES (28061, 31, 14);
INSERT INTO `item_mods` VALUES (28061, 27, -4);
INSERT INTO `item_mods` VALUES (28061, 384, 20);
INSERT INTO `item_mods` VALUES (28203, 1, 48);
INSERT INTO `item_mods` VALUES (28203, 5, 20);
INSERT INTO `item_mods` VALUES (28203, 8, 8);
INSERT INTO `item_mods` VALUES (28203, 10, 4);
INSERT INTO `item_mods` VALUES (28203, 11, 5);
INSERT INTO `item_mods` VALUES (28203, 12, 16);
INSERT INTO `item_mods` VALUES (28203, 13, 7);
INSERT INTO `item_mods` VALUES (28203, 14, 6);
INSERT INTO `item_mods` VALUES (28203, 31, 42);
INSERT INTO `item_mods` VALUES (28203, 30, 6);
INSERT INTO `item_mods` VALUES (28203, 170, 50);
INSERT INTO `item_mods` VALUES (28342, 1, 29);
INSERT INTO `item_mods` VALUES (28342, 5, 10);
INSERT INTO `item_mods` VALUES (28342, 8, 3);
INSERT INTO `item_mods` VALUES (28342, 9, 3);
INSERT INTO `item_mods` VALUES (28342, 10, 3);
INSERT INTO `item_mods` VALUES (28342, 11, 10);
INSERT INTO `item_mods` VALUES (28342, 12, 5);
INSERT INTO `item_mods` VALUES (28342, 13, 14);
INSERT INTO `item_mods` VALUES (28342, 14, 10);
INSERT INTO `item_mods` VALUES (28342, 30, 8);
INSERT INTO `item_mods` VALUES (28342, 31, 42);
INSERT INTO `item_mods` VALUES (28342, 27, -5);
-- yaoyotl set
INSERT INTO `item_mods` VALUES (27773, 1, 114);
INSERT INTO `item_mods` VALUES (27773, 2, 41);
INSERT INTO `item_mods` VALUES (27773, 5, 23);
INSERT INTO `item_mods` VALUES (27773, 8, 25);
INSERT INTO `item_mods` VALUES (27773, 9, 19);
INSERT INTO `item_mods` VALUES (27773, 10, 25);
INSERT INTO `item_mods` VALUES (27773, 11, 19);
INSERT INTO `item_mods` VALUES (27773, 12, 17);
INSERT INTO `item_mods` VALUES (27773, 13, 17);
INSERT INTO `item_mods` VALUES (27773, 14, 17);
INSERT INTO `item_mods` VALUES (27773, 25, 25);
INSERT INTO `item_mods` VALUES (27773, 23, 25);
INSERT INTO `item_mods` VALUES (27773, 68, 33);
INSERT INTO `item_mods` VALUES (27773, 29, 2);
INSERT INTO `item_mods` VALUES (27773, 31, 32);
INSERT INTO `item_mods` VALUES (27773, 73, 4);
INSERT INTO `item_mods` VALUES (27773, 384, 70);
INSERT INTO `item_mods` VALUES (28056, 1, 84);
INSERT INTO `item_mods` VALUES (28056, 2, 22);
INSERT INTO `item_mods` VALUES (28056, 5, 14);
INSERT INTO `item_mods` VALUES (28056, 8, 6);
INSERT INTO `item_mods` VALUES (28056, 9, 28);
INSERT INTO `item_mods` VALUES (28056, 10, 25);
INSERT INTO `item_mods` VALUES (28056, 11, 5);
INSERT INTO `item_mods` VALUES (28056, 12, 19);
INSERT INTO `item_mods` VALUES (28056, 13, 33);
INSERT INTO `item_mods` VALUES (28056, 14, 19);
INSERT INTO `item_mods` VALUES (28056, 30, 15);
INSERT INTO `item_mods` VALUES (28056, 28, 15);
INSERT INTO `item_mods` VALUES (28056, 68, 22);
INSERT INTO `item_mods` VALUES (28056, 29, 3);
INSERT INTO `item_mods` VALUES (28056, 31, 37);
INSERT INTO `item_mods` VALUES (28056, 27, -6);
-- Nahtirah set
INSERT INTO `item_mods` VALUES (27775, 1, 96);
INSERT INTO `item_mods` VALUES (27775, 2, 70);
INSERT INTO `item_mods` VALUES (27775, 5, 70);
INSERT INTO `item_mods` VALUES (27775, 8, 17);
INSERT INTO `item_mods` VALUES (27775, 9, 17);
INSERT INTO `item_mods` VALUES (27775, 10, 17);
INSERT INTO `item_mods` VALUES (27775, 11, 17);
INSERT INTO `item_mods` VALUES (27775, 12, 25);
INSERT INTO `item_mods` VALUES (27775, 13, 25);
INSERT INTO `item_mods` VALUES (27775, 14, 25);
INSERT INTO `item_mods` VALUES (27775, 30, 10);
INSERT INTO `item_mods` VALUES (27775, 68, 36);
INSERT INTO `item_mods` VALUES (27775, 31, 75);
INSERT INTO `item_mods` VALUES (27775, 29, 5);
INSERT INTO `item_mods` VALUES (27775, 170, 100);
INSERT INTO `item_mods` VALUES (27775, 384, 50);
INSERT INTO `item_mods` VALUES (28197, 1, 114);
INSERT INTO `item_mods` VALUES (28197, 2, 47);
INSERT INTO `item_mods` VALUES (28197, 8, 29);
INSERT INTO `item_mods` VALUES (28197, 10, 16);
INSERT INTO `item_mods` VALUES (28197, 11, 25);
INSERT INTO `item_mods` VALUES (28197, 12, 30);
INSERT INTO `item_mods` VALUES (28197, 13, 17);
INSERT INTO `item_mods` VALUES (28197, 14, 11);
INSERT INTO `item_mods` VALUES (28197, 24, 30);
INSERT INTO `item_mods` VALUES (28197, 68, 38);
INSERT INTO `item_mods` VALUES (28197, 29, 5);
INSERT INTO `item_mods` VALUES (28197, 31, 69);
INSERT INTO `item_mods` VALUES (28197, 365, 9);
-- ighwa set
INSERT INTO `item_mods` VALUES (27722, 1, 113);
INSERT INTO `item_mods` VALUES (27722, 2, 41);
INSERT INTO `item_mods` VALUES (27722, 5, 23);
INSERT INTO `item_mods` VALUES (27722, 8, 25);
INSERT INTO `item_mods` VALUES (27722, 9, 22);
INSERT INTO `item_mods` VALUES (27722, 10, 25);
INSERT INTO `item_mods` VALUES (27722, 11, 22);
INSERT INTO `item_mods` VALUES (27722, 12, 20);
INSERT INTO `item_mods` VALUES (27722, 13, 20);
INSERT INTO `item_mods` VALUES (27722, 14, 20);
INSERT INTO `item_mods` VALUES (27722, 25, 18);
INSERT INTO `item_mods` VALUES (27722, 23, 18);
INSERT INTO `item_mods` VALUES (27722, 68, 33);
INSERT INTO `item_mods` VALUES (27722, 31, 32);
INSERT INTO `item_mods` VALUES (27722, 29, 2);
INSERT INTO `item_mods` VALUES (27722, 384, 70);
INSERT INTO `item_mods` VALUES (27722, 161, -4);
INSERT INTO `item_mods` VALUES (27722, 342, 2);
INSERT INTO `item_mods` VALUES (28156, 1, 111);
INSERT INTO `item_mods` VALUES (28156, 2, 47);
INSERT INTO `item_mods` VALUES (28156, 8, 34);
INSERT INTO `item_mods` VALUES (28156, 10, 16);
INSERT INTO `item_mods` VALUES (28156, 11, 20);
INSERT INTO `item_mods` VALUES (28156, 12, 30);
INSERT INTO `item_mods` VALUES (28156, 13, 17);
INSERT INTO `item_mods` VALUES (28156, 14, 11);
INSERT INTO `item_mods` VALUES (28156, 25, 15);
INSERT INTO `item_mods` VALUES (28156, 68, 53);
INSERT INTO `item_mods` VALUES (28156, 31, 69);
INSERT INTO `item_mods` VALUES (28156, 29, 5);
INSERT INTO `item_mods` VALUES (28156, 384, 60);
INSERT INTO `item_mods` VALUES (28156, 289, 7);
INSERT INTO `item_mods` VALUES (28156, 166, -3);

-- Orison
INSERT INTO `item_mods` VALUES(11066, 1, 30);
INSERT INTO `item_mods` VALUES(11066, 5, 50);
INSERT INTO `item_mods` VALUES(11066, 13, 10);
INSERT INTO `item_mods` VALUES(11066, 374, 10);
INSERT INTO `item_mods` VALUES(11086, 1, 49);
INSERT INTO `item_mods` VALUES(11086, 2, 45);
INSERT INTO `item_mods` VALUES(11086, 5, 45);
INSERT INTO `item_mods` VALUES(11086, 112, 20);
INSERT INTO `item_mods` VALUES(11086, 369, 2);
INSERT INTO `item_mods` VALUES(11086, 125, 25);
INSERT INTO `item_mods` VALUES(11106, 1, 22);
INSERT INTO `item_mods` VALUES(11106, 2, 25);
INSERT INTO `item_mods` VALUES(11106, 5, 25);
INSERT INTO `item_mods` VALUES(11106, 27, -8);
INSERT INTO `item_mods` VALUES(11126, 1, 41);
INSERT INTO `item_mods` VALUES(11126, 13, 7);
INSERT INTO `item_mods` VALUES(11146, 1, 18);
INSERT INTO `item_mods` VALUES(11146, 2, 30);
INSERT INTO `item_mods` VALUES(11146, 5, 30);
INSERT INTO `item_mods` VALUES(11146, 13, 8);
INSERT INTO `item_mods` VALUES(11146, 113, 20);
INSERT INTO `item_mods` VALUES(11554, 1, 8);
INSERT INTO `item_mods` VALUES(11554, 5, 10);
INSERT INTO `item_mods` VALUES(11554, 374, 3);
INSERT INTO `item_mods` VALUES(11554, 27, -4);
INSERT INTO `item_mods` VALUES(11705, 374, 2);
INSERT INTO `item_mods` VALUES(11705, 27, -3);
INSERT INTO `item_mods` VALUES(11615, 2, 33);
INSERT INTO `item_mods` VALUES(11615, 5, 33);
INSERT INTO `item_mods` VALUES(11615, 170, 5);
-- Goetia
INSERT INTO `item_mods` VALUES(11067, 1, 29);
INSERT INTO `item_mods` VALUES(11067, 12, 8);
INSERT INTO `item_mods` VALUES(11067, 115, 15);
INSERT INTO `item_mods` VALUES(11067, 27, -6);
INSERT INTO `item_mods` VALUES(11087, 1, 50);
INSERT INTO `item_mods` VALUES(11087, 5, 45);
INSERT INTO `item_mods` VALUES(11087, 30, 11);
INSERT INTO `item_mods` VALUES(11087, 28, 11);
INSERT INTO `item_mods` VALUES(11087, 369, 2);
INSERT INTO `item_mods` VALUES(11127, 1, 41);
INSERT INTO `item_mods` VALUES(11127, 5, 55);
INSERT INTO `item_mods` VALUES(11127, 30, 7);
INSERT INTO `item_mods` VALUES(11127, 28, 7);
INSERT INTO `item_mods` VALUES(11107, 1, 23);
INSERT INTO `item_mods` VALUES(11107, 12, 7);
INSERT INTO `item_mods` VALUES(11107, 28, 8);
INSERT INTO `item_mods` VALUES(11147, 1, 17);
INSERT INTO `item_mods` VALUES(11147, 12, 10);
INSERT INTO `item_mods` VALUES(11147, 116, 15);
INSERT INTO `item_mods` VALUES(11147, 27, -10);
INSERT INTO `item_mods` VALUES(16203, 1, 7);
INSERT INTO `item_mods` VALUES(16203, 5, 10);
INSERT INTO `item_mods` VALUES(16203, 12, 7);
INSERT INTO `item_mods` VALUES(16203, 115, 7);
INSERT INTO `item_mods` VALUES(11706, 30, 3);
INSERT INTO `item_mods` VALUES(11706, 28, 3);
INSERT INTO `item_mods` VALUES(11593, 12, 7);
INSERT INTO `item_mods` VALUES(11593, 30, 4);
-- Estoqueur
INSERT INTO `item_mods` VALUES(11068, 1, 31);
INSERT INTO `item_mods` VALUES(11068, 5, 40);
INSERT INTO `item_mods` VALUES(11068, 12, 8);
INSERT INTO `item_mods` VALUES(11068, 13, 8);
INSERT INTO `item_mods` VALUES(11068, 30, 7);
INSERT INTO `item_mods` VALUES(11068, 28, 7);
INSERT INTO `item_mods` VALUES(11088, 1, 52);
INSERT INTO `item_mods` VALUES(11088, 12, 12);
INSERT INTO `item_mods` VALUES(11088, 13, 12);
INSERT INTO `item_mods` VALUES(11088, 30, 10);
INSERT INTO `item_mods` VALUES(11088, 369, 2);
INSERT INTO `item_mods` VALUES(11108, 1, 22);
INSERT INTO `item_mods` VALUES(11108, 13, 6);
INSERT INTO `item_mods` VALUES(11108, 30, 7);
INSERT INTO `item_mods` VALUES(11128, 1, 42);
INSERT INTO `item_mods` VALUES(11128, 5, 65);
INSERT INTO `item_mods` VALUES(11128, 12, 9);
INSERT INTO `item_mods` VALUES(11128, 30, 6);
INSERT INTO `item_mods` VALUES(11128, 28, 6);
INSERT INTO `item_mods` VALUES(11108, 114, 15);
INSERT INTO `item_mods` VALUES(11148, 1, 19);
INSERT INTO `item_mods` VALUES(11148, 13, 13);
INSERT INTO `item_mods` VALUES(11148, 113, 15);
INSERT INTO `item_mods` VALUES(11148, 27, -7);
INSERT INTO `item_mods` VALUES(11707, 30, 3);
INSERT INTO `item_mods` VALUES(11707, 170, 2);
INSERT INTO `item_mods` VALUES(11594, 2, 20);
INSERT INTO `item_mods` VALUES(11594, 5, 20);
INSERT INTO `item_mods` VALUES(11594, 13, 8);
INSERT INTO `item_mods` VALUES(16204, 1, 8);
INSERT INTO `item_mods` VALUES(16204, 13, 5);
INSERT INTO `item_mods` VALUES(16204, 113, 6);
-- Ravager
INSERT INTO `item_mods` VALUES(11064, 1, 38);
INSERT INTO `item_mods` VALUES(11064, 8, 8);
INSERT INTO `item_mods` VALUES(11064, 10, 8);
INSERT INTO `item_mods` VALUES(11064, 25, 14);
INSERT INTO `item_mods` VALUES(11064, 23, 14);
INSERT INTO `item_mods` VALUES(11064, 165, 3);
INSERT INTO `item_mods` VALUES(11064, 288, 4);
INSERT INTO `item_mods` VALUES(11084, 1, 68);
INSERT INTO `item_mods` VALUES(11084, 25, 20);
INSERT INTO `item_mods` VALUES(11084, 23, 20);
INSERT INTO `item_mods` VALUES(11084, 85, 7);
INSERT INTO `item_mods` VALUES(11084, 73, 8);
INSERT INTO `item_mods` VALUES(11144, 1, 27);
INSERT INTO `item_mods` VALUES(11144, 25, 7);
INSERT INTO `item_mods` VALUES(11144, 167, 5);
INSERT INTO `item_mods` VALUES(11124, 1, 54);
INSERT INTO `item_mods` VALUES(11124, 23, 15);
INSERT INTO `item_mods` VALUES(11124, 288, 5);
INSERT INTO `item_mods` VALUES(11124, 167, 7);
INSERT INTO `item_mods` VALUES(11104, 1, 32);
INSERT INTO `item_mods` VALUES(11104, 8, 9);
INSERT INTO `item_mods` VALUES(11104, 9, 9);
INSERT INTO `item_mods` VALUES(11104, 25, 12);
INSERT INTO `item_mods` VALUES(11104, 84, 5);
INSERT INTO `item_mods` VALUES(19253, 8, 4);
INSERT INTO `item_mods` VALUES(19253, 23, 8);
INSERT INTO `item_mods` VALUES(11703, 23, 3);
INSERT INTO `item_mods` VALUES(11703, 288, 1);
INSERT INTO `item_mods` VALUES(11591, 8, 3);
INSERT INTO `item_mods` VALUES(11591, 288, 2);
-- Tantra
INSERT INTO `item_mods` VALUES(11065, 1, 36);
INSERT INTO `item_mods` VALUES(11065, 8, 7);
INSERT INTO `item_mods` VALUES(11065, 167, 7);
INSERT INTO `item_mods` VALUES(11065, 289, 10);
INSERT INTO `item_mods` VALUES(11085, 1, 64);
INSERT INTO `item_mods` VALUES(11085, 8, 12);
INSERT INTO `item_mods` VALUES(11085, 10, 12);
INSERT INTO `item_mods` VALUES(11085, 25, 15);
INSERT INTO `item_mods` VALUES(11085, 23, 15);
INSERT INTO `item_mods` VALUES(11125, 1, 49);
INSERT INTO `item_mods` VALUES(11125, 23, 10);
INSERT INTO `item_mods` VALUES(11125, 25, 10);
INSERT INTO `item_mods` VALUES(11125, 73, 6);
INSERT INTO `item_mods` VALUES(11125, 167, 6);
INSERT INTO `item_mods` VALUES(11125, 292, 7);
INSERT INTO `item_mods` VALUES(11105, 1, 27);
INSERT INTO `item_mods` VALUES(11105, 25, 10);
INSERT INTO `item_mods` VALUES(11105, 80, 7);
INSERT INTO `item_mods` VALUES(11105, 167, 3);
INSERT INTO `item_mods` VALUES(11145, 1, 25);
INSERT INTO `item_mods` VALUES(11145, 8, 8);
INSERT INTO `item_mods` VALUES(11145, 25, 8);
INSERT INTO `item_mods` VALUES(11704, 2, 10);
INSERT INTO `item_mods` VALUES(11704, 292, 1);
INSERT INTO `item_mods` VALUES(11592, 25, 5);
INSERT INTO `item_mods` VALUES(11592, 292, 2);
INSERT INTO `item_mods` VALUES(19254, 8, 4);
INSERT INTO `item_mods` VALUES(19254, 10, 4);
INSERT INTO `item_mods` VALUES(19254, 25, 6);
-- Raider
INSERT INTO `item_mods` VALUES(11069, 1, 36);
INSERT INTO `item_mods` VALUES(11069, 25, 12);
INSERT INTO `item_mods` VALUES(11069, 302, 3);
INSERT INTO `item_mods` VALUES(11069, 167, 6);
INSERT INTO `item_mods` VALUES(11089, 1, 64);
INSERT INTO `item_mods` VALUES(11089, 9, 10);
INSERT INTO `item_mods` VALUES(11089, 81, 5);
INSERT INTO `item_mods` VALUES(11089, 167, 5);
INSERT INTO `item_mods` VALUES(11129, 1, 48);
INSERT INTO `item_mods` VALUES(11129, 9, 7);
INSERT INTO `item_mods` VALUES(11129, 165, 4);
INSERT INTO `item_mods` VALUES(11129, 167, 5);
INSERT INTO `item_mods` VALUES(11109, 1, 28);
INSERT INTO `item_mods` VALUES(11109, 8, 8);
INSERT INTO `item_mods` VALUES(11109, 9, 8);
INSERT INTO `item_mods` VALUES(11109, 23, 16);
INSERT INTO `item_mods` VALUES(11109, 25, 12);
INSERT INTO `item_mods` VALUES(11149, 1, 23);
INSERT INTO `item_mods` VALUES(11149, 11, 15);
INSERT INTO `item_mods` VALUES(11149, 68, 11);
INSERT INTO `item_mods` VALUES(11149, 303, 1);
INSERT INTO `item_mods` VALUES(19260, 25, 3);
INSERT INTO `item_mods` VALUES(19260, 259, 3);
INSERT INTO `item_mods` VALUES(11736, 1, 11);
INSERT INTO `item_mods` VALUES(11736, 9, 3);
INSERT INTO `item_mods` VALUES(11736, 14, 3);
INSERT INTO `item_mods` VALUES(11736, 302, 1);
INSERT INTO `item_mods` VALUES(11708, 68, 3);
INSERT INTO `item_mods` VALUES(11708, 302, 1);
-- Creed
INSERT INTO `item_mods` VALUES(11070, 1, 44);
INSERT INTO `item_mods` VALUES(11070, 2, 40);
INSERT INTO `item_mods` VALUES(11070, 5, 40);
INSERT INTO `item_mods` VALUES(11070, 109, 7);
INSERT INTO `item_mods` VALUES(11070, 170, 5);
INSERT INTO `item_mods` VALUES(11090, 1, 77);
INSERT INTO `item_mods` VALUES(11090, 2, 65);
INSERT INTO `item_mods` VALUES(11090, 5, 65);
INSERT INTO `item_mods` VALUES(11090, 23, 20);
INSERT INTO `item_mods` VALUES(11090, 25, 20);
INSERT INTO `item_mods` VALUES(11090, 27, 10);
INSERT INTO `item_mods` VALUES(11130, 1, 58);
INSERT INTO `item_mods` VALUES(11130, 2, 50);
INSERT INTO `item_mods` VALUES(11130, 167, 4);
INSERT INTO `item_mods` VALUES(11130, 161, -5);
INSERT INTO `item_mods` VALUES(11110, 1, 35);
INSERT INTO `item_mods` VALUES(11110, 8, 11);
INSERT INTO `item_mods` VALUES(11110, 10, 11);
INSERT INTO `item_mods` VALUES(11110, 82, 7);
INSERT INTO `item_mods` VALUES(11110, 167, 4);
INSERT INTO `item_mods` VALUES(11150, 1, 30);
INSERT INTO `item_mods` VALUES(11150, 25, 14);
INSERT INTO `item_mods` VALUES(11150, 27, 7);
INSERT INTO `item_mods` VALUES(11150, 167, 4);
INSERT INTO `item_mods` VALUES(11750, 1, 10);
INSERT INTO `item_mods` VALUES(11750, 2, 40);
INSERT INTO `item_mods` VALUES(11750, 29, 4);
INSERT INTO `item_mods` VALUES(11750, 27, 5);
INSERT INTO `item_mods` VALUES(11595, 369, 1);
INSERT INTO `item_mods` VALUES(11709, 2, 30);
INSERT INTO `item_mods` VALUES(11709, 109, 3);
-- Bale
INSERT INTO `item_mods` VALUES(11071, 1, 42);
INSERT INTO `item_mods` VALUES(11071, 8, 7);
INSERT INTO `item_mods` VALUES(11071, 9, 7);
INSERT INTO `item_mods` VALUES(11071, 86, 7);
INSERT INTO `item_mods` VALUES(11071, 288, 3);
INSERT INTO `item_mods` VALUES(11071, 167, 6);
INSERT INTO `item_mods` VALUES(11091, 1, 71);
INSERT INTO `item_mods` VALUES(11091, 23, 38);
INSERT INTO `item_mods` VALUES(11091, 165, 4);
INSERT INTO `item_mods` VALUES(11091, 167, 3);
INSERT INTO `item_mods` VALUES(11131, 1, 53);
INSERT INTO `item_mods` VALUES(11131, 8, 12);
INSERT INTO `item_mods` VALUES(11131, 25, 15);
INSERT INTO `item_mods` VALUES(11131, 23, 15);
INSERT INTO `item_mods` VALUES(11131, 116, 15);
INSERT INTO `item_mods` VALUES(11111, 1, 31);
INSERT INTO `item_mods` VALUES(11111, 25, 10);
INSERT INTO `item_mods` VALUES(11111, 23, 10);
INSERT INTO `item_mods` VALUES(11111, 83, 5);
INSERT INTO `item_mods` VALUES(11111, 167, 5);
INSERT INTO `item_mods` VALUES(11151, 1, 27);
INSERT INTO `item_mods` VALUES(11151, 8, 9);
INSERT INTO `item_mods` VALUES(11151, 12, 9);
INSERT INTO `item_mods` VALUES(11151, 13, 9);
INSERT INTO `item_mods` VALUES(11151, 30, 8);
INSERT INTO `item_mods` VALUES(11151, 28, 8);
INSERT INTO `item_mods` VALUES(11710, 8, 4);
INSERT INTO `item_mods` VALUES(11710, 23, 8);
INSERT INTO `item_mods` VALUES(11616, 8, 5);
INSERT INTO `item_mods` VALUES(11616, 25, 8);
INSERT INTO `item_mods` VALUES(11616, 23, 8);
INSERT INTO `item_mods` VALUES(11616, 369, 1);
INSERT INTO `item_mods` VALUES(11737, 8, 6);
INSERT INTO `item_mods` VALUES(11737, 12, 6);
INSERT INTO `item_mods` VALUES(11737, 25, 6);
-- Ferine
INSERT INTO `item_mods` VALUES(11072, 1, 37);
INSERT INTO `item_mods` VALUES(11072, 9, 8);
INSERT INTO `item_mods` VALUES(11072, 14, 8);
INSERT INTO `item_mods` VALUES(11072, 25, 8);
INSERT INTO `item_mods` VALUES(11072, 167, 6);
INSERT INTO `item_mods` VALUES(11092, 1, 67);
INSERT INTO `item_mods` VALUES(11092, 25, 18);
INSERT INTO `item_mods` VALUES(11092, 23, 18);
INSERT INTO `item_mods` VALUES(11092, 68, 18);
INSERT INTO `item_mods` VALUES(11092, 84, 7);
INSERT INTO `item_mods` VALUES(11092, 167, 2);
INSERT INTO `item_mods` VALUES(11132, 1, 51);
INSERT INTO `item_mods` VALUES(11132, 14, 10);
INSERT INTO `item_mods` VALUES(11132, 25, 7);
INSERT INTO `item_mods` VALUES(11132, 23, 7);
INSERT INTO `item_mods` VALUES(11132, 167, 7);
INSERT INTO `item_mods` VALUES(11112, 1, 29);
INSERT INTO `item_mods` VALUES(11112, 8, 11);
INSERT INTO `item_mods` VALUES(11112, 23, 15);
INSERT INTO `item_mods` VALUES(11112, 165, 3);
INSERT INTO `item_mods` VALUES(11152, 1, 25);
INSERT INTO `item_mods` VALUES(11152, 8, 7);
INSERT INTO `item_mods` VALUES(11152, 9, 7);
INSERT INTO `item_mods` VALUES(11152, 25, 8);
INSERT INTO `item_mods` VALUES(11152, 288, 3);
INSERT INTO `item_mods` VALUES(11617, 14, 6);
INSERT INTO `item_mods` VALUES(11617, 25, 7);
INSERT INTO `item_mods` VALUES(11617, 23, 7);
INSERT INTO `item_mods` VALUES(11555, 9, 4);
INSERT INTO `item_mods` VALUES(11555, 14, 4);
INSERT INTO `item_mods` VALUES(11555, 25, 7);
INSERT INTO `item_mods` VALUES(11711, 364, 2);
-- Aoidos'
INSERT INTO `item_mods` VALUES(11073, 1, 33);
INSERT INTO `item_mods` VALUES(11073, 14, 8);
INSERT INTO `item_mods` VALUES(11073, 27, -7);
INSERT INTO `item_mods` VALUES(11093, 1, 51);
INSERT INTO `item_mods` VALUES(11093, 14, 10);
INSERT INTO `item_mods` VALUES(11093, 119, 10)
INSERT INTO `item_mods` VALUES(11093, 121, 10)
INSERT INTO `item_mods` VALUES(11133, 1, 42);
INSERT INTO `item_mods` VALUES(11133, 30, 7);
INSERT INTO `item_mods` VALUES(11133, 119, 10);
INSERT INTO `item_mods` VALUES(11113, 1, 24);
INSERT INTO `item_mods` VALUES(11113, 14, 12);
INSERT INTO `item_mods` VALUES(11113, 30, 8);
INSERT INTO `item_mods` VALUES(11113, 119, 8);
INSERT INTO `item_mods` VALUES(11113, 120, 8);
INSERT INTO `item_mods` VALUES(11113, 121, 8);
INSERT INTO `item_mods` VALUES(11153, 1, 18);
INSERT INTO `item_mods` VALUES(11153, 14, 11);
INSERT INTO `item_mods` VALUES(11153, 169, 12);
INSERT INTO `item_mods` VALUES(11153, 370, 2);
INSERT INTO `item_mods` VALUES(11712, 14, 4);
INSERT INTO `item_mods` VALUES(11738, 1, 6);
-- Sylvan
INSERT INTO `item_mods` VALUES(11074, 1, 34);
INSERT INTO `item_mods` VALUES(11074, 26, 13);
INSERT INTO `item_mods` VALUES(11074, 24, 13);
INSERT INTO `item_mods` VALUES(11074, 289, 10);
INSERT INTO `item_mods` VALUES(11094, 1, 61);
INSERT INTO `item_mods` VALUES(11094, 8, 12);
INSERT INTO `item_mods` VALUES(11094, 11, 12);
INSERT INTO `item_mods` VALUES(11094, 26, 20);
INSERT INTO `item_mods` VALUES(11094, 27, -9);
INSERT INTO `item_mods` VALUES(11134, 1, 46);
INSERT INTO `item_mods` VALUES(11134, 24, 12);
INSERT INTO `item_mods` VALUES(11134, 165, 3);
INSERT INTO `item_mods` VALUES(11134, 73, 9);
INSERT INTO `item_mods` VALUES(11114, 1, 25);
INSERT INTO `item_mods` VALUES(11114, 8, 10);
INSERT INTO `item_mods` VALUES(11114, 104, 7);
INSERT INTO `item_mods` VALUES(11114, 73, 7);
INSERT INTO `item_mods` VALUES(11154, 1, 22);
INSERT INTO `item_mods` VALUES(11154, 11, 15);
INSERT INTO `item_mods` VALUES(11154, 105, 7);
INSERT INTO `item_mods` VALUES(11154, 27, -8);
INSERT INTO `item_mods` VALUES(11713, 11, 4);
INSERT INTO `item_mods` VALUES(11713, 27, -2);
INSERT INTO `item_mods` VALUES(11596, 11, 6);
INSERT INTO `item_mods` VALUES(11596, 24, 8);
INSERT INTO `item_mods` VALUES(11596, 27, -3);
INSERT INTO `item_mods` VALUES(16205, 1, 9);
INSERT INTO `item_mods` VALUES(16205, 8, 6);
INSERT INTO `item_mods` VALUES(16205, 73, 5);
INSERT INTO `item_mods` VALUES(16205, 27, -3);
-- Unkai
INSERT INTO `item_mods` VALUES(11075, 1, 41);
INSERT INTO `item_mods` VALUES(11075, 9, 7);
INSERT INTO `item_mods` VALUES(11075, 73, 8);
INSERT INTO `item_mods` VALUES(11075, 167, 6);
INSERT INTO `item_mods` VALUES(11095, 1, 70);
INSERT INTO `item_mods` VALUES(11095, 25, 17);
INSERT INTO `item_mods` VALUES(11095, 23, 17);
INSERT INTO `item_mods` VALUES(11095, 89, 7);
INSERT INTO `item_mods` VALUES(11095, 73, 10);
INSERT INTO `item_mods` VALUES(11095, 306, 10);
INSERT INTO `item_mods` VALUES(11135, 1, 54);
INSERT INTO `item_mods` VALUES(11135, 8, 8);
INSERT INTO `item_mods` VALUES(11135, 9, 8);
INSERT INTO `item_mods` VALUES(11135, 73, 7);
INSERT INTO `item_mods` VALUES(11135, 167, 4);
INSERT INTO `item_mods` VALUES(11115, 1, 31);
INSERT INTO `item_mods` VALUES(11115, 8, 10);
INSERT INTO `item_mods` VALUES(11115, 11, 10);
INSERT INTO `item_mods` VALUES(11115, 25, 8);
INSERT INTO `item_mods` VALUES(11115, 26, 12);
INSERT INTO `item_mods` VALUES(11115, 24, 12);
INSERT INTO `item_mods` VALUES(11155, 1, 28);
INSERT INTO `item_mods` VALUES(11155, 8, 8);
INSERT INTO `item_mods` VALUES(11155, 25, 15);
INSERT INTO `item_mods` VALUES(11155, 23, 15);
INSERT INTO `item_mods` VALUES(11714, 73, 1);
INSERT INTO `item_mods` VALUES(11714, 306, 3);
INSERT INTO `item_mods` VALUES(11597, 8, 3);
INSERT INTO `item_mods` VALUES(11597, 25, 5);
INSERT INTO `item_mods` VALUES(11597, 73, 3);
INSERT INTO `item_mods` VALUES(16206, 1, 14);
INSERT INTO `item_mods` VALUES(16206, 8, 5);
INSERT INTO `item_mods` VALUES(16206, 23, 14);
INSERT INTO `item_mods` VALUES(16206, 306, 5);
-- Iga
INSERT INTO `item_mods` VALUES(11076, 1, 37);
INSERT INTO `item_mods` VALUES(11076, 9, 10);
INSERT INTO `item_mods` VALUES(11076, 167, 6);
INSERT INTO `item_mods` VALUES(11076, 259, 5);
INSERT INTO `item_mods` VALUES(11096, 1, 62);
INSERT INTO `item_mods` VALUES(11096, 8, 12);
INSERT INTO `item_mods` VALUES(11096, 9, 12);
INSERT INTO `item_mods` VALUES(11096, 25, 17);
INSERT INTO `item_mods` VALUES(11096, 23, 17);
INSERT INTO `item_mods` VALUES(11096, 165, 5);
INSERT INTO `item_mods` VALUES(11136, 1, 48);
INSERT INTO `item_mods` VALUES(11136, 25, 8);
INSERT INTO `item_mods` VALUES(11136, 88, 5);
INSERT INTO `item_mods` VALUES(11136, 167, 7);
INSERT INTO `item_mods` VALUES(11116, 1, 27);
INSERT INTO `item_mods` VALUES(11116, 9, 10);
INSERT INTO `item_mods` VALUES(11116, 11, 10);
INSERT INTO `item_mods` VALUES(11116, 25, 8);
INSERT INTO `item_mods` VALUES(11116, 68, 8);
INSERT INTO `item_mods` VALUES(11156, 1, 23);
INSERT INTO `item_mods` VALUES(11156, 8, 5);
INSERT INTO `item_mods` VALUES(11156, 9, 5);
INSERT INTO `item_mods` VALUES(11156, 167, 4);
INSERT INTO `item_mods` VALUES(11715, 68, 5);
INSERT INTO `item_mods` VALUES(11715, 259, 1);
INSERT INTO `item_mods` VALUES(11598, 25, 7);
INSERT INTO `item_mods` VALUES(11598, 68, 7);
INSERT INTO `item_mods` VALUES(16207, 1, 10);
INSERT INTO `item_mods` VALUES(16207, 9, 5);
INSERT INTO `item_mods` VALUES(16207, 165, 3);
INSERT INTO `item_mods` VALUES(16207, 73, 5);
-- Lancer's
INSERT INTO `item_mods` VALUES(11077, 1, 40);
INSERT INTO `item_mods` VALUES(11077, 23, 20);
INSERT INTO `item_mods` VALUES(11077, 87, 7);
INSERT INTO `item_mods` VALUES(11077, 167, 6);
INSERT INTO `item_mods` VALUES(11097, 1, 66);
INSERT INTO `item_mods` VALUES(11097, 8, 14);
INSERT INTO `item_mods` VALUES(11097, 9, 14);
INSERT INTO `item_mods` VALUES(11097, 25, 14);
INSERT INTO `item_mods` VALUES(11097, 23, 14);
INSERT INTO `item_mods` VALUES(11097, 73, 10);
INSERT INTO `item_mods` VALUES(11137, 1, 52);
INSERT INTO `item_mods` VALUES(11137, 8, 9);
INSERT INTO `item_mods` VALUES(11137, 10, 9);
INSERT INTO `item_mods` VALUES(11137, 23, 18);
INSERT INTO `item_mods` VALUES(11117, 1, 30);
INSERT INTO `item_mods` VALUES(11117, 8, 8);
INSERT INTO `item_mods` VALUES(11117, 9, 8);
INSERT INTO `item_mods` VALUES(11117, 25, 10);
INSERT INTO `item_mods` VALUES(11117, 288, 4);
INSERT INTO `item_mods` VALUES(11157, 1, 26);
INSERT INTO `item_mods` VALUES(11157, 25, 12);
INSERT INTO `item_mods` VALUES(11157, 23, 12);
INSERT INTO `item_mods` VALUES(11157, 10, 10);
INSERT INTO `item_mods` VALUES(11157, 167, 5);
INSERT INTO `item_mods` VALUES(11716, 25, 4);
INSERT INTO `item_mods` VALUES(11599, 8, 5);
INSERT INTO `item_mods` VALUES(11599, 25, 5);
INSERT INTO `item_mods` VALUES(16208, 1, 9);
INSERT INTO `item_mods` VALUES(16208, 25, 5);
INSERT INTO `item_mods` VALUES(16208, 167, 1);
-- Caller's
INSERT INTO `item_mods` VALUES(11078, 1, 28);
INSERT INTO `item_mods` VALUES(11078, 5, 30);
INSERT INTO `item_mods` VALUES(11078, 117, 9);
INSERT INTO `item_mods` VALUES(11078, 369, 2);
INSERT INTO `item_mods` VALUES(11098, 1, 50);
INSERT INTO `item_mods` VALUES(11098, 5, 60);
INSERT INTO `item_mods` VALUES(11098, 117, 10);
INSERT INTO `item_mods` VALUES(11098, 371, -4);
INSERT INTO `item_mods` VALUES(11138, 1, 40);
INSERT INTO `item_mods` VALUES(11138, 5, 45);
INSERT INTO `item_mods` VALUES(11138, 117, 6);
INSERT INTO `item_mods` VALUES(11118, 1, 23);
INSERT INTO `item_mods` VALUES(11118, 5, 50);
INSERT INTO `item_mods` VALUES(11158, 1, 17);
INSERT INTO `item_mods` VALUES(11158, 5, 25);
INSERT INTO `item_mods` VALUES(11158, 371, -3);
INSERT INTO `item_mods` VALUES(11717, 5, 30);
INSERT INTO `item_mods` VALUES(11717, 357, -1);
INSERT INTO `item_mods` VALUES(11619, 117, 9);
INSERT INTO `item_mods` VALUES(11739, 1, 4);
INSERT INTO `item_mods` VALUES(11739, 5, 20);
INSERT INTO `item_mods` VALUES(11739, 312, 2);
INSERT INTO `item_mods` VALUES(11739, 27, 2);
-- Mavi
INSERT INTO `item_mods` VALUES(11079, 1, 34);
INSERT INTO `item_mods` VALUES(11079, 25, 12);
INSERT INTO `item_mods` VALUES(11079, 82, 7);
INSERT INTO `item_mods` VALUES(11079, 167, 6);
INSERT INTO `item_mods` VALUES(11099, 1, 60);
INSERT INTO `item_mods` VALUES(11099, 25, 12);
INSERT INTO `item_mods` VALUES(11099, 30, 12);
INSERT INTO `item_mods` VALUES(11099, 167, 3);
INSERT INTO `item_mods` VALUES(11099, 369, 2);
INSERT INTO `item_mods` VALUES(11139, 1, 47);
INSERT INTO `item_mods` VALUES(11139, 8, 8);
INSERT INTO `item_mods` VALUES(11139, 9, 8);
INSERT INTO `item_mods` VALUES(11139, 122, 15);
INSERT INTO `item_mods` VALUES(11139, 167, 4);
INSERT INTO `item_mods` VALUES(11119, 1, 26);
INSERT INTO `item_mods` VALUES(11119, 13, 10);
INSERT INTO `item_mods` VALUES(11119, 28, 10);
INSERT INTO `item_mods` VALUES(11119, 27, -4);
INSERT INTO `item_mods` VALUES(11159, 1, 23);
INSERT INTO `item_mods` VALUES(11159, 12, 10);
INSERT INTO `item_mods` VALUES(11159, 30, 8);
INSERT INTO `item_mods` VALUES(11159, 28, 8);
INSERT INTO `item_mods` VALUES(11159, 27, -6);
INSERT INTO `item_mods` VALUES(11718, 2, 20);
INSERT INTO `item_mods` VALUES(11718, 5, 20);
INSERT INTO `item_mods` VALUES(11718, 30, 2);
INSERT INTO `item_mods` VALUES(11600, 5, 20);
INSERT INTO `item_mods` VALUES(11600, 82, 4);
INSERT INTO `item_mods` VALUES(11600, 122, 4);
INSERT INTO `item_mods` VALUES(19255, 122, 5);
-- Navarch's
INSERT INTO `item_mods` VALUES(11080, 1, 35);
INSERT INTO `item_mods` VALUES(11080, 11, 10);
INSERT INTO `item_mods` VALUES(11080, 26, 16);
INSERT INTO `item_mods` VALUES(11080, 359, 10);
INSERT INTO `item_mods` VALUES(11100, 1, 61);
INSERT INTO `item_mods` VALUES(11100, 26, 14);
INSERT INTO `item_mods` VALUES(11100, 24, 14);
INSERT INTO `item_mods` VALUES(11100, 30, 10);
INSERT INTO `item_mods` VALUES(11140, 1, 47);
INSERT INTO `item_mods` VALUES(11140, 9, 8);
INSERT INTO `item_mods` VALUES(11140, 11, 8);
INSERT INTO `item_mods` VALUES(11140, 73, 8);
INSERT INTO `item_mods` VALUES(11120, 1, 26);
INSERT INTO `item_mods` VALUES(11120, 25, 16);
INSERT INTO `item_mods` VALUES(11120, 26, 16);
INSERT INTO `item_mods` VALUES(11120, 165, 5);
INSERT INTO `item_mods` VALUES(11160, 1, 22);
INSERT INTO `item_mods` VALUES(11160, 11, 13);
INSERT INTO `item_mods` VALUES(11160, 30, 10);
INSERT INTO `item_mods` VALUES(11719, 26, 3);
INSERT INTO `item_mods` VALUES(11719, 30, 2);
INSERT INTO `item_mods` VALUES(11601, 28, 3);
INSERT INTO `item_mods` VALUES(11601, 105, 5);
INSERT INTO `item_mods` VALUES(16209, 1, 9);
INSERT INTO `item_mods` VALUES(16209, 26, 7);
INSERT INTO `item_mods` VALUES(16209, 30, 7);
-- Cirque
INSERT INTO `item_mods` VALUES(11081, 1, 33);
INSERT INTO `item_mods` VALUES(11081, 80, 5);
INSERT INTO `item_mods` VALUES(11081, 288, 3);
INSERT INTO `item_mods` VALUES(11081, 167, 6);
INSERT INTO `item_mods` VALUES(11001, 1, 59);
INSERT INTO `item_mods` VALUES(11001, 9, 10);
INSERT INTO `item_mods` VALUES(11001, 25, 20);
INSERT INTO `item_mods` VALUES(11001, 23, 20);
INSERT INTO `item_mods` VALUES(11001, 167, 3);
INSERT INTO `item_mods` VALUES(11141, 1, 46);
INSERT INTO `item_mods` VALUES(11141, 25, 10);
INSERT INTO `item_mods` VALUES(11141, 23, 10);
INSERT INTO `item_mods` VALUES(11141, 167, 4);
INSERT INTO `item_mods` VALUES(11141, 173, -10);
INSERT INTO `item_mods` VALUES(11121, 1, 26);
INSERT INTO `item_mods` VALUES(11121, 8, 6);
INSERT INTO `item_mods` VALUES(11121, 9, 6);
INSERT INTO `item_mods` VALUES(11121, 11, 6);
INSERT INTO `item_mods` VALUES(11121, 73, 6);
INSERT INTO `item_mods` VALUES(11121, 167, 4);
INSERT INTO `item_mods` VALUES(11161, 1, 22);
INSERT INTO `item_mods` VALUES(11161, 8, 8);
INSERT INTO `item_mods` VALUES(11161, 9, 8);
INSERT INTO `item_mods` VALUES(11161, 12, 8);
INSERT INTO `item_mods` VALUES(11161, 25, 12);
INSERT INTO `item_mods` VALUES(11602, 25, 5);
INSERT INTO `item_mods` VALUES(11602, 173, -10);
INSERT INTO `item_mods` VALUES(11751, 1, 6);
INSERT INTO `item_mods` VALUES(11751, 9, 6);
INSERT INTO `item_mods` VALUES(11751, 167, 6);
-- Charis
INSERT INTO `item_mods` VALUES(11082, 1, 32);
INSERT INTO `item_mods` VALUES(11082, 25, 8);
INSERT INTO `item_mods` VALUES(11082, 23, 8);
INSERT INTO `item_mods` VALUES(11082, 73, 7);
INSERT INTO `item_mods` VALUES(11082, 167, 6);
INSERT INTO `item_mods` VALUES(11102, 1, 61);
INSERT INTO `item_mods` VALUES(11102, 9, 12);
INSERT INTO `item_mods` VALUES(11102, 14, 12);
INSERT INTO `item_mods` VALUES(11102, 289, 10);
INSERT INTO `item_mods` VALUES(11102, 259, 10);
INSERT INTO `item_mods` VALUES(11142, 1, 45);
INSERT INTO `item_mods` VALUES(11142, 68, 15);
INSERT INTO `item_mods` VALUES(11142, 81, 5);
INSERT INTO `item_mods` VALUES(11142, 167, 5);
INSERT INTO `item_mods` VALUES(11122, 1, 25);
INSERT INTO `item_mods` VALUES(11122, 9, 9);
INSERT INTO `item_mods` VALUES(11122, 11, 9);
INSERT INTO `item_mods` VALUES(11122, 25, 8);
INSERT INTO `item_mods` VALUES(11122, 175, 10);
INSERT INTO `item_mods` VALUES(11162, 1, 21);
INSERT INTO `item_mods` VALUES(11162, 9, 8);
INSERT INTO `item_mods` VALUES(11162, 14, 8);
INSERT INTO `item_mods` VALUES(11162, 73, 8);
INSERT INTO `item_mods` VALUES(11162, 167, 4);
INSERT INTO `item_mods` VALUES(11721, 289, 3);
INSERT INTO `item_mods` VALUES(19256, 9, 5);
INSERT INTO `item_mods` VALUES(11603, 259, 3);
INSERT INTO `item_mods` VALUES(11603, 289, 5);
-- Savant's
INSERT INTO `item_mods` VALUES(11083, 1, 30);
INSERT INTO `item_mods` VALUES(11083, 5, 45);
INSERT INTO `item_mods` VALUES(11083, 113, 10);
INSERT INTO `item_mods` VALUES(11103, 1, 52);
INSERT INTO `item_mods` VALUES(11103, 12, 12);
INSERT INTO `item_mods` VALUES(11103, 13, 12);
INSERT INTO `item_mods` VALUES(11103, 28, 11);
INSERT INTO `item_mods` VALUES(11103, 30, 11);
INSERT INTO `item_mods` VALUES(11103, 369, 2);
INSERT INTO `item_mods` VALUES(11143, 1, 40);
INSERT INTO `item_mods` VALUES(11143, 13, 11);
INSERT INTO `item_mods` VALUES(11143, 114, 10);
INSERT INTO `item_mods` VALUES(11123, 1, 23);
INSERT INTO `item_mods` VALUES(11123, 5, 20);
INSERT INTO `item_mods` VALUES(11123, 12, 9);
INSERT INTO `item_mods` VALUES(11123, 13, 9);
INSERT INTO `item_mods` VALUES(11123, 27, -4);
INSERT INTO `item_mods` VALUES(11163, 1, 19);
INSERT INTO `item_mods` VALUES(11163, 5, 35);
INSERT INTO `item_mods` VALUES(11163, 12, 8);
INSERT INTO `item_mods` VALUES(11163, 115, 10);
INSERT INTO `item_mods` VALUES(11722, 334, 1);
INSERT INTO `item_mods` VALUES(11620, 12, 5);
INSERT INTO `item_mods` VALUES(11620, 13, 5);
INSERT INTO `item_mods` VALUES(11620, 30, 3);
INSERT INTO `item_mods` VALUES(11620, 28, 3);
INSERT INTO `item_mods` VALUES(19247, 115, 4);
INSERT INTO `item_mods` VALUES(19247, 114, 4);
INSERT INTO `item_mods` VALUES(19247, 113, 4);
-- Thaumas
INSERT INTO `item_mods` VALUES(10906, 1, 34);
INSERT INTO `item_mods` VALUES(10906, 8, 6);
INSERT INTO `item_mods` VALUES(10906, 11, 14);
INSERT INTO `item_mods` VALUES(10906, 24, 6);
INSERT INTO `item_mods` VALUES(10906, 30, 6);
INSERT INTO `item_mods` VALUES(10906, 28, 6);
INSERT INTO `item_mods` VALUES(10906, 165, 4);
INSERT INTO `item_mods` VALUES(10479, 1, 63);
INSERT INTO `item_mods` VALUES(10479, 25, 12);
INSERT INTO `item_mods` VALUES(10479, 288, 3);
INSERT INTO `item_mods` VALUES(10479, 302, 3);
INSERT INTO `item_mods` VALUES(10479, 167, 4);
INSERT INTO `item_mods` VALUES(10559, 1, 47);
INSERT INTO `item_mods` VALUES(10559, 2, 40);
INSERT INTO `item_mods` VALUES(10559, 8, 9);
INSERT INTO `item_mods` VALUES(10559, 11, 9);
INSERT INTO `item_mods` VALUES(10559, 25, 14);
INSERT INTO `item_mods` VALUES(10559, 23, 14);
INSERT INTO `item_mods` VALUES(10559, 167, 6);
INSERT INTO `item_mods` VALUES(10528, 1, 28);
INSERT INTO `item_mods` VALUES(10528, 9, 8);
INSERT INTO `item_mods` VALUES(10528, 10, 8);
INSERT INTO `item_mods` VALUES(10528, 11, 8);
INSERT INTO `item_mods` VALUES(10528, 25, 9);
INSERT INTO `item_mods` VALUES(10528, 170, 4);
INSERT INTO `item_mods` VALUES(10528, 167, 3);
INSERT INTO `item_mods` VALUES(10625, 1, 26);
INSERT INTO `item_mods` VALUES(10625, 9, 9);
INSERT INTO `item_mods` VALUES(10625, 11, 9);
INSERT INTO `item_mods` VALUES(10625, 13, 9);
INSERT INTO `item_mods` VALUES(10625, 23, 14);
INSERT INTO `item_mods` VALUES(10625, 24, 14);
INSERT INTO `item_mods` VALUES(10625, 288, 3);
-- Phorcys
INSERT INTO `item_mods` VALUES(10901, 1, 36);
INSERT INTO `item_mods` VALUES(10901, 25, 10);
INSERT INTO `item_mods` VALUES(10901, 23, 10);
INSERT INTO `item_mods` VALUES(10901, 73, 5);
INSERT INTO `item_mods` VALUES(10901, 167, 7);
INSERT INTO `item_mods` VALUES(10901, 289, 5);
INSERT INTO `item_mods` VALUES(10474, 1, 70);
INSERT INTO `item_mods` VALUES(10474, 8, 16);
INSERT INTO `item_mods` VALUES(10474, 62, 5);
INSERT INTO `item_mods` VALUES(10474, 28, 7);
INSERT INTO `item_mods` VALUES(10554, 1, 51);
INSERT INTO `item_mods` VALUES(10554, 9, 10);
INSERT INTO `item_mods` VALUES(10554, 10, 10);
INSERT INTO `item_mods` VALUES(10554, 23, 24);
INSERT INTO `item_mods` VALUES(10554, 73, 6);
INSERT INTO `item_mods` VALUES(10554, 167, 6);
INSERT INTO `item_mods` VALUES(10523, 1, 31);
INSERT INTO `item_mods` VALUES(10523, 8, 9);
INSERT INTO `item_mods` VALUES(10523, 10, 9);
INSERT INTO `item_mods` VALUES(10523, 12, 9);
INSERT INTO `item_mods` VALUES(10523, 13, 9);
INSERT INTO `item_mods` VALUES(10523, 23, 15);
INSERT INTO `item_mods` VALUES(10523, 288, 2);
INSERT INTO `item_mods` VALUES(10620, 1, 28);
INSERT INTO `item_mods` VALUES(10620, 25, 12);
INSERT INTO `item_mods` VALUES(10620, 288, 3);
INSERT INTO `item_mods` VALUES(10620, 161, -5);
-- Nares
INSERT INTO `item_mods` VALUES(10911, 1, 29);
INSERT INTO `item_mods` VALUES(10911, 12, 12);
INSERT INTO `item_mods` VALUES(10911, 28, 5);
INSERT INTO `item_mods` VALUES(10911, 170, 10);
INSERT INTO `item_mods` VALUES(10484, 1, 53);
INSERT INTO `item_mods` VALUES(10484, 12, 9);
INSERT INTO `item_mods` VALUES(10484, 13, 9);
INSERT INTO `item_mods` VALUES(10484, 14, 9);
INSERT INTO `item_mods` VALUES(10484, 30, 14);
INSERT INTO `item_mods` VALUES(10484, 28, 8);
INSERT INTO `item_mods` VALUES(10484, 27, -5);
INSERT INTO `item_mods` VALUES(10564, 1, 42);
INSERT INTO `item_mods` VALUES(10564, 3, 4);
INSERT INTO `item_mods` VALUES(10564, 6, 4);
INSERT INTO `item_mods` VALUES(10564, 13, 14);
INSERT INTO `item_mods` VALUES(10564, 374, 7);
INSERT INTO `item_mods` VALUES(10564, 369, 2);
INSERT INTO `item_mods` VALUES(10533, 1, 24);
INSERT INTO `item_mods` VALUES(10533, 6, 3);
INSERT INTO `item_mods` VALUES(10533, 28, 13);
INSERT INTO `item_mods` VALUES(10533, 71, 4);
INSERT INTO `item_mods` VALUES(10533, 312, 8);
INSERT INTO `item_mods` VALUES(10630, 1, 21);
INSERT INTO `item_mods` VALUES(10630, 3, 3);
INSERT INTO `item_mods` VALUES(10630, 6, 3);
INSERT INTO `item_mods` VALUES(10630, 13, 8);
INSERT INTO `item_mods` VALUES(10630, 14, 8);
INSERT INTO `item_mods` VALUES(10630, 30, 7);
INSERT INTO `item_mods` VALUES(10630, 28, 7);
-- Tenryu +1
INSERT INTO `item_mods` VALUES(10406, 1, 36);
INSERT INTO `item_mods` VALUES(10406, 8, 9);
INSERT INTO `item_mods` VALUES(10406, 11, 9);
INSERT INTO `item_mods` VALUES(10406, 25, 12);
INSERT INTO `item_mods` VALUES(10406, 23, 12);
INSERT INTO `item_mods` VALUES(10406, 289, 10);
INSERT INTO `item_mods` VALUES(10490, 1, 63);
INSERT INTO `item_mods` VALUES(10490, 8, 9);
INSERT INTO `item_mods` VALUES(10490, 11, 9);
INSERT INTO `item_mods` VALUES(10490, 25, 20);
INSERT INTO `item_mods` VALUES(10490, 68, 10);
INSERT INTO `item_mods` VALUES(10490, 73, 8);
INSERT INTO `item_mods` VALUES(10571, 1, 50);
INSERT INTO `item_mods` VALUES(10571, 8, 8);
INSERT INTO `item_mods` VALUES(10571, 9, 8);
INSERT INTO `item_mods` VALUES(10571, 11, 8);
INSERT INTO `item_mods` VALUES(10571, 25, 12);
INSERT INTO `item_mods` VALUES(10571, 23, 12);
INSERT INTO `item_mods` VALUES(10571, 73, 6);
INSERT INTO `item_mods` VALUES(10540, 1, 30);
INSERT INTO `item_mods` VALUES(10540, 8, 8);
INSERT INTO `item_mods` VALUES(10540, 11, 8);
INSERT INTO `item_mods` VALUES(10540, 25, 10);
INSERT INTO `item_mods` VALUES(10540, 23, 10);
INSERT INTO `item_mods` VALUES(10540, 289, 7);
INSERT INTO `item_mods` VALUES(10540, 167, 4);
INSERT INTO `item_mods` VALUES(10637, 1, 28);
INSERT INTO `item_mods` VALUES(10637, 8, 7);
INSERT INTO `item_mods` VALUES(10637, 11, 7);
INSERT INTO `item_mods` VALUES(10637, 23, 13);
INSERT INTO `item_mods` VALUES(10637, 68, 8);
INSERT INTO `item_mods` VALUES(10637, 27, 8);
-- Iaso
INSERT INTO `item_mods` VALUES(10409, 1, 30);
INSERT INTO `item_mods` VALUES(10409, 13, 10);
INSERT INTO `item_mods` VALUES(10409, 112, 10);
INSERT INTO `item_mods` VALUES(10409, 374, 11);
INSERT INTO `item_mods` VALUES(10409, 27, -5);
INSERT INTO `item_mods` VALUES(10493, 1, 54);
INSERT INTO `item_mods` VALUES(10493, 111, 18);
INSERT INTO `item_mods` VALUES(10493, 112, 18);
INSERT INTO `item_mods` VALUES(10493, 114, 18);
INSERT INTO `item_mods` VALUES(10493, 167, 4);
INSERT INTO `item_mods` VALUES(10574, 1, 40);
INSERT INTO `item_mods` VALUES(10574, 2, 50);
INSERT INTO `item_mods` VALUES(10574, 161, -4);
INSERT INTO `item_mods` VALUES(10543, 1, 27);
INSERT INTO `item_mods` VALUES(10543, 14, 12);
INSERT INTO `item_mods` VALUES(10543, 30, 10);
INSERT INTO `item_mods` VALUES(10543, 27, -6);
INSERT INTO `item_mods` VALUES(10640, 1, 28);
INSERT INTO `item_mods` VALUES(10640, 374, 4);
INSERT INTO `item_mods` VALUES(10640, 169, 12);
-- Huginn
INSERT INTO `item_mods` VALUES(10405, 1, 41);
INSERT INTO `item_mods` VALUES(10405, 2, 30);
INSERT INTO `item_mods` VALUES(10405, 5, 30);
INSERT INTO `item_mods` VALUES(10405, 8, 9);
INSERT INTO `item_mods` VALUES(10405, 9, 9);
INSERT INTO `item_mods` VALUES(10405, 10, 9);
INSERT INTO `item_mods` VALUES(10405, 25, 15);
INSERT INTO `item_mods` VALUES(10405, 23, 15);
INSERT INTO `item_mods` VALUES(10489, 1, 79);
INSERT INTO `item_mods` VALUES(10489, 2, 50);
INSERT INTO `item_mods` VALUES(10489, 5, 50);
INSERT INTO `item_mods` VALUES(10489, 8, 13);
INSERT INTO `item_mods` VALUES(10489, 10, 13);
INSERT INTO `item_mods` VALUES(10489, 23, 23);
INSERT INTO `item_mods` VALUES(10570, 1, 52);
INSERT INTO `item_mods` VALUES(10570, 2, 50);
INSERT INTO `item_mods` VALUES(10570, 5, 50);
INSERT INTO `item_mods` VALUES(10570, 8, 10);
INSERT INTO `item_mods` VALUES(10570, 10, 10);
INSERT INTO `item_mods` VALUES(10570, 12, 10);
INSERT INTO `item_mods` VALUES(10570, 13, 10);
INSERT INTO `item_mods` VALUES(10570, 25, 12);
INSERT INTO `item_mods` VALUES(10570, 23, 16);
INSERT INTO `item_mods` VALUES(10539, 1, 38);
INSERT INTO `item_mods` VALUES(10539, 2, 40);
INSERT INTO `item_mods` VALUES(10539, 5, 40);
INSERT INTO `item_mods` VALUES(10539, 8, 12);
INSERT INTO `item_mods` VALUES(10539, 10, 12);
INSERT INTO `item_mods` VALUES(10539, 25, 13);
INSERT INTO `item_mods` VALUES(10636, 1, 37);
INSERT INTO `item_mods` VALUES(10636, 2, 35);
INSERT INTO `item_mods` VALUES(10636, 5, 35);
INSERT INTO `item_mods` VALUES(10636, 8, 9);
INSERT INTO `item_mods` VALUES(10636, 10, 9);
INSERT INTO `item_mods` VALUES(10636, 23, 14);
INSERT INTO `item_mods` VALUES(10636, 167, 5);
-- Spurrina
INSERT INTO `item_mods` VALUES(10408, 1, 35);
INSERT INTO `item_mods` VALUES(10408, 5, 60);
INSERT INTO `item_mods` VALUES(10408, 12, 8);
INSERT INTO `item_mods` VALUES(10408, 13, 10);
INSERT INTO `item_mods` VALUES(10408, 30, 10);
INSERT INTO `item_mods` VALUES(10492, 1, 54);
INSERT INTO `item_mods` VALUES(10492, 5, 100);
INSERT INTO `item_mods` VALUES(10492, 28, 15);
INSERT INTO `item_mods` VALUES(10492, 27, -7);
INSERT INTO `item_mods` VALUES(10492, 369, 1);
INSERT INTO `item_mods` VALUES(10573, 1, 42);
INSERT INTO `item_mods` VALUES(10573, 5, 80);
INSERT INTO `item_mods` VALUES(10573, 12, 6);
INSERT INTO `item_mods` VALUES(10573, 68, 10);
INSERT INTO `item_mods` VALUES(10573, 115, 16);
INSERT INTO `item_mods` VALUES(10573, 116, 16);
INSERT INTO `item_mods` VALUES(10542, 1, 29);
INSERT INTO `item_mods` VALUES(10542, 5, 60);
INSERT INTO `item_mods` VALUES(10542, 168, 20);
INSERT INTO `item_mods` VALUES(10639, 1, 29);
INSERT INTO `item_mods` VALUES(10639, 5, 50);
INSERT INTO `item_mods` VALUES(10639, 13, 8);
INSERT INTO `item_mods` VALUES(10639, 30, 6);
INSERT INTO `item_mods` VALUES(10639, 114, 13);
-- Khepri
INSERT INTO `item_mods` VALUES(10407, 1, 35);
INSERT INTO `item_mods` VALUES(10407, 8, 12);
INSERT INTO `item_mods` VALUES(10407, 9, 12);
INSERT INTO `item_mods` VALUES(10407, 25, 13);
INSERT INTO `item_mods` VALUES(10491, 1, 64);
INSERT INTO `item_mods` VALUES(10491, 8, 15);
INSERT INTO `item_mods` VALUES(10491, 9, 15);
INSERT INTO `item_mods` VALUES(10491, 11, 15);
INSERT INTO `item_mods` VALUES(10491, 25, 18);
INSERT INTO `item_mods` VALUES(10491, 26, 22);
INSERT INTO `item_mods` VALUES(10491, 370, 2);
INSERT INTO `item_mods` VALUES(10572, 1, 49);
INSERT INTO `item_mods` VALUES(10572, 8, 12);
INSERT INTO `item_mods` VALUES(10572, 9, 12);
INSERT INTO `item_mods` VALUES(10572, 23, 10);
INSERT INTO `item_mods` VALUES(10572, 68, 5);
INSERT INTO `item_mods` VALUES(10572, 289, 8);
INSERT INTO `item_mods` VALUES(10541, 1, 30);
INSERT INTO `item_mods` VALUES(10541, 8, 9);
INSERT INTO `item_mods` VALUES(10541, 12, 9);
INSERT INTO `item_mods` VALUES(10541, 13, 9);
INSERT INTO `item_mods` VALUES(10541, 30, 6);
INSERT INTO `item_mods` VALUES(10541, 122, 8);
INSERT INTO `item_mods` VALUES(10638, 1, 29);
INSERT INTO `item_mods` VALUES(10638, 26, 18);
INSERT INTO `item_mods` VALUES(10638, 24, 15);
INSERT INTO `item_mods` VALUES(10638, 161, -3);
INSERT INTO `item_mods` VALUES(10638, 27, -7);
-- Tessera Saio
INSERT INTO `item_mods` VALUES(10485, 1, 66);
INSERT INTO `item_mods` VALUES(10485, 8, 13);
INSERT INTO `item_mods` VALUES(10485, 9, 13);
INSERT INTO `item_mods` VALUES(10485, 11, 13);
INSERT INTO `item_mods` VALUES(10485, 23, 17);
INSERT INTO `item_mods` VALUES(10485, 24, 17);
INSERT INTO `item_mods` VALUES(10485, 28, 5);
INSERT INTO `item_mods` VALUES(10485, 167, 3);


