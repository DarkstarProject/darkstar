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
  `item_name` varchar(24) DEFAULT 'FixMe',
  `itemId` smallint(5) unsigned NOT NULL,
  `modId` smallint(5) unsigned NOT NULL,
  `value` smallint(5) NOT NULL DEFAULT '0',
  `petType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mod_or_comment` varchar(24) DEFAULT 'FixMe',
  PRIMARY KEY (`itemId`,`modId`,`petType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=13 PACK_KEYS=1;

-- (Please keep item ID sequential)
INSERT INTO `item_mods_pet` VALUES ('FixMe',10296,25,3,3,'FixMeToo');      -- Charivari Earring Automaton: Accuracy+3
INSERT INTO `item_mods_pet` VALUES ('FixMe',10296,26,3,3,'FixMeToo');      -- Automaton: Ranged Accuracy+3
INSERT INTO `item_mods_pet` VALUES ('FixMe',10296,30,3,3,'FixMeToo');      -- Automaton: Magic Accuracy+3
INSERT INTO `item_mods_pet` VALUES ('FixMe',10299,288,2,0,'FixMeToo');     -- Sabong Earring Pet: "Double Attack"+2%
INSERT INTO `item_mods_pet` VALUES ('FixMe',10370,28,3,1,'FixMeToo');      -- Shedir crackows Avatar: Enhances "Magic Atk. Bonus" +3
INSERT INTO `item_mods_pet` VALUES ('FixMe',10370,30,3,1,'FixMeToo');      -- Enhances magic accuracy +3
INSERT INTO `item_mods_pet` VALUES ('FixMe',10370,126,3,1,'FixMeToo');     -- Increases "Blood Pact" damage +3%
INSERT INTO `item_mods_pet` VALUES ('FixMe',10440,384,600,3,'FixMeToo');   -- Murzim Zucchetto Automaton: Haste+6%
INSERT INTO `item_mods_pet` VALUES ('FixMe',10530,28,5,1,'FixMeToo');      -- Tethyan Cuffs +1 Avatar: "Magic Atk. Bonus"+5
INSERT INTO `item_mods_pet` VALUES ('FixMe',10531,28,5,1,'FixMeToo');      -- Tethyan Cuffs +2 Avatar: "Magic Atk. Bonus"+5
INSERT INTO `item_mods_pet` VALUES ('FixMe',10532,28,5,1,'FixMeToo');      -- Tethyan Cuffs +3 Avatar: "Magic Atk. Bonus"+5
INSERT INTO `item_mods_pet` VALUES ('FixMe',10537,23,9,1,'FixMeToo');      -- Auspex Gages Enhances avatar attack +9
INSERT INTO `item_mods_pet` VALUES ('FixMe',10537,126,4,1,'FixMeToo');     -- Increases "Blood Pact" damage 4%
INSERT INTO `item_mods_pet` VALUES ('FixMe',10542,23,12,1,'FixMeToo');     -- Spurrina Gages Enhances avatar attack +12
INSERT INTO `item_mods_pet` VALUES ('FixMe',10542,126,5,1,'FixMeToo');     -- Increases "Blood Pact" damage 5%
INSERT INTO `item_mods_pet` VALUES ('FixMe',10664,28,4,1,'FixMeToo');      -- Smn. Horn +2 Avatar: "Magic Atk. Bonus"+4 Perpetuation cost -3
INSERT INTO `item_mods_pet` VALUES ('FixMe',10664,346,3,1,'FixMeToo');     -- Avatar: Perpetuation cost -3
INSERT INTO `item_mods_pet` VALUES ('FixMe',10684,165,6,1,'FixMeToo');     -- Smn. Doublet +2 Avatar Critical hit rate +6%
INSERT INTO `item_mods_pet` VALUES ('FixMe',10684,346,3,1,'FixMeToo');     -- Avatar: Perpetuation cost -3
-- INSERT INTO `item_mods_pet` VALUES ('FixMe',10704,unimplemented,1,1,'FixMeToo'); -- Smn. Bracers +2 Avatar: Enhances accuracy
INSERT INTO `item_mods_pet` VALUES ('FixMe',10724,30,5,1,'FixMeToo');      -- Smn. Spats +2 Avatar: Enhances magic accuracy
-- INSERT INTO `item_mods_pet` VALUES ('FixMe',10744,unimplemented,1,1,'FixMeToo'); -- Smn. Pigaches +2 Avatar: Enhances attack
INSERT INTO `item_mods_pet` VALUES ('FixMe',10744,562,5,1,'FixMeToo');     -- Avatar: Magic critical hit rate +5%
INSERT INTO `item_mods_pet` VALUES ('FixMe',10817,384,500,0,'FixMeToo');    -- Moepapa Stone Pet: Haste+5%
INSERT INTO `item_mods_pet` VALUES ('FixMe',10914,27,-2,0,'FixMeToo');     -- Muzzling Collar Pet: Enmity-2
INSERT INTO `item_mods_pet` VALUES ('FixMe',10915,27,-3,0,'FixMeToo');     -- Muzzling Collar +1 Pet: Enmity-3
INSERT INTO `item_mods_pet` VALUES ('FixMe',10972,161,-3,0,'FixMeToo');    -- Oneiros Cappa Pet: Physical damage taken -3%
INSERT INTO `item_mods_pet` VALUES ('FixMe',11052,126,3,1,'FixMeToo');     -- Esper Earring Avatar: Increases "Blood Pact" damage 3%
INSERT INTO `item_mods_pet` VALUES ('FixMe',11098,126,10,1,'FixMeToo');    -- Call. Doublet +2 Avatar: Increases Blood Pact damage
INSERT INTO `item_mods_pet` VALUES ('FixMe',11118,25,15,1,'FixMeToo');     -- Call. Bracers +2 Avatar: Accuracy +15
INSERT INTO `item_mods_pet` VALUES ('FixMe',11138,345,500,1,'FixMeToo');   -- Caller's Spats +2 Avatar: TP Bonus +500 (?)
INSERT INTO `item_mods_pet` VALUES ('FixMe',11158,30,5,1,'FixMeToo');      -- Caller's Pgch. +2 Avatar: Enhances magic accuracy +5 (?)
INSERT INTO `item_mods_pet` VALUES ('FixMe',11198,126,5,1,'FixMeToo');     -- Caller's Doublet +1 Avatar: Increases Blood Pact damage +5%
INSERT INTO `item_mods_pet` VALUES ('FixMe',11218,25,10,1,'FixMeToo');     -- Caller's Bracers +1   Avatar: Accuracy +10 (?)
INSERT INTO `item_mods_pet` VALUES ('FixMe',11238,345,250,1,'FixMeToo');   -- Caller's Spats +1 Avatar: TP Bonus +250
INSERT INTO `item_mods_pet` VALUES ('FixMe',11258,30,5,1,'FixMeToo');      -- Caller's Pgch. +1 Avatar: Enhances magic accuracy +5 (?)
INSERT INTO `item_mods_pet` VALUES ('FixMe',11261,12,10,3,'FixMeToo');     -- Cirque Scarpe +1 Automaton: INT+10
INSERT INTO `item_mods_pet` VALUES ('FixMe',11261,13,10,3,'FixMeToo');     -- Automaton: MND+10
INSERT INTO `item_mods_pet` VALUES ('FixMe',11297,2,20,4,'FixMeToo');      -- Pup. Tobe +1 Harlequin Automaton: HP+20
INSERT INTO `item_mods_pet` VALUES ('FixMe',11297,5,20,4,'FixMeToo');      -- Harlequin Automaton: MP+20
INSERT INTO `item_mods_pet` VALUES ('FixMe',11297,2,24,5,'FixMeToo');      -- Valoredge Automaton: HP+24
INSERT INTO `item_mods_pet` VALUES ('FixMe',11297,2,18,6,'FixMeToo');      -- Sharpshot Automaton: HP+18
INSERT INTO `item_mods_pet` VALUES ('FixMe',11297,2,16,7,'FixMeToo');      -- Stormwaker Automaton: HP+16
INSERT INTO `item_mods_pet` VALUES ('FixMe',11297,5,24,7,'FixMeToo');      -- Stormwaker Automaton: MP+24
INSERT INTO `item_mods_pet` VALUES ('FixMe',11298,25,10,3,'FixMeToo');     -- Pantin Tobe Automaton: Accuracy +10
INSERT INTO `item_mods_pet` VALUES ('FixMe',11299,25,10,3,'FixMeToo');     -- Pantin Tobe +1 Automaton: Accuracy +10
INSERT INTO `item_mods_pet` VALUES ('FixMe',11338,25,3,0,'FixMeToo');      -- Aega's Doublet Pet: accuracy +3
INSERT INTO `item_mods_pet` VALUES ('FixMe',11338,289,3,0,'FixMeToo');     -- Pet: Subtle Blow +3
INSERT INTO `item_mods_pet` VALUES ('FixMe',11388,28,5,3,'FixMeToo');      -- Pantin Babouches Automaton: "Magic Atk. Bonus"+5
INSERT INTO `item_mods_pet` VALUES ('FixMe',11389,28,5,3,'FixMeToo');      -- Ptn. Babouches +1 Automaton: "Magic Atk. Bonus"+5
INSERT INTO `item_mods_pet` VALUES ('FixMe',11470,72,3,3,'FixMeToo');      -- Puppetry Taj +1 Automaton: HP recovered while healing +3
INSERT INTO `item_mods_pet` VALUES ('FixMe',11470,71,3,3,'FixMeToo');      -- Automaton: MP recovered while healing +3
INSERT INTO `item_mods_pet` VALUES ('FixMe',11471,370,1,3,'FixMeToo');     -- Pantin Taj  Automaton: Adds "Regen" effect
INSERT INTO `item_mods_pet` VALUES ('FixMe',11472,370,1,3,'FixMeToo');     -- Pantin Taj +1 Automaton: Adds "Regen" effect
INSERT INTO `item_mods_pet` VALUES ('FixMe',11497,384,500,0,'FixMeToo');    -- Spurrer Beret Pet: Haste+5%
INSERT INTO `item_mods_pet` VALUES ('FixMe',11531,73,3,0,'FixMeToo');      -- Fidelity Mantle Pet: Store TP +3
INSERT INTO `item_mods_pet` VALUES ('FixMe',11536,101,2,3,'FixMeToo');     -- Wyg. Klt. Mantle Automaton: Melee skill +2
INSERT INTO `item_mods_pet` VALUES ('FixMe',11555,25,10,0,'FixMeToo');     -- Ferine Mantle Pet: Accuracy+10
INSERT INTO `item_mods_pet` VALUES ('FixMe',11564,28,1,1,'FixMeToo');      -- Tiresias' Cape Avatar:"Magic Atk. Bonus"+1
INSERT INTO `item_mods_pet` VALUES ('FixMe',11571,25,12,3,'FixMeToo');     -- Karagoz Mantle Automaton: Accuracy +10
INSERT INTO `item_mods_pet` VALUES ('FixMe',11612,28,2,1,'FixMeToo');      -- Eidolon Pendant Avatar: "Magic Atk. Bonus"+2
INSERT INTO `item_mods_pet` VALUES ('FixMe',11617,288,2,0,'FixMeToo');     -- Ferine Necklace Pet: "Double Attack"+2%
INSERT INTO `item_mods_pet` VALUES ('FixMe',11619,368,25,1,'FixMeToo');    -- Caller's Pendant Avatar: Regain + 25
INSERT INTO `item_mods_pet` VALUES ('FixMe',11711,25,3,0,'FixMeToo');      -- Ferine Earring Pet: Accuracy+3
INSERT INTO `item_mods_pet` VALUES ('FixMe',11720,23,2,3,'FixMeToo');      -- Cirque Earring Automaton: Attack+2
INSERT INTO `item_mods_pet` VALUES ('FixMe',11720,24,3,3,'FixMeToo');      -- Automaton: Ranged Attack+2
INSERT INTO `item_mods_pet` VALUES ('FixMe',11720,28,3,3,'FixMeToo');      -- Automaton: "Magic Atk. Bonus"+2
INSERT INTO `item_mods_pet` VALUES ('FixMe',11739,27,2,1,'FixMeToo');      -- Caller's Sash Avatar: Enmity +2
INSERT INTO `item_mods_pet` VALUES ('FixMe',11739,28,2,1,'FixMeToo');      -- Avatar: Magic Atk. Bonus +2
INSERT INTO `item_mods_pet` VALUES ('FixMe',11987,126,5,1,'FixMeToo');     -- Ngen Seraweels Avatar: Increases "Blood Pact" damage 5%
INSERT INTO `item_mods_pet` VALUES ('FixMe',11987,370,1,1,'FixMeToo');     -- Adds "Regen" effect
INSERT INTO `item_mods_pet` VALUES ('FixMe',12520,27,-3,1,'FixMeToo');     -- Evoker's Horn Avatar: Enmity -3
INSERT INTO `item_mods_pet` VALUES ('FixMe',12649,370,1,2,'FixMeToo');     -- Drachen Mail Adds "Regen" effect to wyvern
INSERT INTO `item_mods_pet` VALUES ('FixMe',12650,27,-2,1,'FixMeToo');     -- Evoker's Doublet Avatar: Enmity -2
INSERT INTO `item_mods_pet` VALUES ('FixMe',13974,25,5,2,'FixMeToo');      -- Drachen Fng. Gnt. Enhances wyvern's accuracy+5 (?)
INSERT INTO `item_mods_pet` VALUES ('FixMe',13975,27,-2,1,'FixMeToo');     -- Evoker's Bracers Avatar: Enmity -2
INSERT INTO `item_mods_pet` VALUES ('FixMe',14103,27,-2,1,'FixMeToo');     -- Evoker's Pigaches Avatar: Enmity -2
INSERT INTO `item_mods_pet` VALUES ('FixMe',14103,68,5,1,'FixMeToo');      -- Avatar: Enhances evasion +5 (?)
INSERT INTO `item_mods_pet` VALUES ('FixMe',14227,3,10,2,'FixMeToo');      -- Drachen Brais Wyvern: HP+10%
INSERT INTO `item_mods_pet` VALUES ('FixMe',14228,25,10,1,'FixMeToo');     -- Evoker's Spats Avatar: Enhances accuracy +10
INSERT INTO `item_mods_pet` VALUES ('FixMe',14228,27,-2,1,'FixMeToo');     -- Avatar: Enmity -2
INSERT INTO `item_mods_pet` VALUES ('FixMe',14405,2,65,2,'FixMeToo');      -- Wyvern Mail Wyvern: HP+65
INSERT INTO `item_mods_pet` VALUES ('FixMe',14405,72,65,2,'FixMeToo');     -- Wyvern: HP recovered while healing +1
INSERT INTO `item_mods_pet` VALUES ('FixMe',14468,27,5,1,'FixMeToo');      -- Yinyang Robe Avatar: Pet: Enmity +5
INSERT INTO `item_mods_pet` VALUES ('FixMe',14486,370,1,2,'FixMeToo');     -- Drachen Mail + 1 Adds "Regen" effect to wyvern
INSERT INTO `item_mods_pet` VALUES ('FixMe',14514,165,4,1,'FixMeToo');     -- Smn. Doublet +1 Avatar: Critical Hit Rate +4%
INSERT INTO `item_mods_pet` VALUES ('FixMe',14523,2,20,4,'FixMeToo');      -- Pup. Tobe  Harlequin Automaton: HP+20
INSERT INTO `item_mods_pet` VALUES ('FixMe',14523,5,20,4,'FixMeToo');      -- Harlequin Automaton: MP+20
INSERT INTO `item_mods_pet` VALUES ('FixMe',14523,2,24,5,'FixMeToo');      -- Valoredge Automaton: HP+24
INSERT INTO `item_mods_pet` VALUES ('FixMe',14523,2,18,6,'FixMeToo');      -- Sharpshot Automaton: HP+18
INSERT INTO `item_mods_pet` VALUES ('FixMe',14523,2,16,7,'FixMeToo');      -- Stormwaker Automaton: HP+16
INSERT INTO `item_mods_pet` VALUES ('FixMe',14523,5,24,7,'FixMeToo');      -- Stormwaker Automaton: MP+24
INSERT INTO `item_mods_pet` VALUES ('FixMe',14872,2,10,2,'FixMeToo');      -- Ostreger Mitts Wyvern: HP +10
INSERT INTO `item_mods_pet` VALUES ('FixMe',14903,25,5,2,'FixMeToo');      -- Drn. Fng. Gnt. +1 Wyvern: Increases Accuracy +5 (?)
INSERT INTO `item_mods_pet` VALUES ('FixMe',14904,27,-2,1,'FixMeToo');     -- Evk. Bracers +1 Avatar: Enmity -2
INSERT INTO `item_mods_pet` VALUES ('FixMe',14923,25,14,1,'FixMeToo');     -- Smn. Bracers +1 Avatar: Enhances accuracy +14 (?)
INSERT INTO `item_mods_pet` VALUES ('FixMe',14958,63,5,0,'FixMeToo');      -- Beast Bazubands Pet: Defense Bonus 5% (?)
INSERT INTO `item_mods_pet` VALUES ('FixMe',15031,384,300,3,'FixMeToo');    -- Pantin Dastanas Automaton: Haste +3%
INSERT INTO `item_mods_pet` VALUES ('FixMe',15032,384,300,3,'FixMeToo');    -- Pantin Dastanas +1 Automaton: Haste +3%
INSERT INTO `item_mods_pet` VALUES ('FixMe',15101,165,3,1,'FixMeToo');     -- Summoner's Dblt. Avatar: Critical Hit Rate +3%
INSERT INTO `item_mods_pet` VALUES ('FixMe',15116,25,7,1,'FixMeToo');      -- Summoner's Brcr. Avatar: Enhances accuracy +7
-- INSERT INTO `item_mods_pet` VALUES ('FixMe',15131,unimplemented,1,1,'FixMeToo'); -- Summoner's Spats Avatar: Shortens magic recast time for spirits
INSERT INTO `item_mods_pet` VALUES ('FixMe',15146,23,7,1,'FixMeToo');      -- Summoner's Pgch. Avatar: Enhances attack +7
INSERT INTO `item_mods_pet` VALUES ('FixMe',15146,357,-2,1,'FixMeToo');    -- "Blood Pact" ability delay -2
INSERT INTO `item_mods_pet` VALUES ('FixMe',15239,27,-3,1,'FixMeToo');     -- Evk. Horn +1 Avatar: Enmity -3
INSERT INTO `item_mods_pet` VALUES ('FixMe',15267,72,3,3,'FixMeToo');      -- Pup. Taj Automaton: HP recovered while healing +3
INSERT INTO `item_mods_pet` VALUES ('FixMe',15267,71,3,3,'FixMeToo');      -- Automaton: MP recovered while healing +3
INSERT INTO `item_mods_pet` VALUES ('FixMe',15366,27,-4,1,'FixMeToo');     -- Evk. Pigaches +1 Avatar: Enmity -4
INSERT INTO `item_mods_pet` VALUES ('FixMe',15366,68,5,1,'FixMeToo');      -- Avatar: Enhances evasion +5 (?)
INSERT INTO `item_mods_pet` VALUES ('FixMe',15367,2,30,2,'FixMeToo');      -- Falconer's Hose Wyvern: HP+30
INSERT INTO `item_mods_pet` VALUES ('FixMe',15574,3,15,2,'FixMeToo');      -- Drn. Brais +1Wyvern: HP+15%
INSERT INTO `item_mods_pet` VALUES ('FixMe',15575,25,14,1,'FixMeToo');     -- Evk. Spats +1 Avatar: Enhances accuracy +14 (?)
INSERT INTO `item_mods_pet` VALUES ('FixMe',15575,27,-2,1,'FixMeToo');     -- Avatar: Enmity -2
INSERT INTO `item_mods_pet` VALUES ('FixMe',15594,27,2,1,'FixMeToo');      -- Smn. Spats +1 Avatar: Enmity +2
INSERT INTO `item_mods_pet` VALUES ('FixMe',15602,374,5,3,'FixMeToo');     -- Pup. Churidars Automaton: Enhances "Cure" potency +5% (?)
INSERT INTO `item_mods_pet` VALUES ('FixMe',15602,168,10,3,'FixMeToo');    -- Automaton: Spell interruption rate down 10% (?)
INSERT INTO `item_mods_pet` VALUES ('FixMe',15647,1,10,0,'FixMeToo');      -- Askar Dirs Pet: DEF +10
INSERT INTO `item_mods_pet` VALUES ('FixMe',15649,1,10,0,'FixMeToo');      -- Goliard Trews Pet: DEF +10
INSERT INTO `item_mods_pet` VALUES ('FixMe',15661,2,50,2,'FixMeToo');      -- Homam Gambieras Wyvern: HP+50
INSERT INTO `item_mods_pet` VALUES ('FixMe',15679,23,10,1,'FixMeToo');     -- Smn. Pigaches +1 Avatar: Enhances attack +10 (?)
INSERT INTO `item_mods_pet` VALUES ('FixMe',15679,27,2,1,'FixMeToo');      -- Avatar: Enmity +2
INSERT INTO `item_mods_pet` VALUES ('FixMe',15679,357,-2,1,'FixMeToo');    -- "Blood Pact" ability delay -2
INSERT INTO `item_mods_pet` VALUES ('FixMe',15910,1,5,0,'FixMeToo');       -- Primal Belt Pet: DEF+5
INSERT INTO `item_mods_pet` VALUES ('FixMe',15910,27,3,0,'FixMeToo');      -- Pet: Enmity+3
INSERT INTO `item_mods_pet` VALUES ('FixMe',15944,163,-7,0,'FixMeToo');    -- Selemnus Belt Pet: Magic Damage taken -3%
INSERT INTO `item_mods_pet` VALUES ('FixMe',16173,1,10,0,'FixMeToo');      -- Pallas's Shield Pet: DEF +10
INSERT INTO `item_mods_pet` VALUES ('FixMe',16245,23,15,3,'FixMeToo');     -- Pantin Cape Automaton: Attack +15
INSERT INTO `item_mods_pet` VALUES ('FixMe',16270,2,50,2,'FixMeToo');      -- Chanoix's Gorget Wyvern: HP+50
INSERT INTO `item_mods_pet` VALUES ('FixMe',16297,161,-2,0,'FixMeToo');    -- Shepherd's Chain Pet: Damage taken -2%
INSERT INTO `item_mods_pet` VALUES ('FixMe',16351,374,5,3,'FixMeToo');     -- Pup. Churidars +1 Automaton: Enhances "Cure" potency +5% (?)
INSERT INTO `item_mods_pet` VALUES ('FixMe',16351,168,10,3,'FixMeToo');    -- Automaton: Spell interruption rate down 10% (?)
INSERT INTO `item_mods_pet` VALUES ('FixMe',16352,30,5,3,'FixMeToo');      -- Pantin Churidars Automaton: Magic Accuracy +5
INSERT INTO `item_mods_pet` VALUES ('FixMe',16353,30,7,3,'FixMeToo');      -- Ptn. Churidars +1 Automaton: Magic Accuracy +7
INSERT INTO `item_mods_pet` VALUES ('FixMe',16368,25,10,0,'FixMeToo');     -- Herder's Subligar Enhances pet accuracy +10 (?)
INSERT INTO `item_mods_pet` VALUES ('FixMe',16654,368,10,0,'FixMeToo');    -- Glyph Axe Pet: "Regain"+10
INSERT INTO `item_mods_pet` VALUES ('FixMe',16843,25,10,2,'FixMeToo');     -- Draconis Lance Wyvern: Accuracy+10
INSERT INTO `item_mods_pet` VALUES ('FixMe',16843,23,10,2,'FixMeToo');     -- Wyvern: Attack+10
INSERT INTO `item_mods_pet` VALUES ('FixMe',17579,2,50,2,'FixMeToo');      -- Wyvern Perch Wyvern: HP+50
INSERT INTO `item_mods_pet` VALUES ('FixMe',17857,2,50,4,'FixMeToo');      -- Animator +1 Harlequin Automaton: HP+50 (Allows orders to be more directly relayed to the automaton.)
INSERT INTO `item_mods_pet` VALUES ('FixMe',17857,5,50,4,'FixMeToo');      -- Harlequin Automaton: MP+50
INSERT INTO `item_mods_pet` VALUES ('FixMe',17857,2,60,5,'FixMeToo');      -- Valoredge Automaton: HP+60
INSERT INTO `item_mods_pet` VALUES ('FixMe',17857,2,45,6,'FixMeToo');      -- Sharpshot Automaton: HP+45
INSERT INTO `item_mods_pet` VALUES ('FixMe',17857,2,40,7,'FixMeToo');      -- Stormwaker Automaton: HP+40
INSERT INTO `item_mods_pet` VALUES ('FixMe',17857,5,60,7,'FixMeToo');      -- Stormwaker Automaton: MP+60
INSERT INTO `item_mods_pet` VALUES ('FixMe',17961,1,10,0,'FixMeToo');      -- Lion Tamer Pet: DEF +10
INSERT INTO `item_mods_pet` VALUES ('FixMe',18547,370,3,0,'FixMeToo');     -- Ravana's Axe Pet: Adds "Regen" effect
INSERT INTO `item_mods_pet` VALUES ('FixMe',18745,3,1,3,'FixMeToo');       -- Adaman Sainti Automaton: HP +1% (Supposed to be 0.75%)
INSERT INTO `item_mods_pet` VALUES ('FixMe',18746,3,2,3,'FixMeToo');       -- Gem Sainti Automaton: HP +2% (Supposed to be 1.5%)
INSERT INTO `item_mods_pet` VALUES ('FixMe',18778,369,1,3,'FixMeToo');     -- Marotte Claws Automaton: Adds "Refresh" effect
INSERT INTO `item_mods_pet` VALUES ('FixMe',18778,370,1,3,'FixMeToo');     -- Automaton: Adds "Regen" effect
INSERT INTO `item_mods_pet` VALUES ('FixMe',18780,368,10,3,'FixMeToo');    -- Burattinaios Automaton: "Regain"+10
INSERT INTO `item_mods_pet` VALUES ('FixMe',18791,2,30,3,'FixMeToo');      -- Buzbaz Sainti Automaton: HP+30
INSERT INTO `item_mods_pet` VALUES ('FixMe',18791,23,9,3,'FixMeToo');      -- Automaton: Attack+9
INSERT INTO `item_mods_pet` VALUES ('FixMe',18791,24,9,3,'FixMeToo');      -- Automaton: Ranged Attack+9
INSERT INTO `item_mods_pet` VALUES ('FixMe',18792,2,40,3,'FixMeToo');      -- Buzbaz Sainti +1 Automaton: HP+40
INSERT INTO `item_mods_pet` VALUES ('FixMe',18792,23,10,3,'FixMeToo');     -- Automaton: Attack+10
INSERT INTO `item_mods_pet` VALUES ('FixMe',18792,24,10,3,'FixMeToo');     -- Automaton: Ranged Attack+10
INSERT INTO `item_mods_pet` VALUES ('FixMe',18999,23,40,0,'FixMeToo');     -- Aymur 75 Pet: Attack+40
INSERT INTO `item_mods_pet` VALUES ('FixMe',19005,28,20,1,'FixMeToo');     -- Nirvana 75 Avatar: "Magic Atk. Bonus"+20
INSERT INTO `item_mods_pet` VALUES ('FixMe',19068,23,50,0,'FixMeToo');     -- Aymur 80 Pet: Attack+50
INSERT INTO `item_mods_pet` VALUES ('FixMe',19074,28,25,1,'FixMeToo');     -- Nirvana 80 Avatar: "Magic Atk. Bonus"+25
INSERT INTO `item_mods_pet` VALUES ('FixMe',19088,23,60,0,'FixMeToo');     -- Aymur 85 Pet: Attack+60
INSERT INTO `item_mods_pet` VALUES ('FixMe',19094,28,30,1,'FixMeToo');     -- Nirvana 85 Avatar: "Magic Atk. Bonus"+30
INSERT INTO `item_mods_pet` VALUES ('FixMe',19620,23,70,0,'FixMeToo');     -- Aymur 90 Pet: Attack+70
INSERT INTO `item_mods_pet` VALUES ('FixMe',19626,28,35,1,'FixMeToo');     -- Nirvana 90 Avatar: "Magic Atk. Bonus"+35
INSERT INTO `item_mods_pet` VALUES ('FixMe',19718,23,70,0,'FixMeToo');     -- Aymur 95 Pet: Attack+70
INSERT INTO `item_mods_pet` VALUES ('FixMe',19724,28,35,1,'FixMeToo');     -- Nirvana 95 Avatar: "Magic Atk. Bonus"+35
INSERT INTO `item_mods_pet` VALUES ('FixMe',19772,28,1,1,'FixMeToo');      -- Esper Stone Avatar: "Magic Atk. Bonus"+1
INSERT INTO `item_mods_pet` VALUES ('FixMe',19827,23,80,0,'FixMeToo');     -- Aymur 99 Pet: Attack+80
INSERT INTO `item_mods_pet` VALUES ('FixMe',19833,28,40,1,'FixMeToo');     -- Nirvana 99 Avatar: "Magic Atk. Bonus"+40
INSERT INTO `item_mods_pet` VALUES ('FixMe',19956,23,80,0,'FixMeToo');     -- Aymur 99 AG Pet: Attack+80
INSERT INTO `item_mods_pet` VALUES ('FixMe',19962,28,40,1,'FixMeToo');     -- Nirvana 99 AG Avatar: "Magic Atk. Bonus"+40
INSERT INTO `item_mods_pet` VALUES ('FixMe',20792,23,80,0,'FixMeToo');     -- Aymur 119 Pet: Attack+80
INSERT INTO `item_mods_pet` VALUES ('FixMe',20793,23,80,0,'FixMeToo');     -- Aymur 119 AG Pet: Attack+80
INSERT INTO `item_mods_pet` VALUES ('FixMe',20822,27,6,0,'FixMeToo');      -- Anahera Tabar Pet: Enmity +6
INSERT INTO `item_mods_pet` VALUES ('FixMe',20822,68,40,0,'FixMeToo');     -- Pet: Evasion +40
INSERT INTO `item_mods_pet` VALUES ('FixMe',20831,288,2,0,'FixMeToo');     -- Aalak' Axe Pet: Double Attack +2%
INSERT INTO `item_mods_pet` VALUES ('FixMe',20832,288,3,0,'FixMeToo');     -- Aalak' Axe +1 Pet: Double Attack +3%
INSERT INTO `item_mods_pet` VALUES ('FixMe',20944,370,2,2,'FixMeToo');     -- Pelagos Lance Wyvern: "Regen"+2
INSERT INTO `item_mods_pet` VALUES ('FixMe',20944,161,3,2,'FixMeToo');     -- Wyvern: Physical damage taken -3%
INSERT INTO `item_mods_pet` VALUES ('FixMe',21141,126,40,1,'FixMeToo');    -- Nirvana 119 Avatar: Increases "Blood Pact: Rage" damage
INSERT INTO `item_mods_pet` VALUES ('FixMe',21142,126,40,1,'FixMeToo');    -- Nirvana 119 AG Avatar: Increases "Blood Pact: Rage" damage
INSERT INTO `item_mods_pet` VALUES ('FixMe',21155,30,35,1,'FixMeToo');     -- Marquetry Staff Avatar: Magic Accuracy+35 un
INSERT INTO `item_mods_pet` VALUES ('FixMe',21155,28,110,1,'FixMeToo');    -- Avatar: "Magic Atk. Bonus"+110
INSERT INTO `item_mods_pet` VALUES ('FixMe',21155,126,3,1,'FixMeToo');     -- Avatar: "Blood Pact" damage +3
INSERT INTO `item_mods_pet` VALUES ('FixMe',21167,30,20,1,'FixMeToo');     -- Frazil Staff Avatar: Magic Accuracy+20
INSERT INTO `item_mods_pet` VALUES ('FixMe',21167,28,120,1,'FixMeToo');    -- Avatar: "Magic Atk. Bonus"+120
INSERT INTO `item_mods_pet` VALUES ('FixMe',21167,27,10,1,'FixMeToo');     -- Avatar: Enmity+10
INSERT INTO `item_mods_pet` VALUES ('FixMe',21183,28,108,1,'FixMeToo');    -- Eminent Pole Avatar: "Magic Atk. Bonus"+108
INSERT INTO `item_mods_pet` VALUES ('FixMe',21361,28,6,0,'FixMeToo');      -- Esper Stone +1 Pet: "Magic Atk. Bonus"+6
INSERT INTO `item_mods_pet` VALUES ('FixMe',21526,25,50,3,'FixMeToo');     -- Xiucoatl: Automaton: Accuracy+50
INSERT INTO `item_mods_pet` VALUES ('FixMe',21526,26,50,3,'FixMeToo');     -- Xiucoatl: Automaton: Ranged Accuracy+50
INSERT INTO `item_mods_pet` VALUES ('FixMe',21526,30,50,3,'FixMeToo');     -- Xiucoatl: Automaton: Magic Accuracy+50
INSERT INTO `item_mods_pet` VALUES ('FixMe',21715,25,30,0,'FixMeToo');     -- Monster Axe: Pet: Accuracy+30
INSERT INTO `item_mods_pet` VALUES ('FixMe',21715,26,30,0,'FixMeToo');     -- Monster Axe: Pet: Ranged Accuracy+30
INSERT INTO `item_mods_pet` VALUES ('FixMe',21715,30,30,0,'FixMeToo');     -- Monster Axe: Pet: Magic Accuracy+30
INSERT INTO `item_mods_pet` VALUES ('FixMe',21716,25,40,0,'FixMeToo');     -- Ankusa Axe: Pet: Accuracy+40
INSERT INTO `item_mods_pet` VALUES ('FixMe',21716,26,40,0,'FixMeToo');     -- Ankusa Axe: Pet: Ranged Accuracy+40
INSERT INTO `item_mods_pet` VALUES ('FixMe',21716,30,40,0,'FixMeToo');     -- Ankusa Axe: Pet: Magic Accuracy+40
INSERT INTO `item_mods_pet` VALUES ('FixMe',21717,25,50,0,'FixMeToo');     -- Pangu: Pet: Accuracy+50
INSERT INTO `item_mods_pet` VALUES ('FixMe',21717,26,50,0,'FixMeToo');     -- Pangu: Pet: Ranged Accuracy+50
INSERT INTO `item_mods_pet` VALUES ('FixMe',21717,30,50,0,'FixMeToo');     -- Pangu: Pet: Magic Accuracy+50
INSERT INTO `item_mods_pet` VALUES ('FixMe',21751,23,80,0,'FixMeToo');     -- Aymur 119 III Pet: Attack Bonus V
INSERT INTO `item_mods_pet` VALUES ('FixMe',21865,370,5,2,'FixMeToo');     -- Arasy Lance: Wyvern: "Regen"+5
INSERT INTO `item_mods_pet` VALUES ('FixMe',21866,370,8,2,'FixMeToo');     -- Arasy Lance +1: Wyvern: "Regen"+8
INSERT INTO `item_mods_pet` VALUES ('FixMe',22015,30,10,1,'FixMeToo');     -- Arasy Rod: Avatar: Magic Accuracy+10
INSERT INTO `item_mods_pet` VALUES ('FixMe',22016,30,15,1,'FixMeToo');     -- Arasy Rod +1: Avatar: Magic Accuracy+15
INSERT INTO `item_mods_pet` VALUES ('FixMe',22054,28,115,1,'FixMeToo');    -- Grioavolr: Avatar: "Magic Atk. Bonus"+115
INSERT INTO `item_mods_pet` VALUES ('FixMe',22054,30,35,1,'FixMeToo');     -- Grioavolr: Avatar: Magic Accuracy+35
INSERT INTO `item_mods_pet` VALUES ('FixMe',22063,126,40,1,'FixMeToo');    -- Nirvana 119 III Avatar: "Blood Pact" damage +40
INSERT INTO `item_mods_pet` VALUES ('FixMe',22074,126,3,1,'FixMeToo');     -- Arasy Staff: Avatar: "Blood Pact" damage +3
INSERT INTO `item_mods_pet` VALUES ('FixMe',22075,126,5,1,'FixMeToo');     -- Arasy Staff +1: Avatar: "Blood Pact" damage +5
INSERT INTO `item_mods_pet` VALUES ('FixMe',22096,25,50,1,'FixMeToo');     -- Draumstafir: Avatar: Accuracy+50
INSERT INTO `item_mods_pet` VALUES ('FixMe',22096,26,50,1,'FixMeToo');     -- Draumstafir: Avatar: Ranged Accuracy+50
INSERT INTO `item_mods_pet` VALUES ('FixMe',22096,30,50,1,'FixMeToo');     -- Draumstafir: Avatar: Magic Accuracy+50
INSERT INTO `item_mods_pet` VALUES ('FixMe',22210,126,3,1,'FixMeToo');     -- Elan Strap: Avatar: "Blood Pact" damage +3
INSERT INTO `item_mods_pet` VALUES ('FixMe',22211,126,5,1,'FixMeToo');     -- Elan Strap +1: Avatar: "Blood Pact" damage +5
INSERT INTO `item_mods_pet` VALUES ('FixMe',23057,25,31,3,'FixMeToo');     -- Foire Taj +2 Automaton: Accuracy +31
INSERT INTO `item_mods_pet` VALUES ('FixMe',23057,369,1,3,'FixMeToo');     -- Automaton: Refresh +1
INSERT INTO `item_mods_pet` VALUES ('FixMe',23057,370,3,3,'FixMeToo');     -- Automaton: Regen +3
INSERT INTO `item_mods_pet` VALUES ('FixMe',23057,384,600,3,'FixMeToo');   -- Automaton: Haste +6%
INSERT INTO `item_mods_pet` VALUES ('FixMe',23120,370,10,2,'FixMeToo');    -- Vishap Mail +2 Wyvern: "Regen"+10
INSERT INTO `item_mods_pet` VALUES ('FixMe',23121,25,35,1,'FixMeToo');     -- Convoker's Doublet +2 Avatar: Accuracy+35
INSERT INTO `item_mods_pet` VALUES ('FixMe',23121,30,35,1,'FixMeToo');     -- Magic Accuracy+35
INSERT INTO `item_mods_pet` VALUES ('FixMe',23121,126,14,1,'FixMeToo');    -- "Blood Pact" damage +14
INSERT INTO `item_mods_pet` VALUES ('FixMe',23124,2,165,3,'FixMeToo');     -- Foire Tobe Automaton: HP +165
INSERT INTO `item_mods_pet` VALUES ('FixMe',23124,5,165,3,'FixMeToo');     -- Automaton: MP +165
INSERT INTO `item_mods_pet` VALUES ('FixMe',23124,384,400,3,'FixMeToo');   -- Automaton: Haste +4%
INSERT INTO `item_mods_pet` VALUES ('FixMe',23191,25,32,3,'FixMeToo');     -- Foire Dastanas +2 Automaton: Accuracy +32
INSERT INTO `item_mods_pet` VALUES ('FixMe',23191,384,500,3,'FixMeToo');   -- Automaton: Haste +5%
INSERT INTO `item_mods_pet` VALUES ('FixMe',23325,28,20,3,'FixMeToo');     -- Foire Babouches +2 Automaton: Magic Attack Bonus +20
INSERT INTO `item_mods_pet` VALUES ('FixMe',23325,30,40,3,'FixMeToo');     -- Automaton: Magic Accuracy +40
INSERT INTO `item_mods_pet` VALUES ('FixMe',23325,384,400,3,'FixMeToo');   -- Automaton: Haste +4%
INSERT INTO `item_mods_pet` VALUES ('FixMe',23392,25,41,3,'FixMeToo');     -- Foire Taj +3 Automaton: Accuracy +41
INSERT INTO `item_mods_pet` VALUES ('FixMe',23392,369,2,3,'FixMeToo');     -- Automaton: Refresh +2
INSERT INTO `item_mods_pet` VALUES ('FixMe',23392,370,6,3,'FixMeToo');     -- Automaton: Regen +6
INSERT INTO `item_mods_pet` VALUES ('FixMe',23392,384,700,3,'FixMeToo');   -- Automaton: Haste +7%
INSERT INTO `item_mods_pet` VALUES ('FixMe',23455,370,15,2,'FixMeToo');    -- Vishap Mail +3 Wyvern: "Regen"+15
INSERT INTO `item_mods_pet` VALUES ('FixMe',23254,3,25,2,'FixMeToo');      -- Vishap Brais +2 Wyvern: HP+25%
INSERT INTO `item_mods_pet` VALUES ('FixMe',23258,5,75,3,'FixMeToo');      -- Foire Churidars +2 Automaton: MP+75
INSERT INTO `item_mods_pet` VALUES ('FixMe',23258,160,-3,3,'FixMeToo');    -- Automaton: Damage taken -3%
INSERT INTO `item_mods_pet` VALUES ('FixMe',23258,374,14,3,'FixMeToo');    -- Automaton: "Cure" Potency +14%
INSERT INTO `item_mods_pet` VALUES ('FixMe',23258,384,400,3,'FixMeToo');   -- Automaton: Haste +4%
INSERT INTO `item_mods_pet` VALUES ('FixMe',23456,25,45,1,'FixMeToo');     -- Convoker's Doublet +3 Avatar: Acc.+45
INSERT INTO `item_mods_pet` VALUES ('FixMe',23456,30,45,1,'FixMeToo');     -- Magic Acc.+45
INSERT INTO `item_mods_pet` VALUES ('FixMe',23456,126,16,1,'FixMeToo');    -- "Blood Pact" damage +16
INSERT INTO `item_mods_pet` VALUES ('FixMe',23459,2,220,3,'FixMeToo');     -- Foire Tobe +3 Automaton: HP +220
INSERT INTO `item_mods_pet` VALUES ('FixMe',23459,5,220,3,'FixMeToo');     -- Automaton: MP +220
INSERT INTO `item_mods_pet` VALUES ('FixMe',23459,384,500,3,'FixMeToo');   -- Automaton: Haste +5%
INSERT INTO `item_mods_pet` VALUES ('FixMe',23526,25,42,3,'FixMeToo');     -- Foire Dastanas +3 Automaton: Accuracy +42
INSERT INTO `item_mods_pet` VALUES ('FixMe',23526,384,500,3,'FixMeToo');   -- Automaton: Haste +5%
INSERT INTO `item_mods_pet` VALUES ('FixMe',23589,3,27,2,'FixMeToo');      -- Vishap Brais Wyvern: HP+27%
INSERT INTO `item_mods_pet` VALUES ('FixMe',23593,5,75,3,'FixMeToo');      -- Foire Churidars +3 Automaton: MP+75
INSERT INTO `item_mods_pet` VALUES ('FixMe',23593,160,-6,3,'FixMeToo');    -- Automaton: Damage taken -6%
INSERT INTO `item_mods_pet` VALUES ('FixMe',23593,374,14,3,'FixMeToo');    -- Automaton: "Cure" Potency +14%
INSERT INTO `item_mods_pet` VALUES ('FixMe',23593,384,600,3,'FixMeToo');   -- Automaton: Haste +6%
INSERT INTO `item_mods_pet` VALUES ('FixMe',23660,28,25,3,'FixMeToo');     -- Foire Babouches +3 Automaton: Magic Attack Bonus +25
INSERT INTO `item_mods_pet` VALUES ('FixMe',23660,30,50,3,'FixMeToo');     -- Automaton: Magic Accuracy +50
INSERT INTO `item_mods_pet` VALUES ('FixMe',23660,384,500,3,'FixMeToo');   -- Automaton: Haste +5%
INSERT INTO `item_mods_pet` VALUES ('FixMe',23674,68,38,0,'FixMeToo');     -- Ankusa Gaiters +3: Pet: Evasion+38
INSERT INTO `item_mods_pet` VALUES ('FixMe',23674,161,-5,0,'FixMeToo');    -- Ankusa Gaiters +3: Pet: Physical damage taken -5%
INSERT INTO `item_mods_pet` VALUES ('FixMe',23679,2,290,2,'FixMeToo');     -- Pteroslaver Greaves +3: Wyvern: HP+290
INSERT INTO `item_mods_pet` VALUES ('FixMe',23679,370,10,2,'FixMeToo');    -- Pteroslaver Greaves +3: Wyvern: "Regen"+10
INSERT INTO `item_mods_pet` VALUES ('FixMe',23680,23,89,1,'FixMeToo');     -- Glyphic Pigaches +3: Avatar: Attack+89
INSERT INTO `item_mods_pet` VALUES ('FixMe',23680,25,36,1,'FixMeToo');     -- Glyphic Pigaches +3: Avatar: Accuracy+36
INSERT INTO `item_mods_pet` VALUES ('FixMe',23680,562,13,1,'FixMeToo');    -- Glyphic Pigaches +3: Avatar: Magic critical hit rate +13%
INSERT INTO `item_mods_pet` VALUES ('FixMe',23683,28,57,3,'FixMeToo');     -- Pitre Babouches +3: Automaton: "Magic Atk. Bonus"+57
INSERT INTO `item_mods_pet` VALUES ('FixMe',23683,30,43,3,'FixMeToo');     -- Pitre Babouches +3: Automaton: Magic Accuracy+43
-- INSERT INTO `item_mods_pet` VALUES ('FixMe',23686,370,5,?,'FixMeToo');  -- Bagua Sandals +3: Luopan: "Regen"+5
INSERT INTO `item_mods_pet` VALUES ('FixMe',25465,25,15,0,'FixMeToo');     -- Beastmaster Collar: Pet: Accuracy+15
INSERT INTO `item_mods_pet` VALUES ('FixMe',25465,26,15,0,'FixMeToo');     -- Beastmaster Collar: Pet: Ranged Accuracy+15
INSERT INTO `item_mods_pet` VALUES ('FixMe',25465,30,15,0,'FixMeToo');     -- Beastmaster Collar: Pet: Magic Accuracy+15
INSERT INTO `item_mods_pet` VALUES ('FixMe',25466,25,20,0,'FixMeToo');     -- Beastmaster Collar+1: Pet: Accuracy+20
INSERT INTO `item_mods_pet` VALUES ('FixMe',25466,26,20,0,'FixMeToo');     -- Beastmaster Collar+1: Pet: Ranged Accuracy+20
INSERT INTO `item_mods_pet` VALUES ('FixMe',25466,30,20,0,'FixMeToo');     -- Beastmaster Collar+1: Pet: Magic Accuracy+20
INSERT INTO `item_mods_pet` VALUES ('FixMe',25467,25,25,0,'FixMeToo');     -- Beastmaster Collar+2: Pet: Accuracy+25
INSERT INTO `item_mods_pet` VALUES ('FixMe',25467,26,25,0,'FixMeToo');     -- Beastmaster Collar+2: Pet: Ranged Accuracy+25
INSERT INTO `item_mods_pet` VALUES ('FixMe',25467,30,25,0,'FixMeToo');     -- Beastmaster Collar+2: Pet: Magic Accuracy+25
-- INSERT INTO `item_mods_pet` VALUES ('FixMe',25495,??,1,2,'FixMeToo');   -- Dragoon's Collar: Wyvern: Lv.+1
-- INSERT INTO `item_mods_pet` VALUES ('FixMe',25496,??,1,2,'FixMeToo');   -- Dragoon's Collar+1: Wyvern: Lv.+1
-- INSERT INTO `item_mods_pet` VALUES ('FixMe',25497,??,1,2,'FixMeToo');   -- Dragoon's Collar+2: Wyvern: Lv.+1
INSERT INTO `item_mods_pet` VALUES ('FixMe',25501,25,15,1,'FixMeToo');     -- Summoner's Collar: Avatar: Accuracy+15
INSERT INTO `item_mods_pet` VALUES ('FixMe',25501,26,15,1,'FixMeToo');     -- Summoner's Collar: Avatar: Ranged Accuracy+15
INSERT INTO `item_mods_pet` VALUES ('FixMe',25501,30,15,1,'FixMeToo');     -- Summoner's Collar: Avatar: Magic Accuracy+15
INSERT INTO `item_mods_pet` VALUES ('FixMe',25502,25,20,1,'FixMeToo');     -- Summoner's Collar: Avatar: Accuracy+20
INSERT INTO `item_mods_pet` VALUES ('FixMe',25502,26,20,1,'FixMeToo');     -- Summoner's Collar: Avatar: Ranged Accuracy+20
INSERT INTO `item_mods_pet` VALUES ('FixMe',25502,30,20,1,'FixMeToo');     -- Summoner's Collar: Avatar: Magic Accuracy+20
INSERT INTO `item_mods_pet` VALUES ('FixMe',25503,25,25,1,'FixMeToo');     -- Summoner's Collar: Avatar: Accuracy+25
INSERT INTO `item_mods_pet` VALUES ('FixMe',25503,26,25,1,'FixMeToo');     -- Summoner's Collar: Avatar: Ranged Accuracy+25
INSERT INTO `item_mods_pet` VALUES ('FixMe',25503,30,25,1,'FixMeToo');     -- Summoner's Collar: Avatar: Magic Accuracy+25
INSERT INTO `item_mods_pet` VALUES ('FixMe',25519,25,15,3,'FixMeToo');     -- Pup. Collar: Automaton: Accuracy+15
INSERT INTO `item_mods_pet` VALUES ('FixMe',25519,26,15,3,'FixMeToo');     -- Pup. Collar: Automaton: Ranged Accuracy+15
INSERT INTO `item_mods_pet` VALUES ('FixMe',25519,30,15,3,'FixMeToo');     -- Pup. Collar: Automaton: Magic Accuracy+15
INSERT INTO `item_mods_pet` VALUES ('FixMe',25520,25,20,3,'FixMeToo');     -- Pup. Collar+1: Automaton: Accuracy+20
INSERT INTO `item_mods_pet` VALUES ('FixMe',25520,26,20,3,'FixMeToo');     -- Pup. Collar+1: Automaton: Ranged Accuracy+20
INSERT INTO `item_mods_pet` VALUES ('FixMe',25520,30,20,3,'FixMeToo');     -- Pup. Collar+1: Automaton: Magic Accuracy+20
INSERT INTO `item_mods_pet` VALUES ('FixMe',25521,25,25,3,'FixMeToo');     -- Pup. Collar+2: Automaton: Accuracy+25
INSERT INTO `item_mods_pet` VALUES ('FixMe',25521,26,25,3,'FixMeToo');     -- Pup. Collar+2: Automaton: Ranged Accuracy+25
INSERT INTO `item_mods_pet` VALUES ('FixMe',25521,30,25,3,'FixMeToo');     -- Pup. Collar+2: Automaton: Magic Accuracy+25
INSERT INTO `item_mods_pet` VALUES ('FixMe',25563,25,40,0,'FixMeToo');     -- Heyoka Cap: Pet: Accuracy+40
INSERT INTO `item_mods_pet` VALUES ('FixMe',25563,26,40,0,'FixMeToo');     -- Heyoka Cap: Pet: Ranged Accuracy+40
INSERT INTO `item_mods_pet` VALUES ('FixMe',25563,27,8,0,'FixMeToo');      -- Heyoka Cap: Pet: Enmity+8
INSERT INTO `item_mods_pet` VALUES ('FixMe',25563,384,600,0,'FixMeToo');   -- Heyoka Cap: Pet: Haste+6%
INSERT INTO `item_mods_pet` VALUES ('FixMe',25564,25,50,0,'FixMeToo');     -- Heyoka Cap +1: Pet: Accuracy+50
INSERT INTO `item_mods_pet` VALUES ('FixMe',25564,26,50,0,'FixMeToo');     -- Heyoka Cap +1: Pet: Ranged Accuracy+50
INSERT INTO `item_mods_pet` VALUES ('FixMe',25564,27,10,0,'FixMeToo');     -- Heyoka Cap +1: Pet: Enmity+10
INSERT INTO `item_mods_pet` VALUES ('FixMe',25564,384,600,0,'FixMeToo');   -- Heyoka Cap +1: Pet: Haste+6%
INSERT INTO `item_mods_pet` VALUES ('FixMe',25565,368,3,1,'FixMeToo');     -- Baayami Hat: Avatar: "Regain"+3
INSERT INTO `item_mods_pet` VALUES ('FixMe',25566,368,4,1,'FixMeToo');     -- Baayami Hat+1: Avatar: "Regain"+4
INSERT INTO `item_mods_pet` VALUES ('FixMe',26201,23,23,0,'FixMeToo');     -- Thur. Ring +1 Pet: Attack+23
INSERT INTO `item_mods_pet` VALUES ('FixMe',26201,24,23,0,'FixMeToo');     -- Pet: Ranged Attack+23
INSERT INTO `item_mods_pet` VALUES ('FixMe',26201,25,22,0,'FixMeToo');     -- Pet: Accuracy+22
INSERT INTO `item_mods_pet` VALUES ('FixMe',26201,26,22,0,'FixMeToo');     -- Pet: Ranged Accuracy+22
INSERT INTO `item_mods_pet` VALUES ('FixMe',26201,384,400,0,'FixMeToo');   -- Pet: Haste+4%
INSERT INTO `item_mods_pet` VALUES ('FixMe',26201,160,-4,0,'FixMeToo');    -- Pet: Damage Taken -4%
INSERT INTO `item_mods_pet` VALUES ('FixMe',26652,28,20,1,'FixMeToo');     -- Glyphic Horn Avatar: "Magic Atk. Bonus"+20
INSERT INTO `item_mods_pet` VALUES ('FixMe',26653,28,23,1,'FixMeToo');     -- Glyphic Horn +1 Avatar: "Magic Atk. Bonus"+23
INSERT INTO `item_mods_pet` VALUES ('FixMe',26658,369,2,3,'FixMeToo');     -- Pitre Taj Automaton: Refresh +2
INSERT INTO `item_mods_pet` VALUES ('FixMe',26658,370,3,3,'FixMeToo');     -- Automaton: Regen +3
INSERT INTO `item_mods_pet` VALUES ('FixMe',26659,369,3,3,'FixMeToo');     -- Pitre Taj +1 Automaton: Refresh +3
INSERT INTO `item_mods_pet` VALUES ('FixMe',26659,370,3,3,'FixMeToo');     -- Automaton: Regen +3
INSERT INTO `item_mods_pet` VALUES ('FixMe',26774,345,525,3,'FixMeToo');   -- Karagoz Capello Automaton: TP Bonus +525
INSERT INTO `item_mods_pet` VALUES ('FixMe',26775,345,550,3,'FixMeToo');   -- Karagoz Capello +1 Automaton: TP Bonus +550
INSERT INTO `item_mods_pet` VALUES ('FixMe',26828,165,8,1,'FixMeToo');     -- Glyphic Doublet Avatar: Critical hit rate +8%
INSERT INTO `item_mods_pet` VALUES ('FixMe',26829,165,12,1,'FixMeToo');    -- Glyphic Doublet +1 Avatar: Critical hit rate +12%
INSERT INTO `item_mods_pet` VALUES ('FixMe',26834,25,18,3,'FixMeToo');     -- Pitre Tobe Automaton: Accuracy +18
INSERT INTO `item_mods_pet` VALUES ('FixMe',26834,26,18,3,'FixMeToo');     -- Automaton: Ranged Accuracy +18
INSERT INTO `item_mods_pet` VALUES ('FixMe',26834,73,12,3,'FixMeToo');     -- Automaton: Store TP +12
INSERT INTO `item_mods_pet` VALUES ('FixMe',26835,25,21,3,'FixMeToo');     -- Pitre Tobe +1 Automaton: Accuracy +21
INSERT INTO `item_mods_pet` VALUES ('FixMe',26835,26,21,3,'FixMeToo');     -- Automaton: Ranged Accuracy +21
INSERT INTO `item_mods_pet` VALUES ('FixMe',26835,73,13,3,'FixMeToo');     -- Automaton: Store TP +13
INSERT INTO `item_mods_pet` VALUES ('FixMe',26888,27,14,1,'FixMeToo');     -- Shomonjijoe +1 Avatar: Enmity +14
INSERT INTO `item_mods_pet` VALUES ('FixMe',26926,126,10,1,'FixMeToo');    -- Beckoner's Doublet Avatar: "Blood Pact" damage +10
INSERT INTO `item_mods_pet` VALUES ('FixMe',26927,126,11,1,'FixMeToo');    -- Beckoner's Doublet +1 Avatar: "Blood Pact" damage +11
INSERT INTO `item_mods_pet` VALUES ('FixMe',27004,25,20,1,'FixMeToo');     -- Glyphic Bracers Avatar: Accuracy +20
INSERT INTO `item_mods_pet` VALUES ('FixMe',27004,384,200,1,'FixMeToo');   -- Avatar: Haste +2%
INSERT INTO `item_mods_pet` VALUES ('FixMe',27005,25,28,1,'FixMeToo');     -- Glyphic Bracers +1 Avatar: Accuracy +28
INSERT INTO `item_mods_pet` VALUES ('FixMe',27005,384,300,1,'FixMeToo');   -- Avatar: Haste +3%
INSERT INTO `item_mods_pet` VALUES ('FixMe',27010,289,7,3,'FixMeToo');     -- Pitre Dastanas Automaton: Subtle Blow +7
INSERT INTO `item_mods_pet` VALUES ('FixMe',27010,384,400,3,'FixMeToo');   -- Automaton: Haste +4%
INSERT INTO `item_mods_pet` VALUES ('FixMe',27011,289,9,3,'FixMeToo');     -- Pitre Dastanas +1 Automaton: Subtle Blow +9
INSERT INTO `item_mods_pet` VALUES ('FixMe',27011,384,500,3,'FixMeToo');   -- Automaton: Haste +5%
INSERT INTO `item_mods_pet` VALUES ('FixMe',27044,2,50,2,'FixMeToo');      -- Crusher Gauntlets Wyvern: HP+50
INSERT INTO `item_mods_pet` VALUES ('FixMe',27080,25,20,1,'FixMeToo');     -- Beckoner's Bracers Avatar: Accuracy+20
INSERT INTO `item_mods_pet` VALUES ('FixMe',27081,25,30,1,'FixMeToo');     -- Beck. Bracers +1 Avatar: Accuracy+30
INSERT INTO `item_mods_pet` VALUES ('FixMe',27086,8,13,3,'FixMeToo');      -- Karagoz Guanti Automaton: STR +13
INSERT INTO `item_mods_pet` VALUES ('FixMe',27086,9,13,3,'FixMeToo');      -- Automaton: DEX +13
INSERT INTO `item_mods_pet` VALUES ('FixMe',27086,11,13,3,'FixMeToo');     -- Automaton: AGI +13
INSERT INTO `item_mods_pet` VALUES ('FixMe',27087,8,16,3,'FixMeToo');      -- Karagoz Guanti +1 Automaton: STR +16
INSERT INTO `item_mods_pet` VALUES ('FixMe',27087,9,16,3,'FixMeToo');      -- Automaton: DEX +16
INSERT INTO `item_mods_pet` VALUES ('FixMe',27087,11,16,3,'FixMeToo');     -- Automaton: AGI +16
INSERT INTO `item_mods_pet` VALUES ('FixMe',27180,30,10,1,'FixMeToo');     -- Glyphic Spats Avatar: Magic Accuracy+10
INSERT INTO `item_mods_pet` VALUES ('FixMe',27181,30,13,1,'FixMeToo');     -- Glyphic Spats +1 Avatar: Magic Accuracy+13
INSERT INTO `item_mods_pet` VALUES ('FixMe',27186,30,15,3,'FixMeToo');     -- Pitre Churidars Automaton: Magic Accuracy +15
INSERT INTO `item_mods_pet` VALUES ('FixMe',27186,170,7,3,'FixMeToo');     -- Automaton: Fast Cast +7%
INSERT INTO `item_mods_pet` VALUES ('FixMe',27187,30,18,3,'FixMeToo');     -- Pitre Churidars +1 Automaton: Magic Accuracy +18
INSERT INTO `item_mods_pet` VALUES ('FixMe',27187,170,8,3,'FixMeToo');     -- Automaton: Fast Cast +8%
INSERT INTO `item_mods_pet` VALUES ('FixMe',27221,27,4,1,'FixMeToo');      -- Avatara Slops Avatar: Enmity+4
INSERT INTO `item_mods_pet` VALUES ('FixMe',27221,126,7,1,'FixMeToo');     -- "Blood Pact" damage +7
INSERT INTO `item_mods_pet` VALUES ('FixMe',27265,345,550,1,'FixMeToo');   -- Beckoner's Spats Avatar: TP Bonus +550
INSERT INTO `item_mods_pet` VALUES ('FixMe',27266,345,600,1,'FixMeToo');   -- Beck. Spats +1 Avatar: TP Bonus +600
INSERT INTO `item_mods_pet` VALUES ('FixMe',27356,23,28,1,'FixMeToo');     -- Glyphic Pigaches Avatar: Attack+25
INSERT INTO `item_mods_pet` VALUES ('FixMe',27356,562,7,1,'FixMeToo');     -- Avatar: Magic critical hit rate +7%
INSERT INTO `item_mods_pet` VALUES ('FixMe',27357,23,28,1,'FixMeToo');     -- Glyph. Pigaches +1 Avatar: Attack+28
INSERT INTO `item_mods_pet` VALUES ('FixMe',27357,562,9,1,'FixMeToo');     -- Avatar: Magic critical hit rate +9%
INSERT INTO `item_mods_pet` VALUES ('FixMe',27362,28,15,3,'FixMeToo');     -- Pitre Babouches Automaton: Magic Attack Bonus +15
INSERT INTO `item_mods_pet` VALUES ('FixMe',27362,30,12,3,'FixMeToo');     -- Automaton: Magic Accuracy +12
INSERT INTO `item_mods_pet` VALUES ('FixMe',27363,28,18,3,'FixMeToo');     -- Pitre Babouches Automaton: Magic Attack Bonus +18
INSERT INTO `item_mods_pet` VALUES ('FixMe',27363,30,15,3,'FixMeToo');     -- Automaton: Magic Accuracy +15
INSERT INTO `item_mods_pet` VALUES ('FixMe',27439,30,17,1,'FixMeToo');     -- Beck. Pigaches Avatar: Magic Accuracy+17
INSERT INTO `item_mods_pet` VALUES ('FixMe',27440,30,27,1,'FixMeToo');     -- Beck. Pigaches +1 Avatar: Magic Accuracy+27
INSERT INTO `item_mods_pet` VALUES ('FixMe',27445,12,17,3,'FixMeToo');     -- Karagoz Scarpe Automaton: INT +17
INSERT INTO `item_mods_pet` VALUES ('FixMe',27445,13,17,3,'FixMeToo');     -- Automaton: MND +17
INSERT INTO `item_mods_pet` VALUES ('FixMe',27446,12,20,3,'FixMeToo');     -- Karagoz Scarpe +1 Automaton: INT +20
INSERT INTO `item_mods_pet` VALUES ('FixMe',27446,13,20,3,'FixMeToo');     -- Automaton: MND +20
INSERT INTO `item_mods_pet` VALUES ('FixMe',27677,27,4,1,'FixMeToo');      -- Convoker's Horn Avatar: Enmity+4
INSERT INTO `item_mods_pet` VALUES ('FixMe',27680,71,6,3,'FixMeToo');      -- Foire Taj Automaton: HP recovered while healing +6
INSERT INTO `item_mods_pet` VALUES ('FixMe',27680,72,6,3,'FixMeToo');      -- Automaton: MP recovered while healing +6
INSERT INTO `item_mods_pet` VALUES ('FixMe',27680,384,500,3,'FixMeToo');    -- Automaton: Haste +5%
INSERT INTO `item_mods_pet` VALUES ('FixMe',27698,27,4,1,'FixMeToo');      -- Con. Horn +1 Avatar: Enmity+4
INSERT INTO `item_mods_pet` VALUES ('FixMe',27701,71,8,3,'FixMeToo');      -- Foire Taj +1 Automaton: HP recovered while healing +8
INSERT INTO `item_mods_pet` VALUES ('FixMe',27701,72,8,3,'FixMeToo');      -- Automaton: MP recovered while healing +8
INSERT INTO `item_mods_pet` VALUES ('FixMe',27701,384,500,3,'FixMeToo');   -- Automaton: Haste +5%
INSERT INTO `item_mods_pet` VALUES ('FixMe',27820,370,2,2,'FixMeToo');     -- Vishap Mail Adds "Regen" effect to wyvern
INSERT INTO `item_mods_pet` VALUES ('FixMe',27821,126,11,1,'FixMeToo');    -- Convoker's Doublet Avatar: Increases "Blood Pact" damage (11%)
INSERT INTO `item_mods_pet` VALUES ('FixMe',27824,2,85,3,'FixMeToo');      -- Foire Tobe Automaton: HP +85
INSERT INTO `item_mods_pet` VALUES ('FixMe',27824,5,85,3,'FixMeToo');      -- Automaton: MP +85
INSERT INTO `item_mods_pet` VALUES ('FixMe',27824,384,300,3,'FixMeToo');   -- Automaton: Haste +3%
INSERT INTO `item_mods_pet` VALUES ('FixMe',27841,370,3,2,'FixMeToo');     -- Vishap Mail +1 Wyvern: "Regen" +3
INSERT INTO `item_mods_pet` VALUES ('FixMe',27842,126,12,1,'FixMeToo');    -- Con. Doublet +1 Avatar: "Blood Pact" ability damage +12
INSERT INTO `item_mods_pet` VALUES ('FixMe',27845,2,110,3,'FixMeToo');     -- Foire Tobe +1 Automaton: HP +110
INSERT INTO `item_mods_pet` VALUES ('FixMe',27845,5,110,3,'FixMeToo');     -- Automaton: MP +110
INSERT INTO `item_mods_pet` VALUES ('FixMe',27845,384,300,3,'FixMeToo');   -- Automaton: Haste +3%
INSERT INTO `item_mods_pet` VALUES ('FixMe',27957,27,5,1,'FixMeToo');      -- Con. Bracers Avatar: Enmity+5
INSERT INTO `item_mods_pet` VALUES ('FixMe',27960,384,300,3,'FixMeToo');   -- Foire Dastanas Automaton: Haste +3%
INSERT INTO `item_mods_pet` VALUES ('FixMe',27978,27,5,1,'FixMeToo');      -- Con. Bracers +1 Avatar: Enmity+5
INSERT INTO `item_mods_pet` VALUES ('FixMe',27981,384,400,3,'FixMeToo');   -- Foire Dastanas +1 Automaton: Haste +4%
INSERT INTO `item_mods_pet` VALUES ('FixMe',28025,25,20,0,'FixMeToo');     -- Regimen Mittens Pet: Accuracy+20
INSERT INTO `item_mods_pet` VALUES ('FixMe',28025,26,20,0,'FixMeToo');     -- Pet: Ranged Accuracy+20
INSERT INTO `item_mods_pet` VALUES ('FixMe',28025,30,20,0,'FixMeToo');     -- Pet: Magic Accuracy+20
INSERT INTO `item_mods_pet` VALUES ('FixMe',28025,384,600,0,'FixMeToo');   -- Pet: Haste+6%
INSERT INTO `item_mods_pet` VALUES ('FixMe',28103,3,20,2,'FixMeToo');      -- Vishap Brais Wyvern: HP+20%
INSERT INTO `item_mods_pet` VALUES ('FixMe',28104,25,20,1,'FixMeToo');     -- Convoker's Spats Avatar: Increases Accuracy +20 (?)
INSERT INTO `item_mods_pet` VALUES ('FixMe',28104,27,4,1,'FixMeToo');      -- Avatar: Enmity+4
INSERT INTO `item_mods_pet` VALUES ('FixMe',28107,5,40,3,'FixMeToo');      -- Foire Churidars Automaton: MP +40 (?)
INSERT INTO `item_mods_pet` VALUES ('FixMe',28107,374,10,3,'FixMeToo');    -- Automaton: Cure potency +10% (?)
INSERT INTO `item_mods_pet` VALUES ('FixMe',28107,384,300,3,'FixMeToo');   -- Automaton: Haste +3%
INSERT INTO `item_mods_pet` VALUES ('FixMe',28119,23,20,0,'FixMeToo');     -- Tot. Trousers +1 Pet: Attack+20
INSERT INTO `item_mods_pet` VALUES ('FixMe',28124,3,23,2,'FixMeToo');      -- Vishap Brais +1 Wyvern: HP+23%
INSERT INTO `item_mods_pet` VALUES ('FixMe',28125,25,20,1,'FixMeToo');     -- Con. Spats +1 Avatar: Accuracy+20
INSERT INTO `item_mods_pet` VALUES ('FixMe',28125,27,4,1,'FixMeToo');      -- Avatar: Enmity+4
INSERT INTO `item_mods_pet` VALUES ('FixMe',28128,5,50,3,'FixMeToo');      -- Foire Churidars +1 Automaton: MP+50
INSERT INTO `item_mods_pet` VALUES ('FixMe',28128,374,12,3,'FixMeToo');    -- Automaton: "Cure" Potency +12%
INSERT INTO `item_mods_pet` VALUES ('FixMe',28128,384,300,3,'FixMeToo');   -- Automaton: Haste +3%
INSERT INTO `item_mods_pet` VALUES ('FixMe',28141,25,20,0,'FixMeToo');     -- Wisent Kecks Pet: Accuracy+20
INSERT INTO `item_mods_pet` VALUES ('FixMe',28141,23,10,0,'FixMeToo');     -- Pet: Attack+10
INSERT INTO `item_mods_pet` VALUES ('FixMe',28141,26,20,0,'FixMeToo');     -- Pet: Ranged Accuracy+20
INSERT INTO `item_mods_pet` VALUES ('FixMe',28141,24,10,0,'FixMeToo');     -- Pet: Ranged Attack+10
INSERT INTO `item_mods_pet` VALUES ('FixMe',28141,68,20,0,'FixMeToo');     -- Pet: Evasion+20
INSERT INTO `item_mods_pet` VALUES ('FixMe',28141,384,300,0,'FixMeToo');   -- Pet: Haste+3%
INSERT INTO `item_mods_pet` VALUES ('FixMe',28211,23,15,1,'FixMeToo');     -- Mdk. Crackows +1 Avatar: Increases attack +15 (?)
INSERT INTO `item_mods_pet` VALUES ('FixMe',28211,384,200,1,'FixMeToo');   -- Avatar: Haste+2%
INSERT INTO `item_mods_pet` VALUES ('FixMe',28213,23,13,2,'FixMeToo');     -- Ker's Sollerets Wyvern: Attack+13
INSERT INTO `item_mods_pet` VALUES ('FixMe',28214,68,5,0,'FixMeToo');      -- Sigyn's Jambeaux Pet: Evasion+5
INSERT INTO `item_mods_pet` VALUES ('FixMe',28219,68,2,0,'FixMeToo');      -- Idi's Ledelsens Pet: Evasion+2
INSERT INTO `item_mods_pet` VALUES ('FixMe',28231,23,10,0,'FixMeToo');     -- Totemic Gaiters Pet: Attack+10
INSERT INTO `item_mods_pet` VALUES ('FixMe',28231,25,10,0,'FixMeToo');     -- Pet: Accuracy+10
INSERT INTO `item_mods_pet` VALUES ('FixMe',28237,27,5,1,'FixMeToo');      -- Con. Pigaches Avatar: Enmity+5
INSERT INTO `item_mods_pet` VALUES ('FixMe',28237,68,20,1,'FixMeToo');     -- Avatar: Enhances evasion +20
INSERT INTO `item_mods_pet` VALUES ('FixMe',28237,126,5,1,'FixMeToo');     -- Avatar: Increases "Blood Pact" damage +5%
INSERT INTO `item_mods_pet` VALUES ('FixMe',28240,384,300,3,'FixMeToo');   -- Foire Babouches Automaton: Haste +3%
INSERT INTO `item_mods_pet` VALUES ('FixMe',28252,23,10,0,'FixMeToo');     -- Tot. Gaiters +1 Pet: Attack+10
INSERT INTO `item_mods_pet` VALUES ('FixMe',28252,25,10,0,'FixMeToo');     -- Pet: Accuracy+10
INSERT INTO `item_mods_pet` VALUES ('FixMe',28258,27,5,1,'FixMeToo');      -- Con. Pigaches +1 Avatar: Enmity+5
INSERT INTO `item_mods_pet` VALUES ('FixMe',28258,68,20,1,'FixMeToo');     -- Avatar: Evasion+20
INSERT INTO `item_mods_pet` VALUES ('FixMe',28258,126,6,1,'FixMeToo');     -- Avatar: "Blood Pact" damage +6
INSERT INTO `item_mods_pet` VALUES ('FixMe',28261,384,300,3,'FixMeToo');   -- Foire Bab. +1 Automaton: Haste+3%
INSERT INTO `item_mods_pet` VALUES ('FixMe',28356,28,5,1,'FixMeToo');      -- Eidolon Pendant +1 Avatar: "Magic Atk. Bonus"+5
INSERT INTO `item_mods_pet` VALUES ('FixMe',28432,25,15,3,'FixMeToo');     -- Ukko Sash Automaton: Accuracy+15
INSERT INTO `item_mods_pet` VALUES ('FixMe',28432,26,15,3,'FixMeToo');     -- Automaton: Ranged Accuracy+15
INSERT INTO `item_mods_pet` VALUES ('FixMe',28432,30,15,3,'FixMeToo');     -- Automaton: Magic Accuracy+15
INSERT INTO `item_mods_pet` VALUES ('FixMe',28432,384,500,3,'FixMeToo');   -- Automaton: Haste+5%
INSERT INTO `item_mods_pet` VALUES ('FixMe',28432,170,5,3,'FixMeToo');     -- Automaton: "Fast Cast"+5%
INSERT INTO `item_mods_pet` VALUES ('FixMe',28495,384,300,0,'FixMeToo');   -- Rimeice Earring Pet: Haste+3%
INSERT INTO `item_mods_pet` VALUES ('FixMe',28495,27,5,0,'FixMeToo');      -- Pet: Enmity+5
INSERT INTO `item_mods_pet` VALUES ('FixMe',28495,160,1,0,'FixMeToo');     -- Pet: Damage taken -1%
INSERT INTO `item_mods_pet` VALUES ('FixMe',28588,23,15,3,'FixMeToo');     -- Karagoz Mantle +1 Automaton: Attack +15
INSERT INTO `item_mods_pet` VALUES ('FixMe',28588,25,15,3,'FixMeToo');     -- Automaton: Accuracy +15
INSERT INTO `item_mods_pet` VALUES ('FixMe',28588,68,10,3,'FixMeToo');     -- Automaton: Evasion +10
INSERT INTO `item_mods_pet` VALUES ('FixMe',28605,25,7,1,'FixMeToo');      -- Samanisi Cape Avatar: Accuracy +7
INSERT INTO `item_mods_pet` VALUES ('FixMe',28605,30,7,1,'FixMeToo');      -- Avatar: Magic Accuracy +7
INSERT INTO `item_mods_pet` VALUES ('FixMe',28643,12,8,3,'FixMeToo');     -- Refraction Cape Automaton: INT+8
INSERT INTO `item_mods_pet` VALUES ('FixMe',28643,13,8,3,'FixMeToo');      -- Automaton: MND+8
INSERT INTO `item_mods_pet` VALUES ('FixMe',28643,30,3,3,'FixMeToo');      -- Automaton: Magic Accuracy+3

