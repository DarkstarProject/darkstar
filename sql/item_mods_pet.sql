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
 PRIMARY KEY (`itemId`,`modId`,`petType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=13 PACK_KEYS=1;

-- (Please keep item ID sequential)
INSERT INTO `item_mods_pet` VALUES (10296,25,3,3);      -- Charivari Earring Automaton: Accuracy+3
INSERT INTO `item_mods_pet` VALUES (10296,26,3,3);      -- Automaton: Ranged Accuracy+3
INSERT INTO `item_mods_pet` VALUES (10296,30,3,3);      -- Automaton: Magic Accuracy+3
INSERT INTO `item_mods_pet` VALUES (10299,288,2,0);     -- Sabong Earring Pet: "Double Attack"+2%
INSERT INTO `item_mods_pet` VALUES (10440,384,61,3);    -- Murzim Zucchetto Automaton: Haste+6%
INSERT INTO `item_mods_pet` VALUES (10530,28,5,1);      -- Tethyan Cuffs +1 Avatar: "Magic Atk. Bonus"+5
INSERT INTO `item_mods_pet` VALUES (10531,28,5,1);      -- Tethyan Cuffs +2 Avatar: "Magic Atk. Bonus"+5
INSERT INTO `item_mods_pet` VALUES (10532,28,5,1);      -- Tethyan Cuffs +3 Avatar: "Magic Atk. Bonus"+5
INSERT INTO `item_mods_pet` VALUES (10664,28,4,1);      -- Smn. Horn +2 Avatar: "Magic Atk. Bonus"+4 Perpetuation cost -3
INSERT INTO `item_mods_pet` VALUES (10664,346,3,1);     -- Avatar: Perpetuation cost -3
INSERT INTO `item_mods_pet` VALUES (10684,165,6,1);     -- Smn. Doublet +2 Avatar Critical hit rate +6%
INSERT INTO `item_mods_pet` VALUES (10684,346,3,1);     -- Avatar: Perpetuation cost -3
-- INSERT INTO `item_mods_pet` VALUES (10704,unimplemented,1,1); -- Smn. Bracers +2 Avatar: Enhances accuracy
INSERT INTO `item_mods_pet` VALUES (10724,30,5,1);      -- Smn. Spats +2 Avatar: Enhances magic accuracy
-- INSERT INTO `item_mods_pet` VALUES (10744,unimplemented,1,1); -- Smn. Pigaches +2 Avatar: Enhances attack
INSERT INTO `item_mods_pet` VALUES (10744,562,5,1);     -- Avatar: Magic critical hit rate +5%
INSERT INTO `item_mods_pet` VALUES (10817,384,51,0);    -- Moepapa Stone Pet: Haste+5%
INSERT INTO `item_mods_pet` VALUES (10914,27,-2,0);     -- Muzzling Collar Pet: Enmity-2
INSERT INTO `item_mods_pet` VALUES (10915,27,-3,0);     -- Muzzling Collar +1 Pet: Enmity-3
INSERT INTO `item_mods_pet` VALUES (10972,161,-3,0);    -- Oneiros Cappa Pet: Physical damage taken -3%
-- INSERT INTO `item_mods_pet` VALUES (11098,unimplemented,10,1); -- Call. Doublet +2 Avatar: Increases Blood Pact damage
INSERT INTO `item_mods_pet` VALUES (11118,25,15,1);     -- Call. Bracers +2 Avatar: Accuracy +15
INSERT INTO `item_mods_pet` VALUES (11138,345,500,1);   -- Caller's Spats +2 Avatar: TP Bonus +500 (?)
INSERT INTO `item_mods_pet` VALUES (11158,30,5,1);      -- Caller's Pgch. +2 Avatar: Enhances magic accuracy +5 (?)
-- INSERT INTO `item_mods_pet` VALUES (11198,unimplemented,5,1); -- Caller's Doublet +1 Avatar: Increases Blood Pact damage +5%
INSERT INTO `item_mods_pet` VALUES (11218,25,10,1);     -- Caller's Bracers +1   Avatar: Accuracy +10 (?)
INSERT INTO `item_mods_pet` VALUES (11238,345,250,1);   -- Caller's Spats +1 Avatar: TP Bonus +250
INSERT INTO `item_mods_pet` VALUES (11258,30,5,1);      -- Caller's Pgch. +1 Avatar: Enhances magic accuracy +5 (?)
INSERT INTO `item_mods_pet` VALUES (11261,12,10,3);     -- Cirque Scarpe +1 Automaton: INT+10
INSERT INTO `item_mods_pet` VALUES (11261,13,10,3);     -- Automaton: MND+10
INSERT INTO `item_mods_pet` VALUES (11297,2,20,4);      -- Pup. Tobe +1 Harlequin Automaton: HP+20
INSERT INTO `item_mods_pet` VALUES (11297,5,20,4);      -- Harlequin Automaton: MP+20
INSERT INTO `item_mods_pet` VALUES (11297,2,24,5);      -- Valoredge Automaton: HP+24
INSERT INTO `item_mods_pet` VALUES (11297,2,18,6);      -- Sharpshot Automaton: HP+18
INSERT INTO `item_mods_pet` VALUES (11297,2,16,7);      -- Stormwaker Automaton: HP+16
INSERT INTO `item_mods_pet` VALUES (11297,5,24,7);      -- Stormwaker Automaton: MP+24
INSERT INTO `item_mods_pet` VALUES (11298,25,10,3);     -- Pantin Tobe Automaton: Accuracy +10
INSERT INTO `item_mods_pet` VALUES (11299,25,10,3);     -- Pantin Tobe +1 Automaton: Accuracy +10
INSERT INTO `item_mods_pet` VALUES (11338,25,3,0);      -- Aega's Doublet Pet: accuracy +3
INSERT INTO `item_mods_pet` VALUES (11338,289,3,0);     -- Pet: Subtle Blow +3
INSERT INTO `item_mods_pet` VALUES (11388,28,5,3);      -- Pantin Babouches Automaton: "Magic Atk. Bonus"+5
INSERT INTO `item_mods_pet` VALUES (11389,28,5,3);      -- Ptn. Babouches +1 Automaton: "Magic Atk. Bonus"+5
INSERT INTO `item_mods_pet` VALUES (11470,72,3,3);      -- Puppetry Taj +1 Automaton: HP recovered while healing +3
INSERT INTO `item_mods_pet` VALUES (11470,71,3,3);      -- Automaton: MP recovered while healing +3
INSERT INTO `item_mods_pet` VALUES (11471,370,1,3);     -- Pantin Taj  Automaton: Adds "Regen" effect
INSERT INTO `item_mods_pet` VALUES (11472,370,1,3);     -- Pantin Taj +1 Automaton: Adds "Regen" effect
INSERT INTO `item_mods_pet` VALUES (11497,384,51,0);    -- Spurrer Beret Pet: Haste+5%
INSERT INTO `item_mods_pet` VALUES (11531,73,3,0);      -- Fidelity Mantle Pet: Store TP +3
INSERT INTO `item_mods_pet` VALUES (11536,101,2,3);     -- Wyg. Klt. Mantle Automaton: Melee skill +2
INSERT INTO `item_mods_pet` VALUES (11555,25,10,0);     -- Ferine Mantle Pet: Accuracy+10
INSERT INTO `item_mods_pet` VALUES (11564,28,1,1);      -- Tiresias' Cape Avatar:"Magic Atk. Bonus"+1
INSERT INTO `item_mods_pet` VALUES (11612,28,2,1);      -- Eidolon Pendant Avatar: "Magic Atk. Bonus"+2
INSERT INTO `item_mods_pet` VALUES (11617,288,2,0);     -- Ferine Necklace Pet: "Double Attack"+2%
INSERT INTO `item_mods_pet` VALUES (11619,368,25,1);    -- Caller's Pendant Avatar: Regain + 25
INSERT INTO `item_mods_pet` VALUES (11711,25,3,0);      -- Ferine Earring Pet: Accuracy+3
INSERT INTO `item_mods_pet` VALUES (11720,23,2,3);      -- Cirque Earring Automaton: Attack+2
INSERT INTO `item_mods_pet` VALUES (11720,24,3,3);      -- Automaton: Ranged Attack+2
INSERT INTO `item_mods_pet` VALUES (11720,28,3,3);      -- Automaton: "Magic Atk. Bonus"+2
INSERT INTO `item_mods_pet` VALUES (11739,27,2,1);      -- Caller's Sash Avatar: Enmity +2
INSERT INTO `item_mods_pet` VALUES (11739,28,2,1);      -- Avatar: Magic Atk. Bonus +2
INSERT INTO `item_mods_pet` VALUES (12520,27,-3,1);     -- Evoker's Horn Avatar: Enmity -3
INSERT INTO `item_mods_pet` VALUES (12650,27,-2,1);     -- Evoker's Doublet Avatar: Enmity -2
INSERT INTO `item_mods_pet` VALUES (13974,25,5,2);      -- Drachen Fng. Gnt. Enhances wyvern's accuracy+5 (?)
INSERT INTO `item_mods_pet` VALUES (13975,27,-2,1);     -- Evoker's Bracers Avatar: Enmity -2
INSERT INTO `item_mods_pet` VALUES (14103,27,-2,1);     -- Evoker's Pigaches Avatar: Enmity -2
INSERT INTO `item_mods_pet` VALUES (14103,68,5,1);      -- Avatar: Enhances evasion +5 (?)
INSERT INTO `item_mods_pet` VALUES (14227,3,10,2);      -- Drachen Brais Wyvern: HP+10%
INSERT INTO `item_mods_pet` VALUES (14228,25,10,1);     -- Evoker's Spats Avatar: Enhances accuracy +10 (?)
INSERT INTO `item_mods_pet` VALUES (14228,27,-2,1);     -- Avatar: Enmity -2
INSERT INTO `item_mods_pet` VALUES (14405,2,65,2);      -- Wyvern Mail Wyvern: HP+65
INSERT INTO `item_mods_pet` VALUES (14405,72,65,2);     -- Wyvern: HP recovered while healing +1
INSERT INTO `item_mods_pet` VALUES (14468,27,5,1);      -- Yinyang Robe Avatar: Pet: Enmity +5
INSERT INTO `item_mods_pet` VALUES (14514,165,4,1);     -- Smn. Doublet +1 Avatar: Critical Hit Rate +4%
INSERT INTO `item_mods_pet` VALUES (14523,2,20,4);      -- Pup. Tobe  Harlequin Automaton: HP+20
INSERT INTO `item_mods_pet` VALUES (14523,5,20,4);      -- Harlequin Automaton: MP+20
INSERT INTO `item_mods_pet` VALUES (14523,2,24,5);      -- Valoredge Automaton: HP+24
INSERT INTO `item_mods_pet` VALUES (14523,2,18,6);      -- Sharpshot Automaton: HP+18
INSERT INTO `item_mods_pet` VALUES (14523,2,16,7);      -- Stormwaker Automaton: HP+16
INSERT INTO `item_mods_pet` VALUES (14523,5,24,7);      -- Stormwaker Automaton: MP+24
INSERT INTO `item_mods_pet` VALUES (14872,2,10,2);      -- Ostreger Mitts Wyvern: HP +10
INSERT INTO `item_mods_pet` VALUES (14903,25,5,2);      -- Wyvern: Accuracy +5
INSERT INTO `item_mods_pet` VALUES (14904,27,-2,1);     -- Avatar: Enmity -2
INSERT INTO `item_mods_pet` VALUES (14923,25,14,1);     -- Avatar: Accuracy +14 (?)
INSERT INTO `item_mods_pet` VALUES (14958,63,5,0);      -- Pet: Defense Bonus 5%
INSERT INTO `item_mods_pet` VALUES (15031,384,30,3);    -- Automaton: Haste +3%
INSERT INTO `item_mods_pet` VALUES (15032,384,30,3);    -- Automaton: Haste +3%
INSERT INTO `item_mods_pet` VALUES (15101,165,3,1);     -- Avatar: Critical Hit Rate +3%
INSERT INTO `item_mods_pet` VALUES (15116,25,7,1);      -- Avatar: Accuracy +7
-- INSERT INTO `item_mods_pet` VALUES (15131,unimplemented,1,1); -- Avatar: Shortens magic recast time for spirits
INSERT INTO `item_mods_pet` VALUES (15146,23,7,1);      -- Avatar: Attack +7
INSERT INTO `item_mods_pet` VALUES (15239,27,-3,1);     -- Avatar: Enmity -3
INSERT INTO `item_mods_pet` VALUES (15267,72,3,3);      -- Automaton: HP recovered while healing +3
INSERT INTO `item_mods_pet` VALUES (15267,71,3,3);      -- Automaton: MP recovered while healing +3
INSERT INTO `item_mods_pet` VALUES (15366,27,-4,1);     -- Avatar: Enmity -4
INSERT INTO `item_mods_pet` VALUES (15366,68,5,1);      -- Avatar: Evasion +5 (?)
INSERT INTO `item_mods_pet` VALUES (15367,2,30,2);      -- Wyvern: HP+30
INSERT INTO `item_mods_pet` VALUES (15574,3,15,2);      -- Wyvern: HP+15%
INSERT INTO `item_mods_pet` VALUES (15575,25,14,1);     -- Avatar: Accuracy +14 (?)
INSERT INTO `item_mods_pet` VALUES (15575,27,-2,1);     -- Avatar: Enmity -2
INSERT INTO `item_mods_pet` VALUES (15594,27,2,1);      -- Avatar: Enmity +2
-- INSERT INTO `item_mods_pet` VALUES (15594,unimplemented,1,1); -- Avatar: Shortens magic recast time for spirits
INSERT INTO `item_mods_pet` VALUES (15602,374,5,3);     -- Automaton: Cure Potency +5%
INSERT INTO `item_mods_pet` VALUES (15602,168,10,3);    -- Automaton: Spell interruption rate down 10% (?)
INSERT INTO `item_mods_pet` VALUES (15647,1,10,0);      -- Pet: DEF +10
INSERT INTO `item_mods_pet` VALUES (15649,1,10,0);      -- Pet: DEF +10
INSERT INTO `item_mods_pet` VALUES (15661,2,50,2);      -- Wyvern: HP+50
INSERT INTO `item_mods_pet` VALUES (15679,23,10,1);     -- Avatar: Attack +10 (?)
INSERT INTO `item_mods_pet` VALUES (15679,27,2,1);      -- Avatar: Enmity +2
INSERT INTO `item_mods_pet` VALUES (15910,1,5,0);       -- Pet: DEF+5
INSERT INTO `item_mods_pet` VALUES (15910,27,3,0);      -- Pet: Enmity+3
INSERT INTO `item_mods_pet` VALUES (15944,163,-7,0);    -- Pet: Magic Damage taken -3%
INSERT INTO `item_mods_pet` VALUES (16173,1,10,0);      -- Pet: DEF +10
INSERT INTO `item_mods_pet` VALUES (16245,23,15,3);     -- Automaton: Attack +15
INSERT INTO `item_mods_pet` VALUES (16270,2,50,2);      -- Wyvern: HP+50
INSERT INTO `item_mods_pet` VALUES (16297,161,-2,0);    -- Pet: Damage taken -2%
INSERT INTO `item_mods_pet` VALUES (16351,374,5,3);     -- Automaton: Cure Potency +5%
INSERT INTO `item_mods_pet` VALUES (16351,168,10,3);    -- Automaton: Spell interruption rate down 10% (?)
INSERT INTO `item_mods_pet` VALUES (16352,30,5,3);      -- Automaton: Magic Accuracy +5
INSERT INTO `item_mods_pet` VALUES (16353,30,7,3);      -- Automaton: Magic Accuracy +7
INSERT INTO `item_mods_pet` VALUES (16368,25,10,0);     -- Pet: accuracy +10
INSERT INTO `item_mods_pet` VALUES (16654,368,10,0);    -- Pet: "Regain"+10
INSERT INTO `item_mods_pet` VALUES (16843,25,10,2);     -- Wyvern: Accuracy+10
INSERT INTO `item_mods_pet` VALUES (16843,23,10,2);     -- Wyvern: Attack+10
INSERT INTO `item_mods_pet` VALUES (17579,2,50,2);      -- Wyvern: HP+50
INSERT INTO `item_mods_pet` VALUES (17857,2,50,4);      -- Harlequin Automaton: HP+50
INSERT INTO `item_mods_pet` VALUES (17857,5,50,4);      -- Harlequin Automaton: MP+50
INSERT INTO `item_mods_pet` VALUES (17857,2,60,5);      -- Valoredge Automaton: HP+60
INSERT INTO `item_mods_pet` VALUES (17857,2,45,6);      -- Sharpshot Automaton: HP+45
INSERT INTO `item_mods_pet` VALUES (17857,2,40,7);      -- Stormwaker Automaton: HP+40
INSERT INTO `item_mods_pet` VALUES (17857,5,60,7);      -- Stormwaker Automaton: MP+60
INSERT INTO `item_mods_pet` VALUES (17961,1,10,0);      -- Pet: DEF +10
INSERT INTO `item_mods_pet` VALUES (18547,370,3,0);     -- Pet: Adds "Regen" effect
INSERT INTO `item_mods_pet` VALUES (18745,3,1,3);       -- Automaton: HP +1% (Supposed to be 0.75%)
INSERT INTO `item_mods_pet` VALUES (18746,3,2,3);       -- Automaton: HP +2% (Supposed to be 1.5%)
INSERT INTO `item_mods_pet` VALUES (18778,369,1,3);     -- Automaton: Adds "Refresh" effect
INSERT INTO `item_mods_pet` VALUES (18778,370,1,3);     -- Automaton: Adds "Regen" effect
INSERT INTO `item_mods_pet` VALUES (18780,368,10,3);    -- Automaton: "Regain"+10
INSERT INTO `item_mods_pet` VALUES (18791,2,30,3);      -- Automaton: HP+30
INSERT INTO `item_mods_pet` VALUES (18791,23,9,3);      -- Automaton: Attack+9
INSERT INTO `item_mods_pet` VALUES (18791,24,9,3);      -- Automaton: Ranged Attack+9
INSERT INTO `item_mods_pet` VALUES (18792,2,40,3);      -- Automaton: HP+40
INSERT INTO `item_mods_pet` VALUES (18792,23,10,3);     -- Automaton: Attack+10
INSERT INTO `item_mods_pet` VALUES (18792,24,10,3);     -- Automaton: Ranged Attack+10
INSERT INTO `item_mods_pet` VALUES (18999,23,40,0);     -- Pet: Attack +40
INSERT INTO `item_mods_pet` VALUES (19005,28,20,1);     -- Avatar: MAB +20
INSERT INTO `item_mods_pet` VALUES (19772,28,1,1);      -- Avatar: MAB +1
INSERT INTO `item_mods_pet` VALUES (20822,27,6,0);      -- Pet: Enmity +6
INSERT INTO `item_mods_pet` VALUES (20822,68,40,0);     -- Pet: Evasion +40
INSERT INTO `item_mods_pet` VALUES (20831,288,2,0);     -- Pet: Double Attack +2%
INSERT INTO `item_mods_pet` VALUES (20832,288,3,0);     -- Pet: Double Attack +3%
INSERT INTO `item_mods_pet` VALUES (20944,370,2,2);     -- Wyvern: "Regen"+2
INSERT INTO `item_mods_pet` VALUES (20944,161,3,2);     -- Wyvern: Physical damage taken -3%
INSERT INTO `item_mods_pet` VALUES (21155,30,35,1);     -- Avatar: Magic Accuracy+35 un
INSERT INTO `item_mods_pet` VALUES (21155,28,110,1);    -- Avatar:"Magic Atk. Bonus"+110
-- INSERT INTO `item_mods_pet` VALUES (21155,unimplemented,3,1); -- Avatar:"Blood Pact" damage +3
INSERT INTO `item_mods_pet` VALUES (21167,30,35,1);     -- Avatar: Magic Accuracy+35
INSERT INTO `item_mods_pet` VALUES (21167,28,110,1);    -- Avatar:"Magic Atk. Bonus"+110
-- INSERT INTO `item_mods_pet` VALUES (21167,unimplemented,3,1); -- Avatar:"Blood Pact" damage +3
INSERT INTO `item_mods_pet` VALUES (21167,27,5,1);      -- Avatar: Enmity+5
INSERT INTO `item_mods_pet` VALUES (21183,28,108,1);    -- Avatar: Magic Atk. Bonus +108
INSERT INTO `item_mods_pet` VALUES (21361,28,6,0);      -- Pet: MAB +6
INSERT INTO `item_mods_pet` VALUES (26201,23,23,0);     -- Pet: Attack+23
INSERT INTO `item_mods_pet` VALUES (26201,24,23,0);     -- Pet: Ranged Attack+23
INSERT INTO `item_mods_pet` VALUES (26201,25,22,0);     -- Pet: Accuracy+22
INSERT INTO `item_mods_pet` VALUES (26201,26,22,0);     -- Pet: Ranged Accuract+22
INSERT INTO `item_mods_pet` VALUES (26201,384,40,0);    -- Pet: Haste+4%
INSERT INTO `item_mods_pet` VALUES (26201,160,-4,0);    -- Pet: Damage Taken-4%
INSERT INTO `item_mods_pet` VALUES (26652,28,20,1);     -- Avatar: Magic Attack Bonus +20
INSERT INTO `item_mods_pet` VALUES (26653,28,23,1);     -- Avatar: Magic Attack Bonus +23
INSERT INTO `item_mods_pet` VALUES (26828,165,8,1);     -- Avatar: Critical hit rate +8%
INSERT INTO `item_mods_pet` VALUES (26829,165,12,1);    -- Avatar: Critical hit rate +12%
INSERT INTO `item_mods_pet` VALUES (26888,27,14,1);     -- Avatar: Enmity +14
INSERT INTO `item_mods_pet` VALUES (27004,25,20,1);     -- Avatar: Accuracy +20
INSERT INTO `item_mods_pet` VALUES (27004,384,20,1);    -- Avatar: Haste +2%
INSERT INTO `item_mods_pet` VALUES (27005,25,28,1);     -- Avatar: Accuracy +28
INSERT INTO `item_mods_pet` VALUES (27005,384,31,1);    -- Avatar: Haste +3%
INSERT INTO `item_mods_pet` VALUES (27080,25,20,1);     -- Avatar: ACC +20
INSERT INTO `item_mods_pet` VALUES (27081,25,30,1);     -- Avatar: ACC +30
INSERT INTO `item_mods_pet` VALUES (27180,30,10,1);     -- Avatar: Magic Accuracy +10
-- INSERT INTO `item_mods_pet` VALUES (27180,unimplemented,1,1); -- Avatar: Shortens magic recast time for spirits
INSERT INTO `item_mods_pet` VALUES (27181,30,13,1);     -- Avatar: Magic Accuracy +13
-- INSERT INTO `item_mods_pet` VALUES (27181,unimplemented,1,1); -- Avatar: Shortens magic recast time for spirits
INSERT INTO `item_mods_pet` VALUES (27265,345,550,1);   -- Avatar: TP Bonus +550
INSERT INTO `item_mods_pet` VALUES (27266,345,600,1);   -- Avatar: TP Bonus +600
INSERT INTO `item_mods_pet` VALUES (27356,23,28,1);     -- Avatar: Attack +25
INSERT INTO `item_mods_pet` VALUES (27356,562,7,1);     -- Avatar: Magic critical hit rate +7%
INSERT INTO `item_mods_pet` VALUES (27357,23,28,1);     -- Avatar: Attack +28
INSERT INTO `item_mods_pet` VALUES (27357,562,9,1);     -- Avatar: Magic critical hit rate +9%
INSERT INTO `item_mods_pet` VALUES (27439,30,17,1);     -- Avatar: MACC +17
INSERT INTO `item_mods_pet` VALUES (27440,30,27,1);     -- Avatar: MACC +27
INSERT INTO `item_mods_pet` VALUES (27677,27,4,1);      -- Avatar: Enmity +4
INSERT INTO `item_mods_pet` VALUES (27698,27,4,1);      -- Avatar: Enmity +4
-- INSERT INTO `item_mods_pet` VALUES (27821,unimplemented,11,1); -- Avatar: Increases Blood Pact damage +11%
-- INSERT INTO `item_mods_pet` VALUES (27842,unimplemented,12,1); -- Avatar: Increases Blood Pact damage +12%
INSERT INTO `item_mods_pet` VALUES (27957,27,5,1);      -- Avatar: Enmity +5
INSERT INTO `item_mods_pet` VALUES (27978,27,5,1);      -- Avatar: Enmity +5
INSERT INTO `item_mods_pet` VALUES (28025,25,20,0);     -- Pet: Accuracy+20
INSERT INTO `item_mods_pet` VALUES (28025,26,20,0);     -- Pet: Ranged Accuracy+20
INSERT INTO `item_mods_pet` VALUES (28025,30,20,0);     -- Pet: Magic Accuracy+20
INSERT INTO `item_mods_pet` VALUES (28025,384,61,0);    -- Pet: Haste+6%
INSERT INTO `item_mods_pet` VALUES (28104,25,20,1);     -- Avatar: Accuracy +20
INSERT INTO `item_mods_pet` VALUES (28104,27,4,1);      -- Avatar: Enmity +4
INSERT INTO `item_mods_pet` VALUES (28119,65,2,0);      -- Pet: Evasion +2
INSERT INTO `item_mods_pet` VALUES (28125,25,20,1);     -- Avatar: Accuracy +20
INSERT INTO `item_mods_pet` VALUES (28125,27,4,1);      -- Avatar: Enmity +4
INSERT INTO `item_mods_pet` VALUES (28141,25,20,0);     -- Pet: Accuracy+20
INSERT INTO `item_mods_pet` VALUES (28141,23,10,0);     -- Pet: Attack+10
INSERT INTO `item_mods_pet` VALUES (28141,26,20,0);     -- Pet: Ranged Accuracy+20
INSERT INTO `item_mods_pet` VALUES (28141,24,10,0);     -- Pet: Ranged Attack+10
INSERT INTO `item_mods_pet` VALUES (28141,68,20,0);     -- Pet: Evasion+20
INSERT INTO `item_mods_pet` VALUES (28141,384,30,0);    -- Pet: Haste+3%
INSERT INTO `item_mods_pet` VALUES (28211,23,15,1);     -- Avatar: Attack +15
INSERT INTO `item_mods_pet` VALUES (28211,384,2,1);     -- Avatar: Haste +2%
INSERT INTO `item_mods_pet` VALUES (28213,23,13,2);     -- Wyvern: Attack +13
INSERT INTO `item_mods_pet` VALUES (28214,68,5,0);      -- Pet: Evasion +5
INSERT INTO `item_mods_pet` VALUES (28219,68,2,0);      -- Pet: Evasion +2
INSERT INTO `item_mods_pet` VALUES (28231,23,10,0);     -- Pet: Attack +10
INSERT INTO `item_mods_pet` VALUES (28231,25,10,0);     -- Pet: Accuracy +10
INSERT INTO `item_mods_pet` VALUES (28237,27,5,1);      -- Avatar: Enmity +5
INSERT INTO `item_mods_pet` VALUES (28237,68,20,1);     -- Avatar: Evasion +20
-- INSERT INTO `item_mods_pet` VALUES (28237,unimplemented,5,1); -- Avatar: Increases Blood Pact damage +5%
INSERT INTO `item_mods_pet` VALUES (28252,23,10,0);     -- Pet: Attack +10
INSERT INTO `item_mods_pet` VALUES (28252,25,10,0);     -- Pet: Accuracy +10
INSERT INTO `item_mods_pet` VALUES (28258,27,5,1);      -- Avatar: Enmity +5
INSERT INTO `item_mods_pet` VALUES (28258,68,20,1);     -- Avatar: Evasion +20
-- INSERT INTO `item_mods_pet` VALUES (28258,unimplemented,6,1); -- Avatar: Increases Blood Pact damage +6%
INSERT INTO `item_mods_pet` VALUES (28261,384,31,3);    -- Automaton: Haste +3%
INSERT INTO `item_mods_pet` VALUES (28356,28,5,1);      -- Avatar: MAB +5
INSERT INTO `item_mods_pet` VALUES (28432,25,15,3);     -- Automaton: Accuracy+15
INSERT INTO `item_mods_pet` VALUES (28432,26,15,3);     -- Automaton: Ranged Accuracy+15
INSERT INTO `item_mods_pet` VALUES (28432,30,15,3);     -- Automaton: Magic Accuracy+15
INSERT INTO `item_mods_pet` VALUES (28432,384,51,3);    -- Automaton: Haste+5%
INSERT INTO `item_mods_pet` VALUES (28432,170,5,3);     -- Automaton: "Fast Cast"+5%
INSERT INTO `item_mods_pet` VALUES (28495,384,30,0);    -- Pet: Haste+3%
INSERT INTO `item_mods_pet` VALUES (28495,27,5,0);      -- Pet: Enmity+5
INSERT INTO `item_mods_pet` VALUES (28495,160,1,0);     -- Pet: Damage taken -1%
INSERT INTO `item_mods_pet` VALUES (28605,25,7,1);      -- Avatar: Accuracy +7
INSERT INTO `item_mods_pet` VALUES (28605,30,7,1);      -- Avatar: Magic Accuracy +7
INSERT INTO `item_mods_pet` VALUES (28643,12,8,30;      -- Automaton: INT+8
INSERT INTO `item_mods_pet` VALUES (28643,13,8,3);      -- Automaton: MND+8
INSERT INTO `item_mods_pet` VALUES (28643,30,3,3);      -- Automaton: Magic Accuracy+3
