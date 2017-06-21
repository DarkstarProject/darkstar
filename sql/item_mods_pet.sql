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
 `petType` tinyint(3) unsigned NOT NULL DEFAULT '0',
 PRIMARY KEY (`itemId`,`modId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=13 PACK_KEYS=1;

-- Please keep mods that apply to same item ID together
-- (easy way is to just keep item ID sequential)

-- -------------------------------------------------------
-- Charivari Earring - LVL 99
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (10296,25,3,3);        -- Automaton:ACC
INSERT INTO `item_mods_pet` VALUES (10296,26,3,3);        -- Automaton:RACC
INSERT INTO `item_mods_pet` VALUES (10296,30,3,3);        -- Automaton:MACC

-- -------------------------------------------------------
-- Sabong Earring - LVL 99
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (10299,288,2,0);       -- Pet:Double Atk+2%

-- -------------------------------------------------------
-- Murzim Zucchetto - LVL 99
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (10440,384,61,3);      -- Automaton: Haste+6%

-- -------------------------------------------------------
-- Tethyan Cuffs +1 - LVL 99
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (10530,28,5,1);        -- Avatar:MAB

-- -------------------------------------------------------
-- Tethyan Cuffs +2 - LVL 99
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (10531,28,5,1);        -- Avatar:MAB

-- -------------------------------------------------------
-- Tethyan Cuffs +3 - LVL 99
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (10532,28,5,1);        -- Avatar:MAB

-- -------------------------------------------------------
-- Smn. Horn +2 - LVL 90
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (10664,28,4,1);        -- Avatar:MAB

-- -------------------------------------------------------
-- Summoner's Doublet + 2 - LVL 90
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (10684,165,6,1);       -- Avatar: Critical Hit Rate +6%

-- -------------------------------------------------------
-- Smn. Bracers +2 - LVL 90
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (10704,25,10,1);       -- Avatar: Accuracy +10

-- -------------------------------------------------------
-- Smn. Spats +2
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (10724,30,5,1);        -- Avatar: Magic Accuracy +5 (?)
-- INSERT INTO `item_mods_pet` VALUES (10724,???,???,1);  -- Avatar: Shortens magic recast time for spirits

-- -------------------------------------------------------
-- Smn. Pigaches +2 - LVL 90
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (10744,23,10,1);       -- Avatar: Attack +10
INSERT INTO `item_mods_pet` VALUES (10744,562,5,1);       -- Avatar: Magic critical hit rate +5%

-- -------------------------------------------------------
-- Moepapa Stone
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (10817,384,51,0);      -- Pet: Haste+5%

-- -------------------------------------------------------
-- Muzzling Collar
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (10914,27,-2,0);       -- Pet: Enmity-2

-- -------------------------------------------------------
-- Muzzling Collar +1
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (10915,27,-3,0);       -- Pet: Enmity-3

-- -------------------------------------------------------
-- Oneiros Cappa
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (10972,161,-3,0);      -- Pet: Physical damage taken -3%

-- -------------------------------------------------------
-- Caller's Doublet +2
-- -------------------------------------------------------
-- INSERT INTO `item_mods_pet` VALUES (11098,???,10,1);   -- Avatar: Increases Blood Pact damage +10%

-- -------------------------------------------------------
-- Caller's Bracers +2
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (11118,25,15,1);       -- Avatar: Accuracy +15

-- -------------------------------------------------------
-- Caller's Spats +2
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (11138,345,500,1);     -- Avatar: TP Bonus +500

-- -------------------------------------------------------
-- Caller's Pigaches +2
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (11158,30,5,1);        -- Avatar: Magic Accuracy +5 (?)

-- -------------------------------------------------------
-- Caller's Doublet +1
-- -------------------------------------------------------
-- INSERT INTO `item_mods_pet` VALUES (11198,???,5,1);    -- Avatar: Increases Blood Pact damage +5%

-- -------------------------------------------------------
-- Caller's Bracers +1
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (11218,25,10,1);       -- Avatar: Accuracy +10 (?)

-- -------------------------------------------------------
-- Caller's Spats +1
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (11238,345,250,1);     -- Avatar: TP Bonus +250

-- -------------------------------------------------------
-- Caller's Pigaches +1
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (11258,30,5,1);        -- Avatar: Magic Accuracy +5 (?)

-- -------------------------------------------------------
-- Cirque Scarpe +1
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (11261,12,10,3);       -- Automaton: INT+10
INSERT INTO `item_mods_pet` VALUES (11261,13,10,3);       -- Automaton: MND+10

-- -------------------------------------------------------
-- Aega's Doublet - LVL 32
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (11338,25,3,0);        -- Pet: accuracy +3
INSERT INTO `item_mods_pet` VALUES (11338,289,3,0);       -- Pet: Subtle Blow +3

-- -------------------------------------------------------
-- Spurrer Beret - LVL 75
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (11497,384,51,0);      -- Pet: Haste+5% (Gear)

-- -------------------------------------------------------
-- Fidelity Mantle - LVL 30
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (11531,73,3,0);        -- Pet: Store TP +3

-- -------------------------------------------------------
-- Ferine Mantle
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (11555,25,10,0);       -- Pet: Accuracy+10

-- -------------------------------------------------------
-- Tiresias' Cape
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (11564,28,1,1);        -- Avatar: Magic Atk. Bonus +1

-- -------------------------------------------------------
-- Eidolon Pendant - LVL 79
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (11612,28,2,1);        -- Avatar: MAB +2

-- -------------------------------------------------------
-- Ferine Necklace
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (11617,288,2,0);       -- Pet: "Double Attack"+2%

-- -------------------------------------------------------
-- Caller's Pendant
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (11619,368,25,1);      -- Avatar: Regain + 25

-- -------------------------------------------------------
-- Ferine Earring
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (11711,25,3,0);        -- Pet: Accuracy+3

-- -------------------------------------------------------
-- Cirque Earring
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (11720,23,2,3);        -- Automaton: Attack+2
INSERT INTO `item_mods_pet` VALUES (11720,24,3,3);        -- Automaton: Ranged Attack+2
INSERT INTO `item_mods_pet` VALUES (11720,28,3,3);        -- Automaton: "Magic Atk. Bonus"+2

-- -------------------------------------------------------
-- Caller's Sash
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (11739,27,2,1);        -- Avatar: Enmity +2
INSERT INTO `item_mods_pet` VALUES (11739,28,2,1);        -- Avatar: Magic Atk. Bonus +2

-- -------------------------------------------------------
-- Evoker's Horn
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (12520,27,-3,1);       -- Avatar: Enmity -3

-- -------------------------------------------------------
-- Evoker's Doublet
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (12650,27,-2,1);       -- Avatar: Enmity -2
-- Avatar will grant the smn +25 elemental resistance to the element type of the Avatar

-- -------------------------------------------------------
-- Drachen Fng. Gnt. - LVL 56
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (13974,25,5,2);        -- Wyvern: Accuracy +5

-- -------------------------------------------------------
-- Evoker's Bracers
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (13975,27,-2,1);       -- Avatar: Enmity -2

-- -------------------------------------------------------
-- Evoker's Pigaches
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (14103,27,-2,1);       -- Avatar: Enmity -2
INSERT INTO `item_mods_pet` VALUES (14103,68,5,1);        -- Avatar: Evasion +5 (?)

-- -------------------------------------------------------
-- Drachen Brais - LVL 52
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (14227,3,10,2);        -- Wyvern: HP+10%

-- -------------------------------------------------------
-- Evoker's Spats
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (14228,25,10,1);       -- Avatar: Accuracy +10
INSERT INTO `item_mods_pet` VALUES (14228,27,-2,1);       -- Avatar: Enmity -2

-- -------------------------------------------------------
-- Wyvern Mail - LVL 50
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (14405,2,65,2);        -- Wyvern: HP+65

-- -------------------------------------------------------
-- Yinyang Robe - LVL 71
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (14468,27,5,1);        -- Avatar: Pet: Enmity +5

-- -------------------------------------------------------
-- Summoner's Doublet + 1 - LVL 75
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (14514,165,4,1);       -- Avatar: Critical Hit Rate +4%

-- -------------------------------------------------------
-- Ostreger Mitts - LVL 74
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (14872,2,10,2);        -- Wyvern: HP +10

-- -------------------------------------------------------
-- Drachen Fng. Gnt. +1 - LVL 74
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (14903,25,5,2);        -- Wyvern: Accuracy +5

-- -------------------------------------------------------
-- Evoker's Bracers +1
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (14904,27,-2,1);       -- Avatar: Enmity -2

-- -------------------------------------------------------
-- Summoner's Bracers + 1 - LVL 75
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (14923,25,14,1);       -- Avatar: Accuracy +14 (?)

-- -------------------------------------------------------
-- Beast Bazubands - LVL 70
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (14958,63,5,0);        -- Pet: Defense Bonus 5%

-- -------------------------------------------------------
-- Summoner's Doublet - LVL 74
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (15101,165,3,1);       -- Avatar: Critical Hit Rate +3%

-- -------------------------------------------------------
-- Summoner's Bracers - LVL 72
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (15116,25,7,1);        -- Avatar: Accuracy +7

-- -------------------------------------------------------
-- Summoner's Spats - LVL 71
-- -------------------------------------------------------
-- INSERT INTO `item_mods_pet` VALUES (15131,???,???,1);  -- Avatar: Shortens magic recast time for spirits

-- -------------------------------------------------------
-- Summoner's Pigaches - LVL 73
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (15146,23,7,1);        -- Avatar: Attack +7

-- -------------------------------------------------------
-- Evoker's Horn +1
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (15239,27,-3,1);       -- Avatar: Enmity -3

-- -------------------------------------------------------
-- Evoker's Pigaches +1
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (15366,27,-4,1);       -- Avatar: Enmity -4
INSERT INTO `item_mods_pet` VALUES (15366,68,5,1);        -- Avatar: Evasion +5 (?)

-- -------------------------------------------------------
-- Falconer's hose - LVL 50
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (15367,2,30,2);        -- Wyvern: HP+30

-- -------------------------------------------------------
-- Drachen Brais +1 - LVL 74
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (15574,3,15,2);        -- Wyvern: HP+15%

-- -------------------------------------------------------
-- Evoker's Spats + 1 - LVL 74
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (15575,25,14,1);       -- Avatar: Accuracy +14 (?)
INSERT INTO `item_mods_pet` VALUES (15575,27,-2,1);       -- Avatar: Enmity -2

-- -------------------------------------------------------
-- Summoner's Spats +1
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (15594,27,2,1);        -- Avatar: Enmity +2
-- INSERT INTO `item_mods_pet` VALUES (15594,???,???,1);  -- Avatar: Shortens magic recast time for spirits

-- -------------------------------------------------------
-- Askar Dirs - LVL 75
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (15647,1,10,0);        -- Pet: DEF +10

-- -------------------------------------------------------
-- Goliard Trews - 75
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (15649,1,10,0);        -- Pet: DEF +10

-- -------------------------------------------------------
-- Homam Gambieras - LVL 75
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (15661,2,50,2);        -- Wyvern: HP+50

-- -------------------------------------------------------
-- Summoner's Pigaches + 1 - LVL 75
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (15679,23,10,1);       -- Avatar: Attack +10 (?)
INSERT INTO `item_mods_pet` VALUES (15679,27,2,1);        -- Avatar: Enmity +2

-- -------------------------------------------------------
-- Selemnus Belt - LVL 70
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (15910,1,5,0);         -- Pet: DEF+5
INSERT INTO `item_mods_pet` VALUES (15910,27,3,0);        -- Pet: Enmity+3

-- -------------------------------------------------------
-- Selemnus Belt - LVL 70
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (15944,163,-7,0);      -- Pet: Magic Damage taken -3%

-- -------------------------------------------------------
-- Pallas's Shield - LVL 72
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (16173,1,10,0);        -- Pet: DEF +10

-- -------------------------------------------------------
-- Chaonix's Gorget - LVL 70
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (16270,2,50,2);        -- Wyvern: HP+50

-- -------------------------------------------------------
-- Shepherd's Chain - LVL 60
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (16297,161,-2,0);      -- Pet: Damage taken -2%

-- -------------------------------------------------------
-- Herder's Subligar - LVL 25
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (16368,25,10,0);       -- Pet: accuracy +10

-- -------------------------------------------------------
-- Glyph Axe
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (16654,368,10,0);      -- Pet: "Regain"+10

-- -------------------------------------------------------
-- Draconis Lance - LVL 90
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (16843,25,10,2);       -- Wyvern: Accuracy+10
INSERT INTO `item_mods_pet` VALUES (16843,23,10,2);       -- Wyvern: Attack+10

-- -------------------------------------------------------
-- 	Wyvern Perch - LVL 73
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (17579,2,50,2);        -- Wyvern: HP+50

-- -------------------------------------------------------
-- Lion Tamer - LVL 74
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (17961,1,10,0);        -- Pet: DEF +10

-- -------------------------------------------------------
-- Ravana's Axe - LVL 99
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (18547,370,3,0);       -- Pet: Adds "Regen" effect

-- -------------------------------------------------------
-- Marotte Claws - LVL 82
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (18778,369,1,3);       -- Automaton: Adds "Refresh" effect
INSERT INTO `item_mods_pet` VALUES (18778,370,1,3);       -- Automaton: Adds "Regen" effect

-- -------------------------------------------------------
-- Burattinaios - LVL 89
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (18780,368,10,3);      -- Automaton: "Regain"+10

-- -------------------------------------------------------
-- Buzbaz Sainti - LVL 99
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (18791,2,30,3);        -- Automaton: HP+30
INSERT INTO `item_mods_pet` VALUES (18791,23,9,3);        -- Automaton: Attack+9
INSERT INTO `item_mods_pet` VALUES (18791,24,9,3);        -- Automaton: Ranged Attack+9

-- -------------------------------------------------------
-- Buzbaz Sainti +1 - LVL 99
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (18792,2,40,3);        -- Automaton: HP+40
INSERT INTO `item_mods_pet` VALUES (18792,23,10,3);       -- Automaton: Attack+10
INSERT INTO `item_mods_pet` VALUES (18792,24,10,3);       -- Automaton: Ranged Attack+10

-- -------------------------------------------------------
-- Aymur *Mythic* - LVL 75 - ignored the Aftermath acc,atk occ.attacks twice
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (18999,23,40,0);       -- Pet: Attack +40

-- -------------------------------------------------------
-- Nirvana *Mythic* - LVL 75 - ignored the Aftermath acc,atk occ.attacks twice
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (19005,28,20,1);       -- Avatar: MAB +20

-- -------------------------------------------------------
-- Esper Stone - LVL 94
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (19772,28,1,1);        -- Avatar: MAB +1

-- -------------------------------------------------------
-- Anahera Tabar (iLvl 119)
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (20822,27,6,0);        -- Pet: Enmity +6
INSERT INTO `item_mods_pet` VALUES (20822,68,40,0);       -- Pet: Evasion +40

-- -------------------------------------------------------
-- Aalak' Axe (iLvl 100)
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (20831,288,2,0);       -- Pet: Double Attack +2%

-- -------------------------------------------------------
-- Aalak' Axe +1 (iLvl 101)
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (20832,288,3,0);       -- Pet: Double Attack +3%

-- -------------------------------------------------------
-- Eminent Pole (iLvl 117)
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (21183,28,108,1);      -- Avatar: Magic Atk. Bonus +108

-- -------------------------------------------------------
-- Esper Stone + 1 - LVL 99
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (21361,28,6,0);        -- Pet: MAB +6

-- -------------------------------------------------------
-- Thur. Ring +1
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (26201,23,23,0);       -- Pet: Attack+23
INSERT INTO `item_mods_pet` VALUES (26201,24,23,0);       -- Pet: Ranged Attack+23
INSERT INTO `item_mods_pet` VALUES (26201,25,22,0);       -- Pet: Accuracy+22
INSERT INTO `item_mods_pet` VALUES (26201,26,22,0);       -- Pet: Ranged Accuract+22
INSERT INTO `item_mods_pet` VALUES (26201,384,40,0);      -- Pet: Haste+4%
INSERT INTO `item_mods_pet` VALUES (26201,160,-4,0);      -- Pet: Damage Taken-4%

-- -------------------------------------------------------
-- Glyphic Horn
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (26652,28,20,1);       -- Avatar: Magic Attack Bonus +20

-- -------------------------------------------------------
-- Glyphic Horn +1
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (26653,28,23,1);       -- Avatar: Magic Attack Bonus +23

-- -------------------------------------------------------
-- Glyphic Doublet
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (26828,165,8,1);       -- Avatar: Critical hit rate +8%

-- -------------------------------------------------------
-- Glyphic Doublet +1
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (26829,165,12,1);      -- Avatar: Critical hit rate +12%

-- -------------------------------------------------------
-- Shomonjijoe +1
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (26888,27,14,1);       -- Avatar: Enmity +14

-- -------------------------------------------------------
-- Glyphic Bracers
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (27004,25,20,1);       -- Avatar: Accuracy +20
INSERT INTO `item_mods_pet` VALUES (27004,384,20,1);      -- Avatar: Haste +2%

-- -------------------------------------------------------
-- Glyphic Bracers +1
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (27005,25,28,1);       -- Avatar: Accuracy +28
INSERT INTO `item_mods_pet` VALUES (27005,384,31,1);      -- Avatar: Haste +3%

-- -------------------------------------------------------
-- Glyphic Spats
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (27180,30,10,1);       -- Avatar: Magic Accuracy +10
-- INSERT INTO `item_mods_pet` VALUES (27180,???,???,1);  -- Avatar: Shortens magic recast time for spirits

-- -------------------------------------------------------
-- Glyphic Spats +1
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (27181,30,13,1);       -- Avatar: Magic Accuracy +13
-- INSERT INTO `item_mods_pet` VALUES (27181,???,???,1);  -- Avatar: Shortens magic recast time for spirits

-- -------------------------------------------------------
-- Glyphic Pigaches
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (27356,23,28,1);       -- Avatar: Attack +25
INSERT INTO `item_mods_pet` VALUES (27356,562,7,1);       -- Avatar: Magic critical hit rate +7%

-- -------------------------------------------------------
-- Glyphic Pigaches +1
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (27357,23,28,1);       -- Avatar: Attack +28
INSERT INTO `item_mods_pet` VALUES (27357,562,9,1);       -- Avatar: Magic critical hit rate +9%

-- -------------------------------------------------------
-- Convoker's Horn
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (27677,27,4,1);        -- Avatar: Enmity +4

-- -------------------------------------------------------
-- Convoker's Horn +1
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (27698,27,4,1);        -- Avatar: Enmity +4

-- -------------------------------------------------------
-- Convoker's Doublet
-- -------------------------------------------------------
-- INSERT INTO `item_mods_pet` VALUES (27821,???,11,1);   -- Avatar: Increases Blood Pact damage +11%

-- -------------------------------------------------------
-- Convoker's Doublet +1
-- -------------------------------------------------------
-- INSERT INTO `item_mods_pet` VALUES (27842,???,12,1);   -- Avatar: Increases Blood Pact damage +12%

-- -------------------------------------------------------
-- Convoker's Bracers
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (27957,27,5,1);        -- Avatar: Enmity +5

-- -------------------------------------------------------
-- Convoker's Bracers +1
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (27978,27,5,1);        -- Avatar: Enmity +5

-- -------------------------------------------------------
-- Convoker's Spats
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (28104,25,20,1);       -- Avatar: Accuracy +20
INSERT INTO `item_mods_pet` VALUES (28104,27,4,1);        -- Avatar: Enmity +4

-- -------------------------------------------------------
-- Idi's Ledelsens - LVL 45
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (28119,65,2,0);        -- Pet: Evasion +2

-- -------------------------------------------------------
-- Convoker's Spats +1
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (28125,25,20,1);       -- Avatar: Accuracy +20
INSERT INTO `item_mods_pet` VALUES (28125,27,4,1);        -- Avatar: Enmity +4

-- -------------------------------------------------------
-- Marduk's Crackows +1
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (28211,23,15,1);       -- Avatar: Attack +15
INSERT INTO `item_mods_pet` VALUES (28211,384,2,1);       -- Avatar: Haste +2%

-- -------------------------------------------------------
-- Ker's Sollerets
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (28213,23,13,2);       -- Wyvern: Attack +13

-- -------------------------------------------------------
-- Sigyn's Jambeaux
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (28214,68,5,0);        -- Pet: Evasion +5

-- -------------------------------------------------------
-- Idi's Ledelsens
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (28219,68,2,0);        -- Pet: Evasion +2

-- -------------------------------------------------------
-- Totemic Gaiters
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (28231,23,10,0);       -- Pet: Attack +10
INSERT INTO `item_mods_pet` VALUES (28231,25,10,0);       -- Pet: Accuracy +10

-- -------------------------------------------------------
-- Convoker's Pigaches
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (28237,27,5,1);        -- Avatar: Enmity +5
INSERT INTO `item_mods_pet` VALUES (28237,68,20,1);       -- Avatar: Evasion +20
-- INSERT INTO `item_mods_pet` VALUES (28237,???,5,1);    -- Avatar: Increases Blood Pact damage +5%

-- -------------------------------------------------------
-- Totemic Gaiters +1
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (28252,23,10,0);       -- Pet: Attack +10
INSERT INTO `item_mods_pet` VALUES (28252,25,10,0);       -- Pet: Accuracy +10

-- -------------------------------------------------------
-- Convoker's Pigaches +1
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (28258,27,5,1);        -- Avatar: Enmity +5
INSERT INTO `item_mods_pet` VALUES (28258,68,20,1);       -- Avatar: Evasion +20
-- INSERT INTO `item_mods_pet` VALUES (28258,???,6,1);    -- Avatar: Increases Blood Pact damage +6%

-- -------------------------------------------------------
-- Foire Babouches +1
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (28261,384,31,3);      -- Automaton: Haste +3%

-- -------------------------------------------------------
-- Eidolon Pendant + 1 - LVL 99
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (28356,28,5,1);        -- Avatar: MAB +5

-- -------------------------------------------------------
-- Samanisi Cape
-- -------------------------------------------------------
INSERT INTO `item_mods_pet` VALUES (28605,25,7,1);        -- Avatar: Accuracy +7
INSERT INTO `item_mods_pet` VALUES (28605,30,7,1);        -- Avatar: Magic Accuracy +7
