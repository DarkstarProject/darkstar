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
-- Structure de la table `item_mods`
--

DROP TABLE IF EXISTS `item_mods`;
CREATE TABLE IF NOT EXISTS `item_mods` (
  `itemId` smallint(5) unsigned NOT NULL,
  `modId` smallint(5) unsigned NOT NULL,
  `value` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemId`, `modId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=13 PACK_KEYS=1;

--
-- Contenu de la table `item_mods`
--

-- Please keep mods that apply to same item ID together
-- (easy way is to just keep item ID sequential)

-- -------------------------------------------------------
-- Decennial Coat
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10251, 1, 1); -- def 1

-- -------------------------------------------------------
-- Decennial Dress
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10252, 1, 1); -- def 1

-- -------------------------------------------------------
-- Decennial Coat +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10253, 1, 2); -- def 2

-- -------------------------------------------------------
-- Decennial Dress +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10254, 1, 2); -- def 2

-- -------------------------------------------------------
-- Matanca Harness
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10255, 1, 77); -- DEF+77
INSERT INTO `item_mods` VALUES (10255, 3, 8); -- HP+8%
INSERT INTO `item_mods` VALUES (10255, 8, 15); -- STR+15
INSERT INTO `item_mods` VALUES (10255, 9, 15); -- DEX+15
INSERT INTO `item_mods` VALUES (10255, 10, 15); -- VIT+15
INSERT INTO `item_mods` VALUES (10255, 23, 22); -- Attack+22
INSERT INTO `item_mods` VALUES (10255, 384, 30); -- Haste+3%

INSERT INTO `item_mods` VALUES (10256, 1, 1);
INSERT INTO `item_mods` VALUES (10257, 1, 1);
INSERT INTO `item_mods` VALUES (10258, 1, 1);
INSERT INTO `item_mods` VALUES (10259, 1, 1);
INSERT INTO `item_mods` VALUES (10260, 1, 1);
INSERT INTO `item_mods` VALUES (10261, 1, 1);
INSERT INTO `item_mods` VALUES (10262, 1, 1);
INSERT INTO `item_mods` VALUES (10263, 1, 1);
INSERT INTO `item_mods` VALUES (10264, 1, 2);
INSERT INTO `item_mods` VALUES (10265, 1, 2);
INSERT INTO `item_mods` VALUES (10266, 1, 2);
INSERT INTO `item_mods` VALUES (10267, 1, 2);
INSERT INTO `item_mods` VALUES (10268, 1, 2);
INSERT INTO `item_mods` VALUES (10269, 1, 2);
INSERT INTO `item_mods` VALUES (10270, 1, 2);
INSERT INTO `item_mods` VALUES (10271, 1, 2);

-- -------------------------------------------------------
-- Dux Scale Mail
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10272, 1, 68); -- DEF+68
INSERT INTO `item_mods` VALUES (10272, 8, 9); -- STR+9
INSERT INTO `item_mods` VALUES (10272, 10, 9); -- VIT+9
INSERT INTO `item_mods` VALUES (10272, 23, 15); -- Attack+15
INSERT INTO `item_mods` VALUES (10272, 161, -4); -- Physical damage taken -4%
INSERT INTO `item_mods` VALUES (10272, 27, 6); -- Enmity+6

-- -------------------------------------------------------
-- Dux Scale Mail +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10273, 1, 69); -- DEF+69
INSERT INTO `item_mods` VALUES (10273, 8, 10); -- STR+10
INSERT INTO `item_mods` VALUES (10273, 10, 10); -- VIT+10
INSERT INTO `item_mods` VALUES (10273, 23, 16); -- Attack+16
INSERT INTO `item_mods` VALUES (10273, 161, -5); -- Physical damage taken -5%
INSERT INTO `item_mods` VALUES (10273, 27, 7); -- Enmity+7

INSERT INTO `item_mods` VALUES (10274, 374, 5);
INSERT INTO `item_mods` VALUES (10275, 374, 6);

-- -------------------------------------------------------
-- Enif Corazza
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10276, 1, 75); -- DEF+75
INSERT INTO `item_mods` VALUES (10276, 2, 45); -- HP+45
INSERT INTO `item_mods` VALUES (10276, 5, 45); -- MP+45
INSERT INTO `item_mods` VALUES (10276, 25, 23); -- Accuracy+23
INSERT INTO `item_mods` VALUES (10276, 384, 30); -- Haste+3%
-- [NOT CODED] "Quadruple Attack"+2%

-- -------------------------------------------------------
-- Adhara Manteel
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10277, 1, 63); -- DEF+63
INSERT INTO `item_mods` VALUES (10277, 30, 5); -- Magic Accuracy+5
INSERT INTO `item_mods` VALUES (10277, 112, 13); -- Healing magic skill +13
INSERT INTO `item_mods` VALUES (10277, 116, 13); -- Dark magic skill +13
INSERT INTO `item_mods` VALUES (10277, 122, 13); -- Blue magic skill +13
INSERT INTO `item_mods` VALUES (10277, 384, 40); -- Haste+4%

-- -------------------------------------------------------
-- Murzim Corazza
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10278, 1, 75); -- DEF:75
INSERT INTO `item_mods` VALUES (10278, 2, 53); -- HP+53
INSERT INTO `item_mods` VALUES (10278, 5, 53); -- MP+53
INSERT INTO `item_mods` VALUES (10278, 23, 15); -- Attack+15
INSERT INTO `item_mods` VALUES (10278, 73, 6); --  "Store TP"+6
INSERT INTO `item_mods` VALUES (10278, 384, 40); -- Haste+4%

INSERT INTO `item_mods` VALUES (10279, 375, 3);

-- -------------------------------------------------------
-- Laeradr Breastplate
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10280, 1, 80); -- DEF:80
INSERT INTO `item_mods` VALUES (10280, 2, 100); -- HP+100
INSERT INTO `item_mods` VALUES (10280, 160, -11); -- Damage taken -11%
INSERT INTO `item_mods` VALUES (10280, 27, 9); -- Enmity+9
INSERT INTO `item_mods` VALUES (10280, 384, -20); --  "Slow"+2%

INSERT INTO `item_mods` VALUES (10281, 369, 2);
INSERT INTO `item_mods` VALUES (10282, 369, 1);

-- -------------------------------------------------------
-- Vara Brigandine
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10283, 1, 57); -- DEF:57
INSERT INTO `item_mods` VALUES (10283, 2, 35); -- HP+35
INSERT INTO `item_mods` VALUES (10283, 8, 6); -- STR+6
INSERT INTO `item_mods` VALUES (10283, 9, 12); -- DEX+12
INSERT INTO `item_mods` VALUES (10283, 10, 12); -- VIT+12
INSERT INTO `item_mods` VALUES (10283, 11, 6); -- AGI+6
INSERT INTO `item_mods` VALUES (10283, 12, 6); -- INT+6
INSERT INTO `item_mods` VALUES (10283, 13, 6); -- MND+6
INSERT INTO `item_mods` VALUES (10283, 14, 6); -- CHR+6
INSERT INTO `item_mods` VALUES (10283, 23, 14); -- Attack+14
INSERT INTO `item_mods` VALUES (10283, 24, 14); -- Ranged Attack+14
INSERT INTO `item_mods` VALUES (10283, 73, 5); -- "Store TP"+5

-- -------------------------------------------------------
-- Grandoyne's Mail
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10284, 1, 77); -- DEF:77
INSERT INTO `item_mods` VALUES (10284, 8, 12); -- STR+12
INSERT INTO `item_mods` VALUES (10284, 9, 12); -- DEX+12
INSERT INTO `item_mods` VALUES (10284, 23, 19); -- Attack+19
INSERT INTO `item_mods` VALUES (10284, 165, 2); -- Critical hit rate +2%
INSERT INTO `item_mods` VALUES (10284, 384, 30); -- Haste+3%

-- -------------------------------------------------------
-- Beguiler's Jerkin
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10285, 1, 61); -- DEF:61
INSERT INTO `item_mods` VALUES (10285, 25, 15); -- Accuracy+15
INSERT INTO `item_mods` VALUES (10285, 289, 7); -- "Subtle Blow"+7
INSERT INTO `item_mods` VALUES (10285, 73, 5); -- "Store TP"+5
INSERT INTO `item_mods` VALUES (10285, 384, 51); -- Haste+5%

-- -------------------------------------------------------
-- Seidr Cotehardie
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10286, 1, 53); -- DEF:53
INSERT INTO `item_mods` VALUES (10286, 30, 13); -- Magic Accuracy+13
INSERT INTO `item_mods` VALUES (10286, 28, 7); -- "Magic Atk. Bonus"+7
-- [NOT CODED] Converts 2% of magic elemental damage dealt to MP

-- -------------------------------------------------------
-- Feverish Korazin
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10287, 1, 71); -- DEF:71
INSERT INTO `item_mods` VALUES (10287, 2, 90); -- HP+90
INSERT INTO `item_mods` VALUES (10287, 8, 15); -- STR+15
INSERT INTO `item_mods` VALUES (10287, 54, 30); -- [Element: Fire]+30
INSERT INTO `item_mods` VALUES (10287, 23, 15); -- Attack+15
INSERT INTO `item_mods` VALUES (10287, 162, -5); -- Breath damage taken -5%

-- -------------------------------------------------------
-- Sublime Breastplate
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10289, 1, 60); -- DEF:60
INSERT INTO `item_mods` VALUES (10289, 8, 14); -- STR+14
INSERT INTO `item_mods` VALUES (10289, 13, 14); -- MND+14
INSERT INTO `item_mods` VALUES (10289, 25, 13); -- Accuracy+13
INSERT INTO `item_mods` VALUES (10289, 111, 10); -- Divine magic skill+10
INSERT INTO `item_mods` VALUES (10289, 112, 10); -- Healing magic skill+10

-- -------------------------------------------------------
-- Laudan Cuirass
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10290, 1, 78); -- DEF:78
INSERT INTO `item_mods` VALUES (10290, 8, 16); -- STR+16
INSERT INTO `item_mods` VALUES (10290, 10, 10); -- VIT+10
INSERT INTO `item_mods` VALUES (10290, 12, 10); -- INT+10
INSERT INTO `item_mods` VALUES (10290, 23, 30); -- Attack+30
INSERT INTO `item_mods` VALUES (10290, 384, 30); -- Haste+3%

-- -------------------------------------------------------
-- Febro Kaftan
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10291, 1, 61); -- DEF:61
INSERT INTO `item_mods` VALUES (10291, 9, 61); -- DEX+14
INSERT INTO `item_mods` VALUES (10291, 11, 61); -- AGI+14
INSERT INTO `item_mods` VALUES (10291, 25, 61); -- Accuracy+12
INSERT INTO `item_mods` VALUES (10291, 289, 61); -- "Subtle Blow"+5
INSERT INTO `item_mods` VALUES (10291, 384, 40); -- Haste+4%

-- -------------------------------------------------------
-- Wikyo Cloak
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10292, 1, 75); -- DEF:75
INSERT INTO `item_mods` VALUES (10292, 13, 16); -- MND+16
INSERT INTO `item_mods` VALUES (10292, 30, 10); -- Magic Accuracy+10
INSERT INTO `item_mods` VALUES (10292, 114, 18); -- Enfeebling magic skill +18
-- [NOT CODED] Enfeebling magic spellcasting time -7%

-- -------------------------------------------------------
-- Chocobo Shirt
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10293, 1, 2); -- DEF:2

-- -------------------------------------------------------
-- Kokou's Earring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10295, 8, 4); -- STR+4
INSERT INTO `item_mods` VALUES (10295, 25, 4); -- Accuracy+4
INSERT INTO `item_mods` VALUES (10295, 73, 1); -- "Store TP"+1

-- -------------------------------------------------------
-- Sortiarius Earring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10297, 28, 6); -- "Magic Atk. Bonus"+6
INSERT INTO `item_mods` VALUES (10297, 27, -2); -- Enmity-2

-- -------------------------------------------------------
-- Beatific Earring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10298, 111, 4); -- Divine magic skill +4
INSERT INTO `item_mods` VALUES (10298, 112, 4); -- Healing magic skill +4

-- -------------------------------------------------------
-- Myrmex Mittens
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10300, 1, 28); -- DEF:28
INSERT INTO `item_mods` VALUES (10300, 2, 30); -- HP+30
INSERT INTO `item_mods` VALUES (10300, 8, 10); -- STR+10
INSERT INTO `item_mods` VALUES (10300, 9, 7); -- DEX+7
INSERT INTO `item_mods` VALUES (10300, 11, 7); -- AGI+7
INSERT INTO `item_mods` VALUES (10300, 25, 10); -- Accuracy+10
INSERT INTO `item_mods` VALUES (10300, 23, 10); -- Attack+10

-- -------------------------------------------------------
-- Arciten Gauntlets
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10301, 1, 24); -- DEF:24
INSERT INTO `item_mods` VALUES (10301, 2, 30); -- HP+30
INSERT INTO `item_mods` VALUES (10301, 26, 10); -- Ranged Accuracy+10
INSERT INTO `item_mods` VALUES (10301, 24, 15); -- Ranged Attack+15

-- -------------------------------------------------------
-- Punishing Gloves
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10302, 1, 26); -- DEF:26
INSERT INTO `item_mods` VALUES (10302, 2, 25); -- HP+25
INSERT INTO `item_mods` VALUES (10302, 5, 25); -- MP+25
INSERT INTO `item_mods` VALUES (10302, 23, 15); -- Attack+15
INSERT INTO `item_mods` VALUES (10302, 30, 5); -- Magic Accuracy+5

-- -------------------------------------------------------
-- Paalaka Gloves
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10313, 1, 40); -- DEF:40
INSERT INTO `item_mods` VALUES (10313, 2, 50); -- HP+50
INSERT INTO `item_mods` VALUES (10313, 10, 15); -- VIT+15
INSERT INTO `item_mods` VALUES (10313, 29, 2); -- "Magic Def. Bonus"+2
INSERT INTO `item_mods` VALUES (10313, 161, -4); -- Physical damage taken -4%

-- -------------------------------------------------------
-- Aneirin's Gloves
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10314, 1, 25); -- DEF:25
INSERT INTO `item_mods` VALUES (10314, 14, 10); -- CHR+10
INSERT INTO `item_mods` VALUES (10314, 119, 11); -- Singing skill +11
INSERT INTO `item_mods` VALUES (10314, 455, 5); -- Song spellcasting time -5%
INSERT INTO `item_mods` VALUES (10314, 27, -5); -- Enmity-5

-- -------------------------------------------------------
-- Alcedo Gauntlets
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10315, 1, 37); -- DEF:37
INSERT INTO `item_mods` VALUES (10315, 10, 7); -- VIT+7
INSERT INTO `item_mods` VALUES (10315, 13, 7); -- MND+7
INSERT INTO `item_mods` VALUES (10315, 25, 8); -- Accuracy+8
INSERT INTO `item_mods` VALUES (10315, 27, 5); -- Enmity+5
INSERT INTO `item_mods` VALUES (10315, 384, 40); -- Haste+4%

-- -------------------------------------------------------
-- Dux Fng. Gnt.
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10316, 1, 32); -- DEF:32
INSERT INTO `item_mods` VALUES (10316, 10, 4); -- VIT+4
INSERT INTO `item_mods` VALUES (10316, 25, 10); -- Accuracy+10
INSERT INTO `item_mods` VALUES (10316, 161, -2); -- Physical damage taken -2%
INSERT INTO `item_mods` VALUES (10316, 27, 4); -- Enmity+4

-- -------------------------------------------------------
-- Dux Fng. Gnt. +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10317, 1, 33); -- DEF:33
INSERT INTO `item_mods` VALUES (10317, 10, 5); -- VIT+5
INSERT INTO `item_mods` VALUES (10317, 25, 11); -- Accuracy+11
INSERT INTO `item_mods` VALUES (10317, 161, -3); -- Physical damage taken -3%
INSERT INTO `item_mods` VALUES (10317, 27, 5); -- Enmity+5

-- -------------------------------------------------------
-- Chelona Gloves
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10318, 1, 26); -- DEF:26
INSERT INTO `item_mods` VALUES (10318, 5, 30); -- MP+30
INSERT INTO `item_mods` VALUES (10318, 8, -5); -- STR-5
INSERT INTO `item_mods` VALUES (10318, 9, -5); -- DEX-5
INSERT INTO `item_mods` VALUES (10318, 10, -5); -- VIT-5
INSERT INTO `item_mods` VALUES (10318, 11, -5); -- AGI-5
INSERT INTO `item_mods` VALUES (10318, 12, 5); -- INT+5
INSERT INTO `item_mods` VALUES (10318, 13, 5); -- MND+5
INSERT INTO `item_mods` VALUES (10318, 14, 5); -- CHR+5
INSERT INTO `item_mods` VALUES (10318, 30, 7); -- Magic Accuracy+7
INSERT INTO `item_mods` VALUES (10318, 27, -3); -- Enmity-3

-- -------------------------------------------------------
-- Chl. Gloves +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10319, 1, 27); -- DEF:27
INSERT INTO `item_mods` VALUES (10319, 5, 35); -- MP+35
INSERT INTO `item_mods` VALUES (10319, 8, -6); -- STR-6
INSERT INTO `item_mods` VALUES (10319, 9, -6); -- DEX-6
INSERT INTO `item_mods` VALUES (10319, 10, -6); -- VIT-6
INSERT INTO `item_mods` VALUES (10319, 11, -6); -- AGI-6
INSERT INTO `item_mods` VALUES (10319, 12, 6); -- INT+6
INSERT INTO `item_mods` VALUES (10319, 13, 6); -- MND+6
INSERT INTO `item_mods` VALUES (10319, 14, 6); -- CHR+6
INSERT INTO `item_mods` VALUES (10319, 30, 8); -- Magic Accuracy+8
INSERT INTO `item_mods` VALUES (10319, 27, -4); -- Enmity-4

-- -------------------------------------------------------
-- Enif Manopolas
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10320, 1, 30); -- DEF:30
INSERT INTO `item_mods` VALUES (10320, 2, 33); -- HP+33
INSERT INTO `item_mods` VALUES (10320, 5, 33); -- MP+33
INSERT INTO `item_mods` VALUES (10320, 25, 5); -- Accuracy+5
INSERT INTO `item_mods` VALUES (10320, 23, 5); -- Attack+5
INSERT INTO `item_mods` VALUES (10320, 27, 7); -- Enmity+7
INSERT INTO `item_mods` VALUES (10320, 384, 40); -- Haste+4%

-- -------------------------------------------------------
-- Adhara Gages
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10321, 1, 28); -- DEF:28
INSERT INTO `item_mods` VALUES (10321, 30, 6); -- Magic Accuracy+6
INSERT INTO `item_mods` VALUES (10321, 28, 6); -- "Magic Atk. Bonus"+6
INSERT INTO `item_mods` VALUES (10321, 27, -5); -- Enmity-5
INSERT INTO `item_mods` VALUES (10321, 371, -2); -- Avatar perpetuation cost -2
INSERT INTO `item_mods` VALUES (10321, 384, 20); -- Haste+2%

-- -------------------------------------------------------
-- Murzim Manopolas
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10322, 1, 30); -- DEF:30
INSERT INTO `item_mods` VALUES (10322, 2, 35); -- HP+35
INSERT INTO `item_mods` VALUES (10322, 5, 35); -- MP+35
INSERT INTO `item_mods` VALUES (10322, 23, 5); -- Attack+5
INSERT INTO `item_mods` VALUES (10322, 384, 40); -- Haste+4%

-- -------------------------------------------------------
-- Shedir Gages
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10323, 1, 28); -- DEF:28
INSERT INTO `item_mods` VALUES (10323, 82, 10); -- Sword skill +10
INSERT INTO `item_mods` VALUES (10323, 90, 10); -- Club skill +10
INSERT INTO `item_mods` VALUES (10323, 91, 10); -- Staff skill +10
INSERT INTO `item_mods` VALUES (10323, 111, 10); -- Divine magic skill +10
INSERT INTO `item_mods` VALUES (10323, 112, 10); -- Healing magic skill +10
INSERT INTO `item_mods` VALUES (10323, 114, 10); -- Enfeebling magic skill +10

-- -------------------------------------------------------
-- Leoht Gloves
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10324, 1, 39); -- DEF:39
INSERT INTO `item_mods` VALUES (10324, 11, 10); -- AGI+10
INSERT INTO `item_mods` VALUES (10324, 24, 15); -- Ranged Attack+15
INSERT INTO `item_mods` VALUES (10324, 68, 5); -- Evasion+5
INSERT INTO `item_mods` VALUES (10324, 289, 4); -- "Subtle Blow"+4

INSERT INTO `item_mods` VALUES (10325, 374, 5);

-- -------------------------------------------------------
-- Enif Cosciales
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10326, 1, 49); -- DEF:49
INSERT INTO `item_mods` VALUES (10326, 2, 40); -- HP+40
INSERT INTO `item_mods` VALUES (10326, 5, 40); -- MP+40
INSERT INTO `item_mods` VALUES (10326, 23, 6); -- Attack+6
INSERT INTO `item_mods` VALUES (10326, 25, 6); -- Accuracy+6
INSERT INTO `item_mods` VALUES (10326, 170, 1); -- Enhances "Fast Cast" effect
INSERT INTO `item_mods` VALUES (10326, 384, 51); -- Haste+5%

-- -------------------------------------------------------
-- Adhara Seraweels
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10327, 1, 40); -- DEF:40
INSERT INTO `item_mods` VALUES (10327, 27, -3); -- Enmity-3
INSERT INTO `item_mods` VALUES (10327, 30, 4); -- Magic Accuracy+4
INSERT INTO `item_mods` VALUES (10327, 111, 11); -- Divine magic skill +11
INSERT INTO `item_mods` VALUES (10327, 112, 11); -- Healing magic skill +11
INSERT INTO `item_mods` VALUES (10327, 114, 11); -- Enfeebling magic skill +11
INSERT INTO `item_mods` VALUES (10327, 384, 30); -- Haste+3%

-- -------------------------------------------------------
-- Murzim Cosciales
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10328, 1, 49); -- DEF:49
INSERT INTO `item_mods` VALUES (10328, 2, 36); -- HP+36
INSERT INTO `item_mods` VALUES (10328, 5, 36); -- MP+36
INSERT INTO `item_mods` VALUES (10328, 26, 16); -- Ranged Accuracy+16
INSERT INTO `item_mods` VALUES (10328, 24, 7); -- Ranged Attack+7
INSERT INTO `item_mods` VALUES (10328, 359, 5); -- Increases "Rapid Shot" activation rate

-- -------------------------------------------------------
-- Shedir Seraweels
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10329, 1, 40); -- DEF:40
INSERT INTO `item_mods` VALUES (10329, 54, 15); -- Elemental Fire resistance spells +15
INSERT INTO `item_mods` VALUES (10329, 55, 15); -- Elemental Ice resistance spells +15
INSERT INTO `item_mods` VALUES (10329, 56, 15); -- Elemental Wind resistance spells +15
INSERT INTO `item_mods` VALUES (10329, 57, 15); -- Elemental Earth resistance spells +15
INSERT INTO `item_mods` VALUES (10329, 58, 15); -- Elemental Thunder resistance spells +15
INSERT INTO `item_mods` VALUES (10329, 59, 15); -- Elemental Water resistance spells +15
INSERT INTO `item_mods` VALUES (10329, 60, 15); -- Elemental Light resistance spells +15
INSERT INTO `item_mods` VALUES (10329, 61, 15); -- Elemental Dark resistance spells +15
INSERT INTO `item_mods` VALUES (10329, 113, 15); -- Enhancing magic skill +15
-- [NOT CODED] Enhances "Stoneskin" effect
-- [NOT CODED] Enhances "Aquaveil" effect

INSERT INTO `item_mods` VALUES (10330, 1, 1);
INSERT INTO `item_mods` VALUES (10331, 1, 1);
INSERT INTO `item_mods` VALUES (10332, 1, 1);
INSERT INTO `item_mods` VALUES (10333, 1, 1);
INSERT INTO `item_mods` VALUES (10334, 1, 1);
INSERT INTO `item_mods` VALUES (10335, 1, 1);
INSERT INTO `item_mods` VALUES (10336, 1, 1);
INSERT INTO `item_mods` VALUES (10337, 1, 1);
INSERT INTO `item_mods` VALUES (10338, 1, 2);
INSERT INTO `item_mods` VALUES (10339, 1, 2);
INSERT INTO `item_mods` VALUES (10340, 1, 2);
INSERT INTO `item_mods` VALUES (10341, 1, 2);
INSERT INTO `item_mods` VALUES (10342, 1, 2);
INSERT INTO `item_mods` VALUES (10343, 1, 2);
INSERT INTO `item_mods` VALUES (10344, 1, 2);
INSERT INTO `item_mods` VALUES (10345, 1, 2);

-- -------------------------------------------------------
-- Dux Cuisses
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10346, 1, 55); -- DEF:55
INSERT INTO `item_mods` VALUES (10346, 8, 7); -- STR+7
INSERT INTO `item_mods` VALUES (10346, 23, 11); -- Attack+11
INSERT INTO `item_mods` VALUES (10346, 27, 5); -- Enmity+5
INSERT INTO `item_mods` VALUES (10346, 161, -4); -- Physical damage taken -4%

-- -------------------------------------------------------
-- Dux Cuisses +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10347, 1, 56); -- DEF:56
INSERT INTO `item_mods` VALUES (10347, 8, 8); -- STR+8
INSERT INTO `item_mods` VALUES (10347, 23, 12); -- Attack+12
INSERT INTO `item_mods` VALUES (10347, 27, 6); -- Enmity+6
INSERT INTO `item_mods` VALUES (10347, 161, -5); -- Physical damage taken -5%

-- -------------------------------------------------------
-- Chelona Trousers
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10348, 1, 46); -- DEF:46
INSERT INTO `item_mods` VALUES (10348, 5, 40); -- MP+40
INSERT INTO `item_mods` VALUES (10348, 8, -8); -- STR-8
INSERT INTO `item_mods` VALUES (10348, 9, -8); -- DEX-8
INSERT INTO `item_mods` VALUES (10348, 10, -8); -- VIT-8
INSERT INTO `item_mods` VALUES (10348, 11, -8); -- AGI-8
INSERT INTO `item_mods` VALUES (10348, 12, 8); -- INT+8
INSERT INTO `item_mods` VALUES (10348, 13, 8); -- MND+8
INSERT INTO `item_mods` VALUES (10348, 14, 8); -- CHR+8
INSERT INTO `item_mods` VALUES (10348, 27, -5); -- Enmity-5
INSERT INTO `item_mods` VALUES (10348, 487, 1); -- Bonus damage added to magic burst

-- -------------------------------------------------------
-- Chelona Trousers +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10349, 1, 47); -- DEF:47
INSERT INTO `item_mods` VALUES (10349, 5, 45); -- MP+45
INSERT INTO `item_mods` VALUES (10349, 8, -9); -- STR-9
INSERT INTO `item_mods` VALUES (10349, 9, -9); -- DEX-9
INSERT INTO `item_mods` VALUES (10349, 10, -9); -- VIT-9
INSERT INTO `item_mods` VALUES (10349, 11, -9); -- AGI-9
INSERT INTO `item_mods` VALUES (10349, 12, 9); -- INT+9
INSERT INTO `item_mods` VALUES (10349, 13, 9); -- MND+9
INSERT INTO `item_mods` VALUES (10349, 14, 9); -- CHR+9
INSERT INTO `item_mods` VALUES (10349, 27, -6); -- Enmity-6
INSERT INTO `item_mods` VALUES (10349, 487, 2); -- Bonus damage added to magic burst

-- -------------------------------------------------------
-- Wohpe's Sabots
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10350, 1, 24); -- DEF:24
INSERT INTO `item_mods` VALUES (10350, 5, 40); -- MP+40
INSERT INTO `item_mods` VALUES (10350, 12, 7); -- INT+7
INSERT INTO `item_mods` VALUES (10350, 13, 7); -- MND+7
INSERT INTO `item_mods` VALUES (10350, 30, 8); -- Magic Accuracy+8
INSERT INTO `item_mods` VALUES (10350, 27, -10); -- Enmity-10

-- -------------------------------------------------------
-- Ihwa Huaraches
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10351, 1, 28); -- DEF:28
INSERT INTO `item_mods` VALUES (10351, 12, 5); -- INT+5
INSERT INTO `item_mods` VALUES (10351, 35, 5); -- "Earth Magic Atk. Bonus"+5
INSERT INTO `item_mods` VALUES (10351, 43, 5); -- "Earth Magic Accuracy Bonus"+5
INSERT INTO `item_mods` VALUES (10351, 115, 10); -- Elemental magic skill +10

-- -------------------------------------------------------
-- Ghadhab Nails
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10352, 1, 22); -- DEF:22
INSERT INTO `item_mods` VALUES (10352, 23, 15); -- Attack+15
INSERT INTO `item_mods` VALUES (10352, 27, 5); -- Enmity+5
INSERT INTO `item_mods` VALUES (10352, 160, 2); -- Damage taken +2%
INSERT INTO `item_mods` VALUES (10352, 384, 30); -- Haste+3%

-- -------------------------------------------------------
-- Dux Greaves
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10363, 1, 30); -- DEF:30
INSERT INTO `item_mods` VALUES (10363, 10, 5); -- VIT+5
INSERT INTO `item_mods` VALUES (10363, 25, 9); -- Accuracy+9
INSERT INTO `item_mods` VALUES (10363, 27, 4); -- Enmity+4
INSERT INTO `item_mods` VALUES (10363, 161, -3); -- Physical damage taken -3%

-- -------------------------------------------------------
-- Dux Greaves +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10364, 1, 31); -- DEF:31
INSERT INTO `item_mods` VALUES (10364, 10, 6); -- VIT+6
INSERT INTO `item_mods` VALUES (10364, 25, 10); -- Accuracy+10
INSERT INTO `item_mods` VALUES (10364, 27, 5); -- Enmity+5
INSERT INTO `item_mods` VALUES (10364, 161, -4); -- Physical damage taken -4%

-- -------------------------------------------------------
-- Chelona Boots
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10365, 1, 23); -- DEF:23
INSERT INTO `item_mods` VALUES (10365, 5, 35); -- MP+35
INSERT INTO `item_mods` VALUES (10365, 8, -6); -- STR-6
INSERT INTO `item_mods` VALUES (10365, 9, -6); -- DEX-6
INSERT INTO `item_mods` VALUES (10365, 10, -6); -- VIT-6
INSERT INTO `item_mods` VALUES (10365, 11, -6); -- AGI-6
INSERT INTO `item_mods` VALUES (10365, 12, 6); -- INT+6
INSERT INTO `item_mods` VALUES (10365, 13, 6); -- MND+6
INSERT INTO `item_mods` VALUES (10365, 14, 6); -- CHR+6
INSERT INTO `item_mods` VALUES (10365, 71, 5); -- MP recovered while healing +5
INSERT INTO `item_mods` VALUES (10365, 170, 1); -- Enhances "Fast Cast" effect

-- -------------------------------------------------------
-- Chelona Boots +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10366, 1, 24); -- DEF:24
INSERT INTO `item_mods` VALUES (10366, 5, 40); -- MP+40
INSERT INTO `item_mods` VALUES (10366, 8, -7); -- STR-7
INSERT INTO `item_mods` VALUES (10366, 9, -7); -- DEX-7
INSERT INTO `item_mods` VALUES (10366, 10, -7); -- VIT-7
INSERT INTO `item_mods` VALUES (10366, 11, -7); -- AGI-7
INSERT INTO `item_mods` VALUES (10366, 12, 7); -- INT+7
INSERT INTO `item_mods` VALUES (10366, 13, 7); -- MND+7
INSERT INTO `item_mods` VALUES (10366, 14, 7); -- CHR+7
INSERT INTO `item_mods` VALUES (10366, 71, 6); -- MP recovered while healing +6
INSERT INTO `item_mods` VALUES (10366, 170, 1); -- Enhances "Fast Cast" effect

-- -------------------------------------------------------
-- Enif Gambieras
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10367, 1, 29); -- DEF:29
INSERT INTO `item_mods` VALUES (10367, 2, 48); -- HP+48
INSERT INTO `item_mods` VALUES (10367, 5, 48); -- MP+48
INSERT INTO `item_mods` VALUES (10367, 23, 6); -- Attack+6
INSERT INTO `item_mods` VALUES (10367, 25, 6); -- Accuracy+6
INSERT INTO `item_mods` VALUES (10367, 26, 6); -- Ranged Accuracy+6
INSERT INTO `item_mods` VALUES (10367, 384, 40); -- Haste+4%
-- [NOT CODED] Wyvern: HP+80

-- -------------------------------------------------------
-- Adhara Crackows
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10368, 1, 27); -- DEF:27
INSERT INTO `item_mods` VALUES (10368, 30, 3); -- Magic Accuracy+3
INSERT INTO `item_mods` VALUES (10368, 113, 8); -- Enhancing magic skill +8
INSERT INTO `item_mods` VALUES (10368, 115, 8); -- Elemental magic skill +8
INSERT INTO `item_mods` VALUES (10368, 117, 8); -- Summoning magic skill +8
INSERT INTO `item_mods` VALUES (10368, 296, 4); -- "Conserve MP"+4
INSERT INTO `item_mods` VALUES (10368, 384, 30); -- Haste+3%

-- -------------------------------------------------------
-- Murzim Gambieras
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10369, 1, 29); -- DEF:29
INSERT INTO `item_mods` VALUES (10369, 2, 35); -- HP+35
INSERT INTO `item_mods` VALUES (10369, 5, 35); -- MP+35
INSERT INTO `item_mods` VALUES (10369, 23, 12); -- Attack+12
INSERT INTO `item_mods` VALUES (10369, 27, 8); -- Enmity+8
INSERT INTO `item_mods` VALUES (10369, 384, 30); -- Haste+3%

-- -------------------------------------------------------
-- Shedir Crackows
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10370, 1, 29); -- DEF:29
-- [NOT CODED] "Blood Boon"+3
-- [NOT CODED] Avatar: Enhances magic accuracy
-- [NOT CODED] Avatar: Enhances "Magic Atk. Bonus"
-- [NOT CODED] Avatar: Increases "Blood Pact" damage

-- -------------------------------------------------------
-- Veikr Pumps
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10371, 1, 22); -- DEF:22
INSERT INTO `item_mods` VALUES (10371, 2, 25); -- HP+25
INSERT INTO `item_mods` VALUES (10371, 5, 25); -- MP+25
INSERT INTO `item_mods` VALUES (10371, 27, -3); -- Enmity-3
INSERT INTO `item_mods` VALUES (10371, 114, 12); -- Enfeebling magic skill +12
INSERT INTO `item_mods` VALUES (10371, 384, 20); -- Haste+2%

-- -------------------------------------------------------
-- Plumb Boots
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10372, 1, 49); -- DEF:49
INSERT INTO `item_mods` VALUES (10372, 161, -5); -- Physical damage taken -5%
INSERT INTO `item_mods` VALUES (10372, 169, -3); -- Decreases movement speed

-- -------------------------------------------------------
-- Ocular Boots
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10373, 1, 22); -- DEF:22
INSERT INTO `item_mods` VALUES (10373, 5, 40); -- MP+40
INSERT INTO `item_mods` VALUES (10373, 28, 5); -- "Magic Atk. Bonus"+5
INSERT INTO `item_mods` VALUES (10373, 115, 12); -- Elemental magic skill +12

-- -------------------------------------------------------
-- Dream Mittens
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10382, 1, 1); -- def 1

-- -------------------------------------------------------
-- Dream Mittens +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10383, 1, 2); -- def 2

-- -------------------------------------------------------
-- Orunmila's Torque
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10394, 5, 30); -- MP+30
INSERT INTO `item_mods` VALUES (10394, 27, -3); -- Enmity-3
INSERT INTO `item_mods` VALUES (10394, 30, 1); -- Magic Accuracy+1
INSERT INTO `item_mods` VALUES (10394, 170, 5); -- "Fast Cast" effect+5

-- -------------------------------------------------------
-- Lasaia Pendant
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10395, 1, 7); -- DEF:7
INSERT INTO `item_mods` VALUES (10395, 27, -8); -- Enmity-8
INSERT INTO `item_mods` VALUES (10395, 30, 1); -- Magic Accuracy+1

-- -------------------------------------------------------
-- Rioter's Collar
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10396, 25, 5); -- Accuracy+5
INSERT INTO `item_mods` VALUES (10396, 23, 5); -- Attack+5
INSERT INTO `item_mods` VALUES (10396, 288, 2); -- "Double Attack"+2%

-- -------------------------------------------------------
-- Ishtar's Collar
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10397, 25, 8); -- Accuracy+8
INSERT INTO `item_mods` VALUES (10397, 23, 8); -- Attack+8
INSERT INTO `item_mods` VALUES (10397, 68, 5); -- Evasion+5

-- -------------------------------------------------------
-- Weike Torque
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10398, 5, 25); -- MP+25
INSERT INTO `item_mods` VALUES (10398, 13, 2); -- MND+2
INSERT INTO `item_mods` VALUES (10398, 30, 2); -- Magic Accuracy+2
INSERT INTO `item_mods` VALUES (10398, 114, 7); -- Enfeebling magic skill +7

-- -------------------------------------------------------
-- Hrafn Coronet
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10400, 1, 40); -- DEF:40
INSERT INTO `item_mods` VALUES (10400, 2, 20); -- HP+20
INSERT INTO `item_mods` VALUES (10400, 5, 20); -- MP+20
INSERT INTO `item_mods` VALUES (10400, 8, 6); -- STR+6
INSERT INTO `item_mods` VALUES (10400, 9, 6); -- DEX+6
INSERT INTO `item_mods` VALUES (10400, 10, 6); -- VIT+6
INSERT INTO `item_mods` VALUES (10400, 23, 12); -- Attack+12
INSERT INTO `item_mods` VALUES (10400, 25, 12); -- Accuracy+12

-- -------------------------------------------------------
-- Tenryu Somen
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10401, 1, 35); -- DEF:35
INSERT INTO `item_mods` VALUES (10401, 8, 6); -- STR+6
INSERT INTO `item_mods` VALUES (10401, 11, 6); -- AGI+6
INSERT INTO `item_mods` VALUES (10401, 23, 9); -- Attack+9
INSERT INTO `item_mods` VALUES (10401, 25, 9); -- Accuracy+9
INSERT INTO `item_mods` VALUES (10401, 289, 7); -- "Subtle Blow"+7

-- -------------------------------------------------------
-- Kheper Bonnet
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10402, 1, 34); -- DEF:34
INSERT INTO `item_mods` VALUES (10402, 8, 9); -- STR+9
INSERT INTO `item_mods` VALUES (10402, 9, 9); -- DEX+9
INSERT INTO `item_mods` VALUES (10402, 25, 10); -- Accuracy+10
INSERT INTO `item_mods` VALUES (10402, 374, 5); -- "Waltz" potency +5%

-- -------------------------------------------------------
-- Auspex Coif
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10403, 1, 34); -- DEF:34
INSERT INTO `item_mods` VALUES (10403, 2, 50); -- MP+50
INSERT INTO `item_mods` VALUES (10403, 12, 5); -- INT+5
INSERT INTO `item_mods` VALUES (10403, 13, 7); -- MND+7
INSERT INTO `item_mods` VALUES (10403, 30, 7); -- Magic Accuracy+7

INSERT INTO `item_mods` VALUES (10404, 374, 8);

-- -------------------------------------------------------
-- Huginn Coronet
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10405, 1, 41); -- DEF:41
INSERT INTO `item_mods` VALUES (10405, 2, 30); -- HP+30
INSERT INTO `item_mods` VALUES (10405, 5, 30); -- MP+30
INSERT INTO `item_mods` VALUES (10405, 8, 9); -- STR+9
INSERT INTO `item_mods` VALUES (10405, 9, 9); -- DEX+9
INSERT INTO `item_mods` VALUES (10405, 10, 9); -- VIT+9
INSERT INTO `item_mods` VALUES (10405, 23, 15); -- Attack+15
INSERT INTO `item_mods` VALUES (10405, 25, 15); -- Accuracy+15

-- -------------------------------------------------------
-- Tenryu Somen +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10406, 1, 36); -- DEF:36
INSERT INTO `item_mods` VALUES (10406, 8, 9); -- STR+9
INSERT INTO `item_mods` VALUES (10406, 11, 9); -- AGI+9
INSERT INTO `item_mods` VALUES (10406, 23, 12); -- Attack+12
INSERT INTO `item_mods` VALUES (10406, 25, 12); -- Accuracy+12
INSERT INTO `item_mods` VALUES (10406, 289, 10); -- "Subtle Blow"+10

-- -------------------------------------------------------
-- Khepri Bonnet
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10407, 1, 35); -- DEF:35
INSERT INTO `item_mods` VALUES (10407, 8, 12); -- STR+12
INSERT INTO `item_mods` VALUES (10407, 9, 12); -- DEX+12
INSERT INTO `item_mods` VALUES (10407, 25, 13); -- Accuracy+13
INSERT INTO `item_mods` VALUES (10407, 374, 8); -- "Waltz" potency +8%

-- -------------------------------------------------------
-- Spurrina Coif
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10408, 1, 35); -- DEF:35
INSERT INTO `item_mods` VALUES (10408, 5, 60); -- MP+60
INSERT INTO `item_mods` VALUES (10408, 12, 8); -- INT+8
INSERT INTO `item_mods` VALUES (10408, 13, 10); -- MND+10
INSERT INTO `item_mods` VALUES (10408, 30, 10); -- Magic Accuracy+10

INSERT INTO `item_mods` VALUES (10409, 374, 11);

-- -------------------------------------------------------
-- Canute's Helm
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10416, 1, 40); -- DEF:40
INSERT INTO `item_mods` VALUES (10416, 23, 30); -- Attack+30
INSERT INTO `item_mods` VALUES (10416, 27, 4); -- Enmity+4
INSERT INTO `item_mods` VALUES (10416, 73, 5); -- "Store TP"+5

-- -------------------------------------------------------
-- Manea's Armet
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10417, 1, 43); -- DEF:43
INSERT INTO `item_mods` VALUES (10417, 5, 35); -- HP+35
INSERT INTO `item_mods` VALUES (10417, 8, 5); -- STR+5
INSERT INTO `item_mods` VALUES (10417, 23, 7); -- Attack+7
INSERT INTO `item_mods` VALUES (10417, 29, 5); -- "Magic Def. Bonus"+5

-- -------------------------------------------------------
-- Seiokona Beret
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10418, 1, 33); -- DEF:33
INSERT INTO `item_mods` VALUES (10418, 5, 30); -- MP+30
INSERT INTO `item_mods` VALUES (10418, 8, 4); -- STR+4
INSERT INTO `item_mods` VALUES (10418, 12, 4); -- INT+4
INSERT INTO `item_mods` VALUES (10418, 13, 4); -- MND+4
INSERT INTO `item_mods` VALUES (10418, 28, 6); -- "Magic Atk. Bonus"+6
INSERT INTO `item_mods` VALUES (10418, 30, 6); -- Magic Accuracy+6

INSERT INTO `item_mods` VALUES (10429, 1, 1);

-- -------------------------------------------------------
-- Decennial Crown
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10430, 1, 1); -- def 1

-- -------------------------------------------------------
-- Decennial Tiara
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10431, 1, 1); -- def 1

-- -------------------------------------------------------
-- Decennial Crown +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10432, 1, 2); -- def 2

-- -------------------------------------------------------
-- Decennial Tiara +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10433, 1, 2); -- def 2

-- -------------------------------------------------------
-- Dux Visor
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10434, 1, 40); -- DEF:40
INSERT INTO `item_mods` VALUES (10434, 8, 5); -- STR+5
INSERT INTO `item_mods` VALUES (10434, 23, 13); -- Attack+13
INSERT INTO `item_mods` VALUES (10434, 27, 3); -- Enmity+3
INSERT INTO `item_mods` VALUES (10434, 161, -3); -- Physical damage taken -3%

-- -------------------------------------------------------
-- Dux Visor +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10435, 1, 41); -- DEF:41
INSERT INTO `item_mods` VALUES (10435, 8, 6); -- STR+6
INSERT INTO `item_mods` VALUES (10435, 23, 14); -- Attack+14
INSERT INTO `item_mods` VALUES (10435, 27, 4); -- Enmity+4
INSERT INTO `item_mods` VALUES (10435, 161, -4); -- Physical damage taken -4%

-- -------------------------------------------------------
-- Chelona Hat
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10436, 1, 32); -- DEF:32
INSERT INTO `item_mods` VALUES (10436, 5, 40); -- MP+40
INSERT INTO `item_mods` VALUES (10436, 8, -7); -- STR-7
INSERT INTO `item_mods` VALUES (10436, 9, -7); -- DEX-7
INSERT INTO `item_mods` VALUES (10436, 10, -7); -- VIT-7
INSERT INTO `item_mods` VALUES (10436, 11, -7); -- AGI-7
INSERT INTO `item_mods` VALUES (10436, 12, 7); -- INT+7
INSERT INTO `item_mods` VALUES (10436, 13, 7); -- MND+7
INSERT INTO `item_mods` VALUES (10436, 14, 7); -- CHR+7
INSERT INTO `item_mods` VALUES (10436, 28, 5); -- "Magic Atk. Bonus"+5
INSERT INTO `item_mods` VALUES (10436, 27, -5); -- Enmity-5

-- -------------------------------------------------------
-- Chelona Hat +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10437, 1, 33); -- DEF:33
INSERT INTO `item_mods` VALUES (10437, 5, 45); -- MP+45
INSERT INTO `item_mods` VALUES (10437, 8, -8); -- STR-8
INSERT INTO `item_mods` VALUES (10437, 9, -8); -- DEX-8
INSERT INTO `item_mods` VALUES (10437, 10, -8); -- VIT-8
INSERT INTO `item_mods` VALUES (10437, 11, -8); -- AGI-8
INSERT INTO `item_mods` VALUES (10437, 12, 8); -- INT+8
INSERT INTO `item_mods` VALUES (10437, 13, 8); -- MND+8
INSERT INTO `item_mods` VALUES (10437, 14, 8); -- CHR+8
INSERT INTO `item_mods` VALUES (10437, 28, 6); -- "Magic Atk. Bonus"+6
INSERT INTO `item_mods` VALUES (10437, 27, -6); -- Enmity-6

-- -------------------------------------------------------
-- Enif Zucchetto
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10438, 1, 49); -- DEF:49
INSERT INTO `item_mods` VALUES (10438, 2, 35); -- HP+35
INSERT INTO `item_mods` VALUES (10438, 5, 35); -- MP+35
INSERT INTO `item_mods` VALUES (10438, 25, 7); -- Accuracy+7
INSERT INTO `item_mods` VALUES (10438, 23, 7); -- Attack+7
INSERT INTO `item_mods` VALUES (10438, 30, 7); -- Magic Accuracy+7
INSERT INTO `item_mods` VALUES (10438, 384, 51); -- Haste+5%

-- -------------------------------------------------------
-- Adhara Turban
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10439, 1, 38); -- DEF:38
INSERT INTO `item_mods` VALUES (10439, 30, 7); -- Magic Accuracy+7
INSERT INTO `item_mods` VALUES (10439, 28, 7); -- "Magic Atk. Bonus"+7
INSERT INTO `item_mods` VALUES (10439, 27, -6); -- Enmity-6
INSERT INTO `item_mods` VALUES (10439, 384, 30); -- Haste+3%
INSERT INTO `item_mods` VALUES (10439, 168, 20); -- Spell interruption rate down 20%

-- -------------------------------------------------------
-- Murzim Zucchetto
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10440, 1, 46); -- DEF:46
INSERT INTO `item_mods` VALUES (10440, 2, 42); -- HP+42
INSERT INTO `item_mods` VALUES (10440, 5, 42); -- MP+42
INSERT INTO `item_mods` VALUES (10440, 27, -6); -- Enmity-6
INSERT INTO `item_mods` VALUES (10440, 384, 51); -- Haste+5%
-- [NOT CODED] Automaton: Haste+6%

-- -------------------------------------------------------
-- Shedir Turban
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10441, 1, 38); -- DEF:38
INSERT INTO `item_mods` VALUES (10441, 30, 4); -- Magic Accuracy+4
INSERT INTO `item_mods` VALUES (10441, 119, 4); -- Singing skill +4
INSERT INTO `item_mods` VALUES (10441, 384, 51); -- Haste+5%
INSERT INTO `item_mods` VALUES (10441, 455, -3); -- Song recast delay -3

-- -------------------------------------------------------
-- Laeradr Helm
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10442, 1, 50); -- DEF:50
INSERT INTO `item_mods` VALUES (10442, 2, 75); -- HP+75
INSERT INTO `item_mods` VALUES (10442, 10, 13); -- VIT+13
INSERT INTO `item_mods` VALUES (10442, 160, -8); -- Damage taken -8%
INSERT INTO `item_mods` VALUES (10442, 384, -20); -- "Slow"+2%

-- -------------------------------------------------------
-- Bendis's Hairpin
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10443, 2, -40); -- HP-40
INSERT INTO `item_mods` VALUES (10443, 9, 10); -- DEX+10
INSERT INTO `item_mods` VALUES (10443, 11, 10); -- AGI+10
INSERT INTO `item_mods` VALUES (10443, 68, 8); -- Evasion+8
INSERT INTO `item_mods` VALUES (10443, 384, 61); -- Haste+6%

-- -------------------------------------------------------
-- Zouave's Beret
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10444, 1, 36); -- DEF:36
INSERT INTO `item_mods` VALUES (10444, 11, 6); -- AGI+6
INSERT INTO `item_mods` VALUES (10444, 27, -5); -- Enmity-5
INSERT INTO `item_mods` VALUES (10444, 66, 15); -- Ranged Attack+15
-- [NOT CODED] Boosts enmity decrease when taking damage

-- -------------------------------------------------------
-- Nemetona Cap
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10445, 1, 33); -- DEF:33
INSERT INTO `item_mods` VALUES (10445, 8, 13); -- STR+13
INSERT INTO `item_mods` VALUES (10445, 25, 7); -- Accuracy+7
INSERT INTO `item_mods` VALUES (10445, 23, 7); -- Attack+7
INSERT INTO `item_mods` VALUES (10445, 384, 61); -- Haste+6%

-- -------------------------------------------------------
-- Ahriman Cap
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10446, 61, 5); -- element dark +5

-- -------------------------------------------------------
-- Kahin Turban
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10448, 1, 28); -- DEF:28
INSERT INTO `item_mods` VALUES (10448, 5, 45); -- MP+45
INSERT INTO `item_mods` VALUES (10448, 13, 9); -- MND+9
INSERT INTO `item_mods` VALUES (10448, 30, 5); -- Magic Accuracy+5
INSERT INTO `item_mods` VALUES (10448, 111, 13); -- Divine magic skill +13

-- -------------------------------------------------------
-- Ogier's Surcoat
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10450, 1, 78); -- DEF:78
INSERT INTO `item_mods` VALUES (10450, 25, 20); -- Accuracy+20
INSERT INTO `item_mods` VALUES (10450, 27, 8); -- Enmity+8
INSERT INTO `item_mods` VALUES (10450, 163, -5); -- Magic damage taken -5%
INSERT INTO `item_mods` VALUES (10450, 384, 40); -- Haste+4%

-- -------------------------------------------------------
-- Athos's Tabard
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10451, 1, 63); -- DEF:63
INSERT INTO `item_mods` VALUES (10451, 9, 15); -- DEX+15
INSERT INTO `item_mods` VALUES (10451, 11, 15); -- AGI+15
INSERT INTO `item_mods` VALUES (10451, 25, 7); -- Accuracy+7
INSERT INTO `item_mods` VALUES (10451, 68, 7); -- Evasion+7
INSERT INTO `item_mods` VALUES (10451, 421, 5); -- Increases critical hit damage

INSERT INTO `item_mods` VALUES (10452, 369, 1);

-- -------------------------------------------------------
-- Asura Samue
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10454, 1, 60); -- DEF:60
INSERT INTO `item_mods` VALUES (10454, 10, 6); -- VIT+6
INSERT INTO `item_mods` VALUES (10454, 27, 5); -- Enmity+5
INSERT INTO `item_mods` VALUES (10454, 73, 4); -- "Store TP"+4
INSERT INTO `item_mods` VALUES (10454, 289, 5); -- "Subtle Blow"+5

INSERT INTO `item_mods` VALUES (10455, 73, 8);
INSERT INTO `item_mods` VALUES (10467, 369, 1);
INSERT INTO `item_mods` VALUES (10468, 370, 3);

-- -------------------------------------------------------
-- Eirene's Manteel
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10469, 1, 55); -- DEF:55
INSERT INTO `item_mods` VALUES (10469, 27, -10); -- Enmity-10
INSERT INTO `item_mods` VALUES (10469, 28, 13); -- "Magic Atk. Bonus"+13
INSERT INTO `item_mods` VALUES (10469, 30, 7); -- Magic Accuracy+7
INSERT INTO `item_mods` VALUES (10469, 170, 55); -- Enhances "Fast Cast"

-- -------------------------------------------------------
-- Rheic Korazin
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10470, 1, 68); -- DEF:68
INSERT INTO `item_mods` VALUES (10470, 8, 12); -- STR+12
INSERT INTO `item_mods` VALUES (10470, 62, 3); -- Attack+3%

-- -------------------------------------------------------
-- Rheic Korazin +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10471, 1, 68); -- DEF:68
INSERT INTO `item_mods` VALUES (10471, 8, 12); -- STR+12
INSERT INTO `item_mods` VALUES (10471, 28, 1); -- "Magic Atk. Bonus"+1
INSERT INTO `item_mods` VALUES (10471, 62, 3); -- Attack+3%

-- -------------------------------------------------------
-- Rheic Korazin +2
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10472, 1, 69); -- DEF:69
INSERT INTO `item_mods` VALUES (10472, 8, 12); -- STR+12
INSERT INTO `item_mods` VALUES (10472, 28, 3); -- "Magic Atk. Bonus"+3
INSERT INTO `item_mods` VALUES (10472, 62, 3); -- Attack+3%
-- [NOT CODED] Increases weapon skill damage

-- -------------------------------------------------------
-- Rheic Korazin +3
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10473, 1, 69); -- DEF:69
INSERT INTO `item_mods` VALUES (10473, 8, 14); -- STR+14
INSERT INTO `item_mods` VALUES (10473, 28, 5); -- "Magic Atk. Bonus"+5
INSERT INTO `item_mods` VALUES (10473, 62, 4); -- Attack+4%
-- [NOT CODED] Increases weapon skill damage

-- -------------------------------------------------------
-- Phorcys Korazin
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10474, 1, 70); -- DEF:70
INSERT INTO `item_mods` VALUES (10474, 8, 16); -- STR+16
INSERT INTO `item_mods` VALUES (10474, 28, 7); -- "Magic Atk. Bonus"+7
INSERT INTO `item_mods` VALUES (10474, 62, 5); -- Attack+5%
-- [NOT CODED] Increases weapon skill damage

-- -------------------------------------------------------
-- Euxine Coat
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10475, 1, 61); -- DEF:61
INSERT INTO `item_mods` VALUES (10475, 25, 10); -- Accuracy+10
INSERT INTO `item_mods` VALUES (10475, 384, 20); -- Haste+2%

-- -------------------------------------------------------
-- Euxine Coat +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10476, 1, 61); -- DEF:61
INSERT INTO `item_mods` VALUES (10476, 25, 10); -- Accuracy+10
INSERT INTO `item_mods` VALUES (10476, 288, 1); -- "Double Attack"+1%
INSERT INTO `item_mods` VALUES (10476, 384, 20); -- Haste+2%

-- -------------------------------------------------------
-- Euxine Coat +2
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10477, 1, 62); -- DEF:62
INSERT INTO `item_mods` VALUES (10477, 25, 10); -- Accuracy+10
INSERT INTO `item_mods` VALUES (10477, 288, 1); -- "Double Attack"+1%
INSERT INTO `item_mods` VALUES (10477, 302, 1); -- "Triple Attack"+1%
INSERT INTO `item_mods` VALUES (10477, 384, 30); -- Haste+3%
INSERT INTO `item_mods` VALUES (10477, 430, 1); -- "Quadruple Attack"+1%

-- -------------------------------------------------------
-- Euxine Coat +3
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10478, 1, 62); -- DEF:62
INSERT INTO `item_mods` VALUES (10478, 25, 10); -- Accuracy+10
INSERT INTO `item_mods` VALUES (10478, 288, 2); -- "Double Attack"+2%
INSERT INTO `item_mods` VALUES (10478, 302, 2); -- "Triple Attack"+2%
INSERT INTO `item_mods` VALUES (10478, 384, 30); -- Haste+3%
INSERT INTO `item_mods` VALUES (10478, 430, 2); -- "Quadruple Attack"+2%

-- -------------------------------------------------------
-- Thaumas Coat
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10479, 1, 63); -- DEF:63
INSERT INTO `item_mods` VALUES (10479, 25, 12); -- Accuracy+12
INSERT INTO `item_mods` VALUES (10479, 288, 3); -- "Double Attack"+3%
INSERT INTO `item_mods` VALUES (10479, 384, 40); -- Haste+4%
INSERT INTO `item_mods` VALUES (10479, 302, 3); -- "Triple Attack"+3%
INSERT INTO `item_mods` VALUES (10479, 430, 3); -- "Quadruple Attack"+3%

-- -------------------------------------------------------
-- Tethyan Saio
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10480, 1, 51); -- DEF:51
INSERT INTO `item_mods` VALUES (10480, 12, 7); -- INT+7
INSERT INTO `item_mods` VALUES (10480, 13, 7); -- MND+7

-- -------------------------------------------------------
-- Tethyan Saio +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10481, 1, 51); -- DEF:51
INSERT INTO `item_mods` VALUES (10481, 12, 7); -- INT+7
INSERT INTO `item_mods` VALUES (10481, 13, 7); -- MND+7
INSERT INTO `item_mods` VALUES (10481, 14, 7); -- CHR+7

-- -------------------------------------------------------
-- Tethyan Saio +2
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10482, 1, 52); -- DEF:52
INSERT INTO `item_mods` VALUES (10482, 12, 7); -- INT+7
INSERT INTO `item_mods` VALUES (10482, 13, 7); -- MND+7
INSERT INTO `item_mods` VALUES (10482, 14, 7); -- CHR+7
INSERT INTO `item_mods` VALUES (10482, 27, -1); -- Enmity-1
INSERT INTO `item_mods` VALUES (10482, 28, 4); -- "Magic Atk. Bonus"+4
INSERT INTO `item_mods` VALUES (10482, 30, 10); -- Magic Accuracy+10

-- -------------------------------------------------------
-- Tethyan Saio +3
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10483, 1, 52); -- DEF:52
INSERT INTO `item_mods` VALUES (10483, 12, 8); -- INT+8
INSERT INTO `item_mods` VALUES (10483, 13, 8); -- MND+8
INSERT INTO `item_mods` VALUES (10483, 14, 8); -- CHR+8
INSERT INTO `item_mods` VALUES (10483, 27, -3); -- Enmity-3
INSERT INTO `item_mods` VALUES (10483, 28, 6); -- "Magic Atk. Bonus"+6
INSERT INTO `item_mods` VALUES (10483, 30, 12); -- Magic Accuracy+12

-- -------------------------------------------------------
-- Nares Saio
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10484, 1, 53); -- DEF:53
INSERT INTO `item_mods` VALUES (10484, 12, 9); -- INT+9
INSERT INTO `item_mods` VALUES (10484, 13, 9); -- MND+9
INSERT INTO `item_mods` VALUES (10484, 14, 9); -- CHR+9
INSERT INTO `item_mods` VALUES (10484, 27, -5); -- Enmity-5
INSERT INTO `item_mods` VALUES (10484, 28, 8); -- "Magic Atk. Bonus"+8
INSERT INTO `item_mods` VALUES (10484, 30, 14); -- Magic Accuracy+14
-- [NOT CODED] Set: Increases STR, INT, MND, CHR

-- -------------------------------------------------------
-- Tessera Saio
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10485, 1, 66); -- DEF:66
INSERT INTO `item_mods` VALUES (10485, 8, 13); -- STR+13
INSERT INTO `item_mods` VALUES (10485, 9, 13); -- DEX+13
INSERT INTO `item_mods` VALUES (10485, 11, 13); -- AGI+13
INSERT INTO `item_mods` VALUES (10485, 23, 17); -- Attack+17
INSERT INTO `item_mods` VALUES (10485, 24, 17); -- Ranged Attack+17
INSERT INTO `item_mods` VALUES (10485, 28, 5); -- "Magic Atk. Bonus"+5
INSERT INTO `item_mods` VALUES (10485, 384, 30); -- Haste+3%

-- -------------------------------------------------------
-- Porthos Byrnie
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10486, 1, 68); -- DEF:68
INSERT INTO `item_mods` VALUES (10486, 2, 45); -- HP+45
INSERT INTO `item_mods` VALUES (10486, 23, 10); -- Attack+10
INSERT INTO `item_mods` VALUES (10486, 302, 2); -- "Triple Attack"+2%
INSERT INTO `item_mods` VALUES (10486, 384, 51); -- Haste+5%

-- -------------------------------------------------------
-- Hedera Cotehardie
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10487, 1, 52); -- DEF:52
INSERT INTO `item_mods` VALUES (10487, 2, 60); -- HP+60
INSERT INTO `item_mods` VALUES (10487, 5, 60); -- MP+60
INSERT INTO `item_mods` VALUES (10487, 30, 10); -- Magic Accuracy+10
INSERT INTO `item_mods` VALUES (10487, 296, 6); -- "Conserve MP"+6
INSERT INTO `item_mods` VALUES (10487, 384, 51); -- Haste+5%

-- -------------------------------------------------------
-- Kudzu Aketon
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10488, 1, 60); -- DEF:60
INSERT INTO `item_mods` VALUES (10488, 8, 10); -- STR+10
INSERT INTO `item_mods` VALUES (10488, 11, 10); -- AGI+10
INSERT INTO `item_mods` VALUES (10488, 23, 13); -- Attack+13
INSERT INTO `item_mods` VALUES (10488, 24, 13); -- Ranged Attack+13
INSERT INTO `item_mods` VALUES (10488, 288, 3); -- "Double Attack"+3%
INSERT INTO `item_mods` VALUES (10488, 73, 5); -- "Store TP"+5

-- -------------------------------------------------------
-- Huginn Haubert
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10489, 1, 79); -- DEF:79
INSERT INTO `item_mods` VALUES (10489, 2, 50); -- HP+50
INSERT INTO `item_mods` VALUES (10489, 5, 50); -- MP+50
INSERT INTO `item_mods` VALUES (10489, 8, 13); -- STR+13
INSERT INTO `item_mods` VALUES (10489, 10, 13); -- VIT+13
INSERT INTO `item_mods` VALUES (10489, 23, 23); -- Attack+23
INSERT INTO `item_mods` VALUES (10489, 160, -7); -- Damage taken -7%

-- -------------------------------------------------------
-- Tenryu Domaru +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10490, 1, 63); -- DEF:63
INSERT INTO `item_mods` VALUES (10490, 8, 9); -- STR+9
INSERT INTO `item_mods` VALUES (10490, 11, 9); -- AGI+9
INSERT INTO `item_mods` VALUES (10490, 25, 10); -- Accuracy+20
INSERT INTO `item_mods` VALUES (10490, 68, 10); -- Evasion+10
INSERT INTO `item_mods` VALUES (10490, 73, 8); -- "Store TP"+8

INSERT INTO `item_mods` VALUES (10491, 370, 2);
INSERT INTO `item_mods` VALUES (10492, 369, 1);

-- -------------------------------------------------------
-- Iaso Bliaut
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10493, 1, 54); -- DEF:54
INSERT INTO `item_mods` VALUES (10493, 111, 18); -- Divine magic skill +18
INSERT INTO `item_mods` VALUES (10493, 112, 18); -- Healing magic skill +18
INSERT INTO `item_mods` VALUES (10493, 114, 18); -- Enfeebling magic skill +18
INSERT INTO `item_mods` VALUES (10493, 384, 40); -- Haste+4%
-- [NOT CODED] INSERT INTO `item_mods` VALUES (10493, 1, -5); -- Healing magic casting time -5%

INSERT INTO `item_mods` VALUES (10500, 73, 10);

-- -------------------------------------------------------
-- Nomkahpa Mittens
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10505, 1, 28); -- DEF:28
INSERT INTO `item_mods` VALUES (10505, 8, 5); -- STR+5
INSERT INTO `item_mods` VALUES (10505, 288, 3); -- "Double Attack"+3%
INSERT INTO `item_mods` VALUES (10505, 384, 30); -- Haste+3%

INSERT INTO `item_mods` VALUES (10552, 73, 2);
INSERT INTO `item_mods` VALUES (10562, 374, 3);
INSERT INTO `item_mods` VALUES (10563, 374, 5);
INSERT INTO `item_mods` VALUES (10564, 369, 1);
INSERT INTO `item_mods` VALUES (10564, 374, 7);

-- -------------------------------------------------------
-- Decennial Tights
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10593, 1, 1); -- def 1

-- -------------------------------------------------------
-- Decennial Hose
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10594, 1, 1); -- def 1

-- -------------------------------------------------------
-- Decennial Tights +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10595, 1, 2); -- def 2

-- -------------------------------------------------------
-- Decennial Hose +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10596, 1, 2); -- def 2

INSERT INTO `item_mods` VALUES (10635, 374, 1);
INSERT INTO `item_mods` VALUES (10640, 374, 4);

-- -------------------------------------------------------
-- Areion Boots
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10647, 1, 4); -- DEF:4
INSERT INTO `item_mods` VALUES (10647, 11, 2); -- AGI+2
INSERT INTO `item_mods` VALUES (10647, 169, 12); -- Movement speed +12%

-- -------------------------------------------------------
-- Areion Boots +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10648, 1, 5); -- DEF:5
INSERT INTO `item_mods` VALUES (10648, 11, 3); -- AGI+3
INSERT INTO `item_mods` VALUES (10648, 169, 12); -- Movement speed +12%

INSERT INTO `item_mods` VALUES (10650, 1, 36);
INSERT INTO `item_mods` VALUES (10650, 8, 8);
INSERT INTO `item_mods` VALUES (10650, 9, 8);
INSERT INTO `item_mods` VALUES (10650, 110, 9);
INSERT INTO `item_mods` VALUES (10650, 483, 20);
INSERT INTO `item_mods` VALUES (10654, 369, 2);
INSERT INTO `item_mods` VALUES (10663, 1, 33);
INSERT INTO `item_mods` VALUES (10663, 2, 22);
INSERT INTO `item_mods` VALUES (10663, 8, 7);
INSERT INTO `item_mods` VALUES (10663, 10, 7);
INSERT INTO `item_mods` VALUES (10663, 23, 4);
INSERT INTO `item_mods` VALUES (10663, 402, 43);
INSERT INTO `item_mods` VALUES (10667, 370, 2);
INSERT INTO `item_mods` VALUES (10671, 370, 2);
INSERT INTO `item_mods` VALUES (10672, 369, 2);
INSERT INTO `item_mods` VALUES (10673, 369, 2);
INSERT INTO `item_mods` VALUES (10681, 73, 7);
INSERT INTO `item_mods` VALUES (10685, 369, 2);
INSERT INTO `item_mods` VALUES (10687, 73, 10);
INSERT INTO `item_mods` VALUES (10695, 303, 2);
INSERT INTO `item_mods` VALUES (10696, 385, 12);

-- ------------------------------------------
-- Saotome Haidate +2
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (10721, 1, 52);
INSERT INTO `item_mods` VALUES (10721, 8, 6);
INSERT INTO `item_mods` VALUES (10721, 11, 6);
INSERT INTO `item_mods` VALUES (10721, 23, 8);
INSERT INTO `item_mods` VALUES (10721, 68, 8);
INSERT INTO `item_mods` VALUES (10721, 508, 25);

INSERT INTO `item_mods` VALUES (10738, 364, 30);
INSERT INTO `item_mods` VALUES (10753, 370, 2);
INSERT INTO `item_mods` VALUES (10764, 370, 1);
INSERT INTO `item_mods` VALUES (10787, 375, 3);

-- -------------------------------------------------------
-- Eihwaz Ring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10798, 2, 70); -- HP+70
INSERT INTO `item_mods` VALUES (10798, 27, 5); -- Enmity+5
INSERT INTO `item_mods` VALUES (10798, 255, 5); -- Enhances resistance against "Death"

INSERT INTO `item_mods` VALUES (10806, 375, 15);

-- -------------------------------------------------------
-- Mandraguard
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10807, 1, 1); -- DEF:1
INSERT INTO `item_mods` VALUES (10807, 14, 1); -- CHR+1

-- -------------------------------------------------------
-- Janus Guard
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10808, 1, 1); -- DEF:1

-- -------------------------------------------------------
-- Moogle Guard
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10809, 1, 1); -- DEF:1

-- -------------------------------------------------------
-- Moogle Guard +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10810, 1, 2); -- DEF:2

-- -------------------------------------------------------
-- Chocobo Shield
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10811, 1, 1); -- DEF:1

-- -------------------------------------------------------
-- Choco. Shield +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10812, 1, 2); -- DEF:2

INSERT INTO `item_mods` VALUES (10816, 1, 9);
INSERT INTO `item_mods` VALUES (10816, 2, 30);
INSERT INTO `item_mods` VALUES (10816, 402, 5);
INSERT INTO `item_mods` VALUES (10864, 370, 1);
INSERT INTO `item_mods` VALUES (10867, 370, 1);

-- -------------------------------------------------------
-- Snowman Cap
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10875, 1, 1); -- DEF:1
INSERT INTO `item_mods` VALUES (10875, 54, -12); -- [Element: Fire]-12
INSERT INTO `item_mods` VALUES (10875, 55, 12); -- [Element: Ice]+12

INSERT INTO `item_mods` VALUES (10879, 73, 7);
INSERT INTO `item_mods` VALUES (10914, 1, 6);
INSERT INTO `item_mods` VALUES (10914, 27, 2);
-- INSERT INTO `item_mods` VALUES (10914, ???, -2); TODO: Pet Emnity
INSERT INTO `item_mods` VALUES (10915, 1, 7);
INSERT INTO `item_mods` VALUES (10915, 27, 3);
-- INSERT INTO `item_mods` VALUES (10915, ???, -3); TODO: Pet Emnity
INSERT INTO `item_mods` VALUES (10916, 12, 1);
INSERT INTO `item_mods` VALUES (10916, 13, 1);
INSERT INTO `item_mods` VALUES (10916, 27, -3);
INSERT INTO `item_mods` VALUES (10917, 12, 2);
INSERT INTO `item_mods` VALUES (10917, 13, 2);
INSERT INTO `item_mods` VALUES (10917, 27, -4);

-- -------------------------------------------------------
-- Tandem Necklace
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10918, 1, 5); -- DEF:5

-- -------------------------------------------------------
-- Tndm. Necklace +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10919, 1, 6); -- DEF:6

-- -------------------------------------------------------
-- Tndm. Necklace +2
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10920, 1, 7); -- DEF:7

-- -------------------------------------------------------
-- Tndm. Necklace +3
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10921, 1, 8); -- DEF:8

-- -------------------------------------------------------
-- Tndm. Necklace +4
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10922, 1, 9); -- DEF:9

-- -------------------------------------------------------
-- Chocobo Torque
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10924, 511, 4); -- Chocobo riding time +4 min

INSERT INTO `item_mods` VALUES (10929, 1, 10);
INSERT INTO `item_mods` VALUES (10929, 10, 9);
INSERT INTO `item_mods` VALUES (10929, 246, 2); -- TODO: Confirm Amount
INSERT INTO `item_mods` VALUES (10930, 161, -4);
INSERT INTO `item_mods` VALUES (10931, 25, 6);
-- INSERT INTO `item_mods` VALUES (10931, ???, ?); TODO: Tonberry's Grudge
INSERT INTO `item_mods` VALUES (10932, 68, 5);
INSERT INTO `item_mods` VALUES (10932, 161, -2);
INSERT INTO `item_mods` VALUES (10936, 370, 2);
INSERT INTO `item_mods` VALUES (10946, 369, 1);

-- -------------------------------------------------------
-- Smithy's Torque
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10949, 129, 2); -- Smithing skill +2

-- -------------------------------------------------------
-- Tanner's Torque
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10952, 132, 2); -- Leathercraft skill +2

-- -------------------------------------------------------
-- Boneworker's Torque
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10953, 133, 2); -- Bonecraft skill +2

-- -------------------------------------------------------
-- Alchemst. Torque
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (10954, 134, 2); -- Alchemy skill +2

INSERT INTO `item_mods` VALUES (10960, 374, 4);
INSERT INTO `item_mods` VALUES (10960, 375, 4);
INSERT INTO `item_mods` VALUES (10964, 1, 9);
INSERT INTO `item_mods` VALUES (10964, 2, -15);
INSERT INTO `item_mods` VALUES (10964, 5, 20);
INSERT INTO `item_mods` VALUES (10964, 12, 4);
INSERT INTO `item_mods` VALUES (10964, 13, 4);
INSERT INTO `item_mods` VALUES (10965, 1, 10);
INSERT INTO `item_mods` VALUES (10965, 2, -10);
INSERT INTO `item_mods` VALUES (10965, 5, 25);
INSERT INTO `item_mods` VALUES (10965, 12, 5);
INSERT INTO `item_mods` VALUES (10965, 13, 5);
INSERT INTO `item_mods` VALUES (10966, 1, 12);
INSERT INTO `item_mods` VALUES (10966, 9, 4);
INSERT INTO `item_mods` VALUES (10966, 11, 4);
INSERT INTO `item_mods` VALUES (10966, 14, 4);
INSERT INTO `item_mods` VALUES (10967, 1, 13);
INSERT INTO `item_mods` VALUES (10967, 9, 5);
INSERT INTO `item_mods` VALUES (10967, 11, 5);
INSERT INTO `item_mods` VALUES (10967, 14, 5);
INSERT INTO `item_mods` VALUES (10968, 1, 13);
INSERT INTO `item_mods` VALUES (10968, 2, 20);
INSERT INTO `item_mods` VALUES (10968, 5, -15);
INSERT INTO `item_mods` VALUES (10968, 8, 4);
INSERT INTO `item_mods` VALUES (10968, 9, 4);
INSERT INTO `item_mods` VALUES (10969, 1, 14);
INSERT INTO `item_mods` VALUES (10969, 2, 25);
INSERT INTO `item_mods` VALUES (10969, 5, -10);
INSERT INTO `item_mods` VALUES (10969, 8, 5);
INSERT INTO `item_mods` VALUES (10969, 9, 5);
INSERT INTO `item_mods` VALUES (10970, 370, 2);
INSERT INTO `item_mods` VALUES (10972, 1, 14);
INSERT INTO `item_mods` VALUES (10972, 10, 5);
-- INSERT INTO `item_mods` VALUES (10972, ???, -3); TODO: Pet Physical Damage Taken
INSERT INTO `item_mods` VALUES (10973, 1, 8);
INSERT INTO `item_mods` VALUES (10973, 30, 5);
INSERT INTO `item_mods` VALUES (10973, 233, 1); -- TODO: Confirm Amount
INSERT INTO `item_mods` VALUES (10974, 1, 9);
INSERT INTO `item_mods` VALUES (10974, 31, 5);
-- INSERT INTO `item_mods` VALUES (10974, ???, -1); TODO: Ninjutsu Recast
INSERT INTO `item_mods` VALUES (10986, 374, 4);
INSERT INTO `item_mods` VALUES (10989, 374, 4);
INSERT INTO `item_mods` VALUES (11005, 374, 2);
INSERT INTO `item_mods` VALUES (11008, 374, 2);

-- -------------------------------------------------------
-- Shaper's Shawl
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11009, 1, 1); -- DEF:1
-- [NOT CODED] Increases synthesis skill gain rate

INSERT INTO `item_mods` VALUES (11014, 8, 3);
INSERT INTO `item_mods` VALUES (11014, 13, -1);
INSERT INTO `item_mods` VALUES (11014, 54, 15);
INSERT INTO `item_mods` VALUES (11015, 8, -1);
INSERT INTO `item_mods` VALUES (11015, 12, 3);
INSERT INTO `item_mods` VALUES (11015, 55, 15);
INSERT INTO `item_mods` VALUES (11016, 11, 3);
INSERT INTO `item_mods` VALUES (11016, 12, -1);
INSERT INTO `item_mods` VALUES (11016, 56, 15);
INSERT INTO `item_mods` VALUES (11017, 10, 3);
INSERT INTO `item_mods` VALUES (11017, 11, -1);
INSERT INTO `item_mods` VALUES (11017, 57, 15);
INSERT INTO `item_mods` VALUES (11018, 9, 3);
INSERT INTO `item_mods` VALUES (11018, 10, -1);
INSERT INTO `item_mods` VALUES (11018, 58, 15);
INSERT INTO `item_mods` VALUES (11019, 9, -1);
INSERT INTO `item_mods` VALUES (11019, 13, 3);
INSERT INTO `item_mods` VALUES (11019, 59, 15);
INSERT INTO `item_mods` VALUES (11020, 2, 20);
INSERT INTO `item_mods` VALUES (11020, 5, -7);
INSERT INTO `item_mods` VALUES (11020, 60, 15);
INSERT INTO `item_mods` VALUES (11021, 2, -7);
INSERT INTO `item_mods` VALUES (11021, 5, 20);
INSERT INTO `item_mods` VALUES (11021, 61, 15);
INSERT INTO `item_mods` VALUES (11022, 8, 4);
INSERT INTO `item_mods` VALUES (11022, 54, 17);
INSERT INTO `item_mods` VALUES (11022, 55, 17);
INSERT INTO `item_mods` VALUES (11023, 12, 4);
INSERT INTO `item_mods` VALUES (11023, 55, 17);
INSERT INTO `item_mods` VALUES (11023, 56, 17);
INSERT INTO `item_mods` VALUES (11024, 11, 4);
INSERT INTO `item_mods` VALUES (11024, 56, 17);
INSERT INTO `item_mods` VALUES (11024, 57, 17);
INSERT INTO `item_mods` VALUES (11025, 10, 4);
INSERT INTO `item_mods` VALUES (11025, 57, 17);
INSERT INTO `item_mods` VALUES (11025, 58, 17);
INSERT INTO `item_mods` VALUES (11026, 9, 4);
INSERT INTO `item_mods` VALUES (11026, 58, 17);
INSERT INTO `item_mods` VALUES (11026, 59, 17);
INSERT INTO `item_mods` VALUES (11027, 13, 4);
INSERT INTO `item_mods` VALUES (11027, 54, 17);
INSERT INTO `item_mods` VALUES (11027, 59, 17);
INSERT INTO `item_mods` VALUES (11028, 2, 24);
INSERT INTO `item_mods` VALUES (11028, 27, -4);
INSERT INTO `item_mods` VALUES (11028, 60, 17);
INSERT INTO `item_mods` VALUES (11029, 5, 24);
INSERT INTO `item_mods` VALUES (11029, 27, 4);
INSERT INTO `item_mods` VALUES (11029, 61, 17);
INSERT INTO `item_mods` VALUES (11030, 2, 15);
INSERT INTO `item_mods` VALUES (11030, 374, 5);
INSERT INTO `item_mods` VALUES (11030, 375, 5); -- Cure Received +5%
INSERT INTO `item_mods` VALUES (11031, 24, 3);
INSERT INTO `item_mods` VALUES (11031, 27, -2);
INSERT INTO `item_mods` VALUES (11032, 29, 2);
INSERT INTO `item_mods` VALUES (11032, 289, 4);

-- -------------------------------------------------------
-- Rebel Earring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11042, 8, 2); -- STR+2
INSERT INTO `item_mods` VALUES (11042, 9, -1); -- DEX-1
INSERT INTO `item_mods` VALUES (11042, 11, -1); -- AGI-1

-- -------------------------------------------------------
-- Giant's Earring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11043, 2, 10); -- HP+10
INSERT INTO `item_mods` VALUES (11043, 8, 1); -- STR+1

-- -------------------------------------------------------
-- Tantra Crown +2
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11065, 1, 36); -- def
INSERT INTO `item_mods` VALUES (11065, 8, 7); -- STR
INSERT INTO `item_mods` VALUES (11065, 289, 10); -- subtle blow
INSERT INTO `item_mods` VALUES (11065, 384, 71); -- Haste gear
INSERT INTO `item_mods` VALUES (11065, 428, 20); -- TODO: Perfect counter: Raises weapon damage by 20 when countering while under the Perfect Counter effect. This also affects Weapon Rank (though not if fighting barehanded).

INSERT INTO `item_mods` VALUES (11066, 374, 10);

-- -------------------------------------------------------
-- Creed Armet +2
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11070, 1, 44); -- def
INSERT INTO `item_mods` VALUES (11070, 2, 40); -- HP
INSERT INTO `item_mods` VALUES (11070, 5, 40); -- MP
INSERT INTO `item_mods` VALUES (11070, 109, 7); -- Shield skill
INSERT INTO `item_mods` VALUES (11070, 426, 5); -- Absorbs a percentage of damage taken to MP
INSERT INTO `item_mods` VALUES (11070, 170, 5); -- fastcast

INSERT INTO `item_mods` VALUES (11073, 438, 1);

-- -------------------------------------------------------
-- Sylvan Gapette +2
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11074, 1, 34); -- def
INSERT INTO `item_mods` VALUES (11074, 24, 13); -- ranged attack
INSERT INTO `item_mods` VALUES (11074, 26, 13); -- ranged accuracy
INSERT INTO `item_mods` VALUES (11074, 289, 10); -- subtle blow
INSERT INTO `item_mods` VALUES (11074, 365, 5); -- Snap shot (Ranged delay decrease)
INSERT INTO `item_mods` VALUES (11074, 422, 5); -- Double shot proc rate

INSERT INTO `item_mods` VALUES (11075, 73, 8);

-- -------------------------------------------------------
-- Iga zukin +2
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11076, 1, 37); -- def
INSERT INTO `item_mods` VALUES (11076, 9, 10); -- dex
INSERT INTO `item_mods` VALUES (11076, 384, 61); -- haste
INSERT INTO `item_mods` VALUES (11076, 259, 5); -- dual wield

INSERT INTO `item_mods` VALUES (11078, 369, 2);
INSERT INTO `item_mods` VALUES (11082, 73, 7);

-- -------------------------------------------------------
-- Tantra Cyclas +2
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11085, 1, 64); -- def
INSERT INTO `item_mods` VALUES (11085, 8, 12); -- STR
INSERT INTO `item_mods` VALUES (11085, 10, 12); -- VIT
INSERT INTO `item_mods` VALUES (11085, 23, 15); -- attack
INSERT INTO `item_mods` VALUES (11085, 25, 15); -- accuracy
INSERT INTO `item_mods` VALUES (11085, 173, 5); -- Martial Arts
-- TODO Increases Critical Hit Damage by 1%/1 Impetus Count

INSERT INTO `item_mods` VALUES (11086, 369, 2);
INSERT INTO `item_mods` VALUES (11087, 369, 2);
INSERT INTO `item_mods` VALUES (11088, 369, 2);

-- -------------------------------------------------------
-- Creed Cuirass +2
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11090, 1, 77); -- def
INSERT INTO `item_mods` VALUES (11090, 2, 65); -- HP
INSERT INTO `item_mods` VALUES (11090, 5, 65); -- MP
INSERT INTO `item_mods` VALUES (11090, 25, 20); -- accuracy
INSERT INTO `item_mods` VALUES (11090, 23, 20); -- attack
INSERT INTO `item_mods` VALUES (11090, 27, 10); -- enmity
-- TODO: Mitigates damage taken based on enmity. Low Enmity:Aprox. -2.4% Damage Taken. Reduction is active even when not on the hate list. High Enmity:Aprox. -10.2% Damage Taken

-- -------------------------------------------------------
-- Sylvan Caban +2
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11094, 1, 61); -- def
INSERT INTO `item_mods` VALUES (11094, 8, 12); -- str
INSERT INTO `item_mods` VALUES (11094, 11, 12); -- agi
INSERT INTO `item_mods` VALUES (11094, 26, 20); -- ranged accuracy
INSERT INTO `item_mods` VALUES (11094, 27, -9); -- enmity
INSERT INTO `item_mods` VALUES (11094, 423, 5); -- Increases Snapshot whilst Velocity Shot is up.
INSERT INTO `item_mods` VALUES (11094, 424, 10); -- Increases Ranged Attack whilst Velocity Shot is up.

INSERT INTO `item_mods` VALUES (11095, 73, 10);

-- -------------------------------------------------------
-- Iga  Ningi +2
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11096, 1, 62); -- def
INSERT INTO `item_mods` VALUES (11096, 9, 12); -- dex
INSERT INTO `item_mods` VALUES (11096, 8, 12); -- str
INSERT INTO `item_mods` VALUES (11096, 25, 17); -- accuracy
INSERT INTO `item_mods` VALUES (11096, 23, 17); -- attack
INSERT INTO `item_mods` VALUES (11096, 165, 5); -- crit rate

INSERT INTO `item_mods` VALUES (11097, 73, 10);
INSERT INTO `item_mods` VALUES (11099, 369, 2);
INSERT INTO `item_mods` VALUES (11103, 369, 1);

-- -------------------------------------------------------
-- Tantra Gloves +2
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11105, 1, 27); -- def
INSERT INTO `item_mods` VALUES (11105, 25, 10); -- accuracy
INSERT INTO `item_mods` VALUES (11105, 80, 7); -- H2H
INSERT INTO `item_mods` VALUES (11105, 384, 30); -- Haste gear
-- TODO enhances tactical guard effect

-- -------------------------------------------------------
-- Creed Gauntlets +2
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11110, 1, 35); -- def
INSERT INTO `item_mods` VALUES (11110, 8, 11); -- STR
INSERT INTO `item_mods` VALUES (11110, 10, 11); -- VIT
INSERT INTO `item_mods` VALUES (11110, 82, 7); -- Sword skill
INSERT INTO `item_mods` VALUES (11110, 384, 40); -- haste gear
-- TODO: Enhances "Shield Defense Bonus" effect

INSERT INTO `item_mods` VALUES (11113, 443, 1);

-- -------------------------------------------------------
-- Sylvan Glovelettes +2
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11114, 1, 25); -- def
INSERT INTO `item_mods` VALUES (11114, 8, 10); -- str
INSERT INTO `item_mods` VALUES (11114, 73, 7); -- Store tp
INSERT INTO `item_mods` VALUES (11114, 104, 7); -- archery skill
-- TODO bounty shot. Increases the Base Treasure Hunter Effect on Bounty Shot from 2 to 3.

-- -------------------------------------------------------
-- Iga Tekko +2
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11116, 1, 27); -- def
INSERT INTO `item_mods` VALUES (11116, 9, 10); -- dex
INSERT INTO `item_mods` VALUES (11116, 11, 10); -- agi
INSERT INTO `item_mods` VALUES (11116, 25, 8); -- accuracy
INSERT INTO `item_mods` VALUES (11116, 68, 8); -- evasion

-- -------------------------------------------------------
-- Tantra Hose +2
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11125, 1, 49); -- def
INSERT INTO `item_mods` VALUES (11125, 25, 10); -- accuracy
INSERT INTO `item_mods` VALUES (11125, 23, 10); -- attack
INSERT INTO `item_mods` VALUES (11125, 73, 6); -- Store tp
INSERT INTO `item_mods` VALUES (11125, 292, 7); -- kick attacks
INSERT INTO `item_mods` VALUES (11125, 384, 61); -- Haste gear

-- -------------------------------------------------------
-- Creed Cuisses +2
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11130, 1, 58); -- def
INSERT INTO `item_mods` VALUES (11130, 2, 50); -- HP
INSERT INTO `item_mods` VALUES (11130, 384, 40); -- haste gear
INSERT INTO `item_mods` VALUES (11130, 82, 7); -- Sword skill
INSERT INTO `item_mods` VALUES (11130, 161, -5); -- Physical Damage % multiplier
INSERT INTO `item_mods` VALUES (11130, 427, 1); -- TODO: Reduces Enmity decrease when taking physical damage

INSERT INTO `item_mods` VALUES (11133, 442, 1);

-- -------------------------------------------------------
-- Sylvan Brague +2
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11134, 1, 46); -- def
INSERT INTO `item_mods` VALUES (11134, 24, 12); -- ranged attack
INSERT INTO `item_mods` VALUES (11134, 165, 3); -- crit rate
INSERT INTO `item_mods` VALUES (11134, 73, 9); -- Store tp
-- TODO true shot. Increases damage from ideal ranged attack distance ("sweet spot") by 3-7%. Trait also applies to Weapon Skills.

INSERT INTO `item_mods` VALUES (11135, 73, 7);

-- -------------------------------------------------------
-- Iga Hakama +2
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11136, 1, 48); -- def
INSERT INTO `item_mods` VALUES (11136, 25, 8); -- accuracy
INSERT INTO `item_mods` VALUES (11136, 88, 5); -- katana skill
INSERT INTO `item_mods` VALUES (11136, 384, 71); -- haste

-- -------------------------------------------------------
-- Tantra Gaiters +2
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11145, 1, 25); -- def
INSERT INTO `item_mods` VALUES (11145, 8, 8); -- STR
INSERT INTO `item_mods` VALUES (11145, 25, 8); -- accuracy
INSERT INTO `item_mods` VALUES (11145, 386, 45); -- TODO: Raises kick damage by 45 (equivalent to weapon with DMG +45).
INSERT INTO `item_mods` VALUES (11145, 429, 52); -- TODO: Raises the attack bonus of Footwork. (Tantra Gaiters +2 raise 100/1024 to 152/1024)

INSERT INTO `item_mods` VALUES (11146, 1, 18);
INSERT INTO `item_mods` VALUES (11146, 2, 30);
INSERT INTO `item_mods` VALUES (11146, 5, 30);
INSERT INTO `item_mods` VALUES (11146, 13, 8);
INSERT INTO `item_mods` VALUES (11146, 113, 20);
INSERT INTO `item_mods` VALUES (11146, 484, 10);
INSERT INTO `item_mods` VALUES (11149, 303, 1);

-- -------------------------------------------------------
-- Creed Sabatons +2
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11150, 1, 30); -- def
INSERT INTO `item_mods` VALUES (11150, 25, 14); -- accuracy
INSERT INTO `item_mods` VALUES (11150, 27, 7); -- enmity
INSERT INTO `item_mods` VALUES (11150, 384, 40); -- haste gear

INSERT INTO `item_mods` VALUES (11153, 370, 2);
INSERT INTO `item_mods` VALUES (11153, 451, 1);

-- -------------------------------------------------------
-- Sylvan Bottillons +2
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11154, 1, 22); -- def
INSERT INTO `item_mods` VALUES (11154, 11, 15); -- agi
INSERT INTO `item_mods` VALUES (11154, 105, 7); -- marksmanship skill
INSERT INTO `item_mods` VALUES (11154, 27, -8); -- enmity
-- TODO Unlimited shot. Allows the next ranged attack to receive the bonuses of the "sweet spot" distance at any distance (will receive the pummeling message at any distance).

-- -------------------------------------------------------
-- Iga Kyahan +2
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11156, 1, 23); -- def
INSERT INTO `item_mods` VALUES (11156, 9, 5); -- dex
INSERT INTO `item_mods` VALUES (11156, 8, 5); -- str
INSERT INTO `item_mods` VALUES (11156, 384, 40); -- haste

-- -------------------------------------------------------
-- Tantra Crown +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11165, 1, 34); -- def
INSERT INTO `item_mods` VALUES (11165, 289, 8); -- subtle blow
INSERT INTO `item_mods` VALUES (11165, 384, 61); -- Haste gear
INSERT INTO `item_mods` VALUES (11165, 428, 10); -- TODO: Perfect counter: Raises weapon damage by 10 when countering while under the Perfect Counter effect. This also affects Weapon Rank (though not if fighting barehanded).

INSERT INTO `item_mods` VALUES (11166, 374, 7);

-- -------------------------------------------------------
-- Creed Armet +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11170, 1, 42); -- def
INSERT INTO `item_mods` VALUES (11170, 2, 30); -- HP
INSERT INTO `item_mods` VALUES (11170, 5, 30); -- MP
INSERT INTO `item_mods` VALUES (11170, 109, 5); -- Shield skill
INSERT INTO `item_mods` VALUES (11170, 426, 3); -- Absorbs a percentage of damage taken to MP

-- -------------------------------------------------------
-- Sylvan Gapette +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11174, 1, 32); -- def
INSERT INTO `item_mods` VALUES (11174, 24, 9); -- ranged attack
INSERT INTO `item_mods` VALUES (11174, 26, 9); -- ranged accuracy
INSERT INTO `item_mods` VALUES (11174, 289, 5); -- subtle blow
INSERT INTO `item_mods` VALUES (11174, 365, 5); -- Snap shot (Ranged delay decrease)
INSERT INTO `item_mods` VALUES (11174, 422, 5); -- Double shot proc rate


-- -------------------------------------------------------
-- Iga zukin +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11176, 1, 35); -- def
INSERT INTO `item_mods` VALUES (11176, 9, 7); -- dex
INSERT INTO `item_mods` VALUES (11176, 384, 51); -- haste

INSERT INTO `item_mods` VALUES (11178, 369, 1);

-- -------------------------------------------------------
-- Tantra Cyclas +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11185, 1, 61); -- def
INSERT INTO `item_mods` VALUES (11185, 8, 8); -- STR
INSERT INTO `item_mods` VALUES (11185, 10, 8); -- VIT
INSERT INTO `item_mods` VALUES (11185, 23, 12); -- attack
INSERT INTO `item_mods` VALUES (11185, 25, 12); -- accuracy
-- TODO Increases Critical Hit Damage by 1%/1 Impetus Count

INSERT INTO `item_mods` VALUES (11186, 369, 1);
INSERT INTO `item_mods` VALUES (11187, 369, 1);
INSERT INTO `item_mods` VALUES (11188, 369, 1);

-- -------------------------------------------------------
-- Creed Cuirass +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11190, 1, 74); -- def
INSERT INTO `item_mods` VALUES (11190, 2, 40); -- HP
INSERT INTO `item_mods` VALUES (11190, 5, 40); -- MP
INSERT INTO `item_mods` VALUES (11190, 23, 14); -- attack
INSERT INTO `item_mods` VALUES (11190, 25, 14); -- accuracy
INSERT INTO `item_mods` VALUES (11190, 27, 7); -- enmity
-- TODO: Mitigates damage taken based on enmity. Low Enmity:Aprox. -2.4% Damage Taken. Reduction is active even when not on the hate list. High Enmity:Aprox. -10.2% Damage Taken

-- -------------------------------------------------------
-- Sylvan Caban +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11194, 1, 58); -- def
INSERT INTO `item_mods` VALUES (11194, 8, 8); -- str
INSERT INTO `item_mods` VALUES (11194, 11, 8); -- agi
INSERT INTO `item_mods` VALUES (11194, 26, 15); -- ranged accuracy
INSERT INTO `item_mods` VALUES (11194, 27, -7); -- enmity
INSERT INTO `item_mods` VALUES (11194, 423, 5); -- Increases Snapshot whilst Velocity Shot is up.
INSERT INTO `item_mods` VALUES (11194, 424, 10); -- Increases Ranged Attack whilst Velocity Shot is up.

-- -------------------------------------------------------
-- Iga Ningi +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11196, 1, 56); -- def
INSERT INTO `item_mods` VALUES (11196, 9, 8); -- dex
INSERT INTO `item_mods` VALUES (11196, 8, 8); -- str
INSERT INTO `item_mods` VALUES (11196, 25, 14); -- accuracy
INSERT INTO `item_mods` VALUES (11196, 23, 14); -- attack
INSERT INTO `item_mods` VALUES (11196, 165, 3); -- crit rate

-- -------------------------------------------------------
-- Tantra Gloves +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11205, 1, 25); -- def
INSERT INTO `item_mods` VALUES (11205, 25, 8); -- accuracy
INSERT INTO `item_mods` VALUES (11205, 80, 5); -- H2H
INSERT INTO `item_mods` VALUES (11205, 384, 20); -- Haste gear
-- TODO enhances tactical guard effect

-- -------------------------------------------------------
-- Creed Gauntlets +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11210, 1, 33); -- def
INSERT INTO `item_mods` VALUES (11210, 8, 7); -- STR
INSERT INTO `item_mods` VALUES (11210, 10, 7); -- VIT
INSERT INTO `item_mods` VALUES (11210, 82, 5); -- Sword skill
INSERT INTO `item_mods` VALUES (11210, 384, 30); -- haste gear
-- TODO: Enhances "Shield Defense Bonus" effect

-- -------------------------------------------------------
-- Sylvan Glovelettes +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11214, 1, 23); -- def
INSERT INTO `item_mods` VALUES (11214, 8, 7); -- str
INSERT INTO `item_mods` VALUES (11214, 73, 4); -- Store tp
INSERT INTO `item_mods` VALUES (11214, 104, 5); -- archery skill
-- TODO bounty shot. Increases the Base Treasure Hunter Effect on Bounty Shot from 2 to 3.

-- -------------------------------------------------------
-- Iga Tekko +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11216, 1, 25); -- def
INSERT INTO `item_mods` VALUES (11216, 9, 7); -- dex
INSERT INTO `item_mods` VALUES (11216, 11, 7); -- agi
INSERT INTO `item_mods` VALUES (11216, 25, 6); -- accuracy
INSERT INTO `item_mods` VALUES (11216, 68, 6); -- evasion

-- -------------------------------------------------------
-- Tantra Hose +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11225, 1, 47); -- def
INSERT INTO `item_mods` VALUES (11225, 25, 7); -- accuracy
INSERT INTO `item_mods` VALUES (11225, 23, 7); -- attack
INSERT INTO `item_mods` VALUES (11225, 384, 51); -- Haste gear
INSERT INTO `item_mods` VALUES (11225, 292, 5); -- kick attacks

-- -------------------------------------------------------
-- Creed Cuisses +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11230, 1, 56); -- def
INSERT INTO `item_mods` VALUES (11230, 2, 30); -- HP
INSERT INTO `item_mods` VALUES (11230, 161, -3); -- Physical Damage %
INSERT INTO `item_mods` VALUES (11230, 384, 30); -- haste gear multiplier
INSERT INTO `item_mods` VALUES (11230, 427, 1); -- TODO: Reduces Enmity decrease when taking physical damage

-- -------------------------------------------------------
-- Sylvan Brague +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11234, 1, 44); -- def
INSERT INTO `item_mods` VALUES (11234, 24, 9); -- ranged attack
INSERT INTO `item_mods` VALUES (11234, 165, 2); -- crit rate
INSERT INTO `item_mods` VALUES (11234, 73, 6); -- Store tp
-- TODO true shot. Increases damage from ideal ranged attack distance ("sweet spot") by 3-7%. Trait also applies to Weapon Skills.

-- -------------------------------------------------------
-- Iga Hakama +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11236, 1, 46); -- def
INSERT INTO `item_mods` VALUES (11236, 25, 6); -- accuracy
INSERT INTO `item_mods` VALUES (11236, 88, 3); -- katana skill
INSERT INTO `item_mods` VALUES (11236, 384, 61); -- haste

-- -------------------------------------------------------
-- Tantra Gaiters +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11245, 1, 23); -- def
INSERT INTO `item_mods` VALUES (11245, 8, 6); -- STR
INSERT INTO `item_mods` VALUES (11245, 25, 6); -- accuracy
INSERT INTO `item_mods` VALUES (11245, 386, 40); -- TODO: Raises kick damage by 45 (equivalent to weapon with DMG +45).
INSERT INTO `item_mods` VALUES (11245, 429, 32); -- TODO: Raises the attack bonus of Footwork. (Tantra Gaiters +2 raise 100/1024 to 152/1024)

INSERT INTO `item_mods` VALUES (11246, 1, 16);
INSERT INTO `item_mods` VALUES (11246, 2, 20);
INSERT INTO `item_mods` VALUES (11246, 5, 20);
INSERT INTO `item_mods` VALUES (11246, 13, 6);
INSERT INTO `item_mods` VALUES (11246, 113, 15);
INSERT INTO `item_mods` VALUES (11246, 484, 5);

-- -------------------------------------------------------
-- Creed Sabatons +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11250, 1, 28); -- def
INSERT INTO `item_mods` VALUES (11250, 25, 10); -- accuracy
INSERT INTO `item_mods` VALUES (11250, 27, 4); -- enmity
INSERT INTO `item_mods` VALUES (11250, 384, 30); -- haste gear

INSERT INTO `item_mods` VALUES (11253, 370, 1);
-- -------------------------------------------------------
-- Sylvan Bottillons +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11254, 1, 17); -- def
INSERT INTO `item_mods` VALUES (11254, 11, 4); -- agi
INSERT INTO `item_mods` VALUES (11254, 27, -5); -- enmity
INSERT INTO `item_mods` VALUES (11254, 105, 5); -- marksmanship skill
-- TODO Unlimited shot. Allows the next ranged attack to receive the bonuses of the "sweet spot" distance at any distance (will receive the pummeling message at any distance).

-- -------------------------------------------------------
-- Iga Kyahan +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11256, 1, 21); -- def
INSERT INTO `item_mods` VALUES (11256, 9, 4); -- dex
INSERT INTO `item_mods` VALUES (11256, 8, 4); -- str
INSERT INTO `item_mods` VALUES (11256, 384, 30); -- haste

INSERT INTO `item_mods` VALUES (11265, 1, 1);
INSERT INTO `item_mods` VALUES (11266, 1, 1);
INSERT INTO `item_mods` VALUES (11267, 1, 1);
INSERT INTO `item_mods` VALUES (11268, 1, 1);
INSERT INTO `item_mods` VALUES (11269, 1, 1);
INSERT INTO `item_mods` VALUES (11270, 1, 1);
INSERT INTO `item_mods` VALUES (11271, 1, 1);
INSERT INTO `item_mods` VALUES (11272, 1, 1);
INSERT INTO `item_mods` VALUES (11273, 1, 2);
INSERT INTO `item_mods` VALUES (11274, 1, 2);
INSERT INTO `item_mods` VALUES (11275, 1, 2);
INSERT INTO `item_mods` VALUES (11276, 1, 2);
INSERT INTO `item_mods` VALUES (11277, 1, 2);
INSERT INTO `item_mods` VALUES (11278, 1, 2);
INSERT INTO `item_mods` VALUES (11279, 1, 2);
INSERT INTO `item_mods` VALUES (11280, 1, 2);
INSERT INTO `item_mods` VALUES (11281, 1, 52);
INSERT INTO `item_mods` VALUES (11281, 23, 20);
INSERT INTO `item_mods` VALUES (11281, 25, 20);
INSERT INTO `item_mods` VALUES (11281, 165, 5);
INSERT INTO `item_mods` VALUES (11281, 306, 1);
INSERT INTO `item_mods` VALUES (11282, 1, 55);
INSERT INTO `item_mods` VALUES (11282, 8, 8);
INSERT INTO `item_mods` VALUES (11282, 9, 8);
INSERT INTO `item_mods` VALUES (11282, 10, -8);
INSERT INTO `item_mods` VALUES (11282, 11, -8);
INSERT INTO `item_mods` VALUES (11282, 23, 15);
INSERT INTO `item_mods` VALUES (11282, 73, 7);
INSERT INTO `item_mods` VALUES (11283, 1, 41);
INSERT INTO `item_mods` VALUES (11283, 2, 20);
INSERT INTO `item_mods` VALUES (11283, 5, 20);
INSERT INTO `item_mods` VALUES (11283, 28, 6);
INSERT INTO `item_mods` VALUES (11283, 30, 6);
INSERT INTO `item_mods` VALUES (11283, 71, 6);
INSERT INTO `item_mods` VALUES (11284, 1, 50);
INSERT INTO `item_mods` VALUES (11284, 8, 5);
INSERT INTO `item_mods` VALUES (11284, 11, 5);
INSERT INTO `item_mods` VALUES (11284, 23, 10);
INSERT INTO `item_mods` VALUES (11284, 25, 10);
INSERT INTO `item_mods` VALUES (11284, 68, 5);
INSERT INTO `item_mods` VALUES (11284, 289, 5);
INSERT INTO `item_mods` VALUES (11285, 1, 37);
INSERT INTO `item_mods` VALUES (11285, 5, 25);
INSERT INTO `item_mods` VALUES (11285, 27, -3);
INSERT INTO `item_mods` VALUES (11285, 28, 8);
INSERT INTO `item_mods` VALUES (11285, 30, -8);
INSERT INTO `item_mods` VALUES (11286, 1, 52);
INSERT INTO `item_mods` VALUES (11286, 10, 7);
INSERT INTO `item_mods` VALUES (11286, 13, 7);
INSERT INTO `item_mods` VALUES (11286, 14, 7);
INSERT INTO `item_mods` VALUES (11286, 25, 13);
INSERT INTO `item_mods` VALUES (11286, 27, 3);
INSERT INTO `item_mods` VALUES (11286, 163, -12);
INSERT INTO `item_mods` VALUES (11287, 1, 50);
INSERT INTO `item_mods` VALUES (11287, 2, 15);
INSERT INTO `item_mods` VALUES (11287, 9, 8);
INSERT INTO `item_mods` VALUES (11287, 11, 8);
INSERT INTO `item_mods` VALUES (11287, 25, 8);
INSERT INTO `item_mods` VALUES (11287, 68, 8);
INSERT INTO `item_mods` VALUES (11288, 1, 55);
INSERT INTO `item_mods` VALUES (11288, 8, 10);
INSERT INTO `item_mods` VALUES (11288, 9, 10);
INSERT INTO `item_mods` VALUES (11288, 68, -20);
INSERT INTO `item_mods` VALUES (11288, 165, 3);
INSERT INTO `item_mods` VALUES (11289, 1, 43);
INSERT INTO `item_mods` VALUES (11289, 12, 13);
INSERT INTO `item_mods` VALUES (11289, 13, 13);
INSERT INTO `item_mods` VALUES (11289, 14, 13);
INSERT INTO `item_mods` VALUES (11289, 30, 5);
INSERT INTO `item_mods` VALUES (11289, 369, 1);
INSERT INTO `item_mods` VALUES (11289, 370, 1);
INSERT INTO `item_mods` VALUES (11290, 1, 2);
INSERT INTO `item_mods` VALUES (11291, 1, 45);
INSERT INTO `item_mods` VALUES (11291, 2, 17);
INSERT INTO `item_mods` VALUES (11291, 5, 17);
INSERT INTO `item_mods` VALUES (11291, 8, 5);
INSERT INTO `item_mods` VALUES (11291, 9, 5);
INSERT INTO `item_mods` VALUES (11291, 71, 1);
INSERT INTO `item_mods` VALUES (11291, 72, 1);
INSERT INTO `item_mods` VALUES (11291, 122, 15);
INSERT INTO `item_mods` VALUES (11292, 1, 45);
INSERT INTO `item_mods` VALUES (11292, 5, 20);
INSERT INTO `item_mods` VALUES (11292, 25, 10);
INSERT INTO `item_mods` VALUES (11292, 27, -2);
INSERT INTO `item_mods` VALUES (11292, 369, 1);
INSERT INTO `item_mods` VALUES (11293, 1, 46);
INSERT INTO `item_mods` VALUES (11293, 5, 20);
INSERT INTO `item_mods` VALUES (11293, 25, 12);
INSERT INTO `item_mods` VALUES (11293, 27, -3);
INSERT INTO `item_mods` VALUES (11293, 369, 1);
INSERT INTO `item_mods` VALUES (11294, 1, 43);
INSERT INTO `item_mods` VALUES (11294, 2, 20);
INSERT INTO `item_mods` VALUES (11294, 9, 5);
INSERT INTO `item_mods` VALUES (11294, 11, 5);
INSERT INTO `item_mods` VALUES (11294, 24, 5);
INSERT INTO `item_mods` VALUES (11294, 26, 10);
INSERT INTO `item_mods` VALUES (11295, 1, 45);
INSERT INTO `item_mods` VALUES (11295, 8, 3);
INSERT INTO `item_mods` VALUES (11295, 24, 8);
INSERT INTO `item_mods` VALUES (11295, 25, 8);
INSERT INTO `item_mods` VALUES (11296, 1, 46);
INSERT INTO `item_mods` VALUES (11296, 8, 3);
INSERT INTO `item_mods` VALUES (11296, 24, 10);
INSERT INTO `item_mods` VALUES (11296, 25, 10);
INSERT INTO `item_mods` VALUES (11297, 1, 37);
INSERT INTO `item_mods` VALUES (11297, 2, 17);
INSERT INTO `item_mods` VALUES (11297, 23, 5);
INSERT INTO `item_mods` VALUES (11297, 25, 5);
INSERT INTO `item_mods` VALUES (11298, 1, 45);
INSERT INTO `item_mods` VALUES (11298, 2, 15);
INSERT INTO `item_mods` VALUES (11298, 25, 10);
INSERT INTO `item_mods` VALUES (11298, 289, 5);
INSERT INTO `item_mods` VALUES (11299, 1, 46);
INSERT INTO `item_mods` VALUES (11299, 2, 15);
INSERT INTO `item_mods` VALUES (11299, 25, 12);
INSERT INTO `item_mods` VALUES (11299, 289, 5);
INSERT INTO `item_mods` VALUES (11300, 1, 2);
INSERT INTO `item_mods` VALUES (11301, 1, 3);
INSERT INTO `item_mods` VALUES (11302, 1, 39);
INSERT INTO `item_mods` VALUES (11302, 2, 25);
INSERT INTO `item_mods` VALUES (11302, 8, 5);
INSERT INTO `item_mods` VALUES (11302, 9, 5);
INSERT INTO `item_mods` VALUES (11302, 27, -2);
INSERT INTO `item_mods` VALUES (11302, 491, 10);
INSERT INTO `item_mods` VALUES (11303, 1, 39);
INSERT INTO `item_mods` VALUES (11303, 2, 25);
INSERT INTO `item_mods` VALUES (11303, 8, 5);
INSERT INTO `item_mods` VALUES (11303, 9, 5);
INSERT INTO `item_mods` VALUES (11303, 27, -2);
INSERT INTO `item_mods` VALUES (11303, 491, 10);
INSERT INTO `item_mods` VALUES (11304, 1, 39);
INSERT INTO `item_mods` VALUES (11304, 5, 18);
INSERT INTO `item_mods` VALUES (11304, 12, 3);
INSERT INTO `item_mods` VALUES (11304, 13, 3);
INSERT INTO `item_mods` VALUES (11304, 71, 5);
INSERT INTO `item_mods` VALUES (11304, 337, 15);
INSERT INTO `item_mods` VALUES (11305, 1, 39);
INSERT INTO `item_mods` VALUES (11305, 9, 4);
INSERT INTO `item_mods` VALUES (11305, 23, 12);
INSERT INTO `item_mods` VALUES (11305, 25, 10);
INSERT INTO `item_mods` VALUES (11305, 494, 20);
INSERT INTO `item_mods` VALUES (11306, 1, 40);
INSERT INTO `item_mods` VALUES (11306, 9, 4);
INSERT INTO `item_mods` VALUES (11306, 23, 14);
INSERT INTO `item_mods` VALUES (11306, 25, 12);
INSERT INTO `item_mods` VALUES (11306, 494, 20);
INSERT INTO `item_mods` VALUES (11307, 1, 38);
INSERT INTO `item_mods` VALUES (11307, 2, 15);
INSERT INTO `item_mods` VALUES (11307, 5, 15);
INSERT INTO `item_mods` VALUES (11307, 29, 5);
INSERT INTO `item_mods` VALUES (11307, 113, 7);
INSERT INTO `item_mods` VALUES (11307, 401, 1);
INSERT INTO `item_mods` VALUES (11308, 1, 39);
INSERT INTO `item_mods` VALUES (11308, 2, 17);
INSERT INTO `item_mods` VALUES (11308, 5, 17);
INSERT INTO `item_mods` VALUES (11308, 29, 6);
INSERT INTO `item_mods` VALUES (11308, 113, 7);
INSERT INTO `item_mods` VALUES (11308, 401, 1);
INSERT INTO `item_mods` VALUES (11309, 1, 4);
INSERT INTO `item_mods` VALUES (11309, 60, 15);
INSERT INTO `item_mods` VALUES (11310, 1, 5);
INSERT INTO `item_mods` VALUES (11310, 14, 1);
INSERT INTO `item_mods` VALUES (11311, 1, 5);
INSERT INTO `item_mods` VALUES (11311, 14, 3);
INSERT INTO `item_mods` VALUES (11312, 1, 3);
INSERT INTO `item_mods` VALUES (11313, 1, 49);
INSERT INTO `item_mods` VALUES (11313, 2, 20);
INSERT INTO `item_mods` VALUES (11313, 8, 5);
INSERT INTO `item_mods` VALUES (11313, 9, 5);
INSERT INTO `item_mods` VALUES (11313, 10, 5);
INSERT INTO `item_mods` VALUES (11314, 1, 42);
INSERT INTO `item_mods` VALUES (11314, 2, 10);
INSERT INTO `item_mods` VALUES (11314, 5, 10);
INSERT INTO `item_mods` VALUES (11314, 8, 5);
INSERT INTO `item_mods` VALUES (11314, 9, 5);
INSERT INTO `item_mods` VALUES (11314, 11, 5);
INSERT INTO `item_mods` VALUES (11315, 1, 40);
INSERT INTO `item_mods` VALUES (11315, 5, 20);
INSERT INTO `item_mods` VALUES (11315, 12, 5);
INSERT INTO `item_mods` VALUES (11315, 13, 5);
INSERT INTO `item_mods` VALUES (11315, 14, 5);
INSERT INTO `item_mods` VALUES (11316, 1, 1);
INSERT INTO `item_mods` VALUES (11317, 1, 1);
INSERT INTO `item_mods` VALUES (11318, 1, 2);
INSERT INTO `item_mods` VALUES (11319, 1, 2);

-- -------------------------------------------------------
-- Orange Racing Silks
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11321, 1, 2); -- DEF+2
INSERT INTO `item_mods` VALUES (11321, 511, 10); -- Chocobo riding time +10 min

INSERT INTO `item_mods` VALUES (11322, 1, 2);
INSERT INTO `item_mods` VALUES (11323, 1, 2);
INSERT INTO `item_mods` VALUES (11324, 1, 2);
INSERT INTO `item_mods` VALUES (11325, 1, 2);
INSERT INTO `item_mods` VALUES (11326, 1, 2);
INSERT INTO `item_mods` VALUES (11327, 1, 2);
INSERT INTO `item_mods` VALUES (11328, 1, 2);
INSERT INTO `item_mods` VALUES (11329, 1, 3);
INSERT INTO `item_mods` VALUES (11329, 56, 2);
INSERT INTO `item_mods` VALUES (11329, 57, 2);
INSERT INTO `item_mods` VALUES (11329, 128, 1);
INSERT INTO `item_mods` VALUES (11330, 1, 4);
INSERT INTO `item_mods` VALUES (11330, 54, 4);
INSERT INTO `item_mods` VALUES (11330, 129, 1);
INSERT INTO `item_mods` VALUES (11331, 1, 3);
INSERT INTO `item_mods` VALUES (11331, 54, 2);
INSERT INTO `item_mods` VALUES (11331, 57, 2);
INSERT INTO `item_mods` VALUES (11331, 130, 1);
INSERT INTO `item_mods` VALUES (11332, 1, 2);
INSERT INTO `item_mods` VALUES (11332, 57, 4);
INSERT INTO `item_mods` VALUES (11332, 131, 1);
INSERT INTO `item_mods` VALUES (11333, 1, 3);
INSERT INTO `item_mods` VALUES (11333, 58, 2);
INSERT INTO `item_mods` VALUES (11333, 61, 2);
INSERT INTO `item_mods` VALUES (11333, 132, 1);
INSERT INTO `item_mods` VALUES (11334, 1, 3);
INSERT INTO `item_mods` VALUES (11334, 57, 2);
INSERT INTO `item_mods` VALUES (11334, 61, 2);
INSERT INTO `item_mods` VALUES (11334, 133, 1);
INSERT INTO `item_mods` VALUES (11335, 1, 3);
INSERT INTO `item_mods` VALUES (11335, 54, 2);
INSERT INTO `item_mods` VALUES (11335, 58, 2);
INSERT INTO `item_mods` VALUES (11335, 134, 1);
INSERT INTO `item_mods` VALUES (11336, 1, 2);
INSERT INTO `item_mods` VALUES (11336, 54, 2);
INSERT INTO `item_mods` VALUES (11336, 59, 2);
INSERT INTO `item_mods` VALUES (11336, 135, 1);
INSERT INTO `item_mods` VALUES (11337, 1, 4);
INSERT INTO `item_mods` VALUES (11337, 55, 2);
INSERT INTO `item_mods` VALUES (11337, 59, 2);
INSERT INTO `item_mods` VALUES (11337, 127, 1);
INSERT INTO `item_mods` VALUES (11338, 1, 21);
INSERT INTO `item_mods` VALUES (11338, 289, 3);
INSERT INTO `item_mods` VALUES (11339, 1, 21);
INSERT INTO `item_mods` VALUES (11339, 5, 3);
INSERT INTO `item_mods` VALUES (11340, 1, 21);
INSERT INTO `item_mods` VALUES (11340, 2, 4);
INSERT INTO `item_mods` VALUES (11340, 5, 4);
INSERT INTO `item_mods` VALUES (11340, 71, 1);
INSERT INTO `item_mods` VALUES (11341, 1, 33);
INSERT INTO `item_mods` VALUES (11341, 5, 8);
INSERT INTO `item_mods` VALUES (11341, 68, 2);
INSERT INTO `item_mods` VALUES (11341, 71, 2);
INSERT INTO `item_mods` VALUES (11342, 1, 42);
INSERT INTO `item_mods` VALUES (11342, 168, 10);
INSERT INTO `item_mods` VALUES (11342, 374, 3);
INSERT INTO `item_mods` VALUES (11343, 1, 39);
INSERT INTO `item_mods` VALUES (11343, 8, 3);
INSERT INTO `item_mods` VALUES (11343, 9, 3);
INSERT INTO `item_mods` VALUES (11343, 11, -3);
INSERT INTO `item_mods` VALUES (11343, 23, 7);
INSERT INTO `item_mods` VALUES (11343, 25, 7);
INSERT INTO `item_mods` VALUES (11344, 1, 42);
INSERT INTO `item_mods` VALUES (11344, 8, 2);
INSERT INTO `item_mods` VALUES (11344, 10, 2);
INSERT INTO `item_mods` VALUES (11345, 1, 37);
INSERT INTO `item_mods` VALUES (11345, 9, 2);
INSERT INTO `item_mods` VALUES (11345, 11, 2);
INSERT INTO `item_mods` VALUES (11346, 1, 34);
INSERT INTO `item_mods` VALUES (11346, 12, 2);
INSERT INTO `item_mods` VALUES (11346, 13, 2);
INSERT INTO `item_mods` VALUES (11346, 14, 2);
INSERT INTO `item_mods` VALUES (11347, 1, 38);
INSERT INTO `item_mods` VALUES (11347, 2, 10);
INSERT INTO `item_mods` VALUES (11347, 5, 10);
INSERT INTO `item_mods` VALUES (11347, 14, 4);
INSERT INTO `item_mods` VALUES (11348, 1, 22);
INSERT INTO `item_mods` VALUES (11348, 2, 5);
INSERT INTO `item_mods` VALUES (11348, 5, 5);
INSERT INTO `item_mods` VALUES (11348, 71, 2);
INSERT INTO `item_mods` VALUES (11349, 1, 34);
INSERT INTO `item_mods` VALUES (11349, 5, 10);
INSERT INTO `item_mods` VALUES (11349, 68, 3);
INSERT INTO `item_mods` VALUES (11349, 71, 3);
INSERT INTO `item_mods` VALUES (11350, 1, 43);
INSERT INTO `item_mods` VALUES (11350, 8, 3);
INSERT INTO `item_mods` VALUES (11350, 10, 3);
INSERT INTO `item_mods` VALUES (11351, 1, 38);
INSERT INTO `item_mods` VALUES (11351, 9, 3);
INSERT INTO `item_mods` VALUES (11351, 11, 3);
INSERT INTO `item_mods` VALUES (11352, 1, 35);
INSERT INTO `item_mods` VALUES (11352, 12, 3);
INSERT INTO `item_mods` VALUES (11352, 13, 3);
INSERT INTO `item_mods` VALUES (11352, 14, 3);
INSERT INTO `item_mods` VALUES (11353, 1, 39);
INSERT INTO `item_mods` VALUES (11353, 2, 12);
INSERT INTO `item_mods` VALUES (11353, 5, 12);
INSERT INTO `item_mods` VALUES (11353, 14, 5);

-- -------------------------------------------------------
-- Nocturnus Mail
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11354, 1, 49); -- def 49
INSERT INTO `item_mods` VALUES (11354, 8, 10); -- str 10
INSERT INTO `item_mods` VALUES (11354, 9, 10); -- dex 10
INSERT INTO `item_mods` VALUES (11354, 10, 10); -- vit 10
INSERT INTO `item_mods` VALUES (11354, 25, 12); -- accuracy 12
INSERT INTO `item_mods` VALUES (11354, 302, 1); -- triple attack 1%
-- INSERT INTO `item_mods` VALUES (11354, 0, 0); -- [NOT CODED] Absorbs Magic Damage

-- -------------------------------------------------------
-- Dinner Jacket
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11355, 1, 1); -- DEF:1

-- -------------------------------------------------------
-- Ryl.Grd. Livery
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11356, 1, 1); -- DEF:1

-- -------------------------------------------------------
-- Myth.Msk. Livery
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11357, 1, 1); -- DEF:1

-- -------------------------------------------------------
-- Myth.Msk. Livery
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11358, 1, 1); -- DEF:1

INSERT INTO `item_mods` VALUES (11361, 369, 1);
INSERT INTO `item_mods` VALUES (11361, 370, 1);
INSERT INTO `item_mods` VALUES (11362, 1, 70);
INSERT INTO `item_mods` VALUES (11362, 8, 15);
INSERT INTO `item_mods` VALUES (11362, 9, 15);
INSERT INTO `item_mods` VALUES (11362, 10, 15);
INSERT INTO `item_mods` VALUES (11362, 11, 15);
INSERT INTO `item_mods` VALUES (11362, 12, 15);
INSERT INTO `item_mods` VALUES (11362, 13, 15);
INSERT INTO `item_mods` VALUES (11362, 14, 15);
INSERT INTO `item_mods` VALUES (11362, 25, 25);
INSERT INTO `item_mods` VALUES (11362, 369, 2);
INSERT INTO `item_mods` VALUES (11364, 1, 30);
INSERT INTO `item_mods` VALUES (11364, 11, 10);
INSERT INTO `item_mods` VALUES (11364, 68, 5);
INSERT INTO `item_mods` VALUES (11364, 306, 1);
INSERT INTO `item_mods` VALUES (11365, 1, 18);
INSERT INTO `item_mods` VALUES (11365, 12, 3);
INSERT INTO `item_mods` VALUES (11365, 168, 15);
INSERT INTO `item_mods` VALUES (11366, 1, 16);
INSERT INTO `item_mods` VALUES (11366, 27, -3);
INSERT INTO `item_mods` VALUES (11366, 71, 3);
INSERT INTO `item_mods` VALUES (11366, 114, 3);
INSERT INTO `item_mods` VALUES (11367, 1, 18);
INSERT INTO `item_mods` VALUES (11367, 25, 4);
INSERT INTO `item_mods` VALUES (11368, 1, 12);
INSERT INTO `item_mods` VALUES (11368, 2, -10);
INSERT INTO `item_mods` VALUES (11368, 11, 4);
INSERT INTO `item_mods` VALUES (11368, 68, 4);
INSERT INTO `item_mods` VALUES (11368, 386, 20);
INSERT INTO `item_mods` VALUES (11369, 1, 14);
INSERT INTO `item_mods` VALUES (11369, 71, 3);
INSERT INTO `item_mods` VALUES (11369, 115, 4);
INSERT INTO `item_mods` VALUES (11370, 1, 8);
INSERT INTO `item_mods` VALUES (11370, 25, 2);
INSERT INTO `item_mods` VALUES (11370, 386, 15);
INSERT INTO `item_mods` VALUES (11371, 1, 9);
INSERT INTO `item_mods` VALUES (11371, 25, 3);
INSERT INTO `item_mods` VALUES (11371, 386, 18);
INSERT INTO `item_mods` VALUES (11372, 1, 11);
INSERT INTO `item_mods` VALUES (11372, 9, 1);
INSERT INTO `item_mods` VALUES (11372, 23, 3);
INSERT INTO `item_mods` VALUES (11372, 386, 20);
INSERT INTO `item_mods` VALUES (11373, 1, 12);
INSERT INTO `item_mods` VALUES (11373, 9, 2);
INSERT INTO `item_mods` VALUES (11373, 23, 4);
INSERT INTO `item_mods` VALUES (11373, 386, 23);
INSERT INTO `item_mods` VALUES (11374, 1, 12);
INSERT INTO `item_mods` VALUES (11374, 8, 2);
INSERT INTO `item_mods` VALUES (11374, 386, 25);
INSERT INTO `item_mods` VALUES (11375, 1, 13);
INSERT INTO `item_mods` VALUES (11375, 8, 3);
INSERT INTO `item_mods` VALUES (11375, 386, 28);
INSERT INTO `item_mods` VALUES (11376, 1, 20);
INSERT INTO `item_mods` VALUES (11376, 9, 3);
INSERT INTO `item_mods` VALUES (11376, 23, 5);
INSERT INTO `item_mods` VALUES (11376, 25, 5);
INSERT INTO `item_mods` VALUES (11376, 68, -5);
INSERT INTO `item_mods` VALUES (11376, 384, 20);
INSERT INTO `item_mods` VALUES (11377, 1, 13);
INSERT INTO `item_mods` VALUES (11377, 2, 15);
INSERT INTO `item_mods` VALUES (11377, 5, 25);
INSERT INTO `item_mods` VALUES (11377, 71, 2);
INSERT INTO `item_mods` VALUES (11377, 121, 5);
INSERT INTO `item_mods` VALUES (11378, 1, 23);
INSERT INTO `item_mods` VALUES (11378, 9, 3);
INSERT INTO `item_mods` VALUES (11378, 11, 3);
INSERT INTO `item_mods` VALUES (11378, 23, 4);
INSERT INTO `item_mods` VALUES (11378, 24, 4);
INSERT INTO `item_mods` VALUES (11378, 289, 2);
INSERT INTO `item_mods` VALUES (11378, 384, 20);
INSERT INTO `item_mods` VALUES (11379, 1, 17);
INSERT INTO `item_mods` VALUES (11379, 2, 12);
INSERT INTO `item_mods` VALUES (11379, 27, 3);
INSERT INTO `item_mods` VALUES (11379, 68, 5);
INSERT INTO `item_mods` VALUES (11379, 169, 12);
INSERT INTO `item_mods` VALUES (11380, 1, 18);
INSERT INTO `item_mods` VALUES (11380, 2, 14);
INSERT INTO `item_mods` VALUES (11380, 27, 4);
INSERT INTO `item_mods` VALUES (11380, 68, 6);
INSERT INTO `item_mods` VALUES (11380, 169, 12);
INSERT INTO `item_mods` VALUES (11381, 1, 14);
INSERT INTO `item_mods` VALUES (11381, 2, 18);
INSERT INTO `item_mods` VALUES (11381, 5, 18);
INSERT INTO `item_mods` VALUES (11381, 25, 3);
INSERT INTO `item_mods` VALUES (11381, 27, -5);
INSERT INTO `item_mods` VALUES (11381, 108, 10);
INSERT INTO `item_mods` VALUES (11382, 1, 16);
INSERT INTO `item_mods` VALUES (11382, 5, 15);
INSERT INTO `item_mods` VALUES (11382, 11, 3);
INSERT INTO `item_mods` VALUES (11382, 12, 3);
INSERT INTO `item_mods` VALUES (11382, 23, 5);
INSERT INTO `item_mods` VALUES (11382, 27, -2);
INSERT INTO `item_mods` VALUES (11383, 1, 17);
INSERT INTO `item_mods` VALUES (11383, 5, 15);
INSERT INTO `item_mods` VALUES (11383, 11, 4);
INSERT INTO `item_mods` VALUES (11383, 12, 4);
INSERT INTO `item_mods` VALUES (11383, 23, 5);
INSERT INTO `item_mods` VALUES (11383, 27, -2);
INSERT INTO `item_mods` VALUES (11384, 1, 12);
INSERT INTO `item_mods` VALUES (11384, 2, 15);
INSERT INTO `item_mods` VALUES (11384, 8, 5);
INSERT INTO `item_mods` VALUES (11384, 11, 5);
INSERT INTO `item_mods` VALUES (11384, 25, 4);
INSERT INTO `item_mods` VALUES (11384, 26, 4);
INSERT INTO `item_mods` VALUES (11385, 1, 16);
INSERT INTO `item_mods` VALUES (11385, 2, 12);
INSERT INTO `item_mods` VALUES (11385, 9, 3);
INSERT INTO `item_mods` VALUES (11385, 12, 3);
INSERT INTO `item_mods` VALUES (11385, 25, 5);
INSERT INTO `item_mods` VALUES (11385, 27, -3);
INSERT INTO `item_mods` VALUES (11386, 1, 17);
INSERT INTO `item_mods` VALUES (11386, 2, 12);
INSERT INTO `item_mods` VALUES (11386, 9, 3);
INSERT INTO `item_mods` VALUES (11386, 12, 3);
INSERT INTO `item_mods` VALUES (11386, 25, 7);
INSERT INTO `item_mods` VALUES (11386, 27, -4);
INSERT INTO `item_mods` VALUES (11387, 1, 12);
INSERT INTO `item_mods` VALUES (11387, 2, 19);
INSERT INTO `item_mods` VALUES (11387, 8, 5);
INSERT INTO `item_mods` VALUES (11387, 25, 5);
INSERT INTO `item_mods` VALUES (11387, 68, 5);
INSERT INTO `item_mods` VALUES (11388, 1, 17);
INSERT INTO `item_mods` VALUES (11388, 2, 14);
INSERT INTO `item_mods` VALUES (11388, 12, 2);
INSERT INTO `item_mods` VALUES (11388, 13, 2);
INSERT INTO `item_mods` VALUES (11388, 23, 5);
INSERT INTO `item_mods` VALUES (11389, 1, 18);
INSERT INTO `item_mods` VALUES (11389, 2, 22);
INSERT INTO `item_mods` VALUES (11389, 12, 3);
INSERT INTO `item_mods` VALUES (11389, 13, 3);
INSERT INTO `item_mods` VALUES (11389, 23, 5);
INSERT INTO `item_mods` VALUES (11390, 1, 15);
INSERT INTO `item_mods` VALUES (11390, 3, 4);
INSERT INTO `item_mods` VALUES (11390, 6, 4);
INSERT INTO `item_mods` VALUES (11391, 1, 18);
INSERT INTO `item_mods` VALUES (11391, 108, 5);
INSERT INTO `item_mods` VALUES (11391, 110, 5);

-- ------------------------------------------
-- Koschei Crackows
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (11392, 1, 14);
INSERT INTO `item_mods` VALUES (11392, 499, 4); -- curse spikes
INSERT INTO `item_mods` VALUES (11392, 500, 0); -- spikes dmg
INSERT INTO `item_mods` VALUES (11392, 501, 20); -- spikes proc rate

INSERT INTO `item_mods` VALUES (11393, 1, 15);
INSERT INTO `item_mods` VALUES (11393, 2, 12);
INSERT INTO `item_mods` VALUES (11393, 8, 3);
INSERT INTO `item_mods` VALUES (11393, 11, 3);
INSERT INTO `item_mods` VALUES (11393, 23, 5);
INSERT INTO `item_mods` VALUES (11393, 68, 5);
INSERT INTO `item_mods` VALUES (11393, 492, 30);
INSERT INTO `item_mods` VALUES (11393, 495, 100);
INSERT INTO `item_mods` VALUES (11394, 1, 15);
INSERT INTO `item_mods` VALUES (11394, 2, 12);
INSERT INTO `item_mods` VALUES (11394, 8, 3);
INSERT INTO `item_mods` VALUES (11394, 11, 3);
INSERT INTO `item_mods` VALUES (11394, 23, 5);
INSERT INTO `item_mods` VALUES (11394, 68, 5);
INSERT INTO `item_mods` VALUES (11394, 492, 30);
INSERT INTO `item_mods` VALUES (11394, 495, 100);
INSERT INTO `item_mods` VALUES (11395, 1, 11);
INSERT INTO `item_mods` VALUES (11395, 5, 20);
INSERT INTO `item_mods` VALUES (11395, 11, 3);
INSERT INTO `item_mods` VALUES (11395, 12, 3);
INSERT INTO `item_mods` VALUES (11395, 27, -2);
INSERT INTO `item_mods` VALUES (11395, 489, -5);
INSERT INTO `item_mods` VALUES (11396, 1, 16);
INSERT INTO `item_mods` VALUES (11396, 2, 15);
INSERT INTO `item_mods` VALUES (11396, 9, 4);
INSERT INTO `item_mods` VALUES (11396, 25, 3);
INSERT INTO `item_mods` VALUES (11396, 403, 10);
INSERT INTO `item_mods` VALUES (11397, 1, 17);
INSERT INTO `item_mods` VALUES (11397, 2, 20);
INSERT INTO `item_mods` VALUES (11397, 9, 4);
INSERT INTO `item_mods` VALUES (11397, 25, 5);
INSERT INTO `item_mods` VALUES (11397, 403, 10);
INSERT INTO `item_mods` VALUES (11398, 1, 13);
INSERT INTO `item_mods` VALUES (11398, 5, 20);
INSERT INTO `item_mods` VALUES (11398, 112, 7);
INSERT INTO `item_mods` VALUES (11398, 399, 10);
INSERT INTO `item_mods` VALUES (11399, 1, 14);
INSERT INTO `item_mods` VALUES (11399, 5, 25);
INSERT INTO `item_mods` VALUES (11399, 112, 9);
INSERT INTO `item_mods` VALUES (11399, 399, 10);
INSERT INTO `item_mods` VALUES (11400, 1, 1);
INSERT INTO `item_mods` VALUES (11400, 68, 1);
INSERT INTO `item_mods` VALUES (11401, 1, 5);
INSERT INTO `item_mods` VALUES (11401, 12, 2);
INSERT INTO `item_mods` VALUES (11401, 68, 5);

-- ------------------------------------------
-- Gothic Sabatons
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (11402, 1, 7);
INSERT INTO `item_mods` VALUES (11402, 9, 3);
INSERT INTO `item_mods` VALUES (11402, 27, 2);
INSERT INTO `item_mods` VALUES (11402, 499, 2); -- ice spikes
INSERT INTO `item_mods` VALUES (11402, 500, 15); -- spikes dmg
INSERT INTO `item_mods` VALUES (11402, 501, 15); -- spikes proc rate

INSERT INTO `item_mods` VALUES (11403, 1, 1);
INSERT INTO `item_mods` VALUES (11404, 1, 9);
INSERT INTO `item_mods` VALUES (11404, 25, 2);
INSERT INTO `item_mods` VALUES (11404, 384, 20);
INSERT INTO `item_mods` VALUES (11405, 1, 9);
INSERT INTO `item_mods` VALUES (11405, 386, 25);
INSERT INTO `item_mods` VALUES (11406, 1, 11);
INSERT INTO `item_mods` VALUES (11406, 5, 8);
INSERT INTO `item_mods` VALUES (11406, 113, 3);
INSERT INTO `item_mods` VALUES (11407, 1, 5);
INSERT INTO `item_mods` VALUES (11407, 8, 1);
INSERT INTO `item_mods` VALUES (11408, 1, 10);
INSERT INTO `item_mods` VALUES (11408, 12, 1);
INSERT INTO `item_mods` VALUES (11409, 1, 11);
INSERT INTO `item_mods` VALUES (11409, 60, 5);
INSERT INTO `item_mods` VALUES (11409, 119, 3);
INSERT INTO `item_mods` VALUES (11410, 1, 19);
INSERT INTO `item_mods` VALUES (11410, 8, 3);
INSERT INTO `item_mods` VALUES (11410, 9, 4);
INSERT INTO `item_mods` VALUES (11410, 25, 3);
INSERT INTO `item_mods` VALUES (11410, 68, 3);
INSERT INTO `item_mods` VALUES (11410, 384, 20);
INSERT INTO `item_mods` VALUES (11411, 1, 14);
INSERT INTO `item_mods` VALUES (11411, 28, 3);
INSERT INTO `item_mods` VALUES (11411, 115, 4);
INSERT INTO `item_mods` VALUES (11411, 296, 2);
INSERT INTO `item_mods` VALUES (11412, 1, 6);
INSERT INTO `item_mods` VALUES (11412, 8, 1);
INSERT INTO `item_mods` VALUES (11412, 23, 2);
INSERT INTO `item_mods` VALUES (11413, 1, 21);
INSERT INTO `item_mods` VALUES (11413, 8, 5);
INSERT INTO `item_mods` VALUES (11413, 9, 3);
INSERT INTO `item_mods` VALUES (11413, 27, 2);
INSERT INTO `item_mods` VALUES (11413, 384, 20);
INSERT INTO `item_mods` VALUES (11414, 1, 19);
INSERT INTO `item_mods` VALUES (11414, 9, 5);
INSERT INTO `item_mods` VALUES (11414, 68, 5);
INSERT INTO `item_mods` VALUES (11414, 384, 20);
INSERT INTO `item_mods` VALUES (11415, 1, 16);
INSERT INTO `item_mods` VALUES (11415, 2, 8);
INSERT INTO `item_mods` VALUES (11415, 13, 6);
INSERT INTO `item_mods` VALUES (11415, 14, 6);
INSERT INTO `item_mods` VALUES (11415, 27, -4);
INSERT INTO `item_mods` VALUES (11418, 1, 15);
-- INSERT INTO `item_mods` VALUES (11418, 386, ???); TODO: Kick Attack DMG, Confirm Boost
INSERT INTO `item_mods` VALUES (11419, 1, 20);
INSERT INTO `item_mods` VALUES (11419, 9, 6);
INSERT INTO `item_mods` VALUES (11419, 11, 6);
INSERT INTO `item_mods` VALUES (11420, 1, 24);
INSERT INTO `item_mods` VALUES (11420, 12, -4);
INSERT INTO `item_mods` VALUES (11420, 13, -4);
INSERT INTO `item_mods` VALUES (11420, 27, 3);
INSERT INTO `item_mods` VALUES (11420, 161, -3);
INSERT INTO `item_mods` VALUES (11421, 1, 21);
INSERT INTO `item_mods` VALUES (11421, 9, -3);
INSERT INTO `item_mods` VALUES (11421, 11, 3);
INSERT INTO `item_mods` VALUES (11421, 26, 8);
INSERT INTO `item_mods` VALUES (11422, 1, 18);
INSERT INTO `item_mods` VALUES (11422, 7, 70);
INSERT INTO `item_mods` VALUES (11422, 13, 2);
INSERT INTO `item_mods` VALUES (11422, 68, -7);
INSERT INTO `item_mods` VALUES (11423, 1, 22);
INSERT INTO `item_mods` VALUES (11423, 11, -6);
INSERT INTO `item_mods` VALUES (11423, 23, 12);
INSERT INTO `item_mods` VALUES (11423, 25, 10);
INSERT INTO `item_mods` VALUES (11424, 1, 13);
INSERT INTO `item_mods` VALUES (11424, 24, 8);
INSERT INTO `item_mods` VALUES (11424, 26, -6);
INSERT INTO `item_mods` VALUES (11424, 68, 5);
INSERT INTO `item_mods` VALUES (11424, 73, 3);
INSERT INTO `item_mods` VALUES (11425, 1, 14);
INSERT INTO `item_mods` VALUES (11425, 24, 9);
INSERT INTO `item_mods` VALUES (11425, 26, -5);
INSERT INTO `item_mods` VALUES (11425, 68, 6);
INSERT INTO `item_mods` VALUES (11425, 73, 4);
INSERT INTO `item_mods` VALUES (11426, 1, 24);
INSERT INTO `item_mods` VALUES (11426, 12, -4);
INSERT INTO `item_mods` VALUES (11426, 23, 8);
INSERT INTO `item_mods` VALUES (11426, 27, 3);
INSERT INTO `item_mods` VALUES (11426, 161, -1);
INSERT INTO `item_mods` VALUES (11427, 1, 25);
INSERT INTO `item_mods` VALUES (11427, 12, -3);
INSERT INTO `item_mods` VALUES (11427, 23, 9);
INSERT INTO `item_mods` VALUES (11427, 27, 4);
INSERT INTO `item_mods` VALUES (11427, 161, -2);
INSERT INTO `item_mods` VALUES (11428, 1, 11);
INSERT INTO `item_mods` VALUES (11428, 5, 11);
INSERT INTO `item_mods` VALUES (11428, 27, -5);
INSERT INTO `item_mods` VALUES (11428, 68, -3);
INSERT INTO `item_mods` VALUES (11428, 163, -1);
INSERT INTO `item_mods` VALUES (11429, 1, 12);
INSERT INTO `item_mods` VALUES (11429, 5, 12);
INSERT INTO `item_mods` VALUES (11429, 27, -6);
INSERT INTO `item_mods` VALUES (11429, 68, -2);
INSERT INTO `item_mods` VALUES (11429, 163, -2);

-- ------------------------------------------
-- Dornen Schuhs
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (11433, 1, 28);
INSERT INTO `item_mods` VALUES (11433, 2, 45);
INSERT INTO `item_mods` VALUES (11433, 5, 45);
INSERT INTO `item_mods` VALUES (11433, 27, 6);
INSERT INTO `item_mods` VALUES (11433, 499, 5); -- shock spikes
INSERT INTO `item_mods` VALUES (11433, 500, 20); -- spikes dmg
INSERT INTO `item_mods` VALUES (11433, 501, 25); -- spikes proc rate

INSERT INTO `item_mods` VALUES (11444, 1, 20);
INSERT INTO `item_mods` VALUES (11444, 11, 5);
INSERT INTO `item_mods` VALUES (11444, 68, 5);
INSERT INTO `item_mods` VALUES (11445, 1, 24);
INSERT INTO `item_mods` VALUES (11445, 2, 25);
INSERT INTO `item_mods` VALUES (11445, 10, 5);
INSERT INTO `item_mods` VALUES (11445, 11, 5);
INSERT INTO `item_mods` VALUES (11445, 87, 3);
INSERT INTO `item_mods` VALUES (11446, 1, 19);
INSERT INTO `item_mods` VALUES (11446, 8, 5);
INSERT INTO `item_mods` VALUES (11446, 11, 3);
INSERT INTO `item_mods` VALUES (11446, 289, 5);
INSERT INTO `item_mods` VALUES (11447, 1, 22);
INSERT INTO `item_mods` VALUES (11447, 2, -11);
INSERT INTO `item_mods` VALUES (11447, 23, 7);
INSERT INTO `item_mods` VALUES (11447, 25, 7);
INSERT INTO `item_mods` VALUES (11447, 289, 6);
INSERT INTO `item_mods` VALUES (11448, 1, 23);
INSERT INTO `item_mods` VALUES (11448, 9, 3);
INSERT INTO `item_mods` VALUES (11448, 23, 7);
INSERT INTO `item_mods` VALUES (11448, 25, 7);
INSERT INTO `item_mods` VALUES (11448, 289, 6);
INSERT INTO `item_mods` VALUES (11449, 1, 24);
INSERT INTO `item_mods` VALUES (11449, 8, -3);
INSERT INTO `item_mods` VALUES (11449, 11, 5);
INSERT INTO `item_mods` VALUES (11449, 26, 2);
INSERT INTO `item_mods` VALUES (11449, 27, -3);
INSERT INTO `item_mods` VALUES (11450, 1, 25);
INSERT INTO `item_mods` VALUES (11450, 11, 5);
INSERT INTO `item_mods` VALUES (11450, 24, 3);
INSERT INTO `item_mods` VALUES (11450, 26, 2);
INSERT INTO `item_mods` VALUES (11450, 27, -3);
INSERT INTO `item_mods` VALUES (11451, 1, 12);
INSERT INTO `item_mods` VALUES (11451, 5, -14);
INSERT INTO `item_mods` VALUES (11451, 12, 6);
INSERT INTO `item_mods` VALUES (11451, 27, 2);
INSERT INTO `item_mods` VALUES (11451, 30, 4);
INSERT INTO `item_mods` VALUES (11452, 1, 13);
INSERT INTO `item_mods` VALUES (11452, 12, 6);
INSERT INTO `item_mods` VALUES (11452, 30, 4);
-- INSERT INTO `item_mods` VALUES (11452, ???, 2); TODO: Magic Crit Hit Rate
INSERT INTO `item_mods` VALUES (11453, 1, 19);
INSERT INTO `item_mods` VALUES (11453, 11, 8);
INSERT INTO `item_mods` VALUES (11453, 23, -6);
INSERT INTO `item_mods` VALUES (11453, 68, 8);
INSERT INTO `item_mods` VALUES (11453, 289, 6);
INSERT INTO `item_mods` VALUES (11454, 1, 22);
INSERT INTO `item_mods` VALUES (11454, 8, 5);
INSERT INTO `item_mods` VALUES (11454, 10, 5);
INSERT INTO `item_mods` VALUES (11454, 161, -3);
INSERT INTO `item_mods` VALUES (11454, 288, 2);
INSERT INTO `item_mods` VALUES (11455, 1, 14);
INSERT INTO `item_mods` VALUES (11455, 5, 18);
INSERT INTO `item_mods` VALUES (11455, 28, 4);
INSERT INTO `item_mods` VALUES (11455, 71, 4);
INSERT INTO `item_mods` VALUES (11455, 487, 4);
INSERT INTO `item_mods` VALUES (11456, 1, 20);
INSERT INTO `item_mods` VALUES (11456, 10, 7);
INSERT INTO `item_mods` VALUES (11456, 25, 10);
INSERT INTO `item_mods` VALUES (11456, 384, 30);
INSERT INTO `item_mods` VALUES (11464, 1, 24);
INSERT INTO `item_mods` VALUES (11464, 5, 25);
INSERT INTO `item_mods` VALUES (11464, 12, 5);
INSERT INTO `item_mods` VALUES (11464, 13, 5);
INSERT INTO `item_mods` VALUES (11465, 1, 24);
INSERT INTO `item_mods` VALUES (11465, 2, 15);
INSERT INTO `item_mods` VALUES (11465, 10, 3);
INSERT INTO `item_mods` VALUES (11465, 122, 5);
INSERT INTO `item_mods` VALUES (11466, 1, 25);
INSERT INTO `item_mods` VALUES (11466, 2, 15);
INSERT INTO `item_mods` VALUES (11466, 10, 4);
INSERT INTO `item_mods` VALUES (11466, 122, 5);
INSERT INTO `item_mods` VALUES (11467, 1, 23);
INSERT INTO `item_mods` VALUES (11467, 2, 13);
INSERT INTO `item_mods` VALUES (11467, 8, 4);
INSERT INTO `item_mods` VALUES (11467, 11, 4);
INSERT INTO `item_mods` VALUES (11467, 26, 9);
INSERT INTO `item_mods` VALUES (11468, 1, 24);
INSERT INTO `item_mods` VALUES (11468, 2, 10);
INSERT INTO `item_mods` VALUES (11468, 24, 8);
INSERT INTO `item_mods` VALUES (11469, 1, 25);
INSERT INTO `item_mods` VALUES (11469, 2, 12);
INSERT INTO `item_mods` VALUES (11469, 24, 10);
INSERT INTO `item_mods` VALUES (11470, 1, 16);
INSERT INTO `item_mods` VALUES (11470, 2, 15);
INSERT INTO `item_mods` VALUES (11470, 9, 5);
INSERT INTO `item_mods` VALUES (11470, 10, 5);
INSERT INTO `item_mods` VALUES (11470, 13, 5);
INSERT INTO `item_mods` VALUES (11471, 1, 19);
INSERT INTO `item_mods` VALUES (11471, 2, 12);
INSERT INTO `item_mods` VALUES (11471, 8, 3);
INSERT INTO `item_mods` VALUES (11471, 11, 3);
INSERT INTO `item_mods` VALUES (11471, 370, 1);
INSERT INTO `item_mods` VALUES (11472, 1, 20);
INSERT INTO `item_mods` VALUES (11472, 2, 12);
INSERT INTO `item_mods` VALUES (11472, 8, 4);
INSERT INTO `item_mods` VALUES (11472, 11, 4);
INSERT INTO `item_mods` VALUES (11472, 370, 1);
INSERT INTO `item_mods` VALUES (11473, 1, 20);
INSERT INTO `item_mods` VALUES (11473, 27, -7);
INSERT INTO `item_mods` VALUES (11473, 71, 3);
INSERT INTO `item_mods` VALUES (11474, 1, 25);
INSERT INTO `item_mods` VALUES (11475, 1, 19);
INSERT INTO `item_mods` VALUES (11475, 2, 15);
INSERT INTO `item_mods` VALUES (11475, 9, 4);
INSERT INTO `item_mods` VALUES (11475, 14, 4);
INSERT INTO `item_mods` VALUES (11475, 27, -2);
INSERT INTO `item_mods` VALUES (11475, 490, 30);
INSERT INTO `item_mods` VALUES (11476, 1, 19);
INSERT INTO `item_mods` VALUES (11476, 2, 15);
INSERT INTO `item_mods` VALUES (11476, 9, 4);
INSERT INTO `item_mods` VALUES (11476, 14, 4);
INSERT INTO `item_mods` VALUES (11476, 27, -2);
INSERT INTO `item_mods` VALUES (11476, 490, 30);
INSERT INTO `item_mods` VALUES (11477, 1, 16);
INSERT INTO `item_mods` VALUES (11477, 5, 20);
INSERT INTO `item_mods` VALUES (11477, 12, 5);
INSERT INTO `item_mods` VALUES (11477, 27, -1);
INSERT INTO `item_mods` VALUES (11477, 401, 1);
INSERT INTO `item_mods` VALUES (11478, 1, 18);
INSERT INTO `item_mods` VALUES (11478, 2, 20);
INSERT INTO `item_mods` VALUES (11478, 8, 4);
INSERT INTO `item_mods` VALUES (11478, 23, 5);
INSERT INTO `item_mods` VALUES (11478, 491, 5);
INSERT INTO `item_mods` VALUES (11479, 1, 19);
INSERT INTO `item_mods` VALUES (11479, 2, 20);
INSERT INTO `item_mods` VALUES (11479, 8, 5);
INSERT INTO `item_mods` VALUES (11479, 23, 7);
INSERT INTO `item_mods` VALUES (11479, 491, 5);
INSERT INTO `item_mods` VALUES (11480, 1, 16);
INSERT INTO `item_mods` VALUES (11480, 2, 10);
INSERT INTO `item_mods` VALUES (11480, 5, 10);
INSERT INTO `item_mods` VALUES (11480, 13, 5);
INSERT INTO `item_mods` VALUES (11480, 115, 7);
INSERT INTO `item_mods` VALUES (11480, 489, -5);
INSERT INTO `item_mods` VALUES (11481, 1, 17);
INSERT INTO `item_mods` VALUES (11481, 2, 12);
INSERT INTO `item_mods` VALUES (11481, 5, 12);
INSERT INTO `item_mods` VALUES (11481, 13, 6);
INSERT INTO `item_mods` VALUES (11481, 115, 7);
INSERT INTO `item_mods` VALUES (11481, 489, -5);
INSERT INTO `item_mods` VALUES (11482, 1, 1);
INSERT INTO `item_mods` VALUES (11482, 14, 1);
INSERT INTO `item_mods` VALUES (11483, 1, 17);
INSERT INTO `item_mods` VALUES (11483, 68, 10);
INSERT INTO `item_mods` VALUES (11483, 107, 8);
INSERT INTO `item_mods` VALUES (11483, 110, 8);
INSERT INTO `item_mods` VALUES (11484, 9, 3);
INSERT INTO `item_mods` VALUES (11484, 11, 3);
INSERT INTO `item_mods` VALUES (11484, 23, 5);
INSERT INTO `item_mods` VALUES (11485, 10, -1);
INSERT INTO `item_mods` VALUES (11486, 1, 20);
INSERT INTO `item_mods` VALUES (11486, 30, 4);
INSERT INTO `item_mods` VALUES (11486, 232, 2);
INSERT INTO `item_mods` VALUES (11487, 1, 24);
INSERT INTO `item_mods` VALUES (11487, 2, 15);
INSERT INTO `item_mods` VALUES (11487, 291, 3);
INSERT INTO `item_mods` VALUES (11488, 1, 21);
INSERT INTO `item_mods` VALUES (11488, 2, 10);
INSERT INTO `item_mods` VALUES (11488, 5, 10);
INSERT INTO `item_mods` VALUES (11488, 289, 3);
INSERT INTO `item_mods` VALUES (11489, 1, 19);
INSERT INTO `item_mods` VALUES (11489, 5, 20);
INSERT INTO `item_mods` VALUES (11489, 296, 3);
INSERT INTO `item_mods` VALUES (11492, 8, 3);
INSERT INTO `item_mods` VALUES (11492, 11, -3);
INSERT INTO `item_mods` VALUES (11492, 24, 3);
INSERT INTO `item_mods` VALUES (11492, 26, -3);
INSERT INTO `item_mods` VALUES (11493, 1, 8);
INSERT INTO `item_mods` VALUES (11493, 25, 3);
INSERT INTO `item_mods` VALUES (11494, 1, 8);
INSERT INTO `item_mods` VALUES (11494, 5, 6);
INSERT INTO `item_mods` VALUES (11494, 13, 2);
INSERT INTO `item_mods` VALUES (11495, 1, 19);
INSERT INTO `item_mods` VALUES (11495, 23, 2);
INSERT INTO `item_mods` VALUES (11495, 25, 2);
INSERT INTO `item_mods` VALUES (11495, 384, 11);
INSERT INTO `item_mods` VALUES (11496, 1, 10);
INSERT INTO `item_mods` VALUES (11496, 5, 12);
INSERT INTO `item_mods` VALUES (11497, 1, 17);
INSERT INTO `item_mods` VALUES (11497, 25, 3);
INSERT INTO `item_mods` VALUES (11497, 384, 30);
INSERT INTO `item_mods` VALUES (11498, 1, 20);
INSERT INTO `item_mods` VALUES (11498, 23, 3);
INSERT INTO `item_mods` VALUES (11498, 25, 3);
INSERT INTO `item_mods` VALUES (11498, 384, 20);

-- -------------------------------------------------------
-- Nocturnus Helm
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11501, 1, 24); -- def 24
INSERT INTO `item_mods` VALUES (11501, 8, 6); -- str 6
INSERT INTO `item_mods` VALUES (11501, 9, 6); -- dex 6
INSERT INTO `item_mods` VALUES (11501, 11, 6); -- agi 6
INSERT INTO `item_mods` VALUES (11501, 23, 8); -- attack 8
INSERT INTO `item_mods` VALUES (11501, 288, 2); -- double attack 2%
INSERT INTO `item_mods` VALUES (11501, 416, 15);-- Physical null damage chance

-- -------------------------------------------------------
-- Acubens Helm
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11502, 1, 28); -- def 28
INSERT INTO `item_mods` VALUES (11502, 25, -10); -- accuracy -10
INSERT INTO `item_mods` VALUES (11502, 58, -15); -- thunder -15
INSERT INTO `item_mods` VALUES (11502, 59, 15); -- water +15
INSERT INTO `item_mods` VALUES (11502, 384, 61); -- haste 6%

INSERT INTO `item_mods` VALUES (11503, 1, 37);
INSERT INTO `item_mods` VALUES (11503, 8, 5);
INSERT INTO `item_mods` VALUES (11503, 10, 5);
INSERT INTO `item_mods` VALUES (11503, 23, 7);
INSERT INTO `item_mods` VALUES (11503, 384, 30);
-- INSERT INTO `item_mods` VALUES (11503, ???, 30); TODO: Enhances Snapshot Effect
INSERT INTO `item_mods` VALUES (11504, 1, 29);
INSERT INTO `item_mods` VALUES (11504, 9, 4);
INSERT INTO `item_mods` VALUES (11504, 11, 4);
INSERT INTO `item_mods` VALUES (11504, 384, 40);
INSERT INTO `item_mods` VALUES (11505, 1, 22);
INSERT INTO `item_mods` VALUES (11505, 2, 17);
INSERT INTO `item_mods` VALUES (11505, 12, 6);
INSERT INTO `item_mods` VALUES (11505, 13, 6);
INSERT INTO `item_mods` VALUES (11505, 27, -2);
INSERT INTO `item_mods` VALUES (11525, 1, 28);
INSERT INTO `item_mods` VALUES (11525, 9, 3);
INSERT INTO `item_mods` VALUES (11525, 25, 11);
INSERT INTO `item_mods` VALUES (11526, 1, 13);
INSERT INTO `item_mods` VALUES (11526, 11, 8);
INSERT INTO `item_mods` VALUES (11526, 26, 8);
INSERT INTO `item_mods` VALUES (11527, 1, 24);
INSERT INTO `item_mods` VALUES (11527, 5, 23);
INSERT INTO `item_mods` VALUES (11527, 28, 4);
INSERT INTO `item_mods` VALUES (11527, 30, -2);
INSERT INTO `item_mods` VALUES (11528, 1, 1);
INSERT INTO `item_mods` VALUES (11528, 23, 2);
INSERT INTO `item_mods` VALUES (11529, 1, 1);
INSERT INTO `item_mods` VALUES (11529, 305, 5);
INSERT INTO `item_mods` VALUES (11530, 1, 2);
INSERT INTO `item_mods` VALUES (11530, 25, 1);
INSERT INTO `item_mods` VALUES (11532, 1, 7);
INSERT INTO `item_mods` VALUES (11532, 25, 3);
INSERT INTO `item_mods` VALUES (11532, 68, -3);
INSERT INTO `item_mods` VALUES (11533, 14, 3);
INSERT INTO `item_mods` VALUES (11533, 23, 6);
INSERT INTO `item_mods` VALUES (11534, 1, 7);
INSERT INTO `item_mods` VALUES (11534, 121, 3);
INSERT INTO `item_mods` VALUES (11535, 1, 7);
INSERT INTO `item_mods` VALUES (11535, 11, 2);
INSERT INTO `item_mods` VALUES (11535, 24, 12);
INSERT INTO `item_mods` VALUES (11536, 1, 5);
INSERT INTO `item_mods` VALUES (11537, 1, 6);
INSERT INTO `item_mods` VALUES (11537, 27, 1);
INSERT INTO `item_mods` VALUES (11537, 68, 5);
INSERT INTO `item_mods` VALUES (11539, 1, 3);
INSERT INTO `item_mods` VALUES (11539, 25, 2);
INSERT INTO `item_mods` VALUES (11540, 1, 8);
INSERT INTO `item_mods` VALUES (11540, 25, 4);
INSERT INTO `item_mods` VALUES (11540, 68, -4);
INSERT INTO `item_mods` VALUES (11541, 1, 8);
INSERT INTO `item_mods` VALUES (11541, 11, 3);
INSERT INTO `item_mods` VALUES (11541, 24, 15);
INSERT INTO `item_mods` VALUES (11542, 1, 7);
INSERT INTO `item_mods` VALUES (11542, 27, 2);
INSERT INTO `item_mods` VALUES (11542, 68, 6);

-- -------------------------------------------------------
-- Hecate's Cape
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11543, 1, 4); -- DEF:4
INSERT INTO `item_mods` VALUES (11543, 5, 7); -- MP+7
INSERT INTO `item_mods` VALUES (11543, 28, 3); -- "Magic Atk. Bonus"+
INSERT INTO `item_mods` VALUES (11543, 30, 3); -- Magic Accuracy+3

-- -------------------------------------------------------
-- Veela Cape
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11544, 1, 5); -- DEF:5
INSERT INTO `item_mods` VALUES (11544, 5, 10); -- MP+10
INSERT INTO `item_mods` VALUES (11544, 170, 2); -- Enhances "Fast Cast" effect

INSERT INTO `item_mods` VALUES (11545, 73, 2);

-- -------------------------------------------------------
-- Aesir Mantle
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11546, 1, 6); -- def 6
INSERT INTO `item_mods` VALUES (11546, 23, 8); -- attack 8
INSERT INTO `item_mods` VALUES (11546, 288, 1); -- double attack 1%

-- -------------------------------------------------------
-- Colossus's Mantle *Has Latent Effect
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11547, 1, 5); -- DEF:5
INSERT INTO `item_mods` VALUES (11547, 2, 20); -- HP+20
INSERT INTO `item_mods` VALUES (11547, 5, 20); -- MP+20
INSERT INTO `item_mods` VALUES (11547, 163, -2); -- Magic damage taken -2%

INSERT INTO `item_mods` VALUES (11548, 73, 6);
INSERT INTO `item_mods` VALUES (11550, 73, 2);
INSERT INTO `item_mods` VALUES (11554, 374, 3);
INSERT INTO `item_mods` VALUES (11556, 1, 7);
INSERT INTO `item_mods` VALUES (11556, 2, 14);
INSERT INTO `item_mods` VALUES (11556, 5, -14);
INSERT INTO `item_mods` VALUES (11556, 13, 6);
INSERT INTO `item_mods` VALUES (11557, 1, 13);
INSERT INTO `item_mods` VALUES (11557, 8, 6);
INSERT INTO `item_mods` VALUES (11557, 25, -4);
INSERT INTO `item_mods` VALUES (11558, 1, 12);
INSERT INTO `item_mods` VALUES (11558, 9, 5);
INSERT INTO `item_mods` VALUES (11558, 23, 9);
INSERT INTO `item_mods` VALUES (11559, 1, 8);
INSERT INTO `item_mods` VALUES (11559, 291, 2);
-- INSERT INTO `item_mods` VALUES (11559, ???, 10); TODO: Counter Damage
INSERT INTO `item_mods` VALUES (11560, 1, 7);
INSERT INTO `item_mods` VALUES (11560, 12, 6);
INSERT INTO `item_mods` VALUES (11560, 68, -6);
INSERT INTO `item_mods` VALUES (11561, 1, 14);
INSERT INTO `item_mods` VALUES (11561, 29, 5);
INSERT INTO `item_mods` VALUES (11561, 31, -5);
INSERT INTO `item_mods` VALUES (11562, 1, 11);
INSERT INTO `item_mods` VALUES (11562, 25, 12);
INSERT INTO `item_mods` VALUES (11562, 289, -6);
INSERT INTO `item_mods` VALUES (11563, 1, 8);
INSERT INTO `item_mods` VALUES (11563, 14, 8);
INSERT INTO `item_mods` VALUES (11563, 30, 4);
INSERT INTO `item_mods` VALUES (11564, 1, 6);
INSERT INTO `item_mods` VALUES (11564, 357, -3);
-- INSERT INTO `item_mods` VALUES (11564, ???, 1); TODO: Avatar Magic Attack Bonus
INSERT INTO `item_mods` VALUES (11565, 1, 8);
INSERT INTO `item_mods` VALUES (11565, 23, 20);
INSERT INTO `item_mods` VALUES (11565, 289, 5);
INSERT INTO `item_mods` VALUES (11566, 1, 5);
INSERT INTO `item_mods` VALUES (11566, 7, 22);
INSERT INTO `item_mods` VALUES (11566, 27, -7);
INSERT INTO `item_mods` VALUES (11567, 1, 4);
INSERT INTO `item_mods` VALUES (11567, 2, 95);
INSERT INTO `item_mods` VALUES (11567, 5, -30);
INSERT INTO `item_mods` VALUES (11568, 1, 6);
INSERT INTO `item_mods` VALUES (11568, 31, 3);
INSERT INTO `item_mods` VALUES (11568, 71, 3);
INSERT INTO `item_mods` VALUES (11569, 1, 10);
INSERT INTO `item_mods` VALUES (11569, 11, 3);
INSERT INTO `item_mods` VALUES (11569, 68, 11);
INSERT INTO `item_mods` VALUES (11570, 1, 9);
INSERT INTO `item_mods` VALUES (11570, 11, 4);
INSERT INTO `item_mods` VALUES (11570, 28, 3);
INSERT INTO `item_mods` VALUES (11571, 1, 8);
INSERT INTO `item_mods` VALUES (11571, 25, 6);
-- INSERT INTO `item_mods` VALUES (11571, ???, 12); TODO: Automaton Accuracy
INSERT INTO `item_mods` VALUES (11572, 1, 8);
INSERT INTO `item_mods` VALUES (11572, 5, 25);
INSERT INTO `item_mods` VALUES (11572, 71, 3);
INSERT INTO `item_mods` VALUES (11572, 296, 3);
INSERT INTO `item_mods` VALUES (11573, 1, 10);
INSERT INTO `item_mods` VALUES (11573, 11, 4);
INSERT INTO `item_mods` VALUES (11573, 56, 10);
INSERT INTO `item_mods` VALUES (11573, 68, 8);
INSERT INTO `item_mods` VALUES (11573, 166, -2);
INSERT INTO `item_mods` VALUES (11574, 1, 10);
INSERT INTO `item_mods` VALUES (11574, 8, 6);
INSERT INTO `item_mods` VALUES (11574, 12, 6);
INSERT INTO `item_mods` VALUES (11575, 1, 7);
INSERT INTO `item_mods` VALUES (11575, 12, 3);
INSERT INTO `item_mods` VALUES (11575, 13, 3);
-- INSERT INTO `item_mods` VALUES (11575, ???, 3); TODO: Refresh Duration Received
INSERT INTO `item_mods` VALUES (11576, 1, 8);
INSERT INTO `item_mods` VALUES (11576, 5, 15);
INSERT INTO `item_mods` VALUES (11576, 13, 4);

-- -------------------------------------------------------
-- Tiercel Necklace
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11578, 289, 5); -- subtle blow
INSERT INTO `item_mods` VALUES (11578, 384, 10); -- haste

INSERT INTO `item_mods` VALUES (11579, 374, 2);
INSERT INTO `item_mods` VALUES (11580, 374, 3);
INSERT INTO `item_mods` VALUES (11581, 8, 6);
INSERT INTO `item_mods` VALUES (11581, 25, -4);
INSERT INTO `item_mods` VALUES (11581, 26, -4);
INSERT INTO `item_mods` VALUES (11582, 8, 7);
INSERT INTO `item_mods` VALUES (11582, 25, -3);
INSERT INTO `item_mods` VALUES (11582, 26, -3);
INSERT INTO `item_mods` VALUES (11583, 12, 4);
INSERT INTO `item_mods` VALUES (11583, 115, 4);
INSERT INTO `item_mods` VALUES (11584, 12, 5);
INSERT INTO `item_mods` VALUES (11584, 115, 5);

-- -------------------------------------------------------
-- Beguiling Collar *Has Latent Effect
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11585, 2, 20); -- HP+20
INSERT INTO `item_mods` VALUES (11585, 5, 20); -- MP+20
INSERT INTO `item_mods` VALUES (11585, 27, -3); -- Enmity-3

-- -------------------------------------------------------
-- Backlash Torque
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11586, 23, 8); -- Attack+8
INSERT INTO `item_mods` VALUES (11586, 291, 1); -- "Counter"+1

-- -------------------------------------------------------
-- Nyx Gorget
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11587, 1, 2); -- DEF:2
INSERT INTO `item_mods` VALUES (11587, 232, 2); -- Enhances "Arcana Killer" effect

-- -------------------------------------------------------
-- Mrc.Mjr. Charm
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11588, 5, 25); -- MP+25

-- -------------------------------------------------------
-- Aesir Torque
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11589, 61, 20); -- [Element: Dark]+20
INSERT INTO `item_mods` VALUES (11589, 115, 7); -- Elemental magic skill +7
INSERT INTO `item_mods` VALUES (11589, 116, 7); -- Dark magic skill +7

-- -------------------------------------------------------
-- Colossus's Torque *Has Latent Effect
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11590, 60, 20); -- [Element: Light]+20
INSERT INTO `item_mods` VALUES (11590, 112, 7); -- Healing magic skill +7
INSERT INTO `item_mods` VALUES (11590, 113, 7); -- Enhancing magic skill +7

-- -------------------------------------------------------
-- Tantra Necklace
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11592, 25, 5); -- accuracy
INSERT INTO `item_mods` VALUES (11592, 292, 2); -- kick attacks

-- -------------------------------------------------------
-- Creed Collar
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11595, 369, 1); -- Refresh
INSERT INTO `item_mods` VALUES (11595, 427, 1); -- TODO: Reduces Enmity decrease when taking physical damage

-- -------------------------------------------------------
-- Sylvan Scarf
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11596, 11, 6); -- agi
INSERT INTO `item_mods` VALUES (11596, 26, 8); -- ranged attack
INSERT INTO `item_mods` VALUES (11596, 27, -3); -- enmity


-- -------------------------------------------------------
-- Iga Erimaki
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11598, 25, 7); -- accuracy
INSERT INTO `item_mods` VALUES (11598, 68, 7); -- evasion
INSERT INTO `item_mods` VALUES (11598, 421, 2); -- Crit hit damage % increase

INSERT INTO `item_mods` VALUES (11599, 8, 5);
INSERT INTO `item_mods` VALUES (11599, 25, 5);
INSERT INTO `item_mods` VALUES (11599, 402, 5);
INSERT INTO `item_mods` VALUES (11606, 11, 6);
INSERT INTO `item_mods` VALUES (11606, 26, 6);
-- INSERT INTO `item_mods` VALUES (11607, ???, ?); TODO: MACC & MATK Varies w/ Moonphase
INSERT INTO `item_mods` VALUES (11608, 14, 2);
INSERT INTO `item_mods` VALUES (11608, 119, 5);
INSERT INTO `item_mods` VALUES (11609, 9, 5);
INSERT INTO `item_mods` VALUES (11609, 11, -3);
INSERT INTO `item_mods` VALUES (11610, 8, 5);
INSERT INTO `item_mods` VALUES (11610, 10, -3);
INSERT INTO `item_mods` VALUES (11611, 5, 16);
INSERT INTO `item_mods` VALUES (11611, 8, -4);
INSERT INTO `item_mods` VALUES (11611, 10, -4);
-- INSERT INTO `item_mods` VALUES (11611, ???, -10); TODO: Cure Cast Time
INSERT INTO `item_mods` VALUES (11612, 71, 4);
-- INSERT INTO `item_mods` VALUES (11612, ???, 2); TODO: Avatar Magic Attack Bonus
INSERT INTO `item_mods` VALUES (11613, 27, 4);
INSERT INTO `item_mods` VALUES (11613, 29, 1);
INSERT INTO `item_mods` VALUES (11614, 1, 5);
INSERT INTO `item_mods` VALUES (11614, 2, 25);
INSERT INTO `item_mods` VALUES (11614, 5, -40);
INSERT INTO `item_mods` VALUES (11614, 162, 5);
INSERT INTO `item_mods` VALUES (11616, 369, 1);
INSERT INTO `item_mods` VALUES (11623, 13, 4);
INSERT INTO `item_mods` VALUES (11623, 30, 4);
INSERT INTO `item_mods` VALUES (11624, 5, 12);
INSERT INTO `item_mods` VALUES (11624, 12, 2);
INSERT INTO `item_mods` VALUES (11624, 28, 1);

-- -------------------------------------------------------
-- Strigoi Ring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11628, 8, 6); -- STR+6
INSERT INTO `item_mods` VALUES (11628, 23, 3); -- Attack+3

-- -------------------------------------------------------
-- Zilant Ring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11629, 9, 6); -- DEX+6
INSERT INTO `item_mods` VALUES (11629, 25, 3); -- Accuracy+3

-- -------------------------------------------------------
-- Corneus Ring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11630, 10, 6); -- VIT+6
INSERT INTO `item_mods` VALUES (11630, 27, 2); -- Enmity+2

-- -------------------------------------------------------
-- Blobnag Ring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11631, 11, 6); -- AGI+6
INSERT INTO `item_mods` VALUES (11631, 26, 3); -- Ranged Accuracy+3

-- -------------------------------------------------------
-- Karka Ring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11632, 13, 6); -- MND+6
INSERT INTO `item_mods` VALUES (11632, 30, 1); -- Magic Accuracy+1

-- -------------------------------------------------------
-- Galdr Ring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11633, 12, 6); -- INT+6
INSERT INTO `item_mods` VALUES (11633, 28, 1); -- Magic Atk. Bonus"+1

-- -------------------------------------------------------
-- Veela Ring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11634, 14, 6); -- CHR+6
INSERT INTO `item_mods` VALUES (11634, 27, -2); -- Enmity-2

-- -------------------------------------------------------
-- Alert Ring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11635, 25, -3); -- accuracy -3
INSERT INTO `item_mods` VALUES (11635, 68, 6); -- evasion +6

-- -------------------------------------------------------
-- R.K. Sigil Ring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11636, 1, 30); -- HP+30

INSERT INTO `item_mods` VALUES (11639, 24, 7);
INSERT INTO `item_mods` VALUES (11639, 26, -7);
INSERT INTO `item_mods` VALUES (11640, 7, 70);
INSERT INTO `item_mods` VALUES (11641, 5, 15);
INSERT INTO `item_mods` VALUES (11641, 12, -4);
INSERT INTO `item_mods` VALUES (11641, 13, -4);
INSERT INTO `item_mods` VALUES (11641, 27, -5);
INSERT INTO `item_mods` VALUES (11642, 8, -4);
INSERT INTO `item_mods` VALUES (11642, 9, -4);
INSERT INTO `item_mods` VALUES (11642, 73, 4);
INSERT INTO `item_mods` VALUES (11643, 1, 10);
INSERT INTO `item_mods` VALUES (11643, 27, 4);
INSERT INTO `item_mods` VALUES (11644, 1, 1);
INSERT INTO `item_mods` VALUES (11644, 24, 14);
INSERT INTO `item_mods` VALUES (11644, 26, -14);
INSERT INTO `item_mods` VALUES (11645, 1, 2);
INSERT INTO `item_mods` VALUES (11645, 24, 15);
INSERT INTO `item_mods` VALUES (11645, 26, -13);
INSERT INTO `item_mods` VALUES (11646, 10, 3);
INSERT INTO `item_mods` VALUES (11646, 13, 3);
INSERT INTO `item_mods` VALUES (11646, 112, 10);
INSERT INTO `item_mods` VALUES (11647, 1, 4);
INSERT INTO `item_mods` VALUES (11647, 9, 5);
INSERT INTO `item_mods` VALUES (11647, 14, 5);
INSERT INTO `item_mods` VALUES (11648, 1, 4);
INSERT INTO `item_mods` VALUES (11648, 8, 5);
INSERT INTO `item_mods` VALUES (11648, 10, 5);
INSERT INTO `item_mods` VALUES (11648, 12, 5);
INSERT INTO `item_mods` VALUES (11649, 1, 4);
INSERT INTO `item_mods` VALUES (11649, 11, 5);
INSERT INTO `item_mods` VALUES (11649, 13, 5);
INSERT INTO `item_mods` VALUES (11650, 25, 3);
INSERT INTO `item_mods` VALUES (11650, 68, 3);
INSERT INTO `item_mods` VALUES (11650, 289, 7);
INSERT INTO `item_mods` VALUES (11653, 23, 7);
INSERT INTO `item_mods` VALUES (11653, 25, 3);
INSERT INTO `item_mods` VALUES (11656, 8, 7);
INSERT INTO `item_mods` VALUES (11656, 13, -3);

-- -------------------------------------------------------
-- Icesoul Ring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11657, 8, -3); -- STR -3
INSERT INTO `item_mods` VALUES (11657, 12, 7); -- INT +7
INSERT INTO `item_mods` VALUES (11657, 244, 5); -- Enhances "Resist Silence" effect

INSERT INTO `item_mods` VALUES (11658, 11, 7);
INSERT INTO `item_mods` VALUES (11658, 12, -3);
INSERT INTO `item_mods` VALUES (11659, 10, 7);
INSERT INTO `item_mods` VALUES (11659, 11, -3);
INSERT INTO `item_mods` VALUES (11660, 9, 7);
INSERT INTO `item_mods` VALUES (11660, 10, -3);
INSERT INTO `item_mods` VALUES (11661, 9, -3);
INSERT INTO `item_mods` VALUES (11661, 13, 7);
INSERT INTO `item_mods` VALUES (11662, 5, -15);
INSERT INTO `item_mods` VALUES (11662, 14, 7);
INSERT INTO `item_mods` VALUES (11662, 248, 1); -- TODO: Curse Resist Confirm Amount
INSERT INTO `item_mods` VALUES (11663, 2, -15);
INSERT INTO `item_mods` VALUES (11663, 5, 35);
INSERT INTO `item_mods` VALUES (11663, 252, 1); -- TODO: Charm Resist Confirm Amount
INSERT INTO `item_mods` VALUES (11664, 2, 12);
INSERT INTO `item_mods` VALUES (11664, 5, -12);
INSERT INTO `item_mods` VALUES (11665, 2, 13);
INSERT INTO `item_mods` VALUES (11665, 5, -13);
INSERT INTO `item_mods` VALUES (11667, 2, 11);
INSERT INTO `item_mods` VALUES (11668, 12, 3);
INSERT INTO `item_mods` VALUES (11668, 114, 4);
INSERT INTO `item_mods` VALUES (11668, 115, 4);
INSERT INTO `item_mods` VALUES (11671, 25, 3);
INSERT INTO `item_mods` VALUES (11672, 174, 5);
INSERT INTO `item_mods` VALUES (11672, 487, 5);
INSERT INTO `item_mods` VALUES (11673, 23, 7);
-- INSERT INTO `item_mods` VALUES (11673,  ???, 3); TODO: Increase Triple Attack Damage
INSERT INTO `item_mods` VALUES (11675, 117, 4);
-- INSERT INTO `item_mods` VALUES (11675, ???, 2); TODO: Ifrit Magic Attack Bonus
INSERT INTO `item_mods` VALUES (11676, 11, 4);
INSERT INTO `item_mods` VALUES (11678, 8, 2);
INSERT INTO `item_mods` VALUES (11678, 54, 15);
INSERT INTO `item_mods` VALUES (11678, 55, 15);
INSERT INTO `item_mods` VALUES (11679, 9, 2);
INSERT INTO `item_mods` VALUES (11679, 58, 15);
INSERT INTO `item_mods` VALUES (11679, 59, 15);
INSERT INTO `item_mods` VALUES (11680, 10, 2);
INSERT INTO `item_mods` VALUES (11680, 57, 15);
INSERT INTO `item_mods` VALUES (11680, 58, 15);
INSERT INTO `item_mods` VALUES (11681, 11, 2);
INSERT INTO `item_mods` VALUES (11681, 56, 15);
INSERT INTO `item_mods` VALUES (11681, 57, 15);
INSERT INTO `item_mods` VALUES (11682, 12, 2);
INSERT INTO `item_mods` VALUES (11682, 55, 15);
INSERT INTO `item_mods` VALUES (11682, 56, 15);
INSERT INTO `item_mods` VALUES (11683, 13, 2);
INSERT INTO `item_mods` VALUES (11683, 54, 15);
INSERT INTO `item_mods` VALUES (11683, 59, 15);
INSERT INTO `item_mods` VALUES (11684, 2, 15);
INSERT INTO `item_mods` VALUES (11684, 27, -1);
INSERT INTO `item_mods` VALUES (11684, 60, 15);
INSERT INTO `item_mods` VALUES (11685, 5, 15);
INSERT INTO `item_mods` VALUES (11685, 27, 1);
INSERT INTO `item_mods` VALUES (11685, 61, 15);
INSERT INTO `item_mods` VALUES (11686, 8, 3);
INSERT INTO `item_mods` VALUES (11686, 54, 16);
INSERT INTO `item_mods` VALUES (11686, 55, 16);
INSERT INTO `item_mods` VALUES (11687, 9, 3);
INSERT INTO `item_mods` VALUES (11687, 58, 16);
INSERT INTO `item_mods` VALUES (11687, 59, 16);
INSERT INTO `item_mods` VALUES (11688, 10, 3);
INSERT INTO `item_mods` VALUES (11688, 57, 16);
INSERT INTO `item_mods` VALUES (11688, 58, 16);
INSERT INTO `item_mods` VALUES (11689, 11, 3);
INSERT INTO `item_mods` VALUES (11689, 56, 16);
INSERT INTO `item_mods` VALUES (11689, 57, 16);
INSERT INTO `item_mods` VALUES (11690, 12, 3);
INSERT INTO `item_mods` VALUES (11690, 55, 16);
INSERT INTO `item_mods` VALUES (11690, 56, 16);
INSERT INTO `item_mods` VALUES (11691, 13, 3);
INSERT INTO `item_mods` VALUES (11691, 54, 16);
INSERT INTO `item_mods` VALUES (11691, 59, 16);
INSERT INTO `item_mods` VALUES (11692, 2, 20);
INSERT INTO `item_mods` VALUES (11692, 27, -3);
INSERT INTO `item_mods` VALUES (11692, 60, 16);
INSERT INTO `item_mods` VALUES (11693, 5, 20);
INSERT INTO `item_mods` VALUES (11693, 27, 3);
INSERT INTO `item_mods` VALUES (11693, 61, 16);
INSERT INTO `item_mods` VALUES (11694, 1, 3);
INSERT INTO `item_mods` VALUES (11694, 2, 35);
INSERT INTO `item_mods` VALUES (11694, 5, 15);
INSERT INTO `item_mods` VALUES (11695, 26, 4);
INSERT INTO `item_mods` VALUES (11695, 73, 2);
INSERT INTO `item_mods` VALUES (11696, 8, 2);
INSERT INTO `item_mods` VALUES (11696, 10, 2);
INSERT INTO `item_mods` VALUES (11696, 25, 4);
INSERT INTO `item_mods` VALUES (11701, 5, 10);
INSERT INTO `item_mods` VALUES (11701, 14, 3);
INSERT INTO `item_mods` VALUES (11702, 23, 10);
INSERT INTO `item_mods` VALUES (11702, 68, -5);

-- -------------------------------------------------------
-- Tantra Earring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11704, 2, 10); -- HP
INSERT INTO `item_mods` VALUES (11704, 292, 1); -- kick attacks

INSERT INTO `item_mods` VALUES (11705, 374, 2);

-- -------------------------------------------------------
-- Creed Earring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11709, 2, 30); -- HP
INSERT INTO `item_mods` VALUES (11709, 109, 3); -- Shield skill

INSERT INTO `item_mods` VALUES (11711, 364, 2);

-- -------------------------------------------------------
-- Sylvan Earring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11713, 11, 4); -- agi
INSERT INTO `item_mods` VALUES (11713, 27, -2); -- enmity

INSERT INTO `item_mods` VALUES (11714, 73, 1);

-- -------------------------------------------------------
-- Iga Mimikazari
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11715, 68, 5); -- evasion
INSERT INTO `item_mods` VALUES (11715, 259, 1); -- dual wield

INSERT INTO `item_mods` VALUES (11723, 5, 5);
INSERT INTO `item_mods` VALUES (11723, 14, 2);
INSERT INTO `item_mods` VALUES (11724, 5, 10);
INSERT INTO `item_mods` VALUES (11724, 14, 3);
INSERT INTO `item_mods` VALUES (11725, 23, -6);
INSERT INTO `item_mods` VALUES (11725, 25, 6);
INSERT INTO `item_mods` VALUES (11726, 23, -7);
INSERT INTO `item_mods` VALUES (11726, 25, 7);
INSERT INTO `item_mods` VALUES (11727, 9, 3);
INSERT INTO `item_mods` VALUES (11740, 1, 8);
INSERT INTO `item_mods` VALUES (11740, 8, -4);
INSERT INTO `item_mods` VALUES (11740, 9, 7);
INSERT INTO `item_mods` VALUES (11741, 1, 6);
INSERT INTO `item_mods` VALUES (11741, 2, -20);
INSERT INTO `item_mods` VALUES (11741, 8, 5);
INSERT INTO `item_mods` VALUES (11741, 25, 10);
INSERT INTO `item_mods` VALUES (11742, 1, 2);
INSERT INTO `item_mods` VALUES (11742, 5, -30);
INSERT INTO `item_mods` VALUES (11742, 12, 7);
INSERT INTO `item_mods` VALUES (11743, 1, 3);
INSERT INTO `item_mods` VALUES (11743, 27, 2);
INSERT INTO `item_mods` VALUES (11743, 28, 3);
INSERT INTO `item_mods` VALUES (11744, 1, 4);
INSERT INTO `item_mods` VALUES (11744, 7, 20);
INSERT INTO `item_mods` VALUES (11744, 13, 7);
INSERT INTO `item_mods` VALUES (11745, 1, 5);
INSERT INTO `item_mods` VALUES (11745, 14, 8);
INSERT INTO `item_mods` VALUES (11745, 27, -1);
INSERT INTO `item_mods` VALUES (11746, 1, 3);
INSERT INTO `item_mods` VALUES (11746, 5, 55);
INSERT INTO `item_mods` VALUES (11746, 27, -2);
INSERT INTO `item_mods` VALUES (11747, 1, 4);
INSERT INTO `item_mods` VALUES (11747, 71, 4);
INSERT INTO `item_mods` VALUES (11747, 296, 8);
INSERT INTO `item_mods` VALUES (11748, 1, 6);
INSERT INTO `item_mods` VALUES (11748, 8, -7);
INSERT INTO `item_mods` VALUES (11748, 9, -7);
INSERT INTO `item_mods` VALUES (11748, 10, -7);
INSERT INTO `item_mods` VALUES (11748, 11, -7);
INSERT INTO `item_mods` VALUES (11748, 12, -7);
INSERT INTO `item_mods` VALUES (11748, 13, -7);
INSERT INTO `item_mods` VALUES (11748, 14, -7);
INSERT INTO `item_mods` VALUES (11748, 27, -7);
INSERT INTO `item_mods` VALUES (11749, 1, 7);
INSERT INTO `item_mods` VALUES (11749, 11, 7);
INSERT INTO `item_mods` VALUES (11749, 23, -8);
INSERT INTO `item_mods` VALUES (11749, 68, 8);

-- -------------------------------------------------------
-- Creed Baudrier
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11750, 1, 10); -- def
INSERT INTO `item_mods` VALUES (11750, 2, 40); -- HP
INSERT INTO `item_mods` VALUES (11750, 27, 5); -- enmity
INSERT INTO `item_mods` VALUES (11750, 29, 4); -- Magic defence

INSERT INTO `item_mods` VALUES (11753, 1, 5);
INSERT INTO `item_mods` VALUES (11753, 5, 20);
INSERT INTO `item_mods` VALUES (11753, 168, 12);
-- INSERT INTO `item_mods` VALUES (11753, ???, ???); TODO: Enhances Aquaveil Effect
INSERT INTO `item_mods` VALUES (11754, 1, 8);
INSERT INTO `item_mods` VALUES (11754, 8, 5);
INSERT INTO `item_mods` VALUES (11754, 11, 5);
INSERT INTO `item_mods` VALUES (11754, 13, 5);
INSERT INTO `item_mods` VALUES (11754, 27, -3);
INSERT INTO `item_mods` VALUES (11763, 1, 9);
INSERT INTO `item_mods` VALUES (11763, 8, 8);
INSERT INTO `item_mods` VALUES (11763, 9, -8);
INSERT INTO `item_mods` VALUES (11764, 1, 10);
INSERT INTO `item_mods` VALUES (11764, 8, 9);
INSERT INTO `item_mods` VALUES (11764, 9, -7);
INSERT INTO `item_mods` VALUES (11765, 1, 5);
INSERT INTO `item_mods` VALUES (11765, 12, 5);
INSERT INTO `item_mods` VALUES (11765, 27, -3);
INSERT INTO `item_mods` VALUES (11765, 168, -8);
INSERT INTO `item_mods` VALUES (11766, 1, 6);
INSERT INTO `item_mods` VALUES (11766, 12, 6);
INSERT INTO `item_mods` VALUES (11766, 27, -4);
INSERT INTO `item_mods` VALUES (11766, 168, 10);
INSERT INTO `item_mods` VALUES (11770, 2, -10);
INSERT INTO `item_mods` VALUES (11770, 5, -10);
INSERT INTO `item_mods` VALUES (11770, 384, 71);
INSERT INTO `item_mods` VALUES (11771, 1, 9);
INSERT INTO `item_mods` VALUES (11771, 8, 6);
INSERT INTO `item_mods` VALUES (11771, 9, 6);
INSERT INTO `item_mods` VALUES (11771, 229, 5);
INSERT INTO `item_mods` VALUES (11772, 1, 5);
INSERT INTO `item_mods` VALUES (11772, 2, 20);
INSERT INTO `item_mods` VALUES (11772, 5, 20);
INSERT INTO `item_mods` VALUES (11772, 28, 4);
INSERT INTO `item_mods` VALUES (11773, 1, 8);
INSERT INTO `item_mods` VALUES (11773, 2, 55);
INSERT INTO `item_mods` VALUES (11773, 8, 3);
INSERT INTO `item_mods` VALUES (11775, 1, 4);
INSERT INTO `item_mods` VALUES (11775, 73, 2);
-- INSERT INTO `item_mods` VALUES (11775, ???, ???); TODO: Enhance Occult Acumen Effect
INSERT INTO `item_mods` VALUES (11776, 1, 4);
INSERT INTO `item_mods` VALUES (11776, 5, 60);
-- INSERT INTO `item_mods` VALUES (11776, ???, 10); TODO: Avatar Attack
INSERT INTO `item_mods` VALUES (11777, 1, 6);
INSERT INTO `item_mods` VALUES (11777, 13, 4);
INSERT INTO `item_mods` VALUES (11777, 14, 4);
INSERT INTO `item_mods` VALUES (11777, 30, 4);
INSERT INTO `item_mods` VALUES (11778, 1, 24);
INSERT INTO `item_mods` VALUES (11778, 24, 5);
INSERT INTO `item_mods` VALUES (11778, 26, -3);
INSERT INTO `item_mods` VALUES (11778, 68, 8);
INSERT INTO `item_mods` VALUES (11778, 73, 1);
INSERT INTO `item_mods` VALUES (11779, 1, 25);
INSERT INTO `item_mods` VALUES (11779, 24, 6);
INSERT INTO `item_mods` VALUES (11779, 26, -2);
INSERT INTO `item_mods` VALUES (11779, 68, 9);
INSERT INTO `item_mods` VALUES (11779, 73, 2);
INSERT INTO `item_mods` VALUES (11780, 1, 39);
INSERT INTO `item_mods` VALUES (11780, 12, -4);
INSERT INTO `item_mods` VALUES (11780, 23, 8);
INSERT INTO `item_mods` VALUES (11780, 27, 5);
INSERT INTO `item_mods` VALUES (11781, 1, 49);
INSERT INTO `item_mods` VALUES (11781, 12, -5);
INSERT INTO `item_mods` VALUES (11781, 23, 9);
INSERT INTO `item_mods` VALUES (11781, 27, 6);
INSERT INTO `item_mods` VALUES (11782, 1, 13);
INSERT INTO `item_mods` VALUES (11782, 5, 12);
INSERT INTO `item_mods` VALUES (11782, 27, -8);
INSERT INTO `item_mods` VALUES (11782, 68, -3);
INSERT INTO `item_mods` VALUES (11782, 163, -1);
INSERT INTO `item_mods` VALUES (11783, 1, 14);
INSERT INTO `item_mods` VALUES (11783, 5, 13);
INSERT INTO `item_mods` VALUES (11783, 27, -9);
INSERT INTO `item_mods` VALUES (11783, 68, -2);
INSERT INTO `item_mods` VALUES (11783, 163, -2);
INSERT INTO `item_mods` VALUES (11798, 1, 41);
INSERT INTO `item_mods` VALUES (11798, 8, 10);
INSERT INTO `item_mods` VALUES (11798, 9, 10);
INSERT INTO `item_mods` VALUES (11798, 10, 10);
INSERT INTO `item_mods` VALUES (11798, 11, 10);
INSERT INTO `item_mods` VALUES (11798, 12, 10);
INSERT INTO `item_mods` VALUES (11798, 13, 10);
INSERT INTO `item_mods` VALUES (11798, 14, 10);
INSERT INTO `item_mods` VALUES (11798, 23, 25);
INSERT INTO `item_mods` VALUES (11798, 370, 2);
INSERT INTO `item_mods` VALUES (11800, 1, 25);
INSERT INTO `item_mods` VALUES (11800, 5, 20);
INSERT INTO `item_mods` VALUES (11800, 13, 7);
INSERT INTO `item_mods` VALUES (11800, 27, -3);
INSERT INTO `item_mods` VALUES (11800, 30, 2);
INSERT INTO `item_mods` VALUES (11801, 1, 29);
INSERT INTO `item_mods` VALUES (11801, 9, 6);
INSERT INTO `item_mods` VALUES (11801, 11, 6);
INSERT INTO `item_mods` VALUES (11801, 25, 5);
INSERT INTO `item_mods` VALUES (11801, 27, 3);
INSERT INTO `item_mods` VALUES (11802, 1, 30);
INSERT INTO `item_mods` VALUES (11802, 10, -5);
INSERT INTO `item_mods` VALUES (11802, 23, 8);
INSERT INTO `item_mods` VALUES (11802, 25, 8);
INSERT INTO `item_mods` VALUES (11802, 289, 4);
INSERT INTO `item_mods` VALUES (11803, 1, 31);
INSERT INTO `item_mods` VALUES (11803, 8, 4);
INSERT INTO `item_mods` VALUES (11803, 23, 8);
INSERT INTO `item_mods` VALUES (11803, 25, 8);
INSERT INTO `item_mods` VALUES (11803, 289, 4);
INSERT INTO `item_mods` VALUES (11804, 1, 34);
INSERT INTO `item_mods` VALUES (11804, 11, 7);
INSERT INTO `item_mods` VALUES (11804, 24, -6);
INSERT INTO `item_mods` VALUES (11804, 26, 6);
INSERT INTO `item_mods` VALUES (11804, 27, -4);
INSERT INTO `item_mods` VALUES (11805, 1, 35);
INSERT INTO `item_mods` VALUES (11805, 8, 4);
INSERT INTO `item_mods` VALUES (11805, 11, 7);
INSERT INTO `item_mods` VALUES (11805, 26, 6);
INSERT INTO `item_mods` VALUES (11805, 27, -4);
INSERT INTO `item_mods` VALUES (11806, 1, 22);
INSERT INTO `item_mods` VALUES (11806, 5, -15);
INSERT INTO `item_mods` VALUES (11806, 13, 5);
INSERT INTO `item_mods` VALUES (11806, 27, 3);
INSERT INTO `item_mods` VALUES (11806, 30, 5);
INSERT INTO `item_mods` VALUES (11807, 1, 22);
INSERT INTO `item_mods` VALUES (11807, 13, 5);
INSERT INTO `item_mods` VALUES (11807, 30, 5);
-- INSERT INTO `item_mods` VALUES (11807, ???, 3); TODO: Magic Critical Hit Rate
INSERT INTO `item_mods` VALUES (11808, 1, 38);
INSERT INTO `item_mods` VALUES (11808, 23, 14);
INSERT INTO `item_mods` VALUES (11808, 85, 5);
INSERT INTO `item_mods` VALUES (11808, 86, 5);
INSERT INTO `item_mods` VALUES (11808, 89, 5);
INSERT INTO `item_mods` VALUES (11808, 384, 51);
INSERT INTO `item_mods` VALUES (11809, 1, 28);
INSERT INTO `item_mods` VALUES (11809, 8, 6);
INSERT INTO `item_mods` VALUES (11809, 9, 6);
INSERT INTO `item_mods` VALUES (11809, 11, 6);
INSERT INTO `item_mods` VALUES (11809, 81, 5);
INSERT INTO `item_mods` VALUES (11809, 84, 5);
INSERT INTO `item_mods` VALUES (11809, 104, 5);
INSERT INTO `item_mods` VALUES (11809, 289, 5);
INSERT INTO `item_mods` VALUES (11810, 1, 28);
INSERT INTO `item_mods` VALUES (11810, 13, 7);
INSERT INTO `item_mods` VALUES (11810, 14, 7);
INSERT INTO `item_mods` VALUES (11810, 27, -4);
INSERT INTO `item_mods` VALUES (11810, 111, 10);
INSERT INTO `item_mods` VALUES (11810, 112, 10);
INSERT INTO `item_mods` VALUES (11810, 114, 10);

-- -------------------------------------------------------
-- Destrier Beret
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11811, 1, 7); -- DEF:7

	-- -------------------------------------------------------
-- Charity Cap
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11812, 1, 1); -- DEF:1

INSERT INTO `item_mods` VALUES (11813, 12, 3);
INSERT INTO `item_mods` VALUES (11813, 13, 3);
INSERT INTO `item_mods` VALUES (11813, 34, 6);
INSERT INTO `item_mods` VALUES (11813, 56, 20);
INSERT INTO `item_mods` VALUES (11820, 1, 24);
INSERT INTO `item_mods` VALUES (11820, 2, 30);
INSERT INTO `item_mods` VALUES (11820, 5, -30);
INSERT INTO `item_mods` VALUES (11820, 23, 14);
INSERT INTO `item_mods` VALUES (11820, 73, 4);
INSERT INTO `item_mods` VALUES (11820, 384, 40);
INSERT INTO `item_mods` VALUES (11821, 1, 29);
INSERT INTO `item_mods` VALUES (11821, 2, 14);
INSERT INTO `item_mods` VALUES (11821, 8, 7);
INSERT INTO `item_mods` VALUES (11821, 12, 7);
INSERT INTO `item_mods` VALUES (11821, 116, 9);
INSERT INTO `item_mods` VALUES (11822, 2, -33);
INSERT INTO `item_mods` VALUES (11822, 5, 99);
INSERT INTO `item_mods` VALUES (11822, 47, 7);
INSERT INTO `item_mods` VALUES (11823, 1, 40);
INSERT INTO `item_mods` VALUES (11823, 56, -10);
-- INSERT INTO `item_mods` VALUES (11823, ???, 35); TODO: Slow - Def Bonus
INSERT INTO `item_mods` VALUES (11824, 1, 39);
INSERT INTO `item_mods` VALUES (11824, 23, 15);
INSERT INTO `item_mods` VALUES (11824, 85, 6);
INSERT INTO `item_mods` VALUES (11824, 86, 6);
INSERT INTO `item_mods` VALUES (11824, 89, 6);
INSERT INTO `item_mods` VALUES (11824, 384, 61);
INSERT INTO `item_mods` VALUES (11825, 1, 29);
INSERT INTO `item_mods` VALUES (11825, 8, 7);
INSERT INTO `item_mods` VALUES (11825, 9, 7);
INSERT INTO `item_mods` VALUES (11825, 11, 7);
INSERT INTO `item_mods` VALUES (11825, 81, 6);
INSERT INTO `item_mods` VALUES (11825, 84, 6);
INSERT INTO `item_mods` VALUES (11825, 104, 6);
INSERT INTO `item_mods` VALUES (11825, 289, 6);
INSERT INTO `item_mods` VALUES (11826, 1, 29);
INSERT INTO `item_mods` VALUES (11826, 13, 8);
INSERT INTO `item_mods` VALUES (11826, 14, 8);
INSERT INTO `item_mods` VALUES (11826, 27, -5);
INSERT INTO `item_mods` VALUES (11826, 111, 11);
INSERT INTO `item_mods` VALUES (11826, 112, 11);
INSERT INTO `item_mods` VALUES (11826, 114, 11);
INSERT INTO `item_mods` VALUES (11828, 1, 47);
INSERT INTO `item_mods` VALUES (11828, 24, 8);
INSERT INTO `item_mods` VALUES (11828, 26, -6);
INSERT INTO `item_mods` VALUES (11828, 68, 10);
INSERT INTO `item_mods` VALUES (11828, 73, 6);
INSERT INTO `item_mods` VALUES (11829, 1, 48);
INSERT INTO `item_mods` VALUES (11829, 24, 9);
INSERT INTO `item_mods` VALUES (11829, 26, -5);
INSERT INTO `item_mods` VALUES (11829, 68, 11);
INSERT INTO `item_mods` VALUES (11829, 73, 7);
INSERT INTO `item_mods` VALUES (11830, 1, 62);
INSERT INTO `item_mods` VALUES (11830, 12, -4);
INSERT INTO `item_mods` VALUES (11830, 13, -4);
INSERT INTO `item_mods` VALUES (11830, 23, 14);
INSERT INTO `item_mods` VALUES (11830, 27, 5);
INSERT INTO `item_mods` VALUES (11830, 161, -3);
INSERT INTO `item_mods` VALUES (11831, 1, 63);
INSERT INTO `item_mods` VALUES (11831, 12, -3);
INSERT INTO `item_mods` VALUES (11831, 13, -3);
INSERT INTO `item_mods` VALUES (11831, 23, 15);
INSERT INTO `item_mods` VALUES (11831, 27, 6);
INSERT INTO `item_mods` VALUES (11831, 161, -4);
INSERT INTO `item_mods` VALUES (11832, 1, 40);
INSERT INTO `item_mods` VALUES (11832, 5, 16);
INSERT INTO `item_mods` VALUES (11832, 27, -9);
INSERT INTO `item_mods` VALUES (11832, 71, 6);
INSERT INTO `item_mods` VALUES (11832, 163, -2);
INSERT INTO `item_mods` VALUES (11833, 1, 41);
INSERT INTO `item_mods` VALUES (11833, 5, 17);
INSERT INTO `item_mods` VALUES (11833, 27, -10);
INSERT INTO `item_mods` VALUES (11833, 71, 7);
INSERT INTO `item_mods` VALUES (11833, 163, -3);
INSERT INTO `item_mods` VALUES (11844, 1, 50);
INSERT INTO `item_mods` VALUES (11844, 10, -8);
INSERT INTO `item_mods` VALUES (11844, 25, 11);
INSERT INTO `item_mods` VALUES (11844, 68, 11);
INSERT INTO `item_mods` VALUES (11844, 289, 3);
INSERT INTO `item_mods` VALUES (11844, 421, 2);
INSERT INTO `item_mods` VALUES (11845, 1, 51);
INSERT INTO `item_mods` VALUES (11845, 8, 6);
INSERT INTO `item_mods` VALUES (11845, 25, 11);
INSERT INTO `item_mods` VALUES (11845, 68, 11);
INSERT INTO `item_mods` VALUES (11845, 289, 3);
INSERT INTO `item_mods` VALUES (11845, 421, 2);
INSERT INTO `item_mods` VALUES (11846, 1, 53);
INSERT INTO `item_mods` VALUES (11846, 8, -6);
INSERT INTO `item_mods` VALUES (11846, 11, 9);
INSERT INTO `item_mods` VALUES (11846, 26, 4);
INSERT INTO `item_mods` VALUES (11846, 165, 2);
INSERT INTO `item_mods` VALUES (11847, 1, 54);
INSERT INTO `item_mods` VALUES (11847, 11, 9);
INSERT INTO `item_mods` VALUES (11847, 24, 6);
INSERT INTO `item_mods` VALUES (11847, 26, 4);
INSERT INTO `item_mods` VALUES (11847, 165, 2);
INSERT INTO `item_mods` VALUES (11848, 1, 47);
INSERT INTO `item_mods` VALUES (11848, 2, -18);
INSERT INTO `item_mods` VALUES (11848, 5, -18);
INSERT INTO `item_mods` VALUES (11848, 13, 7);
INSERT INTO `item_mods` VALUES (11848, 30, 7);
-- INSERT INTO `item_mods` VALUES (11848, 487, ?); TODO: Bonus Damage To Magic Burst
INSERT INTO `item_mods` VALUES (11849, 1, 48);
INSERT INTO `item_mods` VALUES (11849, 13, 7);
INSERT INTO `item_mods` VALUES (11849, 30, 7);
-- INSERT INTO `item_mods` VALUES (11849, 487, ?); TODO: Bonus Damage To Magic Burst
INSERT INTO `item_mods` VALUES (11849, 170, 5);
INSERT INTO `item_mods` VALUES (11850, 1, 65);
INSERT INTO `item_mods` VALUES (11850, 8, 12);
INSERT INTO `item_mods` VALUES (11850, 23, 12);
INSERT INTO `item_mods` VALUES (11850, 83, 5);
INSERT INTO `item_mods` VALUES (11850, 87, 5);
INSERT INTO `item_mods` VALUES (11850, 109, 5);
INSERT INTO `item_mods` VALUES (11851, 1, 55);
INSERT INTO `item_mods` VALUES (11851, 25, 15);
INSERT INTO `item_mods` VALUES (11851, 26, 15);
INSERT INTO `item_mods` VALUES (11851, 82, 5);
INSERT INTO `item_mods` VALUES (11851, 88, 5);
INSERT INTO `item_mods` VALUES (11851, 105, 5);
INSERT INTO `item_mods` VALUES (11852, 1, 46);
INSERT INTO `item_mods` VALUES (11852, 12, 12);
INSERT INTO `item_mods` VALUES (11852, 14, 12);
INSERT INTO `item_mods` VALUES (11852, 113, 10);
INSERT INTO `item_mods` VALUES (11852, 115, 10);
INSERT INTO `item_mods` VALUES (11852, 117, 10);

-- -------------------------------------------------------
-- Novennial Coat
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11853, 1, 1); -- DEF:1
INSERT INTO `item_mods` VALUES (11853, 2, 9); -- HP+9
INSERT INTO `item_mods` VALUES (11853, 60, 9); -- [Element: Light]+9

-- -------------------------------------------------------
-- Novennial Dress
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11854, 1, 1); -- DEF:1
INSERT INTO `item_mods` VALUES (11854, 2, 9); -- HP+9
INSERT INTO `item_mods` VALUES (11854, 60, 9); -- [Element: Light]+9

INSERT INTO `item_mods` VALUES (11857, 73, 6);
INSERT INTO `item_mods` VALUES (11858, 1, 66);
INSERT INTO `item_mods` VALUES (11858, 8, 13);
INSERT INTO `item_mods` VALUES (11858, 23, 13);
INSERT INTO `item_mods` VALUES (11858, 83, 6);
INSERT INTO `item_mods` VALUES (11858, 87, 6);
INSERT INTO `item_mods` VALUES (11858, 109, 6);
INSERT INTO `item_mods` VALUES (11859, 1, 56);
INSERT INTO `item_mods` VALUES (11859, 25, 16);
INSERT INTO `item_mods` VALUES (11859, 26, 16);
INSERT INTO `item_mods` VALUES (11859, 82, 6);
INSERT INTO `item_mods` VALUES (11859, 88, 6);
INSERT INTO `item_mods` VALUES (11859, 105, 6);
INSERT INTO `item_mods` VALUES (11860, 1, 47);
INSERT INTO `item_mods` VALUES (11860, 12, 13);
INSERT INTO `item_mods` VALUES (11860, 14, 13);
INSERT INTO `item_mods` VALUES (11860, 113, 11);
INSERT INTO `item_mods` VALUES (11860, 115, 11);
INSERT INTO `item_mods` VALUES (11860, 117, 11);

-- -------------------------------------------------------
-- Hikogami Yukata
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11861, 1, 1); -- DEF:1

-- -------------------------------------------------------
-- Himegami Yukata
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11862, 1, 1); -- DEF:1

INSERT INTO `item_mods` VALUES (11864, 374, 10);
INSERT INTO `item_mods` VALUES (11867, 369, 1);
INSERT INTO `item_mods` VALUES (11867, 374, 15);
INSERT INTO `item_mods` VALUES (11870, 369, 1);
INSERT INTO `item_mods` VALUES (11870, 374, 12);
INSERT INTO `item_mods` VALUES (11875, 370, 1);
INSERT INTO `item_mods` VALUES (11876, 369, 1);
INSERT INTO `item_mods` VALUES (11878, 1, 16);
INSERT INTO `item_mods` VALUES (11878, 24, 5);
INSERT INTO `item_mods` VALUES (11878, 26, -2);
INSERT INTO `item_mods` VALUES (11878, 68, 5);
INSERT INTO `item_mods` VALUES (11878, 73, 2);
INSERT INTO `item_mods` VALUES (11879, 1, 17);
INSERT INTO `item_mods` VALUES (11879, 24, 6);
INSERT INTO `item_mods` VALUES (11879, 26, -1);
INSERT INTO `item_mods` VALUES (11879, 68, 6);
INSERT INTO `item_mods` VALUES (11879, 73, 3);
INSERT INTO `item_mods` VALUES (11880, 1, 25);
INSERT INTO `item_mods` VALUES (11880, 13, -5);
INSERT INTO `item_mods` VALUES (11880, 23, 6);
INSERT INTO `item_mods` VALUES (11880, 27, 4);
INSERT INTO `item_mods` VALUES (11880, 161, -1);
INSERT INTO `item_mods` VALUES (11881, 1, 26);
INSERT INTO `item_mods` VALUES (11881, 13, -4);
INSERT INTO `item_mods` VALUES (11881, 23, 7);
INSERT INTO `item_mods` VALUES (11881, 27, 5);
INSERT INTO `item_mods` VALUES (11881, 161, -2);
INSERT INTO `item_mods` VALUES (11882, 1, 13);
INSERT INTO `item_mods` VALUES (11882, 5, 13);
INSERT INTO `item_mods` VALUES (11882, 27, -5);
INSERT INTO `item_mods` VALUES (11882, 68, -2);
INSERT INTO `item_mods` VALUES (11882, 163, -1);
INSERT INTO `item_mods` VALUES (11883, 1, 14);
INSERT INTO `item_mods` VALUES (11883, 5, 14);
INSERT INTO `item_mods` VALUES (11883, 27, -6);
INSERT INTO `item_mods` VALUES (11883, 68, -1);
INSERT INTO `item_mods` VALUES (11883, 163, -2);
INSERT INTO `item_mods` VALUES (11898, 1, 16);
INSERT INTO `item_mods` VALUES (11898, 2, 50);
INSERT INTO `item_mods` VALUES (11898, 5, -40);
INSERT INTO `item_mods` VALUES (11898, 8, 5);
INSERT INTO `item_mods` VALUES (11898, 9, -5);
INSERT INTO `item_mods` VALUES (11898, 11, 5);
INSERT INTO `item_mods` VALUES (11899, 1, 16);
INSERT INTO `item_mods` VALUES (11899, 2, -50);
INSERT INTO `item_mods` VALUES (11899, 5, 80);
INSERT INTO `item_mods` VALUES (11899, 12, 7);
INSERT INTO `item_mods` VALUES (11899, 13, -4);
INSERT INTO `item_mods` VALUES (11900, 1, 16);
INSERT INTO `item_mods` VALUES (11900, 2, 100);
INSERT INTO `item_mods` VALUES (11900, 5, -80);
INSERT INTO `item_mods` VALUES (11900, 8, 7);
INSERT INTO `item_mods` VALUES (11900, 9, -4);
INSERT INTO `item_mods` VALUES (11901, 1, 16);
INSERT INTO `item_mods` VALUES (11901, 2, -40);
INSERT INTO `item_mods` VALUES (11901, 5, 50);
INSERT INTO `item_mods` VALUES (11901, 12, -4);
INSERT INTO `item_mods` VALUES (11901, 13, 7);
INSERT INTO `item_mods` VALUES (11902, 1, 16);
INSERT INTO `item_mods` VALUES (11902, 2, -80);
INSERT INTO `item_mods` VALUES (11902, 5, 100);
INSERT INTO `item_mods` VALUES (11902, 12, -4);
INSERT INTO `item_mods` VALUES (11902, 13, 7);
INSERT INTO `item_mods` VALUES (11903, 1, 16);
INSERT INTO `item_mods` VALUES (11903, 2, -40);
INSERT INTO `item_mods` VALUES (11903, 5, 50);
INSERT INTO `item_mods` VALUES (11903, 10, -5);
INSERT INTO `item_mods` VALUES (11903, 12, 5);
INSERT INTO `item_mods` VALUES (11903, 13, 5);
INSERT INTO `item_mods` VALUES (11904, 1, 16);
INSERT INTO `item_mods` VALUES (11904, 2, 80);
INSERT INTO `item_mods` VALUES (11904, 5, -50);
INSERT INTO `item_mods` VALUES (11904, 8, 7);
INSERT INTO `item_mods` VALUES (11904, 9, -4);
INSERT INTO `item_mods` VALUES (11905, 1, 16);
INSERT INTO `item_mods` VALUES (11905, 2, -80);
INSERT INTO `item_mods` VALUES (11905, 5, 100);
INSERT INTO `item_mods` VALUES (11905, 12, 7);
INSERT INTO `item_mods` VALUES (11905, 13, -4);
INSERT INTO `item_mods` VALUES (11906, 1, 16);
INSERT INTO `item_mods` VALUES (11906, 2, 50);
INSERT INTO `item_mods` VALUES (11906, 5, -40);
INSERT INTO `item_mods` VALUES (11906, 8, -4);
INSERT INTO `item_mods` VALUES (11906, 9, 7);
INSERT INTO `item_mods` VALUES (11907, 1, 16);
INSERT INTO `item_mods` VALUES (11907, 2, 100);
INSERT INTO `item_mods` VALUES (11907, 5, 80);
INSERT INTO `item_mods` VALUES (11907, 10, 7);
INSERT INTO `item_mods` VALUES (11907, 11, -4);
INSERT INTO `item_mods` VALUES (11908, 1, 23);
INSERT INTO `item_mods` VALUES (11908, 8, 8);
INSERT INTO `item_mods` VALUES (11908, 11, 3);
INSERT INTO `item_mods` VALUES (11908, 23, 5);
INSERT INTO `item_mods` VALUES (11908, 25, -15);
INSERT INTO `item_mods` VALUES (11909, 1, 28);
INSERT INTO `item_mods` VALUES (11909, 11, 3);
INSERT INTO `item_mods` VALUES (11909, 24, 8);
INSERT INTO `item_mods` VALUES (11909, 26, 6);
INSERT INTO `item_mods` VALUES (11910, 1, 20);
INSERT INTO `item_mods` VALUES (11910, 11, 3);
INSERT INTO `item_mods` VALUES (11910, 23, 5);
INSERT INTO `item_mods` VALUES (11910, 68, 7);
INSERT INTO `item_mods` VALUES (11911, 1, 23);
INSERT INTO `item_mods` VALUES (11911, 2, -14);
INSERT INTO `item_mods` VALUES (11911, 23, 9);
INSERT INTO `item_mods` VALUES (11911, 25, 6);
INSERT INTO `item_mods` VALUES (11911, 289, 3);
INSERT INTO `item_mods` VALUES (11912, 1, 24);
INSERT INTO `item_mods` VALUES (11912, 9, 3);
INSERT INTO `item_mods` VALUES (11912, 23, 9);
INSERT INTO `item_mods` VALUES (11912, 25, 6);
INSERT INTO `item_mods` VALUES (11912, 289, 3);
INSERT INTO `item_mods` VALUES (11913, 1, 24);
INSERT INTO `item_mods` VALUES (11913, 8, -4);
INSERT INTO `item_mods` VALUES (11913, 11, 6);
INSERT INTO `item_mods` VALUES (11913, 26, 3);
INSERT INTO `item_mods` VALUES (11913, 27, -3);
INSERT INTO `item_mods` VALUES (11914, 1, 24);
INSERT INTO `item_mods` VALUES (11914, 11, 6);
INSERT INTO `item_mods` VALUES (11914, 24, 4);
INSERT INTO `item_mods` VALUES (11914, 26, 3);
INSERT INTO `item_mods` VALUES (11914, 27, -3);
INSERT INTO `item_mods` VALUES (11915, 1, 15);
INSERT INTO `item_mods` VALUES (11915, 2, -13);
INSERT INTO `item_mods` VALUES (11915, 5, -13);
INSERT INTO `item_mods` VALUES (11915, 13, 4);
INSERT INTO `item_mods` VALUES (11915, 30, 4);
INSERT INTO `item_mods` VALUES (11916, 1, 16);
INSERT INTO `item_mods` VALUES (11916, 13, 4);
INSERT INTO `item_mods` VALUES (11916, 30, 4);
INSERT INTO `item_mods` VALUES (11916, 170, 1);
INSERT INTO `item_mods` VALUES (11917, 1, 14);
INSERT INTO `item_mods` VALUES (11917, 13, 5);
-- INSERT INTO `item_mods` VALUES (11917, ???, -15); TODO: Stoneskin Casting Time
INSERT INTO `item_mods` VALUES (11918, 1, 23);
INSERT INTO `item_mods` VALUES (11918, 11, 12);
INSERT INTO `item_mods` VALUES (11918, 24, 5);
INSERT INTO `item_mods` VALUES (11918, 27, -3);
INSERT INTO `item_mods` VALUES (11920, 1, 19);
INSERT INTO `item_mods` VALUES (11920, 13, 3);
INSERT INTO `item_mods` VALUES (11920, 161, -3);
INSERT INTO `item_mods` VALUES (11920, 225, 5);
INSERT INTO `item_mods` VALUES (11927, 385, 250);
INSERT INTO `item_mods` VALUES (11928, 1, 29);
INSERT INTO `item_mods` VALUES (11928, 24, 6);
INSERT INTO `item_mods` VALUES (11928, 26, -3);
INSERT INTO `item_mods` VALUES (11928, 68, 4);
INSERT INTO `item_mods` VALUES (11928, 73, 2);
INSERT INTO `item_mods` VALUES (11929, 1, 30);
INSERT INTO `item_mods` VALUES (11929, 24, 7);
INSERT INTO `item_mods` VALUES (11929, 26, -2);
INSERT INTO `item_mods` VALUES (11929, 68, 5);
INSERT INTO `item_mods` VALUES (11929, 73, 3);
INSERT INTO `item_mods` VALUES (11930, 1, 38);
INSERT INTO `item_mods` VALUES (11930, 13, -5);
INSERT INTO `item_mods` VALUES (11930, 23, 10);
INSERT INTO `item_mods` VALUES (11930, 27, 3);
INSERT INTO `item_mods` VALUES (11930, 161, -1);
INSERT INTO `item_mods` VALUES (11931, 1, 39);
INSERT INTO `item_mods` VALUES (11931, 13, -4);
INSERT INTO `item_mods` VALUES (11931, 23, 11);
INSERT INTO `item_mods` VALUES (11931, 27, 4);
INSERT INTO `item_mods` VALUES (11931, 161, -2);
INSERT INTO `item_mods` VALUES (11932, 1, 25);
INSERT INTO `item_mods` VALUES (11932, 5, 8);
INSERT INTO `item_mods` VALUES (11932, 27, -7);
INSERT INTO `item_mods` VALUES (11932, 68, -2);
INSERT INTO `item_mods` VALUES (11932, 163, -1);
INSERT INTO `item_mods` VALUES (11933, 1, 26);
INSERT INTO `item_mods` VALUES (11933, 5, 9);
INSERT INTO `item_mods` VALUES (11933, 27, -8);
INSERT INTO `item_mods` VALUES (11933, 68, -1);
INSERT INTO `item_mods` VALUES (11933, 163, -2);
INSERT INTO `item_mods` VALUES (11937, 1, 29);
INSERT INTO `item_mods` VALUES (11937, 5, 20);
INSERT INTO `item_mods` VALUES (11937, 13, 6);
INSERT INTO `item_mods` VALUES (11937, 30, 6);
INSERT INTO `item_mods` VALUES (11937, 71, 3);
INSERT INTO `item_mods` VALUES (11947, 1, 30);
INSERT INTO `item_mods` VALUES (11947, 2, -20);
INSERT INTO `item_mods` VALUES (11947, 12, 8);
INSERT INTO `item_mods` VALUES (11947, 27, -5);
INSERT INTO `item_mods` VALUES (11947, 71, 4);
INSERT INTO `item_mods` VALUES (11949, 1, 40);
INSERT INTO `item_mods` VALUES (11949, 5, 10);
INSERT INTO `item_mods` VALUES (11949, 13, 5);
INSERT INTO `item_mods` VALUES (11949, 300, 20);
INSERT INTO `item_mods` VALUES (11950, 1, 43);
INSERT INTO `item_mods` VALUES (11950, 10, -6);
INSERT INTO `item_mods` VALUES (11950, 23, 8);
INSERT INTO `item_mods` VALUES (11950, 27, -3);
INSERT INTO `item_mods` VALUES (11950, 68, 8);
INSERT INTO `item_mods` VALUES (11950, 289, 4);
INSERT INTO `item_mods` VALUES (11951, 1, 44);
INSERT INTO `item_mods` VALUES (11951, 8, 4);
INSERT INTO `item_mods` VALUES (11951, 23, 8);
INSERT INTO `item_mods` VALUES (11951, 27, -3);
INSERT INTO `item_mods` VALUES (11951, 68, 8);
INSERT INTO `item_mods` VALUES (11951, 289, 4);
INSERT INTO `item_mods` VALUES (11952, 1, 44);
INSERT INTO `item_mods` VALUES (11952, 11, 6);
INSERT INTO `item_mods` VALUES (11952, 24, -5);
INSERT INTO `item_mods` VALUES (11952, 26, 4);
INSERT INTO `item_mods` VALUES (11952, 27, -3);
INSERT INTO `item_mods` VALUES (11953, 1, 45);
INSERT INTO `item_mods` VALUES (11953, 8, 4);
INSERT INTO `item_mods` VALUES (11953, 11, 6);
INSERT INTO `item_mods` VALUES (11953, 26, 4);
INSERT INTO `item_mods` VALUES (11953, 27, -3);
INSERT INTO `item_mods` VALUES (11954, 1, 31);
INSERT INTO `item_mods` VALUES (11954, 2, -12);
INSERT INTO `item_mods` VALUES (11954, 5, -12);
INSERT INTO `item_mods` VALUES (11954, 13, 5);
INSERT INTO `item_mods` VALUES (11954, 30, 5);
INSERT INTO `item_mods` VALUES (11955, 1, 32);
INSERT INTO `item_mods` VALUES (11955, 13, 5);
INSERT INTO `item_mods` VALUES (11955, 30, 5);
INSERT INTO `item_mods` VALUES (11955, 170, 2);

-- -------------------------------------------------------
-- Novennial Hose
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11956, 1, 1); -- DEF:1
INSERT INTO `item_mods` VALUES (11956, 5, 9); -- MP+9
INSERT INTO `item_mods` VALUES (11956, 61, 9); -- [Element: Dark]+9

-- -------------------------------------------------------
-- Novennial Boots
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11957, 1, 1); -- DEF:1
INSERT INTO `item_mods` VALUES (11957, 5, 9); -- MP+9
INSERT INTO `item_mods` VALUES (11957, 61, 9); -- [Element: Dark]+9

-- -------------------------------------------------------
-- Calmecac Trousers
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11958, 1, 46); -- DEF:46
INSERT INTO `item_mods` VALUES (11958, 25, -8); -- Accuracy-8
INSERT INTO `item_mods` VALUES (11958, 288, 2); -- Double Attack +2%
INSERT INTO `item_mods` VALUES (11958, 302, 2); -- Triple Attack +2%
INSERT INTO `item_mods` VALUES (11958, 384, 30); -- Haste+3% (30/1024 = 30.72)

INSERT INTO `item_mods` VALUES (11959, 1, 50);
INSERT INTO `item_mods` VALUES (11959, 8, 7);
INSERT INTO `item_mods` VALUES (11959, 25, 16);
INSERT INTO `item_mods` VALUES (11959, 165, 2);
INSERT INTO `item_mods` VALUES (11959, 289, -8);
INSERT INTO `item_mods` VALUES (11960, 1, 48);
INSERT INTO `item_mods` VALUES (11960, 8, 7);
INSERT INTO `item_mods` VALUES (11960, 10, 7);
INSERT INTO `item_mods` VALUES (11960, 306, 2);
INSERT INTO `item_mods` VALUES (11960, 384, 30);
INSERT INTO `item_mods` VALUES (11961, 1, 36);
INSERT INTO `item_mods` VALUES (11961, 27, -6);
INSERT INTO `item_mods` VALUES (11961, 30, 7);
INSERT INTO `item_mods` VALUES (11961, 71, 5);
INSERT INTO `item_mods` VALUES (11961, 114, 5);

-- -------------------------------------------------------
--  Dream Trousers
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11965, 1, 2); -- DEF:2

-- -------------------------------------------------------
--  Dream Trousers +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11966, 1, 3); -- DEF:3

-- -------------------------------------------------------
--  Dream Pants
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11967, 1, 2); -- DEF:2

-- -------------------------------------------------------
--  Dream Pants +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (11968, 1, 3); -- DEF:3

INSERT INTO `item_mods` VALUES (11972, 374, 4);
INSERT INTO `item_mods` VALUES (11982, 374, 4);

-- -------------------------------------------------------
-- Tantra Crown
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (12009, 1, 31); -- def
INSERT INTO `item_mods` VALUES (12009, 289, 3); -- subtle blow

-- -------------------------------------------------------
-- Creed Armet
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (12014, 1, 39); -- def
INSERT INTO `item_mods` VALUES (12014, 2, 15); -- HP
INSERT INTO `item_mods` VALUES (12014, 5, 15); -- MP

-- -------------------------------------------------------
-- Sylvan Gapette
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (12018, 1, 29); -- def
INSERT INTO `item_mods` VALUES (12018, 24, 3); -- ranged attack
INSERT INTO `item_mods` VALUES (12018, 26, 3); -- ranged accuracy

-- -------------------------------------------------------
-- Iga zukin
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (12020, 1, 32); -- def
INSERT INTO `item_mods` VALUES (12020, 9, 3); -- dex

-- -------------------------------------------------------
-- Tantra Cyclas
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (12029, 1, 58); -- def
INSERT INTO `item_mods` VALUES (12029, 8, 3); -- STR
INSERT INTO `item_mods` VALUES (12029, 10, 3); -- VIT
INSERT INTO `item_mods` VALUES (12029, 25, 4); -- accuracy
INSERT INTO `item_mods` VALUES (12029, 23, 4); -- attack

-- -------------------------------------------------------
-- Creed Cuirass
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (12034, 1, 71); -- def
INSERT INTO `item_mods` VALUES (12034, 23, 6); -- attack
INSERT INTO `item_mods` VALUES (12034, 25, 6); -- accuracy
INSERT INTO `item_mods` VALUES (12034, 27, 3); -- enmity

-- -------------------------------------------------------
-- Sylvan Caban
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (12038, 1, 55); -- def
INSERT INTO `item_mods` VALUES (12038, 8, 3); -- str
INSERT INTO `item_mods` VALUES (12038, 11, 3); -- agi
INSERT INTO `item_mods` VALUES (12038, 26, 6); -- ranged accuracy

-- -------------------------------------------------------
-- Iga Ningi
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (12040, 1, 56); -- def
INSERT INTO `item_mods` VALUES (12040, 25, 5); -- accuracy
INSERT INTO `item_mods` VALUES (12040, 23, 5); -- attack

-- -------------------------------------------------------
-- Tantra Gloves
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (12049, 1, 22); -- def
INSERT INTO `item_mods` VALUES (12049, 25, 3); -- accuracy

-- -------------------------------------------------------
-- Creed Gauntlets
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (12054, 1, 30); -- def
INSERT INTO `item_mods` VALUES (12054, 8, 3); -- STR
INSERT INTO `item_mods` VALUES (12054, 10, 3); -- VIT

-- -------------------------------------------------------
-- Sylvan Glovelettes
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (12058, 1, 20); -- def
INSERT INTO `item_mods` VALUES (12058, 8, 3); -- str


-- -------------------------------------------------------
-- Iga Tekko
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (12060, 1, 22); -- def
INSERT INTO `item_mods` VALUES (12060, 9, 3); -- dex
INSERT INTO `item_mods` VALUES (12060, 11, 3); -- agi

-- -------------------------------------------------------
-- Tantra Hose
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (12069, 1, 44); -- def
INSERT INTO `item_mods` VALUES (12069, 25, 3); -- accuracy
INSERT INTO `item_mods` VALUES (12069, 23, 3); -- attack

-- -------------------------------------------------------
-- Creed Cuisses
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (12074, 1, 53); -- def
INSERT INTO `item_mods` VALUES (12074, 2, 15); -- HP

-- -------------------------------------------------------
-- Sylvan Brague
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (12078, 1, 41); -- def
INSERT INTO `item_mods` VALUES (12078, 24, 3); -- ranged attack

-- -------------------------------------------------------
-- Iga Hakama
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (12080, 1, 43); -- def
INSERT INTO `item_mods` VALUES (12080, 25, 3); -- accuracy

-- -------------------------------------------------------
-- Tantra Gaiters
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (12089, 1, 20); -- def
INSERT INTO `item_mods` VALUES (12089, 8, 3); -- STR
INSERT INTO `item_mods` VALUES (12089, 25, 3); -- accuracy

-- -------------------------------------------------------
-- Creed Sabatons
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (12094, 1, 25); -- def
INSERT INTO `item_mods` VALUES (12094, 25, 4); -- accuracy

-- -------------------------------------------------------
-- Sylvan Bottillons
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (12098, 1, 17); -- def
INSERT INTO `item_mods` VALUES (12098, 11, 4); -- agi

-- -------------------------------------------------------
-- Iga Kyahan
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (12100, 1, 18); -- def
INSERT INTO `item_mods` VALUES (12100, 384, 10); -- haste

INSERT INTO `item_mods` VALUES (12108, 1, 30);
INSERT INTO `item_mods` VALUES (12108, 8, 2);
INSERT INTO `item_mods` VALUES (12108, 9, 2);
INSERT INTO `item_mods` VALUES (12108, 23, 10);
INSERT INTO `item_mods` VALUES (12109, 1, 30);
INSERT INTO `item_mods` VALUES (12109, 8, 2);
INSERT INTO `item_mods` VALUES (12109, 9, 2);
INSERT INTO `item_mods` VALUES (12109, 23, 10);
INSERT INTO `item_mods` VALUES (12110, 1, 30);
INSERT INTO `item_mods` VALUES (12110, 8, 2);
INSERT INTO `item_mods` VALUES (12110, 9, 2);
INSERT INTO `item_mods` VALUES (12110, 23, 10);
INSERT INTO `item_mods` VALUES (12111, 1, 31);
INSERT INTO `item_mods` VALUES (12111, 9, 2);
INSERT INTO `item_mods` VALUES (12111, 23, 4);
INSERT INTO `item_mods` VALUES (12111, 25, 4);
INSERT INTO `item_mods` VALUES (12112, 1, 31);
INSERT INTO `item_mods` VALUES (12112, 9, 2);
INSERT INTO `item_mods` VALUES (12112, 23, 4);
INSERT INTO `item_mods` VALUES (12112, 25, 4);
INSERT INTO `item_mods` VALUES (12113, 1, 31);
INSERT INTO `item_mods` VALUES (12113, 9, 2);
INSERT INTO `item_mods` VALUES (12113, 23, 4);
INSERT INTO `item_mods` VALUES (12113, 25, 4);
INSERT INTO `item_mods` VALUES (12114, 1, 33);
INSERT INTO `item_mods` VALUES (12114, 2, 15);
INSERT INTO `item_mods` VALUES (12114, 5, 15);
INSERT INTO `item_mods` VALUES (12114, 27, 3);
INSERT INTO `item_mods` VALUES (12114, 161, -1);
INSERT INTO `item_mods` VALUES (12115, 1, 33);
INSERT INTO `item_mods` VALUES (12115, 2, 15);
INSERT INTO `item_mods` VALUES (12115, 5, 15);
INSERT INTO `item_mods` VALUES (12115, 27, 3);
INSERT INTO `item_mods` VALUES (12115, 161, -1);
INSERT INTO `item_mods` VALUES (12116, 1, 33);
INSERT INTO `item_mods` VALUES (12116, 2, 15);
INSERT INTO `item_mods` VALUES (12116, 5, 15);
INSERT INTO `item_mods` VALUES (12116, 27, 3);
INSERT INTO `item_mods` VALUES (12116, 161, -1);
INSERT INTO `item_mods` VALUES (12117, 1, 30);
INSERT INTO `item_mods` VALUES (12117, 2, 8);
INSERT INTO `item_mods` VALUES (12117, 23, 3);
INSERT INTO `item_mods` VALUES (12117, 25, 2);
INSERT INTO `item_mods` VALUES (12118, 1, 30);
INSERT INTO `item_mods` VALUES (12118, 2, 8);
INSERT INTO `item_mods` VALUES (12118, 23, 3);
INSERT INTO `item_mods` VALUES (12118, 25, 2);
INSERT INTO `item_mods` VALUES (12119, 1, 30);
INSERT INTO `item_mods` VALUES (12119, 2, 8);
INSERT INTO `item_mods` VALUES (12119, 23, 3);
INSERT INTO `item_mods` VALUES (12119, 25, 2);
INSERT INTO `item_mods` VALUES (12120, 1, 26);
INSERT INTO `item_mods` VALUES (12120, 11, 3);
INSERT INTO `item_mods` VALUES (12120, 25, 4);
INSERT INTO `item_mods` VALUES (12120, 68, 3);
INSERT INTO `item_mods` VALUES (12121, 1, 26);
INSERT INTO `item_mods` VALUES (12121, 11, 3);
INSERT INTO `item_mods` VALUES (12121, 25, 4);
INSERT INTO `item_mods` VALUES (12121, 68, 3);
INSERT INTO `item_mods` VALUES (12122, 1, 26);
INSERT INTO `item_mods` VALUES (12122, 11, 3);
INSERT INTO `item_mods` VALUES (12122, 25, 4);
INSERT INTO `item_mods` VALUES (12122, 68, 3);
INSERT INTO `item_mods` VALUES (12123, 1, 25);
INSERT INTO `item_mods` VALUES (12123, 11, 3);
INSERT INTO `item_mods` VALUES (12123, 24, 4);
INSERT INTO `item_mods` VALUES (12123, 26, 2);
INSERT INTO `item_mods` VALUES (12124, 1, 25);
INSERT INTO `item_mods` VALUES (12124, 11, 3);
INSERT INTO `item_mods` VALUES (12124, 24, 4);
INSERT INTO `item_mods` VALUES (12124, 26, 2);
INSERT INTO `item_mods` VALUES (12125, 1, 25);
INSERT INTO `item_mods` VALUES (12125, 11, 3);
INSERT INTO `item_mods` VALUES (12125, 24, 4);
INSERT INTO `item_mods` VALUES (12125, 26, 2);
INSERT INTO `item_mods` VALUES (12126, 1, 28);
INSERT INTO `item_mods` VALUES (12126, 8, 3);
INSERT INTO `item_mods` VALUES (12126, 23, 5);
INSERT INTO `item_mods` VALUES (12126, 25, 3);
INSERT INTO `item_mods` VALUES (12126, 291, 2);
INSERT INTO `item_mods` VALUES (12127, 1, 28);
INSERT INTO `item_mods` VALUES (12127, 8, 3);
INSERT INTO `item_mods` VALUES (12127, 23, 5);
INSERT INTO `item_mods` VALUES (12127, 25, 3);
INSERT INTO `item_mods` VALUES (12127, 291, 2);
INSERT INTO `item_mods` VALUES (12128, 1, 28);
INSERT INTO `item_mods` VALUES (12128, 8, 3);
INSERT INTO `item_mods` VALUES (12128, 23, 5);
INSERT INTO `item_mods` VALUES (12128, 25, 3);
INSERT INTO `item_mods` VALUES (12128, 291, 2);
INSERT INTO `item_mods` VALUES (12129, 1, 25);
INSERT INTO `item_mods` VALUES (12129, 9, 4);
INSERT INTO `item_mods` VALUES (12129, 25, 3);
INSERT INTO `item_mods` VALUES (12129, 289, 6);
INSERT INTO `item_mods` VALUES (12130, 1, 25);
INSERT INTO `item_mods` VALUES (12130, 9, 4);
INSERT INTO `item_mods` VALUES (12130, 25, 3);
INSERT INTO `item_mods` VALUES (12130, 289, 6);
INSERT INTO `item_mods` VALUES (12131, 1, 25);
INSERT INTO `item_mods` VALUES (12131, 9, 4);
INSERT INTO `item_mods` VALUES (12131, 25, 3);
INSERT INTO `item_mods` VALUES (12131, 289, 6);
INSERT INTO `item_mods` VALUES (12132, 1, 19);
INSERT INTO `item_mods` VALUES (12132, 14, 2);
INSERT INTO `item_mods` VALUES (12132, 30, 2);
INSERT INTO `item_mods` VALUES (12132, 170, 5);
INSERT INTO `item_mods` VALUES (12133, 1, 19);
INSERT INTO `item_mods` VALUES (12133, 14, 2);
INSERT INTO `item_mods` VALUES (12133, 30, 2);
INSERT INTO `item_mods` VALUES (12133, 170, 5);
INSERT INTO `item_mods` VALUES (12134, 1, 19);
INSERT INTO `item_mods` VALUES (12134, 14, 2);
INSERT INTO `item_mods` VALUES (12134, 30, 2);
INSERT INTO `item_mods` VALUES (12134, 170, 5);
INSERT INTO `item_mods` VALUES (12135, 1, 19);
INSERT INTO `item_mods` VALUES (12135, 5, 9);
INSERT INTO `item_mods` VALUES (12135, 12, 1);
INSERT INTO `item_mods` VALUES (12135, 27, -2);
INSERT INTO `item_mods` VALUES (12135, 28, 2);
INSERT INTO `item_mods` VALUES (12136, 1, 19);
INSERT INTO `item_mods` VALUES (12136, 5, 9);
INSERT INTO `item_mods` VALUES (12136, 12, 1);
INSERT INTO `item_mods` VALUES (12136, 27, -2);
INSERT INTO `item_mods` VALUES (12136, 28, 2);
INSERT INTO `item_mods` VALUES (12137, 1, 19);
INSERT INTO `item_mods` VALUES (12137, 5, 9);
INSERT INTO `item_mods` VALUES (12137, 12, 1);
INSERT INTO `item_mods` VALUES (12137, 27, -2);
INSERT INTO `item_mods` VALUES (12137, 28, 2);
INSERT INTO `item_mods` VALUES (12138, 1, 19);
INSERT INTO `item_mods` VALUES (12138, 2, 15);
INSERT INTO `item_mods` VALUES (12138, 5, 15);
INSERT INTO `item_mods` VALUES (12138, 13, 4);
INSERT INTO `item_mods` VALUES (12139, 1, 19);
INSERT INTO `item_mods` VALUES (12139, 2, 15);
INSERT INTO `item_mods` VALUES (12139, 5, 15);
INSERT INTO `item_mods` VALUES (12139, 13, 4);
INSERT INTO `item_mods` VALUES (12140, 1, 19);
INSERT INTO `item_mods` VALUES (12140, 2, 15);
INSERT INTO `item_mods` VALUES (12140, 5, 15);
INSERT INTO `item_mods` VALUES (12140, 13, 4);
INSERT INTO `item_mods` VALUES (12141, 1, 19);
INSERT INTO `item_mods` VALUES (12141, 5, 8);
INSERT INTO `item_mods` VALUES (12141, 14, 1);
INSERT INTO `item_mods` VALUES (12141, 27, -1);
INSERT INTO `item_mods` VALUES (12142, 1, 19);
INSERT INTO `item_mods` VALUES (12142, 5, 8);
INSERT INTO `item_mods` VALUES (12142, 14, 1);
INSERT INTO `item_mods` VALUES (12142, 27, -1);
INSERT INTO `item_mods` VALUES (12143, 1, 19);
INSERT INTO `item_mods` VALUES (12143, 5, 8);
INSERT INTO `item_mods` VALUES (12143, 14, 1);
INSERT INTO `item_mods` VALUES (12143, 27, -1);
INSERT INTO `item_mods` VALUES (12144, 1, 48);
INSERT INTO `item_mods` VALUES (12144, 8, 4);
INSERT INTO `item_mods` VALUES (12144, 9, 3);
INSERT INTO `item_mods` VALUES (12144, 23, 6);
INSERT INTO `item_mods` VALUES (12144, 288, 2);
INSERT INTO `item_mods` VALUES (12145, 1, 48);
INSERT INTO `item_mods` VALUES (12145, 8, 4);
INSERT INTO `item_mods` VALUES (12145, 9, 3);
INSERT INTO `item_mods` VALUES (12145, 23, 6);
INSERT INTO `item_mods` VALUES (12145, 288, 2);
INSERT INTO `item_mods` VALUES (12146, 1, 48);
INSERT INTO `item_mods` VALUES (12146, 8, 4);
INSERT INTO `item_mods` VALUES (12146, 9, 3);
INSERT INTO `item_mods` VALUES (12146, 23, 6);
INSERT INTO `item_mods` VALUES (12146, 288, 2);
INSERT INTO `item_mods` VALUES (12147, 1, 48);
INSERT INTO `item_mods` VALUES (12147, 8, 3);
INSERT INTO `item_mods` VALUES (12147, 9, 4);
INSERT INTO `item_mods` VALUES (12147, 23, 7);
INSERT INTO `item_mods` VALUES (12148, 1, 48);
INSERT INTO `item_mods` VALUES (12148, 8, 3);
INSERT INTO `item_mods` VALUES (12148, 9, 4);
INSERT INTO `item_mods` VALUES (12148, 23, 7);
INSERT INTO `item_mods` VALUES (12149, 1, 48);
INSERT INTO `item_mods` VALUES (12149, 8, 3);
INSERT INTO `item_mods` VALUES (12149, 9, 4);
INSERT INTO `item_mods` VALUES (12149, 23, 7);
INSERT INTO `item_mods` VALUES (12150, 1, 50);
INSERT INTO `item_mods` VALUES (12150, 2, 12);
INSERT INTO `item_mods` VALUES (12150, 10, 4);
INSERT INTO `item_mods` VALUES (12150, 27, 2);
INSERT INTO `item_mods` VALUES (12150, 160, -2);
INSERT INTO `item_mods` VALUES (12151, 1, 50);
INSERT INTO `item_mods` VALUES (12151, 2, 12);
INSERT INTO `item_mods` VALUES (12151, 10, 4);
INSERT INTO `item_mods` VALUES (12151, 27, 2);
INSERT INTO `item_mods` VALUES (12151, 160, -2);
INSERT INTO `item_mods` VALUES (12152, 1, 50);
INSERT INTO `item_mods` VALUES (12152, 2, 12);
INSERT INTO `item_mods` VALUES (12152, 10, 4);
INSERT INTO `item_mods` VALUES (12152, 27, 2);
INSERT INTO `item_mods` VALUES (12152, 160, -2);
INSERT INTO `item_mods` VALUES (12153, 1, 48);
INSERT INTO `item_mods` VALUES (12153, 2, 10);
INSERT INTO `item_mods` VALUES (12153, 8, 3);
INSERT INTO `item_mods` VALUES (12153, 23, 5);
INSERT INTO `item_mods` VALUES (12154, 1, 48);
INSERT INTO `item_mods` VALUES (12154, 2, 10);
INSERT INTO `item_mods` VALUES (12154, 8, 3);
INSERT INTO `item_mods` VALUES (12154, 23, 5);
INSERT INTO `item_mods` VALUES (12155, 1, 48);
INSERT INTO `item_mods` VALUES (12155, 2, 10);
INSERT INTO `item_mods` VALUES (12155, 8, 3);
INSERT INTO `item_mods` VALUES (12155, 23, 5);
INSERT INTO `item_mods` VALUES (12156, 1, 45);
INSERT INTO `item_mods` VALUES (12156, 9, 2);
INSERT INTO `item_mods` VALUES (12156, 25, 4);
INSERT INTO `item_mods` VALUES (12156, 68, 4);
INSERT INTO `item_mods` VALUES (12157, 1, 45);
INSERT INTO `item_mods` VALUES (12157, 9, 2);
INSERT INTO `item_mods` VALUES (12157, 25, 4);
INSERT INTO `item_mods` VALUES (12157, 68, 4);
INSERT INTO `item_mods` VALUES (12158, 1, 45);
INSERT INTO `item_mods` VALUES (12158, 9, 2);
INSERT INTO `item_mods` VALUES (12158, 25, 4);
INSERT INTO `item_mods` VALUES (12158, 68, 4);
INSERT INTO `item_mods` VALUES (12159, 1, 45);
INSERT INTO `item_mods` VALUES (12159, 11, 4);
INSERT INTO `item_mods` VALUES (12159, 24, 5);
INSERT INTO `item_mods` VALUES (12159, 26, 5);
INSERT INTO `item_mods` VALUES (12160, 1, 45);
INSERT INTO `item_mods` VALUES (12160, 11, 4);
INSERT INTO `item_mods` VALUES (12160, 24, 5);
INSERT INTO `item_mods` VALUES (12160, 26, 5);
INSERT INTO `item_mods` VALUES (12161, 1, 45);
INSERT INTO `item_mods` VALUES (12161, 11, 4);
INSERT INTO `item_mods` VALUES (12161, 24, 5);
INSERT INTO `item_mods` VALUES (12161, 26, 5);
INSERT INTO `item_mods` VALUES (12162, 1, 46);
INSERT INTO `item_mods` VALUES (12162, 8, 4);
INSERT INTO `item_mods` VALUES (12162, 23, 8);
INSERT INTO `item_mods` VALUES (12162, 25, 8);
INSERT INTO `item_mods` VALUES (12163, 1, 46);
INSERT INTO `item_mods` VALUES (12163, 8, 4);
INSERT INTO `item_mods` VALUES (12163, 23, 8);
INSERT INTO `item_mods` VALUES (12163, 25, 8);
INSERT INTO `item_mods` VALUES (12164, 1, 46);
INSERT INTO `item_mods` VALUES (12164, 8, 4);
INSERT INTO `item_mods` VALUES (12164, 23, 8);
INSERT INTO `item_mods` VALUES (12164, 25, 8);
INSERT INTO `item_mods` VALUES (12165, 1, 42);
INSERT INTO `item_mods` VALUES (12165, 9, 6);
INSERT INTO `item_mods` VALUES (12165, 25, 7);
INSERT INTO `item_mods` VALUES (12165, 68, 7);
INSERT INTO `item_mods` VALUES (12165, 165, 2);
INSERT INTO `item_mods` VALUES (12166, 1, 42);
INSERT INTO `item_mods` VALUES (12166, 9, 6);
INSERT INTO `item_mods` VALUES (12166, 25, 7);
INSERT INTO `item_mods` VALUES (12166, 68, 7);
INSERT INTO `item_mods` VALUES (12166, 165, 2);
INSERT INTO `item_mods` VALUES (12167, 1, 42);
INSERT INTO `item_mods` VALUES (12167, 9, 6);
INSERT INTO `item_mods` VALUES (12167, 25, 7);
INSERT INTO `item_mods` VALUES (12167, 68, 7);
INSERT INTO `item_mods` VALUES (12167, 165, 2);
INSERT INTO `item_mods` VALUES (12168, 1, 40);
INSERT INTO `item_mods` VALUES (12168, 13, 5);
INSERT INTO `item_mods` VALUES (12168, 14, 5);
INSERT INTO `item_mods` VALUES (12168, 27, -2);
INSERT INTO `item_mods` VALUES (12168, 30, 3);
INSERT INTO `item_mods` VALUES (12168, 170, 5);
INSERT INTO `item_mods` VALUES (12169, 1, 40);
INSERT INTO `item_mods` VALUES (12169, 13, 5);
INSERT INTO `item_mods` VALUES (12169, 14, 5);
INSERT INTO `item_mods` VALUES (12169, 27, -2);
INSERT INTO `item_mods` VALUES (12169, 30, 3);
INSERT INTO `item_mods` VALUES (12169, 170, 5);
INSERT INTO `item_mods` VALUES (12170, 1, 40);
INSERT INTO `item_mods` VALUES (12170, 13, 5);
INSERT INTO `item_mods` VALUES (12170, 14, 5);
INSERT INTO `item_mods` VALUES (12170, 27, -2);
INSERT INTO `item_mods` VALUES (12170, 30, 3);
INSERT INTO `item_mods` VALUES (12170, 170, 5);
INSERT INTO `item_mods` VALUES (12171, 1, 38);
INSERT INTO `item_mods` VALUES (12171, 5, 8);
INSERT INTO `item_mods` VALUES (12171, 12, 5);
INSERT INTO `item_mods` VALUES (12171, 28, 4);
INSERT INTO `item_mods` VALUES (12172, 1, 38);
INSERT INTO `item_mods` VALUES (12172, 5, 8);
INSERT INTO `item_mods` VALUES (12172, 12, 5);
INSERT INTO `item_mods` VALUES (12172, 28, 4);
INSERT INTO `item_mods` VALUES (12173, 1, 38);
INSERT INTO `item_mods` VALUES (12173, 5, 8);
INSERT INTO `item_mods` VALUES (12173, 12, 5);
INSERT INTO `item_mods` VALUES (12173, 28, 4);
INSERT INTO `item_mods` VALUES (12174, 1, 42);
INSERT INTO `item_mods` VALUES (12174, 2, 22);
INSERT INTO `item_mods` VALUES (12174, 5, 22);
INSERT INTO `item_mods` VALUES (12174, 27, -3);
INSERT INTO `item_mods` VALUES (12174, 369, 1);
INSERT INTO `item_mods` VALUES (12175, 1, 42);
INSERT INTO `item_mods` VALUES (12175, 2, 22);
INSERT INTO `item_mods` VALUES (12175, 5, 22);
INSERT INTO `item_mods` VALUES (12175, 27, -3);
INSERT INTO `item_mods` VALUES (12175, 369, 1);
INSERT INTO `item_mods` VALUES (12176, 1, 42);
INSERT INTO `item_mods` VALUES (12176, 2, 22);
INSERT INTO `item_mods` VALUES (12176, 5, 22);
INSERT INTO `item_mods` VALUES (12176, 27, -3);
INSERT INTO `item_mods` VALUES (12176, 369, 1);
INSERT INTO `item_mods` VALUES (12177, 1, 41);
INSERT INTO `item_mods` VALUES (12177, 5, 10);
INSERT INTO `item_mods` VALUES (12177, 12, 3);
INSERT INTO `item_mods` VALUES (12177, 27, -2);
INSERT INTO `item_mods` VALUES (12178, 1, 41);
INSERT INTO `item_mods` VALUES (12178, 5, 10);
INSERT INTO `item_mods` VALUES (12178, 12, 3);
INSERT INTO `item_mods` VALUES (12178, 27, -2);
INSERT INTO `item_mods` VALUES (12179, 1, 41);
INSERT INTO `item_mods` VALUES (12179, 5, 10);
INSERT INTO `item_mods` VALUES (12179, 12, 3);
INSERT INTO `item_mods` VALUES (12179, 27, -2);
INSERT INTO `item_mods` VALUES (12180, 1, 23);
INSERT INTO `item_mods` VALUES (12180, 2, 10);
INSERT INTO `item_mods` VALUES (12180, 8, 3);
INSERT INTO `item_mods` VALUES (12180, 9, 1);
INSERT INTO `item_mods` VALUES (12180, 23, 7);
INSERT INTO `item_mods` VALUES (12181, 1, 23);
INSERT INTO `item_mods` VALUES (12181, 2, 10);
INSERT INTO `item_mods` VALUES (12181, 8, 3);
INSERT INTO `item_mods` VALUES (12181, 9, 1);
INSERT INTO `item_mods` VALUES (12181, 23, 7);
INSERT INTO `item_mods` VALUES (12182, 1, 23);
INSERT INTO `item_mods` VALUES (12182, 2, 10);
INSERT INTO `item_mods` VALUES (12182, 8, 3);
INSERT INTO `item_mods` VALUES (12182, 9, 1);
INSERT INTO `item_mods` VALUES (12182, 23, 7);
INSERT INTO `item_mods` VALUES (12183, 1, 24);
INSERT INTO `item_mods` VALUES (12183, 8, 1);
INSERT INTO `item_mods` VALUES (12183, 9, 2);
INSERT INTO `item_mods` VALUES (12183, 23, 7);
INSERT INTO `item_mods` VALUES (12184, 1, 24);
INSERT INTO `item_mods` VALUES (12184, 8, 1);
INSERT INTO `item_mods` VALUES (12184, 9, 2);
INSERT INTO `item_mods` VALUES (12184, 23, 7);
INSERT INTO `item_mods` VALUES (12185, 1, 24);
INSERT INTO `item_mods` VALUES (12185, 8, 1);
INSERT INTO `item_mods` VALUES (12185, 9, 2);
INSERT INTO `item_mods` VALUES (12185, 23, 7);
INSERT INTO `item_mods` VALUES (12186, 1, 26);
INSERT INTO `item_mods` VALUES (12186, 10, 3);
INSERT INTO `item_mods` VALUES (12186, 27, 2);
INSERT INTO `item_mods` VALUES (12186, 161, -2);
INSERT INTO `item_mods` VALUES (12187, 1, 26);
INSERT INTO `item_mods` VALUES (12187, 10, 3);
INSERT INTO `item_mods` VALUES (12187, 27, 2);
INSERT INTO `item_mods` VALUES (12187, 161, -2);
INSERT INTO `item_mods` VALUES (12188, 1, 26);
INSERT INTO `item_mods` VALUES (12188, 10, 3);
INSERT INTO `item_mods` VALUES (12188, 27, 2);
INSERT INTO `item_mods` VALUES (12188, 161, -2);
INSERT INTO `item_mods` VALUES (12189, 1, 24);
INSERT INTO `item_mods` VALUES (12189, 2, 7);
INSERT INTO `item_mods` VALUES (12189, 23, 3);
INSERT INTO `item_mods` VALUES (12189, 25, 3);
INSERT INTO `item_mods` VALUES (12190, 1, 24);
INSERT INTO `item_mods` VALUES (12190, 2, 7);
INSERT INTO `item_mods` VALUES (12190, 23, 3);
INSERT INTO `item_mods` VALUES (12190, 25, 3);
INSERT INTO `item_mods` VALUES (12191, 1, 24);
INSERT INTO `item_mods` VALUES (12191, 2, 7);
INSERT INTO `item_mods` VALUES (12191, 23, 3);
INSERT INTO `item_mods` VALUES (12191, 25, 3);
INSERT INTO `item_mods` VALUES (12192, 1, 17);
INSERT INTO `item_mods` VALUES (12192, 9, 1);
INSERT INTO `item_mods` VALUES (12192, 25, 2);
INSERT INTO `item_mods` VALUES (12192, 68, 4);
INSERT INTO `item_mods` VALUES (12193, 1, 17);
INSERT INTO `item_mods` VALUES (12193, 9, 1);
INSERT INTO `item_mods` VALUES (12193, 25, 2);
INSERT INTO `item_mods` VALUES (12193, 68, 4);
INSERT INTO `item_mods` VALUES (12194, 1, 17);
INSERT INTO `item_mods` VALUES (12194, 9, 1);
INSERT INTO `item_mods` VALUES (12194, 25, 2);
INSERT INTO `item_mods` VALUES (12194, 68, 4);
INSERT INTO `item_mods` VALUES (12195, 1, 15);
INSERT INTO `item_mods` VALUES (12195, 11, 3);
INSERT INTO `item_mods` VALUES (12195, 26, 3);
INSERT INTO `item_mods` VALUES (12195, 27, -3);
INSERT INTO `item_mods` VALUES (12196, 1, 15);
INSERT INTO `item_mods` VALUES (12196, 11, 3);
INSERT INTO `item_mods` VALUES (12196, 26, 3);
INSERT INTO `item_mods` VALUES (12196, 27, -3);
INSERT INTO `item_mods` VALUES (12197, 1, 15);
INSERT INTO `item_mods` VALUES (12197, 11, 3);
INSERT INTO `item_mods` VALUES (12197, 26, 3);
INSERT INTO `item_mods` VALUES (12197, 27, -3);
INSERT INTO `item_mods` VALUES (12198, 1, 17);
INSERT INTO `item_mods` VALUES (12198, 8, 3);
INSERT INTO `item_mods` VALUES (12198, 25, 5);
INSERT INTO `item_mods` VALUES (12199, 1, 17);
INSERT INTO `item_mods` VALUES (12199, 8, 3);
INSERT INTO `item_mods` VALUES (12199, 25, 5);
INSERT INTO `item_mods` VALUES (12200, 1, 17);
INSERT INTO `item_mods` VALUES (12200, 8, 3);
INSERT INTO `item_mods` VALUES (12200, 25, 5);
INSERT INTO `item_mods` VALUES (12201, 1, 16);
INSERT INTO `item_mods` VALUES (12201, 9, 3);
INSERT INTO `item_mods` VALUES (12201, 25, 4);
INSERT INTO `item_mods` VALUES (12201, 289, 8);
INSERT INTO `item_mods` VALUES (12202, 1, 16);
INSERT INTO `item_mods` VALUES (12202, 9, 3);
INSERT INTO `item_mods` VALUES (12202, 25, 4);
INSERT INTO `item_mods` VALUES (12202, 289, 8);
INSERT INTO `item_mods` VALUES (12203, 1, 16);
INSERT INTO `item_mods` VALUES (12203, 9, 3);
INSERT INTO `item_mods` VALUES (12203, 25, 4);
INSERT INTO `item_mods` VALUES (12203, 289, 8);
INSERT INTO `item_mods` VALUES (12204, 1, 17);
INSERT INTO `item_mods` VALUES (12204, 5, 14);
INSERT INTO `item_mods` VALUES (12204, 13, 3);
INSERT INTO `item_mods` VALUES (12204, 14, 3);
INSERT INTO `item_mods` VALUES (12204, 27, -2);
INSERT INTO `item_mods` VALUES (12204, 30, 2);
INSERT INTO `item_mods` VALUES (12205, 1, 17);
INSERT INTO `item_mods` VALUES (12205, 5, 14);
INSERT INTO `item_mods` VALUES (12205, 13, 3);
INSERT INTO `item_mods` VALUES (12205, 14, 3);
INSERT INTO `item_mods` VALUES (12205, 27, -2);
INSERT INTO `item_mods` VALUES (12205, 30, 2);
INSERT INTO `item_mods` VALUES (12206, 1, 17);
INSERT INTO `item_mods` VALUES (12206, 5, 14);
INSERT INTO `item_mods` VALUES (12206, 13, 3);
INSERT INTO `item_mods` VALUES (12206, 14, 3);
INSERT INTO `item_mods` VALUES (12206, 27, -2);
INSERT INTO `item_mods` VALUES (12206, 30, 2);
INSERT INTO `item_mods` VALUES (12207, 1, 17);
INSERT INTO `item_mods` VALUES (12207, 5, 16);
INSERT INTO `item_mods` VALUES (12207, 12, 5);
INSERT INTO `item_mods` VALUES (12208, 1, 17);
INSERT INTO `item_mods` VALUES (12208, 5, 16);
INSERT INTO `item_mods` VALUES (12208, 12, 5);
INSERT INTO `item_mods` VALUES (12209, 1, 17);
INSERT INTO `item_mods` VALUES (12209, 5, 16);
INSERT INTO `item_mods` VALUES (12209, 12, 5);
INSERT INTO `item_mods` VALUES (12210, 1, 17);
INSERT INTO `item_mods` VALUES (12210, 2, 8);
INSERT INTO `item_mods` VALUES (12210, 5, 8);
INSERT INTO `item_mods` VALUES (12210, 27, -1);
INSERT INTO `item_mods` VALUES (12210, 357, 2);
INSERT INTO `item_mods` VALUES (12211, 1, 17);
INSERT INTO `item_mods` VALUES (12211, 2, 8);
INSERT INTO `item_mods` VALUES (12211, 5, 8);
INSERT INTO `item_mods` VALUES (12211, 27, -1);
INSERT INTO `item_mods` VALUES (12211, 357, 2);
INSERT INTO `item_mods` VALUES (12212, 1, 17);
INSERT INTO `item_mods` VALUES (12212, 2, 8);
INSERT INTO `item_mods` VALUES (12212, 5, 8);
INSERT INTO `item_mods` VALUES (12212, 27, -1);
INSERT INTO `item_mods` VALUES (12212, 357, 2);
INSERT INTO `item_mods` VALUES (12213, 1, 16);
INSERT INTO `item_mods` VALUES (12213, 5, 8);
INSERT INTO `item_mods` VALUES (12213, 13, 2);
INSERT INTO `item_mods` VALUES (12213, 14, 2);
INSERT INTO `item_mods` VALUES (12213, 27, -2);
INSERT INTO `item_mods` VALUES (12214, 1, 16);
INSERT INTO `item_mods` VALUES (12214, 5, 8);
INSERT INTO `item_mods` VALUES (12214, 13, 2);
INSERT INTO `item_mods` VALUES (12214, 14, 2);
INSERT INTO `item_mods` VALUES (12214, 27, -2);
INSERT INTO `item_mods` VALUES (12215, 1, 16);
INSERT INTO `item_mods` VALUES (12215, 5, 8);
INSERT INTO `item_mods` VALUES (12215, 13, 2);
INSERT INTO `item_mods` VALUES (12215, 14, 2);
INSERT INTO `item_mods` VALUES (12215, 27, -2);
INSERT INTO `item_mods` VALUES (12216, 1, 38);
INSERT INTO `item_mods` VALUES (12216, 2, 7);
INSERT INTO `item_mods` VALUES (12216, 8, 2);
INSERT INTO `item_mods` VALUES (12216, 23, 6);
INSERT INTO `item_mods` VALUES (12216, 288, 1);
INSERT INTO `item_mods` VALUES (12217, 1, 38);
INSERT INTO `item_mods` VALUES (12217, 2, 7);
INSERT INTO `item_mods` VALUES (12217, 8, 2);
INSERT INTO `item_mods` VALUES (12217, 23, 6);
INSERT INTO `item_mods` VALUES (12217, 288, 1);
INSERT INTO `item_mods` VALUES (12218, 1, 38);
INSERT INTO `item_mods` VALUES (12218, 2, 7);
INSERT INTO `item_mods` VALUES (12218, 8, 2);
INSERT INTO `item_mods` VALUES (12218, 23, 6);
INSERT INTO `item_mods` VALUES (12218, 288, 1);
INSERT INTO `item_mods` VALUES (12219, 1, 40);
INSERT INTO `item_mods` VALUES (12219, 9, 2);
INSERT INTO `item_mods` VALUES (12219, 23, 3);
INSERT INTO `item_mods` VALUES (12219, 25, 4);
INSERT INTO `item_mods` VALUES (12220, 1, 40);
INSERT INTO `item_mods` VALUES (12220, 9, 2);
INSERT INTO `item_mods` VALUES (12220, 23, 3);
INSERT INTO `item_mods` VALUES (12220, 25, 4);
INSERT INTO `item_mods` VALUES (12221, 1, 40);
INSERT INTO `item_mods` VALUES (12221, 9, 2);
INSERT INTO `item_mods` VALUES (12221, 23, 3);
INSERT INTO `item_mods` VALUES (12221, 25, 4);
INSERT INTO `item_mods` VALUES (12222, 1, 41);
INSERT INTO `item_mods` VALUES (12222, 10, 2);
INSERT INTO `item_mods` VALUES (12222, 27, 4);
INSERT INTO `item_mods` VALUES (12222, 163, -2);
INSERT INTO `item_mods` VALUES (12223, 1, 41);
INSERT INTO `item_mods` VALUES (12223, 10, 2);
INSERT INTO `item_mods` VALUES (12223, 27, 4);
INSERT INTO `item_mods` VALUES (12223, 163, -2);
INSERT INTO `item_mods` VALUES (12224, 1, 41);
INSERT INTO `item_mods` VALUES (12224, 10, 2);
INSERT INTO `item_mods` VALUES (12224, 27, 4);
INSERT INTO `item_mods` VALUES (12224, 163, -2);
INSERT INTO `item_mods` VALUES (12225, 1, 40);
INSERT INTO `item_mods` VALUES (12225, 2, 6);
INSERT INTO `item_mods` VALUES (12225, 8, 2);
INSERT INTO `item_mods` VALUES (12225, 23, 4);
INSERT INTO `item_mods` VALUES (12226, 1, 40);
INSERT INTO `item_mods` VALUES (12226, 2, 6);
INSERT INTO `item_mods` VALUES (12226, 8, 2);
INSERT INTO `item_mods` VALUES (12226, 23, 4);
INSERT INTO `item_mods` VALUES (12227, 1, 40);
INSERT INTO `item_mods` VALUES (12227, 2, 6);
INSERT INTO `item_mods` VALUES (12227, 8, 2);
INSERT INTO `item_mods` VALUES (12227, 23, 4);
INSERT INTO `item_mods` VALUES (12228, 1, 33);
INSERT INTO `item_mods` VALUES (12228, 11, 2);
INSERT INTO `item_mods` VALUES (12228, 25, 2);
INSERT INTO `item_mods` VALUES (12228, 68, 3);
INSERT INTO `item_mods` VALUES (12229, 1, 33);
INSERT INTO `item_mods` VALUES (12229, 11, 2);
INSERT INTO `item_mods` VALUES (12229, 25, 2);
INSERT INTO `item_mods` VALUES (12229, 68, 3);
INSERT INTO `item_mods` VALUES (12230, 1, 33);
INSERT INTO `item_mods` VALUES (12230, 11, 2);
INSERT INTO `item_mods` VALUES (12230, 25, 2);
INSERT INTO `item_mods` VALUES (12230, 68, 3);
INSERT INTO `item_mods` VALUES (12231, 1, 33);
INSERT INTO `item_mods` VALUES (12231, 11, 3);
INSERT INTO `item_mods` VALUES (12231, 24, 3);
INSERT INTO `item_mods` VALUES (12231, 26, 2);
INSERT INTO `item_mods` VALUES (12231, 27, -2);
INSERT INTO `item_mods` VALUES (12232, 1, 33);
INSERT INTO `item_mods` VALUES (12232, 11, 3);
INSERT INTO `item_mods` VALUES (12232, 24, 3);
INSERT INTO `item_mods` VALUES (12232, 26, 2);
INSERT INTO `item_mods` VALUES (12232, 27, -2);
INSERT INTO `item_mods` VALUES (12233, 1, 33);
INSERT INTO `item_mods` VALUES (12233, 11, 3);
INSERT INTO `item_mods` VALUES (12233, 24, 3);
INSERT INTO `item_mods` VALUES (12233, 26, 2);
INSERT INTO `item_mods` VALUES (12233, 27, -2);
INSERT INTO `item_mods` VALUES (12234, 1, 33);
INSERT INTO `item_mods` VALUES (12234, 8, 2);
INSERT INTO `item_mods` VALUES (12234, 25, 5);
INSERT INTO `item_mods` VALUES (12234, 291, 2);
INSERT INTO `item_mods` VALUES (12235, 1, 33);
INSERT INTO `item_mods` VALUES (12235, 8, 2);
INSERT INTO `item_mods` VALUES (12235, 25, 5);
INSERT INTO `item_mods` VALUES (12235, 291, 2);
INSERT INTO `item_mods` VALUES (12236, 1, 33);
INSERT INTO `item_mods` VALUES (12236, 8, 2);
INSERT INTO `item_mods` VALUES (12236, 25, 5);
INSERT INTO `item_mods` VALUES (12236, 291, 2);
INSERT INTO `item_mods` VALUES (12237, 1, 32);
INSERT INTO `item_mods` VALUES (12237, 9, 2);
INSERT INTO `item_mods` VALUES (12237, 25, 3);
INSERT INTO `item_mods` VALUES (12237, 68, 3);
INSERT INTO `item_mods` VALUES (12237, 165, 1);
INSERT INTO `item_mods` VALUES (12238, 1, 32);
INSERT INTO `item_mods` VALUES (12238, 9, 2);
INSERT INTO `item_mods` VALUES (12238, 25, 3);
INSERT INTO `item_mods` VALUES (12238, 68, 3);
INSERT INTO `item_mods` VALUES (12238, 165, 1);
INSERT INTO `item_mods` VALUES (12239, 1, 32);
INSERT INTO `item_mods` VALUES (12239, 9, 2);
INSERT INTO `item_mods` VALUES (12239, 25, 3);
INSERT INTO `item_mods` VALUES (12239, 68, 3);
INSERT INTO `item_mods` VALUES (12239, 165, 1);
INSERT INTO `item_mods` VALUES (12240, 1, 35);
INSERT INTO `item_mods` VALUES (12240, 5, 10);
INSERT INTO `item_mods` VALUES (12240, 13, 3);
INSERT INTO `item_mods` VALUES (12240, 14, 3);
INSERT INTO `item_mods` VALUES (12240, 30, 4);
INSERT INTO `item_mods` VALUES (12241, 1, 35);
INSERT INTO `item_mods` VALUES (12241, 5, 10);
INSERT INTO `item_mods` VALUES (12241, 13, 3);
INSERT INTO `item_mods` VALUES (12241, 14, 3);
INSERT INTO `item_mods` VALUES (12241, 30, 4);
INSERT INTO `item_mods` VALUES (12242, 1, 35);
INSERT INTO `item_mods` VALUES (12242, 5, 10);
INSERT INTO `item_mods` VALUES (12242, 13, 3);
INSERT INTO `item_mods` VALUES (12242, 14, 3);
INSERT INTO `item_mods` VALUES (12242, 30, 4);
INSERT INTO `item_mods` VALUES (12243, 1, 35);
INSERT INTO `item_mods` VALUES (12243, 5, 17);
INSERT INTO `item_mods` VALUES (12243, 12, 6);
INSERT INTO `item_mods` VALUES (12243, 27, -5);
INSERT INTO `item_mods` VALUES (12244, 1, 35);
INSERT INTO `item_mods` VALUES (12244, 5, 17);
INSERT INTO `item_mods` VALUES (12244, 12, 6);
INSERT INTO `item_mods` VALUES (12244, 27, -5);
INSERT INTO `item_mods` VALUES (12245, 1, 35);
INSERT INTO `item_mods` VALUES (12245, 5, 17);
INSERT INTO `item_mods` VALUES (12245, 12, 6);
INSERT INTO `item_mods` VALUES (12245, 27, -5);
INSERT INTO `item_mods` VALUES (12246, 1, 35);
INSERT INTO `item_mods` VALUES (12246, 2, 14);
INSERT INTO `item_mods` VALUES (12246, 5, 14);
INSERT INTO `item_mods` VALUES (12246, 71, 2);
INSERT INTO `item_mods` VALUES (12247, 1, 35);
INSERT INTO `item_mods` VALUES (12247, 2, 14);
INSERT INTO `item_mods` VALUES (12247, 5, 14);
INSERT INTO `item_mods` VALUES (12247, 71, 2);
INSERT INTO `item_mods` VALUES (12248, 1, 35);
INSERT INTO `item_mods` VALUES (12248, 2, 14);
INSERT INTO `item_mods` VALUES (12248, 5, 14);
INSERT INTO `item_mods` VALUES (12248, 71, 2);
INSERT INTO `item_mods` VALUES (12249, 1, 35);
INSERT INTO `item_mods` VALUES (12249, 5, 9);
INSERT INTO `item_mods` VALUES (12249, 12, 3);
INSERT INTO `item_mods` VALUES (12249, 27, -2);
INSERT INTO `item_mods` VALUES (12250, 1, 35);
INSERT INTO `item_mods` VALUES (12250, 5, 9);
INSERT INTO `item_mods` VALUES (12250, 12, 3);
INSERT INTO `item_mods` VALUES (12250, 27, -2);
INSERT INTO `item_mods` VALUES (12251, 1, 35);
INSERT INTO `item_mods` VALUES (12251, 5, 9);
INSERT INTO `item_mods` VALUES (12251, 12, 3);
INSERT INTO `item_mods` VALUES (12251, 27, -2);
INSERT INTO `item_mods` VALUES (12252, 1, 20);
INSERT INTO `item_mods` VALUES (12252, 2, 12);
INSERT INTO `item_mods` VALUES (12252, 8, 2);
INSERT INTO `item_mods` VALUES (12252, 23, 8);
INSERT INTO `item_mods` VALUES (12253, 1, 20);
INSERT INTO `item_mods` VALUES (12253, 2, 12);
INSERT INTO `item_mods` VALUES (12253, 8, 2);
INSERT INTO `item_mods` VALUES (12253, 23, 8);
INSERT INTO `item_mods` VALUES (12254, 1, 20);
INSERT INTO `item_mods` VALUES (12254, 2, 12);
INSERT INTO `item_mods` VALUES (12254, 8, 2);
INSERT INTO `item_mods` VALUES (12254, 23, 8);
INSERT INTO `item_mods` VALUES (12255, 1, 21);
INSERT INTO `item_mods` VALUES (12255, 8, 1);
INSERT INTO `item_mods` VALUES (12255, 9, 2);
INSERT INTO `item_mods` VALUES (12255, 23, 4);
INSERT INTO `item_mods` VALUES (12255, 25, 4);
INSERT INTO `item_mods` VALUES (12256, 1, 21);
INSERT INTO `item_mods` VALUES (12256, 8, 1);
INSERT INTO `item_mods` VALUES (12256, 9, 2);
INSERT INTO `item_mods` VALUES (12256, 23, 4);
INSERT INTO `item_mods` VALUES (12256, 25, 4);
INSERT INTO `item_mods` VALUES (12257, 1, 21);
INSERT INTO `item_mods` VALUES (12257, 8, 1);
INSERT INTO `item_mods` VALUES (12257, 9, 2);
INSERT INTO `item_mods` VALUES (12257, 23, 4);
INSERT INTO `item_mods` VALUES (12257, 25, 4);
INSERT INTO `item_mods` VALUES (12258, 1, 22);
INSERT INTO `item_mods` VALUES (12258, 2, 8);
INSERT INTO `item_mods` VALUES (12258, 5, 8);
INSERT INTO `item_mods` VALUES (12258, 27, 2);
INSERT INTO `item_mods` VALUES (12258, 163, -5);
INSERT INTO `item_mods` VALUES (12259, 1, 22);
INSERT INTO `item_mods` VALUES (12259, 2, 8);
INSERT INTO `item_mods` VALUES (12259, 5, 8);
INSERT INTO `item_mods` VALUES (12259, 27, 2);
INSERT INTO `item_mods` VALUES (12259, 163, -5);
INSERT INTO `item_mods` VALUES (12260, 1, 22);
INSERT INTO `item_mods` VALUES (12260, 2, 8);
INSERT INTO `item_mods` VALUES (12260, 5, 8);
INSERT INTO `item_mods` VALUES (12260, 27, 2);
INSERT INTO `item_mods` VALUES (12260, 163, -5);
INSERT INTO `item_mods` VALUES (12261, 1, 20);
INSERT INTO `item_mods` VALUES (12261, 2, 6);
INSERT INTO `item_mods` VALUES (12261, 23, 2);
INSERT INTO `item_mods` VALUES (12261, 25, 2);
INSERT INTO `item_mods` VALUES (12262, 1, 20);
INSERT INTO `item_mods` VALUES (12262, 2, 6);
INSERT INTO `item_mods` VALUES (12262, 23, 2);
INSERT INTO `item_mods` VALUES (12262, 25, 2);
INSERT INTO `item_mods` VALUES (12263, 1, 20);
INSERT INTO `item_mods` VALUES (12263, 2, 6);
INSERT INTO `item_mods` VALUES (12263, 23, 2);
INSERT INTO `item_mods` VALUES (12263, 25, 2);
INSERT INTO `item_mods` VALUES (12264, 1, 17);
INSERT INTO `item_mods` VALUES (12264, 11, 1);
INSERT INTO `item_mods` VALUES (12264, 25, 2);
INSERT INTO `item_mods` VALUES (12264, 68, 2);
INSERT INTO `item_mods` VALUES (12265, 1, 17);
INSERT INTO `item_mods` VALUES (12265, 11, 1);
INSERT INTO `item_mods` VALUES (12265, 25, 2);
INSERT INTO `item_mods` VALUES (12265, 68, 2);
INSERT INTO `item_mods` VALUES (12266, 1, 17);
INSERT INTO `item_mods` VALUES (12266, 11, 1);
INSERT INTO `item_mods` VALUES (12266, 25, 2);
INSERT INTO `item_mods` VALUES (12266, 68, 2);
INSERT INTO `item_mods` VALUES (12267, 1, 17);
INSERT INTO `item_mods` VALUES (12267, 11, 2);
INSERT INTO `item_mods` VALUES (12267, 26, 4);
INSERT INTO `item_mods` VALUES (12267, 27, -1);
INSERT INTO `item_mods` VALUES (12268, 1, 17);
INSERT INTO `item_mods` VALUES (12268, 11, 2);
INSERT INTO `item_mods` VALUES (12268, 26, 4);
INSERT INTO `item_mods` VALUES (12268, 27, -1);
INSERT INTO `item_mods` VALUES (12269, 1, 17);
INSERT INTO `item_mods` VALUES (12269, 11, 2);
INSERT INTO `item_mods` VALUES (12269, 26, 4);
INSERT INTO `item_mods` VALUES (12269, 27, -1);
INSERT INTO `item_mods` VALUES (12270, 1, 17);
INSERT INTO `item_mods` VALUES (12270, 8, 2);
INSERT INTO `item_mods` VALUES (12270, 23, 2);
INSERT INTO `item_mods` VALUES (12270, 25, 3);
INSERT INTO `item_mods` VALUES (12270, 291, 1);
INSERT INTO `item_mods` VALUES (12271, 1, 17);
INSERT INTO `item_mods` VALUES (12271, 8, 2);
INSERT INTO `item_mods` VALUES (12271, 23, 2);
INSERT INTO `item_mods` VALUES (12271, 25, 3);
INSERT INTO `item_mods` VALUES (12271, 291, 1);
INSERT INTO `item_mods` VALUES (12272, 1, 17);
INSERT INTO `item_mods` VALUES (12272, 8, 2);
INSERT INTO `item_mods` VALUES (12272, 23, 2);
INSERT INTO `item_mods` VALUES (12272, 25, 3);
INSERT INTO `item_mods` VALUES (12272, 291, 1);
INSERT INTO `item_mods` VALUES (12273, 1, 17);
INSERT INTO `item_mods` VALUES (12273, 9, 3);
INSERT INTO `item_mods` VALUES (12273, 25, 4);
INSERT INTO `item_mods` VALUES (12273, 68, 4);
INSERT INTO `item_mods` VALUES (12273, 289, 4);
INSERT INTO `item_mods` VALUES (12274, 1, 17);
INSERT INTO `item_mods` VALUES (12274, 9, 3);
INSERT INTO `item_mods` VALUES (12274, 25, 4);
INSERT INTO `item_mods` VALUES (12274, 68, 4);
INSERT INTO `item_mods` VALUES (12274, 289, 4);
INSERT INTO `item_mods` VALUES (12275, 1, 17);
INSERT INTO `item_mods` VALUES (12275, 9, 3);
INSERT INTO `item_mods` VALUES (12275, 25, 4);
INSERT INTO `item_mods` VALUES (12275, 68, 4);
INSERT INTO `item_mods` VALUES (12275, 289, 4);
INSERT INTO `item_mods` VALUES (12276, 1, 16);
INSERT INTO `item_mods` VALUES (12276, 5, 22);
INSERT INTO `item_mods` VALUES (12276, 13, 3);
INSERT INTO `item_mods` VALUES (12276, 27, -1);
INSERT INTO `item_mods` VALUES (12276, 30, 3);
INSERT INTO `item_mods` VALUES (12277, 1, 16);
INSERT INTO `item_mods` VALUES (12277, 5, 22);
INSERT INTO `item_mods` VALUES (12277, 13, 3);
INSERT INTO `item_mods` VALUES (12277, 27, -1);
INSERT INTO `item_mods` VALUES (12277, 30, 3);
INSERT INTO `item_mods` VALUES (12278, 1, 16);
INSERT INTO `item_mods` VALUES (12278, 5, 22);
INSERT INTO `item_mods` VALUES (12278, 13, 3);
INSERT INTO `item_mods` VALUES (12278, 27, -1);
INSERT INTO `item_mods` VALUES (12278, 30, 3);
INSERT INTO `item_mods` VALUES (12279, 1, 16);
INSERT INTO `item_mods` VALUES (12279, 5, 10);
INSERT INTO `item_mods` VALUES (12279, 12, 3);
INSERT INTO `item_mods` VALUES (12279, 27, -1);
INSERT INTO `item_mods` VALUES (12280, 1, 16);
INSERT INTO `item_mods` VALUES (12280, 5, 10);
INSERT INTO `item_mods` VALUES (12280, 12, 3);
INSERT INTO `item_mods` VALUES (12280, 27, -1);
INSERT INTO `item_mods` VALUES (12281, 1, 16);
INSERT INTO `item_mods` VALUES (12281, 5, 10);
INSERT INTO `item_mods` VALUES (12281, 12, 3);
INSERT INTO `item_mods` VALUES (12281, 27, -1);
INSERT INTO `item_mods` VALUES (12282, 1, 16);
INSERT INTO `item_mods` VALUES (12282, 2, 9);
INSERT INTO `item_mods` VALUES (12282, 5, 9);
INSERT INTO `item_mods` VALUES (12282, 27, -3);
INSERT INTO `item_mods` VALUES (12283, 1, 16);
INSERT INTO `item_mods` VALUES (12283, 2, 9);
INSERT INTO `item_mods` VALUES (12283, 5, 9);
INSERT INTO `item_mods` VALUES (12283, 27, -3);
INSERT INTO `item_mods` VALUES (12284, 1, 16);
INSERT INTO `item_mods` VALUES (12284, 2, 9);
INSERT INTO `item_mods` VALUES (12284, 5, 9);
INSERT INTO `item_mods` VALUES (12284, 27, -3);
INSERT INTO `item_mods` VALUES (12285, 1, 19);
INSERT INTO `item_mods` VALUES (12285, 5, 10);
INSERT INTO `item_mods` VALUES (12285, 13, 2);
INSERT INTO `item_mods` VALUES (12285, 27, -1);
INSERT INTO `item_mods` VALUES (12286, 1, 19);
INSERT INTO `item_mods` VALUES (12286, 5, 10);
INSERT INTO `item_mods` VALUES (12286, 13, 2);
INSERT INTO `item_mods` VALUES (12286, 27, -1);
INSERT INTO `item_mods` VALUES (12287, 1, 19);
INSERT INTO `item_mods` VALUES (12287, 5, 10);
INSERT INTO `item_mods` VALUES (12287, 13, 2);
INSERT INTO `item_mods` VALUES (12287, 27, -1);
INSERT INTO `item_mods` VALUES (12289, 1, 1);
INSERT INTO `item_mods` VALUES (12290, 1, 2);
INSERT INTO `item_mods` VALUES (12291, 1, 3);
INSERT INTO `item_mods` VALUES (12292, 1, 4);
INSERT INTO `item_mods` VALUES (12293, 1, 6);
INSERT INTO `item_mods` VALUES (12294, 1, 8);
INSERT INTO `item_mods` VALUES (12295, 1, 9);
INSERT INTO `item_mods` VALUES (12296, 1, 24);
INSERT INTO `item_mods` VALUES (12296, 54, -10);
INSERT INTO `item_mods` VALUES (12296, 57, 10);
INSERT INTO `item_mods` VALUES (12296, 68, 10);
INSERT INTO `item_mods` VALUES (12296, 161, -10);
INSERT INTO `item_mods` VALUES (12298, 1, 2);
INSERT INTO `item_mods` VALUES (12298, 55, 4);
INSERT INTO `item_mods` VALUES (12299, 1, 3);
INSERT INTO `item_mods` VALUES (12300, 1, 7);
INSERT INTO `item_mods` VALUES (12301, 1, 10);
INSERT INTO `item_mods` VALUES (12302, 1, 14);
INSERT INTO `item_mods` VALUES (12302, 23, 3);
INSERT INTO `item_mods` VALUES (12303, 1, 15);
INSERT INTO `item_mods` VALUES (12303, 61, 3);
INSERT INTO `item_mods` VALUES (12304, 1, 12);
INSERT INTO `item_mods` VALUES (12304, 11, 3);

-- ------------------------------------------
-- Ice Shield
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (12305, 1, 23);
INSERT INTO `item_mods` VALUES (12305, 10, 2);
INSERT INTO `item_mods` VALUES (12305, 55, 20);
INSERT INTO `item_mods` VALUES (12305, 58, 10);
INSERT INTO `item_mods` VALUES (12305, 499, 2); -- ice spikes
INSERT INTO `item_mods` VALUES (12305, 500, 20); -- spikes dmg
INSERT INTO `item_mods` VALUES (12305, 501, 25); -- spikes proc rate

INSERT INTO `item_mods` VALUES (12306, 1, 8);
INSERT INTO `item_mods` VALUES (12307, 1, 12);
INSERT INTO `item_mods` VALUES (12308, 1, 16);
INSERT INTO `item_mods` VALUES (12308, 60, 5);
INSERT INTO `item_mods` VALUES (12308, 61, 5);
INSERT INTO `item_mods` VALUES (12309, 1, 21);
INSERT INTO `item_mods` VALUES (12309, 2, 10);
INSERT INTO `item_mods` VALUES (12309, 5, 10);
INSERT INTO `item_mods` VALUES (12309, 60, 8);
INSERT INTO `item_mods` VALUES (12309, 61, 8);
INSERT INTO `item_mods` VALUES (12310, 1, 18);
INSERT INTO `item_mods` VALUES (12310, 10, 2);
INSERT INTO `item_mods` VALUES (12310, 58, 10);
INSERT INTO `item_mods` VALUES (12311, 1, 11);
INSERT INTO `item_mods` VALUES (12312, 1, 14);
INSERT INTO `item_mods` VALUES (12312, 8, 2);
INSERT INTO `item_mods` VALUES (12312, 13, 1);
INSERT INTO `item_mods` VALUES (12313, 1, 14);
INSERT INTO `item_mods` VALUES (12313, 8, 1);
INSERT INTO `item_mods` VALUES (12313, 13, 2);
INSERT INTO `item_mods` VALUES (12316, 1, 3);
INSERT INTO `item_mods` VALUES (12316, 54, 2);
INSERT INTO `item_mods` VALUES (12316, 55, 2);
INSERT INTO `item_mods` VALUES (12316, 58, -4);

-- ------------------------------------------
-- Flame Shield
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (12317, 1, 12);
INSERT INTO `item_mods` VALUES (12317, 54, 20);
INSERT INTO `item_mods` VALUES (12317, 499, 1); -- Blaze Spikes
INSERT INTO `item_mods` VALUES (12317, 500, 20); -- Spikes DMG
INSERT INTO `item_mods` VALUES (12317, 501, 20); -- Spikes Proc Rate

INSERT INTO `item_mods` VALUES (12318, 1, 25);
INSERT INTO `item_mods` VALUES (12318, 54, 25);
INSERT INTO `item_mods` VALUES (12318, 55, 25);
INSERT INTO `item_mods` VALUES (12318, 56, 25);
INSERT INTO `item_mods` VALUES (12318, 57, 25);
INSERT INTO `item_mods` VALUES (12318, 58, 25);
INSERT INTO `item_mods` VALUES (12318, 59, 25);
INSERT INTO `item_mods` VALUES (12318, 60, 25);
INSERT INTO `item_mods` VALUES (12318, 61, 25);
INSERT INTO `item_mods` VALUES (12319, 1, 4);
INSERT INTO `item_mods` VALUES (12321, 1, 15);
INSERT INTO `item_mods` VALUES (12321, 13, 3);
INSERT INTO `item_mods` VALUES (12321, 14, 3);
INSERT INTO `item_mods` VALUES (12321, 61, 12);
INSERT INTO `item_mods` VALUES (12323, 1, 14);
INSERT INTO `item_mods` VALUES (12324, 1, 18);
INSERT INTO `item_mods` VALUES (12325, 1, 4);
INSERT INTO `item_mods` VALUES (12326, 1, 9);
INSERT INTO `item_mods` VALUES (12327, 1, 11);
INSERT INTO `item_mods` VALUES (12328, 1, 13);
INSERT INTO `item_mods` VALUES (12329, 1, 9);
INSERT INTO `item_mods` VALUES (12330, 1, 3);
INSERT INTO `item_mods` VALUES (12331, 1, 7);
INSERT INTO `item_mods` VALUES (12332, 1, 50);
INSERT INTO `item_mods` VALUES (12333, 1, 2);
INSERT INTO `item_mods` VALUES (12334, 1, 5);
INSERT INTO `item_mods` VALUES (12335, 1, 8);
INSERT INTO `item_mods` VALUES (12336, 1, 7);
INSERT INTO `item_mods` VALUES (12336, 68, 3);
INSERT INTO `item_mods` VALUES (12337, 1, 6);
INSERT INTO `item_mods` VALUES (12338, 1, 5);
INSERT INTO `item_mods` VALUES (12338, 55, 3);
INSERT INTO `item_mods` VALUES (12339, 1, 15);
INSERT INTO `item_mods` VALUES (12340, 1, 1);
INSERT INTO `item_mods` VALUES (12340, 10, 1);
INSERT INTO `item_mods` VALUES (12340, 11, 1);
INSERT INTO `item_mods` VALUES (12340, 59, 1);
INSERT INTO `item_mods` VALUES (12341, 1, 3);
INSERT INTO `item_mods` VALUES (12341, 56, 3);
INSERT INTO `item_mods` VALUES (12341, 57, 3);
INSERT INTO `item_mods` VALUES (12342, 1, 4);
INSERT INTO `item_mods` VALUES (12342, 23, 5);
INSERT INTO `item_mods` VALUES (12343, 54, 3);
INSERT INTO `item_mods` VALUES (12343, 55, 3);
INSERT INTO `item_mods` VALUES (12343, 56, 3);
INSERT INTO `item_mods` VALUES (12343, 57, 3);
INSERT INTO `item_mods` VALUES (12343, 58, 3);
INSERT INTO `item_mods` VALUES (12343, 59, 3);
INSERT INTO `item_mods` VALUES (12343, 60, 3);
INSERT INTO `item_mods` VALUES (12343, 61, 3);
INSERT INTO `item_mods` VALUES (12344, 1, 8);
INSERT INTO `item_mods` VALUES (12344, 109, 10);
INSERT INTO `item_mods` VALUES (12346, 1, 17);
INSERT INTO `item_mods` VALUES (12346, 60, 6);
INSERT INTO `item_mods` VALUES (12346, 61, 6);
INSERT INTO `item_mods` VALUES (12347, 1, 15);
INSERT INTO `item_mods` VALUES (12347, 23, 5);
INSERT INTO `item_mods` VALUES (12348, 1, 12);
INSERT INTO `item_mods` VALUES (12348, 55, -5);
INSERT INTO `item_mods` VALUES (12349, 1, 9);
INSERT INTO `item_mods` VALUES (12349, 25, 3);
INSERT INTO `item_mods` VALUES (12350, 1, 6);
INSERT INTO `item_mods` VALUES (12350, 23, 6);
INSERT INTO `item_mods` VALUES (12351, 7, 30);
INSERT INTO `item_mods` VALUES (12351, 54, 2);
INSERT INTO `item_mods` VALUES (12351, 55, 2);
INSERT INTO `item_mods` VALUES (12351, 56, 2);
INSERT INTO `item_mods` VALUES (12351, 57, 2);
INSERT INTO `item_mods` VALUES (12351, 58, 2);
INSERT INTO `item_mods` VALUES (12351, 59, 2);
INSERT INTO `item_mods` VALUES (12351, 60, 2);
INSERT INTO `item_mods` VALUES (12351, 61, 2);
INSERT INTO `item_mods` VALUES (12352, 1, 10);
INSERT INTO `item_mods` VALUES (12353, 1, 16);
INSERT INTO `item_mods` VALUES (12353, 61, 4);
INSERT INTO `item_mods` VALUES (12354, 1, 19);
INSERT INTO `item_mods` VALUES (12355, 1, 19);
INSERT INTO `item_mods` VALUES (12355, 10, 3);
INSERT INTO `item_mods` VALUES (12355, 58, 12);
INSERT INTO `item_mods` VALUES (12356, 1, 8);
INSERT INTO `item_mods` VALUES (12356, 23, 12);

-- ------------------------------------------
-- Ice Shield +1
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (12357, 1, 24);
INSERT INTO `item_mods` VALUES (12357, 10, 2);
INSERT INTO `item_mods` VALUES (12357, 55, 25);
INSERT INTO `item_mods` VALUES (12357, 58, 10);
INSERT INTO `item_mods` VALUES (12357, 499, 2); -- ice spikes
INSERT INTO `item_mods` VALUES (12357, 500, 25); -- spikes dmg
INSERT INTO `item_mods` VALUES (12357, 501, 30); -- spikes proc rate

INSERT INTO `item_mods` VALUES (12358, 1, 22);
INSERT INTO `item_mods` VALUES (12358, 2, 11);
INSERT INTO `item_mods` VALUES (12358, 5, 11);
INSERT INTO `item_mods` VALUES (12358, 60, 9);
INSERT INTO `item_mods` VALUES (12358, 61, 9);
INSERT INTO `item_mods` VALUES (12359, 1, 9);
INSERT INTO `item_mods` VALUES (12359, 8, 3);
INSERT INTO `item_mods` VALUES (12359, 9, -6);
INSERT INTO `item_mods` VALUES (12359, 11, -6);
INSERT INTO `item_mods` VALUES (12360, 1, 24);
INSERT INTO `item_mods` VALUES (12360, 8, 5);
INSERT INTO `item_mods` VALUES (12360, 68, 3);
INSERT INTO `item_mods` VALUES (12360, 224, 2);
INSERT INTO `item_mods` VALUES (12360, 225, 2);
INSERT INTO `item_mods` VALUES (12360, 226, 2);
INSERT INTO `item_mods` VALUES (12360, 227, 2);
INSERT INTO `item_mods` VALUES (12360, 228, 2);
INSERT INTO `item_mods` VALUES (12360, 229, 2);
INSERT INTO `item_mods` VALUES (12360, 230, 2);
INSERT INTO `item_mods` VALUES (12360, 231, 2);
INSERT INTO `item_mods` VALUES (12360, 232, 2);
INSERT INTO `item_mods` VALUES (12360, 233, 2);
INSERT INTO `item_mods` VALUES (12360, 234, 2);
INSERT INTO `item_mods` VALUES (12361, 1, 20);
INSERT INTO `item_mods` VALUES (12361, 55, -20);
INSERT INTO `item_mods` VALUES (12362, 1, 23);
INSERT INTO `item_mods` VALUES (12362, 385, 15);
INSERT INTO `item_mods` VALUES (12363, 1, 5);
INSERT INTO `item_mods` VALUES (12363, 4, 30);
INSERT INTO `item_mods` VALUES (12364, 1, 2);
INSERT INTO `item_mods` VALUES (12364, 54, 3);
INSERT INTO `item_mods` VALUES (12364, 55, 3);
INSERT INTO `item_mods` VALUES (12364, 56, 3);
INSERT INTO `item_mods` VALUES (12364, 57, 3);
INSERT INTO `item_mods` VALUES (12364, 58, 3);
INSERT INTO `item_mods` VALUES (12364, 59, 3);
INSERT INTO `item_mods` VALUES (12364, 60, 3);
INSERT INTO `item_mods` VALUES (12364, 61, 3);
INSERT INTO `item_mods` VALUES (12365, 1, 3);
INSERT INTO `item_mods` VALUES (12365, 54, 4);
INSERT INTO `item_mods` VALUES (12365, 55, 4);
INSERT INTO `item_mods` VALUES (12365, 56, 4);
INSERT INTO `item_mods` VALUES (12365, 57, 4);
INSERT INTO `item_mods` VALUES (12365, 58, 4);
INSERT INTO `item_mods` VALUES (12365, 59, 4);
INSERT INTO `item_mods` VALUES (12365, 60, 4);
INSERT INTO `item_mods` VALUES (12365, 61, 4);
INSERT INTO `item_mods` VALUES (12366, 1, 8);
INSERT INTO `item_mods` VALUES (12366, 68, 3);
INSERT INTO `item_mods` VALUES (12367, 1, 9);
INSERT INTO `item_mods` VALUES (12367, 68, 3);
INSERT INTO `item_mods` VALUES (12368, 1, 15);
INSERT INTO `item_mods` VALUES (12368, 8, 2);
INSERT INTO `item_mods` VALUES (12368, 13, 1);
INSERT INTO `item_mods` VALUES (12369, 1, 16);
INSERT INTO `item_mods` VALUES (12369, 8, 2);
INSERT INTO `item_mods` VALUES (12369, 13, 1);
INSERT INTO `item_mods` VALUES (12370, 1, 10);
INSERT INTO `item_mods` VALUES (12370, 8, 4);
INSERT INTO `item_mods` VALUES (12370, 9, -5);
INSERT INTO `item_mods` VALUES (12370, 11, -5);
INSERT INTO `item_mods` VALUES (12371, 1, 5);
INSERT INTO `item_mods` VALUES (12371, 68, 1);
INSERT INTO `item_mods` VALUES (12372, 1, 7);
INSERT INTO `item_mods` VALUES (12372, 2, 6);
INSERT INTO `item_mods` VALUES (12373, 1, 8);
INSERT INTO `item_mods` VALUES (12373, 2, 8);
INSERT INTO `item_mods` VALUES (12374, 12, 1);
INSERT INTO `item_mods` VALUES (12374, 13, 1);
INSERT INTO `item_mods` VALUES (12375, 1, 6);
INSERT INTO `item_mods` VALUES (12375, 109, 5);
INSERT INTO `item_mods` VALUES (12376, 1, 15);
INSERT INTO `item_mods` VALUES (12376, 8, 1);
INSERT INTO `item_mods` VALUES (12376, 13, 2);
INSERT INTO `item_mods` VALUES (12377, 1, 16);
INSERT INTO `item_mods` VALUES (12377, 8, 1);
INSERT INTO `item_mods` VALUES (12377, 13, 2);
INSERT INTO `item_mods` VALUES (12378, 1, 10);
INSERT INTO `item_mods` VALUES (12378, 2, 5);
INSERT INTO `item_mods` VALUES (12379, 1, 13);
INSERT INTO `item_mods` VALUES (12379, 2, 10);
INSERT INTO `item_mods` VALUES (12379, 5, 10);
INSERT INTO `item_mods` VALUES (12379, 13, 1);
INSERT INTO `item_mods` VALUES (12380, 1, 14);
INSERT INTO `item_mods` VALUES (12380, 2, 15);
INSERT INTO `item_mods` VALUES (12380, 5, 15);
INSERT INTO `item_mods` VALUES (12380, 13, 2);
INSERT INTO `item_mods` VALUES (12381, 1, 16);
INSERT INTO `item_mods` VALUES (12381, 7, 10);
INSERT INTO `item_mods` VALUES (12381, 8, 1);
INSERT INTO `item_mods` VALUES (12381, 12, 2);
INSERT INTO `item_mods` VALUES (12381, 116, 5);
INSERT INTO `item_mods` VALUES (12382, 1, 3);
INSERT INTO `item_mods` VALUES (12382, 7, 25);
INSERT INTO `item_mods` VALUES (12382, 11, 3);
INSERT INTO `item_mods` VALUES (12382, 12, 3);
INSERT INTO `item_mods` VALUES (12382, 56, -5);
INSERT INTO `item_mods` VALUES (12382, 57, 5);
INSERT INTO `item_mods` VALUES (12382, 58, 5);
INSERT INTO `item_mods` VALUES (12383, 1, 15);
INSERT INTO `item_mods` VALUES (12383, 14, 3);
INSERT INTO `item_mods` VALUES (12383, 27, 2);
INSERT INTO `item_mods` VALUES (12383, 230, 2);
INSERT INTO `item_mods` VALUES (12384, 1, 16);
INSERT INTO `item_mods` VALUES (12384, 14, 4);
INSERT INTO `item_mods` VALUES (12384, 27, 3);
INSERT INTO `item_mods` VALUES (12384, 228, 2);
INSERT INTO `item_mods` VALUES (12385, 1, 27);
INSERT INTO `item_mods` VALUES (12385, 55, -10);
INSERT INTO `item_mods` VALUES (12385, 109, 10);
INSERT INTO `item_mods` VALUES (12386, 1, 28);
INSERT INTO `item_mods` VALUES (12386, 55, -11);
INSERT INTO `item_mods` VALUES (12386, 109, 11);
INSERT INTO `item_mods` VALUES (12387, 1, 22);
INSERT INTO `item_mods` VALUES (12387, 10, 5);
INSERT INTO `item_mods` VALUES (12387, 14, 5);
INSERT INTO `item_mods` VALUES (12387, 27, 3);
INSERT INTO `item_mods` VALUES (12387, 230, 2);
INSERT INTO `item_mods` VALUES (12388, 1, 23);
INSERT INTO `item_mods` VALUES (12388, 10, 6);
INSERT INTO `item_mods` VALUES (12388, 14, 6);
INSERT INTO `item_mods` VALUES (12388, 27, 4);
INSERT INTO `item_mods` VALUES (12388, 230, 2);

-- -------------------------------------------------------
-- Mercenary's Targe
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (12389, 1, 6); -- DEF:6

-- -------------------------------------------------------
-- Wrestler's Aspis
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (12390, 1, 4); -- DEF:4

INSERT INTO `item_mods` VALUES (12391, 1, 2);
INSERT INTO `item_mods` VALUES (12392, 1, 2);
INSERT INTO `item_mods` VALUES (12393, 1, 4);
INSERT INTO `item_mods` VALUES (12394, 1, 3);
INSERT INTO `item_mods` VALUES (12395, 1, 6);
INSERT INTO `item_mods` VALUES (12396, 1, 4);
INSERT INTO `item_mods` VALUES (12397, 1, 4);
INSERT INTO `item_mods` VALUES (12398, 1, 4);
INSERT INTO `item_mods` VALUES (12399, 1, 3);
INSERT INTO `item_mods` VALUES (12400, 1, 4);
INSERT INTO `item_mods` VALUES (12401, 1, 6);
INSERT INTO `item_mods` VALUES (12402, 1, 4);
INSERT INTO `item_mods` VALUES (12403, 1, 2);
INSERT INTO `item_mods` VALUES (12404, 1, 1);
INSERT INTO `item_mods` VALUES (12404, 5, 6);
INSERT INTO `item_mods` VALUES (12404, 14, 1);
INSERT INTO `item_mods` VALUES (12405, 1, 10);
INSERT INTO `item_mods` VALUES (12405, 10, 1);
INSERT INTO `item_mods` VALUES (12406, 1, 6);
INSERT INTO `item_mods` VALUES (12407, 1, 20);
INSERT INTO `item_mods` VALUES (12407, 160, -2);
INSERT INTO `item_mods` VALUES (12408, 1, 18);
INSERT INTO `item_mods` VALUES (12408, 2, 16);
INSERT INTO `item_mods` VALUES (12408, 10, 2);
INSERT INTO `item_mods` VALUES (12409, 1, 10);
INSERT INTO `item_mods` VALUES (12409, 5, 10);
INSERT INTO `item_mods` VALUES (12409, 13, 2);
INSERT INTO `item_mods` VALUES (12409, 54, 10);
INSERT INTO `item_mods` VALUES (12409, 55, 10);
INSERT INTO `item_mods` VALUES (12409, 56, 10);
INSERT INTO `item_mods` VALUES (12409, 57, 10);
INSERT INTO `item_mods` VALUES (12409, 58, 10);
INSERT INTO `item_mods` VALUES (12409, 59, 10);
INSERT INTO `item_mods` VALUES (12409, 60, 10);
INSERT INTO `item_mods` VALUES (12409, 61, 10);
INSERT INTO `item_mods` VALUES (12410, 1, 11);
INSERT INTO `item_mods` VALUES (12410, 5, 15);
INSERT INTO `item_mods` VALUES (12410, 13, 3);
INSERT INTO `item_mods` VALUES (12410, 54, 15);
INSERT INTO `item_mods` VALUES (12410, 55, 15);
INSERT INTO `item_mods` VALUES (12410, 56, 15);
INSERT INTO `item_mods` VALUES (12410, 57, 15);
INSERT INTO `item_mods` VALUES (12410, 58, 15);
INSERT INTO `item_mods` VALUES (12410, 59, 15);
INSERT INTO `item_mods` VALUES (12410, 60, 15);
INSERT INTO `item_mods` VALUES (12410, 61, 15);
INSERT INTO `item_mods` VALUES (12411, 1, 10);
INSERT INTO `item_mods` VALUES (12411, 5, 10);
INSERT INTO `item_mods` VALUES (12411, 13, 2);
INSERT INTO `item_mods` VALUES (12411, 54, 10);
INSERT INTO `item_mods` VALUES (12411, 55, 10);
INSERT INTO `item_mods` VALUES (12411, 56, 10);
INSERT INTO `item_mods` VALUES (12411, 57, 10);
INSERT INTO `item_mods` VALUES (12411, 58, 10);
INSERT INTO `item_mods` VALUES (12411, 59, 10);
INSERT INTO `item_mods` VALUES (12411, 60, 10);
INSERT INTO `item_mods` VALUES (12411, 61, 10);
INSERT INTO `item_mods` VALUES (12412, 1, 12);
INSERT INTO `item_mods` VALUES (12413, 1, 6);
INSERT INTO `item_mods` VALUES (12413, 10, 4);
INSERT INTO `item_mods` VALUES (12413, 11, -7);
INSERT INTO `item_mods` VALUES (12413, 59, 7);
INSERT INTO `item_mods` VALUES (12414, 1, 6);
INSERT INTO `item_mods` VALUES (12414, 10, 3);
INSERT INTO `item_mods` VALUES (12414, 11, -6);
INSERT INTO `item_mods` VALUES (12414, 59, 6);
INSERT INTO `item_mods` VALUES (12415, 1, 2);
INSERT INTO `item_mods` VALUES (12415, 10, 1);
INSERT INTO `item_mods` VALUES (12415, 11, -2);
INSERT INTO `item_mods` VALUES (12415, 59, 2);
INSERT INTO `item_mods` VALUES (12416, 1, 16);
INSERT INTO `item_mods` VALUES (12417, 1, 20);
INSERT INTO `item_mods` VALUES (12418, 1, 22);
INSERT INTO `item_mods` VALUES (12418, 10, 2);
INSERT INTO `item_mods` VALUES (12418, 61, 4);
INSERT INTO `item_mods` VALUES (12419, 1, 25);
INSERT INTO `item_mods` VALUES (12419, 5, 8);
INSERT INTO `item_mods` VALUES (12419, 12, 3);
INSERT INTO `item_mods` VALUES (12419, 13, -1);
INSERT INTO `item_mods` VALUES (12419, 60, 2);
INSERT INTO `item_mods` VALUES (12419, 61, 2);
INSERT INTO `item_mods` VALUES (12420, 1, 28);
INSERT INTO `item_mods` VALUES (12420, 2, 12);
INSERT INTO `item_mods` VALUES (12420, 5, 12);
INSERT INTO `item_mods` VALUES (12420, 10, 3);
INSERT INTO `item_mods` VALUES (12420, 27, 2);
INSERT INTO `item_mods` VALUES (12420, 68, -3);
INSERT INTO `item_mods` VALUES (12421, 1, 40);
INSERT INTO `item_mods` VALUES (12421, 2, 30);
INSERT INTO `item_mods` VALUES (12421, 8, -5);
INSERT INTO `item_mods` VALUES (12421, 9, -5);
INSERT INTO `item_mods` VALUES (12421, 10, 10);
INSERT INTO `item_mods` VALUES (12421, 14, 10);
INSERT INTO `item_mods` VALUES (12421, 109, 5);
INSERT INTO `item_mods` VALUES (12422, 1, 17);
INSERT INTO `item_mods` VALUES (12422, 10, 2);
INSERT INTO `item_mods` VALUES (12423, 1, 26);
INSERT INTO `item_mods` VALUES (12423, 5, 9);
INSERT INTO `item_mods` VALUES (12423, 12, 4);
INSERT INTO `item_mods` VALUES (12423, 13, -1);
INSERT INTO `item_mods` VALUES (12423, 60, 3);
INSERT INTO `item_mods` VALUES (12423, 61, 3);
INSERT INTO `item_mods` VALUES (12424, 1, 11);
INSERT INTO `item_mods` VALUES (12425, 1, 14);
INSERT INTO `item_mods` VALUES (12426, 1, 18);
INSERT INTO `item_mods` VALUES (12427, 1, 23);
INSERT INTO `item_mods` VALUES (12428, 1, 22);
INSERT INTO `item_mods` VALUES (12428, 23, 4);
INSERT INTO `item_mods` VALUES (12428, 25, 3);
INSERT INTO `item_mods` VALUES (12428, 68, -2);
INSERT INTO `item_mods` VALUES (12429, 1, 30);
INSERT INTO `item_mods` VALUES (12429, 2, -20);
INSERT INTO `item_mods` VALUES (12429, 23, 8);
INSERT INTO `item_mods` VALUES (12429, 25, 5);
INSERT INTO `item_mods` VALUES (12429, 68, -8);
INSERT INTO `item_mods` VALUES (12430, 1, 22);
INSERT INTO `item_mods` VALUES (12430, 8, 1);
INSERT INTO `item_mods` VALUES (12430, 9, 1);
INSERT INTO `item_mods` VALUES (12431, 1, 12);
INSERT INTO `item_mods` VALUES (12431, 11, 1);
INSERT INTO `item_mods` VALUES (12432, 1, 5);
INSERT INTO `item_mods` VALUES (12433, 1, 11);
INSERT INTO `item_mods` VALUES (12434, 1, 35);
INSERT INTO `item_mods` VALUES (12434, 2, 50);
INSERT INTO `item_mods` VALUES (12434, 10, 15);
INSERT INTO `item_mods` VALUES (12434, 59, 50);
INSERT INTO `item_mods` VALUES (12435, 1, 21);
INSERT INTO `item_mods` VALUES (12435, 58, -4);
INSERT INTO `item_mods` VALUES (12435, 59, 4);
INSERT INTO `item_mods` VALUES (12435, 163, -2);
INSERT INTO `item_mods` VALUES (12436, 1, 23);
INSERT INTO `item_mods` VALUES (12436, 2, 10);
INSERT INTO `item_mods` VALUES (12436, 60, 10);
INSERT INTO `item_mods` VALUES (12436, 61, 10);
INSERT INTO `item_mods` VALUES (12436, 162, -4);
INSERT INTO `item_mods` VALUES (12437, 1, 29);
INSERT INTO `item_mods` VALUES (12437, 9, 1);
INSERT INTO `item_mods` VALUES (12437, 11, 2);
INSERT INTO `item_mods` VALUES (12437, 163, -5);
INSERT INTO `item_mods` VALUES (12438, 1, 12);
INSERT INTO `item_mods` VALUES (12438, 9, 1);
INSERT INTO `item_mods` VALUES (12439, 1, 24);
INSERT INTO `item_mods` VALUES (12440, 1, 3);
INSERT INTO `item_mods` VALUES (12441, 1, 7);
INSERT INTO `item_mods` VALUES (12442, 1, 11);
INSERT INTO `item_mods` VALUES (12443, 1, 14);
INSERT INTO `item_mods` VALUES (12444, 1, 18);
INSERT INTO `item_mods` VALUES (12444, 54, 2);
INSERT INTO `item_mods` VALUES (12444, 59, -1);
INSERT INTO `item_mods` VALUES (12445, 1, 31);
INSERT INTO `item_mods` VALUES (12445, 2, 30);
INSERT INTO `item_mods` VALUES (12445, 10, 5);
INSERT INTO `item_mods` VALUES (12445, 25, 5);
INSERT INTO `item_mods` VALUES (12445, 68, 5);
INSERT INTO `item_mods` VALUES (12445, 169, -3);
INSERT INTO `item_mods` VALUES (12446, 1, 21);
INSERT INTO `item_mods` VALUES (12446, 23, 3);
INSERT INTO `item_mods` VALUES (12446, 54, -4);
INSERT INTO `item_mods` VALUES (12446, 55, 4);
INSERT INTO `item_mods` VALUES (12447, 1, 22);
INSERT INTO `item_mods` VALUES (12447, 3, -1);
INSERT INTO `item_mods` VALUES (12447, 26, 3);
INSERT INTO `item_mods` VALUES (12447, 68, 2);
INSERT INTO `item_mods` VALUES (12448, 1, 2);
INSERT INTO `item_mods` VALUES (12449, 1, 5);
INSERT INTO `item_mods` VALUES (12450, 1, 12);
INSERT INTO `item_mods` VALUES (12451, 1, 20);
INSERT INTO `item_mods` VALUES (12451, 2, 3);
INSERT INTO `item_mods` VALUES (12451, 55, -2);
INSERT INTO `item_mods` VALUES (12451, 59, 5);
INSERT INTO `item_mods` VALUES (12451, 61, 5);
INSERT INTO `item_mods` VALUES (12452, 1, 21);
INSERT INTO `item_mods` VALUES (12452, 60, 1);
INSERT INTO `item_mods` VALUES (12452, 61, 1);
INSERT INTO `item_mods` VALUES (12452, 161, -1);
INSERT INTO `item_mods` VALUES (12453, 1, 21);
INSERT INTO `item_mods` VALUES (12453, 4, 15);
INSERT INTO `item_mods` VALUES (12453, 9, 1);
INSERT INTO `item_mods` VALUES (12453, 14, 2);
INSERT INTO `item_mods` VALUES (12453, 163, -2);
INSERT INTO `item_mods` VALUES (12454, 1, 7);
INSERT INTO `item_mods` VALUES (12455, 1, 9);
INSERT INTO `item_mods` VALUES (12456, 1, 4);
INSERT INTO `item_mods` VALUES (12457, 1, 7);
INSERT INTO `item_mods` VALUES (12458, 1, 10);
INSERT INTO `item_mods` VALUES (12458, 57, 1);
INSERT INTO `item_mods` VALUES (12458, 58, 1);
INSERT INTO `item_mods` VALUES (12459, 1, 15);
INSERT INTO `item_mods` VALUES (12460, 1, 17);
INSERT INTO `item_mods` VALUES (12461, 1, 23);
INSERT INTO `item_mods` VALUES (12461, 54, 8);
INSERT INTO `item_mods` VALUES (12461, 242, 3);
INSERT INTO `item_mods` VALUES (12462, 1, 14);
INSERT INTO `item_mods` VALUES (12463, 1, 3);
INSERT INTO `item_mods` VALUES (12464, 1, 5);
INSERT INTO `item_mods` VALUES (12465, 1, 9);
INSERT INTO `item_mods` VALUES (12466, 1, 12);
INSERT INTO `item_mods` VALUES (12467, 1, 16);
INSERT INTO `item_mods` VALUES (12468, 1, 19);
INSERT INTO `item_mods` VALUES (12468, 25, 1);
INSERT INTO `item_mods` VALUES (12468, 68, 1);
INSERT INTO `item_mods` VALUES (12469, 1, 20);
INSERT INTO `item_mods` VALUES (12469, 2, 10);
INSERT INTO `item_mods` VALUES (12469, 12, -3);
INSERT INTO `item_mods` VALUES (12469, 25, 7);
INSERT INTO `item_mods` VALUES (12469, 26, 7);
INSERT INTO `item_mods` VALUES (12470, 1, 10);
INSERT INTO `item_mods` VALUES (12470, 8, 1);
INSERT INTO `item_mods` VALUES (12470, 9, 1);
INSERT INTO `item_mods` VALUES (12471, 1, 6);
INSERT INTO `item_mods` VALUES (12472, 1, 1);
INSERT INTO `item_mods` VALUES (12473, 1, 5);
INSERT INTO `item_mods` VALUES (12474, 1, 9);
INSERT INTO `item_mods` VALUES (12475, 1, 12);
INSERT INTO `item_mods` VALUES (12476, 1, 17);
INSERT INTO `item_mods` VALUES (12477, 1, 23);
INSERT INTO `item_mods` VALUES (12477, 5, 15);
INSERT INTO `item_mods` VALUES (12477, 13, 2);
INSERT INTO `item_mods` VALUES (12477, 14, 1);
INSERT INTO `item_mods` VALUES (12478, 1, 16);
INSERT INTO `item_mods` VALUES (12479, 1, 10);
INSERT INTO `item_mods` VALUES (12480, 1, 8);
INSERT INTO `item_mods` VALUES (12481, 1, 15);
INSERT INTO `item_mods` VALUES (12482, 1, 21);
INSERT INTO `item_mods` VALUES (12482, 2, 4);
INSERT INTO `item_mods` VALUES (12482, 55, -2);
INSERT INTO `item_mods` VALUES (12482, 59, 7);
INSERT INTO `item_mods` VALUES (12482, 61, 7);
INSERT INTO `item_mods` VALUES (12483, 1, 24);
INSERT INTO `item_mods` VALUES (12483, 5, 16);
INSERT INTO `item_mods` VALUES (12483, 13, 3);
INSERT INTO `item_mods` VALUES (12483, 14, 2);
INSERT INTO `item_mods` VALUES (12484, 1, 8);
INSERT INTO `item_mods` VALUES (12484, 8, 1);
INSERT INTO `item_mods` VALUES (12485, 1, 6);
INSERT INTO `item_mods` VALUES (12485, 59, 5);
INSERT INTO `item_mods` VALUES (12485, 61, 5);
INSERT INTO `item_mods` VALUES (12486, 2, -15);
INSERT INTO `item_mods` VALUES (12486, 9, 3);
INSERT INTO `item_mods` VALUES (12486, 11, 3);
INSERT INTO `item_mods` VALUES (12486, 68, 10);
INSERT INTO `item_mods` VALUES (12487, 1, 6);
INSERT INTO `item_mods` VALUES (12489, 2, -30);
INSERT INTO `item_mods` VALUES (12489, 5, 75);
INSERT INTO `item_mods` VALUES (12490, 1, 22);
INSERT INTO `item_mods` VALUES (12490, 12, 7);
INSERT INTO `item_mods` VALUES (12490, 27, 2);
INSERT INTO `item_mods` VALUES (12490, 168, 5);
INSERT INTO `item_mods` VALUES (12492, 1, 27);
INSERT INTO `item_mods` VALUES (12492, 68, 12);
INSERT INTO `item_mods` VALUES (12492, 161, -1);
INSERT INTO `item_mods` VALUES (12493, 1, 18);
INSERT INTO `item_mods` VALUES (12493, 357, 4);
-- INSERT INTO `item_mods` VALUES (12493, ???, -1); TODO: Fenrir Perpetuation Cost
INSERT INTO `item_mods` VALUES (12494, 2, -12);
INSERT INTO `item_mods` VALUES (12494, 5, 30);
INSERT INTO `item_mods` VALUES (12495, 2, -6);
INSERT INTO `item_mods` VALUES (12495, 5, 15);
INSERT INTO `item_mods` VALUES (12496, 2, -2);
INSERT INTO `item_mods` VALUES (12496, 5, 5);
INSERT INTO `item_mods` VALUES (12497, 2, -4);
INSERT INTO `item_mods` VALUES (12497, 5, 10);
INSERT INTO `item_mods` VALUES (12498, 1, 3);
INSERT INTO `item_mods` VALUES (12498, 68, 3);
INSERT INTO `item_mods` VALUES (12499, 1, 6);
INSERT INTO `item_mods` VALUES (12499, 68, 4);
INSERT INTO `item_mods` VALUES (12500, 1, 3);
INSERT INTO `item_mods` VALUES (12500, 13, 1);
INSERT INTO `item_mods` VALUES (12501, 1, 5);
INSERT INTO `item_mods` VALUES (12501, 10, 2);
INSERT INTO `item_mods` VALUES (12502, 1, 4);
INSERT INTO `item_mods` VALUES (12502, 68, 5);
INSERT INTO `item_mods` VALUES (12503, 1, 9);
INSERT INTO `item_mods` VALUES (12503, 68, 5);
INSERT INTO `item_mods` VALUES (12504, 1, 10);
INSERT INTO `item_mods` VALUES (12504, 68, 7);
INSERT INTO `item_mods` VALUES (12505, 2, -1);
INSERT INTO `item_mods` VALUES (12505, 5, 3);
INSERT INTO `item_mods` VALUES (12505, 61, 2);
INSERT INTO `item_mods` VALUES (12506, 2, -3);
INSERT INTO `item_mods` VALUES (12506, 5, 9);
INSERT INTO `item_mods` VALUES (12506, 59, 6);
INSERT INTO `item_mods` VALUES (12507, 2, -4);
INSERT INTO `item_mods` VALUES (12507, 5, 12);
INSERT INTO `item_mods` VALUES (12507, 57, 8);
INSERT INTO `item_mods` VALUES (12508, 2, -7);
INSERT INTO `item_mods` VALUES (12508, 5, 21);
INSERT INTO `item_mods` VALUES (12508, 59, 14);
INSERT INTO `item_mods` VALUES (12509, 1, 5);
INSERT INTO `item_mods` VALUES (12509, 12, 1);
INSERT INTO `item_mods` VALUES (12510, 1, 5);
INSERT INTO `item_mods` VALUES (12510, 11, 1);
INSERT INTO `item_mods` VALUES (12511, 1, 24);
INSERT INTO `item_mods` VALUES (12511, 2, 15);
INSERT INTO `item_mods` VALUES (12511, 9, 3);
INSERT INTO `item_mods` VALUES (12511, 12, 1);
INSERT INTO `item_mods` VALUES (12511, 27, 1);
INSERT INTO `item_mods` VALUES (12512, 1, 21);
INSERT INTO `item_mods` VALUES (12512, 2, 16);
INSERT INTO `item_mods` VALUES (12512, 13, 5);
INSERT INTO `item_mods` VALUES (12513, 1, 23);
INSERT INTO `item_mods` VALUES (12513, 5, 20);
INSERT INTO `item_mods` VALUES (12513, 12, 3);
INSERT INTO `item_mods` VALUES (12513, 115, 10);
INSERT INTO `item_mods` VALUES (12513, 170, 10);
INSERT INTO `item_mods` VALUES (12514, 1, 23);
INSERT INTO `item_mods` VALUES (12514, 2, 13);
INSERT INTO `item_mods` VALUES (12514, 12, 5);
INSERT INTO `item_mods` VALUES (12514, 110, 10);
INSERT INTO `item_mods` VALUES (12514, 298, 1);
INSERT INTO `item_mods` VALUES (12515, 1, 24);
INSERT INTO `item_mods` VALUES (12515, 2, 12);
INSERT INTO `item_mods` VALUES (12515, 13, 3);
INSERT INTO `item_mods` VALUES (12515, 27, 2);
INSERT INTO `item_mods` VALUES (12516, 1, 23);
INSERT INTO `item_mods` VALUES (12516, 2, 12);
INSERT INTO `item_mods` VALUES (12516, 8, 4);
INSERT INTO `item_mods` VALUES (12516, 116, 5);
INSERT INTO `item_mods` VALUES (12517, 1, 22);
INSERT INTO `item_mods` VALUES (12517, 2, 15);
INSERT INTO `item_mods` VALUES (12517, 12, 5);
INSERT INTO `item_mods` VALUES (12517, 360, 4);

-- -------------------------------------------------------
-- Hunters beret
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (12518, 1, 21); -- Defence
INSERT INTO `item_mods` VALUES (12518, 2, 13); -- HP
INSERT INTO `item_mods` VALUES (12518, 12, 3); -- INT
INSERT INTO `item_mods` VALUES (12518, 24, 5); -- Ranged attack
INSERT INTO `item_mods` VALUES (12518, 359, 5); -- Rapidshot (proc rate)

INSERT INTO `item_mods` VALUES (12519, 1, 16);
INSERT INTO `item_mods` VALUES (12519, 2, 12);
INSERT INTO `item_mods` VALUES (12519, 13, 5);
INSERT INTO `item_mods` VALUES (12519, 58, 10);
INSERT INTO `item_mods` VALUES (12520, 1, 15);
INSERT INTO `item_mods` VALUES (12520, 5, 20);
INSERT INTO `item_mods` VALUES (12520, 12, 3);
INSERT INTO `item_mods` VALUES (12520, 117, 5);
INSERT INTO `item_mods` VALUES (12521, 54, 6);
INSERT INTO `item_mods` VALUES (12521, 55, 6);
INSERT INTO `item_mods` VALUES (12521, 56, 6);
INSERT INTO `item_mods` VALUES (12521, 57, 6);
INSERT INTO `item_mods` VALUES (12521, 58, 6);
INSERT INTO `item_mods` VALUES (12521, 59, 6);
INSERT INTO `item_mods` VALUES (12521, 60, 6);
INSERT INTO `item_mods` VALUES (12521, 61, 6);
INSERT INTO `item_mods` VALUES (12522, 1, 8);
INSERT INTO `item_mods` VALUES (12523, 1, 50);
INSERT INTO `item_mods` VALUES (12524, 1, 12);
INSERT INTO `item_mods` VALUES (12525, 1, 13);
INSERT INTO `item_mods` VALUES (12526, 2, -2);
INSERT INTO `item_mods` VALUES (12526, 5, 6);
INSERT INTO `item_mods` VALUES (12527, 1, 2);
INSERT INTO `item_mods` VALUES (12528, 1, 6);
INSERT INTO `item_mods` VALUES (12529, 2, -4);
INSERT INTO `item_mods` VALUES (12529, 5, 11);
INSERT INTO `item_mods` VALUES (12530, 1, 6);
INSERT INTO `item_mods` VALUES (12530, 12, 1);
INSERT INTO `item_mods` VALUES (12531, 2, -6);
INSERT INTO `item_mods` VALUES (12531, 5, 16);
INSERT INTO `item_mods` VALUES (12532, 1, 12);
INSERT INTO `item_mods` VALUES (12533, 1, 15);
INSERT INTO `item_mods` VALUES (12534, 1, 5);
INSERT INTO `item_mods` VALUES (12535, 1, 10);
INSERT INTO `item_mods` VALUES (12536, 1, 4);
INSERT INTO `item_mods` VALUES (12536, 12, 1);
INSERT INTO `item_mods` VALUES (12536, 68, 3);
INSERT INTO `item_mods` VALUES (12537, 1, 8);
INSERT INTO `item_mods` VALUES (12538, 1, 13);
INSERT INTO `item_mods` VALUES (12539, 1, 11);
INSERT INTO `item_mods` VALUES (12539, 57, 2);
INSERT INTO `item_mods` VALUES (12539, 58, 2);
INSERT INTO `item_mods` VALUES (12540, 1, 7);
INSERT INTO `item_mods` VALUES (12540, 14, 1);
INSERT INTO `item_mods` VALUES (12540, 68, 4);
INSERT INTO `item_mods` VALUES (12541, 1, 17);
INSERT INTO `item_mods` VALUES (12542, 1, 4);
INSERT INTO `item_mods` VALUES (12543, 1, 2);
INSERT INTO `item_mods` VALUES (12543, 56, 1);
INSERT INTO `item_mods` VALUES (12544, 1, 32);
INSERT INTO `item_mods` VALUES (12545, 1, 39);
INSERT INTO `item_mods` VALUES (12546, 1, 44);
INSERT INTO `item_mods` VALUES (12546, 10, 2);
INSERT INTO `item_mods` VALUES (12546, 61, 5);
INSERT INTO `item_mods` VALUES (12547, 1, 48);
INSERT INTO `item_mods` VALUES (12547, 5, 10);
INSERT INTO `item_mods` VALUES (12547, 10, 3);
INSERT INTO `item_mods` VALUES (12547, 11, -1);
INSERT INTO `item_mods` VALUES (12547, 60, 2);
INSERT INTO `item_mods` VALUES (12547, 61, 2);
INSERT INTO `item_mods` VALUES (12548, 1, 52);
INSERT INTO `item_mods` VALUES (12548, 5, 8);
INSERT INTO `item_mods` VALUES (12548, 10, 4);
INSERT INTO `item_mods` VALUES (12548, 13, 4);
INSERT INTO `item_mods` VALUES (12548, 27, 3);
INSERT INTO `item_mods` VALUES (12549, 1, 65);
INSERT INTO `item_mods` VALUES (12549, 2, 60);
INSERT INTO `item_mods` VALUES (12549, 8, -10);
INSERT INTO `item_mods` VALUES (12549, 9, -10);
INSERT INTO `item_mods` VALUES (12549, 10, 20);
INSERT INTO `item_mods` VALUES (12549, 14, 20);
INSERT INTO `item_mods` VALUES (12550, 1, 40);
INSERT INTO `item_mods` VALUES (12550, 10, 1);
INSERT INTO `item_mods` VALUES (12551, 1, 70);
INSERT INTO `item_mods` VALUES (12552, 1, 21);
INSERT INTO `item_mods` VALUES (12553, 1, 28);
INSERT INTO `item_mods` VALUES (12554, 1, 36);
INSERT INTO `item_mods` VALUES (12555, 1, 45);
INSERT INTO `item_mods` VALUES (12555, 8, 5);
INSERT INTO `item_mods` VALUES (12555, 9, 5);
INSERT INTO `item_mods` VALUES (12555, 11, -5);
INSERT INTO `item_mods` VALUES (12555, 23, 10);
INSERT INTO `item_mods` VALUES (12555, 25, 10);
INSERT INTO `item_mods` VALUES (12555, 68, -20);
INSERT INTO `item_mods` VALUES (12556, 1, 47);
INSERT INTO `item_mods` VALUES (12556, 8, 5);
INSERT INTO `item_mods` VALUES (12556, 9, 5);
INSERT INTO `item_mods` VALUES (12556, 23, 10);
INSERT INTO `item_mods` VALUES (12556, 25, 10);
INSERT INTO `item_mods` VALUES (12556, 68, -10);
INSERT INTO `item_mods` VALUES (12557, 1, 53);
INSERT INTO `item_mods` VALUES (12557, 8, 10);
INSERT INTO `item_mods` VALUES (12557, 9, 10);
INSERT INTO `item_mods` VALUES (12557, 23, 15);
INSERT INTO `item_mods` VALUES (12557, 25, 15);
INSERT INTO `item_mods` VALUES (12557, 68, -10);
INSERT INTO `item_mods` VALUES (12558, 1, 43);
INSERT INTO `item_mods` VALUES (12558, 8, 2);
INSERT INTO `item_mods` VALUES (12558, 9, 2);
INSERT INTO `item_mods` VALUES (12558, 23, 3);
INSERT INTO `item_mods` VALUES (12559, 1, 31);
INSERT INTO `item_mods` VALUES (12559, 9, 1);
INSERT INTO `item_mods` VALUES (12560, 1, 11);
INSERT INTO `item_mods` VALUES (12561, 1, 21);
INSERT INTO `item_mods` VALUES (12562, 1, 52);
INSERT INTO `item_mods` VALUES (12562, 5, 30);
INSERT INTO `item_mods` VALUES (12562, 8, 10);
INSERT INTO `item_mods` VALUES (12562, 9, 10);
INSERT INTO `item_mods` VALUES (12562, 10, 10);
INSERT INTO `item_mods` VALUES (12562, 11, 10);
INSERT INTO `item_mods` VALUES (12562, 12, 10);
INSERT INTO `item_mods` VALUES (12562, 13, 10);
INSERT INTO `item_mods` VALUES (12562, 14, 10);
INSERT INTO `item_mods` VALUES (12562, 60, 50);
INSERT INTO `item_mods` VALUES (12563, 1, 42);
INSERT INTO `item_mods` VALUES (12563, 58, -5);
INSERT INTO `item_mods` VALUES (12563, 59, 5);
INSERT INTO `item_mods` VALUES (12563, 163, -7);
INSERT INTO `item_mods` VALUES (12564, 1, 47);
INSERT INTO `item_mods` VALUES (12564, 2, 12);
INSERT INTO `item_mods` VALUES (12564, 54, 10);
INSERT INTO `item_mods` VALUES (12564, 55, 10);
INSERT INTO `item_mods` VALUES (12564, 56, 10);
INSERT INTO `item_mods` VALUES (12564, 57, 10);
INSERT INTO `item_mods` VALUES (12564, 58, 10);
INSERT INTO `item_mods` VALUES (12564, 59, 10);
INSERT INTO `item_mods` VALUES (12564, 60, 10);
INSERT INTO `item_mods` VALUES (12564, 61, 10);
INSERT INTO `item_mods` VALUES (12564, 162, -9);
INSERT INTO `item_mods` VALUES (12565, 1, 48);
INSERT INTO `item_mods` VALUES (12565, 9, 3);
INSERT INTO `item_mods` VALUES (12565, 11, 3);
INSERT INTO `item_mods` VALUES (12565, 161, -3);
INSERT INTO `item_mods` VALUES (12565, 163, -3);
INSERT INTO `item_mods` VALUES (12566, 1, 23);
INSERT INTO `item_mods` VALUES (12566, 10, 1);
INSERT INTO `item_mods` VALUES (12567, 1, 23);
INSERT INTO `item_mods` VALUES (12567, 54, 3);
INSERT INTO `item_mods` VALUES (12567, 56, 3);
INSERT INTO `item_mods` VALUES (12567, 59, 3);
INSERT INTO `item_mods` VALUES (12568, 1, 7);
INSERT INTO `item_mods` VALUES (12569, 1, 15);
INSERT INTO `item_mods` VALUES (12570, 1, 22);
INSERT INTO `item_mods` VALUES (12571, 1, 28);
INSERT INTO `item_mods` VALUES (12572, 1, 35);
INSERT INTO `item_mods` VALUES (12572, 54, 3);
INSERT INTO `item_mods` VALUES (12572, 59, -1);
INSERT INTO `item_mods` VALUES (12573, 1, 50);
INSERT INTO `item_mods` VALUES (12573, 2, 40);
INSERT INTO `item_mods` VALUES (12573, 25, 2);
INSERT INTO `item_mods` VALUES (12573, 169, -3);
INSERT INTO `item_mods` VALUES (12573, 370, 1);
INSERT INTO `item_mods` VALUES (12574, 1, 41);
INSERT INTO `item_mods` VALUES (12574, 23, 5);
INSERT INTO `item_mods` VALUES (12574, 54, -5);
INSERT INTO `item_mods` VALUES (12574, 55, 5);
INSERT INTO `item_mods` VALUES (12575, 1, 42);
INSERT INTO `item_mods` VALUES (12575, 3, -1);
INSERT INTO `item_mods` VALUES (12575, 25, 3);
INSERT INTO `item_mods` VALUES (12575, 68, 2);
INSERT INTO `item_mods` VALUES (12576, 1, 4);
INSERT INTO `item_mods` VALUES (12577, 1, 10);
INSERT INTO `item_mods` VALUES (12578, 1, 24);
INSERT INTO `item_mods` VALUES (12579, 1, 40);
INSERT INTO `item_mods` VALUES (12579, 2, 15);
INSERT INTO `item_mods` VALUES (12579, 25, 10);
INSERT INTO `item_mods` VALUES (12579, 55, -20);
INSERT INTO `item_mods` VALUES (12579, 59, 15);
INSERT INTO `item_mods` VALUES (12579, 61, 15);
INSERT INTO `item_mods` VALUES (12579, 68, 10);
INSERT INTO `item_mods` VALUES (12580, 1, 39);
INSERT INTO `item_mods` VALUES (12580, 60, 2);
INSERT INTO `item_mods` VALUES (12580, 61, 2);
INSERT INTO `item_mods` VALUES (12580, 161, -3);
INSERT INTO `item_mods` VALUES (12581, 1, 41);
INSERT INTO `item_mods` VALUES (12581, 4, 15);
INSERT INTO `item_mods` VALUES (12581, 10, 2);
INSERT INTO `item_mods` VALUES (12581, 11, 1);
INSERT INTO `item_mods` VALUES (12581, 163, -7);
INSERT INTO `item_mods` VALUES (12582, 1, 14);
INSERT INTO `item_mods` VALUES (12583, 1, 17);
INSERT INTO `item_mods` VALUES (12584, 1, 8);
INSERT INTO `item_mods` VALUES (12585, 1, 14);
INSERT INTO `item_mods` VALUES (12586, 1, 20);
INSERT INTO `item_mods` VALUES (12586, 57, 1);
INSERT INTO `item_mods` VALUES (12586, 58, 1);
INSERT INTO `item_mods` VALUES (12587, 1, 31);
INSERT INTO `item_mods` VALUES (12588, 1, 33);
INSERT INTO `item_mods` VALUES (12589, 1, 46);
INSERT INTO `item_mods` VALUES (12589, 54, 10);
INSERT INTO `item_mods` VALUES (12589, 241, 2);
INSERT INTO `item_mods` VALUES (12590, 1, 12);
INSERT INTO `item_mods` VALUES (12590, 8, 1);
INSERT INTO `item_mods` VALUES (12591, 1, 11);
INSERT INTO `item_mods` VALUES (12592, 1, 10);
INSERT INTO `item_mods` VALUES (12593, 1, 17);
INSERT INTO `item_mods` VALUES (12594, 1, 23);
INSERT INTO `item_mods` VALUES (12595, 1, 31);
INSERT INTO `item_mods` VALUES (12596, 1, 36);
INSERT INTO `item_mods` VALUES (12596, 9, 1);

-- ------------------------------------------
-- War Aketon
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (12597, 1, 38);
INSERT INTO `item_mods` VALUES (12597, 2, 25);
INSERT INTO `item_mods` VALUES (12597, 9, 4);
INSERT INTO `item_mods` VALUES (12597, 499, 1); -- blaze spikes
INSERT INTO `item_mods` VALUES (12597, 500, 25); -- spikes dmg
INSERT INTO `item_mods` VALUES (12597, 501, 25); -- spikes proc rate

INSERT INTO `item_mods` VALUES (12598, 1, 20);
INSERT INTO `item_mods` VALUES (12598, 9, 1);
INSERT INTO `item_mods` VALUES (12598, 11, 1);
INSERT INTO `item_mods` VALUES (12599, 1, 9);
INSERT INTO `item_mods` VALUES (12600, 1, 3);
INSERT INTO `item_mods` VALUES (12601, 1, 10);
INSERT INTO `item_mods` VALUES (12602, 1, 18);
INSERT INTO `item_mods` VALUES (12603, 1, 24);
INSERT INTO `item_mods` VALUES (12604, 1, 33);
INSERT INTO `item_mods` VALUES (12605, 1, 40);
INSERT INTO `item_mods` VALUES (12605, 5, 17);
INSERT INTO `item_mods` VALUES (12605, 369, 1);
INSERT INTO `item_mods` VALUES (12605, 374, 10);
INSERT INTO `item_mods` VALUES (12606, 1, 31);
INSERT INTO `item_mods` VALUES (12606, 12, 1);
INSERT INTO `item_mods` VALUES (12606, 13, 1);
INSERT INTO `item_mods` VALUES (12606, 14, 1);
INSERT INTO `item_mods` VALUES (12606, 60, 3);
INSERT INTO `item_mods` VALUES (12606, 61, 3);
INSERT INTO `item_mods` VALUES (12607, 1, 5);
INSERT INTO `item_mods` VALUES (12608, 1, 9);
INSERT INTO `item_mods` VALUES (12609, 1, 18);
INSERT INTO `item_mods` VALUES (12609, 12, 1);
INSERT INTO `item_mods` VALUES (12609, 61, 2);
INSERT INTO `item_mods` VALUES (12610, 1, 27);
INSERT INTO `item_mods` VALUES (12611, 1, 39);
INSERT INTO `item_mods` VALUES (12611, 13, 2);
INSERT INTO `item_mods` VALUES (12611, 60, 4);
INSERT INTO `item_mods` VALUES (12612, 1, 44);
INSERT INTO `item_mods` VALUES (12612, 2, 12);
INSERT INTO `item_mods` VALUES (12612, 60, 9);
INSERT INTO `item_mods` VALUES (12612, 61, -9);
INSERT INTO `item_mods` VALUES (12614, 1, 32);
INSERT INTO `item_mods` VALUES (12614, 8, 2);
INSERT INTO `item_mods` VALUES (12614, 12, 2);
INSERT INTO `item_mods` VALUES (12614, 13, -2);
INSERT INTO `item_mods` VALUES (12615, 1, 4);
INSERT INTO `item_mods` VALUES (12616, 1, 10);
INSERT INTO `item_mods` VALUES (12617, 1, 43);
INSERT INTO `item_mods` VALUES (12617, 8, -2);
INSERT INTO `item_mods` VALUES (12617, 11, 2);
INSERT INTO `item_mods` VALUES (12617, 106, 10);
INSERT INTO `item_mods` VALUES (12617, 370, 1);
INSERT INTO `item_mods` VALUES (12618, 1, 43);
INSERT INTO `item_mods` VALUES (12618, 12, 3);
INSERT INTO `item_mods` VALUES (12618, 27, 4);
INSERT INTO `item_mods` VALUES (12618, 110, 3);
INSERT INTO `item_mods` VALUES (12618, 168, 10);
INSERT INTO `item_mods` VALUES (12620, 1, 65);
INSERT INTO `item_mods` VALUES (12620, 8, 16);
INSERT INTO `item_mods` VALUES (12620, 23, 32);
INSERT INTO `item_mods` VALUES (12620, 161, -6);
INSERT INTO `item_mods` VALUES (12620, 163, 6);
INSERT INTO `item_mods` VALUES (12621, 1, 45);
INSERT INTO `item_mods` VALUES (12621, 54, 9);
INSERT INTO `item_mods` VALUES (12621, 241, 2);
INSERT INTO `item_mods` VALUES (12622, 1, 53);
INSERT INTO `item_mods` VALUES (12622, 25, 16);
INSERT INTO `item_mods` VALUES (12622, 165, 4);
INSERT INTO `item_mods` VALUES (12622, 288, 5);
INSERT INTO `item_mods` VALUES (12623, 1, 39);
INSERT INTO `item_mods` VALUES (12623, 27, 4);
INSERT INTO `item_mods` VALUES (12623, 28, 10);
INSERT INTO `item_mods` VALUES (12623, 369, 1);
-- INSERT INTO `item_mods` VALUES (12623, 0, 5); -- MCRIT 5%
INSERT INTO `item_mods` VALUES (12624, 1, 15);
INSERT INTO `item_mods` VALUES (12625, 1, 24);
INSERT INTO `item_mods` VALUES (12626, 1, 11);
INSERT INTO `item_mods` VALUES (12627, 1, 19);
INSERT INTO `item_mods` VALUES (12628, 1, 37);
INSERT INTO `item_mods` VALUES (12628, 9, 2);
INSERT INTO `item_mods` VALUES (12629, 1, 10);
INSERT INTO `item_mods` VALUES (12629, 54, 5);
INSERT INTO `item_mods` VALUES (12630, 1, 10);
INSERT INTO `item_mods` VALUES (12630, 55, 5);
INSERT INTO `item_mods` VALUES (12631, 1, 2);
INSERT INTO `item_mods` VALUES (12632, 1, 2);
INSERT INTO `item_mods` VALUES (12633, 1, 2);
INSERT INTO `item_mods` VALUES (12634, 1, 2);
INSERT INTO `item_mods` VALUES (12635, 1, 2);
INSERT INTO `item_mods` VALUES (12636, 1, 2);
INSERT INTO `item_mods` VALUES (12637, 1, 2);
INSERT INTO `item_mods` VALUES (12638, 1, 47);
INSERT INTO `item_mods` VALUES (12638, 2, 20);
INSERT INTO `item_mods` VALUES (12638, 10, 5);
INSERT INTO `item_mods` VALUES (12638, 27, 8);
INSERT INTO `item_mods` VALUES (12638, 54, 10);
INSERT INTO `item_mods` VALUES (12639, 1, 41);
INSERT INTO `item_mods` VALUES (12639, 2, 20);
INSERT INTO `item_mods` VALUES (12639, 10, 3);
INSERT INTO `item_mods` VALUES (12639, 25, 5);
INSERT INTO `item_mods` VALUES (12640, 1, 40);
INSERT INTO `item_mods` VALUES (12640, 5, 15);
INSERT INTO `item_mods` VALUES (12640, 27, -4);
INSERT INTO `item_mods` VALUES (12640, 56, 10);
INSERT INTO `item_mods` VALUES (12640, 114, 10);
INSERT INTO `item_mods` VALUES (12641, 1, 38);
INSERT INTO `item_mods` VALUES (12641, 5, 16);
INSERT INTO `item_mods` VALUES (12641, 10, 5);
INSERT INTO `item_mods` VALUES (12641, 27, -3);
INSERT INTO `item_mods` VALUES (12641, 114, 10);
INSERT INTO `item_mods` VALUES (12642, 1, 44);
INSERT INTO `item_mods` VALUES (12642, 5, 14);
INSERT INTO `item_mods` VALUES (12642, 14, 5);
INSERT INTO `item_mods` VALUES (12642, 114, 15);
INSERT INTO `item_mods` VALUES (12642, 168, 10);
INSERT INTO `item_mods` VALUES (12643, 1, 44);
INSERT INTO `item_mods` VALUES (12643, 2, 20);
INSERT INTO `item_mods` VALUES (12643, 8, 3);
INSERT INTO `item_mods` VALUES (12643, 57, 10);
INSERT INTO `item_mods` VALUES (12644, 1, 47);
INSERT INTO `item_mods` VALUES (12644, 2, 20);
INSERT INTO `item_mods` VALUES (12644, 10, 4);
INSERT INTO `item_mods` VALUES (12644, 27, 2);
INSERT INTO `item_mods` VALUES (12644, 111, 5);
INSERT INTO `item_mods` VALUES (12645, 1, 46);
INSERT INTO `item_mods` VALUES (12645, 2, 20);
INSERT INTO `item_mods` VALUES (12645, 10, 3);
INSERT INTO `item_mods` VALUES (12645, 23, 5);
INSERT INTO `item_mods` VALUES (12645, 114, 5);
INSERT INTO `item_mods` VALUES (12646, 1, 44);
INSERT INTO `item_mods` VALUES (12646, 2, 20);
INSERT INTO `item_mods` VALUES (12646, 10, 3);
INSERT INTO `item_mods` VALUES (12646, 360, 5);
INSERT INTO `item_mods` VALUES (12647, 1, 38);
INSERT INTO `item_mods` VALUES (12647, 2, 13);
INSERT INTO `item_mods` VALUES (12647, 10, 3);
INSERT INTO `item_mods` VALUES (12647, 27, -1);
INSERT INTO `item_mods` VALUES (12647, 120, 3);
INSERT INTO `item_mods` VALUES (12648, 1, 41);
INSERT INTO `item_mods` VALUES (12648, 2, 20);
INSERT INTO `item_mods` VALUES (12648, 10, 3);
INSERT INTO `item_mods` VALUES (12648, 26, 10);
INSERT INTO `item_mods` VALUES (12649, 1, 38);
INSERT INTO `item_mods` VALUES (12649, 2, 15);
INSERT INTO `item_mods` VALUES (12649, 10, 4);
INSERT INTO `item_mods` VALUES (12649, 55, 10);
INSERT INTO `item_mods` VALUES (12650, 1, 35);
INSERT INTO `item_mods` VALUES (12650, 5, 15);
INSERT INTO `item_mods` VALUES (12650, 13, 3);
INSERT INTO `item_mods` VALUES (12651, 1, 40);
INSERT INTO `item_mods` VALUES (12651, 13, 3);
INSERT INTO `item_mods` VALUES (12651, 60, 5);
INSERT INTO `item_mods` VALUES (12652, 1, 34);
INSERT INTO `item_mods` VALUES (12653, 1, 15);
INSERT INTO `item_mods` VALUES (12653, 10, 1);
INSERT INTO `item_mods` VALUES (12654, 1, 18);
INSERT INTO `item_mods` VALUES (12654, 2, 32);
INSERT INTO `item_mods` VALUES (12654, 10, 3);
INSERT INTO `item_mods` VALUES (12654, 12, -1);
INSERT INTO `item_mods` VALUES (12654, 14, 1);
INSERT INTO `item_mods` VALUES (12655, 1, 18);
INSERT INTO `item_mods` VALUES (12655, 2, 32);
INSERT INTO `item_mods` VALUES (12655, 10, 3);
INSERT INTO `item_mods` VALUES (12655, 12, -1);
INSERT INTO `item_mods` VALUES (12655, 14, 1);
INSERT INTO `item_mods` VALUES (12656, 1, 18);
INSERT INTO `item_mods` VALUES (12656, 2, 24);
INSERT INTO `item_mods` VALUES (12656, 5, 4);
INSERT INTO `item_mods` VALUES (12656, 9, 1);
INSERT INTO `item_mods` VALUES (12656, 12, 1);
INSERT INTO `item_mods` VALUES (12657, 1, 18);
INSERT INTO `item_mods` VALUES (12657, 2, 24);
INSERT INTO `item_mods` VALUES (12657, 5, 4);
INSERT INTO `item_mods` VALUES (12657, 9, 1);
INSERT INTO `item_mods` VALUES (12657, 12, 1);
INSERT INTO `item_mods` VALUES (12658, 1, 18);
INSERT INTO `item_mods` VALUES (12658, 2, 36);
INSERT INTO `item_mods` VALUES (12658, 8, 1);
INSERT INTO `item_mods` VALUES (12658, 10, 2);
INSERT INTO `item_mods` VALUES (12658, 13, 1);
INSERT INTO `item_mods` VALUES (12659, 1, 18);
INSERT INTO `item_mods` VALUES (12659, 2, 32);
INSERT INTO `item_mods` VALUES (12659, 8, 1);
INSERT INTO `item_mods` VALUES (12659, 14, 1);
INSERT INTO `item_mods` VALUES (12660, 1, 18);
INSERT INTO `item_mods` VALUES (12660, 5, 32);
INSERT INTO `item_mods` VALUES (12660, 12, 1);
INSERT INTO `item_mods` VALUES (12660, 14, 1);
INSERT INTO `item_mods` VALUES (12661, 1, 12);
INSERT INTO `item_mods` VALUES (12662, 1, 22);
INSERT INTO `item_mods` VALUES (12663, 1, 25);
INSERT INTO `item_mods` VALUES (12664, 1, 11);
INSERT INTO `item_mods` VALUES (12665, 1, 22);
INSERT INTO `item_mods` VALUES (12666, 1, 29);
INSERT INTO `item_mods` VALUES (12667, 1, 37);
INSERT INTO `item_mods` VALUES (12668, 1, 9);
INSERT INTO `item_mods` VALUES (12668, 9, 1);
INSERT INTO `item_mods` VALUES (12669, 1, 18);
INSERT INTO `item_mods` VALUES (12670, 1, 28);
INSERT INTO `item_mods` VALUES (12671, 1, 21);
INSERT INTO `item_mods` VALUES (12671, 57, 2);
INSERT INTO `item_mods` VALUES (12671, 58, 2);
INSERT INTO `item_mods` VALUES (12672, 1, 11);
INSERT INTO `item_mods` VALUES (12673, 1, 13);
INSERT INTO `item_mods` VALUES (12674, 1, 15);
INSERT INTO `item_mods` VALUES (12674, 10, 1);
INSERT INTO `item_mods` VALUES (12674, 61, 3);
INSERT INTO `item_mods` VALUES (12675, 1, 17);
INSERT INTO `item_mods` VALUES (12675, 5, 7);
INSERT INTO `item_mods` VALUES (12675, 8, 3);
INSERT INTO `item_mods` VALUES (12675, 9, -1);
INSERT INTO `item_mods` VALUES (12675, 60, 2);
INSERT INTO `item_mods` VALUES (12675, 61, 2);
INSERT INTO `item_mods` VALUES (12676, 1, 20);
INSERT INTO `item_mods` VALUES (12676, 5, 10);
INSERT INTO `item_mods` VALUES (12676, 10, 3);
INSERT INTO `item_mods` VALUES (12676, 11, -1);
INSERT INTO `item_mods` VALUES (12676, 12, -1);
INSERT INTO `item_mods` VALUES (12676, 27, 2);
INSERT INTO `item_mods` VALUES (12677, 1, 30);
INSERT INTO `item_mods` VALUES (12677, 2, 20);
INSERT INTO `item_mods` VALUES (12677, 8, -5);
INSERT INTO `item_mods` VALUES (12677, 9, -5);
INSERT INTO `item_mods` VALUES (12677, 10, 10);
INSERT INTO `item_mods` VALUES (12677, 14, 10);
INSERT INTO `item_mods` VALUES (12677, 240, 2);
INSERT INTO `item_mods` VALUES (12678, 1, 12);
INSERT INTO `item_mods` VALUES (12678, 26, 5);
INSERT INTO `item_mods` VALUES (12679, 1, 50);
INSERT INTO `item_mods` VALUES (12680, 1, 7);
INSERT INTO `item_mods` VALUES (12681, 1, 9);
INSERT INTO `item_mods` VALUES (12682, 1, 12);
INSERT INTO `item_mods` VALUES (12683, 1, 16);
INSERT INTO `item_mods` VALUES (12683, 60, 2);
INSERT INTO `item_mods` VALUES (12684, 1, 15);
INSERT INTO `item_mods` VALUES (12684, 23, 3);
INSERT INTO `item_mods` VALUES (12684, 25, 3);
INSERT INTO `item_mods` VALUES (12684, 68, -2);
INSERT INTO `item_mods` VALUES (12685, 1, 22);
INSERT INTO `item_mods` VALUES (12685, 12, -10);
INSERT INTO `item_mods` VALUES (12685, 23, 10);
INSERT INTO `item_mods` VALUES (12685, 25, 4);
INSERT INTO `item_mods` VALUES (12685, 68, -4);
INSERT INTO `item_mods` VALUES (12686, 1, 13);
INSERT INTO `item_mods` VALUES (12686, 25, 3);
INSERT INTO `item_mods` VALUES (12687, 1, 8);
INSERT INTO `item_mods` VALUES (12687, 25, 2);
INSERT INTO `item_mods` VALUES (12688, 1, 3);
INSERT INTO `item_mods` VALUES (12689, 1, 7);
INSERT INTO `item_mods` VALUES (12690, 1, 26);
INSERT INTO `item_mods` VALUES (12690, 2, 50);
INSERT INTO `item_mods` VALUES (12690, 11, 15);
INSERT INTO `item_mods` VALUES (12690, 26, 10);
INSERT INTO `item_mods` VALUES (12691, 1, 14);
INSERT INTO `item_mods` VALUES (12691, 58, -3);
INSERT INTO `item_mods` VALUES (12691, 59, 3);
INSERT INTO `item_mods` VALUES (12691, 163, -2);
INSERT INTO `item_mods` VALUES (12692, 1, 15);
INSERT INTO `item_mods` VALUES (12692, 2, 8);
INSERT INTO `item_mods` VALUES (12692, 58, 10);
INSERT INTO `item_mods` VALUES (12692, 59, 10);
INSERT INTO `item_mods` VALUES (12692, 162, -4);
INSERT INTO `item_mods` VALUES (12693, 1, 19);
INSERT INTO `item_mods` VALUES (12693, 10, 3);
INSERT INTO `item_mods` VALUES (12693, 23, 3);
INSERT INTO `item_mods` VALUES (12693, 163, -5);
INSERT INTO `item_mods` VALUES (12694, 1, 8);
INSERT INTO `item_mods` VALUES (12694, 9, 1);
INSERT INTO `item_mods` VALUES (12695, 1, 2);
INSERT INTO `item_mods` VALUES (12696, 1, 2);
INSERT INTO `item_mods` VALUES (12697, 1, 5);
INSERT INTO `item_mods` VALUES (12698, 1, 7);
INSERT INTO `item_mods` VALUES (12699, 1, 9);
INSERT INTO `item_mods` VALUES (12700, 1, 12);
INSERT INTO `item_mods` VALUES (12700, 54, 2);
INSERT INTO `item_mods` VALUES (12700, 59, -1);
INSERT INTO `item_mods` VALUES (12701, 1, 24);
INSERT INTO `item_mods` VALUES (12701, 2, 20);
INSERT INTO `item_mods` VALUES (12701, 23, 5);
INSERT INTO `item_mods` VALUES (12701, 169, -3);
INSERT INTO `item_mods` VALUES (12701, 384, 30);
INSERT INTO `item_mods` VALUES (12702, 1, 14);
INSERT INTO `item_mods` VALUES (12702, 23, 3);
INSERT INTO `item_mods` VALUES (12702, 54, -3);
INSERT INTO `item_mods` VALUES (12702, 55, 3);
INSERT INTO `item_mods` VALUES (12703, 1, 15);
INSERT INTO `item_mods` VALUES (12703, 3, -1);
INSERT INTO `item_mods` VALUES (12703, 9, 2);
INSERT INTO `item_mods` VALUES (12703, 10, -1);
INSERT INTO `item_mods` VALUES (12703, 68, 2);
INSERT INTO `item_mods` VALUES (12704, 1, 1);
INSERT INTO `item_mods` VALUES (12705, 1, 3);
INSERT INTO `item_mods` VALUES (12706, 1, 8);
INSERT INTO `item_mods` VALUES (12707, 1, 13);
INSERT INTO `item_mods` VALUES (12707, 2, 3);
INSERT INTO `item_mods` VALUES (12707, 55, -2);
INSERT INTO `item_mods` VALUES (12707, 59, 5);
INSERT INTO `item_mods` VALUES (12707, 61, 5);
INSERT INTO `item_mods` VALUES (12708, 1, 14);
INSERT INTO `item_mods` VALUES (12708, 60, 1);
INSERT INTO `item_mods` VALUES (12708, 61, 1);
INSERT INTO `item_mods` VALUES (12708, 161, -1);
INSERT INTO `item_mods` VALUES (12709, 1, 14);
INSERT INTO `item_mods` VALUES (12709, 4, 15);
INSERT INTO `item_mods` VALUES (12709, 8, 1);
INSERT INTO `item_mods` VALUES (12709, 9, 2);
INSERT INTO `item_mods` VALUES (12709, 163, -2);
INSERT INTO `item_mods` VALUES (12710, 1, 4);
INSERT INTO `item_mods` VALUES (12711, 1, 6);
INSERT INTO `item_mods` VALUES (12712, 1, 2);
INSERT INTO `item_mods` VALUES (12713, 1, 5);
INSERT INTO `item_mods` VALUES (12714, 1, 7);
INSERT INTO `item_mods` VALUES (12714, 57, 1);
INSERT INTO `item_mods` VALUES (12714, 58, 1);
INSERT INTO `item_mods` VALUES (12715, 1, 10);
INSERT INTO `item_mods` VALUES (12716, 1, 11);
INSERT INTO `item_mods` VALUES (12717, 1, 13);
INSERT INTO `item_mods` VALUES (12717, 54, 6);
INSERT INTO `item_mods` VALUES (12717, 244, 3);
INSERT INTO `item_mods` VALUES (12718, 1, 9);
INSERT INTO `item_mods` VALUES (12719, 1, 5);
INSERT INTO `item_mods` VALUES (12720, 1, 3);
INSERT INTO `item_mods` VALUES (12721, 1, 6);
INSERT INTO `item_mods` VALUES (12722, 1, 8);
INSERT INTO `item_mods` VALUES (12723, 1, 10);
INSERT INTO `item_mods` VALUES (12724, 1, 13);
INSERT INTO `item_mods` VALUES (12724, 25, 1);
INSERT INTO `item_mods` VALUES (12725, 1, 15);
INSERT INTO `item_mods` VALUES (12725, 2, 13);
INSERT INTO `item_mods` VALUES (12725, 10, -2);
INSERT INTO `item_mods` VALUES (12725, 25, 5);
INSERT INTO `item_mods` VALUES (12725, 68, 5);
INSERT INTO `item_mods` VALUES (12726, 1, 6);
INSERT INTO `item_mods` VALUES (12726, 11, 1);
INSERT INTO `item_mods` VALUES (12727, 1, 10);
INSERT INTO `item_mods` VALUES (12727, 10, 1);
INSERT INTO `item_mods` VALUES (12727, 12, 1);
INSERT INTO `item_mods` VALUES (12728, 1, 1);
INSERT INTO `item_mods` VALUES (12729, 1, 3);
INSERT INTO `item_mods` VALUES (12730, 1, 6);
INSERT INTO `item_mods` VALUES (12731, 1, 8);
INSERT INTO `item_mods` VALUES (12732, 1, 11);
INSERT INTO `item_mods` VALUES (12733, 1, 16);
INSERT INTO `item_mods` VALUES (12733, 5, 12);
INSERT INTO `item_mods` VALUES (12733, 9, 2);
INSERT INTO `item_mods` VALUES (12733, 14, 1);
INSERT INTO `item_mods` VALUES (12734, 1, 10);
INSERT INTO `item_mods` VALUES (12734, 68, 5);
INSERT INTO `item_mods` VALUES (12736, 1, 2);
INSERT INTO `item_mods` VALUES (12737, 1, 4);
INSERT INTO `item_mods` VALUES (12738, 1, 7);
INSERT INTO `item_mods` VALUES (12739, 1, 10);
INSERT INTO `item_mods` VALUES (12740, 1, 11);
INSERT INTO `item_mods` VALUES (12740, 2, 5);
INSERT INTO `item_mods` VALUES (12740, 60, 3);
INSERT INTO `item_mods` VALUES (12740, 61, -3);
INSERT INTO `item_mods` VALUES (12743, 1, 8);
INSERT INTO `item_mods` VALUES (12743, 23, 5);
INSERT INTO `item_mods` VALUES (12744, 1, 2);
INSERT INTO `item_mods` VALUES (12745, 1, 23);
INSERT INTO `item_mods` VALUES (12745, 8, 4);
INSERT INTO `item_mods` VALUES (12745, 9, 2);
INSERT INTO `item_mods` VALUES (12745, 23, 10);
INSERT INTO `item_mods` VALUES (12745, 384, 20);
INSERT INTO `item_mods` VALUES (12746, 1, 21);
INSERT INTO `item_mods` VALUES (12746, 8, 4);
INSERT INTO `item_mods` VALUES (12746, 11, 4);
INSERT INTO `item_mods` VALUES (12746, 384, 20);
INSERT INTO `item_mods` VALUES (12747, 1, 19);
INSERT INTO `item_mods` VALUES (12747, 2, 12);
INSERT INTO `item_mods` VALUES (12747, 13, 3);
INSERT INTO `item_mods` VALUES (12747, 14, 3);
INSERT INTO `item_mods` VALUES (12747, 27, -2);
INSERT INTO `item_mods` VALUES (12747, 30, 5);
INSERT INTO `item_mods` VALUES (12748, 1, 16);
INSERT INTO `item_mods` VALUES (12748, 298, 3);
INSERT INTO `item_mods` VALUES (12749, 1, 4);
INSERT INTO `item_mods` VALUES (12749, 68, 5);
INSERT INTO `item_mods` VALUES (12750, 1, 8);
INSERT INTO `item_mods` VALUES (12750, 5, 8);
INSERT INTO `item_mods` VALUES (12751, 1, 12);
INSERT INTO `item_mods` VALUES (12751, 54, 5);
INSERT INTO `item_mods` VALUES (12751, 244, 2);
INSERT INTO `item_mods` VALUES (12752, 1, 3);
INSERT INTO `item_mods` VALUES (12752, 23, 3);
INSERT INTO `item_mods` VALUES (12753, 1, 3);
INSERT INTO `item_mods` VALUES (12753, 23, 3);
INSERT INTO `item_mods` VALUES (12754, 1, 1);
INSERT INTO `item_mods` VALUES (12755, 1, 1);
INSERT INTO `item_mods` VALUES (12756, 1, 1);
INSERT INTO `item_mods` VALUES (12757, 1, 1);
INSERT INTO `item_mods` VALUES (12758, 1, 1);
INSERT INTO `item_mods` VALUES (12759, 1, 1);
INSERT INTO `item_mods` VALUES (12760, 1, 1);
INSERT INTO `item_mods` VALUES (12761, 1, 6);
INSERT INTO `item_mods` VALUES (12761, 2, 12);
INSERT INTO `item_mods` VALUES (12761, 5, 4);
INSERT INTO `item_mods` VALUES (12761, 8, 3);
INSERT INTO `item_mods` VALUES (12761, 9, 3);
INSERT INTO `item_mods` VALUES (12761, 10, -1);
INSERT INTO `item_mods` VALUES (12761, 11, -1);
INSERT INTO `item_mods` VALUES (12762, 1, 6);
INSERT INTO `item_mods` VALUES (12762, 2, 12);
INSERT INTO `item_mods` VALUES (12762, 5, 4);
INSERT INTO `item_mods` VALUES (12762, 8, 3);
INSERT INTO `item_mods` VALUES (12762, 9, 3);
INSERT INTO `item_mods` VALUES (12762, 10, -1);
INSERT INTO `item_mods` VALUES (12762, 11, -1);
INSERT INTO `item_mods` VALUES (12763, 1, 6);
INSERT INTO `item_mods` VALUES (12763, 5, 24);
INSERT INTO `item_mods` VALUES (12763, 9, 2);
INSERT INTO `item_mods` VALUES (12763, 12, 1);
INSERT INTO `item_mods` VALUES (12764, 1, 6);
INSERT INTO `item_mods` VALUES (12764, 5, 24);
INSERT INTO `item_mods` VALUES (12764, 9, 2);
INSERT INTO `item_mods` VALUES (12764, 12, 1);
INSERT INTO `item_mods` VALUES (12765, 1, 6);
INSERT INTO `item_mods` VALUES (12765, 2, 12);
INSERT INTO `item_mods` VALUES (12765, 8, 3);
INSERT INTO `item_mods` VALUES (12766, 1, 6);
INSERT INTO `item_mods` VALUES (12766, 5, 16);
INSERT INTO `item_mods` VALUES (12766, 10, 4);
INSERT INTO `item_mods` VALUES (12766, 13, 2);
INSERT INTO `item_mods` VALUES (12767, 1, 6);
INSERT INTO `item_mods` VALUES (12767, 5, 32);
INSERT INTO `item_mods` VALUES (12767, 12, 2);
INSERT INTO `item_mods` VALUES (12768, 1, 4);
INSERT INTO `item_mods` VALUES (12769, 1, 8);
INSERT INTO `item_mods` VALUES (12770, 1, 4);
INSERT INTO `item_mods` VALUES (12771, 1, 8);
INSERT INTO `item_mods` VALUES (12772, 1, 10);
INSERT INTO `item_mods` VALUES (12773, 1, 4);
INSERT INTO `item_mods` VALUES (12774, 1, 3);
INSERT INTO `item_mods` VALUES (12775, 1, 3);
INSERT INTO `item_mods` VALUES (12776, 1, 7);
INSERT INTO `item_mods` VALUES (12777, 1, 6);
INSERT INTO `item_mods` VALUES (12778, 1, 4);
INSERT INTO `item_mods` VALUES (12778, 8, 1);
INSERT INTO `item_mods` VALUES (12778, 54, 3);
INSERT INTO `item_mods` VALUES (12779, 1, 9);
INSERT INTO `item_mods` VALUES (12780, 1, 8);
INSERT INTO `item_mods` VALUES (12781, 1, 8);
INSERT INTO `item_mods` VALUES (12781, 57, 2);
INSERT INTO `item_mods` VALUES (12781, 58, 2);
INSERT INTO `item_mods` VALUES (12782, 1, 7);
INSERT INTO `item_mods` VALUES (12782, 11, 1);
INSERT INTO `item_mods` VALUES (12782, 56, 3);
INSERT INTO `item_mods` VALUES (12783, 1, 11);
INSERT INTO `item_mods` VALUES (12784, 1, 3);
INSERT INTO `item_mods` VALUES (12785, 1, 6);
INSERT INTO `item_mods` VALUES (12786, 1, 8);
INSERT INTO `item_mods` VALUES (12787, 1, 10);
INSERT INTO `item_mods` VALUES (12788, 1, 5);
INSERT INTO `item_mods` VALUES (12788, 54, -3);
INSERT INTO `item_mods` VALUES (12788, 68, 1);
INSERT INTO `item_mods` VALUES (12789, 1, 7);
INSERT INTO `item_mods` VALUES (12789, 55, -3);
INSERT INTO `item_mods` VALUES (12789, 68, 1);
INSERT INTO `item_mods` VALUES (12790, 1, 11);
INSERT INTO `item_mods` VALUES (12790, 58, -3);
INSERT INTO `item_mods` VALUES (12790, 68, 1);
INSERT INTO `item_mods` VALUES (12791, 1, 12);
INSERT INTO `item_mods` VALUES (12792, 1, 13);
INSERT INTO `item_mods` VALUES (12793, 1, 9);
INSERT INTO `item_mods` VALUES (12793, 11, 2);
INSERT INTO `item_mods` VALUES (12793, 56, 5);
INSERT INTO `item_mods` VALUES (12794, 1, 11);
INSERT INTO `item_mods` VALUES (12794, 12, 1);
INSERT INTO `item_mods` VALUES (12795, 1, 13);
INSERT INTO `item_mods` VALUES (12795, 54, 3);
INSERT INTO `item_mods` VALUES (12795, 59, -1);
INSERT INTO `item_mods` VALUES (12796, 1, 2);
INSERT INTO `item_mods` VALUES (12796, 54, 1);
INSERT INTO `item_mods` VALUES (12796, 55, 1);
INSERT INTO `item_mods` VALUES (12797, 1, 5);
INSERT INTO `item_mods` VALUES (12797, 68, -3);
INSERT INTO `item_mods` VALUES (12798, 1, 3);
INSERT INTO `item_mods` VALUES (12798, 5, 5);
INSERT INTO `item_mods` VALUES (12798, 12, -2);
INSERT INTO `item_mods` VALUES (12798, 13, 3);
INSERT INTO `item_mods` VALUES (12799, 1, 4);
INSERT INTO `item_mods` VALUES (12799, 25, 3);
INSERT INTO `item_mods` VALUES (12799, 68, 3);
INSERT INTO `item_mods` VALUES (12800, 1, 23);
INSERT INTO `item_mods` VALUES (12801, 1, 28);
INSERT INTO `item_mods` VALUES (12802, 1, 31);
INSERT INTO `item_mods` VALUES (12802, 10, 2);
INSERT INTO `item_mods` VALUES (12802, 61, 4);
INSERT INTO `item_mods` VALUES (12803, 1, 35);
INSERT INTO `item_mods` VALUES (12803, 5, 9);
INSERT INTO `item_mods` VALUES (12803, 11, 3);
INSERT INTO `item_mods` VALUES (12803, 12, -1);
INSERT INTO `item_mods` VALUES (12803, 60, 2);
INSERT INTO `item_mods` VALUES (12803, 61, 2);
INSERT INTO `item_mods` VALUES (12804, 1, 41);
INSERT INTO `item_mods` VALUES (12804, 10, 3);
INSERT INTO `item_mods` VALUES (12804, 12, -3);
INSERT INTO `item_mods` VALUES (12804, 27, 3);
INSERT INTO `item_mods` VALUES (12804, 68, -1);
INSERT INTO `item_mods` VALUES (12805, 1, 45);
INSERT INTO `item_mods` VALUES (12805, 2, 40);
INSERT INTO `item_mods` VALUES (12805, 8, -5);
INSERT INTO `item_mods` VALUES (12805, 9, -5);
INSERT INTO `item_mods` VALUES (12805, 10, 10);
INSERT INTO `item_mods` VALUES (12805, 14, 10);
INSERT INTO `item_mods` VALUES (12805, 68, 10);
INSERT INTO `item_mods` VALUES (12806, 1, 29);
INSERT INTO `item_mods` VALUES (12806, 11, 2);
INSERT INTO `item_mods` VALUES (12807, 1, 60);
INSERT INTO `item_mods` VALUES (12808, 1, 16);
INSERT INTO `item_mods` VALUES (12809, 1, 20);
INSERT INTO `item_mods` VALUES (12810, 1, 25);
INSERT INTO `item_mods` VALUES (12811, 1, 33);
INSERT INTO `item_mods` VALUES (12811, 60, 2);
INSERT INTO `item_mods` VALUES (12812, 1, 31);
INSERT INTO `item_mods` VALUES (12812, 23, 5);
INSERT INTO `item_mods` VALUES (12812, 25, 2);
INSERT INTO `item_mods` VALUES (12812, 68, -2);
INSERT INTO `item_mods` VALUES (12813, 1, 37);
INSERT INTO `item_mods` VALUES (12813, 5, -20);
INSERT INTO `item_mods` VALUES (12813, 10, -10);
INSERT INTO `item_mods` VALUES (12813, 23, 6);
INSERT INTO `item_mods` VALUES (12813, 25, 6);
INSERT INTO `item_mods` VALUES (12813, 68, -6);
INSERT INTO `item_mods` VALUES (12814, 1, 30);
INSERT INTO `item_mods` VALUES (12814, 8, 2);
INSERT INTO `item_mods` VALUES (12814, 9, 2);
INSERT INTO `item_mods` VALUES (12814, 23, 3);
INSERT INTO `item_mods` VALUES (12815, 1, 22);
INSERT INTO `item_mods` VALUES (12815, 9, 1);
INSERT INTO `item_mods` VALUES (12815, 11, 1);
INSERT INTO `item_mods` VALUES (12816, 1, 7);
INSERT INTO `item_mods` VALUES (12817, 1, 15);
INSERT INTO `item_mods` VALUES (12818, 1, 42);
INSERT INTO `item_mods` VALUES (12818, 9, 15);
INSERT INTO `item_mods` VALUES (12818, 58, 50);
INSERT INTO `item_mods` VALUES (12818, 384, 51);
INSERT INTO `item_mods` VALUES (12819, 1, 30);
INSERT INTO `item_mods` VALUES (12819, 58, -5);
INSERT INTO `item_mods` VALUES (12819, 59, 5);
INSERT INTO `item_mods` VALUES (12819, 163, -5);
INSERT INTO `item_mods` VALUES (12820, 1, 31);
INSERT INTO `item_mods` VALUES (12820, 2, 11);
INSERT INTO `item_mods` VALUES (12820, 54, 10);
INSERT INTO `item_mods` VALUES (12820, 55, 10);
INSERT INTO `item_mods` VALUES (12820, 162, -4);
INSERT INTO `item_mods` VALUES (12821, 1, 35);
INSERT INTO `item_mods` VALUES (12821, 9, 2);
INSERT INTO `item_mods` VALUES (12821, 10, 2);
INSERT INTO `item_mods` VALUES (12821, 161, -3);
INSERT INTO `item_mods` VALUES (12822, 1, 16);
INSERT INTO `item_mods` VALUES (12822, 11, 2);
INSERT INTO `item_mods` VALUES (12823, 1, 4);
INSERT INTO `item_mods` VALUES (12824, 1, 5);
INSERT INTO `item_mods` VALUES (12825, 1, 10);
INSERT INTO `item_mods` VALUES (12826, 1, 16);
INSERT INTO `item_mods` VALUES (12827, 1, 20);
INSERT INTO `item_mods` VALUES (12828, 1, 25);
INSERT INTO `item_mods` VALUES (12828, 54, 3);
INSERT INTO `item_mods` VALUES (12828, 59, -1);
INSERT INTO `item_mods` VALUES (12829, 1, 30);
INSERT INTO `item_mods` VALUES (12829, 10, 1);
INSERT INTO `item_mods` VALUES (12829, 57, 5);
INSERT INTO `item_mods` VALUES (12830, 1, 29);
INSERT INTO `item_mods` VALUES (12830, 23, 4);
INSERT INTO `item_mods` VALUES (12830, 54, -4);
INSERT INTO `item_mods` VALUES (12830, 55, 4);
INSERT INTO `item_mods` VALUES (12831, 1, 30);
INSERT INTO `item_mods` VALUES (12831, 3, -1);
INSERT INTO `item_mods` VALUES (12831, 58, 15);
INSERT INTO `item_mods` VALUES (12831, 68, 2);
INSERT INTO `item_mods` VALUES (12832, 1, 3);
INSERT INTO `item_mods` VALUES (12833, 1, 7);
INSERT INTO `item_mods` VALUES (12834, 1, 9);
INSERT INTO `item_mods` VALUES (12835, 1, 12);
INSERT INTO `item_mods` VALUES (12836, 1, 17);
INSERT INTO `item_mods` VALUES (12837, 1, 22);
INSERT INTO `item_mods` VALUES (12838, 1, 28);
INSERT INTO `item_mods` VALUES (12838, 2, 3);
INSERT INTO `item_mods` VALUES (12838, 55, -2);
INSERT INTO `item_mods` VALUES (12838, 59, 5);
INSERT INTO `item_mods` VALUES (12838, 61, 5);
INSERT INTO `item_mods` VALUES (12839, 1, 28);
INSERT INTO `item_mods` VALUES (12839, 60, 2);
INSERT INTO `item_mods` VALUES (12839, 61, 2);
INSERT INTO `item_mods` VALUES (12839, 161, -2);
INSERT INTO `item_mods` VALUES (12840, 1, 5);
INSERT INTO `item_mods` VALUES (12841, 1, 10);
INSERT INTO `item_mods` VALUES (12842, 1, 14);
INSERT INTO `item_mods` VALUES (12842, 57, 1);
INSERT INTO `item_mods` VALUES (12842, 58, 1);
INSERT INTO `item_mods` VALUES (12843, 1, 21);
INSERT INTO `item_mods` VALUES (12844, 1, 23);
INSERT INTO `item_mods` VALUES (12846, 1, 33);
INSERT INTO `item_mods` VALUES (12846, 8, 3);
INSERT INTO `item_mods` VALUES (12846, 25, 12);
INSERT INTO `item_mods` VALUES (12846, 27, 3);
INSERT INTO `item_mods` VALUES (12847, 1, 31);
INSERT INTO `item_mods` VALUES (12847, 2, 25);
INSERT INTO `item_mods` VALUES (12847, 12, 2);
INSERT INTO `item_mods` VALUES (12847, 27, 2);
INSERT INTO `item_mods` VALUES (12847, 168, 2);
INSERT INTO `item_mods` VALUES (12848, 1, 7);
INSERT INTO `item_mods` VALUES (12849, 1, 12);
INSERT INTO `item_mods` VALUES (12850, 1, 17);
INSERT INTO `item_mods` VALUES (12851, 1, 22);
INSERT INTO `item_mods` VALUES (12852, 1, 25);
INSERT INTO `item_mods` VALUES (12852, 11, 1);

-- ------------------------------------------
-- War Brais
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (12853, 1, 27);
INSERT INTO `item_mods` VALUES (12853, 2, 25);
INSERT INTO `item_mods` VALUES (12853, 11, 4);
INSERT INTO `item_mods` VALUES (12853, 499, 1); -- blaze spikes
INSERT INTO `item_mods` VALUES (12853, 500, 15); -- spikes dmg
INSERT INTO `item_mods` VALUES (12853, 501, 20); -- spikes proc rate

INSERT INTO `item_mods` VALUES (12854, 1, 14);
INSERT INTO `item_mods` VALUES (12854, 68, 2);
INSERT INTO `item_mods` VALUES (12855, 1, 11);
INSERT INTO `item_mods` VALUES (12855, 68, 1);
INSERT INTO `item_mods` VALUES (12856, 1, 2);
INSERT INTO `item_mods` VALUES (12857, 1, 7);
INSERT INTO `item_mods` VALUES (12858, 1, 13);
INSERT INTO `item_mods` VALUES (12859, 1, 17);
INSERT INTO `item_mods` VALUES (12860, 1, 23);
INSERT INTO `item_mods` VALUES (12861, 1, 30);
INSERT INTO `item_mods` VALUES (12861, 5, 17);
INSERT INTO `item_mods` VALUES (12861, 10, 2);
INSERT INTO `item_mods` VALUES (12861, 14, 1);
INSERT INTO `item_mods` VALUES (12862, 1, 22);
INSERT INTO `item_mods` VALUES (12862, 61, 6);
INSERT INTO `item_mods` VALUES (12863, 1, 8);
INSERT INTO `item_mods` VALUES (12864, 1, 5);
INSERT INTO `item_mods` VALUES (12865, 1, 10);
INSERT INTO `item_mods` VALUES (12866, 1, 15);
INSERT INTO `item_mods` VALUES (12867, 1, 21);
INSERT INTO `item_mods` VALUES (12868, 1, 24);
INSERT INTO `item_mods` VALUES (12868, 2, 8);
INSERT INTO `item_mods` VALUES (12868, 60, 5);
INSERT INTO `item_mods` VALUES (12868, 61, -5);
INSERT INTO `item_mods` VALUES (12870, 1, 17);
INSERT INTO `item_mods` VALUES (12870, 68, 5);
INSERT INTO `item_mods` VALUES (12871, 1, 12);
INSERT INTO `item_mods` VALUES (12871, 5, 32);
INSERT INTO `item_mods` VALUES (12871, 8, -1);
INSERT INTO `item_mods` VALUES (12871, 13, 3);
INSERT INTO `item_mods` VALUES (12871, 14, 1);
INSERT INTO `item_mods` VALUES (12872, 1, 12);
INSERT INTO `item_mods` VALUES (12872, 5, 32);
INSERT INTO `item_mods` VALUES (12872, 8, -1);
INSERT INTO `item_mods` VALUES (12872, 13, 3);
INSERT INTO `item_mods` VALUES (12872, 14, 1);
INSERT INTO `item_mods` VALUES (12873, 1, 12);
INSERT INTO `item_mods` VALUES (12873, 2, 12);
INSERT INTO `item_mods` VALUES (12873, 5, 12);
INSERT INTO `item_mods` VALUES (12873, 9, 2);
INSERT INTO `item_mods` VALUES (12873, 11, 2);
INSERT INTO `item_mods` VALUES (12874, 1, 12);
INSERT INTO `item_mods` VALUES (12874, 2, 12);
INSERT INTO `item_mods` VALUES (12874, 5, 12);
INSERT INTO `item_mods` VALUES (12874, 9, 2);
INSERT INTO `item_mods` VALUES (12874, 11, 2);
INSERT INTO `item_mods` VALUES (12875, 1, 12);
INSERT INTO `item_mods` VALUES (12875, 2, 21);
INSERT INTO `item_mods` VALUES (12875, 8, 1);
INSERT INTO `item_mods` VALUES (12875, 10, 2);
INSERT INTO `item_mods` VALUES (12875, 13, 2);
INSERT INTO `item_mods` VALUES (12876, 1, 12);
INSERT INTO `item_mods` VALUES (12876, 5, 32);
INSERT INTO `item_mods` VALUES (12876, 10, 1);
INSERT INTO `item_mods` VALUES (12876, 13, 1);
INSERT INTO `item_mods` VALUES (12877, 1, 12);
INSERT INTO `item_mods` VALUES (12877, 5, 20);
INSERT INTO `item_mods` VALUES (12877, 11, 2);
INSERT INTO `item_mods` VALUES (12877, 12, 1);
INSERT INTO `item_mods` VALUES (12877, 14, 2);
INSERT INTO `item_mods` VALUES (12878, 1, 29);
INSERT INTO `item_mods` VALUES (12878, 4, 15);
INSERT INTO `item_mods` VALUES (12878, 11, 2);
INSERT INTO `item_mods` VALUES (12878, 14, 1);
INSERT INTO `item_mods` VALUES (12878, 163, -5);
INSERT INTO `item_mods` VALUES (12879, 1, 47);
INSERT INTO `item_mods` VALUES (12879, 2, 35);
INSERT INTO `item_mods` VALUES (12879, 23, 14);
INSERT INTO `item_mods` VALUES (12879, 26, 10);
INSERT INTO `item_mods` VALUES (12879, 169, -3);

-- ------------------------------------------
-- Ogre Trousers
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (12880, 1, 31);
INSERT INTO `item_mods` VALUES (12880, 2, 30);
INSERT INTO `item_mods` VALUES (12880, 12, 3);
INSERT INTO `item_mods` VALUES (12880, 25, -3);
INSERT INTO `item_mods` VALUES (12880, 499, 2); -- ice spikes
INSERT INTO `item_mods` VALUES (12880, 500, 15); -- spikes dmg
INSERT INTO `item_mods` VALUES (12880, 501, 20); -- spikes proc rate

INSERT INTO `item_mods` VALUES (12881, 1, 11);
INSERT INTO `item_mods` VALUES (12881, 10, 1);
INSERT INTO `item_mods` VALUES (12882, 1, 12);
INSERT INTO `item_mods` VALUES (12882, 10, 1);
INSERT INTO `item_mods` VALUES (12883, 1, 2);
INSERT INTO `item_mods` VALUES (12884, 1, 2);
INSERT INTO `item_mods` VALUES (12885, 1, 2);
INSERT INTO `item_mods` VALUES (12886, 1, 2);
INSERT INTO `item_mods` VALUES (12887, 1, 2);
INSERT INTO `item_mods` VALUES (12888, 1, 2);
INSERT INTO `item_mods` VALUES (12889, 1, 2);
INSERT INTO `item_mods` VALUES (12890, 1, 17);
INSERT INTO `item_mods` VALUES (12891, 1, 18);
INSERT INTO `item_mods` VALUES (12892, 1, 8);
INSERT INTO `item_mods` VALUES (12893, 1, 16);
INSERT INTO `item_mods` VALUES (12894, 1, 21);
INSERT INTO `item_mods` VALUES (12895, 1, 26);
INSERT INTO `item_mods` VALUES (12896, 1, 8);
INSERT INTO `item_mods` VALUES (12897, 1, 3);
INSERT INTO `item_mods` VALUES (12898, 1, 6);
INSERT INTO `item_mods` VALUES (12899, 1, 6);
INSERT INTO `item_mods` VALUES (12900, 1, 13);
INSERT INTO `item_mods` VALUES (12901, 1, 8);
INSERT INTO `item_mods` VALUES (12902, 1, 11);
INSERT INTO `item_mods` VALUES (12903, 1, 18);
INSERT INTO `item_mods` VALUES (12904, 1, 16);
INSERT INTO `item_mods` VALUES (12905, 1, 15);
INSERT INTO `item_mods` VALUES (12905, 57, 2);
INSERT INTO `item_mods` VALUES (12905, 58, 2);
INSERT INTO `item_mods` VALUES (12906, 1, 14);
INSERT INTO `item_mods` VALUES (12907, 1, 23);
INSERT INTO `item_mods` VALUES (12908, 1, 6);
INSERT INTO `item_mods` VALUES (12909, 1, 11);
INSERT INTO `item_mods` VALUES (12910, 1, 17);
INSERT INTO `item_mods` VALUES (12911, 1, 21);
INSERT INTO `item_mods` VALUES (12912, 1, 11);
INSERT INTO `item_mods` VALUES (12912, 54, -3);
INSERT INTO `item_mods` VALUES (12912, 68, 1);
INSERT INTO `item_mods` VALUES (12913, 1, 13);
INSERT INTO `item_mods` VALUES (12913, 55, -3);
INSERT INTO `item_mods` VALUES (12913, 68, 1);
INSERT INTO `item_mods` VALUES (12914, 1, 23);
INSERT INTO `item_mods` VALUES (12914, 58, -3);
INSERT INTO `item_mods` VALUES (12914, 68, 1);
INSERT INTO `item_mods` VALUES (12915, 1, 3);
INSERT INTO `item_mods` VALUES (12916, 1, 24);
INSERT INTO `item_mods` VALUES (12917, 1, 11);
INSERT INTO `item_mods` VALUES (12917, 12, 1);
INSERT INTO `item_mods` VALUES (12918, 1, 18);
INSERT INTO `item_mods` VALUES (12918, 5, 2);
INSERT INTO `item_mods` VALUES (12919, 1, 26);
INSERT INTO `item_mods` VALUES (12919, 54, 4);
INSERT INTO `item_mods` VALUES (12919, 59, -1);
INSERT INTO `item_mods` VALUES (12920, 73, -10);
INSERT INTO `item_mods` VALUES (12922, 1, 12);
INSERT INTO `item_mods` VALUES (12922, 11, 2);
INSERT INTO `item_mods` VALUES (12922, 68, 3);
INSERT INTO `item_mods` VALUES (12923, 1, 18);
INSERT INTO `item_mods` VALUES (12923, 9, 1);
INSERT INTO `item_mods` VALUES (12923, 10, 1);
INSERT INTO `item_mods` VALUES (12924, 1, 26);
INSERT INTO `item_mods` VALUES (12924, 12, 3);
INSERT INTO `item_mods` VALUES (12924, 13, 3);
INSERT INTO `item_mods` VALUES (12925, 1, 24);
INSERT INTO `item_mods` VALUES (12925, 11, 1);
INSERT INTO `item_mods` VALUES (12926, 1, 22);
INSERT INTO `item_mods` VALUES (12926, 13, 1);
INSERT INTO `item_mods` VALUES (12927, 1, 24);
INSERT INTO `item_mods` VALUES (12927, 60, 2);
INSERT INTO `item_mods` VALUES (12928, 1, 9);
INSERT INTO `item_mods` VALUES (12929, 1, 11);
INSERT INTO `item_mods` VALUES (12930, 1, 12);
INSERT INTO `item_mods` VALUES (12930, 10, 1);
INSERT INTO `item_mods` VALUES (12930, 61, 3);
INSERT INTO `item_mods` VALUES (12931, 1, 15);
INSERT INTO `item_mods` VALUES (12931, 5, 6);
INSERT INTO `item_mods` VALUES (12931, 9, 3);
INSERT INTO `item_mods` VALUES (12931, 10, -1);
INSERT INTO `item_mods` VALUES (12931, 60, 2);
INSERT INTO `item_mods` VALUES (12931, 61, 2);
INSERT INTO `item_mods` VALUES (12932, 1, 17);
INSERT INTO `item_mods` VALUES (12932, 2, 15);
INSERT INTO `item_mods` VALUES (12932, 10, 1);
INSERT INTO `item_mods` VALUES (12932, 11, -1);
INSERT INTO `item_mods` VALUES (12932, 27, 1);
INSERT INTO `item_mods` VALUES (12933, 1, 25);
INSERT INTO `item_mods` VALUES (12933, 2, 20);
INSERT INTO `item_mods` VALUES (12933, 8, -5);
INSERT INTO `item_mods` VALUES (12933, 9, -5);
INSERT INTO `item_mods` VALUES (12933, 10, 10);
INSERT INTO `item_mods` VALUES (12933, 14, 10);
INSERT INTO `item_mods` VALUES (12933, 242, 2);
INSERT INTO `item_mods` VALUES (12934, 1, 10);
INSERT INTO `item_mods` VALUES (12934, 26, 5);
INSERT INTO `item_mods` VALUES (12935, 1, 50);
INSERT INTO `item_mods` VALUES (12936, 1, 6);
INSERT INTO `item_mods` VALUES (12937, 1, 8);
INSERT INTO `item_mods` VALUES (12938, 1, 10);
INSERT INTO `item_mods` VALUES (12939, 1, 14);
INSERT INTO `item_mods` VALUES (12939, 60, 2);
INSERT INTO `item_mods` VALUES (12940, 1, 12);
INSERT INTO `item_mods` VALUES (12940, 23, 4);
INSERT INTO `item_mods` VALUES (12940, 25, 2);
INSERT INTO `item_mods` VALUES (12940, 68, -2);
INSERT INTO `item_mods` VALUES (12941, 1, 18);
INSERT INTO `item_mods` VALUES (12941, 13, -10);
INSERT INTO `item_mods` VALUES (12941, 23, 5);
INSERT INTO `item_mods` VALUES (12941, 25, 3);
INSERT INTO `item_mods` VALUES (12941, 68, -3);
INSERT INTO `item_mods` VALUES (12942, 1, 11);
INSERT INTO `item_mods` VALUES (12942, 11, 2);
INSERT INTO `item_mods` VALUES (12943, 1, 7);
INSERT INTO `item_mods` VALUES (12943, 11, 1);
INSERT INTO `item_mods` VALUES (12944, 1, 3);
INSERT INTO `item_mods` VALUES (12945, 1, 6);

-- -------------------------------------------
-- Suzaku's Sune-Ate
-- -------------------------------------------
INSERT INTO `item_mods` VALUES (12946, 1, 30);
INSERT INTO `item_mods` VALUES (12946, 13, 15);
INSERT INTO `item_mods` VALUES (12946, 54, 50);
INSERT INTO `item_mods` VALUES (12946, 499, 1); -- blaze spikes
INSERT INTO `item_mods` VALUES (12946, 500, 20); -- spikes dmg
INSERT INTO `item_mods` VALUES (12946, 501, 20); -- spikes proc rate

INSERT INTO `item_mods` VALUES (12947, 1, 12);
INSERT INTO `item_mods` VALUES (12947, 58, -3);
INSERT INTO `item_mods` VALUES (12947, 59, 3);
INSERT INTO `item_mods` VALUES (12947, 163, -2);
INSERT INTO `item_mods` VALUES (12948, 1, 13);
INSERT INTO `item_mods` VALUES (12948, 2, 9);
INSERT INTO `item_mods` VALUES (12948, 56, 10);
INSERT INTO `item_mods` VALUES (12948, 57, 10);
INSERT INTO `item_mods` VALUES (12948, 162, -4);
INSERT INTO `item_mods` VALUES (12949, 1, 21);
INSERT INTO `item_mods` VALUES (12949, 10, 2);
INSERT INTO `item_mods` VALUES (12949, 11, 2);
INSERT INTO `item_mods` VALUES (12949, 23, 2);
INSERT INTO `item_mods` VALUES (12949, 161, -2);
INSERT INTO `item_mods` VALUES (12950, 1, 7);
INSERT INTO `item_mods` VALUES (12950, 11, 1);
INSERT INTO `item_mods` VALUES (12951, 1, 2);
INSERT INTO `item_mods` VALUES (12952, 1, 2);
INSERT INTO `item_mods` VALUES (12953, 1, 4);
INSERT INTO `item_mods` VALUES (12954, 1, 6);
INSERT INTO `item_mods` VALUES (12955, 1, 8);
INSERT INTO `item_mods` VALUES (12956, 1, 10);
INSERT INTO `item_mods` VALUES (12956, 54, 2);
INSERT INTO `item_mods` VALUES (12956, 59, -1);
INSERT INTO `item_mods` VALUES (12957, 1, 23);
INSERT INTO `item_mods` VALUES (12957, 2, 25);
INSERT INTO `item_mods` VALUES (12957, 23, 4);
INSERT INTO `item_mods` VALUES (12957, 169, -3);
INSERT INTO `item_mods` VALUES (12957, 384, 20);
INSERT INTO `item_mods` VALUES (12958, 1, 11);
INSERT INTO `item_mods` VALUES (12958, 23, 3);
INSERT INTO `item_mods` VALUES (12958, 54, -3);
INSERT INTO `item_mods` VALUES (12958, 55, 3);
INSERT INTO `item_mods` VALUES (12959, 1, 12);
INSERT INTO `item_mods` VALUES (12959, 3, -1);
INSERT INTO `item_mods` VALUES (12959, 8, -1);
INSERT INTO `item_mods` VALUES (12959, 11, 2);
INSERT INTO `item_mods` VALUES (12959, 68, 2);
INSERT INTO `item_mods` VALUES (12960, 1, 1);
INSERT INTO `item_mods` VALUES (12961, 1, 3);
INSERT INTO `item_mods` VALUES (12962, 1, 7);
INSERT INTO `item_mods` VALUES (12963, 1, 11);
INSERT INTO `item_mods` VALUES (12963, 2, 3);
INSERT INTO `item_mods` VALUES (12963, 55, -2);
INSERT INTO `item_mods` VALUES (12963, 59, 5);
INSERT INTO `item_mods` VALUES (12963, 61, 5);
INSERT INTO `item_mods` VALUES (12964, 1, 12);
INSERT INTO `item_mods` VALUES (12964, 60, 1);
INSERT INTO `item_mods` VALUES (12964, 61, 1);
INSERT INTO `item_mods` VALUES (12964, 161, -1);
INSERT INTO `item_mods` VALUES (12965, 1, 12);
INSERT INTO `item_mods` VALUES (12965, 4, 15);
INSERT INTO `item_mods` VALUES (12965, 8, 2);
INSERT INTO `item_mods` VALUES (12965, 10, 1);
INSERT INTO `item_mods` VALUES (12965, 163, -2);
INSERT INTO `item_mods` VALUES (12966, 1, 4);
INSERT INTO `item_mods` VALUES (12967, 1, 5);
INSERT INTO `item_mods` VALUES (12968, 1, 2);
INSERT INTO `item_mods` VALUES (12969, 1, 4);
INSERT INTO `item_mods` VALUES (12970, 1, 6);
INSERT INTO `item_mods` VALUES (12970, 57, 1);
INSERT INTO `item_mods` VALUES (12970, 58, 1);
INSERT INTO `item_mods` VALUES (12971, 1, 3);
INSERT INTO `item_mods` VALUES (12972, 1, 9);
INSERT INTO `item_mods` VALUES (12973, 1, 6);
INSERT INTO `item_mods` VALUES (12973, 5, 12);
INSERT INTO `item_mods` VALUES (12973, 12, 1);
INSERT INTO `item_mods` VALUES (12973, 13, 2);
INSERT INTO `item_mods` VALUES (12974, 1, 9);
INSERT INTO `item_mods` VALUES (12975, 1, 4);
INSERT INTO `item_mods` VALUES (12975, 57, 6);
INSERT INTO `item_mods` VALUES (12976, 1, 3);
INSERT INTO `item_mods` VALUES (12977, 1, 5);
INSERT INTO `item_mods` VALUES (12978, 1, 7);
INSERT INTO `item_mods` VALUES (12979, 1, 9);
INSERT INTO `item_mods` VALUES (12980, 1, 11);
INSERT INTO `item_mods` VALUES (12980, 68, 1);
INSERT INTO `item_mods` VALUES (12981, 1, 14);
INSERT INTO `item_mods` VALUES (12981, 2, 12);
INSERT INTO `item_mods` VALUES (12981, 10, -1);
INSERT INTO `item_mods` VALUES (12981, 23, 5);
INSERT INTO `item_mods` VALUES (12981, 24, 5);
INSERT INTO `item_mods` VALUES (12982, 1, 5);
INSERT INTO `item_mods` VALUES (12982, 11, 1);
INSERT INTO `item_mods` VALUES (12983, 1, 2);
INSERT INTO `item_mods` VALUES (12984, 1, 1);
INSERT INTO `item_mods` VALUES (12985, 1, 3);
INSERT INTO `item_mods` VALUES (12986, 1, 5);
INSERT INTO `item_mods` VALUES (12987, 1, 7);
INSERT INTO `item_mods` VALUES (12988, 1, 9);
INSERT INTO `item_mods` VALUES (12989, 1, 14);
INSERT INTO `item_mods` VALUES (12989, 5, 12);
INSERT INTO `item_mods` VALUES (12989, 11, 2);
INSERT INTO `item_mods` VALUES (12989, 14, 1);
INSERT INTO `item_mods` VALUES (12990, 1, 9);
INSERT INTO `item_mods` VALUES (12990, 55, 10);
INSERT INTO `item_mods` VALUES (12991, 1, 4);
INSERT INTO `item_mods` VALUES (12992, 1, 2);
INSERT INTO `item_mods` VALUES (12993, 1, 4);
INSERT INTO `item_mods` VALUES (12994, 1, 6);
INSERT INTO `item_mods` VALUES (12995, 1, 8);
INSERT INTO `item_mods` VALUES (12996, 1, 9);
INSERT INTO `item_mods` VALUES (12996, 2, 5);
INSERT INTO `item_mods` VALUES (12996, 60, 3);
INSERT INTO `item_mods` VALUES (12996, 61, -3);
INSERT INTO `item_mods` VALUES (12998, 1, 7);
INSERT INTO `item_mods` VALUES (12998, 55, 4);
INSERT INTO `item_mods` VALUES (12998, 57, 4);
INSERT INTO `item_mods` VALUES (13002, 1, 13);
INSERT INTO `item_mods` VALUES (13002, 2, 10);
INSERT INTO `item_mods` VALUES (13002, 12, 3);
INSERT INTO `item_mods` VALUES (13002, 27, 2);
INSERT INTO `item_mods` VALUES (13002, 168, 5);
INSERT INTO `item_mods` VALUES (13003, 1, 2);
INSERT INTO `item_mods` VALUES (13003, 56, 3);
INSERT INTO `item_mods` VALUES (13003, 57, 3);
INSERT INTO `item_mods` VALUES (13004, 1, 3);
INSERT INTO `item_mods` VALUES (13004, 54, 3);
INSERT INTO `item_mods` VALUES (13004, 55, 3);
INSERT INTO `item_mods` VALUES (13005, 1, 1);
INSERT INTO `item_mods` VALUES (13006, 1, 1);
INSERT INTO `item_mods` VALUES (13007, 1, 1);
INSERT INTO `item_mods` VALUES (13008, 1, 1);
INSERT INTO `item_mods` VALUES (13009, 1, 1);
INSERT INTO `item_mods` VALUES (13010, 1, 1);
INSERT INTO `item_mods` VALUES (13011, 1, 1);
INSERT INTO `item_mods` VALUES (13012, 1, 3);
INSERT INTO `item_mods` VALUES (13012, 10, 3);
INSERT INTO `item_mods` VALUES (13012, 54, 7);
INSERT INTO `item_mods` VALUES (13013, 1, 4);
INSERT INTO `item_mods` VALUES (13013, 9, -10);
INSERT INTO `item_mods` VALUES (13013, 11, -10);
INSERT INTO `item_mods` VALUES (13014, 1, 3);
INSERT INTO `item_mods` VALUES (13014, 9, 3);
INSERT INTO `item_mods` VALUES (13014, 11, 3);
INSERT INTO `item_mods` VALUES (13015, 1, 5);
INSERT INTO `item_mods` VALUES (13015, 2, 4);
INSERT INTO `item_mods` VALUES (13015, 5, 12);
INSERT INTO `item_mods` VALUES (13015, 9, -1);
INSERT INTO `item_mods` VALUES (13015, 11, 3);
INSERT INTO `item_mods` VALUES (13015, 12, 3);
INSERT INTO `item_mods` VALUES (13015, 13, -1);
INSERT INTO `item_mods` VALUES (13016, 1, 5);
INSERT INTO `item_mods` VALUES (13016, 2, 4);
INSERT INTO `item_mods` VALUES (13016, 5, 12);
INSERT INTO `item_mods` VALUES (13016, 9, -1);
INSERT INTO `item_mods` VALUES (13016, 11, 3);
INSERT INTO `item_mods` VALUES (13016, 12, 3);
INSERT INTO `item_mods` VALUES (13016, 13, -1);
INSERT INTO `item_mods` VALUES (13017, 1, 5);
INSERT INTO `item_mods` VALUES (13017, 5, 20);
INSERT INTO `item_mods` VALUES (13017, 11, 3);
INSERT INTO `item_mods` VALUES (13017, 12, 2);
INSERT INTO `item_mods` VALUES (13018, 1, 5);
INSERT INTO `item_mods` VALUES (13018, 5, 20);
INSERT INTO `item_mods` VALUES (13018, 11, 3);
INSERT INTO `item_mods` VALUES (13018, 12, 2);
INSERT INTO `item_mods` VALUES (13019, 1, 5);
INSERT INTO `item_mods` VALUES (13019, 2, 20);
INSERT INTO `item_mods` VALUES (13019, 8, 2);
INSERT INTO `item_mods` VALUES (13020, 1, 5);
INSERT INTO `item_mods` VALUES (13020, 2, 16);
INSERT INTO `item_mods` VALUES (13020, 8, 3);
INSERT INTO `item_mods` VALUES (13020, 14, 2);
INSERT INTO `item_mods` VALUES (13021, 1, 5);
INSERT INTO `item_mods` VALUES (13021, 5, 12);
INSERT INTO `item_mods` VALUES (13021, 11, 3);
INSERT INTO `item_mods` VALUES (13021, 12, 2);
INSERT INTO `item_mods` VALUES (13022, 1, 6);
INSERT INTO `item_mods` VALUES (13023, 1, 8);
INSERT INTO `item_mods` VALUES (13024, 1, 4);
INSERT INTO `item_mods` VALUES (13025, 1, 7);
INSERT INTO `item_mods` VALUES (13026, 1, 8);
INSERT INTO `item_mods` VALUES (13027, 1, 4);
INSERT INTO `item_mods` VALUES (13028, 1, 7);
INSERT INTO `item_mods` VALUES (13029, 1, 9);
INSERT INTO `item_mods` VALUES (13030, 1, 4);
INSERT INTO `item_mods` VALUES (13031, 1, 3);
INSERT INTO `item_mods` VALUES (13032, 1, 6);
INSERT INTO `item_mods` VALUES (13033, 1, 5);
INSERT INTO `item_mods` VALUES (13034, 1, 8);
INSERT INTO `item_mods` VALUES (13035, 1, 7);
INSERT INTO `item_mods` VALUES (13035, 57, 2);
INSERT INTO `item_mods` VALUES (13035, 58, 2);
INSERT INTO `item_mods` VALUES (13036, 1, 10);
INSERT INTO `item_mods` VALUES (13037, 1, 3);
INSERT INTO `item_mods` VALUES (13038, 1, 5);
INSERT INTO `item_mods` VALUES (13039, 1, 7);
INSERT INTO `item_mods` VALUES (13040, 1, 7);
INSERT INTO `item_mods` VALUES (13041, 1, 9);
INSERT INTO `item_mods` VALUES (13042, 1, 5);
INSERT INTO `item_mods` VALUES (13042, 54, -3);
INSERT INTO `item_mods` VALUES (13042, 68, 1);
INSERT INTO `item_mods` VALUES (13043, 1, 6);
INSERT INTO `item_mods` VALUES (13043, 55, -3);
INSERT INTO `item_mods` VALUES (13043, 68, 1);
INSERT INTO `item_mods` VALUES (13044, 1, 10);
INSERT INTO `item_mods` VALUES (13044, 58, -3);
INSERT INTO `item_mods` VALUES (13044, 68, 1);
INSERT INTO `item_mods` VALUES (13045, 1, 5);
INSERT INTO `item_mods` VALUES (13045, 11, 1);
INSERT INTO `item_mods` VALUES (13046, 1, 10);
INSERT INTO `item_mods` VALUES (13047, 1, 11);
INSERT INTO `item_mods` VALUES (13048, 1, 5);
INSERT INTO `item_mods` VALUES (13048, 5, 3);
INSERT INTO `item_mods` VALUES (13048, 11, 1);
INSERT INTO `item_mods` VALUES (13049, 1, 11);
INSERT INTO `item_mods` VALUES (13049, 54, 3);
INSERT INTO `item_mods` VALUES (13049, 59, -1);
INSERT INTO `item_mods` VALUES (13050, 1, 9);
INSERT INTO `item_mods` VALUES (13051, 1, 5);
INSERT INTO `item_mods` VALUES (13051, 68, -3);
INSERT INTO `item_mods` VALUES (13052, 1, 4);
INSERT INTO `item_mods` VALUES (13052, 68, 3);
INSERT INTO `item_mods` VALUES (13054, 1, 7);
INSERT INTO `item_mods` VALUES (13054, 384, 30);
INSERT INTO `item_mods` VALUES (13055, 1, 1);
INSERT INTO `item_mods` VALUES (13055, 5, 25);
INSERT INTO `item_mods` VALUES (13056, 25, 10);
INSERT INTO `item_mods` VALUES (13056, 26, 10);
INSERT INTO `item_mods` VALUES (13056, 61, -10);
INSERT INTO `item_mods` VALUES (13057, 54, 10);
INSERT INTO `item_mods` VALUES (13057, 58, -10);
INSERT INTO `item_mods` VALUES (13057, 59, 10);
INSERT INTO `item_mods` VALUES (13057, 60, -10);
INSERT INTO `item_mods` VALUES (13057, 61, 10);
INSERT INTO `item_mods` VALUES (13058, 2, 15);
INSERT INTO `item_mods` VALUES (13059, 1, 4);
INSERT INTO `item_mods` VALUES (13060, 1, 2);
INSERT INTO `item_mods` VALUES (13060, 26, 2);
INSERT INTO `item_mods` VALUES (13061, 8, 3);
INSERT INTO `item_mods` VALUES (13061, 9, 3);
INSERT INTO `item_mods` VALUES (13061, 13, -6);
INSERT INTO `item_mods` VALUES (13062, 1, 3);
INSERT INTO `item_mods` VALUES (13062, 55, -3);
INSERT INTO `item_mods` VALUES (13062, 68, 1);
INSERT INTO `item_mods` VALUES (13063, 1, 5);
INSERT INTO `item_mods` VALUES (13063, 58, -3);
INSERT INTO `item_mods` VALUES (13063, 68, 1);
INSERT INTO `item_mods` VALUES (13064, 1, 7);
INSERT INTO `item_mods` VALUES (13064, 2, 15);
INSERT INTO `item_mods` VALUES (13064, 10, 1);
INSERT INTO `item_mods` VALUES (13065, 1, 5);
INSERT INTO `item_mods` VALUES (13066, 58, 5);
INSERT INTO `item_mods` VALUES (13066, 59, 5);
INSERT INTO `item_mods` VALUES (13067, 1, 6);
INSERT INTO `item_mods` VALUES (13068, 1, 3);
INSERT INTO `item_mods` VALUES (13069, 1, 2);
INSERT INTO `item_mods` VALUES (13070, 1, 4);
INSERT INTO `item_mods` VALUES (13071, 1, 2);
INSERT INTO `item_mods` VALUES (13072, 2, 5);
INSERT INTO `item_mods` VALUES (13072, 14, 3);
INSERT INTO `item_mods` VALUES (13073, 1, 3);
INSERT INTO `item_mods` VALUES (13073, 5, 9);
INSERT INTO `item_mods` VALUES (13073, 13, 3);
INSERT INTO `item_mods` VALUES (13074, 1, 30);
INSERT INTO `item_mods` VALUES (13075, 1, 1);
INSERT INTO `item_mods` VALUES (13076, 8, 2);
INSERT INTO `item_mods` VALUES (13076, 9, 2);
INSERT INTO `item_mods` VALUES (13076, 13, -4);
INSERT INTO `item_mods` VALUES (13077, 14, 3);
INSERT INTO `item_mods` VALUES (13077, 60, 9);
INSERT INTO `item_mods` VALUES (13077, 61, 9);
INSERT INTO `item_mods` VALUES (13079, 1, 10);
INSERT INTO `item_mods` VALUES (13079, 5, 5);
INSERT INTO `item_mods` VALUES (13079, 8, -1);
INSERT INTO `item_mods` VALUES (13079, 13, 3);
INSERT INTO `item_mods` VALUES (13079, 60, 2);
INSERT INTO `item_mods` VALUES (13079, 61, 2);
INSERT INTO `item_mods` VALUES (13080, 1, 4);
INSERT INTO `item_mods` VALUES (13081, 1, 1);
INSERT INTO `item_mods` VALUES (13082, 1, 3);
INSERT INTO `item_mods` VALUES (13083, 58, 3);
INSERT INTO `item_mods` VALUES (13083, 59, 3);
INSERT INTO `item_mods` VALUES (13084, 1, 5);
INSERT INTO `item_mods` VALUES (13085, 1, 2);
INSERT INTO `item_mods` VALUES (13086, 56, 6);
INSERT INTO `item_mods` VALUES (13086, 60, 6);
INSERT INTO `item_mods` VALUES (13087, 54, 10);
INSERT INTO `item_mods` VALUES (13087, 55, 10);
INSERT INTO `item_mods` VALUES (13087, 56, 10);
INSERT INTO `item_mods` VALUES (13087, 57, 10);
INSERT INTO `item_mods` VALUES (13087, 58, 10);
INSERT INTO `item_mods` VALUES (13087, 59, 10);
INSERT INTO `item_mods` VALUES (13088, 1, 6);
INSERT INTO `item_mods` VALUES (13089, 1, 3);
INSERT INTO `item_mods` VALUES (13090, 1, 2);
INSERT INTO `item_mods` VALUES (13091, 1, 4);
INSERT INTO `item_mods` VALUES (13092, 1, 5);
INSERT INTO `item_mods` VALUES (13093, 1, 1);
INSERT INTO `item_mods` VALUES (13093, 13, 3);
INSERT INTO `item_mods` VALUES (13094, 14, 3);
INSERT INTO `item_mods` VALUES (13095, 55, 5);
INSERT INTO `item_mods` VALUES (13095, 57, 5);
INSERT INTO `item_mods` VALUES (13095, 61, 5);
INSERT INTO `item_mods` VALUES (13096, 1, 1);
INSERT INTO `item_mods` VALUES (13096, 14, -1);
INSERT INTO `item_mods` VALUES (13097, 1, 3);
INSERT INTO `item_mods` VALUES (13098, 5, 2);
INSERT INTO `item_mods` VALUES (13099, 5, 6);
INSERT INTO `item_mods` VALUES (13100, 5, 12);
INSERT INTO `item_mods` VALUES (13101, 1, 1);
INSERT INTO `item_mods` VALUES (13101, 2, 2);
INSERT INTO `item_mods` VALUES (13102, 1, 2);
INSERT INTO `item_mods` VALUES (13102, 2, 6);
INSERT INTO `item_mods` VALUES (13103, 1, 4);
INSERT INTO `item_mods` VALUES (13103, 2, 12);
INSERT INTO `item_mods` VALUES (13104, 1, 3);
INSERT INTO `item_mods` VALUES (13104, 68, 1);
INSERT INTO `item_mods` VALUES (13105, 1, 5);
INSERT INTO `item_mods` VALUES (13105, 13, 1);
INSERT INTO `item_mods` VALUES (13105, 68, 2);
INSERT INTO `item_mods` VALUES (13106, 1, 6);
INSERT INTO `item_mods` VALUES (13106, 23, 4);
INSERT INTO `item_mods` VALUES (13106, 25, 4);
INSERT INTO `item_mods` VALUES (13107, 1, 5);
INSERT INTO `item_mods` VALUES (13107, 8, 1);
INSERT INTO `item_mods` VALUES (13107, 68, 2);
INSERT INTO `item_mods` VALUES (13108, 1, 5);
INSERT INTO `item_mods` VALUES (13108, 25, 3);
INSERT INTO `item_mods` VALUES (13108, 26, 3);
INSERT INTO `item_mods` VALUES (13109, 1, 7);
INSERT INTO `item_mods` VALUES (13109, 8, 2);
INSERT INTO `item_mods` VALUES (13109, 10, -5);
INSERT INTO `item_mods` VALUES (13109, 27, 3);
INSERT INTO `item_mods` VALUES (13110, 10, 2);
INSERT INTO `item_mods` VALUES (13110, 14, 2);
INSERT INTO `item_mods` VALUES (13111, 1, 4);
INSERT INTO `item_mods` VALUES (13112, 1, 1);
INSERT INTO `item_mods` VALUES (13112, 9, 1);
INSERT INTO `item_mods` VALUES (13112, 11, 1);
INSERT INTO `item_mods` VALUES (13112, 298, 1);
INSERT INTO `item_mods` VALUES (13113, 1, 2);
INSERT INTO `item_mods` VALUES (13113, 12, 1);
INSERT INTO `item_mods` VALUES (13113, 61, 3);
INSERT INTO `item_mods` VALUES (13114, 60, 11);
INSERT INTO `item_mods` VALUES (13114, 61, 11);
INSERT INTO `item_mods` VALUES (13115, 54, 6);
INSERT INTO `item_mods` VALUES (13115, 55, 6);
INSERT INTO `item_mods` VALUES (13115, 56, 6);
INSERT INTO `item_mods` VALUES (13115, 57, 6);
INSERT INTO `item_mods` VALUES (13115, 58, 6);
INSERT INTO `item_mods` VALUES (13115, 59, 6);
INSERT INTO `item_mods` VALUES (13116, 59, 5);
INSERT INTO `item_mods` VALUES (13117, 24, 5);
INSERT INTO `item_mods` VALUES (13117, 26, 5);
INSERT INTO `item_mods` VALUES (13118, 2, 20);
INSERT INTO `item_mods` VALUES (13118, 5, -20);
INSERT INTO `item_mods` VALUES (13119, 1, 2);
INSERT INTO `item_mods` VALUES (13119, 23, 5);
INSERT INTO `item_mods` VALUES (13120, 1, 4);
INSERT INTO `item_mods` VALUES (13120, 57, 11);
INSERT INTO `item_mods` VALUES (13123, 1, 7);
INSERT INTO `item_mods` VALUES (13123, 25, 5);
INSERT INTO `item_mods` VALUES (13123, 26, 5);
INSERT INTO `item_mods` VALUES (13124, 1, 5);
INSERT INTO `item_mods` VALUES (13124, 10, 1);
INSERT INTO `item_mods` VALUES (13125, 1, 4);
INSERT INTO `item_mods` VALUES (13125, 12, 1);
INSERT INTO `item_mods` VALUES (13125, 13, 1);
INSERT INTO `item_mods` VALUES (13125, 14, 1);
INSERT INTO `item_mods` VALUES (13126, 1, 5);
INSERT INTO `item_mods` VALUES (13126, 12, 2);
INSERT INTO `item_mods` VALUES (13126, 13, 2);
INSERT INTO `item_mods` VALUES (13126, 14, 2);
INSERT INTO `item_mods` VALUES (13127, 1, 4);
INSERT INTO `item_mods` VALUES (13127, 4, 15);
INSERT INTO `item_mods` VALUES (13127, 10, 1);
INSERT INTO `item_mods` VALUES (13127, 11, -1);
INSERT INTO `item_mods` VALUES (13127, 68, -5);
INSERT INTO `item_mods` VALUES (13128, 1, 2);
INSERT INTO `item_mods` VALUES (13128, 25, 7);
INSERT INTO `item_mods` VALUES (13128, 26, 7);
INSERT INTO `item_mods` VALUES (13128, 55, -7);
INSERT INTO `item_mods` VALUES (13129, 5, 10);
INSERT INTO `item_mods` VALUES (13129, 68, 5);
INSERT INTO `item_mods` VALUES (13130, 8, 1);
INSERT INTO `item_mods` VALUES (13130, 9, 1);
INSERT INTO `item_mods` VALUES (13130, 10, 1);
INSERT INTO `item_mods` VALUES (13130, 11, 1);
INSERT INTO `item_mods` VALUES (13130, 12, 1);
INSERT INTO `item_mods` VALUES (13130, 13, 1);
INSERT INTO `item_mods` VALUES (13130, 54, 10);
INSERT INTO `item_mods` VALUES (13130, 55, 10);
INSERT INTO `item_mods` VALUES (13130, 56, 10);
INSERT INTO `item_mods` VALUES (13130, 57, 10);
INSERT INTO `item_mods` VALUES (13130, 58, 10);
INSERT INTO `item_mods` VALUES (13130, 59, 10);
INSERT INTO `item_mods` VALUES (13131, 1, 11);
INSERT INTO `item_mods` VALUES (13131, 5, 6);
INSERT INTO `item_mods` VALUES (13131, 8, -1);
INSERT INTO `item_mods` VALUES (13131, 13, 4);
INSERT INTO `item_mods` VALUES (13131, 60, 3);
INSERT INTO `item_mods` VALUES (13131, 61, 3);
INSERT INTO `item_mods` VALUES (13132, 1, 6);
INSERT INTO `item_mods` VALUES (13133, 1, 7);
INSERT INTO `item_mods` VALUES (13134, 1, 1);
INSERT INTO `item_mods` VALUES (13134, 8, 1);
INSERT INTO `item_mods` VALUES (13134, 9, 1);
INSERT INTO `item_mods` VALUES (13134, 10, 1);
INSERT INTO `item_mods` VALUES (13134, 11, 1);
INSERT INTO `item_mods` VALUES (13135, 1, 3);
INSERT INTO `item_mods` VALUES (13135, 2, 10);
INSERT INTO `item_mods` VALUES (13135, 13, 5);
INSERT INTO `item_mods` VALUES (13136, 1, 1);
INSERT INTO `item_mods` VALUES (13136, 7, 15);
INSERT INTO `item_mods` VALUES (13136, 14, 3);
INSERT INTO `item_mods` VALUES (13137, 114, 5);
INSERT INTO `item_mods` VALUES (13139, 1, 1);
INSERT INTO `item_mods` VALUES (13139, 113, 1);
INSERT INTO `item_mods` VALUES (13139, 114, 1);
INSERT INTO `item_mods` VALUES (13143, 9, 1);
INSERT INTO `item_mods` VALUES (13143, 58, 3);
INSERT INTO `item_mods` VALUES (13144, 1, 5);
INSERT INTO `item_mods` VALUES (13145, 5, 20);
INSERT INTO `item_mods` VALUES (13146, 8, 2);
INSERT INTO `item_mods` VALUES (13146, 23, 3);
INSERT INTO `item_mods` VALUES (13148, 2, 7);
INSERT INTO `item_mods` VALUES (13148, 108, 7);
INSERT INTO `item_mods` VALUES (13149, 2, 7);
INSERT INTO `item_mods` VALUES (13149, 110, 7);
INSERT INTO `item_mods` VALUES (13150, 2, 7);
INSERT INTO `item_mods` VALUES (13150, 109, 7);
INSERT INTO `item_mods` VALUES (13151, 2, 7);
INSERT INTO `item_mods` VALUES (13151, 107, 7);
INSERT INTO `item_mods` VALUES (13152, 60, 5);
INSERT INTO `item_mods` VALUES (13152, 111, 7);
INSERT INTO `item_mods` VALUES (13153, 61, 5);
INSERT INTO `item_mods` VALUES (13153, 116, 7);
INSERT INTO `item_mods` VALUES (13154, 57, 5);
INSERT INTO `item_mods` VALUES (13154, 113, 7);
INSERT INTO `item_mods` VALUES (13155, 54, 5);
INSERT INTO `item_mods` VALUES (13155, 114, 7);
INSERT INTO `item_mods` VALUES (13156, 56, 5);
INSERT INTO `item_mods` VALUES (13156, 115, 7);
INSERT INTO `item_mods` VALUES (13157, 59, 5);
INSERT INTO `item_mods` VALUES (13157, 112, 7);
INSERT INTO `item_mods` VALUES (13158, 58, 5);
INSERT INTO `item_mods` VALUES (13158, 117, 7);
INSERT INTO `item_mods` VALUES (13159, 55, 5);
INSERT INTO `item_mods` VALUES (13159, 118, 7);
INSERT INTO `item_mods` VALUES (13160, 56, 5);
INSERT INTO `item_mods` VALUES (13160, 120, 7);
INSERT INTO `item_mods` VALUES (13161, 56, 5);
INSERT INTO `item_mods` VALUES (13161, 121, 7);
INSERT INTO `item_mods` VALUES (13162, 1, 4);
INSERT INTO `item_mods` VALUES (13163, 1, 3);
INSERT INTO `item_mods` VALUES (13163, 10, 2);
INSERT INTO `item_mods` VALUES (13164, 1, 3);
INSERT INTO `item_mods` VALUES (13164, 11, 2);
INSERT INTO `item_mods` VALUES (13164, 68, 1);
INSERT INTO `item_mods` VALUES (13165, 1, 2);
INSERT INTO `item_mods` VALUES (13165, 5, 6);
INSERT INTO `item_mods` VALUES (13165, 24, 6);
INSERT INTO `item_mods` VALUES (13165, 26, 5);
INSERT INTO `item_mods` VALUES (13166, 1, 6);
INSERT INTO `item_mods` VALUES (13166, 27, 1);
INSERT INTO `item_mods` VALUES (13167, 1, 4);
INSERT INTO `item_mods` VALUES (13167, 9, 2);
INSERT INTO `item_mods` VALUES (13167, 11, -2);
INSERT INTO `item_mods` VALUES (13167, 23, 6);
INSERT INTO `item_mods` VALUES (13168, 1, 4);
INSERT INTO `item_mods` VALUES (13168, 12, 2);
INSERT INTO `item_mods` VALUES (13169, 1, 2);
INSERT INTO `item_mods` VALUES (13169, 27, -2);
INSERT INTO `item_mods` VALUES (13170, 1, 4);
INSERT INTO `item_mods` VALUES (13170, 12, 1);
INSERT INTO `item_mods` VALUES (13170, 13, 1);
INSERT INTO `item_mods` VALUES (13170, 14, 1);
INSERT INTO `item_mods` VALUES (13171, 1, 5);
INSERT INTO `item_mods` VALUES (13171, 25, 3);
INSERT INTO `item_mods` VALUES (13171, 26, 3);
INSERT INTO `item_mods` VALUES (13172, 1, 2);
INSERT INTO `item_mods` VALUES (13172, 71, 1);
INSERT INTO `item_mods` VALUES (13172, 72, 1);
INSERT INTO `item_mods` VALUES (13173, 1, 4);
INSERT INTO `item_mods` VALUES (13174, 168, 5);
INSERT INTO `item_mods` VALUES (13175, 11, 2);
INSERT INTO `item_mods` VALUES (13175, 13, 6);
INSERT INTO `item_mods` VALUES (13176, 12, 3);
INSERT INTO `item_mods` VALUES (13177, 1, 4);
INSERT INTO `item_mods` VALUES (13178, 1, 5);
INSERT INTO `item_mods` VALUES (13182, 14, -9);
INSERT INTO `item_mods` VALUES (13183, 11, 1);
INSERT INTO `item_mods` VALUES (13183, 56, 1);
INSERT INTO `item_mods` VALUES (13183, 57, 1);
INSERT INTO `item_mods` VALUES (13184, 8, 1);
INSERT INTO `item_mods` VALUES (13185, 1, 7);
INSERT INTO `item_mods` VALUES (13185, 68, -5);
INSERT INTO `item_mods` VALUES (13186, 1, 7);
INSERT INTO `item_mods` VALUES (13186, 8, 7);
INSERT INTO `item_mods` VALUES (13186, 161, -5);
INSERT INTO `item_mods` VALUES (13186, 289, 5);
INSERT INTO `item_mods` VALUES (13186, 384, 122);
INSERT INTO `item_mods` VALUES (13187, 1, 6);
INSERT INTO `item_mods` VALUES (13188, 1, 8);
INSERT INTO `item_mods` VALUES (13188, 5, 15);
INSERT INTO `item_mods` VALUES (13188, 168, 8);
INSERT INTO `item_mods` VALUES (13189, 384, 61);
INSERT INTO `item_mods` VALUES (13190, 1, 2);
INSERT INTO `item_mods` VALUES (13190, 168, 8);
INSERT INTO `item_mods` VALUES (13191, 1, 3);
INSERT INTO `item_mods` VALUES (13192, 1, 1);
INSERT INTO `item_mods` VALUES (13193, 1, 2);
INSERT INTO `item_mods` VALUES (13194, 1, 1);
INSERT INTO `item_mods` VALUES (13194, 2, 3);
INSERT INTO `item_mods` VALUES (13194, 10, 2);
INSERT INTO `item_mods` VALUES (13195, 1, 2);
INSERT INTO `item_mods` VALUES (13195, 5, 3);
INSERT INTO `item_mods` VALUES (13196, 1, 3);
INSERT INTO `item_mods` VALUES (13197, 1, 7);
INSERT INTO `item_mods` VALUES (13197, 2, 20);
INSERT INTO `item_mods` VALUES (13197, 14, 3);
INSERT INTO `item_mods` VALUES (13198, 1, 4);
INSERT INTO `item_mods` VALUES (13198, 23, 10);
INSERT INTO `item_mods` VALUES (13199, 2, 5);
INSERT INTO `item_mods` VALUES (13200, 1, 4);
INSERT INTO `item_mods` VALUES (13201, 1, 2);
INSERT INTO `item_mods` VALUES (13201, 8, 3);
INSERT INTO `item_mods` VALUES (13201, 384, 40);
INSERT INTO `item_mods` VALUES (13202, 1, 3);
INSERT INTO `item_mods` VALUES (13202, 8, 5);
INSERT INTO `item_mods` VALUES (13202, 384, 81);
INSERT INTO `item_mods` VALUES (13203, 1, 2);
INSERT INTO `item_mods` VALUES (13203, 8, 1);
INSERT INTO `item_mods` VALUES (13203, 9, -1);
INSERT INTO `item_mods` VALUES (13203, 10, 1);
INSERT INTO `item_mods` VALUES (13203, 11, -1);
INSERT INTO `item_mods` VALUES (13204, 1, 1);
INSERT INTO `item_mods` VALUES (13205, 1, 2);
INSERT INTO `item_mods` VALUES (13206, 1, 3);
INSERT INTO `item_mods` VALUES (13207, 1, 4);
INSERT INTO `item_mods` VALUES (13208, 1, 5);
INSERT INTO `item_mods` VALUES (13209, 1, 3);
INSERT INTO `item_mods` VALUES (13210, 1, 2);
INSERT INTO `item_mods` VALUES (13211, 1, 2);
INSERT INTO `item_mods` VALUES (13211, 5, 5);
INSERT INTO `item_mods` VALUES (13211, 13, 1);
INSERT INTO `item_mods` VALUES (13211, 60, 2);
INSERT INTO `item_mods` VALUES (13211, 61, 2);
INSERT INTO `item_mods` VALUES (13212, 1, 7);
INSERT INTO `item_mods` VALUES (13212, 5, 10);
INSERT INTO `item_mods` VALUES (13212, 168, 6);
INSERT INTO `item_mods` VALUES (13213, 1, 4);
INSERT INTO `item_mods` VALUES (13214, 1, 5);
INSERT INTO `item_mods` VALUES (13215, 1, 40);
INSERT INTO `item_mods` VALUES (13216, 3, 3);
INSERT INTO `item_mods` VALUES (13216, 59, 3);
INSERT INTO `item_mods` VALUES (13217, 3, 2);
INSERT INTO `item_mods` VALUES (13217, 59, 2);
INSERT INTO `item_mods` VALUES (13218, 3, 1);
INSERT INTO `item_mods` VALUES (13218, 59, 1);
INSERT INTO `item_mods` VALUES (13219, 1, 3);
INSERT INTO `item_mods` VALUES (13219, 5, 5);
INSERT INTO `item_mods` VALUES (13220, 1, 5);
INSERT INTO `item_mods` VALUES (13220, 8, 2);
INSERT INTO `item_mods` VALUES (13220, 9, 2);
INSERT INTO `item_mods` VALUES (13220, 11, 2);
INSERT INTO `item_mods` VALUES (13220, 12, 2);
INSERT INTO `item_mods` VALUES (13220, 13, 2);
INSERT INTO `item_mods` VALUES (13220, 14, 2);
INSERT INTO `item_mods` VALUES (13221, 1, 3);
INSERT INTO `item_mods` VALUES (13221, 9, 1);
INSERT INTO `item_mods` VALUES (13221, 10, 1);
INSERT INTO `item_mods` VALUES (13221, 11, 1);
INSERT INTO `item_mods` VALUES (13221, 12, 1);
INSERT INTO `item_mods` VALUES (13221, 13, 1);
INSERT INTO `item_mods` VALUES (13221, 14, 1);
INSERT INTO `item_mods` VALUES (13222, 1, 3);
INSERT INTO `item_mods` VALUES (13222, 2, 3);
INSERT INTO `item_mods` VALUES (13222, 5, 3);
INSERT INTO `item_mods` VALUES (13223, 1, 4);
INSERT INTO `item_mods` VALUES (13224, 1, 3);
INSERT INTO `item_mods` VALUES (13224, 168, 8);
INSERT INTO `item_mods` VALUES (13225, 1, 3);
INSERT INTO `item_mods` VALUES (13225, 8, 2);
INSERT INTO `item_mods` VALUES (13225, 9, -1);
INSERT INTO `item_mods` VALUES (13225, 10, 2);
INSERT INTO `item_mods` VALUES (13225, 11, -1);
INSERT INTO `item_mods` VALUES (13226, 2, 7);
INSERT INTO `item_mods` VALUES (13227, 1, 2);
INSERT INTO `item_mods` VALUES (13228, 1, 2);
INSERT INTO `item_mods` VALUES (13228, 5, 5);
INSERT INTO `item_mods` VALUES (13228, 12, 1);
INSERT INTO `item_mods` VALUES (13229, 1, 3);
INSERT INTO `item_mods` VALUES (13229, 5, 7);
INSERT INTO `item_mods` VALUES (13229, 13, 1);
INSERT INTO `item_mods` VALUES (13230, 1, 3);
INSERT INTO `item_mods` VALUES (13230, 2, 8);
INSERT INTO `item_mods` VALUES (13230, 5, 8);
INSERT INTO `item_mods` VALUES (13231, 25, 10);
INSERT INTO `item_mods` VALUES (13232, 1, 5);
INSERT INTO `item_mods` VALUES (13232, 23, 12);
INSERT INTO `item_mods` VALUES (13233, 1, 4);
INSERT INTO `item_mods` VALUES (13233, 168, 8);
INSERT INTO `item_mods` VALUES (13234, 1, 5);
INSERT INTO `item_mods` VALUES (13234, 168, 8);
INSERT INTO `item_mods` VALUES (13235, 1, 6);
INSERT INTO `item_mods` VALUES (13235, 168, 8);
INSERT INTO `item_mods` VALUES (13236, 1, 6);
INSERT INTO `item_mods` VALUES (13236, 23, 5);
INSERT INTO `item_mods` VALUES (13236, 25, 5);
INSERT INTO `item_mods` VALUES (13237, 1, 3);
INSERT INTO `item_mods` VALUES (13237, 2, 17);
INSERT INTO `item_mods` VALUES (13237, 68, 5);
INSERT INTO `item_mods` VALUES (13238, 1, 3);
INSERT INTO `item_mods` VALUES (13238, 12, 1);
INSERT INTO `item_mods` VALUES (13238, 13, 1);
INSERT INTO `item_mods` VALUES (13238, 14, 1);
INSERT INTO `item_mods` VALUES (13238, 168, 10);
INSERT INTO `item_mods` VALUES (13239, 1, 8);
INSERT INTO `item_mods` VALUES (13239, 2, 25);
INSERT INTO `item_mods` VALUES (13239, 14, 4);
INSERT INTO `item_mods` VALUES (13240, 1, 2);
INSERT INTO `item_mods` VALUES (13240, 2, 4);
INSERT INTO `item_mods` VALUES (13240, 10, 3);
INSERT INTO `item_mods` VALUES (13241, 1, 6);
INSERT INTO `item_mods` VALUES (13241, 55, 20);
INSERT INTO `item_mods` VALUES (13241, 59, -20);
INSERT INTO `item_mods` VALUES (13242, 1, 6);
INSERT INTO `item_mods` VALUES (13242, 54, -20);
INSERT INTO `item_mods` VALUES (13242, 56, 20);
INSERT INTO `item_mods` VALUES (13243, 1, 6);
INSERT INTO `item_mods` VALUES (13243, 55, -20);
INSERT INTO `item_mods` VALUES (13243, 57, 20);
INSERT INTO `item_mods` VALUES (13244, 1, 6);
INSERT INTO `item_mods` VALUES (13244, 56, -20);
INSERT INTO `item_mods` VALUES (13244, 58, 20);
INSERT INTO `item_mods` VALUES (13245, 1, 6);
INSERT INTO `item_mods` VALUES (13245, 57, -20);
INSERT INTO `item_mods` VALUES (13245, 59, 20);
INSERT INTO `item_mods` VALUES (13246, 1, 6);
INSERT INTO `item_mods` VALUES (13246, 54, 20);
INSERT INTO `item_mods` VALUES (13246, 58, -20);
INSERT INTO `item_mods` VALUES (13247, 1, 5);
INSERT INTO `item_mods` VALUES (13247, 25, 3);
INSERT INTO `item_mods` VALUES (13247, 68, 3);
INSERT INTO `item_mods` VALUES (13248, 1, 4);
INSERT INTO `item_mods` VALUES (13248, 11, 1);
INSERT INTO `item_mods` VALUES (13248, 56, 3);
INSERT INTO `item_mods` VALUES (13249, 1, 3);
INSERT INTO `item_mods` VALUES (13249, 384, 61);
INSERT INTO `item_mods` VALUES (13250, 1, 4);
INSERT INTO `item_mods` VALUES (13250, 384, 61);
INSERT INTO `item_mods` VALUES (13251, 1, 4);
INSERT INTO `item_mods` VALUES (13251, 2, 30);
INSERT INTO `item_mods` VALUES (13251, 8, 3);
INSERT INTO `item_mods` VALUES (13251, 9, 2);
INSERT INTO `item_mods` VALUES (13251, 12, -5);
INSERT INTO `item_mods` VALUES (13252, 1, 5);
INSERT INTO `item_mods` VALUES (13252, 2, 20);
INSERT INTO `item_mods` VALUES (13252, 9, 3);
INSERT INTO `item_mods` VALUES (13252, 11, 2);
INSERT INTO `item_mods` VALUES (13252, 13, -5);
INSERT INTO `item_mods` VALUES (13253, 1, 3);
INSERT INTO `item_mods` VALUES (13253, 2, 40);
INSERT INTO `item_mods` VALUES (13253, 8, 2);
INSERT INTO `item_mods` VALUES (13253, 10, 3);
INSERT INTO `item_mods` VALUES (13253, 12, -5);
INSERT INTO `item_mods` VALUES (13254, 1, 4);
INSERT INTO `item_mods` VALUES (13254, 2, 30);
INSERT INTO `item_mods` VALUES (13254, 8, 3);
INSERT INTO `item_mods` VALUES (13254, 10, 2);
INSERT INTO `item_mods` VALUES (13254, 12, -5);
INSERT INTO `item_mods` VALUES (13255, 1, 5);
INSERT INTO `item_mods` VALUES (13255, 2, 20);
INSERT INTO `item_mods` VALUES (13255, 8, 2);
INSERT INTO `item_mods` VALUES (13255, 11, 3);
INSERT INTO `item_mods` VALUES (13255, 12, -5);
INSERT INTO `item_mods` VALUES (13256, 1, 2);
INSERT INTO `item_mods` VALUES (13256, 5, 30);
INSERT INTO `item_mods` VALUES (13256, 8, -5);
INSERT INTO `item_mods` VALUES (13256, 12, 3);
INSERT INTO `item_mods` VALUES (13256, 13, 2);
INSERT INTO `item_mods` VALUES (13257, 1, 1);
INSERT INTO `item_mods` VALUES (13257, 5, 40);
INSERT INTO `item_mods` VALUES (13257, 9, -5);
INSERT INTO `item_mods` VALUES (13257, 11, 2);
INSERT INTO `item_mods` VALUES (13257, 12, 3);
INSERT INTO `item_mods` VALUES (13258, 1, 3);
INSERT INTO `item_mods` VALUES (13258, 5, 20);
INSERT INTO `item_mods` VALUES (13258, 8, -5);
INSERT INTO `item_mods` VALUES (13258, 10, 2);
INSERT INTO `item_mods` VALUES (13258, 13, 3);
INSERT INTO `item_mods` VALUES (13259, 1, 2);
INSERT INTO `item_mods` VALUES (13259, 5, 30);
INSERT INTO `item_mods` VALUES (13259, 11, -5);
INSERT INTO `item_mods` VALUES (13259, 12, 2);
INSERT INTO `item_mods` VALUES (13259, 13, 3);
INSERT INTO `item_mods` VALUES (13260, 1, 1);
INSERT INTO `item_mods` VALUES (13260, 5, 40);
INSERT INTO `item_mods` VALUES (13260, 9, -5);
INSERT INTO `item_mods` VALUES (13260, 12, 3);
INSERT INTO `item_mods` VALUES (13260, 14, 2);
INSERT INTO `item_mods` VALUES (13261, 1, 6);
INSERT INTO `item_mods` VALUES (13261, 2, 45);
INSERT INTO `item_mods` VALUES (13261, 8, 4);
INSERT INTO `item_mods` VALUES (13261, 12, -4);
INSERT INTO `item_mods` VALUES (13262, 1, 7);
INSERT INTO `item_mods` VALUES (13262, 2, 30);
INSERT INTO `item_mods` VALUES (13262, 9, 4);
INSERT INTO `item_mods` VALUES (13262, 12, -4);
INSERT INTO `item_mods` VALUES (13263, 1, 5);
INSERT INTO `item_mods` VALUES (13263, 2, 60);
INSERT INTO `item_mods` VALUES (13263, 10, 4);
INSERT INTO `item_mods` VALUES (13263, 13, -4);
INSERT INTO `item_mods` VALUES (13264, 1, 6);
INSERT INTO `item_mods` VALUES (13264, 2, 45);
INSERT INTO `item_mods` VALUES (13264, 8, 4);
INSERT INTO `item_mods` VALUES (13264, 13, -4);
INSERT INTO `item_mods` VALUES (13265, 1, 7);
INSERT INTO `item_mods` VALUES (13265, 2, 30);
INSERT INTO `item_mods` VALUES (13265, 11, 4);
INSERT INTO `item_mods` VALUES (13265, 12, -4);
INSERT INTO `item_mods` VALUES (13266, 1, 4);
INSERT INTO `item_mods` VALUES (13266, 5, 45);
INSERT INTO `item_mods` VALUES (13266, 8, -4);
INSERT INTO `item_mods` VALUES (13266, 12, 4);
INSERT INTO `item_mods` VALUES (13267, 1, 3);
INSERT INTO `item_mods` VALUES (13267, 5, 60);
INSERT INTO `item_mods` VALUES (13267, 9, -4);
INSERT INTO `item_mods` VALUES (13267, 12, 4);
INSERT INTO `item_mods` VALUES (13268, 1, 5);
INSERT INTO `item_mods` VALUES (13268, 5, 30);
INSERT INTO `item_mods` VALUES (13268, 8, -4);
INSERT INTO `item_mods` VALUES (13268, 13, 4);
INSERT INTO `item_mods` VALUES (13269, 1, 4);
INSERT INTO `item_mods` VALUES (13269, 5, 45);
INSERT INTO `item_mods` VALUES (13269, 9, -4);
INSERT INTO `item_mods` VALUES (13269, 12, 4);
INSERT INTO `item_mods` VALUES (13270, 1, 3);
INSERT INTO `item_mods` VALUES (13270, 5, 60);
INSERT INTO `item_mods` VALUES (13270, 10, -4);
INSERT INTO `item_mods` VALUES (13270, 12, 4);
INSERT INTO `item_mods` VALUES (13271, 1, 4);
INSERT INTO `item_mods` VALUES (13271, 8, -2);
INSERT INTO `item_mods` VALUES (13271, 11, -2);
INSERT INTO `item_mods` VALUES (13271, 14, 5);
INSERT INTO `item_mods` VALUES (13272, 1, 5);
INSERT INTO `item_mods` VALUES (13272, 8, -1);
INSERT INTO `item_mods` VALUES (13272, 11, -1);
INSERT INTO `item_mods` VALUES (13272, 14, 6);
INSERT INTO `item_mods` VALUES (13273, 1, 4);
INSERT INTO `item_mods` VALUES (13273, 13, 2);
INSERT INTO `item_mods` VALUES (13273, 241, 2);
INSERT INTO `item_mods` VALUES (13274, 1, 5);
INSERT INTO `item_mods` VALUES (13274, 13, 3);
INSERT INTO `item_mods` VALUES (13274, 168, 8);
INSERT INTO `item_mods` VALUES (13274, 241, 2);
INSERT INTO `item_mods` VALUES (13275, 1, 4);
INSERT INTO `item_mods` VALUES (13275, 12, 2);
INSERT INTO `item_mods` VALUES (13275, 250, 2);
INSERT INTO `item_mods` VALUES (13276, 1, 5);
INSERT INTO `item_mods` VALUES (13276, 12, 3);
INSERT INTO `item_mods` VALUES (13276, 168, 8);
INSERT INTO `item_mods` VALUES (13276, 250, 3);
INSERT INTO `item_mods` VALUES (13277, 1, 6);
INSERT INTO `item_mods` VALUES (13277, 8, 2);
INSERT INTO `item_mods` VALUES (13277, 9, 2);
INSERT INTO `item_mods` VALUES (13277, 11, 2);
INSERT INTO `item_mods` VALUES (13277, 12, 2);
INSERT INTO `item_mods` VALUES (13277, 13, 2);
INSERT INTO `item_mods` VALUES (13277, 14, 2);
INSERT INTO `item_mods` VALUES (13278, 1, 7);
INSERT INTO `item_mods` VALUES (13278, 8, 2);
INSERT INTO `item_mods` VALUES (13278, 9, 2);
INSERT INTO `item_mods` VALUES (13278, 11, 2);
INSERT INTO `item_mods` VALUES (13278, 12, 2);
INSERT INTO `item_mods` VALUES (13278, 13, 2);
INSERT INTO `item_mods` VALUES (13278, 14, 2);
INSERT INTO `item_mods` VALUES (13279, 1, 8);
INSERT INTO `item_mods` VALUES (13279, 68, -6);
INSERT INTO `item_mods` VALUES (13280, 1, -10);
INSERT INTO `item_mods` VALUES (13280, 25, 5);
INSERT INTO `item_mods` VALUES (13280, 26, 5);
INSERT INTO `item_mods` VALUES (13280, 61, -20);
INSERT INTO `item_mods` VALUES (13281, 1, -12);
INSERT INTO `item_mods` VALUES (13281, 25, 7);
INSERT INTO `item_mods` VALUES (13281, 26, 7);
INSERT INTO `item_mods` VALUES (13281, 61, -25);
INSERT INTO `item_mods` VALUES (13282, 13, 2);
INSERT INTO `item_mods` VALUES (13283, 13, 3);
INSERT INTO `item_mods` VALUES (13284, 12, 2);
INSERT INTO `item_mods` VALUES (13285, 12, 3);
INSERT INTO `item_mods` VALUES (13301, 1, 2);
INSERT INTO `item_mods` VALUES (13301, 7, 50);
INSERT INTO `item_mods` VALUES (13301, 12, 1);
INSERT INTO `item_mods` VALUES (13301, 13, 1);
INSERT INTO `item_mods` VALUES (13302, 1, 2);
INSERT INTO `item_mods` VALUES (13302, 2, 50);
INSERT INTO `item_mods` VALUES (13302, 5, -10);
INSERT INTO `item_mods` VALUES (13303, 161, -5);
INSERT INTO `item_mods` VALUES (13303, 163, 12);
INSERT INTO `item_mods` VALUES (13304, 11, 5);
INSERT INTO `item_mods` VALUES (13304, 56, 10);
INSERT INTO `item_mods` VALUES (13305, 8, 5);
INSERT INTO `item_mods` VALUES (13305, 54, 10);
INSERT INTO `item_mods` VALUES (13306, 12, 5);
INSERT INTO `item_mods` VALUES (13306, 55, 10);
INSERT INTO `item_mods` VALUES (13307, 9, 5);
INSERT INTO `item_mods` VALUES (13307, 58, 10);
INSERT INTO `item_mods` VALUES (13308, 13, 5);
INSERT INTO `item_mods` VALUES (13308, 59, 10);
INSERT INTO `item_mods` VALUES (13309, 10, 5);
INSERT INTO `item_mods` VALUES (13309, 57, 10);
INSERT INTO `item_mods` VALUES (13310, 5, 9);
INSERT INTO `item_mods` VALUES (13310, 61, 10);
INSERT INTO `item_mods` VALUES (13311, 14, 5);
INSERT INTO `item_mods` VALUES (13311, 60, 10);
INSERT INTO `item_mods` VALUES (13312, 23, 5);
INSERT INTO `item_mods` VALUES (13312, 68, -5);
INSERT INTO `item_mods` VALUES (13312, 163, -2);
INSERT INTO `item_mods` VALUES (13313, 54, 2);
INSERT INTO `item_mods` VALUES (13313, 58, -2);
INSERT INTO `item_mods` VALUES (13313, 59, 2);
INSERT INTO `item_mods` VALUES (13314, 54, 3);
INSERT INTO `item_mods` VALUES (13314, 58, -2);
INSERT INTO `item_mods` VALUES (13314, 59, 3);
INSERT INTO `item_mods` VALUES (13315, 23, -3);
INSERT INTO `item_mods` VALUES (13315, 68, 3);
INSERT INTO `item_mods` VALUES (13316, 23, -4);
INSERT INTO `item_mods` VALUES (13316, 68, 4);
INSERT INTO `item_mods` VALUES (13317, 2, 4);
INSERT INTO `item_mods` VALUES (13317, 60, 4);
INSERT INTO `item_mods` VALUES (13318, 57, 10);
INSERT INTO `item_mods` VALUES (13318, 58, 10);
INSERT INTO `item_mods` VALUES (13319, 56, 4);
INSERT INTO `item_mods` VALUES (13319, 57, 4);
INSERT INTO `item_mods` VALUES (13320, 5, 4);
INSERT INTO `item_mods` VALUES (13320, 61, 4);
INSERT INTO `item_mods` VALUES (13321, 23, 1);
INSERT INTO `item_mods` VALUES (13321, 68, -1);
INSERT INTO `item_mods` VALUES (13322, 11, 2);
INSERT INTO `item_mods` VALUES (13322, 56, 4);
INSERT INTO `item_mods` VALUES (13323, 23, 2);
INSERT INTO `item_mods` VALUES (13323, 68, -2);
INSERT INTO `item_mods` VALUES (13324, 23, 3);
INSERT INTO `item_mods` VALUES (13324, 68, -3);
INSERT INTO `item_mods` VALUES (13325, 23, 4);
INSERT INTO `item_mods` VALUES (13325, 68, -4);
INSERT INTO `item_mods` VALUES (13326, 23, 3);
INSERT INTO `item_mods` VALUES (13326, 68, -2);
INSERT INTO `item_mods` VALUES (13327, 23, -1);
INSERT INTO `item_mods` VALUES (13327, 68, 1);
INSERT INTO `item_mods` VALUES (13328, 23, -2);
INSERT INTO `item_mods` VALUES (13328, 68, 2);
INSERT INTO `item_mods` VALUES (13329, 23, -5);
INSERT INTO `item_mods` VALUES (13329, 68, 5);
INSERT INTO `item_mods` VALUES (13330, 56, 2);
INSERT INTO `item_mods` VALUES (13330, 57, 2);
INSERT INTO `item_mods` VALUES (13331, 54, 2);
INSERT INTO `item_mods` VALUES (13331, 55, 2);
INSERT INTO `item_mods` VALUES (13332, 55, 2);
INSERT INTO `item_mods` VALUES (13332, 56, 2);
INSERT INTO `item_mods` VALUES (13333, 58, 2);
INSERT INTO `item_mods` VALUES (13333, 59, 2);
INSERT INTO `item_mods` VALUES (13334, 54, 2);
INSERT INTO `item_mods` VALUES (13334, 59, 2);
INSERT INTO `item_mods` VALUES (13335, 57, 2);
INSERT INTO `item_mods` VALUES (13335, 58, 2);
INSERT INTO `item_mods` VALUES (13336, 5, 2);
INSERT INTO `item_mods` VALUES (13336, 61, 2);
INSERT INTO `item_mods` VALUES (13337, 2, 2);
INSERT INTO `item_mods` VALUES (13337, 60, 2);
INSERT INTO `item_mods` VALUES (13338, 54, 4);
INSERT INTO `item_mods` VALUES (13338, 55, 4);
INSERT INTO `item_mods` VALUES (13339, 55, 4);
INSERT INTO `item_mods` VALUES (13339, 56, 4);
INSERT INTO `item_mods` VALUES (13340, 58, 4);
INSERT INTO `item_mods` VALUES (13340, 59, 4);
INSERT INTO `item_mods` VALUES (13341, 54, 4);
INSERT INTO `item_mods` VALUES (13341, 59, 4);
INSERT INTO `item_mods` VALUES (13342, 57, 4);
INSERT INTO `item_mods` VALUES (13342, 58, 4);
INSERT INTO `item_mods` VALUES (13343, 56, 6);
INSERT INTO `item_mods` VALUES (13343, 57, 6);
INSERT INTO `item_mods` VALUES (13344, 54, 6);
INSERT INTO `item_mods` VALUES (13344, 55, 6);
INSERT INTO `item_mods` VALUES (13345, 55, 6);
INSERT INTO `item_mods` VALUES (13345, 56, 6);
INSERT INTO `item_mods` VALUES (13346, 58, 6);
INSERT INTO `item_mods` VALUES (13346, 59, 6);
INSERT INTO `item_mods` VALUES (13347, 54, 6);
INSERT INTO `item_mods` VALUES (13347, 59, 6);
INSERT INTO `item_mods` VALUES (13348, 57, 6);
INSERT INTO `item_mods` VALUES (13348, 58, 6);
INSERT INTO `item_mods` VALUES (13349, 5, 6);
INSERT INTO `item_mods` VALUES (13349, 61, 6);
INSERT INTO `item_mods` VALUES (13350, 2, 6);
INSERT INTO `item_mods` VALUES (13350, 60, 6);
INSERT INTO `item_mods` VALUES (13351, 56, 10);
INSERT INTO `item_mods` VALUES (13351, 57, 10);
INSERT INTO `item_mods` VALUES (13352, 54, 10);
INSERT INTO `item_mods` VALUES (13352, 55, 10);
INSERT INTO `item_mods` VALUES (13353, 55, 10);
INSERT INTO `item_mods` VALUES (13353, 56, 10);
INSERT INTO `item_mods` VALUES (13354, 58, 10);
INSERT INTO `item_mods` VALUES (13354, 59, 10);
INSERT INTO `item_mods` VALUES (13355, 54, 10);
INSERT INTO `item_mods` VALUES (13355, 59, 10);
INSERT INTO `item_mods` VALUES (13356, 5, 10);
INSERT INTO `item_mods` VALUES (13356, 61, 10);
INSERT INTO `item_mods` VALUES (13357, 2, 10);
INSERT INTO `item_mods` VALUES (13357, 60, 10);
INSERT INTO `item_mods` VALUES (13358, 1, 20);
INSERT INTO `item_mods` VALUES (13359, 2, 25);
INSERT INTO `item_mods` VALUES (13360, 55, -4);
INSERT INTO `item_mods` VALUES (13360, 56, 4);
INSERT INTO `item_mods` VALUES (13361, 11, 3);
INSERT INTO `item_mods` VALUES (13361, 56, 6);
INSERT INTO `item_mods` VALUES (13362, 23, 2);
INSERT INTO `item_mods` VALUES (13362, 68, -1);
INSERT INTO `item_mods` VALUES (13363, 23, 4);
INSERT INTO `item_mods` VALUES (13363, 68, -2);
INSERT INTO `item_mods` VALUES (13364, 2, 3);
INSERT INTO `item_mods` VALUES (13364, 5, 3);
INSERT INTO `item_mods` VALUES (13365, 2, 10);
INSERT INTO `item_mods` VALUES (13365, 5, -10);
INSERT INTO `item_mods` VALUES (13366, 68, 3);
INSERT INTO `item_mods` VALUES (13367, 2, 5);
INSERT INTO `item_mods` VALUES (13367, 68, -2);
INSERT INTO `item_mods` VALUES (13368, 291, 1);
INSERT INTO `item_mods` VALUES (13369, 23, 5);
INSERT INTO `item_mods` VALUES (13369, 68, -5);
INSERT INTO `item_mods` VALUES (13370, 23, -2);
INSERT INTO `item_mods` VALUES (13370, 68, 2);
INSERT INTO `item_mods` VALUES (13371, 23, -3);
INSERT INTO `item_mods` VALUES (13371, 68, 3);
INSERT INTO `item_mods` VALUES (13372, 23, -4);
INSERT INTO `item_mods` VALUES (13372, 68, 4);
INSERT INTO `item_mods` VALUES (13373, 56, 3);
INSERT INTO `item_mods` VALUES (13373, 57, 3);
INSERT INTO `item_mods` VALUES (13374, 54, 3);
INSERT INTO `item_mods` VALUES (13374, 55, 3);
INSERT INTO `item_mods` VALUES (13375, 55, 3);
INSERT INTO `item_mods` VALUES (13375, 56, 3);
INSERT INTO `item_mods` VALUES (13376, 58, 3);
INSERT INTO `item_mods` VALUES (13376, 59, 3);
INSERT INTO `item_mods` VALUES (13377, 54, 3);
INSERT INTO `item_mods` VALUES (13377, 59, 3);
INSERT INTO `item_mods` VALUES (13378, 57, 3);
INSERT INTO `item_mods` VALUES (13378, 58, 3);
INSERT INTO `item_mods` VALUES (13379, 5, 3);
INSERT INTO `item_mods` VALUES (13379, 61, 3);
INSERT INTO `item_mods` VALUES (13380, 2, 3);
INSERT INTO `item_mods` VALUES (13380, 60, 3);
INSERT INTO `item_mods` VALUES (13381, 56, 5);
INSERT INTO `item_mods` VALUES (13381, 57, 5);
INSERT INTO `item_mods` VALUES (13382, 54, 5);
INSERT INTO `item_mods` VALUES (13382, 55, 5);
INSERT INTO `item_mods` VALUES (13383, 55, 5);
INSERT INTO `item_mods` VALUES (13383, 56, 5);
INSERT INTO `item_mods` VALUES (13384, 58, 5);
INSERT INTO `item_mods` VALUES (13384, 59, 5);
INSERT INTO `item_mods` VALUES (13385, 54, 5);
INSERT INTO `item_mods` VALUES (13385, 59, 5);
INSERT INTO `item_mods` VALUES (13386, 57, 5);
INSERT INTO `item_mods` VALUES (13386, 58, 5);
INSERT INTO `item_mods` VALUES (13387, 5, 5);
INSERT INTO `item_mods` VALUES (13387, 61, 5);
INSERT INTO `item_mods` VALUES (13388, 2, 5);
INSERT INTO `item_mods` VALUES (13388, 60, 5);
INSERT INTO `item_mods` VALUES (13389, 56, 8);
INSERT INTO `item_mods` VALUES (13389, 57, 8);
INSERT INTO `item_mods` VALUES (13390, 54, 8);
INSERT INTO `item_mods` VALUES (13390, 55, 8);
INSERT INTO `item_mods` VALUES (13391, 55, 8);
INSERT INTO `item_mods` VALUES (13391, 56, 8);
INSERT INTO `item_mods` VALUES (13392, 58, 8);
INSERT INTO `item_mods` VALUES (13392, 59, 8);
INSERT INTO `item_mods` VALUES (13393, 54, 8);
INSERT INTO `item_mods` VALUES (13393, 59, 8);
INSERT INTO `item_mods` VALUES (13394, 57, 8);
INSERT INTO `item_mods` VALUES (13394, 58, 8);
INSERT INTO `item_mods` VALUES (13395, 5, 8);
INSERT INTO `item_mods` VALUES (13395, 61, 8);
INSERT INTO `item_mods` VALUES (13396, 2, 8);
INSERT INTO `item_mods` VALUES (13396, 60, 8);
INSERT INTO `item_mods` VALUES (13397, 23, -5);
INSERT INTO `item_mods` VALUES (13397, 68, 5);
INSERT INTO `item_mods` VALUES (13398, 4, 25);
INSERT INTO `item_mods` VALUES (13400, 1, 5);
INSERT INTO `item_mods` VALUES (13400, 61, 4);
INSERT INTO `item_mods` VALUES (13401, 60, 12);
INSERT INTO `item_mods` VALUES (13401, 247, 2);
INSERT INTO `item_mods` VALUES (13401, 249, 2);
INSERT INTO `item_mods` VALUES (13401, 251, 2);
INSERT INTO `item_mods` VALUES (13402, 1, 2);
INSERT INTO `item_mods` VALUES (13402, 4, 50);
INSERT INTO `item_mods` VALUES (13402, 8, 1);
INSERT INTO `item_mods` VALUES (13402, 10, 1);
INSERT INTO `item_mods` VALUES (13403, 1, -3);
INSERT INTO `item_mods` VALUES (13403, 23, 5);
INSERT INTO `item_mods` VALUES (13403, 25, 2);
INSERT INTO `item_mods` VALUES (13403, 68, -2);
INSERT INTO `item_mods` VALUES (13404, 27, 1);
INSERT INTO `item_mods` VALUES (13405, 2, 5);
INSERT INTO `item_mods` VALUES (13405, 5, 5);
INSERT INTO `item_mods` VALUES (13406, 23, 6);
INSERT INTO `item_mods` VALUES (13406, 68, -4);
INSERT INTO `item_mods` VALUES (13406, 163, -5);
INSERT INTO `item_mods` VALUES (13407, 11, 2);
INSERT INTO `item_mods` VALUES (13407, 56, 11);
INSERT INTO `item_mods` VALUES (13407, 57, 11);
INSERT INTO `item_mods` VALUES (13408, 8, 2);
INSERT INTO `item_mods` VALUES (13408, 54, 11);
INSERT INTO `item_mods` VALUES (13408, 55, 11);
INSERT INTO `item_mods` VALUES (13409, 12, 2);
INSERT INTO `item_mods` VALUES (13409, 55, 11);
INSERT INTO `item_mods` VALUES (13409, 56, 11);
INSERT INTO `item_mods` VALUES (13410, 9, 2);
INSERT INTO `item_mods` VALUES (13410, 58, 11);
INSERT INTO `item_mods` VALUES (13410, 59, 11);
INSERT INTO `item_mods` VALUES (13411, 13, 2);
INSERT INTO `item_mods` VALUES (13411, 54, 11);
INSERT INTO `item_mods` VALUES (13411, 59, 11);
INSERT INTO `item_mods` VALUES (13412, 10, 2);
INSERT INTO `item_mods` VALUES (13412, 57, 11);
INSERT INTO `item_mods` VALUES (13412, 58, 11);
INSERT INTO `item_mods` VALUES (13413, 5, 11);
INSERT INTO `item_mods` VALUES (13413, 27, 1);
INSERT INTO `item_mods` VALUES (13413, 61, 11);
INSERT INTO `item_mods` VALUES (13414, 2, 11);
INSERT INTO `item_mods` VALUES (13414, 27, -1);
INSERT INTO `item_mods` VALUES (13414, 60, 11);
INSERT INTO `item_mods` VALUES (13415, 9, 3);
INSERT INTO `item_mods` VALUES (13416, 5, 5);
INSERT INTO `item_mods` VALUES (13416, 61, 3);
INSERT INTO `item_mods` VALUES (13417, 27, 2);
INSERT INTO `item_mods` VALUES (13418, 27, 3);
INSERT INTO `item_mods` VALUES (13434, 23, -6);
INSERT INTO `item_mods` VALUES (13434, 68, 6);
INSERT INTO `item_mods` VALUES (13440, 13, 1);
INSERT INTO `item_mods` VALUES (13441, 25, -2);
INSERT INTO `item_mods` VALUES (13441, 26, 2);
INSERT INTO `item_mods` VALUES (13442, 54, 2);
INSERT INTO `item_mods` VALUES (13442, 59, 2);
INSERT INTO `item_mods` VALUES (13443, 14, 1);
INSERT INTO `item_mods` VALUES (13443, 60, 3);
INSERT INTO `item_mods` VALUES (13444, 8, 1);
INSERT INTO `item_mods` VALUES (13444, 54, 3);
INSERT INTO `item_mods` VALUES (13445, 2, 5);
INSERT INTO `item_mods` VALUES (13445, 5, -5);
INSERT INTO `item_mods` VALUES (13446, 2, 4);
INSERT INTO `item_mods` VALUES (13446, 5, -4);
INSERT INTO `item_mods` VALUES (13447, 2, 8);
INSERT INTO `item_mods` VALUES (13447, 5, -8);
INSERT INTO `item_mods` VALUES (13448, 11, 4);
INSERT INTO `item_mods` VALUES (13448, 56, 9);
INSERT INTO `item_mods` VALUES (13449, 8, 4);
INSERT INTO `item_mods` VALUES (13449, 54, 9);
INSERT INTO `item_mods` VALUES (13450, 12, 4);
INSERT INTO `item_mods` VALUES (13450, 55, 9);
INSERT INTO `item_mods` VALUES (13451, 9, 4);
INSERT INTO `item_mods` VALUES (13451, 58, 9);
INSERT INTO `item_mods` VALUES (13452, 13, 4);
INSERT INTO `item_mods` VALUES (13452, 59, 9);
INSERT INTO `item_mods` VALUES (13453, 10, 4);
INSERT INTO `item_mods` VALUES (13453, 57, 9);
INSERT INTO `item_mods` VALUES (13454, 2, 1);
INSERT INTO `item_mods` VALUES (13454, 5, -1);
INSERT INTO `item_mods` VALUES (13455, 25, -9);
INSERT INTO `item_mods` VALUES (13455, 26, 9);
INSERT INTO `item_mods` VALUES (13455, 163, -7);
INSERT INTO `item_mods` VALUES (13456, 2, 3);
INSERT INTO `item_mods` VALUES (13456, 5, -3);
INSERT INTO `item_mods` VALUES (13457, 25, -3);
INSERT INTO `item_mods` VALUES (13457, 26, 3);
INSERT INTO `item_mods` VALUES (13458, 25, -7);
INSERT INTO `item_mods` VALUES (13458, 26, 7);
INSERT INTO `item_mods` VALUES (13459, 25, -4);
INSERT INTO `item_mods` VALUES (13459, 26, 4);
INSERT INTO `item_mods` VALUES (13460, 1, 2);
INSERT INTO `item_mods` VALUES (13460, 2, 10);
INSERT INTO `item_mods` VALUES (13460, 25, -11);
INSERT INTO `item_mods` VALUES (13460, 26, 11);
INSERT INTO `item_mods` VALUES (13461, 25, -6);
INSERT INTO `item_mods` VALUES (13461, 26, 6);
INSERT INTO `item_mods` VALUES (13462, 5, 8);
INSERT INTO `item_mods` VALUES (13462, 61, 9);
INSERT INTO `item_mods` VALUES (13463, 14, 4);
INSERT INTO `item_mods` VALUES (13463, 60, 9);
INSERT INTO `item_mods` VALUES (13464, 1, 2);
INSERT INTO `item_mods` VALUES (13464, 2, 10);
INSERT INTO `item_mods` VALUES (13464, 5, 10);
INSERT INTO `item_mods` VALUES (13464, 60, -20);
INSERT INTO `item_mods` VALUES (13464, 61, 10);
INSERT INTO `item_mods` VALUES (13465, 2, 2);
INSERT INTO `item_mods` VALUES (13465, 5, -2);
INSERT INTO `item_mods` VALUES (13466, 2, 10);
INSERT INTO `item_mods` VALUES (13466, 5, -10);
INSERT INTO `item_mods` VALUES (13467, 1, 1);
INSERT INTO `item_mods` VALUES (13467, 25, -10);
INSERT INTO `item_mods` VALUES (13467, 26, 10);
INSERT INTO `item_mods` VALUES (13467, 162, -1);
INSERT INTO `item_mods` VALUES (13468, 11, 1);
INSERT INTO `item_mods` VALUES (13468, 56, 3);
INSERT INTO `item_mods` VALUES (13469, 1, 1);
INSERT INTO `item_mods` VALUES (13470, 12, 1);
INSERT INTO `item_mods` VALUES (13470, 55, 3);
INSERT INTO `item_mods` VALUES (13471, 9, 1);
INSERT INTO `item_mods` VALUES (13471, 58, 3);
INSERT INTO `item_mods` VALUES (13472, 13, 1);
INSERT INTO `item_mods` VALUES (13472, 59, 3);
INSERT INTO `item_mods` VALUES (13473, 10, 1);
INSERT INTO `item_mods` VALUES (13473, 57, 3);
INSERT INTO `item_mods` VALUES (13474, 5, 2);
INSERT INTO `item_mods` VALUES (13474, 61, 3);
INSERT INTO `item_mods` VALUES (13475, 12, 1);
INSERT INTO `item_mods` VALUES (13476, 11, 2);
INSERT INTO `item_mods` VALUES (13476, 56, 5);
INSERT INTO `item_mods` VALUES (13477, 8, 2);
INSERT INTO `item_mods` VALUES (13477, 54, 5);
INSERT INTO `item_mods` VALUES (13478, 12, 2);
INSERT INTO `item_mods` VALUES (13478, 55, 5);
INSERT INTO `item_mods` VALUES (13479, 9, 2);
INSERT INTO `item_mods` VALUES (13479, 58, 5);
INSERT INTO `item_mods` VALUES (13480, 13, 2);
INSERT INTO `item_mods` VALUES (13480, 59, 5);
INSERT INTO `item_mods` VALUES (13481, 10, 2);
INSERT INTO `item_mods` VALUES (13481, 57, 5);
INSERT INTO `item_mods` VALUES (13482, 5, 4);
INSERT INTO `item_mods` VALUES (13482, 61, 5);
INSERT INTO `item_mods` VALUES (13483, 14, 2);
INSERT INTO `item_mods` VALUES (13483, 60, 5);
INSERT INTO `item_mods` VALUES (13484, 11, 3);
INSERT INTO `item_mods` VALUES (13484, 56, 7);
INSERT INTO `item_mods` VALUES (13485, 8, 3);
INSERT INTO `item_mods` VALUES (13485, 54, 7);
INSERT INTO `item_mods` VALUES (13486, 12, 3);
INSERT INTO `item_mods` VALUES (13486, 55, 7);
INSERT INTO `item_mods` VALUES (13487, 9, 3);
INSERT INTO `item_mods` VALUES (13487, 58, 7);
INSERT INTO `item_mods` VALUES (13488, 13, 3);
INSERT INTO `item_mods` VALUES (13488, 59, 7);
INSERT INTO `item_mods` VALUES (13489, 10, 3);
INSERT INTO `item_mods` VALUES (13489, 57, 7);
INSERT INTO `item_mods` VALUES (13490, 5, 6);
INSERT INTO `item_mods` VALUES (13490, 61, 7);
INSERT INTO `item_mods` VALUES (13491, 14, 3);
INSERT INTO `item_mods` VALUES (13491, 60, 7);
INSERT INTO `item_mods` VALUES (13492, 2, 2);
INSERT INTO `item_mods` VALUES (13492, 5, -1);
INSERT INTO `item_mods` VALUES (13493, 2, 3);
INSERT INTO `item_mods` VALUES (13493, 5, -2);
INSERT INTO `item_mods` VALUES (13494, 54, 3);
INSERT INTO `item_mods` VALUES (13494, 59, 3);
INSERT INTO `item_mods` VALUES (13495, 1, 2);
INSERT INTO `item_mods` VALUES (13495, 8, 1);
INSERT INTO `item_mods` VALUES (13495, 13, 1);
INSERT INTO `item_mods` VALUES (13496, 5, 3);
INSERT INTO `item_mods` VALUES (13496, 11, 1);
INSERT INTO `item_mods` VALUES (13496, 12, 1);
INSERT INTO `item_mods` VALUES (13497, 2, 3);
INSERT INTO `item_mods` VALUES (13497, 9, 1);
INSERT INTO `item_mods` VALUES (13497, 10, 1);
INSERT INTO `item_mods` VALUES (13498, 2, 9);
INSERT INTO `item_mods` VALUES (13498, 5, -7);
INSERT INTO `item_mods` VALUES (13499, 1, 2);
INSERT INTO `item_mods` VALUES (13500, 25, -2);
INSERT INTO `item_mods` VALUES (13500, 26, 3);
INSERT INTO `item_mods` VALUES (13501, 25, -3);
INSERT INTO `item_mods` VALUES (13501, 26, 4);
INSERT INTO `item_mods` VALUES (13502, 25, -4);
INSERT INTO `item_mods` VALUES (13502, 26, 5);
INSERT INTO `item_mods` VALUES (13503, 25, -6);
INSERT INTO `item_mods` VALUES (13503, 26, 7);
INSERT INTO `item_mods` VALUES (13504, 25, -8);
INSERT INTO `item_mods` VALUES (13504, 26, 10);
INSERT INTO `item_mods` VALUES (13504, 163, -10);
INSERT INTO `item_mods` VALUES (13505, 1, 20);
INSERT INTO `item_mods` VALUES (13505, 387, -100);
INSERT INTO `item_mods` VALUES (13505, 388, -100);
INSERT INTO `item_mods` VALUES (13505, 389, -256);
INSERT INTO `item_mods` VALUES (13505, 390, -100);
INSERT INTO `item_mods` VALUES (13506, 1, 2);
INSERT INTO `item_mods` VALUES (13506, 2, 15);
INSERT INTO `item_mods` VALUES (13506, 54, -5);
INSERT INTO `item_mods` VALUES (13507, 13, -3);
INSERT INTO `item_mods` VALUES (13507, 14, -3);
INSERT INTO `item_mods` VALUES (13507, 59, 10);
INSERT INTO `item_mods` VALUES (13508, 10, -3);
INSERT INTO `item_mods` VALUES (13508, 14, -3);
INSERT INTO `item_mods` VALUES (13508, 57, 10);
INSERT INTO `item_mods` VALUES (13509, 12, -3);
INSERT INTO `item_mods` VALUES (13509, 14, -3);
INSERT INTO `item_mods` VALUES (13509, 55, 10);
INSERT INTO `item_mods` VALUES (13510, 8, -3);
INSERT INTO `item_mods` VALUES (13510, 14, -3);
INSERT INTO `item_mods` VALUES (13510, 54, 10);
INSERT INTO `item_mods` VALUES (13511, 9, -3);
INSERT INTO `item_mods` VALUES (13511, 14, -3);
INSERT INTO `item_mods` VALUES (13511, 58, 10);
INSERT INTO `item_mods` VALUES (13512, 11, -3);
INSERT INTO `item_mods` VALUES (13512, 14, -3);
INSERT INTO `item_mods` VALUES (13512, 56, 10);
INSERT INTO `item_mods` VALUES (13513, 25, -6);
INSERT INTO `item_mods` VALUES (13513, 26, 8);
INSERT INTO `item_mods` VALUES (13514, 25, 2);
INSERT INTO `item_mods` VALUES (13514, 26, 2);
INSERT INTO `item_mods` VALUES (13515, 2, -20);
INSERT INTO `item_mods` VALUES (13515, 5, 20);
INSERT INTO `item_mods` VALUES (13516, 1, 10);
INSERT INTO `item_mods` VALUES (13518, 2, 4);
INSERT INTO `item_mods` VALUES (13518, 5, -4);
INSERT INTO `item_mods` VALUES (13519, 2, 5);
INSERT INTO `item_mods` VALUES (13519, 5, -5);
INSERT INTO `item_mods` VALUES (13520, 2, 6);
INSERT INTO `item_mods` VALUES (13520, 5, -6);
INSERT INTO `item_mods` VALUES (13521, 11, 2);
INSERT INTO `item_mods` VALUES (13521, 56, 4);
INSERT INTO `item_mods` VALUES (13522, 8, 2);
INSERT INTO `item_mods` VALUES (13522, 54, 4);
INSERT INTO `item_mods` VALUES (13523, 12, 2);
INSERT INTO `item_mods` VALUES (13523, 55, 4);
INSERT INTO `item_mods` VALUES (13524, 9, 2);
INSERT INTO `item_mods` VALUES (13524, 58, 4);
INSERT INTO `item_mods` VALUES (13525, 13, 2);
INSERT INTO `item_mods` VALUES (13525, 59, 4);
INSERT INTO `item_mods` VALUES (13526, 10, 2);
INSERT INTO `item_mods` VALUES (13526, 57, 4);
INSERT INTO `item_mods` VALUES (13527, 5, 3);
INSERT INTO `item_mods` VALUES (13527, 61, 4);
INSERT INTO `item_mods` VALUES (13528, 14, 2);
INSERT INTO `item_mods` VALUES (13528, 60, 4);
INSERT INTO `item_mods` VALUES (13529, 11, 3);
INSERT INTO `item_mods` VALUES (13529, 56, 6);
INSERT INTO `item_mods` VALUES (13530, 8, 3);
INSERT INTO `item_mods` VALUES (13530, 54, 6);
INSERT INTO `item_mods` VALUES (13531, 12, 3);
INSERT INTO `item_mods` VALUES (13531, 55, 6);
INSERT INTO `item_mods` VALUES (13532, 9, 3);
INSERT INTO `item_mods` VALUES (13532, 58, 6);
INSERT INTO `item_mods` VALUES (13533, 13, 3);
INSERT INTO `item_mods` VALUES (13533, 59, 6);
INSERT INTO `item_mods` VALUES (13534, 10, 3);
INSERT INTO `item_mods` VALUES (13534, 57, 6);
INSERT INTO `item_mods` VALUES (13535, 5, 5);
INSERT INTO `item_mods` VALUES (13535, 61, 6);
INSERT INTO `item_mods` VALUES (13536, 14, 3);
INSERT INTO `item_mods` VALUES (13536, 60, 6);
INSERT INTO `item_mods` VALUES (13537, 11, 4);
INSERT INTO `item_mods` VALUES (13537, 56, 8);
INSERT INTO `item_mods` VALUES (13538, 8, 4);
INSERT INTO `item_mods` VALUES (13538, 54, 8);
INSERT INTO `item_mods` VALUES (13539, 12, 4);
INSERT INTO `item_mods` VALUES (13539, 55, 8);
INSERT INTO `item_mods` VALUES (13540, 9, 4);
INSERT INTO `item_mods` VALUES (13540, 58, 8);
INSERT INTO `item_mods` VALUES (13541, 13, 4);
INSERT INTO `item_mods` VALUES (13541, 59, 8);
INSERT INTO `item_mods` VALUES (13542, 10, 4);
INSERT INTO `item_mods` VALUES (13542, 57, 8);
INSERT INTO `item_mods` VALUES (13543, 5, 7);
INSERT INTO `item_mods` VALUES (13543, 61, 8);
INSERT INTO `item_mods` VALUES (13544, 14, 4);
INSERT INTO `item_mods` VALUES (13544, 60, 8);
INSERT INTO `item_mods` VALUES (13545, 1, 3);
INSERT INTO `item_mods` VALUES (13545, 2, 13);
INSERT INTO `item_mods` VALUES (13545, 5, 13);
INSERT INTO `item_mods` VALUES (13545, 60, -20);
INSERT INTO `item_mods` VALUES (13545, 61, 13);
INSERT INTO `item_mods` VALUES (13546, 1, 2);
INSERT INTO `item_mods` VALUES (13546, 11, 1);
INSERT INTO `item_mods` VALUES (13547, 1, 3);
INSERT INTO `item_mods` VALUES (13547, 11, 2);
INSERT INTO `item_mods` VALUES (13547, 23, 2);
INSERT INTO `item_mods` VALUES (13548, 7, 25);
INSERT INTO `item_mods` VALUES (13549, 7, 30);
INSERT INTO `item_mods` VALUES (13550, 1, -14);
INSERT INTO `item_mods` VALUES (13550, 24, 5);
INSERT INTO `item_mods` VALUES (13551, 8, 3);
INSERT INTO `item_mods` VALUES (13551, 23, 3);
INSERT INTO `item_mods` VALUES (13552, 1, 3);
INSERT INTO `item_mods` VALUES (13552, 7, 50);
INSERT INTO `item_mods` VALUES (13553, 384, 11);
INSERT INTO `item_mods` VALUES (13554, 1, 5);
INSERT INTO `item_mods` VALUES (13555, 7, 10);
INSERT INTO `item_mods` VALUES (13555, 27, -1);
INSERT INTO `item_mods` VALUES (13556, 1, 3);
INSERT INTO `item_mods` VALUES (13556, 2, 12);
INSERT INTO `item_mods` VALUES (13556, 25, -10);
INSERT INTO `item_mods` VALUES (13556, 26, 12);
INSERT INTO `item_mods` VALUES (13560, 1, 2);
INSERT INTO `item_mods` VALUES (13561, 1, 2);
INSERT INTO `item_mods` VALUES (13562, 1, 2);
INSERT INTO `item_mods` VALUES (13563, 1, 2);
INSERT INTO `item_mods` VALUES (13564, 1, 2);
INSERT INTO `item_mods` VALUES (13565, 1, 2);
INSERT INTO `item_mods` VALUES (13566, 160, -10);
INSERT INTO `item_mods` VALUES (13567, 2, 75);
INSERT INTO `item_mods` VALUES (13567, 54, -75);
INSERT INTO `item_mods` VALUES (13568, 54, 2);
INSERT INTO `item_mods` VALUES (13568, 55, 2);
INSERT INTO `item_mods` VALUES (13568, 56, 2);
INSERT INTO `item_mods` VALUES (13568, 57, 2);
INSERT INTO `item_mods` VALUES (13568, 58, 2);
INSERT INTO `item_mods` VALUES (13568, 59, 2);
INSERT INTO `item_mods` VALUES (13568, 60, 2);
INSERT INTO `item_mods` VALUES (13568, 61, 2);
INSERT INTO `item_mods` VALUES (13569, 54, 4);
INSERT INTO `item_mods` VALUES (13569, 55, 4);
INSERT INTO `item_mods` VALUES (13569, 56, 4);
INSERT INTO `item_mods` VALUES (13569, 57, 4);
INSERT INTO `item_mods` VALUES (13569, 58, 4);
INSERT INTO `item_mods` VALUES (13569, 59, 4);
INSERT INTO `item_mods` VALUES (13569, 60, 4);
INSERT INTO `item_mods` VALUES (13569, 61, 4);
INSERT INTO `item_mods` VALUES (13570, 1, 5);
INSERT INTO `item_mods` VALUES (13570, 55, 5);
INSERT INTO `item_mods` VALUES (13571, 1, 4);
INSERT INTO `item_mods` VALUES (13571, 60, 4);
INSERT INTO `item_mods` VALUES (13574, 54, 12);
INSERT INTO `item_mods` VALUES (13574, 55, 12);
INSERT INTO `item_mods` VALUES (13574, 56, 12);
INSERT INTO `item_mods` VALUES (13574, 57, 12);
INSERT INTO `item_mods` VALUES (13574, 58, 12);
INSERT INTO `item_mods` VALUES (13574, 59, 12);
INSERT INTO `item_mods` VALUES (13574, 60, 12);
INSERT INTO `item_mods` VALUES (13574, 61, 12);
INSERT INTO `item_mods` VALUES (13575, 1, 6);
INSERT INTO `item_mods` VALUES (13575, 55, 6);
INSERT INTO `item_mods` VALUES (13576, 1, 3);
INSERT INTO `item_mods` VALUES (13576, 61, 3);
INSERT INTO `item_mods` VALUES (13576, 68, 3);
INSERT INTO `item_mods` VALUES (13577, 1, 3);
INSERT INTO `item_mods` VALUES (13577, 12, 2);
INSERT INTO `item_mods` VALUES (13578, 1, 6);
INSERT INTO `item_mods` VALUES (13578, 5, 15);
INSERT INTO `item_mods` VALUES (13578, 7, 15);
INSERT INTO `item_mods` VALUES (13578, 54, -10);
INSERT INTO `item_mods` VALUES (13578, 55, 5);
INSERT INTO `item_mods` VALUES (13578, 56, 5);
INSERT INTO `item_mods` VALUES (13578, 57, 5);
INSERT INTO `item_mods` VALUES (13578, 58, -10);
INSERT INTO `item_mods` VALUES (13578, 59, 5);
INSERT INTO `item_mods` VALUES (13578, 60, 5);
INSERT INTO `item_mods` VALUES (13578, 61, 5);
INSERT INTO `item_mods` VALUES (13579, 1, 5);
INSERT INTO `item_mods` VALUES (13579, 14, 7);
INSERT INTO `item_mods` VALUES (13580, 1, 9);
INSERT INTO `item_mods` VALUES (13580, 8, 2);
INSERT INTO `item_mods` VALUES (13580, 13, 2);
INSERT INTO `item_mods` VALUES (13581, 1, 6);
INSERT INTO `item_mods` VALUES (13581, 5, 6);
INSERT INTO `item_mods` VALUES (13581, 11, 2);
INSERT INTO `item_mods` VALUES (13581, 12, 2);
INSERT INTO `item_mods` VALUES (13582, 1, 6);
INSERT INTO `item_mods` VALUES (13582, 2, 6);
INSERT INTO `item_mods` VALUES (13582, 9, 2);
INSERT INTO `item_mods` VALUES (13582, 10, 2);
INSERT INTO `item_mods` VALUES (13583, 1, 1);
INSERT INTO `item_mods` VALUES (13584, 1, 2);
INSERT INTO `item_mods` VALUES (13585, 1, 3);
INSERT INTO `item_mods` VALUES (13585, 13, 2);
INSERT INTO `item_mods` VALUES (13586, 1, 4);
INSERT INTO `item_mods` VALUES (13586, 12, 2);
INSERT INTO `item_mods` VALUES (13586, 13, 2);
INSERT INTO `item_mods` VALUES (13587, 1, 7);
INSERT INTO `item_mods` VALUES (13587, 2, 9);
INSERT INTO `item_mods` VALUES (13587, 5, 9);
INSERT INTO `item_mods` VALUES (13587, 12, 3);
INSERT INTO `item_mods` VALUES (13587, 13, 3);
INSERT INTO `item_mods` VALUES (13587, 14, 3);
INSERT INTO `item_mods` VALUES (13588, 1, 3);
INSERT INTO `item_mods` VALUES (13589, 1, 9);
INSERT INTO `item_mods` VALUES (13590, 54, 8);
INSERT INTO `item_mods` VALUES (13590, 55, 8);
INSERT INTO `item_mods` VALUES (13590, 56, 8);
INSERT INTO `item_mods` VALUES (13590, 57, 8);
INSERT INTO `item_mods` VALUES (13590, 58, 8);
INSERT INTO `item_mods` VALUES (13590, 59, 8);
INSERT INTO `item_mods` VALUES (13590, 60, 8);
INSERT INTO `item_mods` VALUES (13590, 61, 8);
INSERT INTO `item_mods` VALUES (13591, 1, 12);
INSERT INTO `item_mods` VALUES (13591, 2, 20);
INSERT INTO `item_mods` VALUES (13591, 23, 5);
INSERT INTO `item_mods` VALUES (13592, 1, 2);
INSERT INTO `item_mods` VALUES (13593, 1, 6);
INSERT INTO `item_mods` VALUES (13593, 54, 3);
INSERT INTO `item_mods` VALUES (13593, 59, -1);
INSERT INTO `item_mods` VALUES (13594, 1, 1);
INSERT INTO `item_mods` VALUES (13595, 1, 8);
INSERT INTO `item_mods` VALUES (13595, 3, -1);
INSERT INTO `item_mods` VALUES (13595, 68, 3);
INSERT INTO `item_mods` VALUES (13596, 1, 4);
INSERT INTO `item_mods` VALUES (13596, 55, 3);
INSERT INTO `item_mods` VALUES (13596, 56, 3);
INSERT INTO `item_mods` VALUES (13596, 57, 3);
INSERT INTO `item_mods` VALUES (13596, 59, 3);
INSERT INTO `item_mods` VALUES (13597, 1, 8);
INSERT INTO `item_mods` VALUES (13597, 10, 1);
INSERT INTO `item_mods` VALUES (13597, 57, 5);
INSERT INTO `item_mods` VALUES (13598, 1, 6);
INSERT INTO `item_mods` VALUES (13598, 61, 5);
INSERT INTO `item_mods` VALUES (13598, 68, 5);
INSERT INTO `item_mods` VALUES (13599, 1, 2);
INSERT INTO `item_mods` VALUES (13600, 1, 4);
INSERT INTO `item_mods` VALUES (13601, 1, 3);
INSERT INTO `item_mods` VALUES (13602, 1, 10);
INSERT INTO `item_mods` VALUES (13603, 1, 9);
INSERT INTO `item_mods` VALUES (13603, 3, -1);
INSERT INTO `item_mods` VALUES (13603, 68, 4);
INSERT INTO `item_mods` VALUES (13604, 1, 13);
INSERT INTO `item_mods` VALUES (13604, 2, 30);
INSERT INTO `item_mods` VALUES (13604, 23, 10);
INSERT INTO `item_mods` VALUES (13605, 1, 2);
INSERT INTO `item_mods` VALUES (13606, 1, 30);
INSERT INTO `item_mods` VALUES (13607, 1, 3);
INSERT INTO `item_mods` VALUES (13607, 13, 1);
INSERT INTO `item_mods` VALUES (13607, 60, 3);
INSERT INTO `item_mods` VALUES (13608, 1, 3);
INSERT INTO `item_mods` VALUES (13609, 1, 5);
INSERT INTO `item_mods` VALUES (13609, 54, 3);
INSERT INTO `item_mods` VALUES (13609, 55, 3);
INSERT INTO `item_mods` VALUES (13609, 56, 3);
INSERT INTO `item_mods` VALUES (13609, 57, 3);
INSERT INTO `item_mods` VALUES (13609, 58, 3);
INSERT INTO `item_mods` VALUES (13609, 59, 3);
INSERT INTO `item_mods` VALUES (13609, 60, 3);
INSERT INTO `item_mods` VALUES (13610, 1, 4);
INSERT INTO `item_mods` VALUES (13610, 12, 3);
INSERT INTO `item_mods` VALUES (13611, 1, 5);
INSERT INTO `item_mods` VALUES (13611, 12, 3);
INSERT INTO `item_mods` VALUES (13611, 13, 3);
INSERT INTO `item_mods` VALUES (13612, 1, 7);
INSERT INTO `item_mods` VALUES (13612, 54, 4);
INSERT INTO `item_mods` VALUES (13612, 59, -1);
INSERT INTO `item_mods` VALUES (13613, 1, 1);
INSERT INTO `item_mods` VALUES (13613, 68, 3);
INSERT INTO `item_mods` VALUES (13614, 1, 2);
INSERT INTO `item_mods` VALUES (13614, 5, 3);
INSERT INTO `item_mods` VALUES (13615, 1, 6);
INSERT INTO `item_mods` VALUES (13615, 68, -5);
INSERT INTO `item_mods` VALUES (13616, 1, 4);
INSERT INTO `item_mods` VALUES (13616, 68, 5);
INSERT INTO `item_mods` VALUES (13617, 1, 7);
INSERT INTO `item_mods` VALUES (13617, 58, 6);
INSERT INTO `item_mods` VALUES (13618, 1, 4);
INSERT INTO `item_mods` VALUES (13618, 13, 3);
INSERT INTO `item_mods` VALUES (13619, 1, 3);
INSERT INTO `item_mods` VALUES (13619, 10, 2);
INSERT INTO `item_mods` VALUES (13620, 1, 6);
INSERT INTO `item_mods` VALUES (13620, 14, 10);
INSERT INTO `item_mods` VALUES (13621, 1, 9);
INSERT INTO `item_mods` VALUES (13621, 10, 2);
INSERT INTO `item_mods` VALUES (13621, 57, 7);
INSERT INTO `item_mods` VALUES (13622, 27, -3);
INSERT INTO `item_mods` VALUES (13623, 1, 6);
INSERT INTO `item_mods` VALUES (13623, 10, 1);
INSERT INTO `item_mods` VALUES (13623, 57, 5);
INSERT INTO `item_mods` VALUES (13623, 58, 5);
INSERT INTO `item_mods` VALUES (13624, 1, 8);
INSERT INTO `item_mods` VALUES (13624, 2, 10);
INSERT INTO `item_mods` VALUES (13624, 5, 10);
INSERT INTO `item_mods` VALUES (13625, 1, 4);
INSERT INTO `item_mods` VALUES (13625, 5, 5);
INSERT INTO `item_mods` VALUES (13625, 55, 5);
INSERT INTO `item_mods` VALUES (13625, 56, 5);
INSERT INTO `item_mods` VALUES (13626, 1, 7);
INSERT INTO `item_mods` VALUES (13626, 5, 20);
INSERT INTO `item_mods` VALUES (13626, 7, 20);
INSERT INTO `item_mods` VALUES (13626, 54, -8);
INSERT INTO `item_mods` VALUES (13626, 55, 7);
INSERT INTO `item_mods` VALUES (13626, 56, 7);
INSERT INTO `item_mods` VALUES (13626, 57, 7);
INSERT INTO `item_mods` VALUES (13626, 58, -8);
INSERT INTO `item_mods` VALUES (13626, 59, 7);
INSERT INTO `item_mods` VALUES (13626, 60, 7);
INSERT INTO `item_mods` VALUES (13626, 61, 7);
INSERT INTO `item_mods` VALUES (13627, 1, 8);
INSERT INTO `item_mods` VALUES (13627, 2, 10);
INSERT INTO `item_mods` VALUES (13627, 5, 10);
INSERT INTO `item_mods` VALUES (13627, 12, 4);
INSERT INTO `item_mods` VALUES (13627, 13, 4);
INSERT INTO `item_mods` VALUES (13627, 14, 4);
INSERT INTO `item_mods` VALUES (13628, 1, 5);
INSERT INTO `item_mods` VALUES (13628, 5, 8);
INSERT INTO `item_mods` VALUES (13628, 160, -3);
INSERT INTO `item_mods` VALUES (13629, 27, -4);
INSERT INTO `item_mods` VALUES (13630, 27, -5);
INSERT INTO `item_mods` VALUES (13631, 1, 2);
INSERT INTO `item_mods` VALUES (13631, 11, 1);
INSERT INTO `item_mods` VALUES (13631, 68, 3);
INSERT INTO `item_mods` VALUES (13632, 1, 3);
INSERT INTO `item_mods` VALUES (13632, 11, 2);
INSERT INTO `item_mods` VALUES (13632, 68, 3);
INSERT INTO `item_mods` VALUES (13633, 1, 9);
INSERT INTO `item_mods` VALUES (13633, 2, 10);
INSERT INTO `item_mods` VALUES (13633, 3, 1);
INSERT INTO `item_mods` VALUES (13633, 5, 10);
INSERT INTO `item_mods` VALUES (13633, 6, 1);
INSERT INTO `item_mods` VALUES (13634, 1, 10);
INSERT INTO `item_mods` VALUES (13634, 2, 15);
INSERT INTO `item_mods` VALUES (13634, 3, 1);
INSERT INTO `item_mods` VALUES (13634, 5, 15);
INSERT INTO `item_mods` VALUES (13634, 6, 1);
INSERT INTO `item_mods` VALUES (13635, 1, 8);
INSERT INTO `item_mods` VALUES (13635, 10, 2);
INSERT INTO `item_mods` VALUES (13635, 68, -10);
INSERT INTO `item_mods` VALUES (13636, 1, 9);
INSERT INTO `item_mods` VALUES (13636, 10, 3);
INSERT INTO `item_mods` VALUES (13636, 68, -10);
INSERT INTO `item_mods` VALUES (13637, 1, 7);
INSERT INTO `item_mods` VALUES (13637, 10, 1);
INSERT INTO `item_mods` VALUES (13637, 57, 10);
INSERT INTO `item_mods` VALUES (13637, 58, 10);
INSERT INTO `item_mods` VALUES (13638, 1, 8);
INSERT INTO `item_mods` VALUES (13638, 10, 2);
INSERT INTO `item_mods` VALUES (13638, 57, 12);
INSERT INTO `item_mods` VALUES (13638, 58, 12);
INSERT INTO `item_mods` VALUES (13639, 1, 5);
INSERT INTO `item_mods` VALUES (13639, 5, 10);
INSERT INTO `item_mods` VALUES (13639, 55, 7);
INSERT INTO `item_mods` VALUES (13639, 56, 7);
INSERT INTO `item_mods` VALUES (13640, 1, 6);
INSERT INTO `item_mods` VALUES (13640, 5, 12);
INSERT INTO `item_mods` VALUES (13640, 55, 8);
INSERT INTO `item_mods` VALUES (13640, 56, 8);
INSERT INTO `item_mods` VALUES (13641, 1, 9);
INSERT INTO `item_mods` VALUES (13641, 8, 1);
INSERT INTO `item_mods` VALUES (13641, 61, 8);
INSERT INTO `item_mods` VALUES (13642, 1, 10);
INSERT INTO `item_mods` VALUES (13642, 8, 1);
INSERT INTO `item_mods` VALUES (13642, 61, 10);
INSERT INTO `item_mods` VALUES (13643, 1, 3);
INSERT INTO `item_mods` VALUES (13643, 61, 5);
INSERT INTO `item_mods` VALUES (13643, 68, 3);
INSERT INTO `item_mods` VALUES (13644, 1, 4);
INSERT INTO `item_mods` VALUES (13644, 61, 6);
INSERT INTO `item_mods` VALUES (13644, 68, 4);
INSERT INTO `item_mods` VALUES (13645, 1, 7);
INSERT INTO `item_mods` VALUES (13645, 8, 1);
INSERT INTO `item_mods` VALUES (13645, 23, 10);
INSERT INTO `item_mods` VALUES (13645, 24, 10);
INSERT INTO `item_mods` VALUES (13646, 1, 8);
INSERT INTO `item_mods` VALUES (13646, 8, 2);
INSERT INTO `item_mods` VALUES (13646, 23, 15);
INSERT INTO `item_mods` VALUES (13646, 24, 15);
INSERT INTO `item_mods` VALUES (13647, 1, 5);
INSERT INTO `item_mods` VALUES (13647, 2, -30);
INSERT INTO `item_mods` VALUES (13647, 23, -10);
INSERT INTO `item_mods` VALUES (13647, 25, 10);
INSERT INTO `item_mods` VALUES (13648, 1, 4);
INSERT INTO `item_mods` VALUES (13648, 2, 80);
INSERT INTO `item_mods` VALUES (13649, 1, 5);
INSERT INTO `item_mods` VALUES (13649, 61, 13);
INSERT INTO `item_mods` VALUES (13649, 68, 4);
INSERT INTO `item_mods` VALUES (13650, 1, 6);
INSERT INTO `item_mods` VALUES (13650, 61, 14);
INSERT INTO `item_mods` VALUES (13650, 68, 5);
INSERT INTO `item_mods` VALUES (13651, 1, 5);
INSERT INTO `item_mods` VALUES (13651, 61, 13);
INSERT INTO `item_mods` VALUES (13651, 161, -5);
INSERT INTO `item_mods` VALUES (13652, 1, 6);
INSERT INTO `item_mods` VALUES (13652, 61, 14);
INSERT INTO `item_mods` VALUES (13652, 161, -6);
INSERT INTO `item_mods` VALUES (13653, 1, 8);
INSERT INTO `item_mods` VALUES (13653, 2, 10);
INSERT INTO `item_mods` VALUES (13654, 1, 9);
INSERT INTO `item_mods` VALUES (13654, 2, 15);
INSERT INTO `item_mods` VALUES (13655, 1, 8);
INSERT INTO `item_mods` VALUES (13655, 23, 5);
INSERT INTO `item_mods` VALUES (13656, 1, 9);
INSERT INTO `item_mods` VALUES (13656, 5, 30);
INSERT INTO `item_mods` VALUES (13656, 27, -5);
INSERT INTO `item_mods` VALUES (13657, 1, 10);
INSERT INTO `item_mods` VALUES (13657, 5, 32);
INSERT INTO `item_mods` VALUES (13657, 27, -6);

-- -------------------------------------------------------
-- Shadow Mantle
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (13658, 1, 15);-- Defence
INSERT INTO `item_mods` VALUES (13658, 416, 15);-- Physical null damage chance

-- -------------------------------------------------------
-- Mercen. Mantle
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (13659, 1, 2); -- DEF:2

-- -------------------------------------------------------
-- Wrestler's Mantle
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (13660, 1, 2); -- DEF:2

INSERT INTO `item_mods` VALUES (13661, 1, 2);
INSERT INTO `item_mods` VALUES (13662, 1, 2);
INSERT INTO `item_mods` VALUES (13663, 1, 2);
INSERT INTO `item_mods` VALUES (13664, 1, 2);
INSERT INTO `item_mods` VALUES (13665, 1, 2);
INSERT INTO `item_mods` VALUES (13666, 1, 2);
INSERT INTO `item_mods` VALUES (13667, 1, 2);
INSERT INTO `item_mods` VALUES (13668, 1, 2);
INSERT INTO `item_mods` VALUES (13669, 1, 2);
INSERT INTO `item_mods` VALUES (13669, 359, 5);
INSERT INTO `item_mods` VALUES (13670, 1, 2);
INSERT INTO `item_mods` VALUES (13671, 1, 2);
INSERT INTO `item_mods` VALUES (13672, 1, 2);
INSERT INTO `item_mods` VALUES (13673, 1, 2);
INSERT INTO `item_mods` VALUES (13674, 1, 5);
INSERT INTO `item_mods` VALUES (13674, 11, 1);
INSERT INTO `item_mods` VALUES (13674, 25, 1);
INSERT INTO `item_mods` VALUES (13675, 1, 4);
INSERT INTO `item_mods` VALUES (13675, 8, 1);
INSERT INTO `item_mods` VALUES (13675, 10, 1);
INSERT INTO `item_mods` VALUES (13676, 1, 9);
INSERT INTO `item_mods` VALUES (13677, 1, 2);
INSERT INTO `item_mods` VALUES (13677, 5, 7);
INSERT INTO `item_mods` VALUES (13677, 27, -1);
INSERT INTO `item_mods` VALUES (13678, 1, 4);
INSERT INTO `item_mods` VALUES (13678, 23, 2);
INSERT INTO `item_mods` VALUES (13678, 24, 1);
INSERT INTO `item_mods` VALUES (13679, 1, 5);
INSERT INTO `item_mods` VALUES (13679, 5, 20);
INSERT INTO `item_mods` VALUES (13685, 1, 4);
INSERT INTO `item_mods` VALUES (13685, 60, 4);
INSERT INTO `item_mods` VALUES (13686, 1, 4);
INSERT INTO `item_mods` VALUES (13686, 23, 3);
INSERT INTO `item_mods` VALUES (13686, 68, 1);
INSERT INTO `item_mods` VALUES (13687, 1, 4);
INSERT INTO `item_mods` VALUES (13687, 12, 2);
INSERT INTO `item_mods` VALUES (13687, 13, 2);
INSERT INTO `item_mods` VALUES (13687, 27, -2);
INSERT INTO `item_mods` VALUES (13688, 1, 1);
INSERT INTO `item_mods` VALUES (13689, 1, 1);
INSERT INTO `item_mods` VALUES (13690, 1, 7);
INSERT INTO `item_mods` VALUES (13690, 8, 3);
INSERT INTO `item_mods` VALUES (13690, 23, 15);
INSERT INTO `item_mods` VALUES (13691, 1, 12);
INSERT INTO `item_mods` VALUES (13691, 10, 4);
INSERT INTO `item_mods` VALUES (13692, 1, 4);
INSERT INTO `item_mods` VALUES (13693, 1, 6);
INSERT INTO `item_mods` VALUES (13694, 1, 6);
INSERT INTO `item_mods` VALUES (13694, 23, 12);
INSERT INTO `item_mods` VALUES (13694, 24, 12);
INSERT INTO `item_mods` VALUES (13694, 25, 1);
INSERT INTO `item_mods` VALUES (13694, 26, 1);
INSERT INTO `item_mods` VALUES (13695, 1, 8);
INSERT INTO `item_mods` VALUES (13695, 8, 3);
INSERT INTO `item_mods` VALUES (13695, 9, 3);
INSERT INTO `item_mods` VALUES (13695, 11, 3);
INSERT INTO `item_mods` VALUES (13696, 1, 32);
INSERT INTO `item_mods` VALUES (13697, 1, 16);
INSERT INTO `item_mods` VALUES (13698, 1, 21);
INSERT INTO `item_mods` VALUES (13698, 10, 1);
INSERT INTO `item_mods` VALUES (13698, 57, 4);
INSERT INTO `item_mods` VALUES (13699, 1, 42);
INSERT INTO `item_mods` VALUES (13699, 10, 1);
INSERT INTO `item_mods` VALUES (13699, 57, 5);
INSERT INTO `item_mods` VALUES (13700, 1, 14);
INSERT INTO `item_mods` VALUES (13700, 10, 1);
INSERT INTO `item_mods` VALUES (13700, 57, 3);
INSERT INTO `item_mods` VALUES (13701, 1, 22);
INSERT INTO `item_mods` VALUES (13701, 10, 1);
INSERT INTO `item_mods` VALUES (13701, 57, 6);
INSERT INTO `item_mods` VALUES (13702, 1, 12);
INSERT INTO `item_mods` VALUES (13702, 10, 1);
INSERT INTO `item_mods` VALUES (13702, 57, 3);
INSERT INTO `item_mods` VALUES (13703, 1, 32);
INSERT INTO `item_mods` VALUES (13703, 2, 10);
INSERT INTO `item_mods` VALUES (13703, 9, 2);
INSERT INTO `item_mods` VALUES (13703, 10, 2);
INSERT INTO `item_mods` VALUES (13704, 1, 23);
INSERT INTO `item_mods` VALUES (13704, 5, 15);
INSERT INTO `item_mods` VALUES (13704, 12, -5);
INSERT INTO `item_mods` VALUES (13704, 14, 3);
INSERT INTO `item_mods` VALUES (13704, 23, 10);

-- ------------------------------------------
-- Ogre Jerkin
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (13705, 1, 43);
INSERT INTO `item_mods` VALUES (13705, 2, 40);
INSERT INTO `item_mods` VALUES (13705, 10, 6);
INSERT INTO `item_mods` VALUES (13705, 25, -3);
INSERT INTO `item_mods` VALUES (13705, 499, 2); -- ice spikes
INSERT INTO `item_mods` VALUES (13705, 500, 20); -- spikes dmg
INSERT INTO `item_mods` VALUES (13705, 501, 25); -- spikes proc rate

INSERT INTO `item_mods` VALUES (13706, 1, 16);
INSERT INTO `item_mods` VALUES (13706, 5, 12);
INSERT INTO `item_mods` VALUES (13706, 8, 6);
INSERT INTO `item_mods` VALUES (13706, 9, -3);
INSERT INTO `item_mods` VALUES (13706, 364, 10);
INSERT INTO `item_mods` VALUES (13707, 1, 23);
INSERT INTO `item_mods` VALUES (13708, 1, 13);
INSERT INTO `item_mods` VALUES (13708, 5, 13);
INSERT INTO `item_mods` VALUES (13708, 13, 3);
INSERT INTO `item_mods` VALUES (13708, 23, 10);
INSERT INTO `item_mods` VALUES (13708, 68, -5);
INSERT INTO `item_mods` VALUES (13709, 1, 29);
INSERT INTO `item_mods` VALUES (13710, 1, 33);
INSERT INTO `item_mods` VALUES (13710, 2, 15);
INSERT INTO `item_mods` VALUES (13710, 8, 1);
INSERT INTO `item_mods` VALUES (13710, 9, 3);
INSERT INTO `item_mods` VALUES (13710, 10, 3);
INSERT INTO `item_mods` VALUES (13710, 11, 1);
INSERT INTO `item_mods` VALUES (13710, 12, 1);
INSERT INTO `item_mods` VALUES (13710, 13, 1);
INSERT INTO `item_mods` VALUES (13710, 14, 1);
INSERT INTO `item_mods` VALUES (13711, 1, 16);
INSERT INTO `item_mods` VALUES (13712, 1, 31);
INSERT INTO `item_mods` VALUES (13713, 1, 10);
INSERT INTO `item_mods` VALUES (13714, 1, 32);
INSERT INTO `item_mods` VALUES (13714, 58, -3);
INSERT INTO `item_mods` VALUES (13714, 68, 1);
INSERT INTO `item_mods` VALUES (13715, 1, 9);
INSERT INTO `item_mods` VALUES (13716, 1, 15);
INSERT INTO `item_mods` VALUES (13716, 54, -3);
INSERT INTO `item_mods` VALUES (13716, 68, 1);
INSERT INTO `item_mods` VALUES (13717, 1, 18);
INSERT INTO `item_mods` VALUES (13717, 55, -3);
INSERT INTO `item_mods` VALUES (13717, 68, 1);
INSERT INTO `item_mods` VALUES (13718, 1, 12);
INSERT INTO `item_mods` VALUES (13718, 11, 1);
INSERT INTO `item_mods` VALUES (13718, 12, 1);
INSERT INTO `item_mods` VALUES (13719, 1, 26);
INSERT INTO `item_mods` VALUES (13719, 5, 10);
INSERT INTO `item_mods` VALUES (13720, 1, 40);
INSERT INTO `item_mods` VALUES (13720, 60, 12);
INSERT INTO `item_mods` VALUES (13720, 61, 12);
INSERT INTO `item_mods` VALUES (13721, 1, 27);
INSERT INTO `item_mods` VALUES (13721, 24, 3);
INSERT INTO `item_mods` VALUES (13721, 26, 3);
INSERT INTO `item_mods` VALUES (13722, 1, 36);
INSERT INTO `item_mods` VALUES (13722, 61, 12);
INSERT INTO `item_mods` VALUES (13722, 68, 5);
INSERT INTO `item_mods` VALUES (13723, 1, 29);
INSERT INTO `item_mods` VALUES (13723, 5, 8);
INSERT INTO `item_mods` VALUES (13723, 54, 4);
INSERT INTO `item_mods` VALUES (13724, 1, 33);
INSERT INTO `item_mods` VALUES (13725, 1, 19);
INSERT INTO `item_mods` VALUES (13725, 12, 2);
INSERT INTO `item_mods` VALUES (13725, 61, 3);
INSERT INTO `item_mods` VALUES (13726, 1, 25);
INSERT INTO `item_mods` VALUES (13726, 5, 3);
INSERT INTO `item_mods` VALUES (13726, 12, 1);
INSERT INTO `item_mods` VALUES (13727, 1, 36);
INSERT INTO `item_mods` VALUES (13727, 54, 4);
INSERT INTO `item_mods` VALUES (13727, 59, -1);
INSERT INTO `item_mods` VALUES (13728, 1, 27);
INSERT INTO `item_mods` VALUES (13728, 25, 4);
INSERT INTO `item_mods` VALUES (13729, 1, 14);
INSERT INTO `item_mods` VALUES (13729, 13, 1);
INSERT INTO `item_mods` VALUES (13729, 61, 2);
INSERT INTO `item_mods` VALUES (13730, 1, 21);
INSERT INTO `item_mods` VALUES (13730, 5, 6);
INSERT INTO `item_mods` VALUES (13730, 55, 2);
INSERT INTO `item_mods` VALUES (13731, 1, 22);
INSERT INTO `item_mods` VALUES (13731, 2, 6);
INSERT INTO `item_mods` VALUES (13731, 54, 2);
INSERT INTO `item_mods` VALUES (13731, 55, 2);
INSERT INTO `item_mods` VALUES (13731, 56, 2);
INSERT INTO `item_mods` VALUES (13731, 57, 2);
INSERT INTO `item_mods` VALUES (13731, 58, 2);
INSERT INTO `item_mods` VALUES (13731, 59, 2);
INSERT INTO `item_mods` VALUES (13731, 60, 2);
INSERT INTO `item_mods` VALUES (13731, 61, 2);
INSERT INTO `item_mods` VALUES (13732, 1, 27);
INSERT INTO `item_mods` VALUES (13732, 10, 4);
INSERT INTO `item_mods` VALUES (13732, 57, 5);
INSERT INTO `item_mods` VALUES (13733, 1, 34);
INSERT INTO `item_mods` VALUES (13733, 68, 3);
INSERT INTO `item_mods` VALUES (13734, 1, 41);
INSERT INTO `item_mods` VALUES (13734, 2, 20);
INSERT INTO `item_mods` VALUES (13734, 25, 12);
INSERT INTO `item_mods` VALUES (13734, 55, -20);
INSERT INTO `item_mods` VALUES (13734, 59, 20);
INSERT INTO `item_mods` VALUES (13734, 61, 20);
INSERT INTO `item_mods` VALUES (13734, 68, 12);
INSERT INTO `item_mods` VALUES (13735, 1, 46);
INSERT INTO `item_mods` VALUES (13735, 8, 6);
INSERT INTO `item_mods` VALUES (13735, 9, 6);
INSERT INTO `item_mods` VALUES (13735, 11, -5);
INSERT INTO `item_mods` VALUES (13735, 23, 12);
INSERT INTO `item_mods` VALUES (13735, 25, 12);
INSERT INTO `item_mods` VALUES (13735, 68, -20);

-- -------------------------------------------------------
-- Stolid Breastplate
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (13736, 1, 35); -- DEF:35
INSERT INTO `item_mods` VALUES (13736, 10, 2); -- VIT+2
INSERT INTO `item_mods` VALUES (13736, 160, -1); -- Damage taken -1%

INSERT INTO `item_mods` VALUES (13737, 1, 40);
INSERT INTO `item_mods` VALUES (13737, 12, 1);
INSERT INTO `item_mods` VALUES (13737, 54, 4);
INSERT INTO `item_mods` VALUES (13737, 58, 3);
INSERT INTO `item_mods` VALUES (13738, 1, 49);
INSERT INTO `item_mods` VALUES (13738, 8, 1);
INSERT INTO `item_mods` VALUES (13738, 10, 3);
INSERT INTO `item_mods` VALUES (13738, 61, 7);
INSERT INTO `item_mods` VALUES (13739, 1, 43);
INSERT INTO `item_mods` VALUES (13739, 10, 2);
INSERT INTO `item_mods` VALUES (13739, 57, 7);
INSERT INTO `item_mods` VALUES (13740, 1, 46);
INSERT INTO `item_mods` VALUES (13740, 2, 25);
INSERT INTO `item_mods` VALUES (13740, 8, 3);
INSERT INTO `item_mods` VALUES (13740, 9, -3);
INSERT INTO `item_mods` VALUES (13740, 10, 3);
INSERT INTO `item_mods` VALUES (13740, 11, -3);
INSERT INTO `item_mods` VALUES (13740, 12, -3);
INSERT INTO `item_mods` VALUES (13740, 13, -3);
INSERT INTO `item_mods` VALUES (13740, 14, -3);
INSERT INTO `item_mods` VALUES (13740, 23, 20);
INSERT INTO `item_mods` VALUES (13741, 1, 47);
INSERT INTO `item_mods` VALUES (13741, 2, 30);
INSERT INTO `item_mods` VALUES (13741, 8, 5);
INSERT INTO `item_mods` VALUES (13741, 9, -3);
INSERT INTO `item_mods` VALUES (13741, 10, 5);
INSERT INTO `item_mods` VALUES (13741, 11, -3);
INSERT INTO `item_mods` VALUES (13741, 12, -3);
INSERT INTO `item_mods` VALUES (13741, 13, -3);
INSERT INTO `item_mods` VALUES (13741, 14, -3);
INSERT INTO `item_mods` VALUES (13741, 23, 25);
INSERT INTO `item_mods` VALUES (13742, 1, 39);
INSERT INTO `item_mods` VALUES (13742, 2, 10);
INSERT INTO `item_mods` VALUES (13742, 11, 5);
INSERT INTO `item_mods` VALUES (13742, 54, 1);
INSERT INTO `item_mods` VALUES (13742, 55, 1);
INSERT INTO `item_mods` VALUES (13742, 56, 1);
INSERT INTO `item_mods` VALUES (13742, 57, 1);
INSERT INTO `item_mods` VALUES (13742, 58, 1);
INSERT INTO `item_mods` VALUES (13742, 59, 1);
INSERT INTO `item_mods` VALUES (13742, 68, 5);
INSERT INTO `item_mods` VALUES (13743, 1, 40);
INSERT INTO `item_mods` VALUES (13743, 2, 15);
INSERT INTO `item_mods` VALUES (13743, 11, 6);
INSERT INTO `item_mods` VALUES (13743, 54, 3);
INSERT INTO `item_mods` VALUES (13743, 55, 3);
INSERT INTO `item_mods` VALUES (13743, 56, 3);
INSERT INTO `item_mods` VALUES (13743, 57, 3);
INSERT INTO `item_mods` VALUES (13743, 58, 3);
INSERT INTO `item_mods` VALUES (13743, 59, 3);
INSERT INTO `item_mods` VALUES (13743, 68, 7);
INSERT INTO `item_mods` VALUES (13744, 1, 36);
INSERT INTO `item_mods` VALUES (13744, 2, 10);
INSERT INTO `item_mods` VALUES (13744, 8, -1);
INSERT INTO `item_mods` VALUES (13744, 9, -1);
INSERT INTO `item_mods` VALUES (13744, 10, -1);
INSERT INTO `item_mods` VALUES (13744, 11, -1);
INSERT INTO `item_mods` VALUES (13744, 12, 2);
INSERT INTO `item_mods` VALUES (13744, 13, 2);
INSERT INTO `item_mods` VALUES (13744, 14, 2);
INSERT INTO `item_mods` VALUES (13745, 1, 37);
INSERT INTO `item_mods` VALUES (13745, 2, 15);
INSERT INTO `item_mods` VALUES (13745, 8, -1);
INSERT INTO `item_mods` VALUES (13745, 9, -1);
INSERT INTO `item_mods` VALUES (13745, 10, -1);
INSERT INTO `item_mods` VALUES (13745, 11, -1);
INSERT INTO `item_mods` VALUES (13745, 12, 3);
INSERT INTO `item_mods` VALUES (13745, 13, 3);
INSERT INTO `item_mods` VALUES (13745, 14, 3);
INSERT INTO `item_mods` VALUES (13746, 1, 53);
INSERT INTO `item_mods` VALUES (13746, 5, 10);
INSERT INTO `item_mods` VALUES (13746, 10, 5);
INSERT INTO `item_mods` VALUES (13746, 13, 5);
INSERT INTO `item_mods` VALUES (13746, 27, 4);
INSERT INTO `item_mods` VALUES (13747, 1, 49);
INSERT INTO `item_mods` VALUES (13747, 9, 4);
INSERT INTO `item_mods` VALUES (13747, 11, 4);
INSERT INTO `item_mods` VALUES (13747, 161, -4);
INSERT INTO `item_mods` VALUES (13747, 163, -10);
INSERT INTO `item_mods` VALUES (13748, 1, 46);
INSERT INTO `item_mods` VALUES (13748, 5, 10);
INSERT INTO `item_mods` VALUES (13748, 6, 1);
INSERT INTO `item_mods` VALUES (13748, 68, -10);
INSERT INTO `item_mods` VALUES (13748, 369, 1);
INSERT INTO `item_mods` VALUES (13749, 1, 47);
INSERT INTO `item_mods` VALUES (13749, 5, 20);
INSERT INTO `item_mods` VALUES (13749, 6, 1);
INSERT INTO `item_mods` VALUES (13749, 68, -10);
INSERT INTO `item_mods` VALUES (13749, 369, 1);
INSERT INTO `item_mods` VALUES (13750, 1, 22);
INSERT INTO `item_mods` VALUES (13751, 1, 23);
INSERT INTO `item_mods` VALUES (13751, 68, 5);
INSERT INTO `item_mods` VALUES (13752, 1, 27);
INSERT INTO `item_mods` VALUES (13753, 1, 28);
INSERT INTO `item_mods` VALUES (13753, 68, 5);
INSERT INTO `item_mods` VALUES (13754, 1, 39);
INSERT INTO `item_mods` VALUES (13754, 7, 25);
INSERT INTO `item_mods` VALUES (13754, 8, 3);
INSERT INTO `item_mods` VALUES (13754, 9, 2);
INSERT INTO `item_mods` VALUES (13754, 10, -2);
INSERT INTO `item_mods` VALUES (13754, 11, 3);
INSERT INTO `item_mods` VALUES (13754, 12, 2);
INSERT INTO `item_mods` VALUES (13754, 13, -3);
INSERT INTO `item_mods` VALUES (13754, 14, -3);
INSERT INTO `item_mods` VALUES (13754, 54, -30);
INSERT INTO `item_mods` VALUES (13754, 55, 3);
INSERT INTO `item_mods` VALUES (13754, 56, 3);
INSERT INTO `item_mods` VALUES (13754, 57, 3);
INSERT INTO `item_mods` VALUES (13754, 58, 3);
INSERT INTO `item_mods` VALUES (13754, 59, 3);
INSERT INTO `item_mods` VALUES (13754, 60, 3);
INSERT INTO `item_mods` VALUES (13754, 61, 3);
INSERT INTO `item_mods` VALUES (13755, 1, 40);
INSERT INTO `item_mods` VALUES (13755, 7, 30);
INSERT INTO `item_mods` VALUES (13755, 8, 4);
INSERT INTO `item_mods` VALUES (13755, 9, 3);
INSERT INTO `item_mods` VALUES (13755, 10, -2);
INSERT INTO `item_mods` VALUES (13755, 11, 4);
INSERT INTO `item_mods` VALUES (13755, 12, 3);
INSERT INTO `item_mods` VALUES (13755, 13, -3);
INSERT INTO `item_mods` VALUES (13755, 14, -3);
INSERT INTO `item_mods` VALUES (13755, 54, -25);
INSERT INTO `item_mods` VALUES (13755, 55, 5);
INSERT INTO `item_mods` VALUES (13755, 56, 5);
INSERT INTO `item_mods` VALUES (13755, 57, 5);
INSERT INTO `item_mods` VALUES (13755, 58, 5);
INSERT INTO `item_mods` VALUES (13755, 59, 5);
INSERT INTO `item_mods` VALUES (13755, 60, 5);
INSERT INTO `item_mods` VALUES (13755, 61, 5);
INSERT INTO `item_mods` VALUES (13756, 1, 49);
INSERT INTO `item_mods` VALUES (13756, 5, 11);
INSERT INTO `item_mods` VALUES (13756, 10, 4);
INSERT INTO `item_mods` VALUES (13756, 11, -1);
INSERT INTO `item_mods` VALUES (13756, 60, 3);
INSERT INTO `item_mods` VALUES (13756, 61, 3);
INSERT INTO `item_mods` VALUES (13757, 1, 49);
INSERT INTO `item_mods` VALUES (13757, 4, 25);
INSERT INTO `item_mods` VALUES (13757, 10, 5);
INSERT INTO `item_mods` VALUES (13757, 14, 1);
INSERT INTO `item_mods` VALUES (13757, 60, 2);
INSERT INTO `item_mods` VALUES (13757, 61, 2);
INSERT INTO `item_mods` VALUES (13758, 1, 50);
INSERT INTO `item_mods` VALUES (13758, 4, 30);
INSERT INTO `item_mods` VALUES (13758, 10, 6);
INSERT INTO `item_mods` VALUES (13758, 14, 1);
INSERT INTO `item_mods` VALUES (13758, 60, 3);
INSERT INTO `item_mods` VALUES (13758, 61, 3);
INSERT INTO `item_mods` VALUES (13759, 1, 61);
INSERT INTO `item_mods` VALUES (13759, 8, 8);
INSERT INTO `item_mods` VALUES (13759, 9, 4);
INSERT INTO `item_mods` VALUES (13759, 23, 8);
INSERT INTO `item_mods` VALUES (13759, 25, 8);
INSERT INTO `item_mods` VALUES (13759, 165, 2);
INSERT INTO `item_mods` VALUES (13760, 1, 56);
INSERT INTO `item_mods` VALUES (13760, 8, 4);
INSERT INTO `item_mods` VALUES (13760, 9, 4);
INSERT INTO `item_mods` VALUES (13760, 11, 4);
INSERT INTO `item_mods` VALUES (13760, 25, 8);
INSERT INTO `item_mods` VALUES (13760, 26, 8);
INSERT INTO `item_mods` VALUES (13760, 68, 8);
INSERT INTO `item_mods` VALUES (13760, 288, 2);
INSERT INTO `item_mods` VALUES (13761, 1, 43);
INSERT INTO `item_mods` VALUES (13761, 58, -4);
INSERT INTO `item_mods` VALUES (13761, 59, 6);
INSERT INTO `item_mods` VALUES (13761, 163, -10);
INSERT INTO `item_mods` VALUES (13762, 1, 48);
INSERT INTO `item_mods` VALUES (13762, 2, 14);
INSERT INTO `item_mods` VALUES (13762, 54, 12);
INSERT INTO `item_mods` VALUES (13762, 55, 12);
INSERT INTO `item_mods` VALUES (13762, 56, 12);
INSERT INTO `item_mods` VALUES (13762, 57, 12);
INSERT INTO `item_mods` VALUES (13762, 58, 12);
INSERT INTO `item_mods` VALUES (13762, 59, 12);
INSERT INTO `item_mods` VALUES (13762, 60, 12);
INSERT INTO `item_mods` VALUES (13762, 61, 12);
INSERT INTO `item_mods` VALUES (13762, 162, -10);
INSERT INTO `item_mods` VALUES (13763, 1, 42);
INSERT INTO `item_mods` VALUES (13763, 23, 6);
INSERT INTO `item_mods` VALUES (13763, 54, -4);
INSERT INTO `item_mods` VALUES (13763, 55, 6);
INSERT INTO `item_mods` VALUES (13764, 1, 43);
INSERT INTO `item_mods` VALUES (13764, 3, -1);
INSERT INTO `item_mods` VALUES (13764, 25, 4);
INSERT INTO `item_mods` VALUES (13764, 68, 3);
INSERT INTO `item_mods` VALUES (13765, 1, 40);
INSERT INTO `item_mods` VALUES (13765, 60, 3);
INSERT INTO `item_mods` VALUES (13765, 61, 3);
INSERT INTO `item_mods` VALUES (13765, 161, -4);
INSERT INTO `item_mods` VALUES (13766, 1, 42);
INSERT INTO `item_mods` VALUES (13766, 4, 20);
INSERT INTO `item_mods` VALUES (13766, 10, 3);
INSERT INTO `item_mods` VALUES (13766, 11, 1);
INSERT INTO `item_mods` VALUES (13766, 163, -10);
INSERT INTO `item_mods` VALUES (13767, 1, 41);
INSERT INTO `item_mods` VALUES (13767, 7, 15);
INSERT INTO `item_mods` VALUES (13767, 23, 6);
INSERT INTO `item_mods` VALUES (13767, 68, 6);
INSERT INTO `item_mods` VALUES (13767, 116, 5);
INSERT INTO `item_mods` VALUES (13768, 1, 42);
INSERT INTO `item_mods` VALUES (13768, 7, 20);
INSERT INTO `item_mods` VALUES (13768, 23, 7);
INSERT INTO `item_mods` VALUES (13768, 68, 7);
INSERT INTO `item_mods` VALUES (13768, 116, 5);
INSERT INTO `item_mods` VALUES (13769, 1, 32);
INSERT INTO `item_mods` VALUES (13770, 1, 44);
INSERT INTO `item_mods` VALUES (13770, 8, -1);
INSERT INTO `item_mods` VALUES (13770, 11, 3);
INSERT INTO `item_mods` VALUES (13770, 106, 12);
INSERT INTO `item_mods` VALUES (13770, 370, 1);

-- ------------------------------------------
-- War Aketon +1
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (13771, 1, 39);
INSERT INTO `item_mods` VALUES (13771, 2, 27);
INSERT INTO `item_mods` VALUES (13771, 9, 5);
INSERT INTO `item_mods` VALUES (13771, 499, 1); -- blaze spikes
INSERT INTO `item_mods` VALUES (13771, 500, 30); -- spikes dmg
INSERT INTO `item_mods` VALUES (13771, 501, 30); -- spikes proc rate

INSERT INTO `item_mods` VALUES (13772, 1, 40);
INSERT INTO `item_mods` VALUES (13772, 2, 20);
INSERT INTO `item_mods` VALUES (13772, 4, 50);
INSERT INTO `item_mods` VALUES (13772, 11, 6);
INSERT INTO `item_mods` VALUES (13772, 54, 1);
INSERT INTO `item_mods` VALUES (13772, 55, 1);
INSERT INTO `item_mods` VALUES (13772, 56, 1);
INSERT INTO `item_mods` VALUES (13772, 57, 1);
INSERT INTO `item_mods` VALUES (13772, 58, 1);
INSERT INTO `item_mods` VALUES (13772, 59, 1);
INSERT INTO `item_mods` VALUES (13773, 1, 41);
INSERT INTO `item_mods` VALUES (13773, 2, 25);
INSERT INTO `item_mods` VALUES (13773, 4, 60);
INSERT INTO `item_mods` VALUES (13773, 11, 7);
INSERT INTO `item_mods` VALUES (13773, 54, 3);
INSERT INTO `item_mods` VALUES (13773, 55, 3);
INSERT INTO `item_mods` VALUES (13773, 56, 3);
INSERT INTO `item_mods` VALUES (13773, 57, 3);
INSERT INTO `item_mods` VALUES (13773, 58, 3);
INSERT INTO `item_mods` VALUES (13773, 59, 3);
INSERT INTO `item_mods` VALUES (13774, 1, 41);
INSERT INTO `item_mods` VALUES (13774, 5, 18);
INSERT INTO `item_mods` VALUES (13774, 369, 1);
INSERT INTO `item_mods` VALUES (13774, 374, 12);
INSERT INTO `item_mods` VALUES (13775, 1, 43);
INSERT INTO `item_mods` VALUES (13775, 7, 40);
INSERT INTO `item_mods` VALUES (13775, 8, 4);
INSERT INTO `item_mods` VALUES (13775, 9, 3);
INSERT INTO `item_mods` VALUES (13775, 10, -3);
INSERT INTO `item_mods` VALUES (13775, 11, 4);
INSERT INTO `item_mods` VALUES (13775, 12, 3);
INSERT INTO `item_mods` VALUES (13775, 13, -4);
INSERT INTO `item_mods` VALUES (13775, 14, -4);
INSERT INTO `item_mods` VALUES (13775, 54, -30);
INSERT INTO `item_mods` VALUES (13775, 55, 5);
INSERT INTO `item_mods` VALUES (13775, 56, 5);
INSERT INTO `item_mods` VALUES (13775, 57, 5);
INSERT INTO `item_mods` VALUES (13775, 58, -30);
INSERT INTO `item_mods` VALUES (13775, 59, 5);
INSERT INTO `item_mods` VALUES (13775, 60, 5);
INSERT INTO `item_mods` VALUES (13775, 61, 5);
INSERT INTO `item_mods` VALUES (13776, 1, 44);
INSERT INTO `item_mods` VALUES (13776, 7, 50);
INSERT INTO `item_mods` VALUES (13776, 8, 5);
INSERT INTO `item_mods` VALUES (13776, 9, 4);
INSERT INTO `item_mods` VALUES (13776, 10, -3);
INSERT INTO `item_mods` VALUES (13776, 11, 5);
INSERT INTO `item_mods` VALUES (13776, 12, 4);
INSERT INTO `item_mods` VALUES (13776, 13, -4);
INSERT INTO `item_mods` VALUES (13776, 14, -4);
INSERT INTO `item_mods` VALUES (13776, 54, -25);
INSERT INTO `item_mods` VALUES (13776, 55, 7);
INSERT INTO `item_mods` VALUES (13776, 56, 7);
INSERT INTO `item_mods` VALUES (13776, 57, 7);
INSERT INTO `item_mods` VALUES (13776, 58, -25);
INSERT INTO `item_mods` VALUES (13776, 59, 7);
INSERT INTO `item_mods` VALUES (13776, 60, 7);
INSERT INTO `item_mods` VALUES (13776, 61, 7);
INSERT INTO `item_mods` VALUES (13777, 1, 45);
INSERT INTO `item_mods` VALUES (13777, 2, 14);
INSERT INTO `item_mods` VALUES (13777, 60, 10);
INSERT INTO `item_mods` VALUES (13777, 61, -8);
INSERT INTO `item_mods` VALUES (13778, 1, 48);
INSERT INTO `item_mods` VALUES (13778, 2, 24);
INSERT INTO `item_mods` VALUES (13778, 5, 24);
INSERT INTO `item_mods` VALUES (13778, 12, 6);
INSERT INTO `item_mods` VALUES (13778, 13, 6);
INSERT INTO `item_mods` VALUES (13778, 14, 6);
INSERT INTO `item_mods` VALUES (13778, 28, 4);
INSERT INTO `item_mods` VALUES (13778, 30, 4);
INSERT INTO `item_mods` VALUES (13779, 1, 60);
INSERT INTO `item_mods` VALUES (13779, 12, 4);
INSERT INTO `item_mods` VALUES (13779, 115, 8);
INSERT INTO `item_mods` VALUES (13779, 369, 1);
INSERT INTO `item_mods` VALUES (13780, 1, 61);
INSERT INTO `item_mods` VALUES (13780, 12, 5);
INSERT INTO `item_mods` VALUES (13780, 115, 10);
INSERT INTO `item_mods` VALUES (13780, 369, 1);
INSERT INTO `item_mods` VALUES (13781, 1, 41);
INSERT INTO `item_mods` VALUES (13781, 2, 10);
INSERT INTO `item_mods` VALUES (13781, 10, 3);
INSERT INTO `item_mods` VALUES (13781, 61, 15);

-- ------------------------------------------
-- Ninja Chainmail
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (13782, 1, 41);
INSERT INTO `item_mods` VALUES (13782, 2, 15);
INSERT INTO `item_mods` VALUES (13782, 10, 3);
INSERT INTO `item_mods` VALUES (13782, 259, 5);
INSERT INTO `item_mods` VALUES (13782, 499, 1); -- blaze spikes
INSERT INTO `item_mods` VALUES (13782, 500, 25); -- spikes dmg
INSERT INTO `item_mods` VALUES (13782, 501, 25); -- spikes proc rate

INSERT INTO `item_mods` VALUES (13783, 1, 28);
INSERT INTO `item_mods` VALUES (13784, 1, 29);
INSERT INTO `item_mods` VALUES (13785, 1, 36);
INSERT INTO `item_mods` VALUES (13786, 1, 37);
INSERT INTO `item_mods` VALUES (13787, 1, 45);
INSERT INTO `item_mods` VALUES (13787, 7, 50);
INSERT INTO `item_mods` VALUES (13787, 29, 5);
INSERT INTO `item_mods` VALUES (13787, 242, 2);
INSERT INTO `item_mods` VALUES (13787, 369, 1);
INSERT INTO `item_mods` VALUES (13788, 1, 46);
INSERT INTO `item_mods` VALUES (13788, 7, 55);
INSERT INTO `item_mods` VALUES (13788, 29, 6);
INSERT INTO `item_mods` VALUES (13788, 242, 3);
INSERT INTO `item_mods` VALUES (13788, 369, 1);
INSERT INTO `item_mods` VALUES (13789, 1, 44);
INSERT INTO `item_mods` VALUES (13789, 59, 9);
INSERT INTO `item_mods` VALUES (13790, 1, 45);
INSERT INTO `item_mods` VALUES (13790, 59, 10);
INSERT INTO `item_mods` VALUES (13792, 1, 64);
INSERT INTO `item_mods` VALUES (13792, 8, 15);
INSERT INTO `item_mods` VALUES (13792, 23, 30);
INSERT INTO `item_mods` VALUES (13792, 161, -5);
INSERT INTO `item_mods` VALUES (13792, 163, 5);
INSERT INTO `item_mods` VALUES (13793, 1, 48);
INSERT INTO `item_mods` VALUES (13793, 8, 6);
INSERT INTO `item_mods` VALUES (13793, 9, 6);
INSERT INTO `item_mods` VALUES (13793, 23, 12);
INSERT INTO `item_mods` VALUES (13793, 25, 12);
INSERT INTO `item_mods` VALUES (13793, 68, -10);
INSERT INTO `item_mods` VALUES (13794, 1, 60);
INSERT INTO `item_mods` VALUES (13794, 11, -5);
INSERT INTO `item_mods` VALUES (13794, 55, -20);
INSERT INTO `item_mods` VALUES (13795, 1, 38);
INSERT INTO `item_mods` VALUES (13795, 27, 3);
INSERT INTO `item_mods` VALUES (13795, 161, -6);
INSERT INTO `item_mods` VALUES (13796, 1, 22);
INSERT INTO `item_mods` VALUES (13796, 5, 3);
INSERT INTO `item_mods` VALUES (13796, 13, 2);
INSERT INTO `item_mods` VALUES (13796, 61, 3);
INSERT INTO `item_mods` VALUES (13797, 1, 23);
INSERT INTO `item_mods` VALUES (13797, 5, 4);
INSERT INTO `item_mods` VALUES (13797, 13, 3);
INSERT INTO `item_mods` VALUES (13797, 61, 4);
INSERT INTO `item_mods` VALUES (13798, 1, 35);
INSERT INTO `item_mods` VALUES (13798, 10, 4);
INSERT INTO `item_mods` VALUES (13798, 57, 10);
INSERT INTO `item_mods` VALUES (13799, 1, 36);
INSERT INTO `item_mods` VALUES (13799, 10, 5);
INSERT INTO `item_mods` VALUES (13799, 57, 12);
INSERT INTO `item_mods` VALUES (13800, 1, 36);
INSERT INTO `item_mods` VALUES (13800, 11, 1);
INSERT INTO `item_mods` VALUES (13800, 25, 4);
INSERT INTO `item_mods` VALUES (13801, 1, 37);
INSERT INTO `item_mods` VALUES (13801, 11, 2);
INSERT INTO `item_mods` VALUES (13801, 25, 4);
INSERT INTO `item_mods` VALUES (13802, 1, 39);
INSERT INTO `item_mods` VALUES (13802, 27, 4);
INSERT INTO `item_mods` VALUES (13802, 161, -9);
INSERT INTO `item_mods` VALUES (13803, 1, 43);
INSERT INTO `item_mods` VALUES (13803, 5, 25);
INSERT INTO `item_mods` VALUES (13803, 12, 4);
INSERT INTO `item_mods` VALUES (13803, 114, 5);
INSERT INTO `item_mods` VALUES (13803, 115, 5);
INSERT INTO `item_mods` VALUES (13804, 1, 40);
INSERT INTO `item_mods` VALUES (13804, 2, 15);
INSERT INTO `item_mods` VALUES (13804, 68, 3);
INSERT INTO `item_mods` VALUES (13804, 120, 3);
INSERT INTO `item_mods` VALUES (13804, 121, 3);
INSERT INTO `item_mods` VALUES (13805, 1, 42);
INSERT INTO `item_mods` VALUES (13805, 3, -1);
INSERT INTO `item_mods` VALUES (13805, 23, 18);
INSERT INTO `item_mods` VALUES (13805, 25, 3);
INSERT INTO `item_mods` VALUES (13806, 1, 2);
INSERT INTO `item_mods` VALUES (13806, 72, 1);
INSERT INTO `item_mods` VALUES (13807, 1, 12);
INSERT INTO `item_mods` VALUES (13807, 72, 1);
INSERT INTO `item_mods` VALUES (13808, 1, 2);
INSERT INTO `item_mods` VALUES (13808, 127, 1);
INSERT INTO `item_mods` VALUES (13809, 1, 12);
INSERT INTO `item_mods` VALUES (13809, 127, 1);

-- -------------------------------------------------------
-- Chocobo Jack Coat
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (13810, 1, 2); -- DEF+2
INSERT INTO `item_mods` VALUES (13810, 511, 5); -- Chocobo riding time +5 min

-- -------------------------------------------------------
-- Rider's Jack Coat 
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (13811, 1, 12); -- DEF+12
INSERT INTO `item_mods` VALUES (13811, 511, 5); -- Chocobo riding time +5 min

INSERT INTO `item_mods` VALUES (13812, 1, 45);
INSERT INTO `item_mods` VALUES (13813, 1, 50);
INSERT INTO `item_mods` VALUES (13814, 1, 29);
INSERT INTO `item_mods` VALUES (13814, 14, -2);
INSERT INTO `item_mods` VALUES (13814, 346, 1);
INSERT INTO `item_mods` VALUES (13814, 357, 3);
INSERT INTO `item_mods` VALUES (13815, 1, 30);
INSERT INTO `item_mods` VALUES (13815, 14, -3);
INSERT INTO `item_mods` VALUES (13815, 346, 2);
INSERT INTO `item_mods` VALUES (13815, 357, 4);
INSERT INTO `item_mods` VALUES (13816, 1, 46);
INSERT INTO `item_mods` VALUES (13816, 8, 3);
INSERT INTO `item_mods` VALUES (13816, 10, 3);
INSERT INTO `item_mods` VALUES (13816, 25, 4);
INSERT INTO `item_mods` VALUES (13816, 68, 4);
INSERT INTO `item_mods` VALUES (13817, 1, 47);
INSERT INTO `item_mods` VALUES (13817, 8, 4);
INSERT INTO `item_mods` VALUES (13817, 10, 4);
INSERT INTO `item_mods` VALUES (13817, 25, 5);
INSERT INTO `item_mods` VALUES (13817, 68, 5);
INSERT INTO `item_mods` VALUES (13818, 1, 15);
INSERT INTO `item_mods` VALUES (13818, 9, 1);
INSERT INTO `item_mods` VALUES (13818, 14, 1);
INSERT INTO `item_mods` VALUES (13819, 1, 1);
INSERT INTO `item_mods` VALUES (13820, 1, 1);
INSERT INTO `item_mods` VALUES (13821, 1, 2);
INSERT INTO `item_mods` VALUES (13822, 1, 2);
INSERT INTO `item_mods` VALUES (13823, 1, 49);
INSERT INTO `item_mods` VALUES (13823, 4, 25);
INSERT INTO `item_mods` VALUES (13823, 10, 5);
INSERT INTO `item_mods` VALUES (13823, 14, 1);
INSERT INTO `item_mods` VALUES (13823, 60, 2);
INSERT INTO `item_mods` VALUES (13823, 61, 2);
INSERT INTO `item_mods` VALUES (13824, 1, 12);
INSERT INTO `item_mods` VALUES (13825, 2, -1);
INSERT INTO `item_mods` VALUES (13825, 5, 4);
INSERT INTO `item_mods` VALUES (13825, 61, 3);
INSERT INTO `item_mods` VALUES (13826, 1, 8);
INSERT INTO `item_mods` VALUES (13826, 54, -3);
INSERT INTO `item_mods` VALUES (13826, 68, 1);
INSERT INTO `item_mods` VALUES (13827, 1, 10);
INSERT INTO `item_mods` VALUES (13827, 55, -3);
INSERT INTO `item_mods` VALUES (13827, 68, 1);
INSERT INTO `item_mods` VALUES (13828, 2, -4);
INSERT INTO `item_mods` VALUES (13828, 5, 13);
INSERT INTO `item_mods` VALUES (13828, 57, 9);
INSERT INTO `item_mods` VALUES (13829, 1, 17);
INSERT INTO `item_mods` VALUES (13829, 58, -3);
INSERT INTO `item_mods` VALUES (13829, 68, 1);
INSERT INTO `item_mods` VALUES (13830, 1, 10);
INSERT INTO `item_mods` VALUES (13830, 56, 4);
INSERT INTO `item_mods` VALUES (13830, 57, 4);
INSERT INTO `item_mods` VALUES (13831, 1, 17);
INSERT INTO `item_mods` VALUES (13832, 1, 19);
INSERT INTO `item_mods` VALUES (13833, 14, 3);
INSERT INTO `item_mods` VALUES (13833, 54, 3);
INSERT INTO `item_mods` VALUES (13833, 55, 3);
INSERT INTO `item_mods` VALUES (13833, 56, 3);
INSERT INTO `item_mods` VALUES (13833, 57, 3);
INSERT INTO `item_mods` VALUES (13833, 58, 3);
INSERT INTO `item_mods` VALUES (13833, 59, 3);
INSERT INTO `item_mods` VALUES (13833, 60, 3);
INSERT INTO `item_mods` VALUES (13833, 61, 3);
INSERT INTO `item_mods` VALUES (13834, 1, 13);
INSERT INTO `item_mods` VALUES (13835, 1, 19);
INSERT INTO `item_mods` VALUES (13835, 54, 3);
INSERT INTO `item_mods` VALUES (13835, 59, -1);
INSERT INTO `item_mods` VALUES (13836, 2, -3);
INSERT INTO `item_mods` VALUES (13836, 5, 10);
INSERT INTO `item_mods` VALUES (13836, 59, 7);
INSERT INTO `item_mods` VALUES (13837, 1, 7);
INSERT INTO `item_mods` VALUES (13837, 5, 2);
INSERT INTO `item_mods` VALUES (13838, 1, 5);
INSERT INTO `item_mods` VALUES (13838, 68, 3);
INSERT INTO `item_mods` VALUES (13839, 1, 11);
INSERT INTO `item_mods` VALUES (13839, 54, 7);
INSERT INTO `item_mods` VALUES (13839, 58, -7);
INSERT INTO `item_mods` VALUES (13839, 59, 7);
INSERT INTO `item_mods` VALUES (13840, 2, -10);
INSERT INTO `item_mods` VALUES (13840, 5, 25);
INSERT INTO `item_mods` VALUES (13841, 1, 16);
INSERT INTO `item_mods` VALUES (13841, 5, 10);
INSERT INTO `item_mods` VALUES (13841, 23, 7);
INSERT INTO `item_mods` VALUES (13843, 1, 18);
INSERT INTO `item_mods` VALUES (13843, 13, 1);
INSERT INTO `item_mods` VALUES (13844, 1, 18);
INSERT INTO `item_mods` VALUES (13844, 61, 3);
INSERT INTO `item_mods` VALUES (13845, 1, 23);
INSERT INTO `item_mods` VALUES (13845, 23, 5);
INSERT INTO `item_mods` VALUES (13845, 25, 3);
INSERT INTO `item_mods` VALUES (13845, 68, -2);
INSERT INTO `item_mods` VALUES (13846, 1, 22);
INSERT INTO `item_mods` VALUES (13846, 54, 7);
INSERT INTO `item_mods` VALUES (13846, 242, 2);
INSERT INTO `item_mods` VALUES (13847, 1, 21);
INSERT INTO `item_mods` VALUES (13847, 12, 2);
INSERT INTO `item_mods` VALUES (13847, 57, -1);
INSERT INTO `item_mods` VALUES (13847, 61, 3);
INSERT INTO `item_mods` VALUES (13848, 1, 25);
INSERT INTO `item_mods` VALUES (13848, 10, 3);
INSERT INTO `item_mods` VALUES (13848, 61, 6);
INSERT INTO `item_mods` VALUES (13849, 2, -12);
INSERT INTO `item_mods` VALUES (13849, 5, 33);
INSERT INTO `item_mods` VALUES (13850, 2, -7);
INSERT INTO `item_mods` VALUES (13850, 5, 24);
INSERT INTO `item_mods` VALUES (13850, 59, 15);
INSERT INTO `item_mods` VALUES (13851, 1, 10);
INSERT INTO `item_mods` VALUES (13851, 68, 7);
INSERT INTO `item_mods` VALUES (13854, 54, 10);
INSERT INTO `item_mods` VALUES (13854, 55, 10);
INSERT INTO `item_mods` VALUES (13854, 56, 10);
INSERT INTO `item_mods` VALUES (13854, 57, 10);
INSERT INTO `item_mods` VALUES (13854, 58, 10);
INSERT INTO `item_mods` VALUES (13854, 59, 10);
INSERT INTO `item_mods` VALUES (13854, 60, 10);
INSERT INTO `item_mods` VALUES (13854, 61, 10);
INSERT INTO `item_mods` VALUES (13855, 1, 21);
INSERT INTO `item_mods` VALUES (13855, 5, 13);
INSERT INTO `item_mods` VALUES (13855, 13, 4);
INSERT INTO `item_mods` VALUES (13855, 27, -1);
INSERT INTO `item_mods` VALUES (13855, 61, 15);
INSERT INTO `item_mods` VALUES (13856, 1, 20);
INSERT INTO `item_mods` VALUES (13856, 5, 25);
INSERT INTO `item_mods` VALUES (13856, 12, 4);
INSERT INTO `item_mods` VALUES (13856, 27, -4);
INSERT INTO `item_mods` VALUES (13856, 58, 10);
INSERT INTO `item_mods` VALUES (13857, 1, 15);
INSERT INTO `item_mods` VALUES (13857, 2, 11);
INSERT INTO `item_mods` VALUES (13857, 13, 3);
INSERT INTO `item_mods` VALUES (13857, 27, -1);
INSERT INTO `item_mods` VALUES (13857, 110, 5);
INSERT INTO `item_mods` VALUES (13858, 1, 11);
INSERT INTO `item_mods` VALUES (13858, 68, 8);
INSERT INTO `item_mods` VALUES (13859, 1, 22);
INSERT INTO `item_mods` VALUES (13859, 58, -3);
INSERT INTO `item_mods` VALUES (13859, 59, 5);
INSERT INTO `item_mods` VALUES (13859, 163, -5);
INSERT INTO `item_mods` VALUES (13860, 1, 24);
INSERT INTO `item_mods` VALUES (13860, 2, 12);
INSERT INTO `item_mods` VALUES (13860, 60, 12);
INSERT INTO `item_mods` VALUES (13860, 61, 12);
INSERT INTO `item_mods` VALUES (13860, 162, -5);
INSERT INTO `item_mods` VALUES (13861, 1, 22);
INSERT INTO `item_mods` VALUES (13861, 23, 4);
INSERT INTO `item_mods` VALUES (13861, 54, -3);
INSERT INTO `item_mods` VALUES (13861, 55, 5);
INSERT INTO `item_mods` VALUES (13862, 1, 23);
INSERT INTO `item_mods` VALUES (13862, 3, -1);
INSERT INTO `item_mods` VALUES (13862, 26, 4);
INSERT INTO `item_mods` VALUES (13862, 68, 3);
INSERT INTO `item_mods` VALUES (13863, 1, 22);
INSERT INTO `item_mods` VALUES (13863, 60, 2);
INSERT INTO `item_mods` VALUES (13863, 61, 2);
INSERT INTO `item_mods` VALUES (13863, 161, -2);
INSERT INTO `item_mods` VALUES (13864, 1, 22);
INSERT INTO `item_mods` VALUES (13864, 4, 20);
INSERT INTO `item_mods` VALUES (13864, 9, 1);
INSERT INTO `item_mods` VALUES (13864, 14, 3);
INSERT INTO `item_mods` VALUES (13864, 163, -5);
INSERT INTO `item_mods` VALUES (13865, 1, 16);
INSERT INTO `item_mods` VALUES (13866, 1, 20);
INSERT INTO `item_mods` VALUES (13866, 25, 2);
INSERT INTO `item_mods` VALUES (13866, 68, 2);
INSERT INTO `item_mods` VALUES (13867, 1, 21);
INSERT INTO `item_mods` VALUES (13867, 2, 12);
INSERT INTO `item_mods` VALUES (13867, 12, -4);
INSERT INTO `item_mods` VALUES (13867, 25, 9);
INSERT INTO `item_mods` VALUES (13867, 26, 9);
INSERT INTO `item_mods` VALUES (13868, 1, 20);
INSERT INTO `item_mods` VALUES (13868, 2, 10);
INSERT INTO `item_mods` VALUES (13868, 13, 5);
INSERT INTO `item_mods` VALUES (13869, 1, 21);
INSERT INTO `item_mods` VALUES (13869, 2, 10);
INSERT INTO `item_mods` VALUES (13869, 14, 5);
INSERT INTO `item_mods` VALUES (13869, 55, 10);
INSERT INTO `item_mods` VALUES (13869, 118, 5);
INSERT INTO `item_mods` VALUES (13870, 8, 1);
INSERT INTO `item_mods` VALUES (13870, 9, 1);
INSERT INTO `item_mods` VALUES (13870, 10, 1);
INSERT INTO `item_mods` VALUES (13870, 11, 1);
INSERT INTO `item_mods` VALUES (13870, 12, 1);
INSERT INTO `item_mods` VALUES (13870, 13, 1);
INSERT INTO `item_mods` VALUES (13870, 14, -7);
INSERT INTO `item_mods` VALUES (13871, 1, 14);
INSERT INTO `item_mods` VALUES (13872, 1, 15);
INSERT INTO `item_mods` VALUES (13873, 1, 18);
INSERT INTO `item_mods` VALUES (13874, 1, 19);
INSERT INTO `item_mods` VALUES (13875, 1, 18);
INSERT INTO `item_mods` VALUES (13876, 1, 30);
INSERT INTO `item_mods` VALUES (13876, 7, 50);
INSERT INTO `item_mods` VALUES (13876, 12, 3);
INSERT INTO `item_mods` VALUES (13876, 13, 3);
INSERT INTO `item_mods` VALUES (13876, 244, 2);
INSERT INTO `item_mods` VALUES (13877, 1, 31);
INSERT INTO `item_mods` VALUES (13877, 7, 55);
INSERT INTO `item_mods` VALUES (13877, 12, 4);
INSERT INTO `item_mods` VALUES (13877, 13, 4);
INSERT INTO `item_mods` VALUES (13877, 244, 3);
INSERT INTO `item_mods` VALUES (13878, 1, 23);
INSERT INTO `item_mods` VALUES (13878, 59, 7);
INSERT INTO `item_mods` VALUES (13879, 1, 24);
INSERT INTO `item_mods` VALUES (13879, 59, 8);
INSERT INTO `item_mods` VALUES (13880, 1, 18);
INSERT INTO `item_mods` VALUES (13881, 1, 19);
INSERT INTO `item_mods` VALUES (13881, 27, 1);
INSERT INTO `item_mods` VALUES (13881, 161, -4);
INSERT INTO `item_mods` VALUES (13882, 1, 14);
INSERT INTO `item_mods` VALUES (13882, 9, 1);
INSERT INTO `item_mods` VALUES (13882, 54, 8);
INSERT INTO `item_mods` VALUES (13882, 58, -6);
INSERT INTO `item_mods` VALUES (13882, 59, 8);
INSERT INTO `item_mods` VALUES (13883, 1, 15);
INSERT INTO `item_mods` VALUES (13883, 9, 2);
INSERT INTO `item_mods` VALUES (13883, 54, 9);
INSERT INTO `item_mods` VALUES (13883, 58, -6);
INSERT INTO `item_mods` VALUES (13883, 59, 9);
INSERT INTO `item_mods` VALUES (13884, 1, 8);
INSERT INTO `item_mods` VALUES (13884, 9, -1);
INSERT INTO `item_mods` VALUES (13884, 14, 2);
INSERT INTO `item_mods` VALUES (13884, 68, 4);
INSERT INTO `item_mods` VALUES (13885, 1, 9);
INSERT INTO `item_mods` VALUES (13885, 9, 2);
INSERT INTO `item_mods` VALUES (13885, 14, -1);
INSERT INTO `item_mods` VALUES (13885, 68, 5);
INSERT INTO `item_mods` VALUES (13886, 1, 20);
INSERT INTO `item_mods` VALUES (13886, 27, 2);
INSERT INTO `item_mods` VALUES (13886, 161, -6);
INSERT INTO `item_mods` VALUES (13887, 1, 22);
INSERT INTO `item_mods` VALUES (13887, 23, 9);
INSERT INTO `item_mods` VALUES (13887, 25, 5);
INSERT INTO `item_mods` VALUES (13887, 160, 9);
INSERT INTO `item_mods` VALUES (13888, 1, 23);
INSERT INTO `item_mods` VALUES (13888, 23, 11);
INSERT INTO `item_mods` VALUES (13888, 25, 6);
INSERT INTO `item_mods` VALUES (13888, 160, 10);
INSERT INTO `item_mods` VALUES (13889, 1, 6);
INSERT INTO `item_mods` VALUES (13889, 2, 2);
INSERT INTO `item_mods` VALUES (13889, 5, 2);
INSERT INTO `item_mods` VALUES (13889, 12, 1);
INSERT INTO `item_mods` VALUES (13890, 1, 7);
INSERT INTO `item_mods` VALUES (13890, 2, 3);
INSERT INTO `item_mods` VALUES (13890, 5, 3);
INSERT INTO `item_mods` VALUES (13890, 12, 1);
INSERT INTO `item_mods` VALUES (13891, 1, 13);
INSERT INTO `item_mods` VALUES (13891, 11, 1);
INSERT INTO `item_mods` VALUES (13892, 1, 14);
INSERT INTO `item_mods` VALUES (13892, 11, 1);
INSERT INTO `item_mods` VALUES (13893, 1, 18);
INSERT INTO `item_mods` VALUES (13893, 10, 2);
INSERT INTO `item_mods` VALUES (13894, 1, 19);
INSERT INTO `item_mods` VALUES (13894, 10, 2);
INSERT INTO `item_mods` VALUES (13895, 1, 6);
INSERT INTO `item_mods` VALUES (13895, 2, 4);
INSERT INTO `item_mods` VALUES (13895, 11, 1);
INSERT INTO `item_mods` VALUES (13896, 1, 7);
INSERT INTO `item_mods` VALUES (13896, 2, 6);
INSERT INTO `item_mods` VALUES (13896, 11, 1);
INSERT INTO `item_mods` VALUES (13897, 1, 13);
INSERT INTO `item_mods` VALUES (13897, 9, 1);
INSERT INTO `item_mods` VALUES (13898, 1, 14);
INSERT INTO `item_mods` VALUES (13898, 9, 1);
INSERT INTO `item_mods` VALUES (13899, 1, 11);
INSERT INTO `item_mods` VALUES (13899, 56, 4);
INSERT INTO `item_mods` VALUES (13899, 57, 4);
INSERT INTO `item_mods` VALUES (13900, 1, 12);
INSERT INTO `item_mods` VALUES (13900, 56, 4);
INSERT INTO `item_mods` VALUES (13900, 57, 4);
INSERT INTO `item_mods` VALUES (13901, 1, 9);
INSERT INTO `item_mods` VALUES (13901, 2, 3);
INSERT INTO `item_mods` VALUES (13901, 5, 3);
INSERT INTO `item_mods` VALUES (13901, 8, 1);
INSERT INTO `item_mods` VALUES (13902, 1, 10);
INSERT INTO `item_mods` VALUES (13902, 2, 4);
INSERT INTO `item_mods` VALUES (13902, 5, 4);
INSERT INTO `item_mods` VALUES (13902, 8, 1);
INSERT INTO `item_mods` VALUES (13903, 1, 11);
INSERT INTO `item_mods` VALUES (13903, 8, 1);
INSERT INTO `item_mods` VALUES (13903, 9, 1);
INSERT INTO `item_mods` VALUES (13904, 1, 12);
INSERT INTO `item_mods` VALUES (13904, 8, 1);
INSERT INTO `item_mods` VALUES (13904, 9, 1);
INSERT INTO `item_mods` VALUES (13905, 1, 18);
INSERT INTO `item_mods` VALUES (13906, 1, 19);
INSERT INTO `item_mods` VALUES (13907, 1, 24);
INSERT INTO `item_mods` VALUES (13907, 5, 17);
INSERT INTO `item_mods` VALUES (13907, 12, -6);
INSERT INTO `item_mods` VALUES (13907, 14, 5);
INSERT INTO `item_mods` VALUES (13907, 23, 12);
INSERT INTO `item_mods` VALUES (13908, 1, 34);
INSERT INTO `item_mods` VALUES (13908, 2, 20);
INSERT INTO `item_mods` VALUES (13908, 5, 20);
INSERT INTO `item_mods` VALUES (13908, 114, 10);
INSERT INTO `item_mods` VALUES (13908, 370, 1);
INSERT INTO `item_mods` VALUES (13909, 1, 35);
INSERT INTO `item_mods` VALUES (13909, 2, 22);
INSERT INTO `item_mods` VALUES (13909, 5, 22);
INSERT INTO `item_mods` VALUES (13909, 114, 11);
INSERT INTO `item_mods` VALUES (13909, 370, 1);
INSERT INTO `item_mods` VALUES (13911, 1, 41);
INSERT INTO `item_mods` VALUES (13911, 2, 32);
INSERT INTO `item_mods` VALUES (13911, 8, -6);
INSERT INTO `item_mods` VALUES (13911, 9, -6);
INSERT INTO `item_mods` VALUES (13911, 10, 11);
INSERT INTO `item_mods` VALUES (13911, 14, 11);
INSERT INTO `item_mods` VALUES (13911, 109, 6);
INSERT INTO `item_mods` VALUES (13912, 1, 20);
INSERT INTO `item_mods` VALUES (13912, 5, 10);
INSERT INTO `item_mods` VALUES (13912, 8, 2);
INSERT INTO `item_mods` VALUES (13912, 10, -2);
INSERT INTO `item_mods` VALUES (13912, 60, -10);
INSERT INTO `item_mods` VALUES (13913, 1, 18);
INSERT INTO `item_mods` VALUES (13913, 12, 2);
INSERT INTO `item_mods` VALUES (13913, 13, 2);
INSERT INTO `item_mods` VALUES (13913, 59, 7);
INSERT INTO `item_mods` VALUES (13913, 61, 7);
INSERT INTO `item_mods` VALUES (13914, 1, 23);
INSERT INTO `item_mods` VALUES (13914, 2, 25);
INSERT INTO `item_mods` VALUES (13914, 13, -7);
INSERT INTO `item_mods` VALUES (13914, 14, -7);
INSERT INTO `item_mods` VALUES (13914, 27, 7);
INSERT INTO `item_mods` VALUES (13915, 25, 10);
INSERT INTO `item_mods` VALUES (13915, 26, 10);
INSERT INTO `item_mods` VALUES (13915, 68, 10);
INSERT INTO `item_mods` VALUES (13916, 27, -1);
INSERT INTO `item_mods` VALUES (13918, 1, 27);
INSERT INTO `item_mods` VALUES (13918, 2, 20);
INSERT INTO `item_mods` VALUES (13918, 10, 5);
INSERT INTO `item_mods` VALUES (13918, 68, -5);
INSERT INTO `item_mods` VALUES (13918, 107, 5);
INSERT INTO `item_mods` VALUES (13919, 1, 28);
INSERT INTO `item_mods` VALUES (13919, 2, 21);
INSERT INTO `item_mods` VALUES (13919, 10, 6);
INSERT INTO `item_mods` VALUES (13919, 68, -6);
INSERT INTO `item_mods` VALUES (13919, 107, 6);

-- ------------------------------------------
-- Wyvern Helm
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (13920, 1, 30);
INSERT INTO `item_mods` VALUES (13920, 2, 30);
INSERT INTO `item_mods` VALUES (13920, 8, 5);
INSERT INTO `item_mods` VALUES (13920, 54, 10);
INSERT INTO `item_mods` VALUES (13920, 499, 1); -- blaze spikes
INSERT INTO `item_mods` VALUES (13920, 500, 20); -- spikes dmg
INSERT INTO `item_mods` VALUES (13920, 501, 15); -- spikes proc rate

-- ------------------------------------------
-- Wyvern Helm +1
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (13921, 1, 31);
INSERT INTO `item_mods` VALUES (13921, 2, 31);
INSERT INTO `item_mods` VALUES (13921, 8, 6);
INSERT INTO `item_mods` VALUES (13921, 54, 11);
INSERT INTO `item_mods` VALUES (13921, 499, 1); -- blaze spikes
INSERT INTO `item_mods` VALUES (13921, 500, 25); -- spikes dmg
INSERT INTO `item_mods` VALUES (13921, 501, 20); -- spikes proc rate

INSERT INTO `item_mods` VALUES (13922, 1, 25);
INSERT INTO `item_mods` VALUES (13922, 12, 5);
INSERT INTO `item_mods` VALUES (13922, 13, -5);
INSERT INTO `item_mods` VALUES (13922, 110, 5);
INSERT INTO `item_mods` VALUES (13922, 119, 5);
INSERT INTO `item_mods` VALUES (13923, 1, 26);
INSERT INTO `item_mods` VALUES (13923, 12, 6);
INSERT INTO `item_mods` VALUES (13923, 13, -6);
INSERT INTO `item_mods` VALUES (13923, 110, 6);
INSERT INTO `item_mods` VALUES (13923, 119, 6);
INSERT INTO `item_mods` VALUES (13924, 1, 31);
INSERT INTO `item_mods` VALUES (13924, 2, -21);
INSERT INTO `item_mods` VALUES (13924, 23, 9);
INSERT INTO `item_mods` VALUES (13924, 25, 6);
INSERT INTO `item_mods` VALUES (13924, 68, -9);

-- ------------------------------------------
-- Rasetsu Jinpachi
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (13925, 1, 31);
INSERT INTO `item_mods` VALUES (13925, 23, 2);
INSERT INTO `item_mods` VALUES (13925, 499, 1); -- blaze spikes
INSERT INTO `item_mods` VALUES (13925, 500, 20); -- spikes dmg
INSERT INTO `item_mods` VALUES (13925, 501, 15); -- spikes proc rate

-- ------------------------------------------
-- Rasetsu Jinpachi +1
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (13926, 1, 32);
INSERT INTO `item_mods` VALUES (13926, 23, 3);
INSERT INTO `item_mods` VALUES (13926, 291, 1);
INSERT INTO `item_mods` VALUES (13926, 499, 1); -- blaze spikes
INSERT INTO `item_mods` VALUES (13926, 500, 25); -- spikes dmg
INSERT INTO `item_mods` VALUES (13926, 501, 20); -- spikes proc rate

INSERT INTO `item_mods` VALUES (13927, 1, 33);
INSERT INTO `item_mods` VALUES (13927, 2, 12);
INSERT INTO `item_mods` VALUES (13927, 8, 11);
INSERT INTO `item_mods` VALUES (13927, 9, 5);
INSERT INTO `item_mods` VALUES (13927, 384, -90);
INSERT INTO `item_mods` VALUES (13928, 1, 34);
INSERT INTO `item_mods` VALUES (13928, 2, 14);
INSERT INTO `item_mods` VALUES (13928, 8, 12);
INSERT INTO `item_mods` VALUES (13928, 9, 6);
INSERT INTO `item_mods` VALUES (13928, 384, -112);
INSERT INTO `item_mods` VALUES (13929, 1, 28);
INSERT INTO `item_mods` VALUES (13929, 8, -2);
INSERT INTO `item_mods` VALUES (13929, 9, -2);
INSERT INTO `item_mods` VALUES (13929, 10, -2);
INSERT INTO `item_mods` VALUES (13929, 11, -2);
INSERT INTO `item_mods` VALUES (13929, 12, 3);
INSERT INTO `item_mods` VALUES (13929, 13, 3);
INSERT INTO `item_mods` VALUES (13929, 14, 3);
INSERT INTO `item_mods` VALUES (13929, 27, -5);
INSERT INTO `item_mods` VALUES (13930, 1, 29);
INSERT INTO `item_mods` VALUES (13930, 8, -3);
INSERT INTO `item_mods` VALUES (13930, 9, -3);
INSERT INTO `item_mods` VALUES (13930, 10, -3);
INSERT INTO `item_mods` VALUES (13930, 11, -3);
INSERT INTO `item_mods` VALUES (13930, 12, 4);
INSERT INTO `item_mods` VALUES (13930, 13, 4);
INSERT INTO `item_mods` VALUES (13930, 14, 4);
INSERT INTO `item_mods` VALUES (13930, 27, -6);
INSERT INTO `item_mods` VALUES (13931, 1, 2);
INSERT INTO `item_mods` VALUES (13932, 1, 2);
INSERT INTO `item_mods` VALUES (13932, 14, 1);
INSERT INTO `item_mods` VALUES (13933, 1, 1);
INSERT INTO `item_mods` VALUES (13933, 60, 5);
INSERT INTO `item_mods` VALUES (13934, 1, 20);
INSERT INTO `item_mods` VALUES (13934, 2, -25);
INSERT INTO `item_mods` VALUES (13934, 8, 5);
INSERT INTO `item_mods` VALUES (13934, 25, 5);
INSERT INTO `item_mods` VALUES (13935, 1, 21);
INSERT INTO `item_mods` VALUES (13935, 2, -30);
INSERT INTO `item_mods` VALUES (13935, 8, 6);
INSERT INTO `item_mods` VALUES (13935, 25, 6);
INSERT INTO `item_mods` VALUES (13936, 1, 24);
INSERT INTO `item_mods` VALUES (13936, 11, 4);
INSERT INTO `item_mods` VALUES (13936, 27, 1);
INSERT INTO `item_mods` VALUES (13936, 162, -5);
INSERT INTO `item_mods` VALUES (13936, 289, 3);
INSERT INTO `item_mods` VALUES (13937, 1, 25);
INSERT INTO `item_mods` VALUES (13937, 11, 5);
INSERT INTO `item_mods` VALUES (13937, 27, 2);
INSERT INTO `item_mods` VALUES (13937, 162, -6);
INSERT INTO `item_mods` VALUES (13937, 289, 4);
INSERT INTO `item_mods` VALUES (13938, 1, 32);
INSERT INTO `item_mods` VALUES (13938, 2, 32);
INSERT INTO `item_mods` VALUES (13938, 10, 6);
INSERT INTO `item_mods` VALUES (13938, 25, 6);
INSERT INTO `item_mods` VALUES (13938, 68, 6);
INSERT INTO `item_mods` VALUES (13938, 169, -3);
INSERT INTO `item_mods` VALUES (13939, 1, 13);
INSERT INTO `item_mods` VALUES (13939, 5, 8);
INSERT INTO `item_mods` VALUES (13939, 14, -1);
INSERT INTO `item_mods` VALUES (13939, 117, 2);
INSERT INTO `item_mods` VALUES (13939, 357, 2);
INSERT INTO `item_mods` VALUES (13940, 1, 14);
INSERT INTO `item_mods` VALUES (13940, 5, 8);
INSERT INTO `item_mods` VALUES (13940, 14, -2);
INSERT INTO `item_mods` VALUES (13940, 117, 3);
INSERT INTO `item_mods` VALUES (13940, 357, 3);
INSERT INTO `item_mods` VALUES (13941, 1, 29);
INSERT INTO `item_mods` VALUES (13941, 2, 14);
INSERT INTO `item_mods` VALUES (13941, 5, 14);
INSERT INTO `item_mods` VALUES (13941, 10, 4);
INSERT INTO `item_mods` VALUES (13941, 27, 3);
INSERT INTO `item_mods` VALUES (13941, 68, -4);
INSERT INTO `item_mods` VALUES (13942, 1, 28);
INSERT INTO `item_mods` VALUES (13942, 14, 5);
INSERT INTO `item_mods` VALUES (13942, 227, 2);
INSERT INTO `item_mods` VALUES (13942, 242, 2);
INSERT INTO `item_mods` VALUES (13942, 384, 20);
INSERT INTO `item_mods` VALUES (13943, 1, 29);
INSERT INTO `item_mods` VALUES (13943, 14, 6);
INSERT INTO `item_mods` VALUES (13943, 227, 2);
INSERT INTO `item_mods` VALUES (13943, 242, 2);
INSERT INTO `item_mods` VALUES (13943, 384, 30);
INSERT INTO `item_mods` VALUES (13944, 1, 30);
INSERT INTO `item_mods` VALUES (13944, 9, 2);
INSERT INTO `item_mods` VALUES (13944, 11, 3);
INSERT INTO `item_mods` VALUES (13944, 163, -7);
INSERT INTO `item_mods` VALUES (13945, 1, 1);
INSERT INTO `item_mods` VALUES (13945, 60, 1);
INSERT INTO `item_mods` VALUES (13945, 130, 1);
INSERT INTO `item_mods` VALUES (13946, 1, 1);
INSERT INTO `item_mods` VALUES (13946, 61, 1);
INSERT INTO `item_mods` VALUES (13946, 131, 1);
INSERT INTO `item_mods` VALUES (13947, 1, 1);
INSERT INTO `item_mods` VALUES (13947, 57, 1);
INSERT INTO `item_mods` VALUES (13947, 133, 1);
INSERT INTO `item_mods` VALUES (13948, 1, 1);
INSERT INTO `item_mods` VALUES (13948, 135, 1);
INSERT INTO `item_mods` VALUES (13948, 241, 2);
INSERT INTO `item_mods` VALUES (13949, 2, 20);
INSERT INTO `item_mods` VALUES (13950, 1, 28);
INSERT INTO `item_mods` VALUES (13950, 111, 4);
INSERT INTO `item_mods` VALUES (13950, 114, 4);
INSERT INTO `item_mods` VALUES (13950, 115, 4);
INSERT INTO `item_mods` VALUES (13950, 117, 4);
INSERT INTO `item_mods` VALUES (13951, 1, 29);
INSERT INTO `item_mods` VALUES (13951, 111, 5);
INSERT INTO `item_mods` VALUES (13951, 114, 5);
INSERT INTO `item_mods` VALUES (13951, 115, 5);
INSERT INTO `item_mods` VALUES (13951, 117, 5);
INSERT INTO `item_mods` VALUES (13952, 1, 8);
INSERT INTO `item_mods` VALUES (13952, 23, 20);
INSERT INTO `item_mods` VALUES (13952, 60, -8);
INSERT INTO `item_mods` VALUES (13952, 61, 8);
INSERT INTO `item_mods` VALUES (13952, 68, -5);
INSERT INTO `item_mods` VALUES (13953, 1, 5);
INSERT INTO `item_mods` VALUES (13953, 5, 3);
INSERT INTO `item_mods` VALUES (13953, 68, 2);
INSERT INTO `item_mods` VALUES (13954, 1, 12);
INSERT INTO `item_mods` VALUES (13954, 13, 3);
INSERT INTO `item_mods` VALUES (13954, 59, 7);
INSERT INTO `item_mods` VALUES (13955, 1, 12);
INSERT INTO `item_mods` VALUES (13955, 9, 1);
INSERT INTO `item_mods` VALUES (13956, 1, 14);
INSERT INTO `item_mods` VALUES (13956, 2, 4);
INSERT INTO `item_mods` VALUES (13956, 55, -2);
INSERT INTO `item_mods` VALUES (13956, 59, 7);
INSERT INTO `item_mods` VALUES (13956, 61, 7);
INSERT INTO `item_mods` VALUES (13957, 1, 16);
INSERT INTO `item_mods` VALUES (13957, 27, 2);
INSERT INTO `item_mods` VALUES (13957, 110, 7);
INSERT INTO `item_mods` VALUES (13957, 168, 3);
INSERT INTO `item_mods` VALUES (13958, 1, 14);
INSERT INTO `item_mods` VALUES (13958, 12, 1);
INSERT INTO `item_mods` VALUES (13958, 54, -1);
INSERT INTO `item_mods` VALUES (13958, 55, 3);
INSERT INTO `item_mods` VALUES (13958, 60, 3);
INSERT INTO `item_mods` VALUES (13959, 1, 17);
INSERT INTO `item_mods` VALUES (13959, 10, 2);
INSERT INTO `item_mods` VALUES (13959, 61, 4);
INSERT INTO `item_mods` VALUES (13960, 1, 15);
INSERT INTO `item_mods` VALUES (13960, 10, 2);
INSERT INTO `item_mods` VALUES (13960, 57, 4);
INSERT INTO `item_mods` VALUES (13961, 1, 16);
INSERT INTO `item_mods` VALUES (13961, 2, 13);
INSERT INTO `item_mods` VALUES (13961, 8, 4);
INSERT INTO `item_mods` VALUES (13961, 27, 3);
INSERT INTO `item_mods` VALUES (13961, 109, 10);
INSERT INTO `item_mods` VALUES (13962, 1, 14);
INSERT INTO `item_mods` VALUES (13962, 2, 14);
INSERT INTO `item_mods` VALUES (13962, 8, 4);
INSERT INTO `item_mods` VALUES (13962, 61, 10);
INSERT INTO `item_mods` VALUES (13963, 1, 14);
INSERT INTO `item_mods` VALUES (13963, 5, 10);
INSERT INTO `item_mods` VALUES (13963, 8, 5);
INSERT INTO `item_mods` VALUES (13963, 27, -4);
INSERT INTO `item_mods` VALUES (13963, 112, 15);
INSERT INTO `item_mods` VALUES (13964, 1, 13);
INSERT INTO `item_mods` VALUES (13964, 5, 12);
INSERT INTO `item_mods` VALUES (13964, 14, 3);
INSERT INTO `item_mods` VALUES (13964, 27, -1);
INSERT INTO `item_mods` VALUES (13964, 115, 15);
INSERT INTO `item_mods` VALUES (13965, 1, 16);
INSERT INTO `item_mods` VALUES (13965, 5, 12);
INSERT INTO `item_mods` VALUES (13965, 9, 4);
INSERT INTO `item_mods` VALUES (13965, 61, 10);
INSERT INTO `item_mods` VALUES (13965, 110, 10);
INSERT INTO `item_mods` VALUES (13966, 1, 15);
INSERT INTO `item_mods` VALUES (13966, 2, 10);
INSERT INTO `item_mods` VALUES (13966, 9, 3);
INSERT INTO `item_mods` VALUES (13966, 55, 10);
INSERT INTO `item_mods` VALUES (13966, 298, 1);
INSERT INTO `item_mods` VALUES (13967, 1, 16);
INSERT INTO `item_mods` VALUES (13967, 2, 11);
INSERT INTO `item_mods` VALUES (13967, 9, 3);
INSERT INTO `item_mods` VALUES (13967, 27, 2);
INSERT INTO `item_mods` VALUES (13967, 60, 10);
INSERT INTO `item_mods` VALUES (13968, 1, 12);
INSERT INTO `item_mods` VALUES (13968, 2, 11);
INSERT INTO `item_mods` VALUES (13968, 9, 3);
INSERT INTO `item_mods` VALUES (13968, 61, 10);
INSERT INTO `item_mods` VALUES (13969, 1, 12);
INSERT INTO `item_mods` VALUES (13969, 2, 11);
INSERT INTO `item_mods` VALUES (13969, 9, 3);
INSERT INTO `item_mods` VALUES (13969, 110, 5);
INSERT INTO `item_mods` VALUES (13969, 360, 3);
INSERT INTO `item_mods` VALUES (13970, 1, 15);
INSERT INTO `item_mods` VALUES (13970, 2, 14);
INSERT INTO `item_mods` VALUES (13970, 14, 4);
INSERT INTO `item_mods` VALUES (13970, 27, -1);
INSERT INTO `item_mods` VALUES (13970, 119, 5);
INSERT INTO `item_mods` VALUES (13971, 1, 10);
INSERT INTO `item_mods` VALUES (13971, 2, 10);
INSERT INTO `item_mods` VALUES (13971, 9, 3);
INSERT INTO `item_mods` VALUES (13971, 61, 10);
INSERT INTO `item_mods` VALUES (13971, 425, 10);
INSERT INTO `item_mods` VALUES (13972, 1, 15);
INSERT INTO `item_mods` VALUES (13972, 2, 15);
INSERT INTO `item_mods` VALUES (13972, 9, 4);
INSERT INTO `item_mods` VALUES (13972, 27, 2);
INSERT INTO `item_mods` VALUES (13973, 1, 14);
INSERT INTO `item_mods` VALUES (13973, 2, 13);
INSERT INTO `item_mods` VALUES (13973, 9, 3);
INSERT INTO `item_mods` VALUES (13973, 24, 20);
INSERT INTO `item_mods` VALUES (13973, 106, 5);
INSERT INTO `item_mods` VALUES (13974, 1, 15);
INSERT INTO `item_mods` VALUES (13974, 2, 11);
INSERT INTO `item_mods` VALUES (13974, 9, 3);
INSERT INTO `item_mods` VALUES (13974, 110, 10);
INSERT INTO `item_mods` VALUES (13975, 1, 11);
INSERT INTO `item_mods` VALUES (13975, 5, 15);
INSERT INTO `item_mods` VALUES (13975, 10, 4);
INSERT INTO `item_mods` VALUES (13976, 1, 17);
INSERT INTO `item_mods` VALUES (13976, 60, 3);
INSERT INTO `item_mods` VALUES (13977, 1, 15);
INSERT INTO `item_mods` VALUES (13977, 2, 5);
INSERT INTO `item_mods` VALUES (13977, 8, 3);
INSERT INTO `item_mods` VALUES (13977, 10, 3);
INSERT INTO `item_mods` VALUES (13978, 1, 6);
INSERT INTO `item_mods` VALUES (13978, 23, -18);
INSERT INTO `item_mods` VALUES (13978, 25, 6);
INSERT INTO `item_mods` VALUES (13979, 1, 9);
INSERT INTO `item_mods` VALUES (13980, 1, 10);
INSERT INTO `item_mods` VALUES (13981, 1, 10);
INSERT INTO `item_mods` VALUES (13982, 1, 11);
INSERT INTO `item_mods` VALUES (13983, 1, 11);
INSERT INTO `item_mods` VALUES (13984, 1, 12);
INSERT INTO `item_mods` VALUES (13985, 1, 14);
INSERT INTO `item_mods` VALUES (13986, 1, 15);
INSERT INTO `item_mods` VALUES (13987, 1, 12);
INSERT INTO `item_mods` VALUES (13987, 163, -2);
INSERT INTO `item_mods` VALUES (13988, 1, 13);
INSERT INTO `item_mods` VALUES (13988, 163, -5);
INSERT INTO `item_mods` VALUES (13989, 1, 18);
INSERT INTO `item_mods` VALUES (13989, 5, 8);
INSERT INTO `item_mods` VALUES (13989, 8, 4);
INSERT INTO `item_mods` VALUES (13989, 9, -1);
INSERT INTO `item_mods` VALUES (13989, 60, 3);
INSERT INTO `item_mods` VALUES (13989, 61, 3);
INSERT INTO `item_mods` VALUES (13990, 1, 15);
INSERT INTO `item_mods` VALUES (13990, 58, -2);
INSERT INTO `item_mods` VALUES (13990, 59, 4);
INSERT INTO `item_mods` VALUES (13990, 163, -5);
INSERT INTO `item_mods` VALUES (13991, 1, 16);
INSERT INTO `item_mods` VALUES (13991, 2, 10);
INSERT INTO `item_mods` VALUES (13991, 58, 12);
INSERT INTO `item_mods` VALUES (13991, 59, 12);
INSERT INTO `item_mods` VALUES (13991, 162, -5);
INSERT INTO `item_mods` VALUES (13992, 1, 15);
INSERT INTO `item_mods` VALUES (13992, 23, 4);
INSERT INTO `item_mods` VALUES (13992, 54, -2);
INSERT INTO `item_mods` VALUES (13992, 55, 4);
INSERT INTO `item_mods` VALUES (13993, 1, 16);
INSERT INTO `item_mods` VALUES (13993, 3, -1);
INSERT INTO `item_mods` VALUES (13993, 9, 3);
INSERT INTO `item_mods` VALUES (13993, 10, -1);
INSERT INTO `item_mods` VALUES (13993, 68, 3);
INSERT INTO `item_mods` VALUES (13994, 1, 15);
INSERT INTO `item_mods` VALUES (13994, 60, 2);
INSERT INTO `item_mods` VALUES (13994, 61, 2);
INSERT INTO `item_mods` VALUES (13994, 161, -2);
INSERT INTO `item_mods` VALUES (13995, 1, 15);
INSERT INTO `item_mods` VALUES (13995, 4, 20);
INSERT INTO `item_mods` VALUES (13995, 8, 1);
INSERT INTO `item_mods` VALUES (13995, 9, 3);
INSERT INTO `item_mods` VALUES (13995, 163, -5);
INSERT INTO `item_mods` VALUES (13996, 1, 11);
INSERT INTO `item_mods` VALUES (13997, 1, 14);
INSERT INTO `item_mods` VALUES (13997, 25, 3);
INSERT INTO `item_mods` VALUES (13998, 1, 16);
INSERT INTO `item_mods` VALUES (13998, 2, 15);
INSERT INTO `item_mods` VALUES (13998, 10, -3);
INSERT INTO `item_mods` VALUES (13998, 25, 6);
INSERT INTO `item_mods` VALUES (13998, 68, 6);
INSERT INTO `item_mods` VALUES (13999, 1, 17);
INSERT INTO `item_mods` VALUES (13999, 5, 13);
INSERT INTO `item_mods` VALUES (13999, 9, 3);
INSERT INTO `item_mods` VALUES (13999, 14, 2);
INSERT INTO `item_mods` VALUES (14000, 1, 12);
INSERT INTO `item_mods` VALUES (14000, 2, 6);
INSERT INTO `item_mods` VALUES (14000, 60, 4);
INSERT INTO `item_mods` VALUES (14000, 61, -2);
INSERT INTO `item_mods` VALUES (14001, 1, 9);
INSERT INTO `item_mods` VALUES (14002, 1, 10);
INSERT INTO `item_mods` VALUES (14003, 1, 12);
INSERT INTO `item_mods` VALUES (14004, 1, 13);
INSERT INTO `item_mods` VALUES (14005, 1, 10);
INSERT INTO `item_mods` VALUES (14006, 1, 23);
INSERT INTO `item_mods` VALUES (14006, 7, 50);
INSERT INTO `item_mods` VALUES (14006, 28, 5);
INSERT INTO `item_mods` VALUES (14007, 1, 24);
INSERT INTO `item_mods` VALUES (14007, 7, 55);
INSERT INTO `item_mods` VALUES (14007, 28, 6);
INSERT INTO `item_mods` VALUES (14008, 1, 16);
INSERT INTO `item_mods` VALUES (14008, 59, 5);
INSERT INTO `item_mods` VALUES (14009, 1, 17);
INSERT INTO `item_mods` VALUES (14009, 59, 6);
INSERT INTO `item_mods` VALUES (14010, 1, 15);
INSERT INTO `item_mods` VALUES (14010, 8, 4);
INSERT INTO `item_mods` VALUES (14010, 23, 8);
INSERT INTO `item_mods` VALUES (14010, 160, 6);
INSERT INTO `item_mods` VALUES (14011, 1, 16);
INSERT INTO `item_mods` VALUES (14011, 8, 5);
INSERT INTO `item_mods` VALUES (14011, 23, 10);
INSERT INTO `item_mods` VALUES (14011, 160, 7);
INSERT INTO `item_mods` VALUES (14012, 1, 16);
INSERT INTO `item_mods` VALUES (14012, 23, 4);
INSERT INTO `item_mods` VALUES (14012, 25, 3);
INSERT INTO `item_mods` VALUES (14012, 68, -2);
INSERT INTO `item_mods` VALUES (14013, 1, 15);
INSERT INTO `item_mods` VALUES (14014, 1, 11);
INSERT INTO `item_mods` VALUES (14015, 1, 11);
INSERT INTO `item_mods` VALUES (14016, 1, 15);
INSERT INTO `item_mods` VALUES (14018, 1, 9);
INSERT INTO `item_mods` VALUES (14018, 2, 15);
INSERT INTO `item_mods` VALUES (14018, 8, 3);
INSERT INTO `item_mods` VALUES (14018, 9, -2);
INSERT INTO `item_mods` VALUES (14018, 11, -2);
INSERT INTO `item_mods` VALUES (14019, 1, 11);
INSERT INTO `item_mods` VALUES (14019, 2, 20);
INSERT INTO `item_mods` VALUES (14019, 8, 5);
INSERT INTO `item_mods` VALUES (14019, 9, -3);
INSERT INTO `item_mods` VALUES (14019, 11, -3);
INSERT INTO `item_mods` VALUES (14020, 1, 14);
INSERT INTO `item_mods` VALUES (14020, 2, 25);
INSERT INTO `item_mods` VALUES (14020, 8, 7);
INSERT INTO `item_mods` VALUES (14020, 9, -4);
INSERT INTO `item_mods` VALUES (14020, 11, -4);
INSERT INTO `item_mods` VALUES (14021, 1, 15);
INSERT INTO `item_mods` VALUES (14021, 2, 35);
INSERT INTO `item_mods` VALUES (14021, 8, 9);
INSERT INTO `item_mods` VALUES (14021, 9, -5);
INSERT INTO `item_mods` VALUES (14021, 11, -5);
INSERT INTO `item_mods` VALUES (14022, 1, 16);
INSERT INTO `item_mods` VALUES (14022, 2, 40);
INSERT INTO `item_mods` VALUES (14022, 8, 11);
INSERT INTO `item_mods` VALUES (14022, 9, -6);
INSERT INTO `item_mods` VALUES (14022, 11, -6);
INSERT INTO `item_mods` VALUES (14023, 1, 13);
INSERT INTO `item_mods` VALUES (14023, 27, 1);
INSERT INTO `item_mods` VALUES (14023, 68, 3);
INSERT INTO `item_mods` VALUES (14024, 1, 5);
INSERT INTO `item_mods` VALUES (14024, 5, 8);
INSERT INTO `item_mods` VALUES (14024, 12, -4);
INSERT INTO `item_mods` VALUES (14024, 13, 5);
INSERT INTO `item_mods` VALUES (14025, 1, 6);
INSERT INTO `item_mods` VALUES (14025, 5, 9);
INSERT INTO `item_mods` VALUES (14025, 12, -3);
INSERT INTO `item_mods` VALUES (14025, 13, 6);
INSERT INTO `item_mods` VALUES (14026, 1, 12);
INSERT INTO `item_mods` VALUES (14026, 55, 10);
INSERT INTO `item_mods` VALUES (14027, 1, 13);
INSERT INTO `item_mods` VALUES (14027, 55, 12);
INSERT INTO `item_mods` VALUES (14028, 1, 14);
INSERT INTO `item_mods` VALUES (14028, 27, 2);
INSERT INTO `item_mods` VALUES (14028, 68, 4);
INSERT INTO `item_mods` VALUES (14029, 1, 14);
INSERT INTO `item_mods` VALUES (14029, 25, 3);
INSERT INTO `item_mods` VALUES (14030, 1, 15);
INSERT INTO `item_mods` VALUES (14030, 25, 3);
INSERT INTO `item_mods` VALUES (14031, 1, 4);
INSERT INTO `item_mods` VALUES (14031, 2, 2);
INSERT INTO `item_mods` VALUES (14031, 5, 2);
INSERT INTO `item_mods` VALUES (14031, 23, 3);
INSERT INTO `item_mods` VALUES (14032, 1, 5);
INSERT INTO `item_mods` VALUES (14032, 2, 3);
INSERT INTO `item_mods` VALUES (14032, 5, 3);
INSERT INTO `item_mods` VALUES (14032, 23, 3);
INSERT INTO `item_mods` VALUES (14033, 1, 9);
INSERT INTO `item_mods` VALUES (14033, 25, 2);
INSERT INTO `item_mods` VALUES (14034, 1, 10);
INSERT INTO `item_mods` VALUES (14034, 25, 2);
INSERT INTO `item_mods` VALUES (14035, 1, 13);
INSERT INTO `item_mods` VALUES (14035, 26, 5);
INSERT INTO `item_mods` VALUES (14036, 1, 14);
INSERT INTO `item_mods` VALUES (14036, 26, 5);
INSERT INTO `item_mods` VALUES (14037, 1, 4);
INSERT INTO `item_mods` VALUES (14037, 2, 4);
INSERT INTO `item_mods` VALUES (14037, 23, 3);
INSERT INTO `item_mods` VALUES (14038, 1, 5);
INSERT INTO `item_mods` VALUES (14038, 2, 6);
INSERT INTO `item_mods` VALUES (14038, 23, 3);
INSERT INTO `item_mods` VALUES (14039, 1, 9);
INSERT INTO `item_mods` VALUES (14039, 9, 1);
INSERT INTO `item_mods` VALUES (14040, 1, 10);
INSERT INTO `item_mods` VALUES (14040, 9, 1);
INSERT INTO `item_mods` VALUES (14043, 1, 6);
INSERT INTO `item_mods` VALUES (14043, 25, 2);
INSERT INTO `item_mods` VALUES (14043, 26, 2);
INSERT INTO `item_mods` VALUES (14044, 1, 7);
INSERT INTO `item_mods` VALUES (14044, 25, 3);
INSERT INTO `item_mods` VALUES (14044, 26, 3);
INSERT INTO `item_mods` VALUES (14045, 1, 7);
INSERT INTO `item_mods` VALUES (14045, 11, 1);
INSERT INTO `item_mods` VALUES (14046, 1, 8);
INSERT INTO `item_mods` VALUES (14046, 11, 1);
INSERT INTO `item_mods` VALUES (14047, 1, 9);
INSERT INTO `item_mods` VALUES (14047, 23, 5);
INSERT INTO `item_mods` VALUES (14048, 1, 10);
INSERT INTO `item_mods` VALUES (14048, 23, 5);
INSERT INTO `item_mods` VALUES (14049, 1, 11);
INSERT INTO `item_mods` VALUES (14049, 68, 5);
INSERT INTO `item_mods` VALUES (14050, 1, 12);
INSERT INTO `item_mods` VALUES (14050, 68, 5);
INSERT INTO `item_mods` VALUES (14051, 1, 10);
INSERT INTO `item_mods` VALUES (14052, 1, 10);
INSERT INTO `item_mods` VALUES (14052, 8, 1);
INSERT INTO `item_mods` VALUES (14052, 9, 1);
INSERT INTO `item_mods` VALUES (14052, 11, -3);
INSERT INTO `item_mods` VALUES (14052, 23, 2);
INSERT INTO `item_mods` VALUES (14052, 25, 2);
INSERT INTO `item_mods` VALUES (14052, 68, -2);
INSERT INTO `item_mods` VALUES (14053, 1, 5);
INSERT INTO `item_mods` VALUES (14054, 1, 6);
INSERT INTO `item_mods` VALUES (14054, 5, 4);
INSERT INTO `item_mods` VALUES (14054, 13, 1);
INSERT INTO `item_mods` VALUES (14055, 1, 26);
INSERT INTO `item_mods` VALUES (14055, 2, 24);
INSERT INTO `item_mods` VALUES (14055, 23, 8);
INSERT INTO `item_mods` VALUES (14055, 24, 8);
INSERT INTO `item_mods` VALUES (14056, 1, 28);
INSERT INTO `item_mods` VALUES (14056, 2, 28);
INSERT INTO `item_mods` VALUES (14056, 23, 9);
INSERT INTO `item_mods` VALUES (14056, 24, 9);
INSERT INTO `item_mods` VALUES (14057, 1, 17);
INSERT INTO `item_mods` VALUES (14057, 5, 14);
INSERT INTO `item_mods` VALUES (14057, 8, 7);
INSERT INTO `item_mods` VALUES (14057, 9, -4);
INSERT INTO `item_mods` VALUES (14057, 364, 11);
INSERT INTO `item_mods` VALUES (14058, 1, 26);
INSERT INTO `item_mods` VALUES (14058, 2, 20);
INSERT INTO `item_mods` VALUES (14058, 5, 20);
INSERT INTO `item_mods` VALUES (14058, 24, 10);
INSERT INTO `item_mods` VALUES (14058, 26, 10);
INSERT INTO `item_mods` VALUES (14058, 116, 10);
INSERT INTO `item_mods` VALUES (14059, 1, 27);
INSERT INTO `item_mods` VALUES (14059, 2, 22);
INSERT INTO `item_mods` VALUES (14059, 5, 22);
INSERT INTO `item_mods` VALUES (14059, 24, 11);
INSERT INTO `item_mods` VALUES (14059, 26, 11);
INSERT INTO `item_mods` VALUES (14059, 116, 11);
INSERT INTO `item_mods` VALUES (14061, 1, 31);
INSERT INTO `item_mods` VALUES (14061, 2, 22);
INSERT INTO `item_mods` VALUES (14061, 8, -6);
INSERT INTO `item_mods` VALUES (14061, 9, -6);
INSERT INTO `item_mods` VALUES (14061, 10, 11);
INSERT INTO `item_mods` VALUES (14061, 14, 11);
INSERT INTO `item_mods` VALUES (14061, 240, 3);
INSERT INTO `item_mods` VALUES (14062, 1, 5);
INSERT INTO `item_mods` VALUES (14062, 5, 14);
INSERT INTO `item_mods` VALUES (14063, 1, 30);
INSERT INTO `item_mods` VALUES (14063, 55, -6);
INSERT INTO `item_mods` VALUES (14064, 1, 13);
INSERT INTO `item_mods` VALUES (14064, 9, 2);
INSERT INTO `item_mods` VALUES (14064, 11, 2);
INSERT INTO `item_mods` VALUES (14064, 57, 11);
INSERT INTO `item_mods` VALUES (14065, 1, 12);
INSERT INTO `item_mods` VALUES (14065, 2, 30);
INSERT INTO `item_mods` VALUES (14065, 10, 2);
INSERT INTO `item_mods` VALUES (14066, 1, 13);
INSERT INTO `item_mods` VALUES (14066, 2, 35);
INSERT INTO `item_mods` VALUES (14066, 10, 3);
INSERT INTO `item_mods` VALUES (14067, 1, 7);
INSERT INTO `item_mods` VALUES (14067, 14, -5);
INSERT INTO `item_mods` VALUES (14067, 23, 10);
INSERT INTO `item_mods` VALUES (14067, 54, 5);
INSERT INTO `item_mods` VALUES (14068, 1, 1);
INSERT INTO `item_mods` VALUES (14068, 72, 1);
INSERT INTO `item_mods` VALUES (14069, 1, 3);
INSERT INTO `item_mods` VALUES (14069, 72, 1);
INSERT INTO `item_mods` VALUES (14070, 1, 1);
INSERT INTO `item_mods` VALUES (14070, 127, 1);
INSERT INTO `item_mods` VALUES (14071, 1, 3);
INSERT INTO `item_mods` VALUES (14071, 127, 1);

-- -------------------------------------------------------
-- Chocobo Boots
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (14072, 1, 1); -- DEF+1
INSERT INTO `item_mods` VALUES (14072, 511, 3); -- Chocobo riding time +3 min

-- -------------------------------------------------------
-- Rider's Boots
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (14073, 1, 3); -- DEF+3
INSERT INTO `item_mods` VALUES (14073, 511, 3); -- Chocobo riding time +3 min

INSERT INTO `item_mods` VALUES (14074, 1, 8);
INSERT INTO `item_mods` VALUES (14074, 14, -6);
INSERT INTO `item_mods` VALUES (14074, 23, 12);
INSERT INTO `item_mods` VALUES (14074, 54, 6);
INSERT INTO `item_mods` VALUES (14075, 1, 12);
INSERT INTO `item_mods` VALUES (14075, 12, -7);
INSERT INTO `item_mods` VALUES (14076, 1, 25);
INSERT INTO `item_mods` VALUES (14076, 2, 8);
INSERT INTO `item_mods` VALUES (14076, 8, 7);
INSERT INTO `item_mods` VALUES (14076, 9, 4);
INSERT INTO `item_mods` VALUES (14076, 384, -50);
INSERT INTO `item_mods` VALUES (14077, 1, 26);
INSERT INTO `item_mods` VALUES (14077, 2, 10);
INSERT INTO `item_mods` VALUES (14077, 8, 8);
INSERT INTO `item_mods` VALUES (14077, 9, 5);
INSERT INTO `item_mods` VALUES (14077, 384, -70);
INSERT INTO `item_mods` VALUES (14078, 1, 20);
INSERT INTO `item_mods` VALUES (14078, 2, -20);
INSERT INTO `item_mods` VALUES (14078, 5, 20);
INSERT INTO `item_mods` VALUES (14078, 12, 5);
INSERT INTO `item_mods` VALUES (14078, 27, -2);
INSERT INTO `item_mods` VALUES (14079, 1, 21);
INSERT INTO `item_mods` VALUES (14079, 2, -25);
INSERT INTO `item_mods` VALUES (14079, 5, 25);
INSERT INTO `item_mods` VALUES (14079, 12, 6);
INSERT INTO `item_mods` VALUES (14079, 27, -3);
INSERT INTO `item_mods` VALUES (14080, 1, 4);
INSERT INTO `item_mods` VALUES (14080, 11, 2);
INSERT INTO `item_mods` VALUES (14080, 169, 12);
INSERT INTO `item_mods` VALUES (14081, 1, 10);
INSERT INTO `item_mods` VALUES (14081, 2, 3);
INSERT INTO `item_mods` VALUES (14082, 1, 10);
INSERT INTO `item_mods` VALUES (14082, 11, 1);
INSERT INTO `item_mods` VALUES (14083, 1, 12);
INSERT INTO `item_mods` VALUES (14083, 2, 4);
INSERT INTO `item_mods` VALUES (14083, 55, -2);
INSERT INTO `item_mods` VALUES (14083, 59, 7);
INSERT INTO `item_mods` VALUES (14083, 61, 7);
INSERT INTO `item_mods` VALUES (14084, 1, 15);
INSERT INTO `item_mods` VALUES (14084, 60, 3);
INSERT INTO `item_mods` VALUES (14086, 1, 12);
INSERT INTO `item_mods` VALUES (14086, 12, 1);
INSERT INTO `item_mods` VALUES (14086, 54, -1);
INSERT INTO `item_mods` VALUES (14086, 57, 4);
INSERT INTO `item_mods` VALUES (14086, 59, 3);
INSERT INTO `item_mods` VALUES (14087, 1, 14);
INSERT INTO `item_mods` VALUES (14087, 10, 2);
INSERT INTO `item_mods` VALUES (14087, 61, 4);
INSERT INTO `item_mods` VALUES (14088, 1, 13);
INSERT INTO `item_mods` VALUES (14088, 10, 2);
INSERT INTO `item_mods` VALUES (14088, 57, 4);
INSERT INTO `item_mods` VALUES (14089, 1, 14);
INSERT INTO `item_mods` VALUES (14089, 2, 12);
INSERT INTO `item_mods` VALUES (14089, 11, 3);
INSERT INTO `item_mods` VALUES (14089, 27, 1);
INSERT INTO `item_mods` VALUES (14089, 288, 1);
INSERT INTO `item_mods` VALUES (14090, 1, 12);
INSERT INTO `item_mods` VALUES (14090, 2, 12);
INSERT INTO `item_mods` VALUES (14090, 9, 3);
INSERT INTO `item_mods` VALUES (14090, 60, 10);
INSERT INTO `item_mods` VALUES (14091, 1, 12);
INSERT INTO `item_mods` VALUES (14091, 5, 10);
INSERT INTO `item_mods` VALUES (14091, 11, 3);
INSERT INTO `item_mods` VALUES (14091, 168, 20);
INSERT INTO `item_mods` VALUES (14092, 1, 11);
INSERT INTO `item_mods` VALUES (14092, 5, 10);
INSERT INTO `item_mods` VALUES (14092, 11, 3);
INSERT INTO `item_mods` VALUES (14092, 27, -1);
INSERT INTO `item_mods` VALUES (14092, 168, 20);
INSERT INTO `item_mods` VALUES (14093, 1, 13);
INSERT INTO `item_mods` VALUES (14093, 5, 11);
INSERT INTO `item_mods` VALUES (14093, 11, 3);
INSERT INTO `item_mods` VALUES (14093, 59, 10);
INSERT INTO `item_mods` VALUES (14093, 109, 10);
INSERT INTO `item_mods` VALUES (14094, 1, 13);
INSERT INTO `item_mods` VALUES (14094, 2, 12);
INSERT INTO `item_mods` VALUES (14094, 9, 3);
INSERT INTO `item_mods` VALUES (14094, 298, 2);
INSERT INTO `item_mods` VALUES (14095, 1, 14);
INSERT INTO `item_mods` VALUES (14095, 2, 15);
INSERT INTO `item_mods` VALUES (14095, 14, 5);
INSERT INTO `item_mods` VALUES (14095, 109, 10);
INSERT INTO `item_mods` VALUES (14096, 1, 10);
INSERT INTO `item_mods` VALUES (14096, 2, 15);
INSERT INTO `item_mods` VALUES (14096, 13, 5);
INSERT INTO `item_mods` VALUES (14097, 1, 10);
INSERT INTO `item_mods` VALUES (14097, 2, 11);
INSERT INTO `item_mods` VALUES (14097, 11, 3);
INSERT INTO `item_mods` VALUES (14097, 360, 2);
INSERT INTO `item_mods` VALUES (14097, 364, 10);
INSERT INTO `item_mods` VALUES (14098, 1, 10);
INSERT INTO `item_mods` VALUES (14098, 2, 10);
INSERT INTO `item_mods` VALUES (14098, 11, 3);
INSERT INTO `item_mods` VALUES (14098, 56, 10);
INSERT INTO `item_mods` VALUES (14098, 68, 5);
INSERT INTO `item_mods` VALUES (14099, 1, 12);
INSERT INTO `item_mods` VALUES (14099, 2, 10);
INSERT INTO `item_mods` VALUES (14099, 11, 4);
INSERT INTO `item_mods` VALUES (14099, 68, 5);
INSERT INTO `item_mods` VALUES (14100, 1, 13);
INSERT INTO `item_mods` VALUES (14100, 2, 20);
INSERT INTO `item_mods` VALUES (14100, 27, 5);
INSERT INTO `item_mods` VALUES (14100, 54, 10);
INSERT INTO `item_mods` VALUES (14100, 108, 5);
INSERT INTO `item_mods` VALUES (14101, 1, 12);
INSERT INTO `item_mods` VALUES (14101, 2, 12);
INSERT INTO `item_mods` VALUES (14101, 11, 4);
INSERT INTO `item_mods` VALUES (14102, 1, 10);
INSERT INTO `item_mods` VALUES (14102, 2, 12);
INSERT INTO `item_mods` VALUES (14102, 11, 3);
INSERT INTO `item_mods` VALUES (14102, 108, 5);
INSERT INTO `item_mods` VALUES (14102, 362, 10);
INSERT INTO `item_mods` VALUES (14103, 1, 10);
INSERT INTO `item_mods` VALUES (14103, 5, 15);
INSERT INTO `item_mods` VALUES (14103, 11, 5);
INSERT INTO `item_mods` VALUES (14104, 1, 12);
INSERT INTO `item_mods` VALUES (14104, 68, 3);
INSERT INTO `item_mods` VALUES (14105, 1, 16);
INSERT INTO `item_mods` VALUES (14105, 5, 7);
INSERT INTO `item_mods` VALUES (14105, 9, 4);
INSERT INTO `item_mods` VALUES (14105, 10, -1);
INSERT INTO `item_mods` VALUES (14105, 60, 3);
INSERT INTO `item_mods` VALUES (14105, 61, 3);
INSERT INTO `item_mods` VALUES (14106, 1, 13);
INSERT INTO `item_mods` VALUES (14106, 58, -2);
INSERT INTO `item_mods` VALUES (14106, 59, 4);
INSERT INTO `item_mods` VALUES (14106, 163, -5);
INSERT INTO `item_mods` VALUES (14107, 1, 14);
INSERT INTO `item_mods` VALUES (14107, 2, 11);
INSERT INTO `item_mods` VALUES (14107, 56, 12);
INSERT INTO `item_mods` VALUES (14107, 57, 12);
INSERT INTO `item_mods` VALUES (14107, 162, -5);
INSERT INTO `item_mods` VALUES (14108, 1, 12);
INSERT INTO `item_mods` VALUES (14108, 23, 4);
INSERT INTO `item_mods` VALUES (14108, 54, -2);
INSERT INTO `item_mods` VALUES (14108, 55, 4);
INSERT INTO `item_mods` VALUES (14109, 1, 13);
INSERT INTO `item_mods` VALUES (14109, 3, -1);
INSERT INTO `item_mods` VALUES (14109, 8, -1);
INSERT INTO `item_mods` VALUES (14109, 11, 3);
INSERT INTO `item_mods` VALUES (14109, 68, 3);
INSERT INTO `item_mods` VALUES (14110, 1, 13);
INSERT INTO `item_mods` VALUES (14110, 60, 2);
INSERT INTO `item_mods` VALUES (14110, 61, 2);
INSERT INTO `item_mods` VALUES (14110, 161, -2);
INSERT INTO `item_mods` VALUES (14111, 1, 13);
INSERT INTO `item_mods` VALUES (14111, 4, 20);
INSERT INTO `item_mods` VALUES (14111, 8, 3);
INSERT INTO `item_mods` VALUES (14111, 10, 1);
INSERT INTO `item_mods` VALUES (14111, 163, -5);
INSERT INTO `item_mods` VALUES (14112, 1, 10);
INSERT INTO `item_mods` VALUES (14113, 1, 15);
INSERT INTO `item_mods` VALUES (14113, 2, 14);
INSERT INTO `item_mods` VALUES (14113, 10, -2);
INSERT INTO `item_mods` VALUES (14113, 23, 6);
INSERT INTO `item_mods` VALUES (14113, 24, 6);
INSERT INTO `item_mods` VALUES (14114, 1, 15);
INSERT INTO `item_mods` VALUES (14114, 5, 13);
INSERT INTO `item_mods` VALUES (14114, 11, 3);
INSERT INTO `item_mods` VALUES (14114, 14, 2);
INSERT INTO `item_mods` VALUES (14115, 1, 10);
INSERT INTO `item_mods` VALUES (14115, 2, 6);
INSERT INTO `item_mods` VALUES (14115, 60, 4);
INSERT INTO `item_mods` VALUES (14115, 61, -2);
INSERT INTO `item_mods` VALUES (14116, 1, 2);
INSERT INTO `item_mods` VALUES (14118, 1, 8);
INSERT INTO `item_mods` VALUES (14119, 1, 9);
INSERT INTO `item_mods` VALUES (14120, 1, 10);
INSERT INTO `item_mods` VALUES (14121, 1, 11);
INSERT INTO `item_mods` VALUES (14122, 1, 9);
INSERT INTO `item_mods` VALUES (14123, 1, 20);
INSERT INTO `item_mods` VALUES (14123, 7, 50);
INSERT INTO `item_mods` VALUES (14123, 12, 2);
INSERT INTO `item_mods` VALUES (14123, 14, 2);
INSERT INTO `item_mods` VALUES (14124, 1, 21);
INSERT INTO `item_mods` VALUES (14124, 7, 55);
INSERT INTO `item_mods` VALUES (14124, 12, 3);
INSERT INTO `item_mods` VALUES (14124, 14, 3);
INSERT INTO `item_mods` VALUES (14125, 1, 2);
INSERT INTO `item_mods` VALUES (14125, 14, 1);
INSERT INTO `item_mods` VALUES (14126, 1, 1);
INSERT INTO `item_mods` VALUES (14126, 60, 5);
INSERT INTO `item_mods` VALUES (14127, 1, 13);
INSERT INTO `item_mods` VALUES (14127, 23, 5);
INSERT INTO `item_mods` VALUES (14127, 25, 2);
INSERT INTO `item_mods` VALUES (14127, 68, -2);
INSERT INTO `item_mods` VALUES (14128, 1, 8);
INSERT INTO `item_mods` VALUES (14128, 386, 25);
INSERT INTO `item_mods` VALUES (14129, 1, 10);
INSERT INTO `item_mods` VALUES (14129, 27, 1);
INSERT INTO `item_mods` VALUES (14129, 68, 4);
INSERT INTO `item_mods` VALUES (14130, 1, 9);
INSERT INTO `item_mods` VALUES (14130, 386, 27);
INSERT INTO `item_mods` VALUES (14131, 1, 10);
INSERT INTO `item_mods` VALUES (14131, 386, 30);
INSERT INTO `item_mods` VALUES (14132, 1, 5);
INSERT INTO `item_mods` VALUES (14132, 9, 3);
INSERT INTO `item_mods` VALUES (14132, 11, 3);
INSERT INTO `item_mods` VALUES (14133, 1, 6);
INSERT INTO `item_mods` VALUES (14133, 9, 3);
INSERT INTO `item_mods` VALUES (14133, 11, 3);
INSERT INTO `item_mods` VALUES (14134, 1, 5);
INSERT INTO `item_mods` VALUES (14134, 56, 3);
INSERT INTO `item_mods` VALUES (14134, 68, 4);
INSERT INTO `item_mods` VALUES (14135, 1, 6);
INSERT INTO `item_mods` VALUES (14135, 56, 4);
INSERT INTO `item_mods` VALUES (14135, 68, 5);
INSERT INTO `item_mods` VALUES (14136, 1, 11);
INSERT INTO `item_mods` VALUES (14136, 27, 2);
INSERT INTO `item_mods` VALUES (14136, 68, 5);
INSERT INTO `item_mods` VALUES (14137, 1, 12);
INSERT INTO `item_mods` VALUES (14137, 11, 2);
INSERT INTO `item_mods` VALUES (14138, 1, 13);
INSERT INTO `item_mods` VALUES (14138, 11, 2);
INSERT INTO `item_mods` VALUES (14139, 1, 3);
INSERT INTO `item_mods` VALUES (14139, 2, 2);
INSERT INTO `item_mods` VALUES (14139, 5, 2);
INSERT INTO `item_mods` VALUES (14139, 56, 3);
INSERT INTO `item_mods` VALUES (14139, 57, 3);
INSERT INTO `item_mods` VALUES (14140, 1, 4);
INSERT INTO `item_mods` VALUES (14140, 2, 3);
INSERT INTO `item_mods` VALUES (14140, 5, 3);
INSERT INTO `item_mods` VALUES (14140, 56, 3);
INSERT INTO `item_mods` VALUES (14140, 57, 3);
INSERT INTO `item_mods` VALUES (14141, 1, 8);
INSERT INTO `item_mods` VALUES (14141, 11, 1);
INSERT INTO `item_mods` VALUES (14142, 1, 9);
INSERT INTO `item_mods` VALUES (14142, 11, 1);
INSERT INTO `item_mods` VALUES (14143, 1, 11);
INSERT INTO `item_mods` VALUES (14143, 26, 5);
INSERT INTO `item_mods` VALUES (14144, 1, 12);
INSERT INTO `item_mods` VALUES (14144, 26, 5);
INSERT INTO `item_mods` VALUES (14145, 1, 4);
INSERT INTO `item_mods` VALUES (14145, 2, 4);
INSERT INTO `item_mods` VALUES (14145, 54, 3);
INSERT INTO `item_mods` VALUES (14145, 55, 3);
INSERT INTO `item_mods` VALUES (14146, 1, 5);
INSERT INTO `item_mods` VALUES (14146, 2, 6);
INSERT INTO `item_mods` VALUES (14146, 54, 3);
INSERT INTO `item_mods` VALUES (14146, 55, 3);
INSERT INTO `item_mods` VALUES (14147, 1, 8);
INSERT INTO `item_mods` VALUES (14147, 11, 1);
INSERT INTO `item_mods` VALUES (14148, 1, 9);
INSERT INTO `item_mods` VALUES (14148, 11, 1);
INSERT INTO `item_mods` VALUES (14149, 1, 6);
INSERT INTO `item_mods` VALUES (14149, 2, 3);
INSERT INTO `item_mods` VALUES (14149, 5, 3);
INSERT INTO `item_mods` VALUES (14149, 11, 1);
INSERT INTO `item_mods` VALUES (14150, 1, 7);
INSERT INTO `item_mods` VALUES (14150, 2, 4);
INSERT INTO `item_mods` VALUES (14150, 5, 4);
INSERT INTO `item_mods` VALUES (14150, 11, 1);
INSERT INTO `item_mods` VALUES (14151, 1, 5);
INSERT INTO `item_mods` VALUES (14151, 23, 3);
INSERT INTO `item_mods` VALUES (14151, 24, 3);
INSERT INTO `item_mods` VALUES (14151, 57, 6);
INSERT INTO `item_mods` VALUES (14152, 1, 6);
INSERT INTO `item_mods` VALUES (14152, 23, 4);
INSERT INTO `item_mods` VALUES (14152, 24, 4);
INSERT INTO `item_mods` VALUES (14152, 57, 6);
INSERT INTO `item_mods` VALUES (14153, 1, 6);
INSERT INTO `item_mods` VALUES (14153, 11, 1);
INSERT INTO `item_mods` VALUES (14154, 1, 7);
INSERT INTO `item_mods` VALUES (14154, 11, 1);
INSERT INTO `item_mods` VALUES (14155, 1, 8);
INSERT INTO `item_mods` VALUES (14155, 55, 4);
INSERT INTO `item_mods` VALUES (14155, 57, 4);
INSERT INTO `item_mods` VALUES (14156, 1, 9);
INSERT INTO `item_mods` VALUES (14156, 55, 4);
INSERT INTO `item_mods` VALUES (14156, 57, 4);
INSERT INTO `item_mods` VALUES (14157, 1, 10);
INSERT INTO `item_mods` VALUES (14157, 55, 10);
INSERT INTO `item_mods` VALUES (14158, 1, 11);
INSERT INTO `item_mods` VALUES (14158, 55, 10);
INSERT INTO `item_mods` VALUES (14159, 1, 14);
INSERT INTO `item_mods` VALUES (14159, 5, 15);
INSERT INTO `item_mods` VALUES (14159, 13, 5);
INSERT INTO `item_mods` VALUES (14159, 23, 12);
INSERT INTO `item_mods` VALUES (14159, 68, -7);
INSERT INTO `item_mods` VALUES (14160, 1, 24);
INSERT INTO `item_mods` VALUES (14160, 2, 15);
INSERT INTO `item_mods` VALUES (14160, 5, 15);
INSERT INTO `item_mods` VALUES (14160, 9, 3);
INSERT INTO `item_mods` VALUES (14160, 11, 3);
INSERT INTO `item_mods` VALUES (14160, 55, 20);
INSERT INTO `item_mods` VALUES (14160, 56, 20);
INSERT INTO `item_mods` VALUES (14160, 57, 20);
INSERT INTO `item_mods` VALUES (14160, 60, 20);
INSERT INTO `item_mods` VALUES (14161, 1, 25);
INSERT INTO `item_mods` VALUES (14161, 2, 17);
INSERT INTO `item_mods` VALUES (14161, 5, 17);
INSERT INTO `item_mods` VALUES (14161, 9, 4);
INSERT INTO `item_mods` VALUES (14161, 11, 4);
INSERT INTO `item_mods` VALUES (14161, 55, 21);
INSERT INTO `item_mods` VALUES (14161, 56, 21);
INSERT INTO `item_mods` VALUES (14161, 57, 21);
INSERT INTO `item_mods` VALUES (14161, 60, 21);

-- -------------------------------------------------------
-- Agrona's Leggings
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (14162, 1, 15); -- def 15
INSERT INTO `item_mods` VALUES (14162, 8, 4); -- str 4
INSERT INTO `item_mods` VALUES (14162, 25, 3); -- accuracy 3
INSERT INTO `item_mods` VALUES (14162, 288, 2); -- double attack 2%
INSERT INTO `item_mods` VALUES (14162, 384, -40); -- Slow +4%

INSERT INTO `item_mods` VALUES (14163, 1, 26);
INSERT INTO `item_mods` VALUES (14163, 2, 22);
INSERT INTO `item_mods` VALUES (14163, 8, -6);
INSERT INTO `item_mods` VALUES (14163, 9, -6);
INSERT INTO `item_mods` VALUES (14163, 10, 11);
INSERT INTO `item_mods` VALUES (14163, 14, 11);
INSERT INTO `item_mods` VALUES (14163, 242, 2);
INSERT INTO `item_mods` VALUES (14164, 1, 7);
INSERT INTO `item_mods` VALUES (14164, 5, 10);
INSERT INTO `item_mods` VALUES (14165, 1, 8);
INSERT INTO `item_mods` VALUES (14165, 5, 13);
INSERT INTO `item_mods` VALUES (14166, 1, 11);
INSERT INTO `item_mods` VALUES (14166, 2, 10);
INSERT INTO `item_mods` VALUES (14166, 11, 1);
INSERT INTO `item_mods` VALUES (14167, 1, 12);
INSERT INTO `item_mods` VALUES (14167, 2, 12);
INSERT INTO `item_mods` VALUES (14167, 11, 2);
INSERT INTO `item_mods` VALUES (14168, 1, 11);
INSERT INTO `item_mods` VALUES (14168, 386, 30);
INSERT INTO `item_mods` VALUES (14169, 1, 1);
INSERT INTO `item_mods` VALUES (14169, 72, 1);
INSERT INTO `item_mods` VALUES (14170, 1, 3);
INSERT INTO `item_mods` VALUES (14170, 72, 1);
INSERT INTO `item_mods` VALUES (14171, 1, 1);
INSERT INTO `item_mods` VALUES (14171, 127, 1);
INSERT INTO `item_mods` VALUES (14172, 1, 3);
INSERT INTO `item_mods` VALUES (14172, 127, 1);

-- -------------------------------------------------------
-- Chocobo Jack Coat
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (14173, 1, 1); -- DEF+1
INSERT INTO `item_mods` VALUES (14173, 511, 5); -- Chocobo riding time +5 min

-- -------------------------------------------------------
-- Rider's Jack Coat 
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (14174, 1, 3); -- DEF+3
INSERT INTO `item_mods` VALUES (14174, 511, 5); -- Chocobo riding time +5 min

INSERT INTO `item_mods` VALUES (14175, 1, 19);
INSERT INTO `item_mods` VALUES (14175, 13, -11);
INSERT INTO `item_mods` VALUES (14175, 23, 6);
INSERT INTO `item_mods` VALUES (14175, 25, 4);
INSERT INTO `item_mods` VALUES (14175, 68, -4);

-- -------------------------------------------------------
-- Field Boots
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (14176, 1, 1); -- DEF+1
INSERT INTO `item_mods` VALUES (14176, 513, 73); -- Improves harvesting results, 73 = 0.073
INSERT INTO `item_mods` VALUES (14176, 515, 73); -- Improves mining results, 73 = 0.073

-- -------------------------------------------------------
-- Worker Boots
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (14177, 1, 3); -- DEF+3
INSERT INTO `item_mods` VALUES (14177, 513, 73); -- Improves harvesting results, 73 = 0.073
INSERT INTO `item_mods` VALUES (14177, 515, 73); -- Improves mining results, 73 = 0.073

INSERT INTO `item_mods` VALUES (14178, 1, 23);
INSERT INTO `item_mods` VALUES (14178, 23, 5);
INSERT INTO `item_mods` VALUES (14178, 68, 5);
INSERT INTO `item_mods` VALUES (14179, 1, 24);
INSERT INTO `item_mods` VALUES (14179, 23, 6);
INSERT INTO `item_mods` VALUES (14179, 68, 6);
INSERT INTO `item_mods` VALUES (14179, 291, 1);
INSERT INTO `item_mods` VALUES (14180, 1, 22);
INSERT INTO `item_mods` VALUES (14180, 2, 7);
INSERT INTO `item_mods` VALUES (14180, 8, 6);
INSERT INTO `item_mods` VALUES (14180, 9, 3);
INSERT INTO `item_mods` VALUES (14180, 384, -40);
INSERT INTO `item_mods` VALUES (14181, 1, 23);
INSERT INTO `item_mods` VALUES (14181, 2, 9);
INSERT INTO `item_mods` VALUES (14181, 8, 7);
INSERT INTO `item_mods` VALUES (14181, 9, 4);
INSERT INTO `item_mods` VALUES (14181, 384, -61);
INSERT INTO `item_mods` VALUES (14182, 1, 18);
INSERT INTO `item_mods` VALUES (14182, 2, -20);
INSERT INTO `item_mods` VALUES (14182, 5, 20);
INSERT INTO `item_mods` VALUES (14182, 13, 5);
INSERT INTO `item_mods` VALUES (14182, 27, -2);
INSERT INTO `item_mods` VALUES (14183, 1, 19);
INSERT INTO `item_mods` VALUES (14183, 2, -25);
INSERT INTO `item_mods` VALUES (14183, 5, 25);
INSERT INTO `item_mods` VALUES (14183, 13, 6);
INSERT INTO `item_mods` VALUES (14183, 27, -3);
INSERT INTO `item_mods` VALUES (14184, 1, 16);
INSERT INTO `item_mods` VALUES (14184, 2, -20);
INSERT INTO `item_mods` VALUES (14184, 25, 4);
INSERT INTO `item_mods` VALUES (14184, 249, 2);
INSERT INTO `item_mods` VALUES (14185, 1, 17);
INSERT INTO `item_mods` VALUES (14185, 2, -25);
INSERT INTO `item_mods` VALUES (14185, 25, 5);
INSERT INTO `item_mods` VALUES (14185, 249, 3);
INSERT INTO `item_mods` VALUES (14186, 1, 14);
INSERT INTO `item_mods` VALUES (14186, 9, 3);
INSERT INTO `item_mods` VALUES (14186, 11, 3);
INSERT INTO `item_mods` VALUES (14186, 23, 2);
INSERT INTO `item_mods` VALUES (14186, 27, 1);
INSERT INTO `item_mods` VALUES (14187, 1, 15);
INSERT INTO `item_mods` VALUES (14187, 9, 4);
INSERT INTO `item_mods` VALUES (14187, 11, 4);
INSERT INTO `item_mods` VALUES (14187, 23, 3);
INSERT INTO `item_mods` VALUES (14187, 27, 2);
INSERT INTO `item_mods` VALUES (14188, 1, 24);
INSERT INTO `item_mods` VALUES (14188, 2, 27);
INSERT INTO `item_mods` VALUES (14188, 23, 5);
INSERT INTO `item_mods` VALUES (14188, 169, -3);
INSERT INTO `item_mods` VALUES (14188, 384, 30);
INSERT INTO `item_mods` VALUES (14189, 1, 7);
INSERT INTO `item_mods` VALUES (14189, 5, 10);
INSERT INTO `item_mods` VALUES (14189, 10, -1);
INSERT INTO `item_mods` VALUES (14189, 14, -1);
INSERT INTO `item_mods` VALUES (14189, 27, -3);
INSERT INTO `item_mods` VALUES (14189, 117, 3);
INSERT INTO `item_mods` VALUES (14190, 1, 8);
INSERT INTO `item_mods` VALUES (14190, 5, 15);
INSERT INTO `item_mods` VALUES (14190, 10, -2);
INSERT INTO `item_mods` VALUES (14190, 14, -2);
INSERT INTO `item_mods` VALUES (14190, 27, -4);
INSERT INTO `item_mods` VALUES (14190, 117, 4);
INSERT INTO `item_mods` VALUES (14191, 1, 13);
INSERT INTO `item_mods` VALUES (14191, 8, 2);
INSERT INTO `item_mods` VALUES (14191, 14, 3);
INSERT INTO `item_mods` VALUES (14191, 27, 1);
INSERT INTO `item_mods` VALUES (14192, 1, 14);
INSERT INTO `item_mods` VALUES (14192, 8, 3);
INSERT INTO `item_mods` VALUES (14192, 14, 4);
INSERT INTO `item_mods` VALUES (14192, 27, 2);
INSERT INTO `item_mods` VALUES (14193, 1, 18);
INSERT INTO `item_mods` VALUES (14193, 2, 17);
INSERT INTO `item_mods` VALUES (14193, 10, 2);
INSERT INTO `item_mods` VALUES (14193, 11, -2);
INSERT INTO `item_mods` VALUES (14193, 27, 2);
INSERT INTO `item_mods` VALUES (14194, 1, 22);
INSERT INTO `item_mods` VALUES (14194, 10, 3);
INSERT INTO `item_mods` VALUES (14194, 11, 3);
INSERT INTO `item_mods` VALUES (14194, 23, 3);
INSERT INTO `item_mods` VALUES (14194, 161, -3);
INSERT INTO `item_mods` VALUES (14195, 1, 2);
INSERT INTO `item_mods` VALUES (14195, 59, 1);
INSERT INTO `item_mods` VALUES (14195, 127, 2);
INSERT INTO `item_mods` VALUES (14196, 1, 13);
INSERT INTO `item_mods` VALUES (14196, 10, -2);
INSERT INTO `item_mods` VALUES (14196, 14, 3);
INSERT INTO `item_mods` VALUES (14196, 68, 6);
INSERT INTO `item_mods` VALUES (14197, 1, 14);
INSERT INTO `item_mods` VALUES (14197, 10, -3);
INSERT INTO `item_mods` VALUES (14197, 14, 4);
INSERT INTO `item_mods` VALUES (14197, 68, 7);
INSERT INTO `item_mods` VALUES (14198, 1, 9);
INSERT INTO `item_mods` VALUES (14198, 2, 60);
INSERT INTO `item_mods` VALUES (14198, 8, 3);
INSERT INTO `item_mods` VALUES (14198, 9, 3);
INSERT INTO `item_mods` VALUES (14198, 10, 2);
INSERT INTO `item_mods` VALUES (14198, 11, 2);
INSERT INTO `item_mods` VALUES (14198, 12, -3);
INSERT INTO `item_mods` VALUES (14198, 13, -3);
INSERT INTO `item_mods` VALUES (14198, 14, -3);
INSERT INTO `item_mods` VALUES (14199, 1, 9);
INSERT INTO `item_mods` VALUES (14199, 2, 60);
INSERT INTO `item_mods` VALUES (14199, 8, 3);
INSERT INTO `item_mods` VALUES (14199, 9, 3);
INSERT INTO `item_mods` VALUES (14199, 10, 2);
INSERT INTO `item_mods` VALUES (14199, 11, 2);
INSERT INTO `item_mods` VALUES (14199, 12, -3);
INSERT INTO `item_mods` VALUES (14199, 13, -3);
INSERT INTO `item_mods` VALUES (14199, 14, -3);
INSERT INTO `item_mods` VALUES (14200, 1, 9);
INSERT INTO `item_mods` VALUES (14200, 5, 30);
INSERT INTO `item_mods` VALUES (14200, 8, -3);
INSERT INTO `item_mods` VALUES (14200, 11, 6);
INSERT INTO `item_mods` VALUES (14200, 12, 3);
INSERT INTO `item_mods` VALUES (14201, 1, 9);
INSERT INTO `item_mods` VALUES (14201, 5, 30);
INSERT INTO `item_mods` VALUES (14201, 8, -3);
INSERT INTO `item_mods` VALUES (14201, 11, 6);
INSERT INTO `item_mods` VALUES (14201, 12, 3);
INSERT INTO `item_mods` VALUES (14202, 1, 9);
INSERT INTO `item_mods` VALUES (14202, 2, 35);
INSERT INTO `item_mods` VALUES (14202, 5, -35);
INSERT INTO `item_mods` VALUES (14202, 8, 4);
INSERT INTO `item_mods` VALUES (14202, 10, 4);
INSERT INTO `item_mods` VALUES (14202, 12, -3);
INSERT INTO `item_mods` VALUES (14203, 1, 9);
INSERT INTO `item_mods` VALUES (14203, 2, 35);
INSERT INTO `item_mods` VALUES (14203, 5, -35);
INSERT INTO `item_mods` VALUES (14203, 8, 4);
INSERT INTO `item_mods` VALUES (14203, 10, 4);
INSERT INTO `item_mods` VALUES (14203, 12, -3);
INSERT INTO `item_mods` VALUES (14204, 1, 9);
INSERT INTO `item_mods` VALUES (14204, 5, 35);
INSERT INTO `item_mods` VALUES (14204, 9, -3);
INSERT INTO `item_mods` VALUES (14204, 12, 4);
INSERT INTO `item_mods` VALUES (14204, 13, 4);
INSERT INTO `item_mods` VALUES (14205, 1, 9);
INSERT INTO `item_mods` VALUES (14205, 2, -20);
INSERT INTO `item_mods` VALUES (14205, 5, 45);
INSERT INTO `item_mods` VALUES (14205, 10, -3);
INSERT INTO `item_mods` VALUES (14205, 14, 4);
INSERT INTO `item_mods` VALUES (14206, 1, 4);
INSERT INTO `item_mods` VALUES (14206, 12, 1);
INSERT INTO `item_mods` VALUES (14206, 13, 1);
INSERT INTO `item_mods` VALUES (14207, 1, 5);
INSERT INTO `item_mods` VALUES (14207, 9, 2);
INSERT INTO `item_mods` VALUES (14207, 61, 2);
INSERT INTO `item_mods` VALUES (14208, 1, 29);
INSERT INTO `item_mods` VALUES (14208, 2, 4);
INSERT INTO `item_mods` VALUES (14208, 55, -2);
INSERT INTO `item_mods` VALUES (14208, 59, 7);
INSERT INTO `item_mods` VALUES (14208, 61, 7);
INSERT INTO `item_mods` VALUES (14209, 1, 34);
INSERT INTO `item_mods` VALUES (14209, 60, 3);
INSERT INTO `item_mods` VALUES (14210, 1, 37);
INSERT INTO `item_mods` VALUES (14210, 9, 5);
INSERT INTO `item_mods` VALUES (14210, 10, 5);
INSERT INTO `item_mods` VALUES (14210, 25, 10);
INSERT INTO `item_mods` VALUES (14210, 27, 2);
INSERT INTO `item_mods` VALUES (14210, 384, 20);
INSERT INTO `item_mods` VALUES (14211, 1, 29);
INSERT INTO `item_mods` VALUES (14211, 12, 1);
INSERT INTO `item_mods` VALUES (14211, 54, 1);
INSERT INTO `item_mods` VALUES (14211, 56, 3);
INSERT INTO `item_mods` VALUES (14212, 1, 35);
INSERT INTO `item_mods` VALUES (14212, 8, 1);
INSERT INTO `item_mods` VALUES (14212, 10, 3);
INSERT INTO `item_mods` VALUES (14212, 61, 6);
INSERT INTO `item_mods` VALUES (14213, 1, 31);
INSERT INTO `item_mods` VALUES (14213, 10, 2);
INSERT INTO `item_mods` VALUES (14213, 57, 7);
INSERT INTO `item_mods` VALUES (14214, 1, 34);
INSERT INTO `item_mods` VALUES (14214, 2, 15);
INSERT INTO `item_mods` VALUES (14214, 25, 3);
INSERT INTO `item_mods` VALUES (14214, 27, 2);
INSERT INTO `item_mods` VALUES (14214, 68, 3);
INSERT INTO `item_mods` VALUES (14215, 1, 29);
INSERT INTO `item_mods` VALUES (14215, 2, 18);
INSERT INTO `item_mods` VALUES (14215, 107, 10);
INSERT INTO `item_mods` VALUES (14215, 291, 1);
INSERT INTO `item_mods` VALUES (14216, 1, 28);
INSERT INTO `item_mods` VALUES (14216, 5, 15);
INSERT INTO `item_mods` VALUES (14216, 10, 3);
INSERT INTO `item_mods` VALUES (14216, 27, -1);
INSERT INTO `item_mods` VALUES (14216, 111, 15);
INSERT INTO `item_mods` VALUES (14217, 1, 27);
INSERT INTO `item_mods` VALUES (14217, 5, 14);
INSERT INTO `item_mods` VALUES (14217, 27, -1);
INSERT INTO `item_mods` VALUES (14217, 68, 5);
INSERT INTO `item_mods` VALUES (14217, 116, 15);
INSERT INTO `item_mods` VALUES (14218, 1, 33);
INSERT INTO `item_mods` VALUES (14218, 5, 13);
INSERT INTO `item_mods` VALUES (14218, 13, 3);
INSERT INTO `item_mods` VALUES (14218, 112, 10);
INSERT INTO `item_mods` VALUES (14218, 113, 15);
INSERT INTO `item_mods` VALUES (14219, 1, 32);
INSERT INTO `item_mods` VALUES (14219, 2, 15);
INSERT INTO `item_mods` VALUES (14219, 11, 4);
INSERT INTO `item_mods` VALUES (14219, 109, 10);
INSERT INTO `item_mods` VALUES (14219, 298, 1);
INSERT INTO `item_mods` VALUES (14220, 1, 34);
INSERT INTO `item_mods` VALUES (14220, 2, 15);
INSERT INTO `item_mods` VALUES (14220, 11, 3);
INSERT INTO `item_mods` VALUES (14220, 27, 2);
INSERT INTO `item_mods` VALUES (14220, 113, 5);
INSERT INTO `item_mods` VALUES (14221, 1, 31);
INSERT INTO `item_mods` VALUES (14221, 2, 15);
INSERT INTO `item_mods` VALUES (14221, 12, 3);
INSERT INTO `item_mods` VALUES (14221, 68, 5);
INSERT INTO `item_mods` VALUES (14221, 110, 10);
INSERT INTO `item_mods` VALUES (14222, 1, 30);
INSERT INTO `item_mods` VALUES (14222, 2, 15);
INSERT INTO `item_mods` VALUES (14222, 14, 4);
INSERT INTO `item_mods` VALUES (14222, 224, 2);
INSERT INTO `item_mods` VALUES (14222, 225, 2);
INSERT INTO `item_mods` VALUES (14222, 226, 2);
INSERT INTO `item_mods` VALUES (14222, 227, 2);
INSERT INTO `item_mods` VALUES (14222, 228, 2);
INSERT INTO `item_mods` VALUES (14222, 229, 2);
INSERT INTO `item_mods` VALUES (14222, 230, 2);
INSERT INTO `item_mods` VALUES (14222, 231, 2);
INSERT INTO `item_mods` VALUES (14222, 232, 2);
INSERT INTO `item_mods` VALUES (14222, 233, 2);
INSERT INTO `item_mods` VALUES (14222, 234, 2);
INSERT INTO `item_mods` VALUES (14222, 360, 6);
INSERT INTO `item_mods` VALUES (14223, 1, 27);
INSERT INTO `item_mods` VALUES (14223, 2, 12);
INSERT INTO `item_mods` VALUES (14223, 8, 5);
INSERT INTO `item_mods` VALUES (14223, 27, -1);
INSERT INTO `item_mods` VALUES (14223, 121, 3);
INSERT INTO `item_mods` VALUES (14224, 1, 27);
INSERT INTO `item_mods` VALUES (14224, 2, 15);
INSERT INTO `item_mods` VALUES (14224, 13, 5);
INSERT INTO `item_mods` VALUES (14225, 1, 30);
INSERT INTO `item_mods` VALUES (14225, 2, 15);
INSERT INTO `item_mods` VALUES (14225, 8, 3);
INSERT INTO `item_mods` VALUES (14225, 57, 10);
INSERT INTO `item_mods` VALUES (14225, 110, 5);
INSERT INTO `item_mods` VALUES (14226, 1, 29);
INSERT INTO `item_mods` VALUES (14226, 2, 15);
INSERT INTO `item_mods` VALUES (14226, 26, 10);
INSERT INTO `item_mods` VALUES (14227, 1, 27);
INSERT INTO `item_mods` VALUES (14227, 2, 15);
INSERT INTO `item_mods` VALUES (14227, 57, 10);
INSERT INTO `item_mods` VALUES (14228, 1, 25);
INSERT INTO `item_mods` VALUES (14228, 5, 15);
INSERT INTO `item_mods` VALUES (14228, 27, -2);
INSERT INTO `item_mods` VALUES (14228, 108, 10);
INSERT INTO `item_mods` VALUES (14229, 1, 36);
INSERT INTO `item_mods` VALUES (14229, 5, 10);
INSERT INTO `item_mods` VALUES (14229, 11, 4);
INSERT INTO `item_mods` VALUES (14229, 12, -1);
INSERT INTO `item_mods` VALUES (14229, 60, 3);
INSERT INTO `item_mods` VALUES (14229, 61, 3);
INSERT INTO `item_mods` VALUES (14230, 1, 31);
INSERT INTO `item_mods` VALUES (14230, 58, -4);
INSERT INTO `item_mods` VALUES (14230, 59, 6);
INSERT INTO `item_mods` VALUES (14230, 163, -7);
INSERT INTO `item_mods` VALUES (14231, 1, 32);
INSERT INTO `item_mods` VALUES (14231, 2, 13);
INSERT INTO `item_mods` VALUES (14231, 54, 12);
INSERT INTO `item_mods` VALUES (14231, 55, 12);
INSERT INTO `item_mods` VALUES (14231, 162, -5);
INSERT INTO `item_mods` VALUES (14232, 1, 30);
INSERT INTO `item_mods` VALUES (14232, 23, 5);
INSERT INTO `item_mods` VALUES (14232, 54, -4);
INSERT INTO `item_mods` VALUES (14232, 55, 6);
INSERT INTO `item_mods` VALUES (14233, 1, 31);
INSERT INTO `item_mods` VALUES (14233, 3, -1);
INSERT INTO `item_mods` VALUES (14233, 58, 17);
INSERT INTO `item_mods` VALUES (14233, 68, 3);
INSERT INTO `item_mods` VALUES (14234, 1, 29);
INSERT INTO `item_mods` VALUES (14234, 60, 3);
INSERT INTO `item_mods` VALUES (14234, 61, 3);
INSERT INTO `item_mods` VALUES (14234, 161, -3);
INSERT INTO `item_mods` VALUES (14235, 1, 30);
INSERT INTO `item_mods` VALUES (14235, 4, 20);
INSERT INTO `item_mods` VALUES (14235, 11, 3);
INSERT INTO `item_mods` VALUES (14235, 14, 1);
INSERT INTO `item_mods` VALUES (14235, 163, -7);
INSERT INTO `item_mods` VALUES (14236, 1, 22);
INSERT INTO `item_mods` VALUES (14237, 1, 26);
INSERT INTO `item_mods` VALUES (14237, 11, 2);

-- ------------------------------------------
-- War Brais +1
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (14238, 1, 28);
INSERT INTO `item_mods` VALUES (14238, 2, 27);
INSERT INTO `item_mods` VALUES (14238, 11, 5);
INSERT INTO `item_mods` VALUES (14238, 499, 1); -- blaze spikes
INSERT INTO `item_mods` VALUES (14238, 500, 25); -- spikes dmg
INSERT INTO `item_mods` VALUES (14238, 501, 25); -- spikes proc rate

INSERT INTO `item_mods` VALUES (14239, 1, 31);
INSERT INTO `item_mods` VALUES (14239, 5, 18);
INSERT INTO `item_mods` VALUES (14239, 10, 3);
INSERT INTO `item_mods` VALUES (14239, 14, 2);
INSERT INTO `item_mods` VALUES (14240, 1, 25);
INSERT INTO `item_mods` VALUES (14240, 2, 9);
INSERT INTO `item_mods` VALUES (14240, 60, 6);
INSERT INTO `item_mods` VALUES (14240, 61, -4);
INSERT INTO `item_mods` VALUES (14243, 1, 21);
INSERT INTO `item_mods` VALUES (14244, 1, 22);
INSERT INTO `item_mods` VALUES (14245, 1, 26);
INSERT INTO `item_mods` VALUES (14246, 1, 27);
INSERT INTO `item_mods` VALUES (14247, 1, 40);
INSERT INTO `item_mods` VALUES (14247, 7, 50);
INSERT INTO `item_mods` VALUES (14247, 13, 4);
INSERT INTO `item_mods` VALUES (14247, 14, 4);
INSERT INTO `item_mods` VALUES (14247, 68, -3);
INSERT INTO `item_mods` VALUES (14248, 1, 41);
INSERT INTO `item_mods` VALUES (14248, 7, 55);
INSERT INTO `item_mods` VALUES (14248, 13, 5);
INSERT INTO `item_mods` VALUES (14248, 14, 5);
INSERT INTO `item_mods` VALUES (14248, 68, -4);
INSERT INTO `item_mods` VALUES (14249, 1, 2);
INSERT INTO `item_mods` VALUES (14250, 1, 2);
INSERT INTO `item_mods` VALUES (14250, 14, 1);
INSERT INTO `item_mods` VALUES (14251, 1, 1);
INSERT INTO `item_mods` VALUES (14251, 60, 5);
INSERT INTO `item_mods` VALUES (14252, 1, 32);
INSERT INTO `item_mods` VALUES (14252, 23, 6);
INSERT INTO `item_mods` VALUES (14252, 25, 2);
INSERT INTO `item_mods` VALUES (14252, 68, -2);
INSERT INTO `item_mods` VALUES (14253, 1, 27);
INSERT INTO `item_mods` VALUES (14253, 11, 3);
INSERT INTO `item_mods` VALUES (14253, 27, 2);
INSERT INTO `item_mods` VALUES (14254, 1, 25);
INSERT INTO `item_mods` VALUES (14254, 9, 1);
INSERT INTO `item_mods` VALUES (14254, 10, 1);
INSERT INTO `item_mods` VALUES (14254, 11, 1);
INSERT INTO `item_mods` VALUES (14255, 1, 26);
INSERT INTO `item_mods` VALUES (14255, 9, 2);
INSERT INTO `item_mods` VALUES (14255, 10, 2);
INSERT INTO `item_mods` VALUES (14255, 11, 2);
INSERT INTO `item_mods` VALUES (14256, 1, 28);
INSERT INTO `item_mods` VALUES (14256, 11, 4);
INSERT INTO `item_mods` VALUES (14256, 27, 3);
INSERT INTO `item_mods` VALUES (14257, 1, 35);
INSERT INTO `item_mods` VALUES (14257, 25, 9);
INSERT INTO `item_mods` VALUES (14257, 26, 9);
INSERT INTO `item_mods` VALUES (14257, 384, 30);
INSERT INTO `item_mods` VALUES (14258, 1, 32);
INSERT INTO `item_mods` VALUES (14258, 2, 14);
INSERT INTO `item_mods` VALUES (14258, 12, 5);
INSERT INTO `item_mods` VALUES (14258, 14, 5);
INSERT INTO `item_mods` VALUES (14258, 28, 3);
INSERT INTO `item_mods` VALUES (14258, 30, 3);
INSERT INTO `item_mods` VALUES (14259, 1, 12);
INSERT INTO `item_mods` VALUES (14259, 10, 1);
INSERT INTO `item_mods` VALUES (14259, 23, 3);
INSERT INTO `item_mods` VALUES (14259, 24, 3);
INSERT INTO `item_mods` VALUES (14260, 1, 13);
INSERT INTO `item_mods` VALUES (14260, 10, 1);
INSERT INTO `item_mods` VALUES (14260, 23, 5);
INSERT INTO `item_mods` VALUES (14260, 24, 5);
INSERT INTO `item_mods` VALUES (14261, 1, 23);
INSERT INTO `item_mods` VALUES (14261, 9, 1);
INSERT INTO `item_mods` VALUES (14261, 11, 1);
INSERT INTO `item_mods` VALUES (14262, 1, 24);
INSERT INTO `item_mods` VALUES (14262, 9, 1);
INSERT INTO `item_mods` VALUES (14262, 11, 1);
INSERT INTO `item_mods` VALUES (14263, 1, 30);
INSERT INTO `item_mods` VALUES (14263, 11, 2);
INSERT INTO `item_mods` VALUES (14264, 1, 31);
INSERT INTO `item_mods` VALUES (14264, 11, 2);
INSERT INTO `item_mods` VALUES (14265, 1, 13);
INSERT INTO `item_mods` VALUES (14265, 10, 1);
INSERT INTO `item_mods` VALUES (14265, 68, 2);
INSERT INTO `item_mods` VALUES (14266, 1, 14);
INSERT INTO `item_mods` VALUES (14266, 10, 1);
INSERT INTO `item_mods` VALUES (14266, 68, 3);
INSERT INTO `item_mods` VALUES (14267, 1, 17);
INSERT INTO `item_mods` VALUES (14267, 11, 2);
INSERT INTO `item_mods` VALUES (14268, 1, 18);
INSERT INTO `item_mods` VALUES (14268, 11, 2);
INSERT INTO `item_mods` VALUES (14269, 1, 12);
INSERT INTO `item_mods` VALUES (14269, 2, 6);
INSERT INTO `item_mods` VALUES (14269, 68, 1);
INSERT INTO `item_mods` VALUES (14270, 1, 13);
INSERT INTO `item_mods` VALUES (14270, 2, 8);
INSERT INTO `item_mods` VALUES (14270, 68, 1);
INSERT INTO `item_mods` VALUES (14271, 1, 15);
INSERT INTO `item_mods` VALUES (14271, 68, 2);
INSERT INTO `item_mods` VALUES (14272, 1, 16);
INSERT INTO `item_mods` VALUES (14272, 68, 2);
INSERT INTO `item_mods` VALUES (14273, 1, 4);
INSERT INTO `item_mods` VALUES (14273, 5, 4);
INSERT INTO `item_mods` VALUES (14274, 1, 5);
INSERT INTO `item_mods` VALUES (14274, 5, 6);
INSERT INTO `item_mods` VALUES (14275, 1, 18);
INSERT INTO `item_mods` VALUES (14275, 68, 5);
INSERT INTO `item_mods` VALUES (14276, 1, 19);
INSERT INTO `item_mods` VALUES (14276, 68, 5);
INSERT INTO `item_mods` VALUES (14277, 1, 23);
INSERT INTO `item_mods` VALUES (14277, 61, 6);
INSERT INTO `item_mods` VALUES (14278, 1, 24);
INSERT INTO `item_mods` VALUES (14278, 61, 6);

-- ------------------------------------------
-- Ogre Trousers +1
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (14279, 1, 32);
INSERT INTO `item_mods` VALUES (14279, 2, 32);
INSERT INTO `item_mods` VALUES (14279, 12, 4);
INSERT INTO `item_mods` VALUES (14279, 25, -5);
INSERT INTO `item_mods` VALUES (14279, 499, 2); -- ice spikes
INSERT INTO `item_mods` VALUES (14279, 500, 20); -- spikes dmg
INSERT INTO `item_mods` VALUES (14279, 501, 25); -- spikes proc rate

INSERT INTO `item_mods` VALUES (14280, 1, 43);
INSERT INTO `item_mods` VALUES (14280, 2, 25);
INSERT INTO `item_mods` VALUES (14280, 5, 25);
INSERT INTO `item_mods` VALUES (14280, 54, 20);
INSERT INTO `item_mods` VALUES (14280, 58, 20);
INSERT INTO `item_mods` VALUES (14280, 59, 20);
INSERT INTO `item_mods` VALUES (14280, 61, 20);
INSERT INTO `item_mods` VALUES (14280, 169, 12);
INSERT INTO `item_mods` VALUES (14281, 1, 44);
INSERT INTO `item_mods` VALUES (14281, 2, 27);
INSERT INTO `item_mods` VALUES (14281, 5, 27);
INSERT INTO `item_mods` VALUES (14281, 54, 21);
INSERT INTO `item_mods` VALUES (14281, 58, 21);
INSERT INTO `item_mods` VALUES (14281, 59, 21);
INSERT INTO `item_mods` VALUES (14281, 61, 21);
INSERT INTO `item_mods` VALUES (14281, 169, 12);
INSERT INTO `item_mods` VALUES (14283, 1, 46);
INSERT INTO `item_mods` VALUES (14283, 2, 42);
INSERT INTO `item_mods` VALUES (14283, 8, -6);
INSERT INTO `item_mods` VALUES (14283, 9, -6);
INSERT INTO `item_mods` VALUES (14283, 10, 11);
INSERT INTO `item_mods` VALUES (14283, 14, 11);
INSERT INTO `item_mods` VALUES (14283, 68, 11);
INSERT INTO `item_mods` VALUES (14284, 1, 42);
INSERT INTO `item_mods` VALUES (14284, 23, 6);
INSERT INTO `item_mods` VALUES (14284, 54, -4);
INSERT INTO `item_mods` VALUES (14284, 55, 6);
INSERT INTO `item_mods` VALUES (14284, 56, 6);
INSERT INTO `item_mods` VALUES (14285, 1, 43);
INSERT INTO `item_mods` VALUES (14285, 23, 7);
INSERT INTO `item_mods` VALUES (14285, 54, -3);
INSERT INTO `item_mods` VALUES (14285, 55, 7);
INSERT INTO `item_mods` VALUES (14285, 56, 7);
INSERT INTO `item_mods` VALUES (14286, 1, 19);
INSERT INTO `item_mods` VALUES (14286, 2, -5);
INSERT INTO `item_mods` VALUES (14286, 5, 20);
INSERT INTO `item_mods` VALUES (14286, 59, 7);
INSERT INTO `item_mods` VALUES (14287, 1, 28);
INSERT INTO `item_mods` VALUES (14287, 14, 3);
INSERT INTO `item_mods` VALUES (14288, 1, 29);
INSERT INTO `item_mods` VALUES (14288, 14, 4);
INSERT INTO `item_mods` VALUES (14289, 1, 30);
INSERT INTO `item_mods` VALUES (14289, 14, 5);
INSERT INTO `item_mods` VALUES (14290, 1, 1);
INSERT INTO `item_mods` VALUES (14290, 72, 1);
INSERT INTO `item_mods` VALUES (14291, 1, 8);
INSERT INTO `item_mods` VALUES (14291, 72, 1);
INSERT INTO `item_mods` VALUES (14292, 1, 1);
INSERT INTO `item_mods` VALUES (14292, 127, 1);
INSERT INTO `item_mods` VALUES (14293, 1, 8);
INSERT INTO `item_mods` VALUES (14293, 127, 1);

-- -------------------------------------------------------
-- Chocobo Hose
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (14294, 1, 1); -- DEF+1
INSERT INTO `item_mods` VALUES (14294, 511, 4); -- Chocobo riding time +4 min

-- -------------------------------------------------------
-- Rider's Hose
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (14295, 1, 8); -- DEF+8
INSERT INTO `item_mods` VALUES (14295, 511, 4); -- Chocobo riding time +4 min

INSERT INTO `item_mods` VALUES (14296, 1, 38);
INSERT INTO `item_mods` VALUES (14296, 5, -21);
INSERT INTO `item_mods` VALUES (14296, 10, -11);
INSERT INTO `item_mods` VALUES (14296, 23, 7);
INSERT INTO `item_mods` VALUES (14296, 25, 7);
INSERT INTO `item_mods` VALUES (14296, 68, -7);

-- ------------------------------------------
-- Field Hose
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (14297, 1, 1); -- DEF+1
INSERT INTO `item_mods` VALUES (14297, 513, 73); -- Improves harvesting results, 73 = 0.073
INSERT INTO `item_mods` VALUES (14297, 514, 73); -- Improves logging results, 73 = 0.073

-- ------------------------------------------
-- Worker Hose
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (14298, 1, 8); -- DEF+8
INSERT INTO `item_mods` VALUES (14298, 513, 73); -- Improves harvesting results, 73 = 0.073
INSERT INTO `item_mods` VALUES (14298, 514, 73); -- Improves logging results, 73 = 0.073

-- ------------------------------------------
-- Rasetsu Hakama
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (14299, 1, 40);
INSERT INTO `item_mods` VALUES (14299, 23, 2);
INSERT INTO `item_mods` VALUES (14299, 499, 2); -- ice spikes
INSERT INTO `item_mods` VALUES (14299, 500, 15); -- spikes dmg
INSERT INTO `item_mods` VALUES (14299, 501, 20); -- spikes proc rate

-- ------------------------------------------
-- Rasetsu Hakama +1
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (14300, 1, 41);
INSERT INTO `item_mods` VALUES (14300, 23, 3);
INSERT INTO `item_mods` VALUES (14300, 291, 1);
INSERT INTO `item_mods` VALUES (14300, 499, 2); -- ice spikes
INSERT INTO `item_mods` VALUES (14300, 500, 20); -- spikes dmg
INSERT INTO `item_mods` VALUES (14300, 501, 25); -- spikes proc rate

INSERT INTO `item_mods` VALUES (14301, 1, 38);
INSERT INTO `item_mods` VALUES (14301, 8, -5);
INSERT INTO `item_mods` VALUES (14301, 9, -5);
INSERT INTO `item_mods` VALUES (14301, 10, -5);
INSERT INTO `item_mods` VALUES (14301, 11, -5);
INSERT INTO `item_mods` VALUES (14301, 12, 7);
INSERT INTO `item_mods` VALUES (14301, 13, 7);
INSERT INTO `item_mods` VALUES (14301, 14, 7);
INSERT INTO `item_mods` VALUES (14301, 27, -3);
INSERT INTO `item_mods` VALUES (14302, 1, 39);
INSERT INTO `item_mods` VALUES (14302, 8, -6);
INSERT INTO `item_mods` VALUES (14302, 9, -6);
INSERT INTO `item_mods` VALUES (14302, 10, -6);
INSERT INTO `item_mods` VALUES (14302, 11, -6);
INSERT INTO `item_mods` VALUES (14302, 12, 8);
INSERT INTO `item_mods` VALUES (14302, 13, 8);
INSERT INTO `item_mods` VALUES (14302, 14, 8);
INSERT INTO `item_mods` VALUES (14302, 27, -4);
INSERT INTO `item_mods` VALUES (14303, 1, 30);
INSERT INTO `item_mods` VALUES (14303, 2, -35);
INSERT INTO `item_mods` VALUES (14303, 8, 5);
INSERT INTO `item_mods` VALUES (14303, 25, 7);
INSERT INTO `item_mods` VALUES (14304, 1, 31);
INSERT INTO `item_mods` VALUES (14304, 2, -40);
INSERT INTO `item_mods` VALUES (14304, 8, 6);
INSERT INTO `item_mods` VALUES (14304, 25, 8);
INSERT INTO `item_mods` VALUES (14305, 1, 32);
INSERT INTO `item_mods` VALUES (14305, 9, 4);
INSERT INTO `item_mods` VALUES (14305, 27, 2);
INSERT INTO `item_mods` VALUES (14305, 162, -3);
INSERT INTO `item_mods` VALUES (14305, 289, 5);
INSERT INTO `item_mods` VALUES (14306, 1, 33);
INSERT INTO `item_mods` VALUES (14306, 9, 5);
INSERT INTO `item_mods` VALUES (14306, 27, 3);
INSERT INTO `item_mods` VALUES (14306, 162, -4);
INSERT INTO `item_mods` VALUES (14306, 289, 6);
INSERT INTO `item_mods` VALUES (14307, 1, 48);
INSERT INTO `item_mods` VALUES (14307, 2, 37);
INSERT INTO `item_mods` VALUES (14307, 23, 15);
INSERT INTO `item_mods` VALUES (14307, 26, 11);
INSERT INTO `item_mods` VALUES (14307, 169, -3);
INSERT INTO `item_mods` VALUES (14308, 1, 42);
INSERT INTO `item_mods` VALUES (14308, 2, 15);
INSERT INTO `item_mods` VALUES (14308, 9, 8);
INSERT INTO `item_mods` VALUES (14308, 23, 20);
INSERT INTO `item_mods` VALUES (14308, 384, -122);
INSERT INTO `item_mods` VALUES (14309, 1, 43);
INSERT INTO `item_mods` VALUES (14309, 2, 17);
INSERT INTO `item_mods` VALUES (14309, 9, 9);
INSERT INTO `item_mods` VALUES (14309, 23, 22);
INSERT INTO `item_mods` VALUES (14309, 384, -142);
INSERT INTO `item_mods` VALUES (14310, 1, 19);
INSERT INTO `item_mods` VALUES (14310, 10, -1);
INSERT INTO `item_mods` VALUES (14310, 12, 2);
INSERT INTO `item_mods` VALUES (14310, 13, 2);
INSERT INTO `item_mods` VALUES (14310, 14, -1);
INSERT INTO `item_mods` VALUES (14310, 117, 3);
INSERT INTO `item_mods` VALUES (14311, 1, 20);
INSERT INTO `item_mods` VALUES (14311, 10, -2);
INSERT INTO `item_mods` VALUES (14311, 12, 4);
INSERT INTO `item_mods` VALUES (14311, 13, 4);
INSERT INTO `item_mods` VALUES (14311, 14, -2);
INSERT INTO `item_mods` VALUES (14311, 117, 4);
INSERT INTO `item_mods` VALUES (14312, 1, 42);
INSERT INTO `item_mods` VALUES (14312, 10, 4);
INSERT INTO `item_mods` VALUES (14312, 12, -4);
INSERT INTO `item_mods` VALUES (14312, 27, 4);
INSERT INTO `item_mods` VALUES (14312, 68, -2);
INSERT INTO `item_mods` VALUES (14313, 1, 36);
INSERT INTO `item_mods` VALUES (14313, 9, 3);
INSERT INTO `item_mods` VALUES (14313, 10, 3);
INSERT INTO `item_mods` VALUES (14313, 161, -4);
INSERT INTO `item_mods` VALUES (14314, 1, 9);
INSERT INTO `item_mods` VALUES (14314, 8, 1);
INSERT INTO `item_mods` VALUES (14314, 9, 1);
INSERT INTO `item_mods` VALUES (14315, 1, 37);
INSERT INTO `item_mods` VALUES (14315, 3, 2);
INSERT INTO `item_mods` VALUES (14315, 6, 1);
INSERT INTO `item_mods` VALUES (14315, 14, 8);
INSERT INTO `item_mods` VALUES (14316, 1, 38);
INSERT INTO `item_mods` VALUES (14316, 3, 3);
INSERT INTO `item_mods` VALUES (14316, 6, 2);
INSERT INTO `item_mods` VALUES (14316, 14, 9);
INSERT INTO `item_mods` VALUES (14317, 1, 32);
INSERT INTO `item_mods` VALUES (14317, 8, 2);
INSERT INTO `item_mods` VALUES (14317, 23, 6);
INSERT INTO `item_mods` VALUES (14317, 27, 1);
INSERT INTO `item_mods` VALUES (14317, 361, 20);
INSERT INTO `item_mods` VALUES (14318, 1, 33);
INSERT INTO `item_mods` VALUES (14318, 8, 3);
INSERT INTO `item_mods` VALUES (14318, 23, 7);
INSERT INTO `item_mods` VALUES (14318, 27, 2);
INSERT INTO `item_mods` VALUES (14318, 361, 25);
INSERT INTO `item_mods` VALUES (14319, 1, 29);
INSERT INTO `item_mods` VALUES (14319, 5, 15);
INSERT INTO `item_mods` VALUES (14319, 27, -2);
INSERT INTO `item_mods` VALUES (14320, 1, 30);
INSERT INTO `item_mods` VALUES (14320, 5, 16);
INSERT INTO `item_mods` VALUES (14320, 27, -3);

-- ------------------------------------------
-- Igqira Lappas
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (14321, 1, 30);
INSERT INTO `item_mods` VALUES (14321, 68, 10);
INSERT INTO `item_mods` VALUES (14321, 114, 10);
INSERT INTO `item_mods` VALUES (14321, 499, 4); -- curse spikes
INSERT INTO `item_mods` VALUES (14321, 500, 0); -- spikes dmg
INSERT INTO `item_mods` VALUES (14321, 501, 25); -- spikes proc rate

-- ------------------------------------------
-- Genie Lappas
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (14322, 1, 31);
INSERT INTO `item_mods` VALUES (14322, 68, 11);
INSERT INTO `item_mods` VALUES (14322, 114, 11);
INSERT INTO `item_mods` VALUES (14322, 499, 4); -- curse spikes
INSERT INTO `item_mods` VALUES (14322, 500, 0); -- spikes dmg
INSERT INTO `item_mods` VALUES (14322, 501, 30); -- spikes proc rate

INSERT INTO `item_mods` VALUES (14323, 1, 12);
INSERT INTO `item_mods` VALUES (14323, 9, 1);
INSERT INTO `item_mods` VALUES (14323, 26, 1);
INSERT INTO `item_mods` VALUES (14323, 61, 1);
INSERT INTO `item_mods` VALUES (14324, 1, 15);
INSERT INTO `item_mods` VALUES (14325, 1, 12);
INSERT INTO `item_mods` VALUES (14325, 5, 9);
INSERT INTO `item_mods` VALUES (14325, 12, 1);
INSERT INTO `item_mods` VALUES (14326, 1, 15);
INSERT INTO `item_mods` VALUES (14327, 1, 14);
INSERT INTO `item_mods` VALUES (14327, 235, 2);
INSERT INTO `item_mods` VALUES (14328, 1, 13);
INSERT INTO `item_mods` VALUES (14328, 5, 10);
INSERT INTO `item_mods` VALUES (14328, 12, 1);
INSERT INTO `item_mods` VALUES (14329, 1, 17);
INSERT INTO `item_mods` VALUES (14329, 10, 1);
INSERT INTO `item_mods` VALUES (14329, 11, 1);
INSERT INTO `item_mods` VALUES (14330, 1, 16);
INSERT INTO `item_mods` VALUES (14331, 1, 15);
INSERT INTO `item_mods` VALUES (14331, 68, 1);
INSERT INTO `item_mods` VALUES (14331, 235, 2);
INSERT INTO `item_mods` VALUES (14332, 1, 18);
INSERT INTO `item_mods` VALUES (14332, 10, 2);
INSERT INTO `item_mods` VALUES (14332, 11, 2);
INSERT INTO `item_mods` VALUES (14333, 1, 13);
INSERT INTO `item_mods` VALUES (14333, 9, 2);
INSERT INTO `item_mods` VALUES (14333, 26, 2);
INSERT INTO `item_mods` VALUES (14333, 61, 2);
INSERT INTO `item_mods` VALUES (14334, 1, 27);
INSERT INTO `item_mods` VALUES (14334, 73, 6);
INSERT INTO `item_mods` VALUES (14335, 1, 26);
INSERT INTO `item_mods` VALUES (14335, 11, 3);
INSERT INTO `item_mods` VALUES (14335, 27, 1);
INSERT INTO `item_mods` VALUES (14336, 1, 52);
INSERT INTO `item_mods` VALUES (14336, 25, 15);
INSERT INTO `item_mods` VALUES (14336, 165, 3);
INSERT INTO `item_mods` VALUES (14336, 288, 4);
INSERT INTO `item_mods` VALUES (14337, 73, 7);
INSERT INTO `item_mods` VALUES (14338, 1, 11);
INSERT INTO `item_mods` VALUES (14338, 2, 2);
INSERT INTO `item_mods` VALUES (14338, 5, 2);
INSERT INTO `item_mods` VALUES (14338, 54, 5);
INSERT INTO `item_mods` VALUES (14339, 1, 12);
INSERT INTO `item_mods` VALUES (14339, 2, 3);
INSERT INTO `item_mods` VALUES (14339, 5, 3);
INSERT INTO `item_mods` VALUES (14339, 54, 5);
INSERT INTO `item_mods` VALUES (14340, 1, 32);
INSERT INTO `item_mods` VALUES (14340, 9, 1);
INSERT INTO `item_mods` VALUES (14341, 1, 33);
INSERT INTO `item_mods` VALUES (14341, 9, 1);
INSERT INTO `item_mods` VALUES (14342, 1, 41);
INSERT INTO `item_mods` VALUES (14342, 10, 1);
INSERT INTO `item_mods` VALUES (14343, 1, 42);
INSERT INTO `item_mods` VALUES (14343, 10, 1);
INSERT INTO `item_mods` VALUES (14344, 1, 11);
INSERT INTO `item_mods` VALUES (14344, 2, 4);
INSERT INTO `item_mods` VALUES (14344, 55, 5);
INSERT INTO `item_mods` VALUES (14345, 1, 12);
INSERT INTO `item_mods` VALUES (14345, 2, 6);
INSERT INTO `item_mods` VALUES (14345, 55, 5);
INSERT INTO `item_mods` VALUES (14346, 1, 24);
INSERT INTO `item_mods` VALUES (14346, 10, 1);
INSERT INTO `item_mods` VALUES (14347, 1, 25);
INSERT INTO `item_mods` VALUES (14347, 10, 1);
INSERT INTO `item_mods` VALUES (14348, 1, 13);
INSERT INTO `item_mods` VALUES (14348, 5, 4);
INSERT INTO `item_mods` VALUES (14348, 11, 1);
INSERT INTO `item_mods` VALUES (14348, 12, 1);
INSERT INTO `item_mods` VALUES (14349, 1, 14);
INSERT INTO `item_mods` VALUES (14349, 5, 6);
INSERT INTO `item_mods` VALUES (14349, 11, 1);
INSERT INTO `item_mods` VALUES (14349, 12, 1);
INSERT INTO `item_mods` VALUES (14350, 1, 16);
INSERT INTO `item_mods` VALUES (14350, 10, 1);
INSERT INTO `item_mods` VALUES (14350, 68, 2);
INSERT INTO `item_mods` VALUES (14351, 1, 17);
INSERT INTO `item_mods` VALUES (14351, 10, 1);
INSERT INTO `item_mods` VALUES (14351, 68, 3);
INSERT INTO `item_mods` VALUES (14352, 1, 21);
INSERT INTO `item_mods` VALUES (14352, 9, 1);
INSERT INTO `item_mods` VALUES (14352, 11, 1);
INSERT INTO `item_mods` VALUES (14353, 1, 22);
INSERT INTO `item_mods` VALUES (14353, 9, 1);
INSERT INTO `item_mods` VALUES (14353, 11, 1);
INSERT INTO `item_mods` VALUES (14354, 1, 33);
INSERT INTO `item_mods` VALUES (14354, 8, 2);
INSERT INTO `item_mods` VALUES (14354, 12, 2);
INSERT INTO `item_mods` VALUES (14354, 13, -2);
INSERT INTO `item_mods` VALUES (14355, 1, 34);
INSERT INTO `item_mods` VALUES (14355, 8, 2);
INSERT INTO `item_mods` VALUES (14355, 12, 2);
INSERT INTO `item_mods` VALUES (14355, 13, -2);
INSERT INTO `item_mods` VALUES (14356, 1, 28);
INSERT INTO `item_mods` VALUES (14356, 24, 3);
INSERT INTO `item_mods` VALUES (14356, 26, 3);
INSERT INTO `item_mods` VALUES (14357, 1, 29);
INSERT INTO `item_mods` VALUES (14357, 24, 3);
INSERT INTO `item_mods` VALUES (14357, 26, 3);
INSERT INTO `item_mods` VALUES (14358, 1, 27);
INSERT INTO `item_mods` VALUES (14358, 5, 10);
INSERT INTO `item_mods` VALUES (14359, 1, 28);
INSERT INTO `item_mods` VALUES (14359, 5, 10);
INSERT INTO `item_mods` VALUES (14360, 1, 41);
INSERT INTO `item_mods` VALUES (14360, 60, 13);
INSERT INTO `item_mods` VALUES (14360, 61, 13);
INSERT INTO `item_mods` VALUES (14361, 1, 42);
INSERT INTO `item_mods` VALUES (14361, 60, 14);
INSERT INTO `item_mods` VALUES (14361, 61, 14);
INSERT INTO `item_mods` VALUES (14362, 1, 32);
INSERT INTO `item_mods` VALUES (14362, 12, 1);
INSERT INTO `item_mods` VALUES (14362, 13, 1);
INSERT INTO `item_mods` VALUES (14362, 14, 1);
INSERT INTO `item_mods` VALUES (14362, 60, 3);
INSERT INTO `item_mods` VALUES (14362, 61, 3);
INSERT INTO `item_mods` VALUES (14363, 1, 33);
INSERT INTO `item_mods` VALUES (14363, 12, 1);
INSERT INTO `item_mods` VALUES (14363, 13, 1);
INSERT INTO `item_mods` VALUES (14363, 14, 1);
INSERT INTO `item_mods` VALUES (14363, 60, 3);
INSERT INTO `item_mods` VALUES (14363, 61, 3);
INSERT INTO `item_mods` VALUES (14364, 1, 38);
INSERT INTO `item_mods` VALUES (14364, 27, 3);
INSERT INTO `item_mods` VALUES (14364, 28, 9);
INSERT INTO `item_mods` VALUES (14364, 369, 1);
-- INSERT INTO `item_mods` VALUES (14364, 0, 4); -- MCRIT 4%

-- ------------------------------------------
-- Ogre Jerkin +1
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (14366, 1, 44);
INSERT INTO `item_mods` VALUES (14366, 2, 42);
INSERT INTO `item_mods` VALUES (14366, 10, 7);
INSERT INTO `item_mods` VALUES (14366, 25, -5);
INSERT INTO `item_mods` VALUES (14366, 499, 2); -- ice spikes
INSERT INTO `item_mods` VALUES (14366, 500, 25); -- spikes dmg
INSERT INTO `item_mods` VALUES (14366, 501, 30); -- spikes proc rate

INSERT INTO `item_mods` VALUES (14367, 1, 52);
INSERT INTO `item_mods` VALUES (14367, 2, 40);
INSERT INTO `item_mods` VALUES (14367, 5, 40);
INSERT INTO `item_mods` VALUES (14367, 12, 10);
INSERT INTO `item_mods` VALUES (14367, 13, 10);
INSERT INTO `item_mods` VALUES (14367, 162, -10);
INSERT INTO `item_mods` VALUES (14368, 1, 53);
INSERT INTO `item_mods` VALUES (14368, 2, 42);
INSERT INTO `item_mods` VALUES (14368, 5, 42);
INSERT INTO `item_mods` VALUES (14368, 12, 11);
INSERT INTO `item_mods` VALUES (14368, 13, 11);
INSERT INTO `item_mods` VALUES (14368, 162, -11);
INSERT INTO `item_mods` VALUES (14369, 369, 1);
INSERT INTO `item_mods` VALUES (14370, 1, 66);
INSERT INTO `item_mods` VALUES (14370, 2, 62);
INSERT INTO `item_mods` VALUES (14370, 8, -11);
INSERT INTO `item_mods` VALUES (14370, 9, -11);
INSERT INTO `item_mods` VALUES (14370, 10, 21);
INSERT INTO `item_mods` VALUES (14370, 14, 21);
INSERT INTO `item_mods` VALUES (14371, 1, 54);
INSERT INTO `item_mods` VALUES (14371, 8, 11);
INSERT INTO `item_mods` VALUES (14371, 9, 11);
INSERT INTO `item_mods` VALUES (14371, 23, 16);
INSERT INTO `item_mods` VALUES (14371, 25, 16);
INSERT INTO `item_mods` VALUES (14371, 68, -11);
INSERT INTO `item_mods` VALUES (14372, 1, 44);
INSERT INTO `item_mods` VALUES (14372, 10, 3);
INSERT INTO `item_mods` VALUES (14372, 25, 4);
INSERT INTO `item_mods` VALUES (14372, 68, 4);
INSERT INTO `item_mods` VALUES (14373, 1, 45);
INSERT INTO `item_mods` VALUES (14373, 10, 4);
INSERT INTO `item_mods` VALUES (14373, 25, 5);
INSERT INTO `item_mods` VALUES (14373, 68, 5);

-- ------------------------------------------
-- Field Tunica
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (14374, 1, 2); -- DEF+2
INSERT INTO `item_mods` VALUES (14374, 513, 73); -- Improves harvesting results, 73 = 0.073
INSERT INTO `item_mods` VALUES (14374, 514, 73); -- Improves logging results, 73 = 0.073
INSERT INTO `item_mods` VALUES (14374, 515, 73); -- Improves mining results, 73 = 0.073

-- ------------------------------------------
-- Worker Tunica
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (14375, 1, 12); -- DEF+12
INSERT INTO `item_mods` VALUES (14375, 513, 73); -- Improves harvesting results, 73 = 0.073
INSERT INTO `item_mods` VALUES (14375, 514, 73); -- Improves logging results, 73 = 0.073
INSERT INTO `item_mods` VALUES (14375, 515, 73); -- Improves mining results, 73 = 0.073

-- ------------------------------------------
-- Rasetsu Samue
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (14376, 1, 50);
INSERT INTO `item_mods` VALUES (14376, 23, 2);
INSERT INTO `item_mods` VALUES (14376, 499, 5); -- shock spikes
INSERT INTO `item_mods` VALUES (14376, 500, 15); -- spikes dmg
INSERT INTO `item_mods` VALUES (14376, 501, 25); -- spikes proc rate

-- ------------------------------------------
-- Rasetsu Samue +1
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (14377, 1, 51);
INSERT INTO `item_mods` VALUES (14377, 23, 3);
INSERT INTO `item_mods` VALUES (14377, 291, 1);
INSERT INTO `item_mods` VALUES (14377, 499, 5); -- shock spikes
INSERT INTO `item_mods` VALUES (14377, 500, 20); -- spikes dmg
INSERT INTO `item_mods` VALUES (14377, 501, 30); -- spikes proc rate

INSERT INTO `item_mods` VALUES (14378, 1, 50);
INSERT INTO `item_mods` VALUES (14378, 2, 16);
INSERT INTO `item_mods` VALUES (14378, 8, 12);
INSERT INTO `item_mods` VALUES (14378, 25, 10);
INSERT INTO `item_mods` VALUES (14378, 384, -130);
INSERT INTO `item_mods` VALUES (14379, 1, 51);
INSERT INTO `item_mods` VALUES (14379, 2, 18);
INSERT INTO `item_mods` VALUES (14379, 8, 13);
INSERT INTO `item_mods` VALUES (14379, 25, 11);
INSERT INTO `item_mods` VALUES (14379, 384, -150);
INSERT INTO `item_mods` VALUES (14380, 1, 42);
INSERT INTO `item_mods` VALUES (14380, 8, -7);
INSERT INTO `item_mods` VALUES (14380, 9, -7);
INSERT INTO `item_mods` VALUES (14380, 10, -7);
INSERT INTO `item_mods` VALUES (14380, 11, -7);
INSERT INTO `item_mods` VALUES (14380, 12, 10);
INSERT INTO `item_mods` VALUES (14380, 13, 10);
INSERT INTO `item_mods` VALUES (14380, 14, 10);
INSERT INTO `item_mods` VALUES (14380, 27, -3);
INSERT INTO `item_mods` VALUES (14380, 71, 5);
INSERT INTO `item_mods` VALUES (14381, 1, 43);
INSERT INTO `item_mods` VALUES (14381, 8, -8);
INSERT INTO `item_mods` VALUES (14381, 9, -8);
INSERT INTO `item_mods` VALUES (14381, 10, -8);
INSERT INTO `item_mods` VALUES (14381, 11, -8);
INSERT INTO `item_mods` VALUES (14381, 12, 11);
INSERT INTO `item_mods` VALUES (14381, 13, 11);
INSERT INTO `item_mods` VALUES (14381, 14, 11);
INSERT INTO `item_mods` VALUES (14381, 27, -4);
INSERT INTO `item_mods` VALUES (14381, 71, 6);
INSERT INTO `item_mods` VALUES (14382, 1, 40);
INSERT INTO `item_mods` VALUES (14382, 8, 8);
INSERT INTO `item_mods` VALUES (14382, 23, 16);
INSERT INTO `item_mods` VALUES (14382, 160, 14);
INSERT INTO `item_mods` VALUES (14382, 369, 1);
INSERT INTO `item_mods` VALUES (14383, 1, 41);
INSERT INTO `item_mods` VALUES (14383, 8, 9);
INSERT INTO `item_mods` VALUES (14383, 23, 18);
INSERT INTO `item_mods` VALUES (14383, 160, 15);
INSERT INTO `item_mods` VALUES (14383, 369, 1);
INSERT INTO `item_mods` VALUES (14384, 1, 3);
INSERT INTO `item_mods` VALUES (14384, 14, 1);
INSERT INTO `item_mods` VALUES (14385, 1, 3);
INSERT INTO `item_mods` VALUES (14385, 14, 2);
INSERT INTO `item_mods` VALUES (14386, 1, 3);
INSERT INTO `item_mods` VALUES (14386, 60, 10);
INSERT INTO `item_mods` VALUES (14387, 1, 40);
INSERT INTO `item_mods` VALUES (14387, 2, -50);
INSERT INTO `item_mods` VALUES (14387, 23, 20);
INSERT INTO `item_mods` VALUES (14387, 25, 10);
INSERT INTO `item_mods` VALUES (14388, 1, 41);
INSERT INTO `item_mods` VALUES (14388, 2, -55);
INSERT INTO `item_mods` VALUES (14388, 23, 22);
INSERT INTO `item_mods` VALUES (14388, 25, 11);
INSERT INTO `item_mods` VALUES (14389, 1, 44);
INSERT INTO `item_mods` VALUES (14389, 9, 6);
INSERT INTO `item_mods` VALUES (14389, 11, 6);
INSERT INTO `item_mods` VALUES (14389, 23, 10);
INSERT INTO `item_mods` VALUES (14389, 162, -10);
INSERT INTO `item_mods` VALUES (14389, 289, 10);
INSERT INTO `item_mods` VALUES (14390, 1, 45);
INSERT INTO `item_mods` VALUES (14390, 9, 7);
INSERT INTO `item_mods` VALUES (14390, 11, 7);
INSERT INTO `item_mods` VALUES (14390, 23, 12);
INSERT INTO `item_mods` VALUES (14390, 162, -12);
INSERT INTO `item_mods` VALUES (14390, 289, 12);
INSERT INTO `item_mods` VALUES (14391, 1, 51);
INSERT INTO `item_mods` VALUES (14391, 2, 42);
INSERT INTO `item_mods` VALUES (14391, 25, 3);
INSERT INTO `item_mods` VALUES (14391, 169, -3);
INSERT INTO `item_mods` VALUES (14391, 370, 1);
INSERT INTO `item_mods` VALUES (14392, 1, 3);
INSERT INTO `item_mods` VALUES (14392, 56, 1);
INSERT INTO `item_mods` VALUES (14392, 57, 1);
INSERT INTO `item_mods` VALUES (14392, 128, 1);
INSERT INTO `item_mods` VALUES (14393, 1, 4);
INSERT INTO `item_mods` VALUES (14393, 54, 2);
INSERT INTO `item_mods` VALUES (14393, 129, 1);
INSERT INTO `item_mods` VALUES (14394, 1, 3);
INSERT INTO `item_mods` VALUES (14394, 54, 1);
INSERT INTO `item_mods` VALUES (14394, 57, 1);
INSERT INTO `item_mods` VALUES (14394, 130, 1);
INSERT INTO `item_mods` VALUES (14395, 1, 2);
INSERT INTO `item_mods` VALUES (14395, 57, 2);
INSERT INTO `item_mods` VALUES (14395, 131, 1);
INSERT INTO `item_mods` VALUES (14396, 1, 3);
INSERT INTO `item_mods` VALUES (14396, 58, 1);
INSERT INTO `item_mods` VALUES (14396, 61, 1);
INSERT INTO `item_mods` VALUES (14396, 132, 1);
INSERT INTO `item_mods` VALUES (14397, 1, 3);
INSERT INTO `item_mods` VALUES (14397, 57, 1);
INSERT INTO `item_mods` VALUES (14397, 61, 1);
INSERT INTO `item_mods` VALUES (14397, 133, 1);
INSERT INTO `item_mods` VALUES (14398, 1, 3);
INSERT INTO `item_mods` VALUES (14398, 54, 1);
INSERT INTO `item_mods` VALUES (14398, 58, 1);
INSERT INTO `item_mods` VALUES (14398, 134, 1);
INSERT INTO `item_mods` VALUES (14399, 1, 2);
INSERT INTO `item_mods` VALUES (14399, 54, 1);
INSERT INTO `item_mods` VALUES (14399, 59, 1);
INSERT INTO `item_mods` VALUES (14399, 135, 1);
INSERT INTO `item_mods` VALUES (14400, 1, 4);
INSERT INTO `item_mods` VALUES (14400, 55, 1);
INSERT INTO `item_mods` VALUES (14400, 59, 1);
INSERT INTO `item_mods` VALUES (14401, 1, 26);
INSERT INTO `item_mods` VALUES (14401, 296, 4);
INSERT INTO `item_mods` VALUES (14402, 1, 31);
INSERT INTO `item_mods` VALUES (14402, 11, 4);
INSERT INTO `item_mods` VALUES (14402, 27, 1);
INSERT INTO `item_mods` VALUES (14403, 1, 32);
INSERT INTO `item_mods` VALUES (14403, 26, 2);
INSERT INTO `item_mods` VALUES (14403, 384, 40);
INSERT INTO `item_mods` VALUES (14404, 1, 37);
INSERT INTO `item_mods` VALUES (14404, 73, 9);
INSERT INTO `item_mods` VALUES (14405, 1, 36);
INSERT INTO `item_mods` VALUES (14406, 1, 29);
INSERT INTO `item_mods` VALUES (14406, 24, 7);
INSERT INTO `item_mods` VALUES (14406, 27, -1);
INSERT INTO `item_mods` VALUES (14407, 1, 28);
INSERT INTO `item_mods` VALUES (14407, 23, 3);
INSERT INTO `item_mods` VALUES (14407, 25, 3);
INSERT INTO `item_mods` VALUES (14408, 1, 27);
INSERT INTO `item_mods` VALUES (14408, 113, 3);
INSERT INTO `item_mods` VALUES (14408, 114, 3);
INSERT INTO `item_mods` VALUES (14408, 115, 3);
INSERT INTO `item_mods` VALUES (14408, 116, 3);
INSERT INTO `item_mods` VALUES (14409, 1, 33);
INSERT INTO `item_mods` VALUES (14410, 1, 26);
INSERT INTO `item_mods` VALUES (14410, 370, 1);
INSERT INTO `item_mods` VALUES (14411, 1, 33);
INSERT INTO `item_mods` VALUES (14411, 10, 4);
INSERT INTO `item_mods` VALUES (14411, 11, 2);
INSERT INTO `item_mods` VALUES (14412, 1, 38);
INSERT INTO `item_mods` VALUES (14412, 2, 28);
INSERT INTO `item_mods` VALUES (14412, 27, 2);
INSERT INTO `item_mods` VALUES (14413, 1, 27);
INSERT INTO `item_mods` VALUES (14413, 14, 3);

-- -------------------------------------------------------
-- Sha'ir Manteel
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (14414, 1, 42); -- DEF:42
INSERT INTO `item_mods` VALUES (14414, 5, 14); -- MP+14
INSERT INTO `item_mods` VALUES (14414, 14, 7); -- CHR+7
INSERT INTO `item_mods` VALUES (14414, 384, 20); -- Haste+2%
INSERT INTO `item_mods` VALUES (14414, 455, 12); -- Song spellcasting time -12%

-- -------------------------------------------------------
-- Sheikh Manteel
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (14415, 1, 43); -- DEF:43
INSERT INTO `item_mods` VALUES (14415, 5, 16); -- MP+16
INSERT INTO `item_mods` VALUES (14415, 14, 8); -- CHR+8
INSERT INTO `item_mods` VALUES (14415, 384, 30); -- Haste+3%
INSERT INTO `item_mods` VALUES (14415, 455, 13); -- Song spellcasting time -13%

INSERT INTO `item_mods` VALUES (14416, 1, 45);
INSERT INTO `item_mods` VALUES (14416, 23, 13);
INSERT INTO `item_mods` VALUES (14416, 27, 2);
INSERT INTO `item_mods` VALUES (14416, 361, 20);
INSERT INTO `item_mods` VALUES (14416, 370, 2);
INSERT INTO `item_mods` VALUES (14417, 1, 46);
INSERT INTO `item_mods` VALUES (14417, 23, 14);
INSERT INTO `item_mods` VALUES (14417, 27, 3);
INSERT INTO `item_mods` VALUES (14417, 361, 25);
INSERT INTO `item_mods` VALUES (14417, 370, 2);
INSERT INTO `item_mods` VALUES (14418, 1, 44);
INSERT INTO `item_mods` VALUES (14418, 5, 21);
INSERT INTO `item_mods` VALUES (14418, 14, 4);
INSERT INTO `item_mods` VALUES (14418, 27, -2);
INSERT INTO `item_mods` VALUES (14419, 1, 45);
INSERT INTO `item_mods` VALUES (14419, 5, 22);
INSERT INTO `item_mods` VALUES (14419, 14, 5);
INSERT INTO `item_mods` VALUES (14419, 27, -3);

-- ------------------------------------------
-- Igqira Weskit
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (14420, 1, 35);
INSERT INTO `item_mods` VALUES (14420, 28, 6);
INSERT INTO `item_mods` VALUES (14420, 115, 5);
INSERT INTO `item_mods` VALUES (14420, 296, 2);
INSERT INTO `item_mods` VALUES (14420, 499, 4); -- curse spikes
INSERT INTO `item_mods` VALUES (14420, 500, 0); -- spikes dmg
INSERT INTO `item_mods` VALUES (14420, 501, 30); -- spikes proc rate

-- ------------------------------------------
-- Genie Weskit
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (14421, 1, 36);
INSERT INTO `item_mods` VALUES (14421, 28, 7);
INSERT INTO `item_mods` VALUES (14421, 115, 6);
INSERT INTO `item_mods` VALUES (14421, 296, 2);
INSERT INTO `item_mods` VALUES (14421, 499, 4); -- curse spikes
INSERT INTO `item_mods` VALUES (14421, 500, 0); -- spikes dmg
INSERT INTO `item_mods` VALUES (14421, 501, 35); -- spikes proc rate

INSERT INTO `item_mods` VALUES (14422, 1, 18);
INSERT INTO `item_mods` VALUES (14422, 26, 2);
INSERT INTO `item_mods` VALUES (14422, 61, 1);
INSERT INTO `item_mods` VALUES (14423, 1, 19);
INSERT INTO `item_mods` VALUES (14424, 1, 18);
INSERT INTO `item_mods` VALUES (14424, 5, 8);
INSERT INTO `item_mods` VALUES (14424, 71, 1);
INSERT INTO `item_mods` VALUES (14425, 1, 19);
INSERT INTO `item_mods` VALUES (14426, 1, 19);
INSERT INTO `item_mods` VALUES (14426, 235, 2);
INSERT INTO `item_mods` VALUES (14427, 1, 19);
INSERT INTO `item_mods` VALUES (14427, 5, 9);
INSERT INTO `item_mods` VALUES (14427, 71, 1);
INSERT INTO `item_mods` VALUES (14428, 1, 1);
INSERT INTO `item_mods` VALUES (14429, 1, 1);
INSERT INTO `item_mods` VALUES (14430, 1, 1);
INSERT INTO `item_mods` VALUES (14431, 1, 24);
INSERT INTO `item_mods` VALUES (14431, 11, 2);
INSERT INTO `item_mods` VALUES (14432, 1, 20);
INSERT INTO `item_mods` VALUES (14433, 1, 20);
INSERT INTO `item_mods` VALUES (14433, 68, 1);
INSERT INTO `item_mods` VALUES (14433, 235, 2);
INSERT INTO `item_mods` VALUES (14434, 1, 19);
INSERT INTO `item_mods` VALUES (14434, 26, 3);
INSERT INTO `item_mods` VALUES (14434, 61, 2);
INSERT INTO `item_mods` VALUES (14435, 1, 25);
INSERT INTO `item_mods` VALUES (14435, 11, 3);
INSERT INTO `item_mods` VALUES (14436, 1, 41);
INSERT INTO `item_mods` VALUES (14436, 6, 7);
INSERT INTO `item_mods` VALUES (14436, 13, 5);
INSERT INTO `item_mods` VALUES (14436, 27, -5);
INSERT INTO `item_mods` VALUES (14437, 1, 47);
INSERT INTO `item_mods` VALUES (14437, 8, 8);
INSERT INTO `item_mods` VALUES (14437, 48, 8);
INSERT INTO `item_mods` VALUES (14437, 73, 6);
INSERT INTO `item_mods` VALUES (14438, 1, 42);
INSERT INTO `item_mods` VALUES (14438, 6, 8);
INSERT INTO `item_mods` VALUES (14438, 13, 6);
INSERT INTO `item_mods` VALUES (14438, 27, -6);
INSERT INTO `item_mods` VALUES (14439, 1, 48);
INSERT INTO `item_mods` VALUES (14439, 8, 9);
INSERT INTO `item_mods` VALUES (14439, 48, 10);
INSERT INTO `item_mods` VALUES (14439, 73, 7);
INSERT INTO `item_mods` VALUES (14440, 1, 43);
INSERT INTO `item_mods` VALUES (14440, 5, 20);
INSERT INTO `item_mods` VALUES (14440, 25, 5);
INSERT INTO `item_mods` VALUES (14440, 27, -2);
INSERT INTO `item_mods` VALUES (14440, 30, 5);
INSERT INTO `item_mods` VALUES (14441, 1, 44);
INSERT INTO `item_mods` VALUES (14441, 5, 25);
INSERT INTO `item_mods` VALUES (14441, 25, 6);
INSERT INTO `item_mods` VALUES (14441, 27, -3);
INSERT INTO `item_mods` VALUES (14441, 30, 6);
INSERT INTO `item_mods` VALUES (14442, 1, 44);
INSERT INTO `item_mods` VALUES (14442, 12, 4);
INSERT INTO `item_mods` VALUES (14442, 27, 5);
INSERT INTO `item_mods` VALUES (14442, 110, 4);
INSERT INTO `item_mods` VALUES (14442, 168, 11);
INSERT INTO `item_mods` VALUES (14443, 1, 65);
INSERT INTO `item_mods` VALUES (14444, 1, 30);
INSERT INTO `item_mods` VALUES (14445, 1, 30);
INSERT INTO `item_mods` VALUES (14445, 8, 2);
INSERT INTO `item_mods` VALUES (14445, 9, 2);
INSERT INTO `item_mods` VALUES (14445, 23, 3);
INSERT INTO `item_mods` VALUES (14445, 25, 3);
INSERT INTO `item_mods` VALUES (14445, 68, -12);
INSERT INTO `item_mods` VALUES (14446, 1, 14);
INSERT INTO `item_mods` VALUES (14447, 1, 15);
INSERT INTO `item_mods` VALUES (14447, 12, 1);
INSERT INTO `item_mods` VALUES (14447, 13, 1);
INSERT INTO `item_mods` VALUES (14448, 1, 56);
INSERT INTO `item_mods` VALUES (14448, 2, 48);
INSERT INTO `item_mods` VALUES (14448, 370, 1);
INSERT INTO `item_mods` VALUES (14449, 1, 59);
INSERT INTO `item_mods` VALUES (14449, 2, 52);
INSERT INTO `item_mods` VALUES (14449, 370, 1);
INSERT INTO `item_mods` VALUES (14450, 1, 1);
INSERT INTO `item_mods` VALUES (14451, 1, 1);
INSERT INTO `item_mods` VALUES (14452, 1, 1);
INSERT INTO `item_mods` VALUES (14453, 1, 1);
INSERT INTO `item_mods` VALUES (14454, 1, 1);
INSERT INTO `item_mods` VALUES (14455, 1, 1);
INSERT INTO `item_mods` VALUES (14456, 1, 1);
INSERT INTO `item_mods` VALUES (14457, 1, 2);
INSERT INTO `item_mods` VALUES (14457, 510, 1);
INSERT INTO `item_mods` VALUES (14458, 1, 2);
INSERT INTO `item_mods` VALUES (14458, 510, 1);
INSERT INTO `item_mods` VALUES (14459, 1, 2);
INSERT INTO `item_mods` VALUES (14459, 510, 1);
INSERT INTO `item_mods` VALUES (14460, 1, 2);
INSERT INTO `item_mods` VALUES (14460, 510, 1);
INSERT INTO `item_mods` VALUES (14461, 1, 2);
INSERT INTO `item_mods` VALUES (14461, 510, 1);
INSERT INTO `item_mods` VALUES (14462, 1, 2);
INSERT INTO `item_mods` VALUES (14462, 510, 1);
INSERT INTO `item_mods` VALUES (14463, 1, 2);
INSERT INTO `item_mods` VALUES (14463, 510, 1);
INSERT INTO `item_mods` VALUES (14464, 1, 14);
INSERT INTO `item_mods` VALUES (14464, 11, 1);
INSERT INTO `item_mods` VALUES (14464, 55, 5);
INSERT INTO `item_mods` VALUES (14464, 57, 5);
INSERT INTO `item_mods` VALUES (14465, 1, 21);
INSERT INTO `item_mods` VALUES (14465, 23, 3);
INSERT INTO `item_mods` VALUES (14466, 1, 32);
INSERT INTO `item_mods` VALUES (14466, 2, -25);
INSERT INTO `item_mods` VALUES (14466, 8, 3);
INSERT INTO `item_mods` VALUES (14466, 9, 3);
INSERT INTO `item_mods` VALUES (14466, 10, -6);
INSERT INTO `item_mods` VALUES (14467, 1, 40);
INSERT INTO `item_mods` VALUES (14467, 8, 5);
INSERT INTO `item_mods` VALUES (14467, 24, 10);
INSERT INTO `item_mods` VALUES (14467, 26, -10);
INSERT INTO `item_mods` VALUES (14468, 1, 43);
INSERT INTO `item_mods` VALUES (14468, 5, 25);
INSERT INTO `item_mods` VALUES (14468, 357, 5);
INSERT INTO `item_mods` VALUES (14468, 369, 1);
INSERT INTO `item_mods` VALUES (14469, 1, 50);
INSERT INTO `item_mods` VALUES (14469, 5, -25);
INSERT INTO `item_mods` VALUES (14469, 13, -5);
INSERT INTO `item_mods` VALUES (14469, 25, 10);
INSERT INTO `item_mods` VALUES (14469, 68, 10);
INSERT INTO `item_mods` VALUES (14470, 1, 65);
INSERT INTO `item_mods` VALUES (14470, 54, 15);
INSERT INTO `item_mods` VALUES (14470, 55, 15);
INSERT INTO `item_mods` VALUES (14470, 56, 15);
INSERT INTO `item_mods` VALUES (14470, 57, 15);
INSERT INTO `item_mods` VALUES (14470, 58, 15);
INSERT INTO `item_mods` VALUES (14470, 59, 15);
INSERT INTO `item_mods` VALUES (14470, 60, 15);
INSERT INTO `item_mods` VALUES (14470, 61, 15);
INSERT INTO `item_mods` VALUES (14471, 1, 1);
INSERT INTO `item_mods` VALUES (14472, 1, 2);
INSERT INTO `item_mods` VALUES (14472, 510, 1);
INSERT INTO `item_mods` VALUES (14473, 1, 50);
INSERT INTO `item_mods` VALUES (14473, 2, 20);
INSERT INTO `item_mods` VALUES (14473, 10, 7);
INSERT INTO `item_mods` VALUES (14473, 23, 10);
INSERT INTO `item_mods` VALUES (14473, 27, 8);
INSERT INTO `item_mods` VALUES (14474, 1, 44);
INSERT INTO `item_mods` VALUES (14474, 2, 20);
INSERT INTO `item_mods` VALUES (14474, 8, 6);
INSERT INTO `item_mods` VALUES (14474, 10, 6);
INSERT INTO `item_mods` VALUES (14474, 25, 5);
INSERT INTO `item_mods` VALUES (14475, 1, 40);
INSERT INTO `item_mods` VALUES (14475, 5, 35);
INSERT INTO `item_mods` VALUES (14475, 27, -4);
INSERT INTO `item_mods` VALUES (14475, 71, 5);
INSERT INTO `item_mods` VALUES (14475, 114, 12);
INSERT INTO `item_mods` VALUES (14476, 1, 38);
INSERT INTO `item_mods` VALUES (14476, 5, 36);
INSERT INTO `item_mods` VALUES (14476, 27, -5);
INSERT INTO `item_mods` VALUES (14476, 71, 5);
INSERT INTO `item_mods` VALUES (14476, 114, 12);
INSERT INTO `item_mods` VALUES (14477, 1, 44);
INSERT INTO `item_mods` VALUES (14477, 5, 34);
INSERT INTO `item_mods` VALUES (14477, 71, 5);
INSERT INTO `item_mods` VALUES (14477, 114, 15);
INSERT INTO `item_mods` VALUES (14477, 168, 12);
INSERT INTO `item_mods` VALUES (14478, 1, 45);
INSERT INTO `item_mods` VALUES (14478, 2, 20);
INSERT INTO `item_mods` VALUES (14478, 8, 6);
INSERT INTO `item_mods` VALUES (14478, 25, 10);
INSERT INTO `item_mods` VALUES (14479, 1, 55);
INSERT INTO `item_mods` VALUES (14479, 2, 20);
INSERT INTO `item_mods` VALUES (14479, 10, 6);
INSERT INTO `item_mods` VALUES (14479, 27, 2);
INSERT INTO `item_mods` VALUES (14479, 111, 8);
INSERT INTO `item_mods` VALUES (14480, 1, 49);
INSERT INTO `item_mods` VALUES (14480, 2, 20);
INSERT INTO `item_mods` VALUES (14480, 5, 20);
INSERT INTO `item_mods` VALUES (14480, 8, 7);
INSERT INTO `item_mods` VALUES (14480, 10, 7);
INSERT INTO `item_mods` VALUES (14480, 23, 10);
INSERT INTO `item_mods` VALUES (14480, 114, 5);
INSERT INTO `item_mods` VALUES (14481, 1, 49);
INSERT INTO `item_mods` VALUES (14481, 2, 20);
INSERT INTO `item_mods` VALUES (14481, 10, 6);
INSERT INTO `item_mods` VALUES (14481, 360, 6);
INSERT INTO `item_mods` VALUES (14482, 1, 45);
INSERT INTO `item_mods` VALUES (14482, 2, 20);
INSERT INTO `item_mods` VALUES (14482, 10, 10);
INSERT INTO `item_mods` VALUES (14482, 14, 10);
INSERT INTO `item_mods` VALUES (14482, 27, -3);
INSERT INTO `item_mods` VALUES (14482, 120, 6);
INSERT INTO `item_mods` VALUES (14483, 1, 45);
INSERT INTO `item_mods` VALUES (14483, 2, 20);
INSERT INTO `item_mods` VALUES (14483, 10, 4);
INSERT INTO `item_mods` VALUES (14483, 11, 4);
INSERT INTO `item_mods` VALUES (14483, 26, 10);
INSERT INTO `item_mods` VALUES (14484, 1, 50);
INSERT INTO `item_mods` VALUES (14484, 2, 10);
INSERT INTO `item_mods` VALUES (14484, 8, 6);
INSERT INTO `item_mods` VALUES (14484, 10, 6);
INSERT INTO `item_mods` VALUES (14484, 25, 12);

-- ------------------------------------------
-- Ninja Chainmail +1
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (14485, 1, 46);
INSERT INTO `item_mods` VALUES (14485, 2, 15);
INSERT INTO `item_mods` VALUES (14485, 9, 5);
INSERT INTO `item_mods` VALUES (14485, 10, 5);
INSERT INTO `item_mods` VALUES (14485, 259, 5);
INSERT INTO `item_mods` VALUES (14485, 499, 5); -- shock spikes
INSERT INTO `item_mods` VALUES (14485, 500, 25); -- spikes dmg
INSERT INTO `item_mods` VALUES (14485, 501, 25); -- spikes proc rate

INSERT INTO `item_mods` VALUES (14486, 1, 49);
INSERT INTO `item_mods` VALUES (14486, 2, 15);
INSERT INTO `item_mods` VALUES (14486, 8, 6);
INSERT INTO `item_mods` VALUES (14486, 10, 6);
INSERT INTO `item_mods` VALUES (14486, 23, 7);
INSERT INTO `item_mods` VALUES (14487, 1, 35);
INSERT INTO `item_mods` VALUES (14487, 5, 45);
INSERT INTO `item_mods` VALUES (14487, 71, 5);
INSERT INTO `item_mods` VALUES (14487, 357, 4);
INSERT INTO `item_mods` VALUES (14488, 1, 49);
INSERT INTO `item_mods` VALUES (14488, 2, 28);
INSERT INTO `item_mods` VALUES (14488, 5, 28);
INSERT INTO `item_mods` VALUES (14488, 25, 15);
INSERT INTO `item_mods` VALUES (14488, 302, 1);
INSERT INTO `item_mods` VALUES (14489, 1, 41);
INSERT INTO `item_mods` VALUES (14489, 30, 5);
INSERT INTO `item_mods` VALUES (14489, 112, 5);
INSERT INTO `item_mods` VALUES (14489, 116, 5);
INSERT INTO `item_mods` VALUES (14489, 384, 30);
INSERT INTO `item_mods` VALUES (14490, 1, 9);
INSERT INTO `item_mods` VALUES (14491, 1, 27);
INSERT INTO `item_mods` VALUES (14492, 1, 39);
INSERT INTO `item_mods` VALUES (14492, 13, 2);
INSERT INTO `item_mods` VALUES (14492, 60, 4);
INSERT INTO `item_mods` VALUES (14493, 1, 22);
INSERT INTO `item_mods` VALUES (14494, 1, 47);
INSERT INTO `item_mods` VALUES (14494, 2, 12);
INSERT INTO `item_mods` VALUES (14494, 54, 10);
INSERT INTO `item_mods` VALUES (14494, 55, 10);
INSERT INTO `item_mods` VALUES (14494, 56, 10);
INSERT INTO `item_mods` VALUES (14494, 57, 10);
INSERT INTO `item_mods` VALUES (14494, 58, 10);
INSERT INTO `item_mods` VALUES (14494, 59, 10);
INSERT INTO `item_mods` VALUES (14494, 60, 10);
INSERT INTO `item_mods` VALUES (14494, 61, 10);
INSERT INTO `item_mods` VALUES (14494, 162, -9);
INSERT INTO `item_mods` VALUES (14495, 1, 14);
INSERT INTO `item_mods` VALUES (14496, 1, 36);
INSERT INTO `item_mods` VALUES (14496, 2, 10);
INSERT INTO `item_mods` VALUES (14496, 8, -1);
INSERT INTO `item_mods` VALUES (14496, 9, -1);
INSERT INTO `item_mods` VALUES (14496, 10, -1);
INSERT INTO `item_mods` VALUES (14496, 11, -1);
INSERT INTO `item_mods` VALUES (14496, 12, 2);
INSERT INTO `item_mods` VALUES (14496, 13, 2);
INSERT INTO `item_mods` VALUES (14496, 14, 2);
INSERT INTO `item_mods` VALUES (14497, 1, 31);
INSERT INTO `item_mods` VALUES (14498, 1, 28);
INSERT INTO `item_mods` VALUES (14498, 27, -8);
INSERT INTO `item_mods` VALUES (14498, 68, 8);
INSERT INTO `item_mods` VALUES (14499, 1, 29);
INSERT INTO `item_mods` VALUES (14499, 27, -9);
INSERT INTO `item_mods` VALUES (14499, 68, 9);
INSERT INTO `item_mods` VALUES (14500, 1, 51);
INSERT INTO `item_mods` VALUES (14500, 2, 30);
INSERT INTO `item_mods` VALUES (14500, 23, 12);
INSERT INTO `item_mods` VALUES (14500, 27, 4);
INSERT INTO `item_mods` VALUES (14501, 1, 45);
INSERT INTO `item_mods` VALUES (14501, 3, 6);
INSERT INTO `item_mods` VALUES (14501, 10, 6);
INSERT INTO `item_mods` VALUES (14501, 72, 6);
INSERT INTO `item_mods` VALUES (14501, 370, 1);
INSERT INTO `item_mods` VALUES (14502, 1, 43);
INSERT INTO `item_mods` VALUES (14502, 5, 29);
INSERT INTO `item_mods` VALUES (14502, 27, -3);
INSERT INTO `item_mods` VALUES (14502, 369, 1);
INSERT INTO `item_mods` VALUES (14503, 1, 42);
INSERT INTO `item_mods` VALUES (14503, 2, 12);
INSERT INTO `item_mods` VALUES (14503, 5, 12);
INSERT INTO `item_mods` VALUES (14503, 27, -2);
INSERT INTO `item_mods` VALUES (14503, 115, 7);
INSERT INTO `item_mods` VALUES (14503, 369, 1);
INSERT INTO `item_mods` VALUES (14504, 1, 46);
INSERT INTO `item_mods` VALUES (14504, 5, 30);
INSERT INTO `item_mods` VALUES (14504, 11, 4);
INSERT INTO `item_mods` VALUES (14504, 112, 12);
INSERT INTO `item_mods` VALUES (14504, 170, 10);
INSERT INTO `item_mods` VALUES (14505, 1, 46);
INSERT INTO `item_mods` VALUES (14505, 2, 22);
INSERT INTO `item_mods` VALUES (14505, 11, 5);
INSERT INTO `item_mods` VALUES (14505, 27, 5);
INSERT INTO `item_mods` VALUES (14505, 165, 5);
INSERT INTO `item_mods` VALUES (14506, 1, 56);
INSERT INTO `item_mods` VALUES (14506, 2, 30);
INSERT INTO `item_mods` VALUES (14506, 9, 3);
INSERT INTO `item_mods` VALUES (14506, 27, 5);
INSERT INTO `item_mods` VALUES (14507, 1, 50);
INSERT INTO `item_mods` VALUES (14507, 2, 27);
INSERT INTO `item_mods` VALUES (14507, 13, 4);
INSERT INTO `item_mods` VALUES (14507, 25, 12);
INSERT INTO `item_mods` VALUES (14507, 28, 10);
INSERT INTO `item_mods` VALUES (14508, 1, 50);
INSERT INTO `item_mods` VALUES (14508, 2, 21);
INSERT INTO `item_mods` VALUES (14508, 12, 7);
INSERT INTO `item_mods` VALUES (14508, 360, 7);
INSERT INTO `item_mods` VALUES (14509, 1, 46);
INSERT INTO `item_mods` VALUES (14509, 2, 19);
INSERT INTO `item_mods` VALUES (14509, 23, 20);
INSERT INTO `item_mods` VALUES (14510, 1, 46);
INSERT INTO `item_mods` VALUES (14510, 2, 23);
INSERT INTO `item_mods` VALUES (14510, 9, 5);
INSERT INTO `item_mods` VALUES (14510, 27, -4);
INSERT INTO `item_mods` VALUES (14510, 359, 5);
INSERT INTO `item_mods` VALUES (14511, 1, 51);
INSERT INTO `item_mods` VALUES (14511, 2, 34);
INSERT INTO `item_mods` VALUES (14511, 10, 7);
INSERT INTO `item_mods` VALUES (14511, 27, 1);
INSERT INTO `item_mods` VALUES (14512, 1, 47);
INSERT INTO `item_mods` VALUES (14512, 23, 16);
INSERT INTO `item_mods` VALUES (14512, 24, 10);
INSERT INTO `item_mods` VALUES (14512, 25, 12);
INSERT INTO `item_mods` VALUES (14512, 26, 10);
INSERT INTO `item_mods` VALUES (14513, 1, 50);
INSERT INTO `item_mods` VALUES (14513, 2, 33);
INSERT INTO `item_mods` VALUES (14513, 110, 15);
INSERT INTO `item_mods` VALUES (14513, 384, 20);
INSERT INTO `item_mods` VALUES (14514, 1, 39);
INSERT INTO `item_mods` VALUES (14514, 5, 20);
INSERT INTO `item_mods` VALUES (14514, 357, 3);
INSERT INTO `item_mods` VALUES (14514, 373, 3);
INSERT INTO `item_mods` VALUES (14515, 1, 43);
INSERT INTO `item_mods` VALUES (14515, 5, 40);
INSERT INTO `item_mods` VALUES (14515, 25, 10);
INSERT INTO `item_mods` VALUES (14515, 27, -9);
INSERT INTO `item_mods` VALUES (14515, 68, 10);
INSERT INTO `item_mods` VALUES (14516, 1, 44);
INSERT INTO `item_mods` VALUES (14517, 1, 45);
INSERT INTO `item_mods` VALUES (14517, 2, -20);
INSERT INTO `item_mods` VALUES (14517, 5, 20);
INSERT INTO `item_mods` VALUES (14517, 25, 10);
INSERT INTO `item_mods` VALUES (14517, 27, 9);
INSERT INTO `item_mods` VALUES (14518, 1, 42);
INSERT INTO `item_mods` VALUES (14519, 1, 2);
INSERT INTO `item_mods` VALUES (14520, 1, 3);
INSERT INTO `item_mods` VALUES (14521, 1, 44);
INSERT INTO `item_mods` VALUES (14521, 2, 12);
INSERT INTO `item_mods` VALUES (14521, 5, 12);
INSERT INTO `item_mods` VALUES (14521, 8, 3);
INSERT INTO `item_mods` VALUES (14521, 9, 3);
INSERT INTO `item_mods` VALUES (14521, 122, 15);
INSERT INTO `item_mods` VALUES (14522, 1, 42);
INSERT INTO `item_mods` VALUES (14522, 2, 15);
INSERT INTO `item_mods` VALUES (14522, 9, 2);
INSERT INTO `item_mods` VALUES (14522, 11, 2);
INSERT INTO `item_mods` VALUES (14522, 26, 8);
INSERT INTO `item_mods` VALUES (14523, 1, 36);
INSERT INTO `item_mods` VALUES (14523, 2, 12);
INSERT INTO `item_mods` VALUES (14523, 25, 5);
INSERT INTO `item_mods` VALUES (14524, 1, 43);
INSERT INTO `item_mods` VALUES (14524, 2, 16);
INSERT INTO `item_mods` VALUES (14524, 8, 5);
INSERT INTO `item_mods` VALUES (14524, 11, 5);
INSERT INTO `item_mods` VALUES (14524, 165, 5);
INSERT INTO `item_mods` VALUES (14525, 1, 44);
INSERT INTO `item_mods` VALUES (14525, 23, 12);
INSERT INTO `item_mods` VALUES (14525, 68, 12);
INSERT INTO `item_mods` VALUES (14525, 306, 1);
INSERT INTO `item_mods` VALUES (14526, 1, 42);
INSERT INTO `item_mods` VALUES (14526, 2, -25);
INSERT INTO `item_mods` VALUES (14526, 23, 5);
INSERT INTO `item_mods` VALUES (14526, 25, 5);
INSERT INTO `item_mods` VALUES (14526, 26, 5);
INSERT INTO `item_mods` VALUES (14527, 1, 40);
INSERT INTO `item_mods` VALUES (14527, 28, 5);
INSERT INTO `item_mods` VALUES (14527, 68, 7);
INSERT INTO `item_mods` VALUES (14527, 71, 5);
INSERT INTO `item_mods` VALUES (14527, 455, 10);
INSERT INTO `item_mods` VALUES (14528, 1, 44);
INSERT INTO `item_mods` VALUES (14528, 2, 18);
INSERT INTO `item_mods` VALUES (14528, 8, 6);
INSERT INTO `item_mods` VALUES (14528, 11, 6);
INSERT INTO `item_mods` VALUES (14528, 165, 5);
INSERT INTO `item_mods` VALUES (14529, 1, 43);
INSERT INTO `item_mods` VALUES (14529, 2, -25);
INSERT INTO `item_mods` VALUES (14529, 23, 6);
INSERT INTO `item_mods` VALUES (14529, 25, 6);
INSERT INTO `item_mods` VALUES (14529, 26, 6);
INSERT INTO `item_mods` VALUES (14530, 1, 42);
INSERT INTO `item_mods` VALUES (14530, 2, 20);
INSERT INTO `item_mods` VALUES (14530, 25, 10);
INSERT INTO `item_mods` VALUES (14530, 26, 10);
INSERT INTO `item_mods` VALUES (14530, 72, 2);
INSERT INTO `item_mods` VALUES (14530, 165, 5);
INSERT INTO `item_mods` VALUES (14531, 1, 21);
INSERT INTO `item_mods` VALUES (14532, 1, 1);
INSERT INTO `item_mods` VALUES (14533, 1, 1);
INSERT INTO `item_mods` VALUES (14534, 1, 2);
INSERT INTO `item_mods` VALUES (14535, 1, 2);
INSERT INTO `item_mods` VALUES (14536, 1, 50);
INSERT INTO `item_mods` VALUES (14536, 11, 4);
INSERT INTO `item_mods` VALUES (14536, 23, 5);
INSERT INTO `item_mods` VALUES (14536, 68, 10);
INSERT INTO `item_mods` VALUES (14536, 289, 3);
INSERT INTO `item_mods` VALUES (14537, 1, 49);
INSERT INTO `item_mods` VALUES (14537, 9, 3);
INSERT INTO `item_mods` VALUES (14537, 11, 3);
INSERT INTO `item_mods` VALUES (14537, 25, 9);
INSERT INTO `item_mods` VALUES (14537, 68, 9);
INSERT INTO `item_mods` VALUES (14537, 161, -3);
INSERT INTO `item_mods` VALUES (14537, 163, -7);
INSERT INTO `item_mods` VALUES (14538, 1, 50);
INSERT INTO `item_mods` VALUES (14538, 9, 4);
INSERT INTO `item_mods` VALUES (14538, 11, 4);
INSERT INTO `item_mods` VALUES (14538, 25, 10);
INSERT INTO `item_mods` VALUES (14538, 68, 10);
INSERT INTO `item_mods` VALUES (14538, 161, -4);
INSERT INTO `item_mods` VALUES (14538, 163, -10);
INSERT INTO `item_mods` VALUES (14539, 1, 42);
INSERT INTO `item_mods` VALUES (14539, 24, 7);
INSERT INTO `item_mods` VALUES (14539, 26, 7);
INSERT INTO `item_mods` VALUES (14539, 68, 7);
INSERT INTO `item_mods` VALUES (14539, 163, -2);
INSERT INTO `item_mods` VALUES (14539, 243, 2);
INSERT INTO `item_mods` VALUES (14540, 1, 43);
INSERT INTO `item_mods` VALUES (14540, 24, 9);
INSERT INTO `item_mods` VALUES (14540, 26, 9);
INSERT INTO `item_mods` VALUES (14540, 68, 9);
INSERT INTO `item_mods` VALUES (14540, 163, -3);
INSERT INTO `item_mods` VALUES (14540, 243, 3);
INSERT INTO `item_mods` VALUES (14541, 1, 8);
INSERT INTO `item_mods` VALUES (14542, 1, 33);
INSERT INTO `item_mods` VALUES (14542, 2, 21);
INSERT INTO `item_mods` VALUES (14542, 5, 21);
INSERT INTO `item_mods` VALUES (14543, 1, 34);
INSERT INTO `item_mods` VALUES (14543, 2, 22);
INSERT INTO `item_mods` VALUES (14543, 5, 22);
INSERT INTO `item_mods` VALUES (14544, 1, 44);
INSERT INTO `item_mods` VALUES (14544, 23, 6);
INSERT INTO `item_mods` VALUES (14544, 25, 6);
INSERT INTO `item_mods` VALUES (14544, 28, 7);
INSERT INTO `item_mods` VALUES (14544, 30, 7);
INSERT INTO `item_mods` VALUES (14544, 244, 2);
INSERT INTO `item_mods` VALUES (14545, 1, 45);
INSERT INTO `item_mods` VALUES (14545, 23, 8);
INSERT INTO `item_mods` VALUES (14545, 25, 8);
INSERT INTO `item_mods` VALUES (14545, 28, 9);
INSERT INTO `item_mods` VALUES (14545, 30, 9);
INSERT INTO `item_mods` VALUES (14545, 244, 2);
INSERT INTO `item_mods` VALUES (14546, 1, 55);
INSERT INTO `item_mods` VALUES (14546, 3, 3);
INSERT INTO `item_mods` VALUES (14546, 6, 3);
INSERT INTO `item_mods` VALUES (14546, 8, 12);
INSERT INTO `item_mods` VALUES (14546, 10, 12);
INSERT INTO `item_mods` VALUES (14546, 23, 24);
INSERT INTO `item_mods` VALUES (14546, 369, 1);
INSERT INTO `item_mods` VALUES (14547, 1, 12);
INSERT INTO `item_mods` VALUES (14547, 3, 1);
INSERT INTO `item_mods` VALUES (14548, 1, 21);
INSERT INTO `item_mods` VALUES (14548, 3, 1);
INSERT INTO `item_mods` VALUES (14548, 8, 1);
INSERT INTO `item_mods` VALUES (14549, 1, 27);
INSERT INTO `item_mods` VALUES (14549, 3, 1);
INSERT INTO `item_mods` VALUES (14549, 8, 1);
INSERT INTO `item_mods` VALUES (14549, 10, 1);
INSERT INTO `item_mods` VALUES (14550, 1, 40);
INSERT INTO `item_mods` VALUES (14550, 9, 8);
INSERT INTO `item_mods` VALUES (14550, 11, 8);
INSERT INTO `item_mods` VALUES (14550, 14, 8);
INSERT INTO `item_mods` VALUES (14550, 23, 5);
INSERT INTO `item_mods` VALUES (14550, 24, 5);
INSERT INTO `item_mods` VALUES (14550, 25, 10);
INSERT INTO `item_mods` VALUES (14550, 26, 10);
INSERT INTO `item_mods` VALUES (14550, 68, -10);
INSERT INTO `item_mods` VALUES (14551, 1, 11);
INSERT INTO `item_mods` VALUES (14551, 26, 1);
INSERT INTO `item_mods` VALUES (14552, 1, 19);
INSERT INTO `item_mods` VALUES (14552, 14, 1);
INSERT INTO `item_mods` VALUES (14552, 26, 1);
INSERT INTO `item_mods` VALUES (14553, 1, 24);
INSERT INTO `item_mods` VALUES (14553, 9, 1);
INSERT INTO `item_mods` VALUES (14553, 14, 1);
INSERT INTO `item_mods` VALUES (14553, 26, 1);
INSERT INTO `item_mods` VALUES (14554, 1, 40);
INSERT INTO `item_mods` VALUES (14554, 8, 8);
INSERT INTO `item_mods` VALUES (14554, 9, 8);
INSERT INTO `item_mods` VALUES (14554, 12, 8);
INSERT INTO `item_mods` VALUES (14554, 25, 12);
INSERT INTO `item_mods` VALUES (14554, 68, 12);
INSERT INTO `item_mods` VALUES (14554, 73, 6);
INSERT INTO `item_mods` VALUES (14555, 1, 11);
INSERT INTO `item_mods` VALUES (14555, 9, 1);
INSERT INTO `item_mods` VALUES (14556, 1, 20);
INSERT INTO `item_mods` VALUES (14556, 9, 1);
INSERT INTO `item_mods` VALUES (14556, 25, 1);
INSERT INTO `item_mods` VALUES (14557, 1, 25);
INSERT INTO `item_mods` VALUES (14557, 9, 1);
INSERT INTO `item_mods` VALUES (14557, 25, 1);
INSERT INTO `item_mods` VALUES (14557, 73, 1);
INSERT INTO `item_mods` VALUES (14558, 1, 40);
INSERT INTO `item_mods` VALUES (14558, 3, 3);
INSERT INTO `item_mods` VALUES (14558, 6, 3);
INSERT INTO `item_mods` VALUES (14558, 13, 12);
INSERT INTO `item_mods` VALUES (14558, 14, 12);
INSERT INTO `item_mods` VALUES (14558, 170, 5);
INSERT INTO `item_mods` VALUES (14558, 369, 1);
INSERT INTO `item_mods` VALUES (14559, 1, 10);
INSERT INTO `item_mods` VALUES (14559, 13, 1);
INSERT INTO `item_mods` VALUES (14560, 1, 17);
INSERT INTO `item_mods` VALUES (14560, 13, 1);
INSERT INTO `item_mods` VALUES (14560, 14, 1);
INSERT INTO `item_mods` VALUES (14561, 1, 22);
INSERT INTO `item_mods` VALUES (14561, 13, 1);
INSERT INTO `item_mods` VALUES (14561, 14, 1);
INSERT INTO `item_mods` VALUES (14561, 27, -1);
INSERT INTO `item_mods` VALUES (14562, 1, 38);
INSERT INTO `item_mods` VALUES (14562, 8, 8);
INSERT INTO `item_mods` VALUES (14562, 12, 8);
INSERT INTO `item_mods` VALUES (14562, 13, 8);
INSERT INTO `item_mods` VALUES (14562, 23, 5);
INSERT INTO `item_mods` VALUES (14562, 25, 5);
INSERT INTO `item_mods` VALUES (14562, 28, 5);
INSERT INTO `item_mods` VALUES (14562, 369, 1);
INSERT INTO `item_mods` VALUES (14563, 1, 10);
INSERT INTO `item_mods` VALUES (14563, 8, 1);
INSERT INTO `item_mods` VALUES (14564, 1, 16);
INSERT INTO `item_mods` VALUES (14564, 8, 1);
INSERT INTO `item_mods` VALUES (14564, 12, 1);
INSERT INTO `item_mods` VALUES (14565, 1, 21);
INSERT INTO `item_mods` VALUES (14565, 8, 1);
INSERT INTO `item_mods` VALUES (14565, 12, 1);
INSERT INTO `item_mods` VALUES (14565, 13, 1);
INSERT INTO `item_mods` VALUES (14566, 1, 45);
INSERT INTO `item_mods` VALUES (14566, 2, 21);
INSERT INTO `item_mods` VALUES (14566, 5, 21);
INSERT INTO `item_mods` VALUES (14566, 9, 4);
INSERT INTO `item_mods` VALUES (14566, 10, 4);
INSERT INTO `item_mods` VALUES (14566, 14, 4);
INSERT INTO `item_mods` VALUES (14566, 27, -2);
INSERT INTO `item_mods` VALUES (14567, 1, 46);
INSERT INTO `item_mods` VALUES (14567, 2, 22);
INSERT INTO `item_mods` VALUES (14567, 5, 22);
INSERT INTO `item_mods` VALUES (14567, 9, 5);
INSERT INTO `item_mods` VALUES (14567, 10, 5);
INSERT INTO `item_mods` VALUES (14567, 14, 5);
INSERT INTO `item_mods` VALUES (14567, 27, -3);
INSERT INTO `item_mods` VALUES (14568, 1, 49);
INSERT INTO `item_mods` VALUES (14568, 8, 5);
INSERT INTO `item_mods` VALUES (14568, 23, 12);
INSERT INTO `item_mods` VALUES (14568, 68, 12);
INSERT INTO `item_mods` VALUES (14568, 73, 5);
INSERT INTO `item_mods` VALUES (14568, 288, 2);
INSERT INTO `item_mods` VALUES (14569, 1, 43);
INSERT INTO `item_mods` VALUES (14569, 2, 25);
INSERT INTO `item_mods` VALUES (14569, 11, 10);
INSERT INTO `item_mods` VALUES (14569, 23, 9);
INSERT INTO `item_mods` VALUES (14569, 24, 9);
INSERT INTO `item_mods` VALUES (14569, 289, 3);
INSERT INTO `item_mods` VALUES (14570, 1, 42);
INSERT INTO `item_mods` VALUES (14570, 2, 42);
INSERT INTO `item_mods` VALUES (14570, 5, 42);
INSERT INTO `item_mods` VALUES (14570, 27, -5);
INSERT INTO `item_mods` VALUES (14570, 296, 5);
INSERT INTO `item_mods` VALUES (14570, 384, 40);
INSERT INTO `item_mods` VALUES (14571, 1, 36);
INSERT INTO `item_mods` VALUES (14571, 8, 1);
INSERT INTO `item_mods` VALUES (14571, 9, 1);
INSERT INTO `item_mods` VALUES (14571, 25, 5);
INSERT INTO `item_mods` VALUES (14572, 1, 37);
INSERT INTO `item_mods` VALUES (14572, 8, 2);
INSERT INTO `item_mods` VALUES (14572, 9, 2);
INSERT INTO `item_mods` VALUES (14572, 25, 7);
INSERT INTO `item_mods` VALUES (14573, 1, 55);
INSERT INTO `item_mods` VALUES (14573, 8, 10);
INSERT INTO `item_mods` VALUES (14573, 9, -3);
INSERT INTO `item_mods` VALUES (14573, 10, 10);
INSERT INTO `item_mods` VALUES (14573, 11, -3);
INSERT INTO `item_mods` VALUES (14573, 12, -3);
INSERT INTO `item_mods` VALUES (14573, 13, -3);
INSERT INTO `item_mods` VALUES (14573, 14, -3);
INSERT INTO `item_mods` VALUES (14573, 23, 25);
INSERT INTO `item_mods` VALUES (14573, 25, 5);
INSERT INTO `item_mods` VALUES (14573, 370, 2);
INSERT INTO `item_mods` VALUES (14574, 1, 56);
INSERT INTO `item_mods` VALUES (14574, 8, 11);
INSERT INTO `item_mods` VALUES (14574, 9, -4);
INSERT INTO `item_mods` VALUES (14574, 10, 11);
INSERT INTO `item_mods` VALUES (14574, 11, -4);
INSERT INTO `item_mods` VALUES (14574, 12, -4);
INSERT INTO `item_mods` VALUES (14574, 13, -4);
INSERT INTO `item_mods` VALUES (14574, 14, -4);
INSERT INTO `item_mods` VALUES (14574, 23, 26);
INSERT INTO `item_mods` VALUES (14574, 25, 6);
INSERT INTO `item_mods` VALUES (14574, 370, 2);
INSERT INTO `item_mods` VALUES (14575, 1, 38);
INSERT INTO `item_mods` VALUES (14575, 27, -4);
INSERT INTO `item_mods` VALUES (14575, 30, 10);
INSERT INTO `item_mods` VALUES (14575, 161, 6);
INSERT INTO `item_mods` VALUES (14575, 163, -3);
INSERT INTO `item_mods` VALUES (14576, 1, 39);
INSERT INTO `item_mods` VALUES (14576, 27, -5);
INSERT INTO `item_mods` VALUES (14576, 30, 11);
INSERT INTO `item_mods` VALUES (14576, 161, 7);
INSERT INTO `item_mods` VALUES (14576, 163, -4);
INSERT INTO `item_mods` VALUES (14577, 1, 60);
INSERT INTO `item_mods` VALUES (14577, 2, 50);
INSERT INTO `item_mods` VALUES (14577, 27, 4);
INSERT INTO `item_mods` VALUES (14577, 160, -5);
INSERT INTO `item_mods` VALUES (14577, 384, -50);
INSERT INTO `item_mods` VALUES (14578, 1, 38);
INSERT INTO `item_mods` VALUES (14578, 2, 20);
INSERT INTO `item_mods` VALUES (14578, 8, 2);
INSERT INTO `item_mods` VALUES (14578, 9, 2);
INSERT INTO `item_mods` VALUES (14578, 27, -2);
INSERT INTO `item_mods` VALUES (14578, 491, 10);
INSERT INTO `item_mods` VALUES (14579, 1, 38);
INSERT INTO `item_mods` VALUES (14579, 2, 20);
INSERT INTO `item_mods` VALUES (14579, 8, 2);
INSERT INTO `item_mods` VALUES (14579, 9, 2);
INSERT INTO `item_mods` VALUES (14579, 27, -2);
INSERT INTO `item_mods` VALUES (14579, 491, 10);
INSERT INTO `item_mods` VALUES (14580, 1, 38);
INSERT INTO `item_mods` VALUES (14580, 5, 13);
INSERT INTO `item_mods` VALUES (14580, 12, 1);
INSERT INTO `item_mods` VALUES (14580, 13, 1);
INSERT INTO `item_mods` VALUES (14580, 337, 15);
INSERT INTO `item_mods` VALUES (14581, 1, 32);
INSERT INTO `item_mods` VALUES (14581, 9, 2);
INSERT INTO `item_mods` VALUES (14582, 1, 41);
INSERT INTO `item_mods` VALUES (14582, 10, 2);
INSERT INTO `item_mods` VALUES (14583, 1, 32);
INSERT INTO `item_mods` VALUES (14583, 12, 2);
INSERT INTO `item_mods` VALUES (14583, 13, 2);
INSERT INTO `item_mods` VALUES (14583, 14, 2);
INSERT INTO `item_mods` VALUES (14583, 60, 4);
INSERT INTO `item_mods` VALUES (14583, 61, 4);
INSERT INTO `item_mods` VALUES (14584, 1, 1);
INSERT INTO `item_mods` VALUES (14584, 2, 4);
INSERT INTO `item_mods` VALUES (14584, 5, 4);
INSERT INTO `item_mods` VALUES (14585, 1, 1);
INSERT INTO `item_mods` VALUES (14585, 2, 8);
INSERT INTO `item_mods` VALUES (14586, 1, 1);
INSERT INTO `item_mods` VALUES (14586, 5, 8);
INSERT INTO `item_mods` VALUES (14587, 1, 1);
INSERT INTO `item_mods` VALUES (14587, 71, 1);
INSERT INTO `item_mods` VALUES (14588, 1, 50);
INSERT INTO `item_mods` VALUES (14588, 2, 32);
INSERT INTO `item_mods` VALUES (14588, 27, 6);
INSERT INTO `item_mods` VALUES (14588, 29, 5);
INSERT INTO `item_mods` VALUES (14589, 1, 45);
INSERT INTO `item_mods` VALUES (14589, 8, 8);
INSERT INTO `item_mods` VALUES (14589, 68, 9);
INSERT INTO `item_mods` VALUES (14589, 289, 7);
INSERT INTO `item_mods` VALUES (14590, 1, 42);
INSERT INTO `item_mods` VALUES (14590, 25, 11);
INSERT INTO `item_mods` VALUES (14590, 27, -8);
INSERT INTO `item_mods` VALUES (14590, 73, 6);
INSERT INTO `item_mods` VALUES (14591, 1, 39);
INSERT INTO `item_mods` VALUES (14591, 2, 32);
INSERT INTO `item_mods` VALUES (14591, 5, 32);
INSERT INTO `item_mods` VALUES (14591, 28, 4);
INSERT INTO `item_mods` VALUES (14591, 296, 3);
INSERT INTO `item_mods` VALUES (14592, 1, 1);
INSERT INTO `item_mods` VALUES (14592, 11, 2);
INSERT INTO `item_mods` VALUES (14592, 56, 5);
INSERT INTO `item_mods` VALUES (14593, 1, 1);
INSERT INTO `item_mods` VALUES (14593, 8, 2);
INSERT INTO `item_mods` VALUES (14593, 54, 5);
INSERT INTO `item_mods` VALUES (14594, 1, 1);
INSERT INTO `item_mods` VALUES (14594, 12, 2);
INSERT INTO `item_mods` VALUES (14594, 55, 5);
INSERT INTO `item_mods` VALUES (14595, 1, 1);
INSERT INTO `item_mods` VALUES (14595, 9, 2);
INSERT INTO `item_mods` VALUES (14595, 58, 5);
INSERT INTO `item_mods` VALUES (14596, 1, 1);
INSERT INTO `item_mods` VALUES (14596, 13, 2);
INSERT INTO `item_mods` VALUES (14596, 59, 5);
INSERT INTO `item_mods` VALUES (14597, 1, 1);
INSERT INTO `item_mods` VALUES (14597, 10, 2);
INSERT INTO `item_mods` VALUES (14597, 57, 5);
INSERT INTO `item_mods` VALUES (14598, 1, 1);
INSERT INTO `item_mods` VALUES (14598, 5, 5);
INSERT INTO `item_mods` VALUES (14598, 61, 5);
INSERT INTO `item_mods` VALUES (14599, 1, 1);
INSERT INTO `item_mods` VALUES (14599, 14, 2);
INSERT INTO `item_mods` VALUES (14599, 60, 5);
INSERT INTO `item_mods` VALUES (14600, 1, 2);
INSERT INTO `item_mods` VALUES (14600, 11, 3);
INSERT INTO `item_mods` VALUES (14600, 56, 7);
INSERT INTO `item_mods` VALUES (14601, 1, 2);
INSERT INTO `item_mods` VALUES (14601, 8, 3);
INSERT INTO `item_mods` VALUES (14601, 54, 7);
INSERT INTO `item_mods` VALUES (14602, 1, 2);
INSERT INTO `item_mods` VALUES (14602, 12, 3);
INSERT INTO `item_mods` VALUES (14602, 55, 7);
INSERT INTO `item_mods` VALUES (14603, 1, 2);
INSERT INTO `item_mods` VALUES (14603, 9, 3);
INSERT INTO `item_mods` VALUES (14603, 58, 7);
INSERT INTO `item_mods` VALUES (14604, 1, 2);
INSERT INTO `item_mods` VALUES (14604, 13, 3);
INSERT INTO `item_mods` VALUES (14604, 59, 7);
INSERT INTO `item_mods` VALUES (14605, 1, 2);
INSERT INTO `item_mods` VALUES (14605, 10, 3);
INSERT INTO `item_mods` VALUES (14605, 57, 7);
INSERT INTO `item_mods` VALUES (14606, 1, 2);
INSERT INTO `item_mods` VALUES (14606, 5, 7);
INSERT INTO `item_mods` VALUES (14606, 61, 7);
INSERT INTO `item_mods` VALUES (14607, 1, 2);
INSERT INTO `item_mods` VALUES (14607, 14, 3);
INSERT INTO `item_mods` VALUES (14607, 60, 7);
INSERT INTO `item_mods` VALUES (14608, 1, 3);
INSERT INTO `item_mods` VALUES (14608, 11, 4);
INSERT INTO `item_mods` VALUES (14608, 56, 9);
INSERT INTO `item_mods` VALUES (14609, 1, 3);
INSERT INTO `item_mods` VALUES (14609, 8, 4);
INSERT INTO `item_mods` VALUES (14609, 54, 9);
INSERT INTO `item_mods` VALUES (14610, 1, 3);
INSERT INTO `item_mods` VALUES (14610, 12, 4);
INSERT INTO `item_mods` VALUES (14610, 55, 9);
INSERT INTO `item_mods` VALUES (14611, 1, 3);
INSERT INTO `item_mods` VALUES (14611, 9, 4);
INSERT INTO `item_mods` VALUES (14611, 58, 9);
INSERT INTO `item_mods` VALUES (14612, 1, 3);
INSERT INTO `item_mods` VALUES (14612, 13, 4);
INSERT INTO `item_mods` VALUES (14612, 59, 9);
INSERT INTO `item_mods` VALUES (14613, 1, 3);
INSERT INTO `item_mods` VALUES (14613, 10, 4);
INSERT INTO `item_mods` VALUES (14613, 57, 9);
INSERT INTO `item_mods` VALUES (14614, 1, 3);
INSERT INTO `item_mods` VALUES (14614, 5, 9);
INSERT INTO `item_mods` VALUES (14614, 61, 9);
INSERT INTO `item_mods` VALUES (14615, 1, 3);
INSERT INTO `item_mods` VALUES (14615, 14, 4);
INSERT INTO `item_mods` VALUES (14615, 60, 9);
INSERT INTO `item_mods` VALUES (14616, 2, 11);
INSERT INTO `item_mods` VALUES (14616, 5, -11);
INSERT INTO `item_mods` VALUES (14617, 1, 4);
INSERT INTO `item_mods` VALUES (14617, 11, 5);
INSERT INTO `item_mods` VALUES (14617, 56, 11);
INSERT INTO `item_mods` VALUES (14618, 1, 4);
INSERT INTO `item_mods` VALUES (14618, 8, 5);
INSERT INTO `item_mods` VALUES (14618, 54, 11);
INSERT INTO `item_mods` VALUES (14619, 1, 4);
INSERT INTO `item_mods` VALUES (14619, 12, 5);
INSERT INTO `item_mods` VALUES (14619, 55, 11);
INSERT INTO `item_mods` VALUES (14620, 1, 4);
INSERT INTO `item_mods` VALUES (14620, 9, 5);
INSERT INTO `item_mods` VALUES (14620, 58, 11);
INSERT INTO `item_mods` VALUES (14621, 1, 4);
INSERT INTO `item_mods` VALUES (14621, 13, 5);
INSERT INTO `item_mods` VALUES (14621, 59, 11);
INSERT INTO `item_mods` VALUES (14622, 1, 4);
INSERT INTO `item_mods` VALUES (14622, 10, 5);
INSERT INTO `item_mods` VALUES (14622, 57, 11);
INSERT INTO `item_mods` VALUES (14623, 1, 4);
INSERT INTO `item_mods` VALUES (14623, 5, 11);
INSERT INTO `item_mods` VALUES (14623, 61, 11);
INSERT INTO `item_mods` VALUES (14624, 1, 4);
INSERT INTO `item_mods` VALUES (14624, 14, 5);
INSERT INTO `item_mods` VALUES (14624, 60, 11);
INSERT INTO `item_mods` VALUES (14625, 5, 25);
INSERT INTO `item_mods` VALUES (14625, 117, 10);
INSERT INTO `item_mods` VALUES (14625, 346, 1);
INSERT INTO `item_mods` VALUES (14626, 27, 2);
INSERT INTO `item_mods` VALUES (14626, 59, 3);
INSERT INTO `item_mods` VALUES (14627, 1, 2);
INSERT INTO `item_mods` VALUES (14627, 25, -12);
INSERT INTO `item_mods` VALUES (14627, 26, 12);
INSERT INTO `item_mods` VALUES (14627, 162, -1);
INSERT INTO `item_mods` VALUES (14630, 1, 3);
INSERT INTO `item_mods` VALUES (14630, 8, 5);
INSERT INTO `item_mods` VALUES (14630, 12, 2);
INSERT INTO `item_mods` VALUES (14630, 13, -2);
INSERT INTO `item_mods` VALUES (14631, 8, 6);
INSERT INTO `item_mods` VALUES (14631, 59, -30);
INSERT INTO `item_mods` VALUES (14632, 1, 3);
INSERT INTO `item_mods` VALUES (14632, 8, 2);
INSERT INTO `item_mods` VALUES (14632, 9, -2);
INSERT INTO `item_mods` VALUES (14632, 13, 5);
INSERT INTO `item_mods` VALUES (14633, 13, 6);
INSERT INTO `item_mods` VALUES (14633, 58, -30);
INSERT INTO `item_mods` VALUES (14634, 1, 3);
INSERT INTO `item_mods` VALUES (14634, 9, 2);
INSERT INTO `item_mods` VALUES (14634, 10, 5);
INSERT INTO `item_mods` VALUES (14634, 11, -2);
INSERT INTO `item_mods` VALUES (14635, 10, 6);
INSERT INTO `item_mods` VALUES (14635, 56, -30);
INSERT INTO `item_mods` VALUES (14636, 1, 3);
INSERT INTO `item_mods` VALUES (14636, 10, 2);
INSERT INTO `item_mods` VALUES (14636, 11, 5);
INSERT INTO `item_mods` VALUES (14636, 12, -2);
INSERT INTO `item_mods` VALUES (14637, 11, 6);
INSERT INTO `item_mods` VALUES (14637, 55, -30);
INSERT INTO `item_mods` VALUES (14638, 1, 3);
INSERT INTO `item_mods` VALUES (14638, 9, 5);
INSERT INTO `item_mods` VALUES (14638, 10, -2);
INSERT INTO `item_mods` VALUES (14638, 13, 2);
INSERT INTO `item_mods` VALUES (14639, 9, 6);
INSERT INTO `item_mods` VALUES (14639, 57, -30);
INSERT INTO `item_mods` VALUES (14640, 1, 3);
INSERT INTO `item_mods` VALUES (14640, 8, -2);
INSERT INTO `item_mods` VALUES (14640, 11, 2);
INSERT INTO `item_mods` VALUES (14640, 12, 5);
INSERT INTO `item_mods` VALUES (14641, 12, 6);
INSERT INTO `item_mods` VALUES (14641, 54, -30);
INSERT INTO `item_mods` VALUES (14642, 1, 3);
INSERT INTO `item_mods` VALUES (14642, 2, 20);
INSERT INTO `item_mods` VALUES (14642, 5, -20);
INSERT INTO `item_mods` VALUES (14642, 8, -1);
INSERT INTO `item_mods` VALUES (14642, 9, -1);
INSERT INTO `item_mods` VALUES (14642, 10, -1);
INSERT INTO `item_mods` VALUES (14642, 11, -1);
INSERT INTO `item_mods` VALUES (14642, 12, -1);
INSERT INTO `item_mods` VALUES (14642, 13, -1);
INSERT INTO `item_mods` VALUES (14642, 14, 5);
INSERT INTO `item_mods` VALUES (14643, 14, 6);
INSERT INTO `item_mods` VALUES (14643, 61, -30);
INSERT INTO `item_mods` VALUES (14644, 1, 3);
INSERT INTO `item_mods` VALUES (14644, 2, -20);
INSERT INTO `item_mods` VALUES (14644, 5, 20);
INSERT INTO `item_mods` VALUES (14644, 8, 1);
INSERT INTO `item_mods` VALUES (14644, 9, 1);
INSERT INTO `item_mods` VALUES (14644, 10, 1);
INSERT INTO `item_mods` VALUES (14644, 11, 1);
INSERT INTO `item_mods` VALUES (14644, 12, 1);
INSERT INTO `item_mods` VALUES (14644, 13, 1);
INSERT INTO `item_mods` VALUES (14644, 14, 1);
INSERT INTO `item_mods` VALUES (14645, 5, 30);
INSERT INTO `item_mods` VALUES (14645, 60, -30);

-- -------------------------------------------------------
-- Shadow Ring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (14646, 255, 5); -- Enhances resistance against "Death"
-- INSERT INTO `item_mods` VALUES (14646, ?, ?); -- Occasionally annulls magic damage taken (is presently not a mod)

-- -------------------------------------------------------
-- Telluric Ring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (14649, 58, 20); -- [Element: Thunder]+20
INSERT INTO `item_mods` VALUES (14650, 1, 2);
INSERT INTO `item_mods` VALUES (14650, 26, 6);
INSERT INTO `item_mods` VALUES (14651, 5, 15);
INSERT INTO `item_mods` VALUES (14654, 2, 3);
INSERT INTO `item_mods` VALUES (14654, 5, -3);
INSERT INTO `item_mods` VALUES (14655, 25, 3);
INSERT INTO `item_mods` VALUES (14656, 2, 10);
INSERT INTO `item_mods` VALUES (14656, 5, 10);
INSERT INTO `item_mods` VALUES (14659, 27, 3);
INSERT INTO `item_mods` VALUES (14660, 24, 3);
INSERT INTO `item_mods` VALUES (14660, 26, 3);
INSERT INTO `item_mods` VALUES (14667, 5, 20);
INSERT INTO `item_mods` VALUES (14667, 13, 1);
INSERT INTO `item_mods` VALUES (14668, 5, 20);
INSERT INTO `item_mods` VALUES (14668, 12, 1);
INSERT INTO `item_mods` VALUES (14669, 25, 4);
INSERT INTO `item_mods` VALUES (14669, 26, 4);
INSERT INTO `item_mods` VALUES (14670, 1, 2);
INSERT INTO `item_mods` VALUES (14673, 7, 15);
INSERT INTO `item_mods` VALUES (14673, 12, 2);
INSERT INTO `item_mods` VALUES (14673, 13, 2);
INSERT INTO `item_mods` VALUES (14673, 14, 2);
INSERT INTO `item_mods` VALUES (14673, 27, -2);
INSERT INTO `item_mods` VALUES (14674, 1, 1);
INSERT INTO `item_mods` VALUES (14674, 2, 10);
INSERT INTO `item_mods` VALUES (14674, 25, 7);
INSERT INTO `item_mods` VALUES (14675, 25, 5);
INSERT INTO `item_mods` VALUES (14675, 26, 5);
INSERT INTO `item_mods` VALUES (14675, 68, -5);
INSERT INTO `item_mods` VALUES (14676, 23, 5);
INSERT INTO `item_mods` VALUES (14682, 9, 3);
INSERT INTO `item_mods` VALUES (14682, 25, 2);
INSERT INTO `item_mods` VALUES (14683, 1, 3);
INSERT INTO `item_mods` VALUES (14683, 10, 3);
INSERT INTO `item_mods` VALUES (14684, 11, 3);
INSERT INTO `item_mods` VALUES (14684, 68, 1);
INSERT INTO `item_mods` VALUES (14685, 5, 5);
INSERT INTO `item_mods` VALUES (14685, 12, 3);
INSERT INTO `item_mods` VALUES (14686, 5, 5);
INSERT INTO `item_mods` VALUES (14686, 13, 3);
INSERT INTO `item_mods` VALUES (14687, 5, 6);
INSERT INTO `item_mods` VALUES (14687, 14, 3);
INSERT INTO `item_mods` VALUES (14688, 1, 1);
INSERT INTO `item_mods` VALUES (14688, 56, 4);
INSERT INTO `item_mods` VALUES (14688, 57, 4);
INSERT INTO `item_mods` VALUES (14689, 1, 1);
INSERT INTO `item_mods` VALUES (14689, 54, 4);
INSERT INTO `item_mods` VALUES (14689, 55, 4);
INSERT INTO `item_mods` VALUES (14690, 1, 1);
INSERT INTO `item_mods` VALUES (14690, 55, 4);
INSERT INTO `item_mods` VALUES (14690, 56, 4);
INSERT INTO `item_mods` VALUES (14691, 1, 1);
INSERT INTO `item_mods` VALUES (14691, 58, 4);
INSERT INTO `item_mods` VALUES (14691, 59, 4);
INSERT INTO `item_mods` VALUES (14692, 1, 1);
INSERT INTO `item_mods` VALUES (14692, 54, 4);
INSERT INTO `item_mods` VALUES (14692, 59, 4);
INSERT INTO `item_mods` VALUES (14693, 1, 1);
INSERT INTO `item_mods` VALUES (14693, 57, 4);
INSERT INTO `item_mods` VALUES (14693, 58, 4);
INSERT INTO `item_mods` VALUES (14694, 1, 1);
INSERT INTO `item_mods` VALUES (14694, 5, 4);
INSERT INTO `item_mods` VALUES (14694, 61, 4);
INSERT INTO `item_mods` VALUES (14695, 1, 1);
INSERT INTO `item_mods` VALUES (14695, 2, 4);
INSERT INTO `item_mods` VALUES (14695, 60, 4);
INSERT INTO `item_mods` VALUES (14696, 1, 1);
INSERT INTO `item_mods` VALUES (14696, 56, 6);
INSERT INTO `item_mods` VALUES (14696, 57, 6);
INSERT INTO `item_mods` VALUES (14697, 1, 1);
INSERT INTO `item_mods` VALUES (14697, 54, 6);
INSERT INTO `item_mods` VALUES (14697, 55, 6);
INSERT INTO `item_mods` VALUES (14698, 1, 1);
INSERT INTO `item_mods` VALUES (14698, 55, 6);
INSERT INTO `item_mods` VALUES (14698, 56, 6);
INSERT INTO `item_mods` VALUES (14699, 1, 1);
INSERT INTO `item_mods` VALUES (14699, 58, 6);
INSERT INTO `item_mods` VALUES (14699, 59, 6);
INSERT INTO `item_mods` VALUES (14700, 1, 1);
INSERT INTO `item_mods` VALUES (14700, 54, 6);
INSERT INTO `item_mods` VALUES (14700, 59, 6);
INSERT INTO `item_mods` VALUES (14701, 1, 1);
INSERT INTO `item_mods` VALUES (14701, 57, 6);
INSERT INTO `item_mods` VALUES (14701, 58, 6);
INSERT INTO `item_mods` VALUES (14702, 1, 1);
INSERT INTO `item_mods` VALUES (14702, 5, 6);
INSERT INTO `item_mods` VALUES (14702, 61, 6);
INSERT INTO `item_mods` VALUES (14703, 1, 1);
INSERT INTO `item_mods` VALUES (14703, 2, 6);
INSERT INTO `item_mods` VALUES (14703, 60, 6);
INSERT INTO `item_mods` VALUES (14704, 1, 1);
INSERT INTO `item_mods` VALUES (14704, 56, 10);
INSERT INTO `item_mods` VALUES (14704, 57, 10);
INSERT INTO `item_mods` VALUES (14705, 1, 1);
INSERT INTO `item_mods` VALUES (14705, 54, 10);
INSERT INTO `item_mods` VALUES (14705, 55, 10);
INSERT INTO `item_mods` VALUES (14706, 1, 1);
INSERT INTO `item_mods` VALUES (14706, 55, 10);
INSERT INTO `item_mods` VALUES (14706, 56, 10);
INSERT INTO `item_mods` VALUES (14707, 1, 1);
INSERT INTO `item_mods` VALUES (14707, 58, 10);
INSERT INTO `item_mods` VALUES (14707, 59, 10);
INSERT INTO `item_mods` VALUES (14708, 1, 1);
INSERT INTO `item_mods` VALUES (14708, 54, 10);
INSERT INTO `item_mods` VALUES (14708, 59, 10);
INSERT INTO `item_mods` VALUES (14709, 1, 1);
INSERT INTO `item_mods` VALUES (14709, 57, 10);
INSERT INTO `item_mods` VALUES (14709, 58, 10);
INSERT INTO `item_mods` VALUES (14710, 1, 1);
INSERT INTO `item_mods` VALUES (14710, 5, 10);
INSERT INTO `item_mods` VALUES (14710, 61, 10);
INSERT INTO `item_mods` VALUES (14711, 1, 1);
INSERT INTO `item_mods` VALUES (14711, 2, 10);
INSERT INTO `item_mods` VALUES (14711, 60, 10);
INSERT INTO `item_mods` VALUES (14712, 1, 1);
INSERT INTO `item_mods` VALUES (14712, 11, 2);
INSERT INTO `item_mods` VALUES (14712, 56, 12);
INSERT INTO `item_mods` VALUES (14712, 57, 12);
INSERT INTO `item_mods` VALUES (14713, 1, 1);
INSERT INTO `item_mods` VALUES (14713, 8, 2);
INSERT INTO `item_mods` VALUES (14713, 54, 12);
INSERT INTO `item_mods` VALUES (14713, 55, 12);
INSERT INTO `item_mods` VALUES (14714, 1, 1);
INSERT INTO `item_mods` VALUES (14714, 12, 2);
INSERT INTO `item_mods` VALUES (14714, 55, 12);
INSERT INTO `item_mods` VALUES (14714, 56, 12);
INSERT INTO `item_mods` VALUES (14715, 1, 1);
INSERT INTO `item_mods` VALUES (14715, 9, 2);
INSERT INTO `item_mods` VALUES (14715, 58, 12);
INSERT INTO `item_mods` VALUES (14715, 59, 12);
INSERT INTO `item_mods` VALUES (14716, 1, 1);
INSERT INTO `item_mods` VALUES (14716, 13, 2);
INSERT INTO `item_mods` VALUES (14716, 54, 12);
INSERT INTO `item_mods` VALUES (14716, 59, 12);
INSERT INTO `item_mods` VALUES (14717, 1, 1);
INSERT INTO `item_mods` VALUES (14717, 10, 2);
INSERT INTO `item_mods` VALUES (14717, 57, 12);
INSERT INTO `item_mods` VALUES (14717, 58, 12);
INSERT INTO `item_mods` VALUES (14718, 1, 1);
INSERT INTO `item_mods` VALUES (14718, 5, 12);
INSERT INTO `item_mods` VALUES (14718, 27, 2);
INSERT INTO `item_mods` VALUES (14718, 61, 12);
INSERT INTO `item_mods` VALUES (14719, 1, 1);
INSERT INTO `item_mods` VALUES (14719, 2, 12);
INSERT INTO `item_mods` VALUES (14719, 27, -2);
INSERT INTO `item_mods` VALUES (14719, 60, 12);
INSERT INTO `item_mods` VALUES (14720, 5, 4);
INSERT INTO `item_mods` VALUES (14720, 12, 1);
INSERT INTO `item_mods` VALUES (14721, 5, 5);
INSERT INTO `item_mods` VALUES (14721, 12, 2);
INSERT INTO `item_mods` VALUES (14722, 2, 20);
INSERT INTO `item_mods` VALUES (14722, 59, 5);
INSERT INTO `item_mods` VALUES (14723, 2, 25);
INSERT INTO `item_mods` VALUES (14723, 59, 7);
INSERT INTO `item_mods` VALUES (14724, 28, 5);
INSERT INTO `item_mods` VALUES (14725, 14, 1);
INSERT INTO `item_mods` VALUES (14726, 14, 2);
INSERT INTO `item_mods` VALUES (14727, 5, 8);
INSERT INTO `item_mods` VALUES (14727, 12, 1);
INSERT INTO `item_mods` VALUES (14728, 5, 10);
INSERT INTO `item_mods` VALUES (14728, 12, 2);
INSERT INTO `item_mods` VALUES (14739, 11, 2);
INSERT INTO `item_mods` VALUES (14739, 82, 5);
INSERT INTO `item_mods` VALUES (14739, 259, 5);
INSERT INTO `item_mods` VALUES (14740, 10, 2);
INSERT INTO `item_mods` VALUES (14740, 109, 5);
INSERT INTO `item_mods` VALUES (14740, 111, 5);
INSERT INTO `item_mods` VALUES (14741, 12, 2);
INSERT INTO `item_mods` VALUES (14741, 86, 5);
INSERT INTO `item_mods` VALUES (14741, 116, 5);
INSERT INTO `item_mods` VALUES (14742, 14, 2);
INSERT INTO `item_mods` VALUES (14742, 68, 5);
INSERT INTO `item_mods` VALUES (14742, 84, 5);
INSERT INTO `item_mods` VALUES (14743, 8, 2);
INSERT INTO `item_mods` VALUES (14743, 89, 5);
INSERT INTO `item_mods` VALUES (14743, 110, 5);
INSERT INTO `item_mods` VALUES (14744, 231, -2);
INSERT INTO `item_mods` VALUES (14744, 232, 2);
INSERT INTO `item_mods` VALUES (14745, 231, 2);
INSERT INTO `item_mods` VALUES (14745, 232, -2);
INSERT INTO `item_mods` VALUES (14746, 224, -2);
INSERT INTO `item_mods` VALUES (14746, 229, 2);
INSERT INTO `item_mods` VALUES (14747, 225, -2);
INSERT INTO `item_mods` VALUES (14747, 228, 2);
INSERT INTO `item_mods` VALUES (14748, 225, 2);
INSERT INTO `item_mods` VALUES (14748, 226, -2);
INSERT INTO `item_mods` VALUES (14749, 224, 2);
INSERT INTO `item_mods` VALUES (14749, 227, -2);
INSERT INTO `item_mods` VALUES (14750, 226, 2);
INSERT INTO `item_mods` VALUES (14750, 228, -2);
INSERT INTO `item_mods` VALUES (14751, 229, -2);
INSERT INTO `item_mods` VALUES (14751, 230, 2);
INSERT INTO `item_mods` VALUES (14752, 227, 2);
INSERT INTO `item_mods` VALUES (14752, 230, -2);
INSERT INTO `item_mods` VALUES (14753, 233, 2);
INSERT INTO `item_mods` VALUES (14753, 234, -2);
INSERT INTO `item_mods` VALUES (14754, 233, -2);
INSERT INTO `item_mods` VALUES (14754, 234, 2);
INSERT INTO `item_mods` VALUES (14756, 25, 2);
INSERT INTO `item_mods` VALUES (14757, 1, 1);
INSERT INTO `item_mods` VALUES (14758, 168, 9);
INSERT INTO `item_mods` VALUES (14758, 385, 10);
INSERT INTO `item_mods` VALUES (14760, 12, 1);
INSERT INTO `item_mods` VALUES (14761, 1, 1);
INSERT INTO `item_mods` VALUES (14761, 68, 5);
INSERT INTO `item_mods` VALUES (14762, 73, 1);
INSERT INTO `item_mods` VALUES (14763, 12, 1);
INSERT INTO `item_mods` VALUES (14763, 71, 1);
INSERT INTO `item_mods` VALUES (14764, 8, 1);
INSERT INTO `item_mods` VALUES (14764, 9, 1);
INSERT INTO `item_mods` VALUES (14765, 10, 1);
INSERT INTO `item_mods` VALUES (14765, 11, 1);
INSERT INTO `item_mods` VALUES (14766, 5, 5);
INSERT INTO `item_mods` VALUES (14766, 13, 1);
INSERT INTO `item_mods` VALUES (14767, 108, 3);
INSERT INTO `item_mods` VALUES (14768, 110, 3);
INSERT INTO `item_mods` VALUES (14769, 109, 3);
INSERT INTO `item_mods` VALUES (14770, 107, 3);
INSERT INTO `item_mods` VALUES (14771, 111, 3);
INSERT INTO `item_mods` VALUES (14772, 116, 3);
INSERT INTO `item_mods` VALUES (14773, 113, 3);
INSERT INTO `item_mods` VALUES (14774, 114, 3);
INSERT INTO `item_mods` VALUES (14775, 115, 3);
INSERT INTO `item_mods` VALUES (14776, 112, 3);
INSERT INTO `item_mods` VALUES (14777, 117, 3);
INSERT INTO `item_mods` VALUES (14778, 118, 3);
INSERT INTO `item_mods` VALUES (14779, 119, 3);
INSERT INTO `item_mods` VALUES (14780, 120, 3);
INSERT INTO `item_mods` VALUES (14781, 121, 3);
INSERT INTO `item_mods` VALUES (14782, 7, 25);
INSERT INTO `item_mods` VALUES (14784, 14, 1);
INSERT INTO `item_mods` VALUES (14784, 248, 2);
INSERT INTO `item_mods` VALUES (14790, 23, -2);
INSERT INTO `item_mods` VALUES (14790, 68, 2);
INSERT INTO `item_mods` VALUES (14791, 72, 4);
INSERT INTO `item_mods` VALUES (14792, 71, 2);
INSERT INTO `item_mods` VALUES (14793, 2, 10);
INSERT INTO `item_mods` VALUES (14793, 9, 1);
INSERT INTO `item_mods` VALUES (14793, 10, 1);
INSERT INTO `item_mods` VALUES (14794, 5, 10);
INSERT INTO `item_mods` VALUES (14794, 12, 1);
INSERT INTO `item_mods` VALUES (14794, 13, 1);
INSERT INTO `item_mods` VALUES (14795, 5, 15);
INSERT INTO `item_mods` VALUES (14795, 12, 2);
INSERT INTO `item_mods` VALUES (14796, 9, 2);
INSERT INTO `item_mods` VALUES (14796, 11, 1);
INSERT INTO `item_mods` VALUES (14797, 8, 2);
INSERT INTO `item_mods` VALUES (14797, 10, 1);
INSERT INTO `item_mods` VALUES (14798, 2, 35);
INSERT INTO `item_mods` VALUES (14799, 2, 10);
INSERT INTO `item_mods` VALUES (14799, 13, 2);
INSERT INTO `item_mods` VALUES (14800, 8, 1);
INSERT INTO `item_mods` VALUES (14800, 10, 2);
INSERT INTO `item_mods` VALUES (14801, 5, 30);
INSERT INTO `item_mods` VALUES (14802, 5, 10);
INSERT INTO `item_mods` VALUES (14802, 12, 2);
INSERT INTO `item_mods` VALUES (14803, 1, 1);
INSERT INTO `item_mods` VALUES (14803, 23, -2);
INSERT INTO `item_mods` VALUES (14803, 25, 1);
INSERT INTO `item_mods` VALUES (14804, 9, 1);
INSERT INTO `item_mods` VALUES (14804, 11, 1);
INSERT INTO `item_mods` VALUES (14804, 13, 1);
INSERT INTO `item_mods` VALUES (14805, 8, 1);
INSERT INTO `item_mods` VALUES (14805, 10, 1);
INSERT INTO `item_mods` VALUES (14805, 12, 1);
INSERT INTO `item_mods` VALUES (14805, 14, 1);
INSERT INTO `item_mods` VALUES (14806, 1, 6);
INSERT INTO `item_mods` VALUES (14806, 9, 1);
INSERT INTO `item_mods` VALUES (14806, 11, 1);
INSERT INTO `item_mods` VALUES (14807, 1, 3);
INSERT INTO `item_mods` VALUES (14807, 374, 5);
INSERT INTO `item_mods` VALUES (14808, 28, 7);
INSERT INTO `item_mods` VALUES (14809, 27, -7);
INSERT INTO `item_mods` VALUES (14809, 68, 7);
INSERT INTO `item_mods` VALUES (14812, 5, 30);
INSERT INTO `item_mods` VALUES (14812, 170, 2);
INSERT INTO `item_mods` VALUES (14813, 73, 1);
INSERT INTO `item_mods` VALUES (14813, 288, 5);
INSERT INTO `item_mods` VALUES (14814, 25, 3);
INSERT INTO `item_mods` VALUES (14815, 118, 5);
INSERT INTO `item_mods` VALUES (14815, 244, 2);
INSERT INTO `item_mods` VALUES (14816, 1, 23);
INSERT INTO `item_mods` VALUES (14816, 12, -11);
INSERT INTO `item_mods` VALUES (14816, 23, 11);
INSERT INTO `item_mods` VALUES (14816, 25, 5);
INSERT INTO `item_mods` VALUES (14816, 68, -5);

-- ------------------------------------------
-- Field Gloves
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (14817, 1, 1); -- DEF+1
INSERT INTO `item_mods` VALUES (14817, 514, 73); -- Improves logging results, 73 = 0.073
INSERT INTO `item_mods` VALUES (14817, 515, 73); -- Improves mining results, 73 = 0.073

-- ------------------------------------------
-- Worker Gloves
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (14818, 1, 3); -- DEF+3
INSERT INTO `item_mods` VALUES (14818, 514, 73); -- Improves logging results, 73 = 0.073
INSERT INTO `item_mods` VALUES (14818, 515, 73); -- Improves mining results, 73 = 0.073

INSERT INTO `item_mods` VALUES (14819, 1, 24);
INSERT INTO `item_mods` VALUES (14819, 23, 2);
INSERT INTO `item_mods` VALUES (14819, 68, 10);
INSERT INTO `item_mods` VALUES (14820, 1, 25);
INSERT INTO `item_mods` VALUES (14820, 23, 3);
INSERT INTO `item_mods` VALUES (14820, 68, 11);
INSERT INTO `item_mods` VALUES (14820, 291, 1);
INSERT INTO `item_mods` VALUES (14821, 1, 16);
INSERT INTO `item_mods` VALUES (14821, 2, -20);
INSERT INTO `item_mods` VALUES (14821, 25, 4);
INSERT INTO `item_mods` VALUES (14821, 242, 2);
INSERT INTO `item_mods` VALUES (14822, 1, 17);
INSERT INTO `item_mods` VALUES (14822, 2, -25);
INSERT INTO `item_mods` VALUES (14822, 25, 5);
INSERT INTO `item_mods` VALUES (14822, 242, 2);
INSERT INTO `item_mods` VALUES (14823, 1, 16);
INSERT INTO `item_mods` VALUES (14823, 11, 4);
INSERT INTO `item_mods` VALUES (14823, 23, 2);
INSERT INTO `item_mods` VALUES (14823, 27, 2);
INSERT INTO `item_mods` VALUES (14823, 289, 2);
INSERT INTO `item_mods` VALUES (14824, 1, 17);
INSERT INTO `item_mods` VALUES (14824, 11, 5);
INSERT INTO `item_mods` VALUES (14824, 23, 3);
INSERT INTO `item_mods` VALUES (14824, 27, 3);
INSERT INTO `item_mods` VALUES (14824, 289, 3);
INSERT INTO `item_mods` VALUES (14825, 1, 25);
INSERT INTO `item_mods` VALUES (14825, 2, 22);
INSERT INTO `item_mods` VALUES (14825, 23, 6);
INSERT INTO `item_mods` VALUES (14825, 169, -3);
INSERT INTO `item_mods` VALUES (14825, 384, 40);
INSERT INTO `item_mods` VALUES (14826, 1, 8);
INSERT INTO `item_mods` VALUES (14826, 5, 15);
INSERT INTO `item_mods` VALUES (14826, 14, -1);
INSERT INTO `item_mods` VALUES (14826, 117, 2);
INSERT INTO `item_mods` VALUES (14826, 357, 1);
INSERT INTO `item_mods` VALUES (14827, 1, 9);
INSERT INTO `item_mods` VALUES (14827, 5, 17);
INSERT INTO `item_mods` VALUES (14827, 14, -2);
INSERT INTO `item_mods` VALUES (14827, 117, 3);
INSERT INTO `item_mods` VALUES (14827, 357, 2);
INSERT INTO `item_mods` VALUES (14828, 1, 21);
INSERT INTO `item_mods` VALUES (14828, 5, 12);
INSERT INTO `item_mods` VALUES (14828, 10, 4);
INSERT INTO `item_mods` VALUES (14828, 11, -2);
INSERT INTO `item_mods` VALUES (14828, 12, -2);
INSERT INTO `item_mods` VALUES (14828, 27, 3);
INSERT INTO `item_mods` VALUES (14829, 1, 20);
INSERT INTO `item_mods` VALUES (14829, 10, 3);
INSERT INTO `item_mods` VALUES (14829, 23, 4);
INSERT INTO `item_mods` VALUES (14829, 163, -10);
INSERT INTO `item_mods` VALUES (14830, 1, 2);
INSERT INTO `item_mods` VALUES (14830, 57, 1);
INSERT INTO `item_mods` VALUES (14830, 128, 1);
INSERT INTO `item_mods` VALUES (14831, 1, 3);
INSERT INTO `item_mods` VALUES (14831, 54, 1);
INSERT INTO `item_mods` VALUES (14831, 129, 1);
INSERT INTO `item_mods` VALUES (14832, 1, 2);
INSERT INTO `item_mods` VALUES (14832, 61, 1);
INSERT INTO `item_mods` VALUES (14832, 132, 1);
INSERT INTO `item_mods` VALUES (14833, 1, 11);
INSERT INTO `item_mods` VALUES (14833, 5, 35);
INSERT INTO `item_mods` VALUES (14833, 10, -3);
INSERT INTO `item_mods` VALUES (14833, 11, -3);
INSERT INTO `item_mods` VALUES (14833, 12, 4);
INSERT INTO `item_mods` VALUES (14833, 13, 4);
INSERT INTO `item_mods` VALUES (14833, 14, 3);
INSERT INTO `item_mods` VALUES (14834, 1, 11);
INSERT INTO `item_mods` VALUES (14834, 5, 35);
INSERT INTO `item_mods` VALUES (14834, 10, -3);
INSERT INTO `item_mods` VALUES (14834, 11, -3);
INSERT INTO `item_mods` VALUES (14834, 12, 4);
INSERT INTO `item_mods` VALUES (14834, 13, 4);
INSERT INTO `item_mods` VALUES (14834, 14, 3);
INSERT INTO `item_mods` VALUES (14835, 1, 11);
INSERT INTO `item_mods` VALUES (14835, 2, -30);
INSERT INTO `item_mods` VALUES (14835, 5, 55);
INSERT INTO `item_mods` VALUES (14835, 9, 4);
INSERT INTO `item_mods` VALUES (14835, 10, -3);
INSERT INTO `item_mods` VALUES (14835, 12, 4);
INSERT INTO `item_mods` VALUES (14836, 1, 11);
INSERT INTO `item_mods` VALUES (14836, 2, -30);
INSERT INTO `item_mods` VALUES (14836, 5, 55);
INSERT INTO `item_mods` VALUES (14836, 9, 4);
INSERT INTO `item_mods` VALUES (14836, 10, -3);
INSERT INTO `item_mods` VALUES (14836, 12, 4);
INSERT INTO `item_mods` VALUES (14837, 1, 11);
INSERT INTO `item_mods` VALUES (14837, 2, 65);
INSERT INTO `item_mods` VALUES (14837, 8, 6);
INSERT INTO `item_mods` VALUES (14837, 10, 2);
INSERT INTO `item_mods` VALUES (14837, 11, -3);
INSERT INTO `item_mods` VALUES (14838, 1, 11);
INSERT INTO `item_mods` VALUES (14838, 2, 65);
INSERT INTO `item_mods` VALUES (14838, 8, 6);
INSERT INTO `item_mods` VALUES (14838, 10, 2);
INSERT INTO `item_mods` VALUES (14838, 11, -3);
INSERT INTO `item_mods` VALUES (14839, 1, 11);
INSERT INTO `item_mods` VALUES (14839, 2, 60);
INSERT INTO `item_mods` VALUES (14839, 10, 6);
INSERT INTO `item_mods` VALUES (14839, 11, -5);
INSERT INTO `item_mods` VALUES (14839, 13, 1);
INSERT INTO `item_mods` VALUES (14840, 1, 11);
INSERT INTO `item_mods` VALUES (14840, 2, -35);
INSERT INTO `item_mods` VALUES (14840, 5, 65);
INSERT INTO `item_mods` VALUES (14840, 10, -5);
INSERT INTO `item_mods` VALUES (14840, 12, 2);
INSERT INTO `item_mods` VALUES (14840, 13, 2);
INSERT INTO `item_mods` VALUES (14841, 1, 4);
INSERT INTO `item_mods` VALUES (14841, 10, 1);
INSERT INTO `item_mods` VALUES (14841, 12, 1);
INSERT INTO `item_mods` VALUES (14842, 1, 9);
INSERT INTO `item_mods` VALUES (14842, 5, 12);
INSERT INTO `item_mods` VALUES (14842, 9, -2);
INSERT INTO `item_mods` VALUES (14842, 13, 5);
INSERT INTO `item_mods` VALUES (14843, 1, 8);
INSERT INTO `item_mods` VALUES (14843, 10, -2);
INSERT INTO `item_mods` VALUES (14843, 23, 12);
INSERT INTO `item_mods` VALUES (14844, 1, 11);
INSERT INTO `item_mods` VALUES (14844, 10, 4);
INSERT INTO `item_mods` VALUES (14844, 11, 1);
INSERT INTO `item_mods` VALUES (14844, 13, -3);
INSERT INTO `item_mods` VALUES (14845, 1, 10);
INSERT INTO `item_mods` VALUES (14845, 2, 8);
INSERT INTO `item_mods` VALUES (14845, 11, -1);
INSERT INTO `item_mods` VALUES (14845, 12, 3);
INSERT INTO `item_mods` VALUES (14846, 1, 19);
INSERT INTO `item_mods` VALUES (14846, 5, 12);
INSERT INTO `item_mods` VALUES (14846, 14, 5);
INSERT INTO `item_mods` VALUES (14847, 1, 20);
INSERT INTO `item_mods` VALUES (14847, 5, 14);
INSERT INTO `item_mods` VALUES (14847, 14, 6);
INSERT INTO `item_mods` VALUES (14848, 1, 15);
INSERT INTO `item_mods` VALUES (14848, 23, 4);
INSERT INTO `item_mods` VALUES (14848, 27, 1);
INSERT INTO `item_mods` VALUES (14848, 110, 4);
INSERT INTO `item_mods` VALUES (14849, 1, 16);
INSERT INTO `item_mods` VALUES (14849, 23, 5);
INSERT INTO `item_mods` VALUES (14849, 27, 2);
INSERT INTO `item_mods` VALUES (14849, 110, 5);
INSERT INTO `item_mods` VALUES (14850, 1, 13);
INSERT INTO `item_mods` VALUES (14850, 5, 13);
INSERT INTO `item_mods` VALUES (14850, 25, 4);
INSERT INTO `item_mods` VALUES (14850, 27, -1);
INSERT INTO `item_mods` VALUES (14851, 1, 14);
INSERT INTO `item_mods` VALUES (14851, 5, 14);
INSERT INTO `item_mods` VALUES (14851, 25, 5);
INSERT INTO `item_mods` VALUES (14851, 27, -2);

-- ------------------------------------------
-- Igqira Manillas
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (14852, 1, 11);
INSERT INTO `item_mods` VALUES (14852, 28, 2);
INSERT INTO `item_mods` VALUES (14852, 115, 5);
INSERT INTO `item_mods` VALUES (14852, 499, 4); -- curse spikes
INSERT INTO `item_mods` VALUES (14852, 500, 0); -- spikes dmg
INSERT INTO `item_mods` VALUES (14852, 501, 20); -- spikes proc rate

-- ------------------------------------------
-- Genie Manillas
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (14853, 1, 12);
INSERT INTO `item_mods` VALUES (14853, 28, 3);
INSERT INTO `item_mods` VALUES (14853, 115, 6);
INSERT INTO `item_mods` VALUES (14853, 499, 4); -- curse spikes
INSERT INTO `item_mods` VALUES (14853, 500, 0); -- spikes dmg
INSERT INTO `item_mods` VALUES (14853, 501, 25); -- spikes proc rate

INSERT INTO `item_mods` VALUES (14854, 1, 5);
INSERT INTO `item_mods` VALUES (14854, 26, 1);
INSERT INTO `item_mods` VALUES (14854, 61, 1);
INSERT INTO `item_mods` VALUES (14855, 1, 9);
INSERT INTO `item_mods` VALUES (14856, 1, 5);
INSERT INTO `item_mods` VALUES (14856, 12, 1);
INSERT INTO `item_mods` VALUES (14856, 13, 1);
INSERT INTO `item_mods` VALUES (14857, 1, 9);
INSERT INTO `item_mods` VALUES (14858, 1, 7);
INSERT INTO `item_mods` VALUES (14858, 235, 2);
INSERT INTO `item_mods` VALUES (14859, 1, 6);
INSERT INTO `item_mods` VALUES (14859, 12, 2);
INSERT INTO `item_mods` VALUES (14859, 13, 2);
INSERT INTO `item_mods` VALUES (14860, 1, 9);
INSERT INTO `item_mods` VALUES (14860, 10, 1);
INSERT INTO `item_mods` VALUES (14861, 1, 10);
INSERT INTO `item_mods` VALUES (14862, 1, 8);
INSERT INTO `item_mods` VALUES (14862, 68, 1);
INSERT INTO `item_mods` VALUES (14862, 235, 2);
INSERT INTO `item_mods` VALUES (14863, 1, 10);
INSERT INTO `item_mods` VALUES (14863, 10, 2);
INSERT INTO `item_mods` VALUES (14864, 1, 9);
INSERT INTO `item_mods` VALUES (14865, 1, 6);
INSERT INTO `item_mods` VALUES (14865, 26, 2);
INSERT INTO `item_mods` VALUES (14865, 61, 2);
INSERT INTO `item_mods` VALUES (14866, 1, 9);
INSERT INTO `item_mods` VALUES (14866, 27, -5);
INSERT INTO `item_mods` VALUES (14867, 1, 16);
INSERT INTO `item_mods` VALUES (14867, 2, 20);
INSERT INTO `item_mods` VALUES (14867, 5, 20);
INSERT INTO `item_mods` VALUES (14869, 1, 23);
INSERT INTO `item_mods` VALUES (14869, 25, 10);
INSERT INTO `item_mods` VALUES (14870, 1, 14);
INSERT INTO `item_mods` VALUES (14870, 9, 4);
INSERT INTO `item_mods` VALUES (14870, 14, 4);
INSERT INTO `item_mods` VALUES (14871, 1, 22);
INSERT INTO `item_mods` VALUES (14871, 2, 20);
INSERT INTO `item_mods` VALUES (14871, 5, 20);
INSERT INTO `item_mods` VALUES (14871, 14, 5);
INSERT INTO `item_mods` VALUES (14871, 27, -2);
INSERT INTO `item_mods` VALUES (14872, 1, 24);
INSERT INTO `item_mods` VALUES (14872, 10, 4);
INSERT INTO `item_mods` VALUES (14873, 1, 21);
INSERT INTO `item_mods` VALUES (14873, 3, 3);
INSERT INTO `item_mods` VALUES (14873, 23, 22);
INSERT INTO `item_mods` VALUES (14873, 54, -5);
INSERT INTO `item_mods` VALUES (14873, 55, 5);
INSERT INTO `item_mods` VALUES (14873, 56, -5);
INSERT INTO `item_mods` VALUES (14873, 57, 5);
INSERT INTO `item_mods` VALUES (14873, 58, -5);
INSERT INTO `item_mods` VALUES (14873, 59, 5);
INSERT INTO `item_mods` VALUES (14873, 60, -5);
INSERT INTO `item_mods` VALUES (14873, 61, 5);
INSERT INTO `item_mods` VALUES (14873, 68, -10);
INSERT INTO `item_mods` VALUES (14874, 1, 7);
INSERT INTO `item_mods` VALUES (14874, 23, 15);
INSERT INTO `item_mods` VALUES (14875, 1, 18);
INSERT INTO `item_mods` VALUES (14875, 5, 15);
INSERT INTO `item_mods` VALUES (14875, 13, 7);
INSERT INTO `item_mods` VALUES (14875, 27, -3);
INSERT INTO `item_mods` VALUES (14875, 384, 51);
INSERT INTO `item_mods` VALUES (14876, 1, 19);
INSERT INTO `item_mods` VALUES (14876, 8, 4);
INSERT INTO `item_mods` VALUES (14876, 73, 8);
INSERT INTO `item_mods` VALUES (14877, 1, 19);
INSERT INTO `item_mods` VALUES (14877, 5, 18);
INSERT INTO `item_mods` VALUES (14877, 13, 8);
INSERT INTO `item_mods` VALUES (14877, 27, -4);
INSERT INTO `item_mods` VALUES (14877, 384, 61);
INSERT INTO `item_mods` VALUES (14878, 1, 20);
INSERT INTO `item_mods` VALUES (14878, 8, 5);
INSERT INTO `item_mods` VALUES (14878, 73, 9);
INSERT INTO `item_mods` VALUES (14879, 1, 18);
INSERT INTO `item_mods` VALUES (14879, 4, 20);
INSERT INTO `item_mods` VALUES (14879, 10, 2);
INSERT INTO `item_mods` VALUES (14879, 27, 2);
INSERT INTO `item_mods` VALUES (14879, 60, 2);
INSERT INTO `item_mods` VALUES (14879, 61, 2);
INSERT INTO `item_mods` VALUES (14880, 1, 16);
INSERT INTO `item_mods` VALUES (14880, 13, 4);
INSERT INTO `item_mods` VALUES (14880, 25, 3);
INSERT INTO `item_mods` VALUES (14880, 26, 2);
INSERT INTO `item_mods` VALUES (14880, 27, -2);
INSERT INTO `item_mods` VALUES (14881, 1, 17);
INSERT INTO `item_mods` VALUES (14881, 13, 5);
INSERT INTO `item_mods` VALUES (14881, 25, 4);
INSERT INTO `item_mods` VALUES (14881, 26, 3);
INSERT INTO `item_mods` VALUES (14881, 27, -3);
INSERT INTO `item_mods` VALUES (14882, 1, 17);
INSERT INTO `item_mods` VALUES (14882, 27, 3);
INSERT INTO `item_mods` VALUES (14882, 110, 8);
INSERT INTO `item_mods` VALUES (14882, 168, 4);
INSERT INTO `item_mods` VALUES (14883, 1, 19);
INSERT INTO `item_mods` VALUES (14883, 2, 20);
INSERT INTO `item_mods` VALUES (14883, 10, 3);
INSERT INTO `item_mods` VALUES (14883, 27, 3);
INSERT INTO `item_mods` VALUES (14883, 60, 3);
INSERT INTO `item_mods` VALUES (14883, 61, 3);
INSERT INTO `item_mods` VALUES (14884, 1, 6);
INSERT INTO `item_mods` VALUES (14884, 12, 1);
INSERT INTO `item_mods` VALUES (14884, 13, 2);
INSERT INTO `item_mods` VALUES (14884, 27, -2);
INSERT INTO `item_mods` VALUES (14885, 1, 9);
INSERT INTO `item_mods` VALUES (14886, 1, 15);
INSERT INTO `item_mods` VALUES (14886, 27, -3);
INSERT INTO `item_mods` VALUES (14886, 161, -3);
INSERT INTO `item_mods` VALUES (14886, 384, -30);
INSERT INTO `item_mods` VALUES (14888, 374, 4);
INSERT INTO `item_mods` VALUES (14889, 1, 12);
INSERT INTO `item_mods` VALUES (14889, 10, -4);
INSERT INTO `item_mods` VALUES (14889, 23, 12);
INSERT INTO `item_mods` VALUES (14889, 289, -1);
INSERT INTO `item_mods` VALUES (14889, 291, 1);
INSERT INTO `item_mods` VALUES (14890, 1, 22);
INSERT INTO `item_mods` VALUES (14890, 2, 13);
INSERT INTO `item_mods` VALUES (14890, 8, 6);
INSERT INTO `item_mods` VALUES (14890, 27, 3);
INSERT INTO `item_mods` VALUES (14890, 109, 15);
INSERT INTO `item_mods` VALUES (14891, 1, 15);
INSERT INTO `item_mods` VALUES (14891, 2, 14);
INSERT INTO `item_mods` VALUES (14891, 8, 6);
INSERT INTO `item_mods` VALUES (14891, 289, 4);
INSERT INTO `item_mods` VALUES (14892, 1, 14);
INSERT INTO `item_mods` VALUES (14892, 5, 15);
INSERT INTO `item_mods` VALUES (14892, 8, 7);
INSERT INTO `item_mods` VALUES (14892, 13, 7);
INSERT INTO `item_mods` VALUES (14892, 27, -4);
INSERT INTO `item_mods` VALUES (14892, 112, 15);
INSERT INTO `item_mods` VALUES (14893, 1, 13);
INSERT INTO `item_mods` VALUES (14893, 5, 17);
INSERT INTO `item_mods` VALUES (14893, 12, 3);
INSERT INTO `item_mods` VALUES (14893, 14, 3);
INSERT INTO `item_mods` VALUES (14893, 27, -2);
INSERT INTO `item_mods` VALUES (14893, 115, 15);
INSERT INTO `item_mods` VALUES (14894, 1, 17);
INSERT INTO `item_mods` VALUES (14894, 5, 17);
INSERT INTO `item_mods` VALUES (14894, 9, 6);
INSERT INTO `item_mods` VALUES (14894, 12, 2);
INSERT INTO `item_mods` VALUES (14894, 13, 2);
INSERT INTO `item_mods` VALUES (14894, 110, 15);
INSERT INTO `item_mods` VALUES (14895, 1, 16);
INSERT INTO `item_mods` VALUES (14895, 2, 10);
INSERT INTO `item_mods` VALUES (14895, 9, 3);
INSERT INTO `item_mods` VALUES (14895, 298, 1);
INSERT INTO `item_mods` VALUES (14896, 1, 22);
INSERT INTO `item_mods` VALUES (14896, 2, 11);
INSERT INTO `item_mods` VALUES (14896, 9, 6);
INSERT INTO `item_mods` VALUES (14896, 10, 3);
INSERT INTO `item_mods` VALUES (14896, 27, 2);
INSERT INTO `item_mods` VALUES (14897, 1, 20);
INSERT INTO `item_mods` VALUES (14897, 2, 11);
INSERT INTO `item_mods` VALUES (14897, 5, 11);
INSERT INTO `item_mods` VALUES (14897, 8, 6);
INSERT INTO `item_mods` VALUES (14897, 9, 6);
INSERT INTO `item_mods` VALUES (14897, 25, 3);
INSERT INTO `item_mods` VALUES (14898, 1, 15);
INSERT INTO `item_mods` VALUES (14898, 2, 11);
INSERT INTO `item_mods` VALUES (14898, 9, 5);
INSERT INTO `item_mods` VALUES (14898, 14, 5);
INSERT INTO `item_mods` VALUES (14898, 110, 10);
INSERT INTO `item_mods` VALUES (14898, 360, 3);
INSERT INTO `item_mods` VALUES (14899, 1, 18);
INSERT INTO `item_mods` VALUES (14899, 2, 14);
INSERT INTO `item_mods` VALUES (14899, 10, 7);
INSERT INTO `item_mods` VALUES (14899, 14, 7);
INSERT INTO `item_mods` VALUES (14899, 27, -1);
INSERT INTO `item_mods` VALUES (14899, 119, 10);
INSERT INTO `item_mods` VALUES (14900, 1, 14);
INSERT INTO `item_mods` VALUES (14900, 2, 10);
INSERT INTO `item_mods` VALUES (14900, 9, 6);
INSERT INTO `item_mods` VALUES (14900, 11, 6);
INSERT INTO `item_mods` VALUES (14900, 425, 10);
INSERT INTO `item_mods` VALUES (14901, 1, 21);
INSERT INTO `item_mods` VALUES (14901, 2, 15);
INSERT INTO `item_mods` VALUES (14901, 8, 7);
INSERT INTO `item_mods` VALUES (14901, 9, 7);
INSERT INTO `item_mods` VALUES (14901, 27, 2);
INSERT INTO `item_mods` VALUES (14902, 1, 18);
INSERT INTO `item_mods` VALUES (14902, 2, 13);
INSERT INTO `item_mods` VALUES (14902, 8, 6);
INSERT INTO `item_mods` VALUES (14902, 9, 6);
INSERT INTO `item_mods` VALUES (14902, 24, 20);
INSERT INTO `item_mods` VALUES (14902, 26, 20);
INSERT INTO `item_mods` VALUES (14902, 106, 5);
INSERT INTO `item_mods` VALUES (14903, 1, 19);
INSERT INTO `item_mods` VALUES (14903, 2, 11);
INSERT INTO `item_mods` VALUES (14903, 8, 5);
INSERT INTO `item_mods` VALUES (14903, 9, 5);
INSERT INTO `item_mods` VALUES (14903, 110, 12);
INSERT INTO `item_mods` VALUES (14904, 1, 11);
INSERT INTO `item_mods` VALUES (14904, 5, 19);
INSERT INTO `item_mods` VALUES (14904, 357, 1);
INSERT INTO `item_mods` VALUES (14905, 1, 20);
INSERT INTO `item_mods` VALUES (14905, 2, 20);
INSERT INTO `item_mods` VALUES (14905, 5, 20);
INSERT INTO `item_mods` VALUES (14905, 25, 4);
INSERT INTO `item_mods` VALUES (14905, 27, 3);
INSERT INTO `item_mods` VALUES (14905, 384, 30);
INSERT INTO `item_mods` VALUES (14906, 1, 18);
INSERT INTO `item_mods` VALUES (14906, 27, -4);
INSERT INTO `item_mods` VALUES (14906, 30, 3);
INSERT INTO `item_mods` VALUES (14906, 346, 1);
INSERT INTO `item_mods` VALUES (14906, 384, 11);
INSERT INTO `item_mods` VALUES (14907, 1, 10);
INSERT INTO `item_mods` VALUES (14907, 27, -4);
INSERT INTO `item_mods` VALUES (14907, 68, 5);
INSERT INTO `item_mods` VALUES (14908, 1, 11);
INSERT INTO `item_mods` VALUES (14908, 27, -5);
INSERT INTO `item_mods` VALUES (14908, 68, 6);
INSERT INTO `item_mods` VALUES (14909, 1, 23);
INSERT INTO `item_mods` VALUES (14909, 2, 20);
INSERT INTO `item_mods` VALUES (14909, 10, 6);
INSERT INTO `item_mods` VALUES (14909, 23, 14);
INSERT INTO `item_mods` VALUES (14909, 27, 2);
INSERT INTO `item_mods` VALUES (14910, 1, 16);
INSERT INTO `item_mods` VALUES (14910, 3, 3);
INSERT INTO `item_mods` VALUES (14910, 23, 18);
INSERT INTO `item_mods` VALUES (14910, 289, 5);
INSERT INTO `item_mods` VALUES (14911, 1, 17);
INSERT INTO `item_mods` VALUES (14911, 2, 20);
INSERT INTO `item_mods` VALUES (14911, 5, 20);
INSERT INTO `item_mods` VALUES (14911, 27, -4);
INSERT INTO `item_mods` VALUES (14911, 114, 15);
INSERT INTO `item_mods` VALUES (14912, 1, 16);
INSERT INTO `item_mods` VALUES (14912, 5, 24);
INSERT INTO `item_mods` VALUES (14912, 27, -3);
INSERT INTO `item_mods` VALUES (14912, 116, 12);
INSERT INTO `item_mods` VALUES (14912, 487, 5);
INSERT INTO `item_mods` VALUES (14913, 1, 18);
INSERT INTO `item_mods` VALUES (14913, 5, 23);
INSERT INTO `item_mods` VALUES (14913, 12, 5);
INSERT INTO `item_mods` VALUES (14913, 29, 2);
INSERT INTO `item_mods` VALUES (14913, 113, 15);
INSERT INTO `item_mods` VALUES (14914, 1, 17);
INSERT INTO `item_mods` VALUES (14914, 2, 26);
INSERT INTO `item_mods` VALUES (14914, 14, 5);
INSERT INTO `item_mods` VALUES (14914, 27, 4);
INSERT INTO `item_mods` VALUES (14914, 303, 1);
INSERT INTO `item_mods` VALUES (14915, 1, 23);
INSERT INTO `item_mods` VALUES (14915, 2, 16);
INSERT INTO `item_mods` VALUES (14915, 10, 6);
INSERT INTO `item_mods` VALUES (14915, 27, 4);
INSERT INTO `item_mods` VALUES (14915, 385, 10);
INSERT INTO `item_mods` VALUES (14916, 1, 21);
INSERT INTO `item_mods` VALUES (14916, 5, 20);
INSERT INTO `item_mods` VALUES (14916, 9, 5);
INSERT INTO `item_mods` VALUES (14916, 12, 9);
INSERT INTO `item_mods` VALUES (14916, 116, 7);
INSERT INTO `item_mods` VALUES (14917, 1, 16);
INSERT INTO `item_mods` VALUES (14917, 2, 20);
INSERT INTO `item_mods` VALUES (14917, 11, 5);
INSERT INTO `item_mods` VALUES (14917, 360, 4);
INSERT INTO `item_mods` VALUES (14918, 1, 19);
INSERT INTO `item_mods` VALUES (14918, 2, 16);
INSERT INTO `item_mods` VALUES (14918, 27, -4);
INSERT INTO `item_mods` VALUES (14918, 68, 5);
INSERT INTO `item_mods` VALUES (14918, 121, 5);
INSERT INTO `item_mods` VALUES (14919, 1, 15);
INSERT INTO `item_mods` VALUES (14919, 2, 13);
INSERT INTO `item_mods` VALUES (14919, 11, 6);
INSERT INTO `item_mods` VALUES (14919, 27, -2);
INSERT INTO `item_mods` VALUES (14919, 68, 9);
INSERT INTO `item_mods` VALUES (14920, 1, 22);
INSERT INTO `item_mods` VALUES (14920, 2, 20);
INSERT INTO `item_mods` VALUES (14920, 23, 12);
INSERT INTO `item_mods` VALUES (14920, 27, 1);
INSERT INTO `item_mods` VALUES (14921, 1, 19);
INSERT INTO `item_mods` VALUES (14921, 308, 33);
INSERT INTO `item_mods` VALUES (14922, 1, 20);
INSERT INTO `item_mods` VALUES (14922, 2, 16);
INSERT INTO `item_mods` VALUES (14922, 5, 16);
INSERT INTO `item_mods` VALUES (14922, 11, 4);
INSERT INTO `item_mods` VALUES (14922, 25, 7);
INSERT INTO `item_mods` VALUES (14923, 1, 16);
INSERT INTO `item_mods` VALUES (14923, 5, 30);
INSERT INTO `item_mods` VALUES (14923, 117, 12);
INSERT INTO `item_mods` VALUES (14923, 357, 2);
INSERT INTO `item_mods` VALUES (14924, 1, 16);
INSERT INTO `item_mods` VALUES (14924, 25, 6);
INSERT INTO `item_mods` VALUES (14924, 27, -5);
INSERT INTO `item_mods` VALUES (14924, 68, 6);
INSERT INTO `item_mods` VALUES (14924, 71, 1);
INSERT INTO `item_mods` VALUES (14925, 1, 16);
INSERT INTO `item_mods` VALUES (14926, 1, 17);
INSERT INTO `item_mods` VALUES (14926, 2, -18);
INSERT INTO `item_mods` VALUES (14926, 5, 18);
INSERT INTO `item_mods` VALUES (14926, 25, 4);
INSERT INTO `item_mods` VALUES (14926, 27, 6);
INSERT INTO `item_mods` VALUES (14927, 1, 20);
INSERT INTO `item_mods` VALUES (14928, 1, 16);
INSERT INTO `item_mods` VALUES (14928, 5, 15);
INSERT INTO `item_mods` VALUES (14928, 110, 10);
INSERT INTO `item_mods` VALUES (14929, 1, 11);
INSERT INTO `item_mods` VALUES (14929, 2, 10);
INSERT INTO `item_mods` VALUES (14929, 9, 2);
INSERT INTO `item_mods` VALUES (14929, 13, 2);
INSERT INTO `item_mods` VALUES (14929, 110, 5);
INSERT INTO `item_mods` VALUES (14930, 1, 12);
INSERT INTO `item_mods` VALUES (14930, 2, 13);
INSERT INTO `item_mods` VALUES (14930, 11, 3);
INSERT INTO `item_mods` VALUES (14931, 1, 14);
INSERT INTO `item_mods` VALUES (14932, 1, 13);
INSERT INTO `item_mods` VALUES (14932, 8, 4);
INSERT INTO `item_mods` VALUES (14932, 11, 3);
INSERT INTO `item_mods` VALUES (14933, 1, 21);
INSERT INTO `item_mods` VALUES (14933, 23, 5);
INSERT INTO `item_mods` VALUES (14933, 110, 5);
INSERT INTO `item_mods` VALUES (14934, 1, 14);
INSERT INTO `item_mods` VALUES (14934, 2, -9);
INSERT INTO `item_mods` VALUES (14934, 24, 2);
INSERT INTO `item_mods` VALUES (14934, 25, 3);
INSERT INTO `item_mods` VALUES (14934, 68, 2);
INSERT INTO `item_mods` VALUES (14935, 1, 17);
INSERT INTO `item_mods` VALUES (14935, 12, 5);
INSERT INTO `item_mods` VALUES (14935, 13, 5);
INSERT INTO `item_mods` VALUES (14935, 28, 2);
INSERT INTO `item_mods` VALUES (14935, 68, 4);
INSERT INTO `item_mods` VALUES (14936, 1, 16);
INSERT INTO `item_mods` VALUES (14936, 27, 3);
INSERT INTO `item_mods` VALUES (14936, 68, 6);
INSERT INTO `item_mods` VALUES (14937, 1, 11);
INSERT INTO `item_mods` VALUES (14937, 5, 22);
INSERT INTO `item_mods` VALUES (14938, 1, 14);
INSERT INTO `item_mods` VALUES (14938, 8, 5);
INSERT INTO `item_mods` VALUES (14938, 11, 4);
INSERT INTO `item_mods` VALUES (14939, 1, 15);
INSERT INTO `item_mods` VALUES (14939, 2, -9);
INSERT INTO `item_mods` VALUES (14939, 24, 3);
INSERT INTO `item_mods` VALUES (14939, 25, 4);
INSERT INTO `item_mods` VALUES (14939, 68, 3);
INSERT INTO `item_mods` VALUES (14940, 1, 19);
INSERT INTO `item_mods` VALUES (14940, 24, 5);
INSERT INTO `item_mods` VALUES (14940, 25, 5);
INSERT INTO `item_mods` VALUES (14940, 26, 5);
INSERT INTO `item_mods` VALUES (14941, 1, 12);
INSERT INTO `item_mods` VALUES (14941, 2, 15);
INSERT INTO `item_mods` VALUES (14941, 26, 2);
INSERT INTO `item_mods` VALUES (14941, 59, 5);
INSERT INTO `item_mods` VALUES (14942, 1, 13);
INSERT INTO `item_mods` VALUES (14942, 2, 17);
INSERT INTO `item_mods` VALUES (14942, 26, 3);
INSERT INTO `item_mods` VALUES (14942, 59, 6);
INSERT INTO `item_mods` VALUES (14943, 1, 22);
INSERT INTO `item_mods` VALUES (14943, 24, 7);
INSERT INTO `item_mods` VALUES (14943, 26, 7);
INSERT INTO `item_mods` VALUES (14944, 1, 12);
INSERT INTO `item_mods` VALUES (14944, 26, 6);
INSERT INTO `item_mods` VALUES (14944, 384, -50);
INSERT INTO `item_mods` VALUES (14945, 1, 16);
INSERT INTO `item_mods` VALUES (14945, 2, 18);
INSERT INTO `item_mods` VALUES (14945, 23, 6);
INSERT INTO `item_mods` VALUES (14945, 68, 4);
INSERT INTO `item_mods` VALUES (14946, 1, 13);
INSERT INTO `item_mods` VALUES (14947, 1, 18);
INSERT INTO `item_mods` VALUES (14947, 25, 6);
INSERT INTO `item_mods` VALUES (14947, 54, 6);
INSERT INTO `item_mods` VALUES (14947, 68, 6);
INSERT INTO `item_mods` VALUES (14948, 1, 16);
INSERT INTO `item_mods` VALUES (14948, 71, 1);
INSERT INTO `item_mods` VALUES (14948, 115, 8);
INSERT INTO `item_mods` VALUES (14949, 1, 20);
INSERT INTO `item_mods` VALUES (14949, 10, 3);
INSERT INTO `item_mods` VALUES (14949, 23, 3);
INSERT INTO `item_mods` VALUES (14949, 25, 5);
INSERT INTO `item_mods` VALUES (14949, 68, 5);
INSERT INTO `item_mods` VALUES (14949, 163, -5);
INSERT INTO `item_mods` VALUES (14950, 1, 21);
INSERT INTO `item_mods` VALUES (14950, 10, 4);
INSERT INTO `item_mods` VALUES (14950, 23, 4);
INSERT INTO `item_mods` VALUES (14950, 25, 6);
INSERT INTO `item_mods` VALUES (14950, 68, 6);
INSERT INTO `item_mods` VALUES (14950, 163, -7);
INSERT INTO `item_mods` VALUES (14951, 1, 18);
INSERT INTO `item_mods` VALUES (14951, 2, 28);
INSERT INTO `item_mods` VALUES (14951, 5, 28);
INSERT INTO `item_mods` VALUES (14951, 8, 2);
INSERT INTO `item_mods` VALUES (14951, 13, 2);

-- ------------------------------------------
-- Ice Gauntlets
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (14952, 1, 16);
INSERT INTO `item_mods` VALUES (14952, 8, 4);
INSERT INTO `item_mods` VALUES (14952, 10, 4);
INSERT INTO `item_mods` VALUES (14952, 25, 4);
INSERT INTO `item_mods` VALUES (14952, 71, 1);
INSERT INTO `item_mods` VALUES (14952, 499, 2); -- ice spikes
INSERT INTO `item_mods` VALUES (14952, 500, 15); -- spikes dmg
INSERT INTO `item_mods` VALUES (14952, 501, 15); -- spikes proc rate

INSERT INTO `item_mods` VALUES (14953, 1, 16);
INSERT INTO `item_mods` VALUES (14954, 1, 14);
INSERT INTO `item_mods` VALUES (14955, 1, 11);
INSERT INTO `item_mods` VALUES (14955, 2, 12);
INSERT INTO `item_mods` VALUES (14955, 5, 12);
INSERT INTO `item_mods` VALUES (14956, 1, 12);
INSERT INTO `item_mods` VALUES (14956, 2, 13);
INSERT INTO `item_mods` VALUES (14956, 5, 13);
INSERT INTO `item_mods` VALUES (14956, 13, 3);
INSERT INTO `item_mods` VALUES (14956, 59, 7);
INSERT INTO `item_mods` VALUES (14957, 1, 7);
INSERT INTO `item_mods` VALUES (14958, 1, 22);
INSERT INTO `item_mods` VALUES (14959, 1, 24);
INSERT INTO `item_mods` VALUES (14959, 26, 8);
INSERT INTO `item_mods` VALUES (14960, 1, 20);
INSERT INTO `item_mods` VALUES (14961, 1, 20);
INSERT INTO `item_mods` VALUES (14961, 3, 1);
INSERT INTO `item_mods` VALUES (14961, 6, 1);
INSERT INTO `item_mods` VALUES (14961, 8, 4);
INSERT INTO `item_mods` VALUES (14961, 10, 4);
INSERT INTO `item_mods` VALUES (14961, 25, 10);
INSERT INTO `item_mods` VALUES (14962, 1, 4);
INSERT INTO `item_mods` VALUES (14962, 8, 1);
INSERT INTO `item_mods` VALUES (14963, 1, 7);
INSERT INTO `item_mods` VALUES (14963, 8, 1);
INSERT INTO `item_mods` VALUES (14963, 10, 1);
INSERT INTO `item_mods` VALUES (14964, 1, 9);
INSERT INTO `item_mods` VALUES (14964, 8, 1);
INSERT INTO `item_mods` VALUES (14964, 10, 1);
INSERT INTO `item_mods` VALUES (14964, 25, 1);
INSERT INTO `item_mods` VALUES (14965, 1, 17);
INSERT INTO `item_mods` VALUES (14965, 8, 5);
INSERT INTO `item_mods` VALUES (14965, 11, 5);
INSERT INTO `item_mods` VALUES (14965, 23, 10);
INSERT INTO `item_mods` VALUES (14965, 24, 10);
INSERT INTO `item_mods` VALUES (14966, 1, 4);
INSERT INTO `item_mods` VALUES (14966, 24, 1);
INSERT INTO `item_mods` VALUES (14967, 1, 7);
INSERT INTO `item_mods` VALUES (14967, 23, 1);
INSERT INTO `item_mods` VALUES (14967, 24, 1);
INSERT INTO `item_mods` VALUES (14968, 1, 8);
INSERT INTO `item_mods` VALUES (14968, 11, 1);
INSERT INTO `item_mods` VALUES (14968, 23, 1);
INSERT INTO `item_mods` VALUES (14968, 24, 1);
INSERT INTO `item_mods` VALUES (14969, 1, 20);
INSERT INTO `item_mods` VALUES (14969, 25, 10);
INSERT INTO `item_mods` VALUES (14969, 68, 10);
INSERT INTO `item_mods` VALUES (14969, 289, 5);
INSERT INTO `item_mods` VALUES (14969, 291, 2);
INSERT INTO `item_mods` VALUES (14970, 1, 4);
INSERT INTO `item_mods` VALUES (14970, 25, 1);
INSERT INTO `item_mods` VALUES (14971, 1, 7);
INSERT INTO `item_mods` VALUES (14971, 25, 1);
INSERT INTO `item_mods` VALUES (14971, 68, 1);
INSERT INTO `item_mods` VALUES (14972, 1, 8);
INSERT INTO `item_mods` VALUES (14972, 25, 1);
INSERT INTO `item_mods` VALUES (14972, 68, 1);
INSERT INTO `item_mods` VALUES (14972, 289, 1);
INSERT INTO `item_mods` VALUES (14973, 1, 20);
INSERT INTO `item_mods` VALUES (14973, 6, 2);
INSERT INTO `item_mods` VALUES (14973, 13, 6);
INSERT INTO `item_mods` VALUES (14973, 14, 6);
INSERT INTO `item_mods` VALUES (14973, 27, -4);
INSERT INTO `item_mods` VALUES (14973, 370, 1);
INSERT INTO `item_mods` VALUES (14974, 1, 3);
INSERT INTO `item_mods` VALUES (14974, 13, 1);
INSERT INTO `item_mods` VALUES (14975, 1, 6);
INSERT INTO `item_mods` VALUES (14975, 13, 1);
INSERT INTO `item_mods` VALUES (14975, 14, 1);
INSERT INTO `item_mods` VALUES (14976, 1, 7);
INSERT INTO `item_mods` VALUES (14976, 13, 1);
INSERT INTO `item_mods` VALUES (14976, 14, 1);
INSERT INTO `item_mods` VALUES (14976, 27, -1);
INSERT INTO `item_mods` VALUES (14977, 1, 21);
INSERT INTO `item_mods` VALUES (14977, 5, 25);
INSERT INTO `item_mods` VALUES (14977, 23, 5);
INSERT INTO `item_mods` VALUES (14977, 25, 5);
INSERT INTO `item_mods` VALUES (14977, 28, 5);
INSERT INTO `item_mods` VALUES (14977, 30, 5);
INSERT INTO `item_mods` VALUES (14978, 1, 3);
INSERT INTO `item_mods` VALUES (14978, 5, 1);
INSERT INTO `item_mods` VALUES (14979, 1, 6);
INSERT INTO `item_mods` VALUES (14979, 5, 1);
INSERT INTO `item_mods` VALUES (14979, 25, 1);
INSERT INTO `item_mods` VALUES (14980, 1, 7);
INSERT INTO `item_mods` VALUES (14980, 5, 1);
INSERT INTO `item_mods` VALUES (14980, 23, 1);
INSERT INTO `item_mods` VALUES (14980, 25, 1);
INSERT INTO `item_mods` VALUES (14981, 1, 14);
INSERT INTO `item_mods` VALUES (14981, 2, 13);
INSERT INTO `item_mods` VALUES (14981, 5, 13);
INSERT INTO `item_mods` VALUES (14981, 25, 4);
INSERT INTO `item_mods` VALUES (14981, 27, -1);
INSERT INTO `item_mods` VALUES (14981, 68, 4);
INSERT INTO `item_mods` VALUES (14982, 1, 15);
INSERT INTO `item_mods` VALUES (14982, 2, 14);
INSERT INTO `item_mods` VALUES (14982, 5, 14);
INSERT INTO `item_mods` VALUES (14982, 25, 5);
INSERT INTO `item_mods` VALUES (14982, 27, -2);
INSERT INTO `item_mods` VALUES (14982, 68, 5);
INSERT INTO `item_mods` VALUES (14983, 1, 23);
INSERT INTO `item_mods` VALUES (14983, 9, 5);
INSERT INTO `item_mods` VALUES (14983, 27, 4);
INSERT INTO `item_mods` VALUES (14983, 68, 8);
INSERT INTO `item_mods` VALUES (14983, 384, 20);
INSERT INTO `item_mods` VALUES (14984, 1, 17);
INSERT INTO `item_mods` VALUES (14984, 8, 4);
INSERT INTO `item_mods` VALUES (14984, 13, 4);
INSERT INTO `item_mods` VALUES (14984, 23, 6);
INSERT INTO `item_mods` VALUES (14984, 68, 6);
INSERT INTO `item_mods` VALUES (14984, 160, -2);
INSERT INTO `item_mods` VALUES (14985, 1, 18);
INSERT INTO `item_mods` VALUES (14985, 23, 4);
INSERT INTO `item_mods` VALUES (14985, 25, 4);
INSERT INTO `item_mods` VALUES (14985, 28, 4);
INSERT INTO `item_mods` VALUES (14985, 30, 4);
INSERT INTO `item_mods` VALUES (14986, 1, 8);
INSERT INTO `item_mods` VALUES (14986, 23, 20);
INSERT INTO `item_mods` VALUES (14986, 60, -8);
INSERT INTO `item_mods` VALUES (14986, 61, 8);
INSERT INTO `item_mods` VALUES (14986, 68, -5);
INSERT INTO `item_mods` VALUES (14987, 1, 10);
INSERT INTO `item_mods` VALUES (14988, 1, 10);
INSERT INTO `item_mods` VALUES (14989, 1, 12);
INSERT INTO `item_mods` VALUES (14990, 1, 12);
INSERT INTO `item_mods` VALUES (14990, 54, 2);
INSERT INTO `item_mods` VALUES (14990, 59, -1);
INSERT INTO `item_mods` VALUES (14991, 1, 10);
INSERT INTO `item_mods` VALUES (14992, 1, 10);
INSERT INTO `item_mods` VALUES (14993, 1, 13);
INSERT INTO `item_mods` VALUES (14993, 23, 1);
INSERT INTO `item_mods` VALUES (14993, 25, 1);
INSERT INTO `item_mods` VALUES (14994, 1, 14);
INSERT INTO `item_mods` VALUES (14994, 23, 3);
INSERT INTO `item_mods` VALUES (14994, 25, 3);
INSERT INTO `item_mods` VALUES (14994, 68, 3);
INSERT INTO `item_mods` VALUES (14995, 1, 23);
INSERT INTO `item_mods` VALUES (14995, 2, 18);
INSERT INTO `item_mods` VALUES (14995, 5, 18);
INSERT INTO `item_mods` VALUES (14995, 14, 4);
INSERT INTO `item_mods` VALUES (14995, 23, 5);
INSERT INTO `item_mods` VALUES (14995, 25, 3);
INSERT INTO `item_mods` VALUES (14996, 1, 24);
INSERT INTO `item_mods` VALUES (14996, 2, 20);
INSERT INTO `item_mods` VALUES (14996, 5, 20);
INSERT INTO `item_mods` VALUES (14996, 14, 5);
INSERT INTO `item_mods` VALUES (14996, 23, 6);
INSERT INTO `item_mods` VALUES (14996, 25, 4);
INSERT INTO `item_mods` VALUES (14997, 1, 14);
INSERT INTO `item_mods` VALUES (14997, 12, 5);
INSERT INTO `item_mods` VALUES (14997, 27, -1);
INSERT INTO `item_mods` VALUES (14997, 30, 3);
INSERT INTO `item_mods` VALUES (14997, 161, 2);
INSERT INTO `item_mods` VALUES (14998, 1, 15);
INSERT INTO `item_mods` VALUES (14998, 12, 6);
INSERT INTO `item_mods` VALUES (14998, 27, -2);
INSERT INTO `item_mods` VALUES (14998, 30, 4);
INSERT INTO `item_mods` VALUES (14998, 161, 3);
INSERT INTO `item_mods` VALUES (14999, 1, 19);
INSERT INTO `item_mods` VALUES (14999, 8, 3);
INSERT INTO `item_mods` VALUES (14999, 9, 3);
INSERT INTO `item_mods` VALUES (14999, 231, 2);
INSERT INTO `item_mods` VALUES (15000, 1, 24);
INSERT INTO `item_mods` VALUES (15000, 2, 28);
INSERT INTO `item_mods` VALUES (15000, 72, 2);
INSERT INTO `item_mods` VALUES (15000, 231, 2);
INSERT INTO `item_mods` VALUES (15001, 1, 18);
INSERT INTO `item_mods` VALUES (15001, 9, 2);
INSERT INTO `item_mods` VALUES (15001, 12, 2);
INSERT INTO `item_mods` VALUES (15001, 25, 4);
INSERT INTO `item_mods` VALUES (15001, 27, -4);
INSERT INTO `item_mods` VALUES (15002, 1, 15);
INSERT INTO `item_mods` VALUES (15002, 2, 12);
INSERT INTO `item_mods` VALUES (15002, 9, 2);
INSERT INTO `item_mods` VALUES (15002, 11, 2);
INSERT INTO `item_mods` VALUES (15002, 403, 10);
INSERT INTO `item_mods` VALUES (15003, 1, 15);
INSERT INTO `item_mods` VALUES (15003, 2, 12);
INSERT INTO `item_mods` VALUES (15003, 9, 2);
INSERT INTO `item_mods` VALUES (15003, 11, 2);
INSERT INTO `item_mods` VALUES (15003, 403, 10);
INSERT INTO `item_mods` VALUES (15004, 1, 13);
INSERT INTO `item_mods` VALUES (15004, 5, 15);
INSERT INTO `item_mods` VALUES (15004, 13, 3);
INSERT INTO `item_mods` VALUES (15004, 27, -2);
INSERT INTO `item_mods` VALUES (15004, 168, 20);
INSERT INTO `item_mods` VALUES (15005, 1, 9);
INSERT INTO `item_mods` VALUES (15005, 25, 3);
INSERT INTO `item_mods` VALUES (15006, 1, 13);
INSERT INTO `item_mods` VALUES (15006, 25, 5);
INSERT INTO `item_mods` VALUES (15007, 1, 11);
INSERT INTO `item_mods` VALUES (15007, 12, 1);
INSERT INTO `item_mods` VALUES (15007, 13, 1);
INSERT INTO `item_mods` VALUES (15007, 14, 1);
INSERT INTO `item_mods` VALUES (15007, 68, 5);
INSERT INTO `item_mods` VALUES (15009, 1, 22);
INSERT INTO `item_mods` VALUES (15009, 2, 20);
INSERT INTO `item_mods` VALUES (15009, 27, 4);
INSERT INTO `item_mods` VALUES (15009, 29, 2);
INSERT INTO `item_mods` VALUES (15010, 1, 14);
INSERT INTO `item_mods` VALUES (15010, 8, 3);
INSERT INTO `item_mods` VALUES (15010, 68, 4);
INSERT INTO `item_mods` VALUES (15010, 289, 2);
INSERT INTO `item_mods` VALUES (15011, 1, 13);
INSERT INTO `item_mods` VALUES (15011, 25, 4);
INSERT INTO `item_mods` VALUES (15011, 27, -3);
INSERT INTO `item_mods` VALUES (15012, 1, 12);
INSERT INTO `item_mods` VALUES (15012, 2, 18);
INSERT INTO `item_mods` VALUES (15012, 5, 18);
INSERT INTO `item_mods` VALUES (15012, 28, 2);
INSERT INTO `item_mods` VALUES (15012, 296, 3);
INSERT INTO `item_mods` VALUES (15013, 1, 18);
INSERT INTO `item_mods` VALUES (15013, 28, 5);
INSERT INTO `item_mods` VALUES (15014, 1, 16);
INSERT INTO `item_mods` VALUES (15014, 108, 6);
INSERT INTO `item_mods` VALUES (15014, 112, 6);
INSERT INTO `item_mods` VALUES (15014, 115, 6);
INSERT INTO `item_mods` VALUES (15015, 1, 26);
INSERT INTO `item_mods` VALUES (15015, 9, 10);
INSERT INTO `item_mods` VALUES (15015, 25, 5);
INSERT INTO `item_mods` VALUES (15015, 306, 1);
INSERT INTO `item_mods` VALUES (15016, 1, 23);
INSERT INTO `item_mods` VALUES (15016, 2, 30);
INSERT INTO `item_mods` VALUES (15016, 10, 3);
INSERT INTO `item_mods` VALUES (15017, 1, 16);
INSERT INTO `item_mods` VALUES (15017, 2, 20);
INSERT INTO `item_mods` VALUES (15017, 28, 3);
INSERT INTO `item_mods` VALUES (15017, 252, 2);
INSERT INTO `item_mods` VALUES (15018, 1, 29);
INSERT INTO `item_mods` VALUES (15018, 2, 25);
INSERT INTO `item_mods` VALUES (15018, 384, -40);
INSERT INTO `item_mods` VALUES (15021, 1, 23);
INSERT INTO `item_mods` VALUES (15021, 8, 2);
INSERT INTO `item_mods` VALUES (15021, 9, 2);
INSERT INTO `item_mods` VALUES (15021, 23, 12);
INSERT INTO `item_mods` VALUES (15021, 25, -5);
INSERT INTO `item_mods` VALUES (15021, 68, -10);
INSERT INTO `item_mods` VALUES (15022, 1, 18);
INSERT INTO `item_mods` VALUES (15022, 2, 15);
INSERT INTO `item_mods` VALUES (15022, 5, 25);
INSERT INTO `item_mods` VALUES (15022, 71, 2);
INSERT INTO `item_mods` VALUES (15022, 114, 5);
INSERT INTO `item_mods` VALUES (15023, 1, 24);
INSERT INTO `item_mods` VALUES (15023, 8, 4);
INSERT INTO `item_mods` VALUES (15023, 9, 4);
INSERT INTO `item_mods` VALUES (15023, 25, 5);
INSERT INTO `item_mods` VALUES (15023, 26, 5);
INSERT INTO `item_mods` VALUES (15023, 289, 2);
INSERT INTO `item_mods` VALUES (15024, 1, 17);
INSERT INTO `item_mods` VALUES (15024, 5, 20);
INSERT INTO `item_mods` VALUES (15024, 8, 3);
INSERT INTO `item_mods` VALUES (15024, 12, 3);
INSERT INTO `item_mods` VALUES (15024, 110, 10);
INSERT INTO `item_mods` VALUES (15025, 1, 17);
INSERT INTO `item_mods` VALUES (15025, 2, 12);
INSERT INTO `item_mods` VALUES (15025, 5, 12);
INSERT INTO `item_mods` VALUES (15025, 9, 5);
INSERT INTO `item_mods` VALUES (15025, 13, 5);
INSERT INTO `item_mods` VALUES (15025, 68, 5);
INSERT INTO `item_mods` VALUES (15026, 1, 18);
INSERT INTO `item_mods` VALUES (15026, 2, 12);
INSERT INTO `item_mods` VALUES (15026, 5, 12);
INSERT INTO `item_mods` VALUES (15026, 9, 6);
INSERT INTO `item_mods` VALUES (15026, 13, 6);
INSERT INTO `item_mods` VALUES (15026, 68, 5);
INSERT INTO `item_mods` VALUES (15027, 1, 12);
INSERT INTO `item_mods` VALUES (15027, 2, 15);
INSERT INTO `item_mods` VALUES (15027, 9, 5);
INSERT INTO `item_mods` VALUES (15027, 13, 5);
INSERT INTO `item_mods` VALUES (15027, 68, 3);
INSERT INTO `item_mods` VALUES (15027, 110, 5);
INSERT INTO `item_mods` VALUES (15028, 1, 14);
INSERT INTO `item_mods` VALUES (15028, 2, 12);
INSERT INTO `item_mods` VALUES (15028, 11, 2);
INSERT INTO `item_mods` VALUES (15028, 26, 5);
INSERT INTO `item_mods` VALUES (15029, 1, 15);
INSERT INTO `item_mods` VALUES (15029, 2, 15);
INSERT INTO `item_mods` VALUES (15029, 11, 3);
INSERT INTO `item_mods` VALUES (15029, 26, 5);
INSERT INTO `item_mods` VALUES (15030, 1, 13);
INSERT INTO `item_mods` VALUES (15030, 2, 18);
INSERT INTO `item_mods` VALUES (15030, 8, 5);
INSERT INTO `item_mods` VALUES (15030, 11, 5);
INSERT INTO `item_mods` VALUES (15031, 1, 18);
INSERT INTO `item_mods` VALUES (15031, 2, 16);
INSERT INTO `item_mods` VALUES (15031, 9, 2);
INSERT INTO `item_mods` VALUES (15031, 14, 2);
INSERT INTO `item_mods` VALUES (15031, 384, 30);
INSERT INTO `item_mods` VALUES (15032, 1, 19);
INSERT INTO `item_mods` VALUES (15032, 2, 25);
INSERT INTO `item_mods` VALUES (15032, 9, 3);
INSERT INTO `item_mods` VALUES (15032, 14, 3);
INSERT INTO `item_mods` VALUES (15032, 384, 30);
INSERT INTO `item_mods` VALUES (15033, 1, 21);
INSERT INTO `item_mods` VALUES (15033, 291, 2);
INSERT INTO `item_mods` VALUES (15034, 1, 28);
INSERT INTO `item_mods` VALUES (15034, 2, 10);
INSERT INTO `item_mods` VALUES (15034, 5, 10);
INSERT INTO `item_mods` VALUES (15034, 57, 20);
INSERT INTO `item_mods` VALUES (15035, 1, 16);
INSERT INTO `item_mods` VALUES (15035, 2, 17);
INSERT INTO `item_mods` VALUES (15035, 9, 4);
INSERT INTO `item_mods` VALUES (15035, 11, 4);
INSERT INTO `item_mods` VALUES (15035, 23, 5);
INSERT INTO `item_mods` VALUES (15035, 403, 10);
INSERT INTO `item_mods` VALUES (15036, 1, 16);
INSERT INTO `item_mods` VALUES (15036, 2, 17);
INSERT INTO `item_mods` VALUES (15036, 9, 4);
INSERT INTO `item_mods` VALUES (15036, 11, 4);
INSERT INTO `item_mods` VALUES (15036, 23, 5);
INSERT INTO `item_mods` VALUES (15036, 403, 10);
INSERT INTO `item_mods` VALUES (15037, 1, 14);
INSERT INTO `item_mods` VALUES (15037, 5, 20);
INSERT INTO `item_mods` VALUES (15037, 13, 5);
INSERT INTO `item_mods` VALUES (15037, 27, -3);
INSERT INTO `item_mods` VALUES (15037, 168, 20);
INSERT INTO `item_mods` VALUES (15038, 1, 17);
INSERT INTO `item_mods` VALUES (15038, 2, 15);
INSERT INTO `item_mods` VALUES (15038, 10, 3);
INSERT INTO `item_mods` VALUES (15038, 11, 3);
INSERT INTO `item_mods` VALUES (15038, 23, 5);
INSERT INTO `item_mods` VALUES (15038, 27, 2);
INSERT INTO `item_mods` VALUES (15038, 68, 5);
INSERT INTO `item_mods` VALUES (15039, 1, 18);
INSERT INTO `item_mods` VALUES (15039, 2, 15);
INSERT INTO `item_mods` VALUES (15039, 10, 4);
INSERT INTO `item_mods` VALUES (15039, 11, 4);
INSERT INTO `item_mods` VALUES (15039, 23, 5);
INSERT INTO `item_mods` VALUES (15039, 27, 3);
INSERT INTO `item_mods` VALUES (15039, 68, 5);
INSERT INTO `item_mods` VALUES (15040, 1, 14);
INSERT INTO `item_mods` VALUES (15040, 5, 20);
INSERT INTO `item_mods` VALUES (15040, 12, 3);
INSERT INTO `item_mods` VALUES (15040, 13, 3);
INSERT INTO `item_mods` VALUES (15040, 27, -2);
INSERT INTO `item_mods` VALUES (15040, 114, 7);
INSERT INTO `item_mods` VALUES (15041, 1, 15);
INSERT INTO `item_mods` VALUES (15041, 5, 20);
INSERT INTO `item_mods` VALUES (15041, 12, 4);
INSERT INTO `item_mods` VALUES (15041, 13, 4);
INSERT INTO `item_mods` VALUES (15041, 27, -3);
INSERT INTO `item_mods` VALUES (15041, 114, 7);

-- ------------------------------------------
-- Gothic Gauntlets
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (15042, 1, 12);
INSERT INTO `item_mods` VALUES (15042, 8, 3);
INSERT INTO `item_mods` VALUES (15042, 27, 2);
INSERT INTO `item_mods` VALUES (15042, 499, 2); -- ice spikes
INSERT INTO `item_mods` VALUES (15042, 500, 15); -- spikes dmg
INSERT INTO `item_mods` VALUES (15042, 501, 15); -- spikes proc rate

INSERT INTO `item_mods` VALUES (15043, 1, 1);
INSERT INTO `item_mods` VALUES (15043, 56, 2);
INSERT INTO `item_mods` VALUES (15043, 57, 2);
INSERT INTO `item_mods` VALUES (15044, 1, 1);
INSERT INTO `item_mods` VALUES (15044, 54, 4);
INSERT INTO `item_mods` VALUES (15045, 1, 1);
INSERT INTO `item_mods` VALUES (15045, 54, 2);
INSERT INTO `item_mods` VALUES (15045, 57, 2);
INSERT INTO `item_mods` VALUES (15046, 1, 1);
INSERT INTO `item_mods` VALUES (15046, 57, 4);
INSERT INTO `item_mods` VALUES (15047, 1, 1);
INSERT INTO `item_mods` VALUES (15047, 58, 2);
INSERT INTO `item_mods` VALUES (15047, 61, 2);
INSERT INTO `item_mods` VALUES (15048, 1, 1);
INSERT INTO `item_mods` VALUES (15048, 57, 2);
INSERT INTO `item_mods` VALUES (15048, 61, 2);
INSERT INTO `item_mods` VALUES (15049, 1, 1);
INSERT INTO `item_mods` VALUES (15049, 54, 2);
INSERT INTO `item_mods` VALUES (15049, 58, 2);
INSERT INTO `item_mods` VALUES (15050, 1, 1);
INSERT INTO `item_mods` VALUES (15050, 54, 2);
INSERT INTO `item_mods` VALUES (15050, 59, 2);
INSERT INTO `item_mods` VALUES (15051, 1, 1);
INSERT INTO `item_mods` VALUES (15051, 55, 2);
INSERT INTO `item_mods` VALUES (15051, 59, 2);
INSERT INTO `item_mods` VALUES (15052, 1, 3);
INSERT INTO `item_mods` VALUES (15052, 2, 4);
INSERT INTO `item_mods` VALUES (15052, 25, 2);
INSERT INTO `item_mods` VALUES (15053, 1, 8);
INSERT INTO `item_mods` VALUES (15053, 25, 4);
INSERT INTO `item_mods` VALUES (15054, 1, 11);
INSERT INTO `item_mods` VALUES (15054, 5, 16);
INSERT INTO `item_mods` VALUES (15054, 60, 5);
INSERT INTO `item_mods` VALUES (15054, 117, 5);
INSERT INTO `item_mods` VALUES (15055, 1, 11);
INSERT INTO `item_mods` VALUES (15055, 25, 5);
INSERT INTO `item_mods` VALUES (15055, 68, 2);
INSERT INTO `item_mods` VALUES (15056, 1, 16);
INSERT INTO `item_mods` VALUES (15056, 5, 25);
INSERT INTO `item_mods` VALUES (15056, 11, 3);
INSERT INTO `item_mods` VALUES (15056, 30, 3);
INSERT INTO `item_mods` VALUES (15057, 1, 18);
INSERT INTO `item_mods` VALUES (15057, 13, 5);
INSERT INTO `item_mods` VALUES (15057, 14, 5);
INSERT INTO `item_mods` VALUES (15057, 27, -2);
INSERT INTO `item_mods` VALUES (15057, 30, 5);
INSERT INTO `item_mods` VALUES (15058, 1, 9);
INSERT INTO `item_mods` VALUES (15058, 23, 1);
INSERT INTO `item_mods` VALUES (15058, 25, 4);
INSERT INTO `item_mods` VALUES (15059, 1, 12);
INSERT INTO `item_mods` VALUES (15059, 25, 6);
INSERT INTO `item_mods` VALUES (15059, 68, 3);
INSERT INTO `item_mods` VALUES (15061, 1, 25);
INSERT INTO `item_mods` VALUES (15061, 2, 18);
INSERT INTO `item_mods` VALUES (15061, 25, 13);
INSERT INTO `item_mods` VALUES (15062, 1, 19);
INSERT INTO `item_mods` VALUES (15062, 27, -8);
INSERT INTO `item_mods` VALUES (15062, 60, 50);
INSERT INTO `item_mods` VALUES (15062, 61, -50);
INSERT INTO `item_mods` VALUES (15063, 1, 22);
INSERT INTO `item_mods` VALUES (15063, 2, -25);
INSERT INTO `item_mods` VALUES (15063, 5, 75);
INSERT INTO `item_mods` VALUES (15063, 296, 2);
INSERT INTO `item_mods` VALUES (15064, 1, 20);
INSERT INTO `item_mods` VALUES (15064, 23, 9);
INSERT INTO `item_mods` VALUES (15064, 68, 9);
INSERT INTO `item_mods` VALUES (15064, 289, 5);
INSERT INTO `item_mods` VALUES (15065, 1, 24);
INSERT INTO `item_mods` VALUES (15065, 5, 14);
INSERT INTO `item_mods` VALUES (15065, 13, 5);
INSERT INTO `item_mods` VALUES (15065, 29, 3);
INSERT INTO `item_mods` VALUES (15066, 1, 1);
INSERT INTO `item_mods` VALUES (15067, 1, 1);
INSERT INTO `item_mods` VALUES (15068, 1, 22);
INSERT INTO `item_mods` VALUES (15069, 1, 32);
INSERT INTO `item_mods` VALUES (15070, 1, 40);
INSERT INTO `item_mods` VALUES (15070, 163, -64);
INSERT INTO `item_mods` VALUES (15070, 385, 200);
INSERT INTO `item_mods` VALUES (15071, 1, 11);
INSERT INTO `item_mods` VALUES (15072, 1, 28);
INSERT INTO `item_mods` VALUES (15072, 9, 5);
INSERT INTO `item_mods` VALUES (15072, 27, 1);
INSERT INTO `item_mods` VALUES (15072, 110, 5);
INSERT INTO `item_mods` VALUES (15072, 483, 10);
INSERT INTO `item_mods` VALUES (15073, 1, 23);
INSERT INTO `item_mods` VALUES (15073, 3, 5);
INSERT INTO `item_mods` VALUES (15073, 8, 5);
INSERT INTO `item_mods` VALUES (15073, 27, -3);
INSERT INTO `item_mods` VALUES (15073, 289, 6);
INSERT INTO `item_mods` VALUES (15074, 1, 24);
INSERT INTO `item_mods` VALUES (15074, 5, 25);
INSERT INTO `item_mods` VALUES (15074, 10, 4);
INSERT INTO `item_mods` VALUES (15074, 27, -4);
INSERT INTO `item_mods` VALUES (15074, 244, 2);
INSERT INTO `item_mods` VALUES (15075, 1, 23);
INSERT INTO `item_mods` VALUES (15075, 5, 23);
INSERT INTO `item_mods` VALUES (15075, 27, -2);
INSERT INTO `item_mods` VALUES (15075, 114, 5);
INSERT INTO `item_mods` VALUES (15075, 115, 10);
INSERT INTO `item_mods` VALUES (15076, 1, 24);
INSERT INTO `item_mods` VALUES (15076, 5, 14);
INSERT INTO `item_mods` VALUES (15076, 56, 10);
INSERT INTO `item_mods` VALUES (15076, 114, 15);
INSERT INTO `item_mods` VALUES (15076, 369, 1);
INSERT INTO `item_mods` VALUES (15077, 1, 24);
INSERT INTO `item_mods` VALUES (15077, 2, 16);
INSERT INTO `item_mods` VALUES (15077, 9, 5);
INSERT INTO `item_mods` VALUES (15077, 27, 2);
INSERT INTO `item_mods` VALUES (15078, 1, 28);
INSERT INTO `item_mods` VALUES (15078, 2, 18);
INSERT INTO `item_mods` VALUES (15078, 27, 3);
INSERT INTO `item_mods` VALUES (15078, 112, 10);
INSERT INTO `item_mods` VALUES (15079, 1, 27);
INSERT INTO `item_mods` VALUES (15079, 2, 30);
INSERT INTO `item_mods` VALUES (15079, 10, 7);
INSERT INTO `item_mods` VALUES (15079, 23, 10);
INSERT INTO `item_mods` VALUES (15079, 242, 2);
INSERT INTO `item_mods` VALUES (15080, 1, 26);
INSERT INTO `item_mods` VALUES (15080, 2, 19);
INSERT INTO `item_mods` VALUES (15080, 14, 4);
INSERT INTO `item_mods` VALUES (15080, 110, 3);
INSERT INTO `item_mods` VALUES (15080, 360, 5);
INSERT INTO `item_mods` VALUES (15081, 1, 19);
INSERT INTO `item_mods` VALUES (15081, 2, 13);
INSERT INTO `item_mods` VALUES (15081, 14, 5);
INSERT INTO `item_mods` VALUES (15081, 27, -3);
INSERT INTO `item_mods` VALUES (15081, 119, 5);
INSERT INTO `item_mods` VALUES (15082, 1, 24);
INSERT INTO `item_mods` VALUES (15082, 2, 15);
INSERT INTO `item_mods` VALUES (15082, 13, 4);
INSERT INTO `item_mods` VALUES (15082, 27, -3);
INSERT INTO `item_mods` VALUES (15082, 305, 5);
INSERT INTO `item_mods` VALUES (15083, 1, 25);
INSERT INTO `item_mods` VALUES (15083, 2, 20);
INSERT INTO `item_mods` VALUES (15083, 25, 10);
INSERT INTO `item_mods` VALUES (15083, 26, 5);
INSERT INTO `item_mods` VALUES (15083, 27, 1);
INSERT INTO `item_mods` VALUES (15084, 1, 22);
INSERT INTO `item_mods` VALUES (15084, 2, 20);
INSERT INTO `item_mods` VALUES (15085, 1, 25);
INSERT INTO `item_mods` VALUES (15085, 2, 16);
INSERT INTO `item_mods` VALUES (15085, 8, 4);
INSERT INTO `item_mods` VALUES (15085, 56, 10);
INSERT INTO `item_mods` VALUES (15085, 402, 30);
INSERT INTO `item_mods` VALUES (15086, 1, 18);
INSERT INTO `item_mods` VALUES (15086, 5, 25);
INSERT INTO `item_mods` VALUES (15086, 12, 3);
INSERT INTO `item_mods` VALUES (15086, 356, 3);
INSERT INTO `item_mods` VALUES (15086, 372, 3);
INSERT INTO `item_mods` VALUES (15087, 1, 50);
INSERT INTO `item_mods` VALUES (15087, 2, 10);
INSERT INTO `item_mods` VALUES (15087, 23, 10);
INSERT INTO `item_mods` VALUES (15087, 27, 4);
INSERT INTO `item_mods` VALUES (15088, 1, 44);
INSERT INTO `item_mods` VALUES (15088, 3, 5);
INSERT INTO `item_mods` VALUES (15088, 10, 5);
INSERT INTO `item_mods` VALUES (15088, 72, 6);
INSERT INTO `item_mods` VALUES (15088, 370, 1);
INSERT INTO `item_mods` VALUES (15089, 1, 42);
INSERT INTO `item_mods` VALUES (15089, 5, 24);
INSERT INTO `item_mods` VALUES (15089, 27, -2);
INSERT INTO `item_mods` VALUES (15089, 369, 1);
INSERT INTO `item_mods` VALUES (15090, 1, 41);
INSERT INTO `item_mods` VALUES (15090, 5, 12);
INSERT INTO `item_mods` VALUES (15090, 27, -2);
INSERT INTO `item_mods` VALUES (15090, 115, 5);
INSERT INTO `item_mods` VALUES (15090, 369, 1);
INSERT INTO `item_mods` VALUES (15091, 1, 45);
INSERT INTO `item_mods` VALUES (15091, 5, 24);
INSERT INTO `item_mods` VALUES (15091, 11, 4);
INSERT INTO `item_mods` VALUES (15091, 112, 10);
INSERT INTO `item_mods` VALUES (15091, 170, 10);
INSERT INTO `item_mods` VALUES (15092, 1, 45);
INSERT INTO `item_mods` VALUES (15092, 2, 22);
INSERT INTO `item_mods` VALUES (15092, 11, 4);
INSERT INTO `item_mods` VALUES (15092, 27, 3);
INSERT INTO `item_mods` VALUES (15092, 165, 5);
INSERT INTO `item_mods` VALUES (15093, 1, 55);
INSERT INTO `item_mods` VALUES (15093, 2, 23);
INSERT INTO `item_mods` VALUES (15093, 9, 3);
INSERT INTO `item_mods` VALUES (15093, 27, 4);
INSERT INTO `item_mods` VALUES (15094, 1, 49);
INSERT INTO `item_mods` VALUES (15094, 2, 20);
INSERT INTO `item_mods` VALUES (15094, 13, 4);
INSERT INTO `item_mods` VALUES (15094, 25, 10);
INSERT INTO `item_mods` VALUES (15094, 28, 10);
INSERT INTO `item_mods` VALUES (15095, 1, 49);
INSERT INTO `item_mods` VALUES (15095, 2, 21);
INSERT INTO `item_mods` VALUES (15095, 12, 6);
INSERT INTO `item_mods` VALUES (15095, 360, 6);
INSERT INTO `item_mods` VALUES (15096, 1, 45);
INSERT INTO `item_mods` VALUES (15096, 2, 19);
INSERT INTO `item_mods` VALUES (15096, 23, 18);
INSERT INTO `item_mods` VALUES (15097, 1, 45);
INSERT INTO `item_mods` VALUES (15097, 2, 23);
INSERT INTO `item_mods` VALUES (15097, 9, 4);
INSERT INTO `item_mods` VALUES (15097, 27, -3);
INSERT INTO `item_mods` VALUES (15097, 359, 5);
INSERT INTO `item_mods` VALUES (15098, 1, 50);
INSERT INTO `item_mods` VALUES (15098, 2, 34);
INSERT INTO `item_mods` VALUES (15098, 10, 6);
INSERT INTO `item_mods` VALUES (15098, 27, 1);
INSERT INTO `item_mods` VALUES (15098, 73, 3);
INSERT INTO `item_mods` VALUES (15099, 1, 46);
INSERT INTO `item_mods` VALUES (15099, 23, 16);
INSERT INTO `item_mods` VALUES (15099, 24, 8);
INSERT INTO `item_mods` VALUES (15099, 25, 12);
INSERT INTO `item_mods` VALUES (15099, 26, 8);
INSERT INTO `item_mods` VALUES (15100, 1, 49);
INSERT INTO `item_mods` VALUES (15100, 2, 24);
INSERT INTO `item_mods` VALUES (15100, 110, 15);
INSERT INTO `item_mods` VALUES (15100, 243, 2);
INSERT INTO `item_mods` VALUES (15101, 1, 38);
INSERT INTO `item_mods` VALUES (15101, 5, 20);
INSERT INTO `item_mods` VALUES (15101, 357, 3);
INSERT INTO `item_mods` VALUES (15101, 373, 3);
INSERT INTO `item_mods` VALUES (15102, 1, 22);
INSERT INTO `item_mods` VALUES (15102, 2, 20);
INSERT INTO `item_mods` VALUES (15102, 10, 5);
INSERT INTO `item_mods` VALUES (15102, 23, 12);
INSERT INTO `item_mods` VALUES (15102, 27, 2);
INSERT INTO `item_mods` VALUES (15103, 1, 15);
INSERT INTO `item_mods` VALUES (15103, 3, 3);
INSERT INTO `item_mods` VALUES (15103, 23, 16);
INSERT INTO `item_mods` VALUES (15103, 289, 4);
INSERT INTO `item_mods` VALUES (15104, 1, 16);
INSERT INTO `item_mods` VALUES (15104, 5, 20);
INSERT INTO `item_mods` VALUES (15104, 27, -3);
INSERT INTO `item_mods` VALUES (15104, 114, 15);
INSERT INTO `item_mods` VALUES (15105, 1, 15);
INSERT INTO `item_mods` VALUES (15105, 5, 24);
INSERT INTO `item_mods` VALUES (15105, 27, -2);
INSERT INTO `item_mods` VALUES (15105, 116, 10);
INSERT INTO `item_mods` VALUES (15105, 487, 5);
INSERT INTO `item_mods` VALUES (15106, 1, 17);
INSERT INTO `item_mods` VALUES (15106, 5, 18);
INSERT INTO `item_mods` VALUES (15106, 12, 4);
INSERT INTO `item_mods` VALUES (15106, 29, 2);
INSERT INTO `item_mods` VALUES (15106, 113, 15);
INSERT INTO `item_mods` VALUES (15107, 1, 16);
INSERT INTO `item_mods` VALUES (15107, 2, 7);
INSERT INTO `item_mods` VALUES (15107, 14, 5);
INSERT INTO `item_mods` VALUES (15107, 27, 3);
INSERT INTO `item_mods` VALUES (15107, 303, 1);
INSERT INTO `item_mods` VALUES (15108, 1, 22);
INSERT INTO `item_mods` VALUES (15108, 2, 16);
INSERT INTO `item_mods` VALUES (15108, 10, 5);
INSERT INTO `item_mods` VALUES (15108, 27, 3);
INSERT INTO `item_mods` VALUES (15108, 385, 10);
INSERT INTO `item_mods` VALUES (15109, 1, 20);
INSERT INTO `item_mods` VALUES (15109, 5, 20);
INSERT INTO `item_mods` VALUES (15109, 9, 5);
INSERT INTO `item_mods` VALUES (15109, 12, 8);
INSERT INTO `item_mods` VALUES (15109, 116, 5);
INSERT INTO `item_mods` VALUES (15110, 1, 15);
INSERT INTO `item_mods` VALUES (15110, 2, 14);
INSERT INTO `item_mods` VALUES (15110, 11, 4);
INSERT INTO `item_mods` VALUES (15110, 360, 4);
INSERT INTO `item_mods` VALUES (15111, 1, 18);
INSERT INTO `item_mods` VALUES (15111, 2, 16);
INSERT INTO `item_mods` VALUES (15111, 27, -3);
INSERT INTO `item_mods` VALUES (15111, 68, 5);
INSERT INTO `item_mods` VALUES (15111, 121, 3);
INSERT INTO `item_mods` VALUES (15112, 1, 14);
INSERT INTO `item_mods` VALUES (15112, 2, 13);
INSERT INTO `item_mods` VALUES (15112, 11, 5);
INSERT INTO `item_mods` VALUES (15112, 27, -2);
INSERT INTO `item_mods` VALUES (15112, 68, 7);
INSERT INTO `item_mods` VALUES (15113, 1, 21);
INSERT INTO `item_mods` VALUES (15113, 2, 10);
INSERT INTO `item_mods` VALUES (15113, 23, 10);
INSERT INTO `item_mods` VALUES (15113, 27, 1);
INSERT INTO `item_mods` VALUES (15114, 1, 18);
INSERT INTO `item_mods` VALUES (15114, 308, 33);
INSERT INTO `item_mods` VALUES (15115, 1, 19);
INSERT INTO `item_mods` VALUES (15115, 2, 16);
INSERT INTO `item_mods` VALUES (15115, 11, 3);
INSERT INTO `item_mods` VALUES (15115, 25, 5);
INSERT INTO `item_mods` VALUES (15116, 1, 15);
INSERT INTO `item_mods` VALUES (15116, 5, 25);
INSERT INTO `item_mods` VALUES (15116, 117, 10);
INSERT INTO `item_mods` VALUES (15116, 357, 2);
INSERT INTO `item_mods` VALUES (15117, 1, 39);
INSERT INTO `item_mods` VALUES (15117, 8, 5);
INSERT INTO `item_mods` VALUES (15117, 27, 3);
INSERT INTO `item_mods` VALUES (15117, 288, 1);
INSERT INTO `item_mods` VALUES (15118, 1, 31);
INSERT INTO `item_mods` VALUES (15118, 3, 6);
INSERT INTO `item_mods` VALUES (15118, 11, 4);
INSERT INTO `item_mods` VALUES (15118, 289, 5);
INSERT INTO `item_mods` VALUES (15118, 292, 5);
INSERT INTO `item_mods` VALUES (15119, 1, 31);
INSERT INTO `item_mods` VALUES (15119, 5, 17);
INSERT INTO `item_mods` VALUES (15119, 27, -2);
INSERT INTO `item_mods` VALUES (15119, 112, 15);
INSERT INTO `item_mods` VALUES (15120, 1, 30);
INSERT INTO `item_mods` VALUES (15120, 5, 13);
INSERT INTO `item_mods` VALUES (15120, 12, 3);
INSERT INTO `item_mods` VALUES (15120, 27, -2);
INSERT INTO `item_mods` VALUES (15121, 1, 33);
INSERT INTO `item_mods` VALUES (15121, 5, 16);
INSERT INTO `item_mods` VALUES (15121, 9, 5);
INSERT INTO `item_mods` VALUES (15121, 115, 10);
INSERT INTO `item_mods` VALUES (15122, 1, 34);
INSERT INTO `item_mods` VALUES (15122, 2, 19);
INSERT INTO `item_mods` VALUES (15122, 27, 4);
INSERT INTO `item_mods` VALUES (15122, 298, 5);
INSERT INTO `item_mods` VALUES (15123, 1, 43);
INSERT INTO `item_mods` VALUES (15123, 2, 20);
INSERT INTO `item_mods` VALUES (15123, 8, 5);
INSERT INTO `item_mods` VALUES (15123, 27, 3);
INSERT INTO `item_mods` VALUES (15123, 168, 10);
INSERT INTO `item_mods` VALUES (15124, 1, 38);
INSERT INTO `item_mods` VALUES (15124, 5, 18);
INSERT INTO `item_mods` VALUES (15124, 13, 5);
INSERT INTO `item_mods` VALUES (15124, 29, 5);
INSERT INTO `item_mods` VALUES (15124, 116, 5);
INSERT INTO `item_mods` VALUES (15125, 1, 34);
INSERT INTO `item_mods` VALUES (15125, 2, 17);
INSERT INTO `item_mods` VALUES (15125, 9, 4);
INSERT INTO `item_mods` VALUES (15125, 72, 3);
INSERT INTO `item_mods` VALUES (15125, 360, 2);
INSERT INTO `item_mods` VALUES (15126, 1, 31);
INSERT INTO `item_mods` VALUES (15126, 2, 17);
INSERT INTO `item_mods` VALUES (15126, 5, 42);
INSERT INTO `item_mods` VALUES (15127, 1, 32);
INSERT INTO `item_mods` VALUES (15127, 2, 18);
INSERT INTO `item_mods` VALUES (15127, 26, 7);
INSERT INTO `item_mods` VALUES (15127, 27, -2);
INSERT INTO `item_mods` VALUES (15127, 110, 10);

-- ------------------------------------------
-- Saotome Haidate
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (15128, 1, 40);
INSERT INTO `item_mods` VALUES (15128, 2, 18);
INSERT INTO `item_mods` VALUES (15128, 11, 3);
INSERT INTO `item_mods` VALUES (15128, 27, 1);
INSERT INTO `item_mods` VALUES (15128, 508, 15); -- Augment's Third Eye

INSERT INTO `item_mods` VALUES (15129, 1, 31);
INSERT INTO `item_mods` VALUES (15129, 2, 40);
INSERT INTO `item_mods` VALUES (15129, 259, 5);
INSERT INTO `item_mods` VALUES (15130, 1, 32);
INSERT INTO `item_mods` VALUES (15130, 2, 13);
INSERT INTO `item_mods` VALUES (15130, 9, 5);
INSERT INTO `item_mods` VALUES (15130, 363, 10);
INSERT INTO `item_mods` VALUES (15131, 1, 29);
INSERT INTO `item_mods` VALUES (15131, 5, 20);
INSERT INTO `item_mods` VALUES (15131, 13, 3);
INSERT INTO `item_mods` VALUES (15131, 357, 2);
INSERT INTO `item_mods` VALUES (15132, 1, 19);
INSERT INTO `item_mods` VALUES (15132, 2, 10);
INSERT INTO `item_mods` VALUES (15132, 11, 5);
INSERT INTO `item_mods` VALUES (15132, 27, 1);
INSERT INTO `item_mods` VALUES (15133, 1, 15);
INSERT INTO `item_mods` VALUES (15133, 3, 4);
INSERT INTO `item_mods` VALUES (15133, 9, 4);
INSERT INTO `item_mods` VALUES (15133, 107, 12);
INSERT INTO `item_mods` VALUES (15134, 1, 15);
INSERT INTO `item_mods` VALUES (15134, 5, 18);
INSERT INTO `item_mods` VALUES (15134, 13, 5);
INSERT INTO `item_mods` VALUES (15134, 27, -1);
INSERT INTO `item_mods` VALUES (15134, 113, 10);
INSERT INTO `item_mods` VALUES (15135, 1, 14);
INSERT INTO `item_mods` VALUES (15135, 5, 18);
INSERT INTO `item_mods` VALUES (15135, 12, 2);
INSERT INTO `item_mods` VALUES (15135, 27, -1);
INSERT INTO `item_mods` VALUES (15135, 296, 5);
INSERT INTO `item_mods` VALUES (15136, 1, 15);
INSERT INTO `item_mods` VALUES (15136, 5, 15);
INSERT INTO `item_mods` VALUES (15136, 13, 4);
INSERT INTO `item_mods` VALUES (15136, 28, 4);
INSERT INTO `item_mods` VALUES (15136, 108, 5);
INSERT INTO `item_mods` VALUES (15137, 1, 15);
INSERT INTO `item_mods` VALUES (15137, 2, 15);
INSERT INTO `item_mods` VALUES (15137, 14, 5);
INSERT INTO `item_mods` VALUES (15137, 27, 2);
INSERT INTO `item_mods` VALUES (15137, 302, 1);
INSERT INTO `item_mods` VALUES (15138, 1, 19);
INSERT INTO `item_mods` VALUES (15138, 2, 18);
INSERT INTO `item_mods` VALUES (15138, 13, 3);
INSERT INTO `item_mods` VALUES (15138, 27, 1);
INSERT INTO `item_mods` VALUES (15139, 1, 17);
INSERT INTO `item_mods` VALUES (15139, 5, 12);
INSERT INTO `item_mods` VALUES (15139, 114, 5);
INSERT INTO `item_mods` VALUES (15140, 1, 14);
INSERT INTO `item_mods` VALUES (15140, 2, 13);
INSERT INTO `item_mods` VALUES (15140, 10, 4);
INSERT INTO `item_mods` VALUES (15140, 360, 3);
INSERT INTO `item_mods` VALUES (15140, 364, 20);
INSERT INTO `item_mods` VALUES (15141, 1, 14);
INSERT INTO `item_mods` VALUES (15141, 2, 12);
INSERT INTO `item_mods` VALUES (15141, 27, -2);
INSERT INTO `item_mods` VALUES (15141, 110, 3);
INSERT INTO `item_mods` VALUES (15141, 120, 3);
INSERT INTO `item_mods` VALUES (15142, 1, 16);
INSERT INTO `item_mods` VALUES (15142, 2, 12);
INSERT INTO `item_mods` VALUES (15142, 10, 5);
INSERT INTO `item_mods` VALUES (15142, 24, 10);
INSERT INTO `item_mods` VALUES (15142, 27, -3);
INSERT INTO `item_mods` VALUES (15143, 1, 18);
INSERT INTO `item_mods` VALUES (15143, 2, 23);
INSERT INTO `item_mods` VALUES (15143, 9, 5);
INSERT INTO `item_mods` VALUES (15143, 23, 8);
INSERT INTO `item_mods` VALUES (15143, 27, 1);
INSERT INTO `item_mods` VALUES (15144, 1, 15);
INSERT INTO `item_mods` VALUES (15144, 10, 7);
INSERT INTO `item_mods` VALUES (15144, 118, 10);
INSERT INTO `item_mods` VALUES (15145, 1, 16);
INSERT INTO `item_mods` VALUES (15145, 2, 10);
INSERT INTO `item_mods` VALUES (15145, 10, 4);
INSERT INTO `item_mods` VALUES (15145, 55, 10);
INSERT INTO `item_mods` VALUES (15146, 1, 14);
INSERT INTO `item_mods` VALUES (15146, 5, 20);
INSERT INTO `item_mods` VALUES (15146, 10, 3);
INSERT INTO `item_mods` VALUES (15146, 357, 2);
INSERT INTO `item_mods` VALUES (15147, 1, 5);
INSERT INTO `item_mods` VALUES (15147, 13, 1);
INSERT INTO `item_mods` VALUES (15147, 14, 1);
INSERT INTO `item_mods` VALUES (15148, 1, 9);
INSERT INTO `item_mods` VALUES (15148, 5, 22);
INSERT INTO `item_mods` VALUES (15149, 1, 15);
INSERT INTO `item_mods` VALUES (15149, 5, 16);
INSERT INTO `item_mods` VALUES (15149, 27, 2);
INSERT INTO `item_mods` VALUES (15150, 1, 19);
INSERT INTO `item_mods` VALUES (15150, 4, 10);
INSERT INTO `item_mods` VALUES (15150, 23, 4);
INSERT INTO `item_mods` VALUES (15150, 26, -4);
INSERT INTO `item_mods` VALUES (15150, 68, 4);
INSERT INTO `item_mods` VALUES (15151, 2, 5);
INSERT INTO `item_mods` VALUES (15151, 5, 5);
INSERT INTO `item_mods` VALUES (15151, 8, 1);
INSERT INTO `item_mods` VALUES (15151, 9, 1);
INSERT INTO `item_mods` VALUES (15151, 10, 1);
INSERT INTO `item_mods` VALUES (15151, 11, 1);
INSERT INTO `item_mods` VALUES (15151, 12, 1);
INSERT INTO `item_mods` VALUES (15151, 13, 1);
INSERT INTO `item_mods` VALUES (15151, 14, 1);
INSERT INTO `item_mods` VALUES (15151, 23, 1);
INSERT INTO `item_mods` VALUES (15151, 24, 1);
INSERT INTO `item_mods` VALUES (15151, 25, 1);
INSERT INTO `item_mods` VALUES (15151, 26, 1);
INSERT INTO `item_mods` VALUES (15151, 68, 1);
INSERT INTO `item_mods` VALUES (15152, 11, 4);
INSERT INTO `item_mods` VALUES (15152, 54, 9);
INSERT INTO `item_mods` VALUES (15152, 240, 2);
INSERT INTO `item_mods` VALUES (15152, 242, 2);
INSERT INTO `item_mods` VALUES (15153, 1, 17);
INSERT INTO `item_mods` VALUES (15153, 5, 9);
INSERT INTO `item_mods` VALUES (15153, 14, 3);
INSERT INTO `item_mods` VALUES (15153, 384, 11);
INSERT INTO `item_mods` VALUES (15154, 1, 18);
INSERT INTO `item_mods` VALUES (15154, 5, 10);
INSERT INTO `item_mods` VALUES (15154, 14, 4);
INSERT INTO `item_mods` VALUES (15154, 384, 20);
INSERT INTO `item_mods` VALUES (15155, 1, 24);
INSERT INTO `item_mods` VALUES (15155, 23, 5);
INSERT INTO `item_mods` VALUES (15155, 27, 1);
INSERT INTO `item_mods` VALUES (15155, 110, 10);
INSERT INTO `item_mods` VALUES (15156, 1, 25);
INSERT INTO `item_mods` VALUES (15156, 23, 6);
INSERT INTO `item_mods` VALUES (15156, 27, 2);
INSERT INTO `item_mods` VALUES (15156, 110, 12);
INSERT INTO `item_mods` VALUES (15157, 1, 25);
INSERT INTO `item_mods` VALUES (15157, 5, 8);
INSERT INTO `item_mods` VALUES (15157, 27, -1);
INSERT INTO `item_mods` VALUES (15158, 1, 26);
INSERT INTO `item_mods` VALUES (15158, 5, 9);
INSERT INTO `item_mods` VALUES (15158, 27, -2);

-- ------------------------------------------
-- Igqira Tiara
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (15159, 1, 20);
INSERT INTO `item_mods` VALUES (15159, 68, 10);
INSERT INTO `item_mods` VALUES (15159, 114, 10);
INSERT INTO `item_mods` VALUES (15159, 499, 4); -- curse spikes
INSERT INTO `item_mods` VALUES (15159, 500, 0); -- spikes dmg
INSERT INTO `item_mods` VALUES (15159, 501, 20); -- spikes proc rate

-- ------------------------------------------
-- Genie Tiara
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (15160, 1, 21);
INSERT INTO `item_mods` VALUES (15160, 68, 11);
INSERT INTO `item_mods` VALUES (15160, 114, 11);
INSERT INTO `item_mods` VALUES (15160, 499, 4); -- curse spikes
INSERT INTO `item_mods` VALUES (15160, 500, 0); -- spikes dmg
INSERT INTO `item_mods` VALUES (15160, 501, 25); -- spikes proc rate

INSERT INTO `item_mods` VALUES (15161, 1, 9);
INSERT INTO `item_mods` VALUES (15161, 11, 1);
INSERT INTO `item_mods` VALUES (15161, 61, 1);
INSERT INTO `item_mods` VALUES (15162, 1, 11);
INSERT INTO `item_mods` VALUES (15163, 1, 4);
INSERT INTO `item_mods` VALUES (15163, 12, 2);
INSERT INTO `item_mods` VALUES (15164, 1, 11);
INSERT INTO `item_mods` VALUES (15165, 1, 10);
INSERT INTO `item_mods` VALUES (15165, 235, 2);
INSERT INTO `item_mods` VALUES (15166, 1, 5);
INSERT INTO `item_mods` VALUES (15166, 12, 3);
INSERT INTO `item_mods` VALUES (15167, 1, 13);
INSERT INTO `item_mods` VALUES (15167, 11, 1);
INSERT INTO `item_mods` VALUES (15168, 1, 12);
INSERT INTO `item_mods` VALUES (15169, 1, 11);
INSERT INTO `item_mods` VALUES (15169, 68, 1);
INSERT INTO `item_mods` VALUES (15169, 235, 2);
INSERT INTO `item_mods` VALUES (15170, 1, 6);
INSERT INTO `item_mods` VALUES (15170, 68, 4);
INSERT INTO `item_mods` VALUES (15171, 1, 14);
INSERT INTO `item_mods` VALUES (15171, 11, 2);
INSERT INTO `item_mods` VALUES (15172, 1, 10);
INSERT INTO `item_mods` VALUES (15172, 11, 2);
INSERT INTO `item_mods` VALUES (15172, 61, 2);
INSERT INTO `item_mods` VALUES (15173, 2, 20);
INSERT INTO `item_mods` VALUES (15173, 5, 20);
INSERT INTO `item_mods` VALUES (15174, 1, 18);
INSERT INTO `item_mods` VALUES (15175, 1, 21);
INSERT INTO `item_mods` VALUES (15176, 27, 1);
INSERT INTO `item_mods` VALUES (15178, 1, 1);
INSERT INTO `item_mods` VALUES (15179, 1, 1);
INSERT INTO `item_mods` VALUES (15180, 1, 2);
INSERT INTO `item_mods` VALUES (15180, 27, 2);
INSERT INTO `item_mods` VALUES (15181, 1, 18);
INSERT INTO `item_mods` VALUES (15181, 23, 2);
INSERT INTO `item_mods` VALUES (15181, 25, 2);
INSERT INTO `item_mods` VALUES (15181, 68, 2);
INSERT INTO `item_mods` VALUES (15182, 1, 19);
INSERT INTO `item_mods` VALUES (15183, 11, 3);
INSERT INTO `item_mods` VALUES (15183, 68, 5);
INSERT INTO `item_mods` VALUES (15183, 241, 2);
INSERT INTO `item_mods` VALUES (15184, 8, 3);
INSERT INTO `item_mods` VALUES (15184, 9, 4);
INSERT INTO `item_mods` VALUES (15185, 1, 11);
INSERT INTO `item_mods` VALUES (15185, 2, 15);
INSERT INTO `item_mods` VALUES (15185, 23, 6);
INSERT INTO `item_mods` VALUES (15186, 1, 10);
INSERT INTO `item_mods` VALUES (15186, 14, 2);
INSERT INTO `item_mods` VALUES (15187, 1, 27);
INSERT INTO `item_mods` VALUES (15187, 8, 4);
INSERT INTO `item_mods` VALUES (15187, 48, 5);
INSERT INTO `item_mods` VALUES (15188, 1, 26);
INSERT INTO `item_mods` VALUES (15188, 8, 3);
INSERT INTO `item_mods` VALUES (15188, 48, 4);
INSERT INTO `item_mods` VALUES (15189, 1, 26);
INSERT INTO `item_mods` VALUES (15189, 4, 15);
INSERT INTO `item_mods` VALUES (15189, 10, 2);
INSERT INTO `item_mods` VALUES (15189, 27, 2);
INSERT INTO `item_mods` VALUES (15189, 60, 2);
INSERT INTO `item_mods` VALUES (15189, 61, 2);
INSERT INTO `item_mods` VALUES (15190, 1, 24);
INSERT INTO `item_mods` VALUES (15190, 5, 13);
INSERT INTO `item_mods` VALUES (15190, 25, 2);
INSERT INTO `item_mods` VALUES (15190, 26, 3);
INSERT INTO `item_mods` VALUES (15190, 30, 5);
INSERT INTO `item_mods` VALUES (15191, 1, 25);
INSERT INTO `item_mods` VALUES (15191, 5, 15);
INSERT INTO `item_mods` VALUES (15191, 25, 3);
INSERT INTO `item_mods` VALUES (15191, 26, 4);
INSERT INTO `item_mods` VALUES (15191, 30, 6);
INSERT INTO `item_mods` VALUES (15192, 1, 23);
INSERT INTO `item_mods` VALUES (15192, 12, 8);
INSERT INTO `item_mods` VALUES (15192, 27, 3);
INSERT INTO `item_mods` VALUES (15192, 168, 6);
INSERT INTO `item_mods` VALUES (15193, 1, 27);
INSERT INTO `item_mods` VALUES (15193, 2, 15);
INSERT INTO `item_mods` VALUES (15193, 10, 3);
INSERT INTO `item_mods` VALUES (15193, 27, 3);
INSERT INTO `item_mods` VALUES (15193, 60, 3);
INSERT INTO `item_mods` VALUES (15193, 61, 3);
INSERT INTO `item_mods` VALUES (15194, 8, 7);
INSERT INTO `item_mods` VALUES (15194, 9, 7);
INSERT INTO `item_mods` VALUES (15194, 10, 7);
INSERT INTO `item_mods` VALUES (15194, 11, 7);
INSERT INTO `item_mods` VALUES (15194, 12, 7);
INSERT INTO `item_mods` VALUES (15194, 13, 7);
INSERT INTO `item_mods` VALUES (15194, 14, 7);
INSERT INTO `item_mods` VALUES (15195, 2, -20);
INSERT INTO `item_mods` VALUES (15195, 5, 55);
INSERT INTO `item_mods` VALUES (15196, 240, 2);
INSERT INTO `item_mods` VALUES (15196, 241, 2);
INSERT INTO `item_mods` VALUES (15196, 242, 2);
INSERT INTO `item_mods` VALUES (15196, 243, 2);
INSERT INTO `item_mods` VALUES (15196, 244, 2);
INSERT INTO `item_mods` VALUES (15196, 245, 2);
INSERT INTO `item_mods` VALUES (15196, 246, 2);
INSERT INTO `item_mods` VALUES (15196, 247, 2);
INSERT INTO `item_mods` VALUES (15196, 248, 2);
INSERT INTO `item_mods` VALUES (15196, 249, 2);
INSERT INTO `item_mods` VALUES (15196, 250, 2);
INSERT INTO `item_mods` VALUES (15196, 251, 2);
INSERT INTO `item_mods` VALUES (15196, 252, 2);
INSERT INTO `item_mods` VALUES (15197, 1, 17);
INSERT INTO `item_mods` VALUES (15200, 1, 5);
INSERT INTO `item_mods` VALUES (15200, 54, 5);
INSERT INTO `item_mods` VALUES (15200, 55, 5);
INSERT INTO `item_mods` VALUES (15200, 56, 5);
INSERT INTO `item_mods` VALUES (15200, 57, 5);
INSERT INTO `item_mods` VALUES (15200, 58, 5);
INSERT INTO `item_mods` VALUES (15200, 59, -25);
INSERT INTO `item_mods` VALUES (15200, 60, 5);
INSERT INTO `item_mods` VALUES (15200, 61, 5);
INSERT INTO `item_mods` VALUES (15201, 1, 5);
INSERT INTO `item_mods` VALUES (15201, 54, 5);
INSERT INTO `item_mods` VALUES (15201, 55, 5);
INSERT INTO `item_mods` VALUES (15201, 56, 5);
INSERT INTO `item_mods` VALUES (15201, 57, 5);
INSERT INTO `item_mods` VALUES (15201, 58, -25);
INSERT INTO `item_mods` VALUES (15201, 59, 5);
INSERT INTO `item_mods` VALUES (15201, 60, 5);
INSERT INTO `item_mods` VALUES (15201, 61, 5);
INSERT INTO `item_mods` VALUES (15202, 1, 5);
INSERT INTO `item_mods` VALUES (15202, 54, 5);
INSERT INTO `item_mods` VALUES (15202, 55, -25);
INSERT INTO `item_mods` VALUES (15202, 56, 5);
INSERT INTO `item_mods` VALUES (15202, 57, 5);
INSERT INTO `item_mods` VALUES (15202, 58, 5);
INSERT INTO `item_mods` VALUES (15202, 59, 5);
INSERT INTO `item_mods` VALUES (15202, 60, 5);
INSERT INTO `item_mods` VALUES (15202, 61, 5);
INSERT INTO `item_mods` VALUES (15203, 1, 5);
INSERT INTO `item_mods` VALUES (15203, 54, 5);
INSERT INTO `item_mods` VALUES (15203, 55, 5);
INSERT INTO `item_mods` VALUES (15203, 56, 5);
INSERT INTO `item_mods` VALUES (15203, 57, 5);
INSERT INTO `item_mods` VALUES (15203, 58, 5);
INSERT INTO `item_mods` VALUES (15203, 59, 5);
INSERT INTO `item_mods` VALUES (15203, 60, -25);
INSERT INTO `item_mods` VALUES (15203, 61, 5);
INSERT INTO `item_mods` VALUES (15205, 1, 16);
INSERT INTO `item_mods` VALUES (15206, 1, 16);
INSERT INTO `item_mods` VALUES (15206, 8, 1);
INSERT INTO `item_mods` VALUES (15206, 9, 1);
INSERT INTO `item_mods` VALUES (15206, 11, -1);
INSERT INTO `item_mods` VALUES (15206, 23, 1);
INSERT INTO `item_mods` VALUES (15206, 25, 1);
INSERT INTO `item_mods` VALUES (15206, 68, -3);
INSERT INTO `item_mods` VALUES (15207, 1, 7);
INSERT INTO `item_mods` VALUES (15208, 1, 8);
INSERT INTO `item_mods` VALUES (15208, 12, 2);
INSERT INTO `item_mods` VALUES (15208, 27, 2);
INSERT INTO `item_mods` VALUES (15209, 1, 35);
INSERT INTO `item_mods` VALUES (15209, 2, 36);
INSERT INTO `item_mods` VALUES (15209, 25, 6);
INSERT INTO `item_mods` VALUES (15210, 1, 37);
INSERT INTO `item_mods` VALUES (15210, 2, 40);
INSERT INTO `item_mods` VALUES (15210, 25, 7);
INSERT INTO `item_mods` VALUES (15211, 2, -7);
INSERT INTO `item_mods` VALUES (15211, 5, 21);
INSERT INTO `item_mods` VALUES (15211, 59, 14);
INSERT INTO `item_mods` VALUES (15214, 1, 10);
INSERT INTO `item_mods` VALUES (15214, 54, 10);
INSERT INTO `item_mods` VALUES (15214, 55, 10);
INSERT INTO `item_mods` VALUES (15214, 56, 10);
INSERT INTO `item_mods` VALUES (15214, 57, 10);
INSERT INTO `item_mods` VALUES (15214, 58, 10);
INSERT INTO `item_mods` VALUES (15214, 59, -50);
INSERT INTO `item_mods` VALUES (15214, 60, 10);
INSERT INTO `item_mods` VALUES (15214, 61, 10);
INSERT INTO `item_mods` VALUES (15215, 1, 10);
INSERT INTO `item_mods` VALUES (15215, 54, 10);
INSERT INTO `item_mods` VALUES (15215, 55, 10);
INSERT INTO `item_mods` VALUES (15215, 56, 10);
INSERT INTO `item_mods` VALUES (15215, 57, 10);
INSERT INTO `item_mods` VALUES (15215, 58, -50);
INSERT INTO `item_mods` VALUES (15215, 59, 10);
INSERT INTO `item_mods` VALUES (15215, 60, 10);
INSERT INTO `item_mods` VALUES (15215, 61, 10);
INSERT INTO `item_mods` VALUES (15216, 1, 10);
INSERT INTO `item_mods` VALUES (15216, 54, 10);
INSERT INTO `item_mods` VALUES (15216, 55, -50);
INSERT INTO `item_mods` VALUES (15216, 56, 10);
INSERT INTO `item_mods` VALUES (15216, 57, 10);
INSERT INTO `item_mods` VALUES (15216, 58, 10);
INSERT INTO `item_mods` VALUES (15216, 59, 10);
INSERT INTO `item_mods` VALUES (15216, 60, 10);
INSERT INTO `item_mods` VALUES (15216, 61, 10);
INSERT INTO `item_mods` VALUES (15217, 1, 10);
INSERT INTO `item_mods` VALUES (15217, 54, 10);
INSERT INTO `item_mods` VALUES (15217, 55, 10);
INSERT INTO `item_mods` VALUES (15217, 56, 10);
INSERT INTO `item_mods` VALUES (15217, 57, 10);
INSERT INTO `item_mods` VALUES (15217, 58, 10);
INSERT INTO `item_mods` VALUES (15217, 59, 10);
INSERT INTO `item_mods` VALUES (15217, 60, -50);
INSERT INTO `item_mods` VALUES (15217, 61, 10);
INSERT INTO `item_mods` VALUES (15218, 1, 5);
INSERT INTO `item_mods` VALUES (15218, 14, 2);
INSERT INTO `item_mods` VALUES (15219, 1, 12);
INSERT INTO `item_mods` VALUES (15219, 8, 2);
INSERT INTO `item_mods` VALUES (15219, 10, -2);
INSERT INTO `item_mods` VALUES (15219, 12, 2);
INSERT INTO `item_mods` VALUES (15219, 13, -2);
INSERT INTO `item_mods` VALUES (15220, 5, 20);
INSERT INTO `item_mods` VALUES (15220, 13, 2);
INSERT INTO `item_mods` VALUES (15220, 14, 2);
INSERT INTO `item_mods` VALUES (15221, 1, 21);
INSERT INTO `item_mods` VALUES (15221, 8, 2);
INSERT INTO `item_mods` VALUES (15221, 27, -5);
INSERT INTO `item_mods` VALUES (15221, 68, -5);
INSERT INTO `item_mods` VALUES (15221, 384, 20);
INSERT INTO `item_mods` VALUES (15222, 25, -10);
INSERT INTO `item_mods` VALUES (15222, 26, -10);
INSERT INTO `item_mods` VALUES (15222, 68, -10);
INSERT INTO `item_mods` VALUES (15223, 1, 28);
INSERT INTO `item_mods` VALUES (15223, 8, 4);
INSERT INTO `item_mods` VALUES (15223, 25, 7);
INSERT INTO `item_mods` VALUES (15223, 68, -7);
INSERT INTO `item_mods` VALUES (15223, 384, 40);
INSERT INTO `item_mods` VALUES (15224, 2, -15);
INSERT INTO `item_mods` VALUES (15224, 9, 3);
INSERT INTO `item_mods` VALUES (15224, 11, 3);
INSERT INTO `item_mods` VALUES (15224, 68, 10);
INSERT INTO `item_mods` VALUES (15225, 1, 28);
INSERT INTO `item_mods` VALUES (15225, 2, 15);
INSERT INTO `item_mods` VALUES (15225, 9, 5);
INSERT INTO `item_mods` VALUES (15225, 10, 5);
INSERT INTO `item_mods` VALUES (15225, 27, 1);
INSERT INTO `item_mods` VALUES (15225, 72, 1);
INSERT INTO `item_mods` VALUES (15226, 1, 23);
INSERT INTO `item_mods` VALUES (15226, 2, 16);
INSERT INTO `item_mods` VALUES (15226, 13, 8);
INSERT INTO `item_mods` VALUES (15226, 72, 1);
INSERT INTO `item_mods` VALUES (15227, 1, 21);
INSERT INTO `item_mods` VALUES (15227, 5, 28);
INSERT INTO `item_mods` VALUES (15227, 13, 7);
INSERT INTO `item_mods` VALUES (15227, 27, -1);
INSERT INTO `item_mods` VALUES (15227, 71, 1);
INSERT INTO `item_mods` VALUES (15228, 1, 20);
INSERT INTO `item_mods` VALUES (15228, 5, 30);
INSERT INTO `item_mods` VALUES (15228, 12, 5);
INSERT INTO `item_mods` VALUES (15228, 27, -4);
INSERT INTO `item_mods` VALUES (15228, 71, 1);
INSERT INTO `item_mods` VALUES (15229, 1, 24);
INSERT INTO `item_mods` VALUES (15229, 5, 25);
INSERT INTO `item_mods` VALUES (15229, 12, 5);
INSERT INTO `item_mods` VALUES (15229, 115, 10);
INSERT INTO `item_mods` VALUES (15229, 170, 10);
INSERT INTO `item_mods` VALUES (15230, 1, 24);
INSERT INTO `item_mods` VALUES (15230, 2, 13);
INSERT INTO `item_mods` VALUES (15230, 9, 3);
INSERT INTO `item_mods` VALUES (15230, 26, 8);
INSERT INTO `item_mods` VALUES (15230, 68, 10);
INSERT INTO `item_mods` VALUES (15231, 1, 28);
INSERT INTO `item_mods` VALUES (15231, 2, 12);
INSERT INTO `item_mods` VALUES (15231, 13, 6);
INSERT INTO `item_mods` VALUES (15231, 27, 3);
INSERT INTO `item_mods` VALUES (15232, 1, 27);
INSERT INTO `item_mods` VALUES (15232, 2, 12);
INSERT INTO `item_mods` VALUES (15232, 5, 12);
INSERT INTO `item_mods` VALUES (15232, 8, 7);
INSERT INTO `item_mods` VALUES (15232, 116, 5);
INSERT INTO `item_mods` VALUES (15233, 1, 26);
INSERT INTO `item_mods` VALUES (15233, 2, 15);
INSERT INTO `item_mods` VALUES (15233, 12, 8);
INSERT INTO `item_mods` VALUES (15233, 13, 8);
INSERT INTO `item_mods` VALUES (15233, 360, 4);
INSERT INTO `item_mods` VALUES (15234, 1, 19);
INSERT INTO `item_mods` VALUES (15234, 2, 11);
INSERT INTO `item_mods` VALUES (15234, 13, 6);
INSERT INTO `item_mods` VALUES (15234, 14, 6);
INSERT INTO `item_mods` VALUES (15234, 27, -2);
INSERT INTO `item_mods` VALUES (15234, 110, 5);
INSERT INTO `item_mods` VALUES (15235, 1, 24);
INSERT INTO `item_mods` VALUES (15235, 2, 13);
INSERT INTO `item_mods` VALUES (15235, 11, 4);
INSERT INTO `item_mods` VALUES (15235, 12, 4);
INSERT INTO `item_mods` VALUES (15235, 24, 5);
INSERT INTO `item_mods` VALUES (15235, 359, 5);
INSERT INTO `item_mods` VALUES (15236, 1, 25);
INSERT INTO `item_mods` VALUES (15236, 2, 13);
INSERT INTO `item_mods` VALUES (15236, 8, 5);
INSERT INTO `item_mods` VALUES (15236, 13, 5);
INSERT INTO `item_mods` VALUES (15237, 1, 22);
INSERT INTO `item_mods` VALUES (15237, 2, 10);
INSERT INTO `item_mods` VALUES (15237, 11, 8);
INSERT INTO `item_mods` VALUES (15237, 14, 8);
INSERT INTO `item_mods` VALUES (15237, 68, 8);
INSERT INTO `item_mods` VALUES (15237, 118, 5);
INSERT INTO `item_mods` VALUES (15238, 1, 25);
INSERT INTO `item_mods` VALUES (15238, 2, 12);
INSERT INTO `item_mods` VALUES (15238, 10, 8);
INSERT INTO `item_mods` VALUES (15238, 13, 8);
INSERT INTO `item_mods` VALUES (15239, 1, 15);
INSERT INTO `item_mods` VALUES (15239, 5, 25);
INSERT INTO `item_mods` VALUES (15239, 12, 6);
INSERT INTO `item_mods` VALUES (15239, 13, 6);
INSERT INTO `item_mods` VALUES (15239, 117, 5);
INSERT INTO `item_mods` VALUES (15240, 1, 26);
INSERT INTO `item_mods` VALUES (15240, 2, 22);
INSERT INTO `item_mods` VALUES (15240, 5, 22);
INSERT INTO `item_mods` VALUES (15240, 25, 4);
INSERT INTO `item_mods` VALUES (15240, 30, 4);
INSERT INTO `item_mods` VALUES (15240, 384, 30);
INSERT INTO `item_mods` VALUES (15241, 1, 19);
INSERT INTO `item_mods` VALUES (15241, 27, -5);
INSERT INTO `item_mods` VALUES (15241, 30, 5);
INSERT INTO `item_mods` VALUES (15241, 168, 10);
INSERT INTO `item_mods` VALUES (15241, 384, 20);
INSERT INTO `item_mods` VALUES (15242, 1, 15);
INSERT INTO `item_mods` VALUES (15242, 27, -7);
INSERT INTO `item_mods` VALUES (15242, 68, 4);
INSERT INTO `item_mods` VALUES (15243, 1, 16);
INSERT INTO `item_mods` VALUES (15243, 27, -8);
INSERT INTO `item_mods` VALUES (15243, 68, 5);
INSERT INTO `item_mods` VALUES (15244, 1, 18);
INSERT INTO `item_mods` VALUES (15244, 60, 30);
INSERT INTO `item_mods` VALUES (15244, 61, 30);
INSERT INTO `item_mods` VALUES (15244, 224, 2);
INSERT INTO `item_mods` VALUES (15244, 225, 2);
INSERT INTO `item_mods` VALUES (15244, 226, 2);
INSERT INTO `item_mods` VALUES (15244, 227, 2);
INSERT INTO `item_mods` VALUES (15244, 228, 2);
INSERT INTO `item_mods` VALUES (15244, 229, 2);
INSERT INTO `item_mods` VALUES (15244, 230, 2);
INSERT INTO `item_mods` VALUES (15244, 231, 2);
INSERT INTO `item_mods` VALUES (15244, 232, 2);
INSERT INTO `item_mods` VALUES (15244, 233, 2);
INSERT INTO `item_mods` VALUES (15244, 234, 2);
INSERT INTO `item_mods` VALUES (15244, 240, 2);
INSERT INTO `item_mods` VALUES (15244, 241, 2);
INSERT INTO `item_mods` VALUES (15244, 242, 2);
INSERT INTO `item_mods` VALUES (15244, 243, 2);
INSERT INTO `item_mods` VALUES (15244, 244, 2);
INSERT INTO `item_mods` VALUES (15244, 245, 2);
INSERT INTO `item_mods` VALUES (15244, 246, 2);
INSERT INTO `item_mods` VALUES (15244, 247, 2);
INSERT INTO `item_mods` VALUES (15244, 248, 2);
INSERT INTO `item_mods` VALUES (15244, 249, 2);
INSERT INTO `item_mods` VALUES (15244, 250, 2);
INSERT INTO `item_mods` VALUES (15244, 251, 2);
INSERT INTO `item_mods` VALUES (15244, 252, 2);
INSERT INTO `item_mods` VALUES (15245, 1, 29);
INSERT INTO `item_mods` VALUES (15245, 9, 6);
INSERT INTO `item_mods` VALUES (15245, 27, 1);
INSERT INTO `item_mods` VALUES (15245, 110, 7);
INSERT INTO `item_mods` VALUES (15245, 483, 10);
INSERT INTO `item_mods` VALUES (15246, 1, 24);
INSERT INTO `item_mods` VALUES (15246, 3, 5);
INSERT INTO `item_mods` VALUES (15246, 8, 6);
INSERT INTO `item_mods` VALUES (15246, 27, -4);
INSERT INTO `item_mods` VALUES (15246, 289, 6);
INSERT INTO `item_mods` VALUES (15247, 1, 25);
INSERT INTO `item_mods` VALUES (15247, 5, 25);
INSERT INTO `item_mods` VALUES (15247, 10, 5);
INSERT INTO `item_mods` VALUES (15247, 27, -5);
INSERT INTO `item_mods` VALUES (15247, 244, 2);
INSERT INTO `item_mods` VALUES (15248, 1, 24);
INSERT INTO `item_mods` VALUES (15248, 5, 29);
INSERT INTO `item_mods` VALUES (15248, 27, -3);
INSERT INTO `item_mods` VALUES (15248, 114, 5);
INSERT INTO `item_mods` VALUES (15248, 115, 10);
INSERT INTO `item_mods` VALUES (15249, 1, 25);
INSERT INTO `item_mods` VALUES (15249, 2, 14);
INSERT INTO `item_mods` VALUES (15249, 5, 14);
INSERT INTO `item_mods` VALUES (15249, 13, 3);
INSERT INTO `item_mods` VALUES (15249, 114, 15);
INSERT INTO `item_mods` VALUES (15249, 369, 1);
INSERT INTO `item_mods` VALUES (15250, 1, 25);
INSERT INTO `item_mods` VALUES (15250, 2, 16);
INSERT INTO `item_mods` VALUES (15250, 9, 6);
INSERT INTO `item_mods` VALUES (15250, 27, 3);
INSERT INTO `item_mods` VALUES (15251, 1, 29);
INSERT INTO `item_mods` VALUES (15251, 2, 18);
INSERT INTO `item_mods` VALUES (15251, 5, 18);
INSERT INTO `item_mods` VALUES (15251, 27, 4);
INSERT INTO `item_mods` VALUES (15251, 112, 10);
INSERT INTO `item_mods` VALUES (15252, 1, 28);
INSERT INTO `item_mods` VALUES (15252, 2, 30);
INSERT INTO `item_mods` VALUES (15252, 10, 8);
INSERT INTO `item_mods` VALUES (15252, 23, 12);
INSERT INTO `item_mods` VALUES (15252, 242, 3);
INSERT INTO `item_mods` VALUES (15253, 1, 27);
INSERT INTO `item_mods` VALUES (15253, 2, 19);
INSERT INTO `item_mods` VALUES (15253, 5, 19);
INSERT INTO `item_mods` VALUES (15253, 14, 5);
INSERT INTO `item_mods` VALUES (15253, 110, 3);
INSERT INTO `item_mods` VALUES (15253, 360, 5);
INSERT INTO `item_mods` VALUES (15254, 1, 20);
INSERT INTO `item_mods` VALUES (15254, 2, 13);
INSERT INTO `item_mods` VALUES (15254, 14, 6);
INSERT INTO `item_mods` VALUES (15254, 27, -4);
INSERT INTO `item_mods` VALUES (15254, 119, 5);
INSERT INTO `item_mods` VALUES (15255, 1, 25);
INSERT INTO `item_mods` VALUES (15255, 2, 15);
INSERT INTO `item_mods` VALUES (15255, 13, 5);
INSERT INTO `item_mods` VALUES (15255, 27, -4);
INSERT INTO `item_mods` VALUES (15255, 305, 5);
INSERT INTO `item_mods` VALUES (15256, 1, 26);
INSERT INTO `item_mods` VALUES (15256, 2, 20);
INSERT INTO `item_mods` VALUES (15256, 25, 12);
INSERT INTO `item_mods` VALUES (15256, 26, 7);
INSERT INTO `item_mods` VALUES (15256, 27, 1);
INSERT INTO `item_mods` VALUES (15257, 1, 23);
INSERT INTO `item_mods` VALUES (15257, 2, 27);
INSERT INTO `item_mods` VALUES (15258, 1, 26);
INSERT INTO `item_mods` VALUES (15258, 2, 16);
INSERT INTO `item_mods` VALUES (15258, 8, 5);
INSERT INTO `item_mods` VALUES (15258, 23, 2);
INSERT INTO `item_mods` VALUES (15258, 402, 30);
INSERT INTO `item_mods` VALUES (15259, 1, 19);
INSERT INTO `item_mods` VALUES (15259, 5, 30);
INSERT INTO `item_mods` VALUES (15259, 12, 4);
INSERT INTO `item_mods` VALUES (15259, 356, 3);
INSERT INTO `item_mods` VALUES (15259, 372, 3);
INSERT INTO `item_mods` VALUES (15260, 1, 24);
INSERT INTO `item_mods` VALUES (15260, 25, 3);
INSERT INTO `item_mods` VALUES (15260, 27, -8);
INSERT INTO `item_mods` VALUES (15260, 68, 3);
INSERT INTO `item_mods` VALUES (15260, 71, 2);
INSERT INTO `item_mods` VALUES (15261, 1, 24);
INSERT INTO `item_mods` VALUES (15262, 1, 25);
INSERT INTO `item_mods` VALUES (15262, 2, -20);
INSERT INTO `item_mods` VALUES (15262, 5, 20);
INSERT INTO `item_mods` VALUES (15262, 25, 5);
INSERT INTO `item_mods` VALUES (15262, 27, 7);
INSERT INTO `item_mods` VALUES (15263, 1, 28);
INSERT INTO `item_mods` VALUES (15264, 1, 32);
INSERT INTO `item_mods` VALUES (15264, 27, 8);
INSERT INTO `item_mods` VALUES (15264, 233, 2);
INSERT INTO `item_mods` VALUES (15265, 1, 23);
INSERT INTO `item_mods` VALUES (15265, 5, 20);
INSERT INTO `item_mods` VALUES (15265, 12, 3);
INSERT INTO `item_mods` VALUES (15265, 13, 3);
INSERT INTO `item_mods` VALUES (15266, 1, 22);
INSERT INTO `item_mods` VALUES (15266, 2, 8);
INSERT INTO `item_mods` VALUES (15266, 8, 2);
INSERT INTO `item_mods` VALUES (15266, 26, 8);
INSERT INTO `item_mods` VALUES (15267, 1, 15);
INSERT INTO `item_mods` VALUES (15267, 2, 10);
INSERT INTO `item_mods` VALUES (15267, 9, 3);
INSERT INTO `item_mods` VALUES (15267, 13, 3);
INSERT INTO `item_mods` VALUES (15268, 2, -1);
INSERT INTO `item_mods` VALUES (15268, 5, 3);
INSERT INTO `item_mods` VALUES (15268, 61, 2);
INSERT INTO `item_mods` VALUES (15269, 2, -4);
INSERT INTO `item_mods` VALUES (15269, 5, 12);
INSERT INTO `item_mods` VALUES (15269, 57, 8);
INSERT INTO `item_mods` VALUES (15270, 2, 30);
INSERT INTO `item_mods` VALUES (15270, 5, 30);
INSERT INTO `item_mods` VALUES (15270, 384, 51);
INSERT INTO `item_mods` VALUES (15286, 1, 3);
INSERT INTO `item_mods` VALUES (15286, 25, 5);
INSERT INTO `item_mods` VALUES (15286, 68, -5);
INSERT INTO `item_mods` VALUES (15287, 1, 3);
INSERT INTO `item_mods` VALUES (15287, 4, 10);
INSERT INTO `item_mods` VALUES (15287, 8, -1);
INSERT INTO `item_mods` VALUES (15287, 12, 1);
INSERT INTO `item_mods` VALUES (15287, 13, 1);
INSERT INTO `item_mods` VALUES (15290, 1, 4);
INSERT INTO `item_mods` VALUES (15291, 1, 2);
INSERT INTO `item_mods` VALUES (15291, 5, 10);
INSERT INTO `item_mods` VALUES (15292, 1, 4);
INSERT INTO `item_mods` VALUES (15292, 2, -20);
INSERT INTO `item_mods` VALUES (15292, 12, 5);
INSERT INTO `item_mods` VALUES (15292, 13, 5);
INSERT INTO `item_mods` VALUES (15292, 27, -3);
INSERT INTO `item_mods` VALUES (15293, 1, 5);
INSERT INTO `item_mods` VALUES (15293, 14, 6);
INSERT INTO `item_mods` VALUES (15293, 25, 8);
INSERT INTO `item_mods` VALUES (15294, 1, 6);
INSERT INTO `item_mods` VALUES (15294, 8, 5);
INSERT INTO `item_mods` VALUES (15294, 9, 5);
INSERT INTO `item_mods` VALUES (15294, 10, 5);
INSERT INTO `item_mods` VALUES (15294, 27, 3);
INSERT INTO `item_mods` VALUES (15295, 1, 3);
INSERT INTO `item_mods` VALUES (15295, 5, 48);
INSERT INTO `item_mods` VALUES (15295, 71, 2);
INSERT INTO `item_mods` VALUES (15295, 72, 2);
INSERT INTO `item_mods` VALUES (15296, 1, 3);
INSERT INTO `item_mods` VALUES (15300, 1, 5);
INSERT INTO `item_mods` VALUES (15301, 1, 5);
INSERT INTO `item_mods` VALUES (15301, 2, 12);
INSERT INTO `item_mods` VALUES (15301, 23, 5);
INSERT INTO `item_mods` VALUES (15301, 24, 5);
INSERT INTO `item_mods` VALUES (15302, 1, 6);
INSERT INTO `item_mods` VALUES (15302, 2, -40);
INSERT INTO `item_mods` VALUES (15302, 11, 4);
INSERT INTO `item_mods` VALUES (15302, 68, 10);
INSERT INTO `item_mods` VALUES (15303, 1, 18);
INSERT INTO `item_mods` VALUES (15303, 5, 11);
INSERT INTO `item_mods` VALUES (15303, 14, 4);
INSERT INTO `item_mods` VALUES (15303, 384, 11);
INSERT INTO `item_mods` VALUES (15304, 1, 19);
INSERT INTO `item_mods` VALUES (15304, 5, 12);
INSERT INTO `item_mods` VALUES (15304, 14, 5);
INSERT INTO `item_mods` VALUES (15304, 384, 20);
INSERT INTO `item_mods` VALUES (15305, 1, 19);
INSERT INTO `item_mods` VALUES (15305, 8, 2);
INSERT INTO `item_mods` VALUES (15305, 23, 5);
INSERT INTO `item_mods` VALUES (15305, 27, 2);
INSERT INTO `item_mods` VALUES (15305, 110, 3);
INSERT INTO `item_mods` VALUES (15306, 1, 20);
INSERT INTO `item_mods` VALUES (15306, 8, 3);
INSERT INTO `item_mods` VALUES (15306, 23, 6);
INSERT INTO `item_mods` VALUES (15306, 27, 3);
INSERT INTO `item_mods` VALUES (15306, 110, 4);
INSERT INTO `item_mods` VALUES (15307, 1, 13);
INSERT INTO `item_mods` VALUES (15307, 5, 7);
INSERT INTO `item_mods` VALUES (15307, 23, 5);
INSERT INTO `item_mods` VALUES (15307, 27, -1);
INSERT INTO `item_mods` VALUES (15308, 1, 14);
INSERT INTO `item_mods` VALUES (15308, 5, 8);
INSERT INTO `item_mods` VALUES (15308, 23, 6);
INSERT INTO `item_mods` VALUES (15308, 27, -2);
INSERT INTO `item_mods` VALUES (15309, 1, 15);
INSERT INTO `item_mods` VALUES (15309, 27, 2);
INSERT INTO `item_mods` VALUES (15309, 113, 8);
INSERT INTO `item_mods` VALUES (15309, 116, 4);
INSERT INTO `item_mods` VALUES (15309, 296, 4);
INSERT INTO `item_mods` VALUES (15310, 1, 16);
INSERT INTO `item_mods` VALUES (15310, 27, 3);
INSERT INTO `item_mods` VALUES (15310, 113, 9);
INSERT INTO `item_mods` VALUES (15310, 116, 5);
INSERT INTO `item_mods` VALUES (15310, 296, 5);
INSERT INTO `item_mods` VALUES (15311, 1, 4);
INSERT INTO `item_mods` VALUES (15311, 9, 1);
INSERT INTO `item_mods` VALUES (15311, 61, 1);
INSERT INTO `item_mods` VALUES (15312, 1, 7);
INSERT INTO `item_mods` VALUES (15313, 1, 6);
INSERT INTO `item_mods` VALUES (15313, 5, 4);
INSERT INTO `item_mods` VALUES (15313, 13, 1);
INSERT INTO `item_mods` VALUES (15314, 1, 7);
INSERT INTO `item_mods` VALUES (15315, 1, 6);
INSERT INTO `item_mods` VALUES (15315, 235, 2);
INSERT INTO `item_mods` VALUES (15316, 1, 7);
INSERT INTO `item_mods` VALUES (15316, 5, 5);
INSERT INTO `item_mods` VALUES (15316, 13, 2);
INSERT INTO `item_mods` VALUES (15317, 1, 8);
INSERT INTO `item_mods` VALUES (15317, 10, 2);
INSERT INTO `item_mods` VALUES (15318, 1, 8);
INSERT INTO `item_mods` VALUES (15319, 1, 7);
INSERT INTO `item_mods` VALUES (15319, 68, 1);
INSERT INTO `item_mods` VALUES (15319, 235, 2);
INSERT INTO `item_mods` VALUES (15320, 1, 9);
INSERT INTO `item_mods` VALUES (15321, 1, 9);
INSERT INTO `item_mods` VALUES (15321, 10, 3);
INSERT INTO `item_mods` VALUES (15322, 1, 16);
INSERT INTO `item_mods` VALUES (15322, 5, 12);
INSERT INTO `item_mods` VALUES (15322, 68, 8);
INSERT INTO `item_mods` VALUES (15322, 169, 12);
INSERT INTO `item_mods` VALUES (15323, 1, 14);
INSERT INTO `item_mods` VALUES (15324, 1, 11);
INSERT INTO `item_mods` VALUES (15325, 1, 11);
INSERT INTO `item_mods` VALUES (15325, 5, 20);
INSERT INTO `item_mods` VALUES (15325, 13, 2);
INSERT INTO `item_mods` VALUES (15325, 27, -2);
INSERT INTO `item_mods` VALUES (15326, 1, 7);
INSERT INTO `item_mods` VALUES (15327, 1, 21);
INSERT INTO `item_mods` VALUES (15327, 2, 12);
INSERT INTO `item_mods` VALUES (15327, 11, 3);
INSERT INTO `item_mods` VALUES (15327, 384, 30);
INSERT INTO `item_mods` VALUES (15328, 1, 18);
INSERT INTO `item_mods` VALUES (15328, 2, 35);
INSERT INTO `item_mods` VALUES (15329, 1, 14);
INSERT INTO `item_mods` VALUES (15329, 5, 17);
INSERT INTO `item_mods` VALUES (15329, 13, 3);
INSERT INTO `item_mods` VALUES (15329, 27, -4);
INSERT INTO `item_mods` VALUES (15329, 384, 20);
INSERT INTO `item_mods` VALUES (15330, 1, 17);
INSERT INTO `item_mods` VALUES (15330, 8, 2);
INSERT INTO `item_mods` VALUES (15330, 48, 2);
INSERT INTO `item_mods` VALUES (15330, 73, 5);
INSERT INTO `item_mods` VALUES (15331, 1, 15);
INSERT INTO `item_mods` VALUES (15331, 5, 20);
INSERT INTO `item_mods` VALUES (15331, 13, 4);
INSERT INTO `item_mods` VALUES (15331, 27, -5);
INSERT INTO `item_mods` VALUES (15331, 384, 30);
INSERT INTO `item_mods` VALUES (15332, 1, 18);
INSERT INTO `item_mods` VALUES (15332, 8, 3);
INSERT INTO `item_mods` VALUES (15332, 48, 3);
INSERT INTO `item_mods` VALUES (15332, 73, 6);
INSERT INTO `item_mods` VALUES (15333, 1, 16);
INSERT INTO `item_mods` VALUES (15333, 4, 10);
INSERT INTO `item_mods` VALUES (15333, 10, 1);
INSERT INTO `item_mods` VALUES (15333, 14, 1);
INSERT INTO `item_mods` VALUES (15333, 60, 2);
INSERT INTO `item_mods` VALUES (15333, 61, 2);
INSERT INTO `item_mods` VALUES (15333, 71, 3);
INSERT INTO `item_mods` VALUES (15334, 1, 14);
INSERT INTO `item_mods` VALUES (15334, 12, 4);
INSERT INTO `item_mods` VALUES (15334, 25, 2);
INSERT INTO `item_mods` VALUES (15334, 26, 3);
INSERT INTO `item_mods` VALUES (15334, 27, -1);
INSERT INTO `item_mods` VALUES (15335, 1, 15);
INSERT INTO `item_mods` VALUES (15335, 12, 5);
INSERT INTO `item_mods` VALUES (15335, 25, 3);
INSERT INTO `item_mods` VALUES (15335, 26, 4);
INSERT INTO `item_mods` VALUES (15335, 27, -2);
INSERT INTO `item_mods` VALUES (15336, 1, 14);
INSERT INTO `item_mods` VALUES (15336, 2, 12);
INSERT INTO `item_mods` VALUES (15336, 12, 4);
INSERT INTO `item_mods` VALUES (15336, 27, 3);
INSERT INTO `item_mods` VALUES (15336, 168, 6);
INSERT INTO `item_mods` VALUES (15337, 1, 17);
INSERT INTO `item_mods` VALUES (15337, 2, 10);
INSERT INTO `item_mods` VALUES (15337, 10, 2);
INSERT INTO `item_mods` VALUES (15337, 14, 2);
INSERT INTO `item_mods` VALUES (15337, 60, 3);
INSERT INTO `item_mods` VALUES (15337, 61, 3);
INSERT INTO `item_mods` VALUES (15337, 71, 4);
INSERT INTO `item_mods` VALUES (15338, 1, 11);
INSERT INTO `item_mods` VALUES (15339, 1, 13);
INSERT INTO `item_mods` VALUES (15339, 8, 3);
INSERT INTO `item_mods` VALUES (15339, 23, 8);
INSERT INTO `item_mods` VALUES (15339, 160, 8);
INSERT INTO `item_mods` VALUES (15340, 1, 14);
INSERT INTO `item_mods` VALUES (15340, 8, 4);
INSERT INTO `item_mods` VALUES (15340, 23, 10);
INSERT INTO `item_mods` VALUES (15340, 160, 9);
INSERT INTO `item_mods` VALUES (15341, 1, 8);
INSERT INTO `item_mods` VALUES (15342, 1, 8);
INSERT INTO `item_mods` VALUES (15342, 8, 1);
INSERT INTO `item_mods` VALUES (15342, 9, 1);
INSERT INTO `item_mods` VALUES (15342, 23, 1);
INSERT INTO `item_mods` VALUES (15342, 25, 1);
INSERT INTO `item_mods` VALUES (15342, 68, -2);
INSERT INTO `item_mods` VALUES (15343, 1, 4);
INSERT INTO `item_mods` VALUES (15344, 1, 5);
INSERT INTO `item_mods` VALUES (15344, 5, 3);
INSERT INTO `item_mods` VALUES (15345, 1, 24);
INSERT INTO `item_mods` VALUES (15345, 2, 30);
INSERT INTO `item_mods` VALUES (15345, 8, 3);
INSERT INTO `item_mods` VALUES (15346, 1, 26);
INSERT INTO `item_mods` VALUES (15346, 2, 34);
INSERT INTO `item_mods` VALUES (15346, 8, 4);
INSERT INTO `item_mods` VALUES (15347, 1, 9);
INSERT INTO `item_mods` VALUES (15348, 1, 7);
INSERT INTO `item_mods` VALUES (15348, 8, 1);
INSERT INTO `item_mods` VALUES (15348, 12, 2);
INSERT INTO `item_mods` VALUES (15348, 68, 2);
INSERT INTO `item_mods` VALUES (15348, 168, 5);
INSERT INTO `item_mods` VALUES (15349, 1, 16);
INSERT INTO `item_mods` VALUES (15349, 8, 3);
INSERT INTO `item_mods` VALUES (15349, 10, 2);
INSERT INTO `item_mods` VALUES (15349, 23, 5);
INSERT INTO `item_mods` VALUES (15349, 384, -20);
INSERT INTO `item_mods` VALUES (15350, 1, 20);
INSERT INTO `item_mods` VALUES (15350, 2, -30);
INSERT INTO `item_mods` VALUES (15350, 5, 30);
INSERT INTO `item_mods` VALUES (15350, 12, 3);
INSERT INTO `item_mods` VALUES (15350, 13, 3);
INSERT INTO `item_mods` VALUES (15350, 170, 2);
INSERT INTO `item_mods` VALUES (15351, 1, 3);
INSERT INTO `item_mods` VALUES (15351, 9, 3);
INSERT INTO `item_mods` VALUES (15351, 11, 3);
INSERT INTO `item_mods` VALUES (15352, 1, 19);
INSERT INTO `item_mods` VALUES (15352, 2, 12);
INSERT INTO `item_mods` VALUES (15352, 10, 3);
INSERT INTO `item_mods` VALUES (15352, 11, 3);
INSERT INTO `item_mods` VALUES (15352, 27, 1);
INSERT INTO `item_mods` VALUES (15352, 288, 1);
INSERT INTO `item_mods` VALUES (15353, 1, 15);
INSERT INTO `item_mods` VALUES (15353, 2, 12);
INSERT INTO `item_mods` VALUES (15353, 9, 5);
INSERT INTO `item_mods` VALUES (15353, 13, 5);
INSERT INTO `item_mods` VALUES (15353, 68, 10);
INSERT INTO `item_mods` VALUES (15354, 1, 12);
INSERT INTO `item_mods` VALUES (15354, 5, 15);
INSERT INTO `item_mods` VALUES (15354, 11, 5);
INSERT INTO `item_mods` VALUES (15354, 12, 5);
INSERT INTO `item_mods` VALUES (15354, 71, 1);
INSERT INTO `item_mods` VALUES (15354, 168, 25);
INSERT INTO `item_mods` VALUES (15355, 1, 11);
INSERT INTO `item_mods` VALUES (15355, 5, 15);
INSERT INTO `item_mods` VALUES (15355, 11, 5);
INSERT INTO `item_mods` VALUES (15355, 13, 5);
INSERT INTO `item_mods` VALUES (15355, 71, 1);
INSERT INTO `item_mods` VALUES (15355, 168, 20);
INSERT INTO `item_mods` VALUES (15356, 1, 15);
INSERT INTO `item_mods` VALUES (15356, 5, 16);
INSERT INTO `item_mods` VALUES (15356, 11, 3);
INSERT INTO `item_mods` VALUES (15356, 12, 3);
INSERT INTO `item_mods` VALUES (15356, 13, 3);
INSERT INTO `item_mods` VALUES (15356, 109, 10);
INSERT INTO `item_mods` VALUES (15357, 1, 15);
INSERT INTO `item_mods` VALUES (15357, 9, 3);
INSERT INTO `item_mods` VALUES (15357, 26, 5);
INSERT INTO `item_mods` VALUES (15357, 298, 2);
INSERT INTO `item_mods` VALUES (15358, 1, 19);
INSERT INTO `item_mods` VALUES (15358, 2, 20);
INSERT INTO `item_mods` VALUES (15358, 14, 5);
INSERT INTO `item_mods` VALUES (15358, 109, 12);
INSERT INTO `item_mods` VALUES (15359, 1, 17);
INSERT INTO `item_mods` VALUES (15359, 2, 15);
INSERT INTO `item_mods` VALUES (15359, 5, 15);
INSERT INTO `item_mods` VALUES (15359, 8, 5);
INSERT INTO `item_mods` VALUES (15359, 13, 5);
INSERT INTO `item_mods` VALUES (15360, 1, 14);
INSERT INTO `item_mods` VALUES (15360, 2, 11);
INSERT INTO `item_mods` VALUES (15360, 11, 5);
INSERT INTO `item_mods` VALUES (15360, 14, 5);
INSERT INTO `item_mods` VALUES (15360, 360, 2);
INSERT INTO `item_mods` VALUES (15360, 364, 11);
INSERT INTO `item_mods` VALUES (15361, 1, 14);
INSERT INTO `item_mods` VALUES (15361, 2, 10);
INSERT INTO `item_mods` VALUES (15361, 9, 5);
INSERT INTO `item_mods` VALUES (15361, 11, 5);
INSERT INTO `item_mods` VALUES (15361, 68, 5);
INSERT INTO `item_mods` VALUES (15361, 71, 2);
INSERT INTO `item_mods` VALUES (15361, 72, 2);
INSERT INTO `item_mods` VALUES (15362, 1, 16);
INSERT INTO `item_mods` VALUES (15362, 2, 10);
INSERT INTO `item_mods` VALUES (15362, 9, 6);
INSERT INTO `item_mods` VALUES (15362, 11, 6);
INSERT INTO `item_mods` VALUES (15362, 68, 5);
INSERT INTO `item_mods` VALUES (15363, 1, 18);
INSERT INTO `item_mods` VALUES (15363, 2, 20);
INSERT INTO `item_mods` VALUES (15363, 23, 8);
INSERT INTO `item_mods` VALUES (15363, 27, 5);
INSERT INTO `item_mods` VALUES (15363, 306, 1);
INSERT INTO `item_mods` VALUES (15364, 1, 15);
INSERT INTO `item_mods` VALUES (15364, 2, 12);
INSERT INTO `item_mods` VALUES (15364, 11, 6);
INSERT INTO `item_mods` VALUES (15364, 12, 6);
INSERT INTO `item_mods` VALUES (15365, 1, 16);
INSERT INTO `item_mods` VALUES (15365, 2, 12);
INSERT INTO `item_mods` VALUES (15365, 9, 5);
INSERT INTO `item_mods` VALUES (15365, 11, 5);
INSERT INTO `item_mods` VALUES (15365, 108, 10);
INSERT INTO `item_mods` VALUES (15365, 362, 10);
INSERT INTO `item_mods` VALUES (15366, 1, 10);
INSERT INTO `item_mods` VALUES (15366, 5, 25);
INSERT INTO `item_mods` VALUES (15366, 346, 1);
INSERT INTO `item_mods` VALUES (15367, 1, 27);
INSERT INTO `item_mods` VALUES (15368, 1, 20);
INSERT INTO `item_mods` VALUES (15368, 23, 2);
INSERT INTO `item_mods` VALUES (15368, 25, 1);
INSERT INTO `item_mods` VALUES (15368, 68, 2);
INSERT INTO `item_mods` VALUES (15369, 1, 20);
INSERT INTO `item_mods` VALUES (15369, 291, 2);
INSERT INTO `item_mods` VALUES (15370, 1, 24);
INSERT INTO `item_mods` VALUES (15370, 23, 1);
INSERT INTO `item_mods` VALUES (15371, 1, 27);
INSERT INTO `item_mods` VALUES (15371, 14, 3);
INSERT INTO `item_mods` VALUES (15372, 1, 16);
INSERT INTO `item_mods` VALUES (15372, 12, 2);
INSERT INTO `item_mods` VALUES (15372, 13, 2);
INSERT INTO `item_mods` VALUES (15373, 1, 20);
INSERT INTO `item_mods` VALUES (15373, 26, 3);
INSERT INTO `item_mods` VALUES (15373, 384, 20);
INSERT INTO `item_mods` VALUES (15374, 1, 24);
INSERT INTO `item_mods` VALUES (15374, 112, 5);
INSERT INTO `item_mods` VALUES (15374, 115, 5);
INSERT INTO `item_mods` VALUES (15375, 1, 23);
INSERT INTO `item_mods` VALUES (15375, 296, 1);
INSERT INTO `item_mods` VALUES (15376, 1, 23);
INSERT INTO `item_mods` VALUES (15376, 11, 1);
INSERT INTO `item_mods` VALUES (15377, 1, 23);
INSERT INTO `item_mods` VALUES (15377, 26, 1);
INSERT INTO `item_mods` VALUES (15378, 1, 23);
INSERT INTO `item_mods` VALUES (15378, 73, 1);
INSERT INTO `item_mods` VALUES (15379, 1, 23);
INSERT INTO `item_mods` VALUES (15380, 1, 23);
INSERT INTO `item_mods` VALUES (15380, 24, 1);
INSERT INTO `item_mods` VALUES (15381, 1, 23);
INSERT INTO `item_mods` VALUES (15381, 71, 1);
INSERT INTO `item_mods` VALUES (15382, 1, 23);
INSERT INTO `item_mods` VALUES (15382, 5, 10);
INSERT INTO `item_mods` VALUES (15383, 1, 23);
INSERT INTO `item_mods` VALUES (15383, 23, 1);
INSERT INTO `item_mods` VALUES (15384, 1, 23);
INSERT INTO `item_mods` VALUES (15384, 72, 1);
INSERT INTO `item_mods` VALUES (15385, 1, 23);
INSERT INTO `item_mods` VALUES (15385, 10, 1);
INSERT INTO `item_mods` VALUES (15386, 1, 24);
INSERT INTO `item_mods` VALUES (15386, 2, 10);
INSERT INTO `item_mods` VALUES (15387, 1, 32);
INSERT INTO `item_mods` VALUES (15387, 23, 6);
INSERT INTO `item_mods` VALUES (15387, 24, 6);
INSERT INTO `item_mods` VALUES (15387, 26, 4);
INSERT INTO `item_mods` VALUES (15388, 1, 23);
INSERT INTO `item_mods` VALUES (15388, 14, 1);
INSERT INTO `item_mods` VALUES (15389, 1, 30);
INSERT INTO `item_mods` VALUES (15389, 60, 9);
INSERT INTO `item_mods` VALUES (15390, 1, 30);
INSERT INTO `item_mods` VALUES (15390, 60, 9);
INSERT INTO `item_mods` VALUES (15391, 1, 32);
INSERT INTO `item_mods` VALUES (15391, 5, 25);
INSERT INTO `item_mods` VALUES (15391, 13, 6);
INSERT INTO `item_mods` VALUES (15391, 27, -5);
INSERT INTO `item_mods` VALUES (15391, 384, 30);
INSERT INTO `item_mods` VALUES (15392, 1, 36);
INSERT INTO `item_mods` VALUES (15392, 48, 6);
INSERT INTO `item_mods` VALUES (15393, 1, 33);
INSERT INTO `item_mods` VALUES (15393, 5, 30);
INSERT INTO `item_mods` VALUES (15393, 13, 7);
INSERT INTO `item_mods` VALUES (15393, 27, -6);
INSERT INTO `item_mods` VALUES (15393, 384, 40);
INSERT INTO `item_mods` VALUES (15394, 1, 37);
INSERT INTO `item_mods` VALUES (15394, 48, 7);
INSERT INTO `item_mods` VALUES (15395, 1, 38);
INSERT INTO `item_mods` VALUES (15395, 4, 12);
INSERT INTO `item_mods` VALUES (15395, 10, 2);
INSERT INTO `item_mods` VALUES (15395, 27, 2);
INSERT INTO `item_mods` VALUES (15395, 60, 2);
INSERT INTO `item_mods` VALUES (15395, 61, 2);
INSERT INTO `item_mods` VALUES (15396, 1, 32);
INSERT INTO `item_mods` VALUES (15396, 5, 17);
INSERT INTO `item_mods` VALUES (15396, 25, 1);
INSERT INTO `item_mods` VALUES (15396, 27, -4);
INSERT INTO `item_mods` VALUES (15396, 30, 2);
INSERT INTO `item_mods` VALUES (15397, 1, 33);
INSERT INTO `item_mods` VALUES (15397, 5, 20);
INSERT INTO `item_mods` VALUES (15397, 25, 2);
INSERT INTO `item_mods` VALUES (15397, 27, -5);
INSERT INTO `item_mods` VALUES (15397, 30, 3);
INSERT INTO `item_mods` VALUES (15398, 1, 32);
INSERT INTO `item_mods` VALUES (15398, 2, 30);
INSERT INTO `item_mods` VALUES (15398, 12, 3);
INSERT INTO `item_mods` VALUES (15398, 27, 3);
INSERT INTO `item_mods` VALUES (15398, 168, 3);
INSERT INTO `item_mods` VALUES (15399, 1, 39);
INSERT INTO `item_mods` VALUES (15399, 2, 12);
INSERT INTO `item_mods` VALUES (15399, 10, 3);
INSERT INTO `item_mods` VALUES (15399, 27, 3);
INSERT INTO `item_mods` VALUES (15399, 60, 3);
INSERT INTO `item_mods` VALUES (15399, 61, 3);
INSERT INTO `item_mods` VALUES (15400, 1, 29);
INSERT INTO `item_mods` VALUES (15400, 8, 4);
INSERT INTO `item_mods` VALUES (15400, 23, 14);
INSERT INTO `item_mods` VALUES (15400, 160, 13);
INSERT INTO `item_mods` VALUES (15401, 1, 30);
INSERT INTO `item_mods` VALUES (15401, 8, 5);
INSERT INTO `item_mods` VALUES (15401, 23, 16);
INSERT INTO `item_mods` VALUES (15401, 160, 14);
INSERT INTO `item_mods` VALUES (15402, 1, 22);
INSERT INTO `item_mods` VALUES (15403, 1, 22);
INSERT INTO `item_mods` VALUES (15403, 8, 1);
INSERT INTO `item_mods` VALUES (15403, 9, 1);
INSERT INTO `item_mods` VALUES (15403, 11, -2);
INSERT INTO `item_mods` VALUES (15403, 23, 2);
INSERT INTO `item_mods` VALUES (15403, 25, 1);
INSERT INTO `item_mods` VALUES (15404, 1, 10);
INSERT INTO `item_mods` VALUES (15405, 1, 11);
INSERT INTO `item_mods` VALUES (15405, 71, 1);
INSERT INTO `item_mods` VALUES (15406, 1, 49);
INSERT INTO `item_mods` VALUES (15406, 2, 42);
INSERT INTO `item_mods` VALUES (15406, 9, 4);
INSERT INTO `item_mods` VALUES (15407, 1, 51);
INSERT INTO `item_mods` VALUES (15407, 2, 46);
INSERT INTO `item_mods` VALUES (15407, 9, 5);
INSERT INTO `item_mods` VALUES (15408, 1, 1);
INSERT INTO `item_mods` VALUES (15409, 1, 1);
INSERT INTO `item_mods` VALUES (15410, 1, 1);
INSERT INTO `item_mods` VALUES (15411, 1, 1);
INSERT INTO `item_mods` VALUES (15412, 1, 1);
INSERT INTO `item_mods` VALUES (15413, 1, 1);
INSERT INTO `item_mods` VALUES (15414, 1, 1);
INSERT INTO `item_mods` VALUES (15415, 1, 2);
INSERT INTO `item_mods` VALUES (15415, 510, 1);
INSERT INTO `item_mods` VALUES (15416, 1, 2);
INSERT INTO `item_mods` VALUES (15416, 510, 1);
INSERT INTO `item_mods` VALUES (15417, 1, 2);
INSERT INTO `item_mods` VALUES (15417, 510, 1);
INSERT INTO `item_mods` VALUES (15418, 1, 2);
INSERT INTO `item_mods` VALUES (15418, 510, 1);
INSERT INTO `item_mods` VALUES (15419, 1, 2);
INSERT INTO `item_mods` VALUES (15419, 510, 1);
INSERT INTO `item_mods` VALUES (15420, 1, 2);
INSERT INTO `item_mods` VALUES (15420, 510, 1);
INSERT INTO `item_mods` VALUES (15421, 1, 2);
INSERT INTO `item_mods` VALUES (15421, 510, 1);
INSERT INTO `item_mods` VALUES (15422, 1, 16);
INSERT INTO `item_mods` VALUES (15422, 8, 1);
INSERT INTO `item_mods` VALUES (15422, 27, 1);
INSERT INTO `item_mods` VALUES (15423, 1, 1);
INSERT INTO `item_mods` VALUES (15424, 1, 2);
INSERT INTO `item_mods` VALUES (15424, 510, 1);
INSERT INTO `item_mods` VALUES (15425, 1, 30);
INSERT INTO `item_mods` VALUES (15425, 2, 20);
INSERT INTO `item_mods` VALUES (15425, 8, 2);
INSERT INTO `item_mods` VALUES (15425, 9, -2);
INSERT INTO `item_mods` VALUES (15425, 10, 2);
INSERT INTO `item_mods` VALUES (15425, 11, -2);
INSERT INTO `item_mods` VALUES (15425, 12, -2);
INSERT INTO `item_mods` VALUES (15425, 13, -2);
INSERT INTO `item_mods` VALUES (15425, 14, -2);
INSERT INTO `item_mods` VALUES (15425, 25, 5);
INSERT INTO `item_mods` VALUES (15425, 26, 5);
INSERT INTO `item_mods` VALUES (15429, 1, 26);
INSERT INTO `item_mods` VALUES (15429, 8, -4);
INSERT INTO `item_mods` VALUES (15429, 9, -4);
INSERT INTO `item_mods` VALUES (15429, 28, 4);
INSERT INTO `item_mods` VALUES (15431, 1, 5);
INSERT INTO `item_mods` VALUES (15431, 7, 15);
INSERT INTO `item_mods` VALUES (15431, 27, 2);
INSERT INTO `item_mods` VALUES (15432, 2, -15);
INSERT INTO `item_mods` VALUES (15432, 384, 20);
INSERT INTO `item_mods` VALUES (15433, 1, 3);
INSERT INTO `item_mods` VALUES (15433, 12, 2);
INSERT INTO `item_mods` VALUES (15433, 13, 2);
INSERT INTO `item_mods` VALUES (15433, 14, 2);
INSERT INTO `item_mods` VALUES (15433, 71, 1);
INSERT INTO `item_mods` VALUES (15434, 1, 3);
INSERT INTO `item_mods` VALUES (15434, 8, 3);
INSERT INTO `item_mods` VALUES (15434, 23, 5);
INSERT INTO `item_mods` VALUES (15435, 1, 7);
INSERT INTO `item_mods` VALUES (15436, 1, 7);
INSERT INTO `item_mods` VALUES (15437, 1, 7);
INSERT INTO `item_mods` VALUES (15438, 1, 7);
INSERT INTO `item_mods` VALUES (15439, 1, 7);
INSERT INTO `item_mods` VALUES (15440, 1, 7);
INSERT INTO `item_mods` VALUES (15441, 1, 7);
INSERT INTO `item_mods` VALUES (15442, 1, 7);
INSERT INTO `item_mods` VALUES (15443, 2, 20);
INSERT INTO `item_mods` VALUES (15443, 5, 20);
INSERT INTO `item_mods` VALUES (15455, 27, 1);
INSERT INTO `item_mods` VALUES (15456, 1, 1);
INSERT INTO `item_mods` VALUES (15456, 27, 2);
INSERT INTO `item_mods` VALUES (15457, 23, -5);
INSERT INTO `item_mods` VALUES (15457, 25, 3);
INSERT INTO `item_mods` VALUES (15457, 384, 40);
INSERT INTO `item_mods` VALUES (15458, 1, 6);
INSERT INTO `item_mods` VALUES (15458, 23, 6);
INSERT INTO `item_mods` VALUES (15458, 168, 6);
INSERT INTO `item_mods` VALUES (15458, 289, 6);
INSERT INTO `item_mods` VALUES (15458, 384, 61);
INSERT INTO `item_mods` VALUES (15459, 1, 3);
INSERT INTO `item_mods` VALUES (15460, 1, 3);
INSERT INTO `item_mods` VALUES (15461, 1, 3);
INSERT INTO `item_mods` VALUES (15462, 1, 5);
INSERT INTO `item_mods` VALUES (15463, 1, 8);
INSERT INTO `item_mods` VALUES (15463, 166, -2);
INSERT INTO `item_mods` VALUES (15464, 1, 9);
INSERT INTO `item_mods` VALUES (15464, 61, 7);
INSERT INTO `item_mods` VALUES (15464, 68, 7);
INSERT INTO `item_mods` VALUES (15465, 1, 7);
INSERT INTO `item_mods` VALUES (15465, 27, 4);
INSERT INTO `item_mods` VALUES (15465, 68, 9);
INSERT INTO `item_mods` VALUES (15466, 1, 7);
INSERT INTO `item_mods` VALUES (15466, 5, 30);
INSERT INTO `item_mods` VALUES (15466, 14, 9);
INSERT INTO `item_mods` VALUES (15466, 242, 2);
INSERT INTO `item_mods` VALUES (15467, 1, 5);
INSERT INTO `item_mods` VALUES (15467, 2, 7);
INSERT INTO `item_mods` VALUES (15467, 5, 7);
INSERT INTO `item_mods` VALUES (15467, 14, 3);
INSERT INTO `item_mods` VALUES (15468, 1, 8);
INSERT INTO `item_mods` VALUES (15468, 27, 2);
INSERT INTO `item_mods` VALUES (15469, 1, 3);
INSERT INTO `item_mods` VALUES (15469, 2, -10);
INSERT INTO `item_mods` VALUES (15469, 23, 6);
INSERT INTO `item_mods` VALUES (15470, 1, 2);
INSERT INTO `item_mods` VALUES (15470, 29, 2);
INSERT INTO `item_mods` VALUES (15470, 30, 1);
INSERT INTO `item_mods` VALUES (15471, 5, 25);
INSERT INTO `item_mods` VALUES (15471, 113, 5);
INSERT INTO `item_mods` VALUES (15471, 115, 5);
INSERT INTO `item_mods` VALUES (15471, 116, 5);
INSERT INTO `item_mods` VALUES (15472, 5, 25);
INSERT INTO `item_mods` VALUES (15472, 111, 5);
INSERT INTO `item_mods` VALUES (15472, 112, 5);
INSERT INTO `item_mods` VALUES (15472, 114, 5);
INSERT INTO `item_mods` VALUES (15473, 5, 25);
INSERT INTO `item_mods` VALUES (15473, 117, 5);
INSERT INTO `item_mods` VALUES (15473, 118, 5);
INSERT INTO `item_mods` VALUES (15473, 119, 5);
INSERT INTO `item_mods` VALUES (15475, 1, 7);
INSERT INTO `item_mods` VALUES (15475, 23, 20);
INSERT INTO `item_mods` VALUES (15475, 24, -10);
INSERT INTO `item_mods` VALUES (15475, 26, -10);
INSERT INTO `item_mods` VALUES (15476, 1, 7);
INSERT INTO `item_mods` VALUES (15476, 23, -10);
INSERT INTO `item_mods` VALUES (15476, 24, -10);
INSERT INTO `item_mods` VALUES (15476, 26, 20);
INSERT INTO `item_mods` VALUES (15477, 1, 8);
INSERT INTO `item_mods` VALUES (15477, 107, 10);
INSERT INTO `item_mods` VALUES (15477, 108, 10);
INSERT INTO `item_mods` VALUES (15477, 109, 10);
INSERT INTO `item_mods` VALUES (15477, 110, 10);
INSERT INTO `item_mods` VALUES (15478, 1, 8);
INSERT INTO `item_mods` VALUES (15478, 10, 5);
INSERT INTO `item_mods` VALUES (15478, 13, 5);
INSERT INTO `item_mods` VALUES (15478, 72, 5);
INSERT INTO `item_mods` VALUES (15479, 1, 6);
INSERT INTO `item_mods` VALUES (15479, 25, 7);
INSERT INTO `item_mods` VALUES (15479, 30, 7);
INSERT INTO `item_mods` VALUES (15479, 48, 7);
INSERT INTO `item_mods` VALUES (15480, 1, 7);
INSERT INTO `item_mods` VALUES (15480, 9, 4);
INSERT INTO `item_mods` VALUES (15480, 11, 4);
INSERT INTO `item_mods` VALUES (15480, 27, 5);
INSERT INTO `item_mods` VALUES (15481, 1, 16);
INSERT INTO `item_mods` VALUES (15481, 2, 40);
INSERT INTO `item_mods` VALUES (15481, 10, 6);
INSERT INTO `item_mods` VALUES (15481, 27, 3);
INSERT INTO `item_mods` VALUES (15482, 1, 6);
INSERT INTO `item_mods` VALUES (15482, 14, 7);
INSERT INTO `item_mods` VALUES (15482, 25, 7);
INSERT INTO `item_mods` VALUES (15482, 68, 7);
INSERT INTO `item_mods` VALUES (15483, 1, 5);
INSERT INTO `item_mods` VALUES (15483, 2, 30);
INSERT INTO `item_mods` VALUES (15484, 1, 6);
INSERT INTO `item_mods` VALUES (15484, 2, 30);
INSERT INTO `item_mods` VALUES (15484, 5, 30);
INSERT INTO `item_mods` VALUES (15484, 27, -1);
INSERT INTO `item_mods` VALUES (15485, 1, 2);
INSERT INTO `item_mods` VALUES (15486, 1, 3);
INSERT INTO `item_mods` VALUES (15487, 1, 5);
INSERT INTO `item_mods` VALUES (15487, 55, 5);
INSERT INTO `item_mods` VALUES (15488, 1, 7);
INSERT INTO `item_mods` VALUES (15488, 23, -10);
INSERT INTO `item_mods` VALUES (15488, 24, 20);
INSERT INTO `item_mods` VALUES (15488, 26, -10);
INSERT INTO `item_mods` VALUES (15489, 1, 4);
INSERT INTO `item_mods` VALUES (15489, 5, 30);
INSERT INTO `item_mods` VALUES (15490, 1, 5);
INSERT INTO `item_mods` VALUES (15490, 5, 15);
INSERT INTO `item_mods` VALUES (15490, 13, 3);
INSERT INTO `item_mods` VALUES (15490, 14, 3);
INSERT INTO `item_mods` VALUES (15490, 27, -1);
INSERT INTO `item_mods` VALUES (15491, 1, 7);
INSERT INTO `item_mods` VALUES (15491, 11, 1);
INSERT INTO `item_mods` VALUES (15491, 24, 12);
INSERT INTO `item_mods` VALUES (15492, 1, 5);
INSERT INTO `item_mods` VALUES (15492, 2, 30);
INSERT INTO `item_mods` VALUES (15492, 5, 30);
INSERT INTO `item_mods` VALUES (15493, 1, 7);
INSERT INTO `item_mods` VALUES (15493, 68, 1);
INSERT INTO `item_mods` VALUES (15493, 73, 1);
INSERT INTO `item_mods` VALUES (15493, 289, 1);
INSERT INTO `item_mods` VALUES (15493, 306, 1);
INSERT INTO `item_mods` VALUES (15494, 1, 5);
INSERT INTO `item_mods` VALUES (15494, 6, 1);
INSERT INTO `item_mods` VALUES (15494, 68, 3);
INSERT INTO `item_mods` VALUES (15494, 71, 1);
INSERT INTO `item_mods` VALUES (15503, 1, 3);
INSERT INTO `item_mods` VALUES (15503, 166, -1);
INSERT INTO `item_mods` VALUES (15504, 1, 4);
INSERT INTO `item_mods` VALUES (15504, 2, 20);
INSERT INTO `item_mods` VALUES (15505, 68, 3);
INSERT INTO `item_mods` VALUES (15506, 1, 5);
INSERT INTO `item_mods` VALUES (15506, 5, 10);
INSERT INTO `item_mods` VALUES (15508, 8, 5);
INSERT INTO `item_mods` VALUES (15508, 86, 7);
INSERT INTO `item_mods` VALUES (15508, 89, 7);
INSERT INTO `item_mods` VALUES (15509, 11, 5);
INSERT INTO `item_mods` VALUES (15509, 88, 7);
INSERT INTO `item_mods` VALUES (15509, 104, 7);
INSERT INTO `item_mods` VALUES (15510, 12, 5);
INSERT INTO `item_mods` VALUES (15510, 83, 7);
INSERT INTO `item_mods` VALUES (15510, 90, 7);
INSERT INTO `item_mods` VALUES (15511, 10, 5);
INSERT INTO `item_mods` VALUES (15511, 82, 7);
INSERT INTO `item_mods` VALUES (15511, 85, 7);
INSERT INTO `item_mods` VALUES (15512, 13, 5);
INSERT INTO `item_mods` VALUES (15512, 80, 7);
INSERT INTO `item_mods` VALUES (15512, 105, 7);
INSERT INTO `item_mods` VALUES (15513, 14, 5);
INSERT INTO `item_mods` VALUES (15513, 84, 7);
INSERT INTO `item_mods` VALUES (15513, 91, 7);
INSERT INTO `item_mods` VALUES (15514, 9, 5);
INSERT INTO `item_mods` VALUES (15514, 81, 7);
INSERT INTO `item_mods` VALUES (15514, 87, 7);
INSERT INTO `item_mods` VALUES (15515, 25, 10);
INSERT INTO `item_mods` VALUES (15515, 26, 10);
INSERT INTO `item_mods` VALUES (15515, 61, -10);
INSERT INTO `item_mods` VALUES (15516, 26, 8);
INSERT INTO `item_mods` VALUES (15517, 24, 5);
INSERT INTO `item_mods` VALUES (15517, 26, 6);
INSERT INTO `item_mods` VALUES (15517, 27, -1);
INSERT INTO `item_mods` VALUES (15517, 289, 1);
INSERT INTO `item_mods` VALUES (15518, 1, 2);
INSERT INTO `item_mods` VALUES (15518, 5, 10);
INSERT INTO `item_mods` VALUES (15518, 59, 30);
INSERT INTO `item_mods` VALUES (15518, 252, 2);
INSERT INTO `item_mods` VALUES (15519, 1, 1);
INSERT INTO `item_mods` VALUES (15520, 1, 1);
INSERT INTO `item_mods` VALUES (15521, 1, 8);
INSERT INTO `item_mods` VALUES (15521, 2, 20);
INSERT INTO `item_mods` VALUES (15522, 12, 3);
INSERT INTO `item_mods` VALUES (15522, 13, 2);
INSERT INTO `item_mods` VALUES (15523, 1, 4);
INSERT INTO `item_mods` VALUES (15523, 8, 3);
INSERT INTO `item_mods` VALUES (15523, 25, 5);
INSERT INTO `item_mods` VALUES (15523, 73, 1);
INSERT INTO `item_mods` VALUES (15524, 1, 4);
INSERT INTO `item_mods` VALUES (15524, 108, 3);
INSERT INTO `item_mods` VALUES (15524, 109, 3);
INSERT INTO `item_mods` VALUES (15524, 110, 3);
INSERT INTO `item_mods` VALUES (15525, 2, 10);
INSERT INTO `item_mods` VALUES (15525, 5, 10);
INSERT INTO `item_mods` VALUES (15525, 71, 2);
INSERT INTO `item_mods` VALUES (15525, 72, 2);
INSERT INTO `item_mods` VALUES (15526, 1, 1);
INSERT INTO `item_mods` VALUES (15531, 1, 3);
INSERT INTO `item_mods` VALUES (15531, 23, -4);
INSERT INTO `item_mods` VALUES (15531, 24, 8);
INSERT INTO `item_mods` VALUES (15531, 25, -4);
INSERT INTO `item_mods` VALUES (15531, 26, 4);
INSERT INTO `item_mods` VALUES (15534, 68, 5);
INSERT INTO `item_mods` VALUES (15535, 5, 20);
INSERT INTO `item_mods` VALUES (15536, 1, 10);
INSERT INTO `item_mods` VALUES (15536, 2, 30);
INSERT INTO `item_mods` VALUES (15537, 24, 8);
INSERT INTO `item_mods` VALUES (15538, 71, 3);
INSERT INTO `item_mods` VALUES (15539, 1, 1);
INSERT INTO `item_mods` VALUES (15539, 23, 6);
INSERT INTO `item_mods` VALUES (15539, 241, 2);
INSERT INTO `item_mods` VALUES (15539, 370, 1);
INSERT INTO `item_mods` VALUES (15540, 1, 2);
INSERT INTO `item_mods` VALUES (15540, 23, 7);
INSERT INTO `item_mods` VALUES (15540, 241, 2);
INSERT INTO `item_mods` VALUES (15540, 370, 1);

-- -------------------------------------------------------
-- Rajas Ring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (15543, 8, 2); -- STR
INSERT INTO `item_mods` VALUES (15543, 9, 2); -- DEX
INSERT INTO `item_mods` VALUES (15543, 73, 5); -- Store tp
INSERT INTO `item_mods` VALUES (15543, 289, 5); -- subtle blow

-- -------------------------------------------------------
-- Sattva Ring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (15544, 2, 15); -- HP
INSERT INTO `item_mods` VALUES (15544, 10, 2); -- VIT
INSERT INTO `item_mods` VALUES (15544, 11, 2); -- AGI
INSERT INTO `item_mods` VALUES (15544, 27, 3); -- enmity

INSERT INTO `item_mods` VALUES (15545, 5, 15);
INSERT INTO `item_mods` VALUES (15545, 12, 2);
INSERT INTO `item_mods` VALUES (15545, 13, 2);
INSERT INTO `item_mods` VALUES (15545, 27, -3);
INSERT INTO `item_mods` VALUES (15546, 2, -20);
INSERT INTO `item_mods` VALUES (15546, 5, 10);
INSERT INTO `item_mods` VALUES (15546, 8, 1);
INSERT INTO `item_mods` VALUES (15547, 7, 25);
INSERT INTO `item_mods` VALUES (15547, 12, 1);
INSERT INTO `item_mods` VALUES (15547, 13, 1);
INSERT INTO `item_mods` VALUES (15547, 14, 1);
INSERT INTO `item_mods` VALUES (15548, 1, -8);
INSERT INTO `item_mods` VALUES (15548, 23, 8);
INSERT INTO `item_mods` VALUES (15548, 25, 8);
INSERT INTO `item_mods` VALUES (15548, 68, -8);
INSERT INTO `item_mods` VALUES (15549, 1, -8);
INSERT INTO `item_mods` VALUES (15549, 24, 8);
INSERT INTO `item_mods` VALUES (15549, 26, 8);
INSERT INTO `item_mods` VALUES (15549, 68, -8);
INSERT INTO `item_mods` VALUES (15550, 161, 8);
INSERT INTO `item_mods` VALUES (15550, 163, -20);
INSERT INTO `item_mods` VALUES (15551, 25, 2);
INSERT INTO `item_mods` VALUES (15551, 26, 2);
INSERT INTO `item_mods` VALUES (15558, 8, 1);
INSERT INTO `item_mods` VALUES (15558, 54, 3);
INSERT INTO `item_mods` VALUES (15559, 9, 1);
INSERT INTO `item_mods` VALUES (15559, 58, 3);
INSERT INTO `item_mods` VALUES (15560, 1, 1);
INSERT INTO `item_mods` VALUES (15560, 27, -4);
INSERT INTO `item_mods` VALUES (15561, 1, 39);
INSERT INTO `item_mods` VALUES (15561, 2, 15);
INSERT INTO `item_mods` VALUES (15561, 25, 5);
INSERT INTO `item_mods` VALUES (15561, 27, 3);
INSERT INTO `item_mods` VALUES (15561, 68, 5);
INSERT INTO `item_mods` VALUES (15561, 72, 2);
INSERT INTO `item_mods` VALUES (15562, 1, 31);
INSERT INTO `item_mods` VALUES (15562, 2, 18);
INSERT INTO `item_mods` VALUES (15562, 13, 4);
INSERT INTO `item_mods` VALUES (15562, 107, 15);
INSERT INTO `item_mods` VALUES (15562, 291, 3);
INSERT INTO `item_mods` VALUES (15563, 1, 28);
INSERT INTO `item_mods` VALUES (15563, 5, 30);
INSERT INTO `item_mods` VALUES (15563, 10, 5);
INSERT INTO `item_mods` VALUES (15563, 27, -2);
INSERT INTO `item_mods` VALUES (15563, 111, 15);
INSERT INTO `item_mods` VALUES (15564, 1, 27);
INSERT INTO `item_mods` VALUES (15564, 5, 19);
INSERT INTO `item_mods` VALUES (15564, 27, -2);
INSERT INTO `item_mods` VALUES (15564, 71, 1);
INSERT INTO `item_mods` VALUES (15564, 116, 15);
INSERT INTO `item_mods` VALUES (15565, 1, 33);
INSERT INTO `item_mods` VALUES (15565, 5, 18);
INSERT INTO `item_mods` VALUES (15565, 13, 5);
INSERT INTO `item_mods` VALUES (15565, 112, 10);
INSERT INTO `item_mods` VALUES (15565, 113, 15);
INSERT INTO `item_mods` VALUES (15566, 1, 34);
INSERT INTO `item_mods` VALUES (15566, 2, 15);
INSERT INTO `item_mods` VALUES (15566, 9, 2);
INSERT INTO `item_mods` VALUES (15566, 11, 4);
INSERT INTO `item_mods` VALUES (15567, 1, 43);
INSERT INTO `item_mods` VALUES (15567, 2, 20);
INSERT INTO `item_mods` VALUES (15567, 11, 4);
INSERT INTO `item_mods` VALUES (15567, 27, 2);
INSERT INTO `item_mods` VALUES (15567, 113, 10);
INSERT INTO `item_mods` VALUES (15568, 1, 38);
INSERT INTO `item_mods` VALUES (15568, 2, 15);
INSERT INTO `item_mods` VALUES (15568, 5, 15);
INSERT INTO `item_mods` VALUES (15568, 9, 5);
INSERT INTO `item_mods` VALUES (15568, 12, 5);
INSERT INTO `item_mods` VALUES (15568, 68, 5);
INSERT INTO `item_mods` VALUES (15568, 110, 15);
INSERT INTO `item_mods` VALUES (15569, 1, 34);
INSERT INTO `item_mods` VALUES (15569, 2, 15);
INSERT INTO `item_mods` VALUES (15569, 8, 6);
INSERT INTO `item_mods` VALUES (15569, 14, 6);
INSERT INTO `item_mods` VALUES (15569, 224, 2);
INSERT INTO `item_mods` VALUES (15569, 225, 2);
INSERT INTO `item_mods` VALUES (15569, 226, 2);
INSERT INTO `item_mods` VALUES (15569, 227, 2);
INSERT INTO `item_mods` VALUES (15569, 228, 2);
INSERT INTO `item_mods` VALUES (15569, 229, 2);
INSERT INTO `item_mods` VALUES (15569, 230, 2);
INSERT INTO `item_mods` VALUES (15569, 231, 2);
INSERT INTO `item_mods` VALUES (15569, 232, 2);
INSERT INTO `item_mods` VALUES (15569, 233, 2);
INSERT INTO `item_mods` VALUES (15569, 234, 2);
INSERT INTO `item_mods` VALUES (15569, 360, 6);
INSERT INTO `item_mods` VALUES (15570, 1, 31);
INSERT INTO `item_mods` VALUES (15570, 2, 12);
INSERT INTO `item_mods` VALUES (15570, 8, 8);
INSERT INTO `item_mods` VALUES (15570, 9, 8);
INSERT INTO `item_mods` VALUES (15570, 27, -2);
INSERT INTO `item_mods` VALUES (15570, 121, 8);
INSERT INTO `item_mods` VALUES (15571, 1, 32);
INSERT INTO `item_mods` VALUES (15571, 2, 15);
INSERT INTO `item_mods` VALUES (15571, 11, 5);
INSERT INTO `item_mods` VALUES (15571, 13, 5);
INSERT INTO `item_mods` VALUES (15571, 27, -3);
INSERT INTO `item_mods` VALUES (15572, 1, 40);
INSERT INTO `item_mods` VALUES (15572, 2, 15);
INSERT INTO `item_mods` VALUES (15572, 8, 5);
INSERT INTO `item_mods` VALUES (15572, 10, 5);
INSERT INTO `item_mods` VALUES (15572, 110, 10);
INSERT INTO `item_mods` VALUES (15573, 1, 31);
INSERT INTO `item_mods` VALUES (15573, 25, 5);
INSERT INTO `item_mods` VALUES (15573, 26, 10);
INSERT INTO `item_mods` VALUES (15574, 1, 32);
INSERT INTO `item_mods` VALUES (15574, 2, 15);
INSERT INTO `item_mods` VALUES (15574, 25, 9);
INSERT INTO `item_mods` VALUES (15575, 1, 25);
INSERT INTO `item_mods` VALUES (15575, 5, 22);
INSERT INTO `item_mods` VALUES (15575, 27, -3);
INSERT INTO `item_mods` VALUES (15576, 1, 35);
INSERT INTO `item_mods` VALUES (15576, 2, 26);
INSERT INTO `item_mods` VALUES (15576, 5, 26);
INSERT INTO `item_mods` VALUES (15576, 25, 3);
INSERT INTO `item_mods` VALUES (15576, 170, 2);
INSERT INTO `item_mods` VALUES (15576, 384, 30);
INSERT INTO `item_mods` VALUES (15577, 1, 30);
INSERT INTO `item_mods` VALUES (15577, 30, 3);
INSERT INTO `item_mods` VALUES (15577, 111, 5);
INSERT INTO `item_mods` VALUES (15577, 114, 5);
INSERT INTO `item_mods` VALUES (15577, 384, 20);
INSERT INTO `item_mods` VALUES (15578, 1, 20);
INSERT INTO `item_mods` VALUES (15578, 27, -5);
INSERT INTO `item_mods` VALUES (15578, 68, 5);
INSERT INTO `item_mods` VALUES (15579, 1, 21);
INSERT INTO `item_mods` VALUES (15579, 27, -6);
INSERT INTO `item_mods` VALUES (15579, 68, 6);
INSERT INTO `item_mods` VALUES (15580, 1, 40);
INSERT INTO `item_mods` VALUES (15580, 8, 6);
INSERT INTO `item_mods` VALUES (15580, 27, 4);
INSERT INTO `item_mods` VALUES (15580, 288, 1);
INSERT INTO `item_mods` VALUES (15581, 1, 32);
INSERT INTO `item_mods` VALUES (15581, 3, 6);
INSERT INTO `item_mods` VALUES (15581, 11, 5);
INSERT INTO `item_mods` VALUES (15581, 289, 6);
INSERT INTO `item_mods` VALUES (15581, 292, 5);
INSERT INTO `item_mods` VALUES (15582, 1, 32);
INSERT INTO `item_mods` VALUES (15582, 5, 17);
INSERT INTO `item_mods` VALUES (15582, 27, -3);
INSERT INTO `item_mods` VALUES (15582, 112, 15);
INSERT INTO `item_mods` VALUES (15583, 1, 31);
INSERT INTO `item_mods` VALUES (15583, 5, 20);
INSERT INTO `item_mods` VALUES (15583, 12, 3);
INSERT INTO `item_mods` VALUES (15583, 27, -3);
INSERT INTO `item_mods` VALUES (15584, 1, 34);
INSERT INTO `item_mods` VALUES (15584, 5, 16);
INSERT INTO `item_mods` VALUES (15584, 9, 6);
INSERT INTO `item_mods` VALUES (15584, 115, 12);
INSERT INTO `item_mods` VALUES (15585, 1, 35);
INSERT INTO `item_mods` VALUES (15585, 2, 25);
INSERT INTO `item_mods` VALUES (15585, 27, 5);
INSERT INTO `item_mods` VALUES (15585, 298, 5);
INSERT INTO `item_mods` VALUES (15586, 1, 44);
INSERT INTO `item_mods` VALUES (15586, 2, 20);
INSERT INTO `item_mods` VALUES (15586, 8, 6);
INSERT INTO `item_mods` VALUES (15586, 27, 4);
INSERT INTO `item_mods` VALUES (15586, 168, 10);
INSERT INTO `item_mods` VALUES (15587, 1, 39);
INSERT INTO `item_mods` VALUES (15587, 2, 18);
INSERT INTO `item_mods` VALUES (15587, 5, 18);
INSERT INTO `item_mods` VALUES (15587, 13, 5);
INSERT INTO `item_mods` VALUES (15587, 29, 5);
INSERT INTO `item_mods` VALUES (15587, 116, 7);
INSERT INTO `item_mods` VALUES (15588, 1, 35);
INSERT INTO `item_mods` VALUES (15588, 2, 17);
INSERT INTO `item_mods` VALUES (15588, 9, 5);
INSERT INTO `item_mods` VALUES (15588, 72, 4);
INSERT INTO `item_mods` VALUES (15588, 360, 2);
INSERT INTO `item_mods` VALUES (15589, 1, 32);
INSERT INTO `item_mods` VALUES (15589, 2, 26);
INSERT INTO `item_mods` VALUES (15589, 5, 42);
INSERT INTO `item_mods` VALUES (15590, 1, 33);
INSERT INTO `item_mods` VALUES (15590, 2, 18);
INSERT INTO `item_mods` VALUES (15590, 26, 9);
INSERT INTO `item_mods` VALUES (15590, 27, -3);
INSERT INTO `item_mods` VALUES (15590, 110, 10);

-- ------------------------------------------
-- Saotome Haidate +1
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (15591, 1, 41);
INSERT INTO `item_mods` VALUES (15591, 2, 33);
INSERT INTO `item_mods` VALUES (15591, 11, 4);
INSERT INTO `item_mods` VALUES (15591, 27, 1);
INSERT INTO `item_mods` VALUES (15591, 508, 15); -- Aug. Third Eye

INSERT INTO `item_mods` VALUES (15592, 1, 32);
INSERT INTO `item_mods` VALUES (15592, 2, 40);
INSERT INTO `item_mods` VALUES (15592, 259, 5);
INSERT INTO `item_mods` VALUES (15593, 1, 33);
INSERT INTO `item_mods` VALUES (15593, 2, 13);
INSERT INTO `item_mods` VALUES (15593, 9, 6);
INSERT INTO `item_mods` VALUES (15593, 363, 10);
INSERT INTO `item_mods` VALUES (15594, 1, 30);
INSERT INTO `item_mods` VALUES (15594, 5, 25);
INSERT INTO `item_mods` VALUES (15594, 357, 2);
INSERT INTO `item_mods` VALUES (15595, 1, 32);
INSERT INTO `item_mods` VALUES (15595, 25, 10);
INSERT INTO `item_mods` VALUES (15595, 27, -6);
INSERT INTO `item_mods` VALUES (15595, 68, 10);
INSERT INTO `item_mods` VALUES (15595, 71, 1);
INSERT INTO `item_mods` VALUES (15596, 1, 32);
INSERT INTO `item_mods` VALUES (15597, 1, 37);
INSERT INTO `item_mods` VALUES (15597, 2, -30);
INSERT INTO `item_mods` VALUES (15597, 5, 30);
INSERT INTO `item_mods` VALUES (15597, 25, 3);
INSERT INTO `item_mods` VALUES (15597, 27, 6);
INSERT INTO `item_mods` VALUES (15598, 1, 35);
INSERT INTO `item_mods` VALUES (15599, 1, 31);
INSERT INTO `item_mods` VALUES (15599, 162, -5);
INSERT INTO `item_mods` VALUES (15599, 292, 6);
INSERT INTO `item_mods` VALUES (15600, 1, 33);
INSERT INTO `item_mods` VALUES (15600, 2, 20);
INSERT INTO `item_mods` VALUES (15600, 10, 3);
INSERT INTO `item_mods` VALUES (15600, 11, 3);
INSERT INTO `item_mods` VALUES (15600, 168, 10);
INSERT INTO `item_mods` VALUES (15601, 1, 28);
INSERT INTO `item_mods` VALUES (15601, 2, 20);
INSERT INTO `item_mods` VALUES (15601, 12, 3);
INSERT INTO `item_mods` VALUES (15601, 27, -3);
INSERT INTO `item_mods` VALUES (15602, 1, 25);
INSERT INTO `item_mods` VALUES (15602, 2, 11);
INSERT INTO `item_mods` VALUES (15602, 14, 3);
INSERT INTO `item_mods` VALUES (15603, 1, 24);
INSERT INTO `item_mods` VALUES (15603, 2, 22);
INSERT INTO `item_mods` VALUES (15603, 8, 2);
INSERT INTO `item_mods` VALUES (15603, 11, 3);
INSERT INTO `item_mods` VALUES (15604, 1, 38);
INSERT INTO `item_mods` VALUES (15604, 23, 4);
INSERT INTO `item_mods` VALUES (15604, 24, 4);
INSERT INTO `item_mods` VALUES (15604, 26, 4);
INSERT INTO `item_mods` VALUES (15605, 1, 30);
INSERT INTO `item_mods` VALUES (15605, 2, -12);
INSERT INTO `item_mods` VALUES (15605, 24, 3);
INSERT INTO `item_mods` VALUES (15605, 26, 2);
INSERT INTO `item_mods` VALUES (15605, 68, 3);
INSERT INTO `item_mods` VALUES (15606, 1, 30);
INSERT INTO `item_mods` VALUES (15606, 2, 25);
INSERT INTO `item_mods` VALUES (15606, 5, 25);
INSERT INTO `item_mods` VALUES (15606, 68, 6);
INSERT INTO `item_mods` VALUES (15606, 71, 2);
INSERT INTO `item_mods` VALUES (15607, 1, 25);
INSERT INTO `item_mods` VALUES (15607, 2, 24);
INSERT INTO `item_mods` VALUES (15607, 8, 3);
INSERT INTO `item_mods` VALUES (15607, 11, 4);
INSERT INTO `item_mods` VALUES (15608, 1, 31);
INSERT INTO `item_mods` VALUES (15608, 2, -12);
INSERT INTO `item_mods` VALUES (15608, 24, 4);
INSERT INTO `item_mods` VALUES (15608, 26, 3);
INSERT INTO `item_mods` VALUES (15608, 68, 4);
INSERT INTO `item_mods` VALUES (15609, 1, 36);
INSERT INTO `item_mods` VALUES (15609, 8, 3);
INSERT INTO `item_mods` VALUES (15609, 25, 4);
INSERT INTO `item_mods` VALUES (15609, 26, 4);
INSERT INTO `item_mods` VALUES (15610, 1, 5);
INSERT INTO `item_mods` VALUES (15611, 1, 5);
INSERT INTO `item_mods` VALUES (15612, 1, 22);
INSERT INTO `item_mods` VALUES (15612, 68, 3);
INSERT INTO `item_mods` VALUES (15612, 292, 3);
INSERT INTO `item_mods` VALUES (15613, 1, 34);
INSERT INTO `item_mods` VALUES (15613, 5, 15);
INSERT INTO `item_mods` VALUES (15613, 12, 7);
INSERT INTO `item_mods` VALUES (15613, 13, 7);
INSERT INTO `item_mods` VALUES (15613, 27, -4);
INSERT INTO `item_mods` VALUES (15614, 1, 33);
INSERT INTO `item_mods` VALUES (15614, 8, 3);
INSERT INTO `item_mods` VALUES (15614, 25, 3);
INSERT INTO `item_mods` VALUES (15614, 231, 2);
INSERT INTO `item_mods` VALUES (15615, 1, 36);
INSERT INTO `item_mods` VALUES (15615, 9, 2);
INSERT INTO `item_mods` VALUES (15615, 10, 2);
INSERT INTO `item_mods` VALUES (15615, 25, 3);
INSERT INTO `item_mods` VALUES (15615, 68, 3);
INSERT INTO `item_mods` VALUES (15615, 161, -3);
INSERT INTO `item_mods` VALUES (15616, 1, 37);
INSERT INTO `item_mods` VALUES (15616, 9, 3);
INSERT INTO `item_mods` VALUES (15616, 10, 3);
INSERT INTO `item_mods` VALUES (15616, 25, 4);
INSERT INTO `item_mods` VALUES (15616, 68, 4);
INSERT INTO `item_mods` VALUES (15616, 161, -4);
INSERT INTO `item_mods` VALUES (15617, 1, 36);
INSERT INTO `item_mods` VALUES (15617, 8, 4);
INSERT INTO `item_mods` VALUES (15617, 10, 4);
INSERT INTO `item_mods` VALUES (15617, 384, 30);
INSERT INTO `item_mods` VALUES (15618, 1, 39);
INSERT INTO `item_mods` VALUES (15618, 2, 25);
INSERT INTO `item_mods` VALUES (15618, 5, 25);
INSERT INTO `item_mods` VALUES (15618, 13, 2);
INSERT INTO `item_mods` VALUES (15618, 25, 3);
INSERT INTO `item_mods` VALUES (15619, 1, 40);
INSERT INTO `item_mods` VALUES (15619, 2, 30);
INSERT INTO `item_mods` VALUES (15619, 5, 30);
INSERT INTO `item_mods` VALUES (15619, 13, 3);
INSERT INTO `item_mods` VALUES (15619, 25, 4);
INSERT INTO `item_mods` VALUES (15620, 1, 23);
INSERT INTO `item_mods` VALUES (15620, 2, 10);
INSERT INTO `item_mods` VALUES (15620, 5, 10);
INSERT INTO `item_mods` VALUES (15621, 1, 24);
INSERT INTO `item_mods` VALUES (15621, 2, 11);
INSERT INTO `item_mods` VALUES (15621, 5, 11);
INSERT INTO `item_mods` VALUES (15621, 60, 2);
INSERT INTO `item_mods` VALUES (15622, 1, 28);
INSERT INTO `item_mods` VALUES (15623, 1, 28);
INSERT INTO `item_mods` VALUES (15623, 5, 20);
INSERT INTO `item_mods` VALUES (15623, 25, 6);
INSERT INTO `item_mods` VALUES (15624, 1, 39);
INSERT INTO `item_mods` VALUES (15624, 246, 2);
INSERT INTO `item_mods` VALUES (15625, 1, 35);
INSERT INTO `item_mods` VALUES (15625, 3, 2);
INSERT INTO `item_mods` VALUES (15625, 6, 2);
INSERT INTO `item_mods` VALUES (15625, 8, 6);
INSERT INTO `item_mods` VALUES (15625, 9, 6);
INSERT INTO `item_mods` VALUES (15625, 12, -3);
INSERT INTO `item_mods` VALUES (15625, 13, -3);
INSERT INTO `item_mods` VALUES (15625, 288, 2);
INSERT INTO `item_mods` VALUES (15626, 1, 10);
INSERT INTO `item_mods` VALUES (15626, 9, 1);
INSERT INTO `item_mods` VALUES (15627, 1, 16);
INSERT INTO `item_mods` VALUES (15627, 8, 1);
INSERT INTO `item_mods` VALUES (15627, 9, 1);
INSERT INTO `item_mods` VALUES (15628, 1, 19);
INSERT INTO `item_mods` VALUES (15628, 6, 1);
INSERT INTO `item_mods` VALUES (15628, 8, 1);
INSERT INTO `item_mods` VALUES (15628, 9, 1);
INSERT INTO `item_mods` VALUES (15629, 1, 28);
INSERT INTO `item_mods` VALUES (15629, 23, 5);
INSERT INTO `item_mods` VALUES (15629, 24, 5);
INSERT INTO `item_mods` VALUES (15629, 25, 4);
INSERT INTO `item_mods` VALUES (15629, 26, 4);
INSERT INTO `item_mods` VALUES (15629, 73, 7);
INSERT INTO `item_mods` VALUES (15629, 384, 20);
INSERT INTO `item_mods` VALUES (15630, 1, 8);
INSERT INTO `item_mods` VALUES (15630, 26, 1);
INSERT INTO `item_mods` VALUES (15631, 1, 13);
INSERT INTO `item_mods` VALUES (15631, 23, 1);
INSERT INTO `item_mods` VALUES (15631, 26, 1);
INSERT INTO `item_mods` VALUES (15632, 1, 16);
INSERT INTO `item_mods` VALUES (15632, 23, 1);
INSERT INTO `item_mods` VALUES (15632, 25, 1);
INSERT INTO `item_mods` VALUES (15632, 26, 1);
INSERT INTO `item_mods` VALUES (15633, 1, 30);
INSERT INTO `item_mods` VALUES (15633, 8, 5);
INSERT INTO `item_mods` VALUES (15633, 9, 5);
INSERT INTO `item_mods` VALUES (15633, 23, 10);
INSERT INTO `item_mods` VALUES (15633, 384, 30);
INSERT INTO `item_mods` VALUES (15634, 1, 9);
INSERT INTO `item_mods` VALUES (15634, 8, 1);
INSERT INTO `item_mods` VALUES (15635, 1, 14);
INSERT INTO `item_mods` VALUES (15635, 8, 1);
INSERT INTO `item_mods` VALUES (15635, 9, 1);
INSERT INTO `item_mods` VALUES (15636, 1, 17);
INSERT INTO `item_mods` VALUES (15636, 8, 1);
INSERT INTO `item_mods` VALUES (15636, 9, 1);
INSERT INTO `item_mods` VALUES (15636, 23, 1);
INSERT INTO `item_mods` VALUES (15637, 1, 32);
INSERT INTO `item_mods` VALUES (15637, 6, 3);
INSERT INTO `item_mods` VALUES (15637, 14, 10);
INSERT INTO `item_mods` VALUES (15637, 27, -4);
INSERT INTO `item_mods` VALUES (15637, 112, 5);
INSERT INTO `item_mods` VALUES (15637, 117, 5);
INSERT INTO `item_mods` VALUES (15637, 121, 5);
INSERT INTO `item_mods` VALUES (15638, 1, 7);
INSERT INTO `item_mods` VALUES (15638, 6, 1);
INSERT INTO `item_mods` VALUES (15639, 1, 12);
INSERT INTO `item_mods` VALUES (15639, 6, 1);
INSERT INTO `item_mods` VALUES (15639, 14, 1);
INSERT INTO `item_mods` VALUES (15640, 1, 15);
INSERT INTO `item_mods` VALUES (15640, 6, 1);
INSERT INTO `item_mods` VALUES (15640, 14, 1);
INSERT INTO `item_mods` VALUES (15640, 27, -1);
INSERT INTO `item_mods` VALUES (15641, 1, 27);
INSERT INTO `item_mods` VALUES (15641, 5, 25);
INSERT INTO `item_mods` VALUES (15641, 8, 3);
INSERT INTO `item_mods` VALUES (15641, 12, 10);
INSERT INTO `item_mods` VALUES (15641, 13, 10);
INSERT INTO `item_mods` VALUES (15641, 27, -2);
INSERT INTO `item_mods` VALUES (15642, 1, 6);
INSERT INTO `item_mods` VALUES (15642, 5, 1);
INSERT INTO `item_mods` VALUES (15643, 1, 11);
INSERT INTO `item_mods` VALUES (15643, 5, 1);
INSERT INTO `item_mods` VALUES (15643, 12, 1);
INSERT INTO `item_mods` VALUES (15644, 1, 14);
INSERT INTO `item_mods` VALUES (15644, 5, 1);
INSERT INTO `item_mods` VALUES (15644, 12, 1);
INSERT INTO `item_mods` VALUES (15644, 13, 1);
INSERT INTO `item_mods` VALUES (15645, 1, 30);
INSERT INTO `item_mods` VALUES (15645, 2, 15);
INSERT INTO `item_mods` VALUES (15645, 5, 15);
INSERT INTO `item_mods` VALUES (15645, 27, -4);
INSERT INTO `item_mods` VALUES (15646, 1, 31);
INSERT INTO `item_mods` VALUES (15646, 2, 16);
INSERT INTO `item_mods` VALUES (15646, 5, 16);
INSERT INTO `item_mods` VALUES (15646, 27, -5);
INSERT INTO `item_mods` VALUES (15647, 1, 32);
INSERT INTO `item_mods` VALUES (15647, 2, 15);
INSERT INTO `item_mods` VALUES (15647, 5, 15);
INSERT INTO `item_mods` VALUES (15647, 9, 4);
INSERT INTO `item_mods` VALUES (15647, 12, 4);
INSERT INTO `item_mods` VALUES (15647, 23, 5);
INSERT INTO `item_mods` VALUES (15647, 25, 5);
INSERT INTO `item_mods` VALUES (15648, 1, 35);
INSERT INTO `item_mods` VALUES (15648, 9, 3);
INSERT INTO `item_mods` VALUES (15648, 11, 3);
INSERT INTO `item_mods` VALUES (15648, 25, 3);
INSERT INTO `item_mods` VALUES (15648, 26, 3);
INSERT INTO `item_mods` VALUES (15648, 28, 3);
INSERT INTO `item_mods` VALUES (15648, 30, 3);
INSERT INTO `item_mods` VALUES (15648, 68, 3);
INSERT INTO `item_mods` VALUES (15649, 1, 35);
INSERT INTO `item_mods` VALUES (15649, 5, 28);
INSERT INTO `item_mods` VALUES (15649, 27, -4);
INSERT INTO `item_mods` VALUES (15649, 161, -3);
INSERT INTO `item_mods` VALUES (15650, 1, 22);
INSERT INTO `item_mods` VALUES (15651, 1, 25);
INSERT INTO `item_mods` VALUES (15651, 54, 3);
INSERT INTO `item_mods` VALUES (15651, 59, -1);
INSERT INTO `item_mods` VALUES (15652, 1, 22);
INSERT INTO `item_mods` VALUES (15653, 1, 25);
INSERT INTO `item_mods` VALUES (15653, 9, 1);
INSERT INTO `item_mods` VALUES (15653, 10, 1);
INSERT INTO `item_mods` VALUES (15653, 11, 1);
INSERT INTO `item_mods` VALUES (15654, 1, 26);
INSERT INTO `item_mods` VALUES (15654, 9, 2);
INSERT INTO `item_mods` VALUES (15654, 10, 2);
INSERT INTO `item_mods` VALUES (15654, 11, 2);
INSERT INTO `item_mods` VALUES (15655, 1, 40);
INSERT INTO `item_mods` VALUES (15655, 2, 25);
INSERT INTO `item_mods` VALUES (15655, 5, 25);
INSERT INTO `item_mods` VALUES (15655, 12, 4);
INSERT INTO `item_mods` VALUES (15655, 13, 4);
INSERT INTO `item_mods` VALUES (15655, 23, 9);
INSERT INTO `item_mods` VALUES (15655, 25, 5);
INSERT INTO `item_mods` VALUES (15656, 1, 41);
INSERT INTO `item_mods` VALUES (15656, 2, 27);
INSERT INTO `item_mods` VALUES (15656, 5, 27);
INSERT INTO `item_mods` VALUES (15656, 12, 5);
INSERT INTO `item_mods` VALUES (15656, 13, 5);
INSERT INTO `item_mods` VALUES (15656, 23, 10);
INSERT INTO `item_mods` VALUES (15656, 25, 6);
INSERT INTO `item_mods` VALUES (15657, 1, 28);
INSERT INTO `item_mods` VALUES (15657, 27, -2);
INSERT INTO `item_mods` VALUES (15657, 28, 4);
INSERT INTO `item_mods` VALUES (15657, 30, 4);
INSERT INTO `item_mods` VALUES (15657, 160, 4);
INSERT INTO `item_mods` VALUES (15658, 1, 29);
INSERT INTO `item_mods` VALUES (15658, 27, -3);
INSERT INTO `item_mods` VALUES (15658, 28, 5);
INSERT INTO `item_mods` VALUES (15658, 30, 5);
INSERT INTO `item_mods` VALUES (15658, 160, 5);
INSERT INTO `item_mods` VALUES (15659, 1, 28);
INSERT INTO `item_mods` VALUES (15659, 2, 10);
INSERT INTO `item_mods` VALUES (15659, 14, 3);
INSERT INTO `item_mods` VALUES (15659, 25, 3);
INSERT INTO `item_mods` VALUES (15659, 27, -1);
INSERT INTO `item_mods` VALUES (15660, 1, 28);
INSERT INTO `item_mods` VALUES (15660, 2, 10);
INSERT INTO `item_mods` VALUES (15660, 14, 3);
INSERT INTO `item_mods` VALUES (15660, 25, 3);
INSERT INTO `item_mods` VALUES (15660, 27, -1);
INSERT INTO `item_mods` VALUES (15661, 1, 16);
INSERT INTO `item_mods` VALUES (15661, 2, 31);
INSERT INTO `item_mods` VALUES (15661, 5, 31);
INSERT INTO `item_mods` VALUES (15661, 25, 6);
INSERT INTO `item_mods` VALUES (15661, 26, 6);
INSERT INTO `item_mods` VALUES (15661, 384, 30);
INSERT INTO `item_mods` VALUES (15662, 1, 13);
INSERT INTO `item_mods` VALUES (15662, 30, 2);
INSERT INTO `item_mods` VALUES (15662, 115, 5);
INSERT INTO `item_mods` VALUES (15662, 117, 5);
INSERT INTO `item_mods` VALUES (15662, 384, 11);
INSERT INTO `item_mods` VALUES (15663, 1, 8);
INSERT INTO `item_mods` VALUES (15663, 27, -4);
INSERT INTO `item_mods` VALUES (15663, 68, 4);
INSERT INTO `item_mods` VALUES (15664, 1, 9);
INSERT INTO `item_mods` VALUES (15664, 27, -5);
INSERT INTO `item_mods` VALUES (15664, 68, 5);
INSERT INTO `item_mods` VALUES (15665, 1, 20);
INSERT INTO `item_mods` VALUES (15665, 2, 15);
INSERT INTO `item_mods` VALUES (15665, 11, 6);
INSERT INTO `item_mods` VALUES (15665, 27, 1);
INSERT INTO `item_mods` VALUES (15666, 1, 16);
INSERT INTO `item_mods` VALUES (15666, 3, 4);
INSERT INTO `item_mods` VALUES (15666, 9, 5);
INSERT INTO `item_mods` VALUES (15666, 107, 14);
INSERT INTO `item_mods` VALUES (15667, 1, 16);
INSERT INTO `item_mods` VALUES (15667, 5, 18);
INSERT INTO `item_mods` VALUES (15667, 13, 6);
INSERT INTO `item_mods` VALUES (15667, 27, -2);
INSERT INTO `item_mods` VALUES (15667, 113, 10);
INSERT INTO `item_mods` VALUES (15668, 1, 15);
INSERT INTO `item_mods` VALUES (15668, 5, 18);
INSERT INTO `item_mods` VALUES (15668, 12, 3);
INSERT INTO `item_mods` VALUES (15668, 27, -2);
INSERT INTO `item_mods` VALUES (15668, 296, 5);
INSERT INTO `item_mods` VALUES (15669, 1, 16);
INSERT INTO `item_mods` VALUES (15669, 5, 15);
INSERT INTO `item_mods` VALUES (15669, 13, 5);
INSERT INTO `item_mods` VALUES (15669, 28, 5);
INSERT INTO `item_mods` VALUES (15669, 108, 5);
INSERT INTO `item_mods` VALUES (15670, 1, 16);
INSERT INTO `item_mods` VALUES (15670, 2, 15);
INSERT INTO `item_mods` VALUES (15670, 14, 6);
INSERT INTO `item_mods` VALUES (15670, 27, 3);
INSERT INTO `item_mods` VALUES (15670, 302, 1);
INSERT INTO `item_mods` VALUES (15671, 1, 20);
INSERT INTO `item_mods` VALUES (15671, 2, 18);
INSERT INTO `item_mods` VALUES (15671, 13, 4);
INSERT INTO `item_mods` VALUES (15671, 27, 2);
INSERT INTO `item_mods` VALUES (15672, 1, 18);
INSERT INTO `item_mods` VALUES (15672, 5, 12);
INSERT INTO `item_mods` VALUES (15672, 25, 2);
INSERT INTO `item_mods` VALUES (15672, 114, 5);
INSERT INTO `item_mods` VALUES (15673, 1, 15);
INSERT INTO `item_mods` VALUES (15673, 2, 13);
INSERT INTO `item_mods` VALUES (15673, 10, 5);
INSERT INTO `item_mods` VALUES (15673, 360, 3);
INSERT INTO `item_mods` VALUES (15673, 364, 20);
INSERT INTO `item_mods` VALUES (15674, 1, 15);
INSERT INTO `item_mods` VALUES (15674, 2, 12);
INSERT INTO `item_mods` VALUES (15674, 27, -3);
INSERT INTO `item_mods` VALUES (15674, 110, 4);
INSERT INTO `item_mods` VALUES (15674, 120, 3);
INSERT INTO `item_mods` VALUES (15675, 1, 17);
INSERT INTO `item_mods` VALUES (15675, 2, 12);
INSERT INTO `item_mods` VALUES (15675, 10, 5);
INSERT INTO `item_mods` VALUES (15675, 24, 12);
INSERT INTO `item_mods` VALUES (15675, 27, -4);
INSERT INTO `item_mods` VALUES (15676, 1, 19);
INSERT INTO `item_mods` VALUES (15676, 2, 23);
INSERT INTO `item_mods` VALUES (15676, 9, 6);
INSERT INTO `item_mods` VALUES (15676, 23, 10);
INSERT INTO `item_mods` VALUES (15676, 27, 1);
INSERT INTO `item_mods` VALUES (15677, 1, 16);
INSERT INTO `item_mods` VALUES (15677, 10, 8);
INSERT INTO `item_mods` VALUES (15677, 118, 12);
INSERT INTO `item_mods` VALUES (15678, 1, 17);
INSERT INTO `item_mods` VALUES (15678, 2, 10);
INSERT INTO `item_mods` VALUES (15678, 10, 5);
INSERT INTO `item_mods` VALUES (15678, 55, 10);
INSERT INTO `item_mods` VALUES (15679, 1, 15);
INSERT INTO `item_mods` VALUES (15679, 5, 25);
INSERT INTO `item_mods` VALUES (15679, 357, 2);
INSERT INTO `item_mods` VALUES (15680, 1, 14);
INSERT INTO `item_mods` VALUES (15680, 25, 6);
INSERT INTO `item_mods` VALUES (15680, 27, -5);
INSERT INTO `item_mods` VALUES (15680, 68, 6);
INSERT INTO `item_mods` VALUES (15680, 71, 2);
INSERT INTO `item_mods` VALUES (15681, 1, 14);
INSERT INTO `item_mods` VALUES (15682, 1, 15);
INSERT INTO `item_mods` VALUES (15682, 2, -35);
INSERT INTO `item_mods` VALUES (15682, 5, 35);
INSERT INTO `item_mods` VALUES (15682, 25, 4);
INSERT INTO `item_mods` VALUES (15682, 27, 4);
INSERT INTO `item_mods` VALUES (15683, 1, 18);
INSERT INTO `item_mods` VALUES (15684, 1, 13);
INSERT INTO `item_mods` VALUES (15684, 2, 13);
INSERT INTO `item_mods` VALUES (15684, 5, 13);
INSERT INTO `item_mods` VALUES (15684, 27, -3);
INSERT INTO `item_mods` VALUES (15684, 108, 10);
INSERT INTO `item_mods` VALUES (15685, 1, 11);
INSERT INTO `item_mods` VALUES (15685, 2, 10);
INSERT INTO `item_mods` VALUES (15685, 8, 2);
INSERT INTO `item_mods` VALUES (15685, 11, 2);
INSERT INTO `item_mods` VALUES (15685, 26, 2);
INSERT INTO `item_mods` VALUES (15686, 1, 11);
INSERT INTO `item_mods` VALUES (15686, 2, 9);
INSERT INTO `item_mods` VALUES (15686, 8, 3);
INSERT INTO `item_mods` VALUES (15686, 58, 10);
INSERT INTO `item_mods` VALUES (15687, 1, 11);
INSERT INTO `item_mods` VALUES (15687, 8, 1);
INSERT INTO `item_mods` VALUES (15687, 11, 1);
INSERT INTO `item_mods` VALUES (15688, 1, 16);
INSERT INTO `item_mods` VALUES (15688, 23, 5);
INSERT INTO `item_mods` VALUES (15688, 25, 6);
INSERT INTO `item_mods` VALUES (15688, 72, 1);
INSERT INTO `item_mods` VALUES (15689, 1, 12);
INSERT INTO `item_mods` VALUES (15689, 2, -7);
INSERT INTO `item_mods` VALUES (15689, 25, 1);
INSERT INTO `item_mods` VALUES (15689, 26, 2);
INSERT INTO `item_mods` VALUES (15689, 68, 1);
INSERT INTO `item_mods` VALUES (15690, 1, 11);
INSERT INTO `item_mods` VALUES (15690, 12, 3);
INSERT INTO `item_mods` VALUES (15690, 13, 3);
INSERT INTO `item_mods` VALUES (15690, 28, 2);
INSERT INTO `item_mods` VALUES (15690, 68, 5);
INSERT INTO `item_mods` VALUES (15691, 1, 9);
INSERT INTO `item_mods` VALUES (15691, 8, 2);
INSERT INTO `item_mods` VALUES (15691, 72, 2);
INSERT INTO `item_mods` VALUES (15692, 1, 11);
INSERT INTO `item_mods` VALUES (15693, 1, 12);
INSERT INTO `item_mods` VALUES (15693, 8, 2);
INSERT INTO `item_mods` VALUES (15693, 11, 2);
INSERT INTO `item_mods` VALUES (15694, 1, 13);
INSERT INTO `item_mods` VALUES (15694, 2, -7);
INSERT INTO `item_mods` VALUES (15694, 25, 2);
INSERT INTO `item_mods` VALUES (15694, 26, 3);
INSERT INTO `item_mods` VALUES (15694, 68, 2);
INSERT INTO `item_mods` VALUES (15695, 1, 13);
INSERT INTO `item_mods` VALUES (15695, 9, 4);
INSERT INTO `item_mods` VALUES (15695, 25, 3);
INSERT INTO `item_mods` VALUES (15695, 26, 3);
INSERT INTO `item_mods` VALUES (15696, 1, 13);
INSERT INTO `item_mods` VALUES (15696, 2, 20);
INSERT INTO `item_mods` VALUES (15696, 26, 1);
INSERT INTO `item_mods` VALUES (15696, 59, 5);
INSERT INTO `item_mods` VALUES (15697, 1, 14);
INSERT INTO `item_mods` VALUES (15697, 2, 25);
INSERT INTO `item_mods` VALUES (15697, 26, 2);
INSERT INTO `item_mods` VALUES (15697, 59, 6);
INSERT INTO `item_mods` VALUES (15698, 1, 9);
INSERT INTO `item_mods` VALUES (15699, 1, 11);
INSERT INTO `item_mods` VALUES (15699, 28, 2);
INSERT INTO `item_mods` VALUES (15699, 111, 5);
INSERT INTO `item_mods` VALUES (15700, 1, 13);
INSERT INTO `item_mods` VALUES (15700, 56, 8);
INSERT INTO `item_mods` VALUES (15700, 57, 8);
INSERT INTO `item_mods` VALUES (15700, 249, 2);
INSERT INTO `item_mods` VALUES (15700, 362, 10);
INSERT INTO `item_mods` VALUES (15701, 1, 13);
INSERT INTO `item_mods` VALUES (15701, 5, 18);
INSERT INTO `item_mods` VALUES (15701, 27, -5);
INSERT INTO `item_mods` VALUES (15701, 71, 1);
INSERT INTO `item_mods` VALUES (15702, 1, 14);
INSERT INTO `item_mods` VALUES (15702, 14, 4);
INSERT INTO `item_mods` VALUES (15702, 58, 8);
INSERT INTO `item_mods` VALUES (15702, 244, 2);
INSERT INTO `item_mods` VALUES (15702, 245, 2);
INSERT INTO `item_mods` VALUES (15703, 1, 22);
INSERT INTO `item_mods` VALUES (15703, 10, 2);
INSERT INTO `item_mods` VALUES (15703, 11, 2);
INSERT INTO `item_mods` VALUES (15703, 23, 2);
INSERT INTO `item_mods` VALUES (15703, 25, 2);
INSERT INTO `item_mods` VALUES (15703, 68, 2);
INSERT INTO `item_mods` VALUES (15703, 161, -2);
INSERT INTO `item_mods` VALUES (15704, 1, 23);
INSERT INTO `item_mods` VALUES (15704, 10, 3);
INSERT INTO `item_mods` VALUES (15704, 11, 3);
INSERT INTO `item_mods` VALUES (15704, 23, 3);
INSERT INTO `item_mods` VALUES (15704, 25, 3);
INSERT INTO `item_mods` VALUES (15704, 68, 3);
INSERT INTO `item_mods` VALUES (15704, 161, -3);
INSERT INTO `item_mods` VALUES (15705, 1, 14);
INSERT INTO `item_mods` VALUES (15705, 2, 22);
INSERT INTO `item_mods` VALUES (15705, 5, 22);
INSERT INTO `item_mods` VALUES (15705, 29, 4);
INSERT INTO `item_mods` VALUES (15705, 244, 2);
INSERT INTO `item_mods` VALUES (15706, 1, 9);
INSERT INTO `item_mods` VALUES (15706, 2, 12);
INSERT INTO `item_mods` VALUES (15706, 5, 12);
INSERT INTO `item_mods` VALUES (15707, 1, 10);
INSERT INTO `item_mods` VALUES (15707, 2, 13);
INSERT INTO `item_mods` VALUES (15707, 5, 13);
INSERT INTO `item_mods` VALUES (15708, 1, 13);
INSERT INTO `item_mods` VALUES (15708, 2, 9);
INSERT INTO `item_mods` VALUES (15708, 56, 10);
INSERT INTO `item_mods` VALUES (15708, 57, 10);
INSERT INTO `item_mods` VALUES (15708, 162, -4);
INSERT INTO `item_mods` VALUES (15709, 1, 20);
INSERT INTO `item_mods` VALUES (15709, 23, 5);
INSERT INTO `item_mods` VALUES (15710, 1, 18);
INSERT INTO `item_mods` VALUES (15710, 14, 5);
INSERT INTO `item_mods` VALUES (15711, 1, 20);
INSERT INTO `item_mods` VALUES (15711, 3, 2);
INSERT INTO `item_mods` VALUES (15711, 6, 2);
INSERT INTO `item_mods` VALUES (15711, 10, 3);
INSERT INTO `item_mods` VALUES (15711, 11, 3);
INSERT INTO `item_mods` VALUES (15711, 23, 7);
INSERT INTO `item_mods` VALUES (15711, 25, 7);
INSERT INTO `item_mods` VALUES (15711, 68, -7);
INSERT INTO `item_mods` VALUES (15712, 1, 4);
INSERT INTO `item_mods` VALUES (15712, 10, 1);
INSERT INTO `item_mods` VALUES (15713, 1, 6);
INSERT INTO `item_mods` VALUES (15713, 10, 1);
INSERT INTO `item_mods` VALUES (15713, 11, 1);
INSERT INTO `item_mods` VALUES (15714, 1, 7);
INSERT INTO `item_mods` VALUES (15714, 10, 1);
INSERT INTO `item_mods` VALUES (15714, 11, 1);
INSERT INTO `item_mods` VALUES (15714, 25, 1);
INSERT INTO `item_mods` VALUES (15715, 1, 16);
INSERT INTO `item_mods` VALUES (15715, 8, 3);
INSERT INTO `item_mods` VALUES (15715, 10, 3);
INSERT INTO `item_mods` VALUES (15715, 25, 5);
INSERT INTO `item_mods` VALUES (15715, 26, 5);
INSERT INTO `item_mods` VALUES (15715, 68, -5);
INSERT INTO `item_mods` VALUES (15715, 169, 12);
INSERT INTO `item_mods` VALUES (15716, 1, 4);
INSERT INTO `item_mods` VALUES (15716, 25, 1);
INSERT INTO `item_mods` VALUES (15717, 1, 5);
INSERT INTO `item_mods` VALUES (15717, 10, 1);
INSERT INTO `item_mods` VALUES (15717, 25, 1);
INSERT INTO `item_mods` VALUES (15718, 1, 6);
INSERT INTO `item_mods` VALUES (15718, 8, 1);
INSERT INTO `item_mods` VALUES (15718, 10, 1);
INSERT INTO `item_mods` VALUES (15718, 25, 1);
INSERT INTO `item_mods` VALUES (15719, 1, 22);
INSERT INTO `item_mods` VALUES (15719, 23, 7);
INSERT INTO `item_mods` VALUES (15719, 25, 7);
INSERT INTO `item_mods` VALUES (15719, 27, 5);
INSERT INTO `item_mods` VALUES (15719, 73, 7);
INSERT INTO `item_mods` VALUES (15719, 384, 20);
INSERT INTO `item_mods` VALUES (15720, 1, 4);
INSERT INTO `item_mods` VALUES (15720, 23, 1);
INSERT INTO `item_mods` VALUES (15721, 1, 5);
INSERT INTO `item_mods` VALUES (15721, 23, 1);
INSERT INTO `item_mods` VALUES (15721, 27, 1);
INSERT INTO `item_mods` VALUES (15722, 1, 6);
INSERT INTO `item_mods` VALUES (15722, 23, 1);
INSERT INTO `item_mods` VALUES (15722, 27, 1);
INSERT INTO `item_mods` VALUES (15722, 73, 1);
INSERT INTO `item_mods` VALUES (15723, 1, 20);
INSERT INTO `item_mods` VALUES (15723, 6, 3);
INSERT INTO `item_mods` VALUES (15723, 13, 10);
INSERT INTO `item_mods` VALUES (15723, 27, -4);
INSERT INTO `item_mods` VALUES (15723, 114, 5);
INSERT INTO `item_mods` VALUES (15723, 117, 5);
INSERT INTO `item_mods` VALUES (15723, 120, 5);
INSERT INTO `item_mods` VALUES (15724, 1, 3);
INSERT INTO `item_mods` VALUES (15724, 6, 1);
INSERT INTO `item_mods` VALUES (15725, 1, 4);
INSERT INTO `item_mods` VALUES (15725, 6, 1);
INSERT INTO `item_mods` VALUES (15725, 13, 1);
INSERT INTO `item_mods` VALUES (15726, 1, 5);
INSERT INTO `item_mods` VALUES (15726, 6, 1);
INSERT INTO `item_mods` VALUES (15726, 13, 1);
INSERT INTO `item_mods` VALUES (15726, 27, -1);
INSERT INTO `item_mods` VALUES (15727, 1, 18);
INSERT INTO `item_mods` VALUES (15727, 5, 20);
INSERT INTO `item_mods` VALUES (15727, 8, 3);
INSERT INTO `item_mods` VALUES (15727, 12, 3);
INSERT INTO `item_mods` VALUES (15727, 13, 10);
INSERT INTO `item_mods` VALUES (15727, 27, -2);
INSERT INTO `item_mods` VALUES (15728, 1, 3);
INSERT INTO `item_mods` VALUES (15728, 5, 1);
INSERT INTO `item_mods` VALUES (15729, 1, 4);
INSERT INTO `item_mods` VALUES (15729, 5, 1);
INSERT INTO `item_mods` VALUES (15729, 8, 1);
INSERT INTO `item_mods` VALUES (15730, 1, 5);
INSERT INTO `item_mods` VALUES (15730, 5, 1);
INSERT INTO `item_mods` VALUES (15730, 8, 1);
INSERT INTO `item_mods` VALUES (15730, 27, -1);
INSERT INTO `item_mods` VALUES (15731, 1, 14);
INSERT INTO `item_mods` VALUES (15731, 2, 7);
INSERT INTO `item_mods` VALUES (15731, 5, 7);
INSERT INTO `item_mods` VALUES (15731, 23, 5);
INSERT INTO `item_mods` VALUES (15731, 25, 5);
INSERT INTO `item_mods` VALUES (15731, 27, -1);
INSERT INTO `item_mods` VALUES (15732, 1, 15);
INSERT INTO `item_mods` VALUES (15732, 2, 8);
INSERT INTO `item_mods` VALUES (15732, 5, 8);
INSERT INTO `item_mods` VALUES (15732, 23, 6);
INSERT INTO `item_mods` VALUES (15732, 25, 6);
INSERT INTO `item_mods` VALUES (15732, 27, -2);
INSERT INTO `item_mods` VALUES (15733, 1, 17);
INSERT INTO `item_mods` VALUES (15733, 5, 30);
INSERT INTO `item_mods` VALUES (15733, 8, 3);
INSERT INTO `item_mods` VALUES (15733, 11, 3);
INSERT INTO `item_mods` VALUES (15733, 27, 2);
INSERT INTO `item_mods` VALUES (15733, 160, -2);
INSERT INTO `item_mods` VALUES (15734, 1, 15);
INSERT INTO `item_mods` VALUES (15734, 8, 3);
INSERT INTO `item_mods` VALUES (15734, 12, 3);
INSERT INTO `item_mods` VALUES (15734, 13, 3);
INSERT INTO `item_mods` VALUES (15734, 25, 5);
INSERT INTO `item_mods` VALUES (15734, 30, 3);
INSERT INTO `item_mods` VALUES (15735, 1, 19);
INSERT INTO `item_mods` VALUES (15735, 9, 4);
INSERT INTO `item_mods` VALUES (15735, 12, 4);
INSERT INTO `item_mods` VALUES (15735, 13, 4);
INSERT INTO `item_mods` VALUES (15735, 14, 4);
INSERT INTO `item_mods` VALUES (15735, 30, 2);
INSERT INTO `item_mods` VALUES (15735, 68, 5);
INSERT INTO `item_mods` VALUES (15735, 71, 3);
INSERT INTO `item_mods` VALUES (15736, 1, 4);
INSERT INTO `item_mods` VALUES (15736, 11, 2);
INSERT INTO `item_mods` VALUES (15736, 169, 12);
INSERT INTO `item_mods` VALUES (15737, 1, 7);
INSERT INTO `item_mods` VALUES (15737, 384, 30);
INSERT INTO `item_mods` VALUES (15738, 1, 11);
INSERT INTO `item_mods` VALUES (15738, 25, 1);
INSERT INTO `item_mods` VALUES (15738, 68, 1);
INSERT INTO `item_mods` VALUES (15739, 1, 12);
INSERT INTO `item_mods` VALUES (15739, 25, 3);
INSERT INTO `item_mods` VALUES (15739, 68, 3);
INSERT INTO `item_mods` VALUES (15740, 1, 20);
INSERT INTO `item_mods` VALUES (15740, 2, 15);
INSERT INTO `item_mods` VALUES (15740, 5, 15);
INSERT INTO `item_mods` VALUES (15740, 11, 4);
INSERT INTO `item_mods` VALUES (15740, 23, 8);
INSERT INTO `item_mods` VALUES (15740, 25, 1);
INSERT INTO `item_mods` VALUES (15741, 1, 21);
INSERT INTO `item_mods` VALUES (15741, 2, 17);
INSERT INTO `item_mods` VALUES (15741, 5, 17);
INSERT INTO `item_mods` VALUES (15741, 11, 5);
INSERT INTO `item_mods` VALUES (15741, 23, 9);
INSERT INTO `item_mods` VALUES (15741, 25, 2);
INSERT INTO `item_mods` VALUES (15742, 1, 11);
INSERT INTO `item_mods` VALUES (15742, 13, 5);
INSERT INTO `item_mods` VALUES (15742, 14, 5);
INSERT INTO `item_mods` VALUES (15742, 27, -2);
INSERT INTO `item_mods` VALUES (15742, 30, 2);
INSERT INTO `item_mods` VALUES (15742, 161, 1);
INSERT INTO `item_mods` VALUES (15743, 1, 12);
INSERT INTO `item_mods` VALUES (15743, 13, 6);
INSERT INTO `item_mods` VALUES (15743, 14, 6);
INSERT INTO `item_mods` VALUES (15743, 27, -3);
INSERT INTO `item_mods` VALUES (15743, 30, 3);
INSERT INTO `item_mods` VALUES (15743, 161, 2);
INSERT INTO `item_mods` VALUES (15744, 1, 13);
INSERT INTO `item_mods` VALUES (15744, 25, 4);
INSERT INTO `item_mods` VALUES (15744, 26, 4);
INSERT INTO `item_mods` VALUES (15744, 54, 15);
INSERT INTO `item_mods` VALUES (15744, 55, 15);
INSERT INTO `item_mods` VALUES (15744, 56, 15);
INSERT INTO `item_mods` VALUES (15745, 1, 11);
INSERT INTO `item_mods` VALUES (15745, 8, 2);
INSERT INTO `item_mods` VALUES (15745, 9, 1);
INSERT INTO `item_mods` VALUES (15745, 54, 15);
INSERT INTO `item_mods` VALUES (15745, 55, 15);
INSERT INTO `item_mods` VALUES (15745, 56, 15);
INSERT INTO `item_mods` VALUES (15745, 384, 11);
INSERT INTO `item_mods` VALUES (15746, 1, 14);
INSERT INTO `item_mods` VALUES (15746, 2, 7);
INSERT INTO `item_mods` VALUES (15746, 23, 5);
INSERT INTO `item_mods` VALUES (15746, 68, 5);
INSERT INTO `item_mods` VALUES (15746, 492, 30);
INSERT INTO `item_mods` VALUES (15746, 495, 100);
INSERT INTO `item_mods` VALUES (15747, 1, 14);
INSERT INTO `item_mods` VALUES (15747, 2, 7);
INSERT INTO `item_mods` VALUES (15747, 23, 5);
INSERT INTO `item_mods` VALUES (15747, 68, 5);
INSERT INTO `item_mods` VALUES (15747, 492, 30);
INSERT INTO `item_mods` VALUES (15747, 495, 100);
INSERT INTO `item_mods` VALUES (15748, 1, 10);
INSERT INTO `item_mods` VALUES (15748, 5, 15);
INSERT INTO `item_mods` VALUES (15748, 27, -2);
INSERT INTO `item_mods` VALUES (15748, 489, -5);
INSERT INTO `item_mods` VALUES (15749, 1, 8);
INSERT INTO `item_mods` VALUES (15749, 11, 2);
INSERT INTO `item_mods` VALUES (15750, 1, 11);
INSERT INTO `item_mods` VALUES (15750, 25, 2);
INSERT INTO `item_mods` VALUES (15750, 26, 2);
INSERT INTO `item_mods` VALUES (15751, 1, 10);
INSERT INTO `item_mods` VALUES (15751, 13, 2);
INSERT INTO `item_mods` VALUES (15751, 14, 2);
INSERT INTO `item_mods` VALUES (15751, 55, 11);
INSERT INTO `item_mods` VALUES (15752, 1, 1);
INSERT INTO `item_mods` VALUES (15753, 1, 2);
INSERT INTO `item_mods` VALUES (15754, 1, 1);
INSERT INTO `item_mods` VALUES (15755, 1, 18);
INSERT INTO `item_mods` VALUES (15755, 2, 19);
INSERT INTO `item_mods` VALUES (15755, 27, 3);
INSERT INTO `item_mods` VALUES (15755, 29, 3);
INSERT INTO `item_mods` VALUES (15756, 1, 11);
INSERT INTO `item_mods` VALUES (15756, 8, 3);
INSERT INTO `item_mods` VALUES (15756, 68, 3);
INSERT INTO `item_mods` VALUES (15756, 289, 2);
INSERT INTO `item_mods` VALUES (15757, 1, 10);
INSERT INTO `item_mods` VALUES (15757, 25, 4);
INSERT INTO `item_mods` VALUES (15757, 27, -3);
INSERT INTO `item_mods` VALUES (15758, 1, 10);
INSERT INTO `item_mods` VALUES (15758, 2, 22);
INSERT INTO `item_mods` VALUES (15758, 5, 22);
INSERT INTO `item_mods` VALUES (15758, 28, 3);
INSERT INTO `item_mods` VALUES (15758, 296, 3);
INSERT INTO `item_mods` VALUES (15759, 1, 9);
INSERT INTO `item_mods` VALUES (15759, 28, 2);
INSERT INTO `item_mods` VALUES (15759, 29, 2);
INSERT INTO `item_mods` VALUES (15759, 169, -12);
INSERT INTO `item_mods` VALUES (15759, 384, -50);
INSERT INTO `item_mods` VALUES (15760, 1, 12);
INSERT INTO `item_mods` VALUES (15760, 54, 10);
INSERT INTO `item_mods` VALUES (15771, 8, 1);
INSERT INTO `item_mods` VALUES (15771, 9, 1);
INSERT INTO `item_mods` VALUES (15771, 10, 1);
INSERT INTO `item_mods` VALUES (15771, 11, 1);
INSERT INTO `item_mods` VALUES (15771, 12, 1);
INSERT INTO `item_mods` VALUES (15771, 13, 1);
INSERT INTO `item_mods` VALUES (15771, 14, 1);
INSERT INTO `item_mods` VALUES (15771, 245, 2);
INSERT INTO `item_mods` VALUES (15772, 8, 2);
INSERT INTO `item_mods` VALUES (15772, 9, 2);
INSERT INTO `item_mods` VALUES (15772, 10, 2);
INSERT INTO `item_mods` VALUES (15772, 11, 2);
INSERT INTO `item_mods` VALUES (15772, 12, 2);
INSERT INTO `item_mods` VALUES (15772, 13, 2);
INSERT INTO `item_mods` VALUES (15772, 14, 2);
INSERT INTO `item_mods` VALUES (15772, 245, 3);
INSERT INTO `item_mods` VALUES (15775, 1, 5);
INSERT INTO `item_mods` VALUES (15775, 29, 2);
INSERT INTO `item_mods` VALUES (15775, 246, 2);
INSERT INTO `item_mods` VALUES (15776, 2, 15);
INSERT INTO `item_mods` VALUES (15776, 5, 15);
INSERT INTO `item_mods` VALUES (15776, 242, 2);
INSERT INTO `item_mods` VALUES (15777, 12, 3);
INSERT INTO `item_mods` VALUES (15777, 13, 3);
INSERT INTO `item_mods` VALUES (15777, 245, 2);
INSERT INTO `item_mods` VALUES (15778, 1, 7);
INSERT INTO `item_mods` VALUES (15778, 9, 3);
INSERT INTO `item_mods` VALUES (15778, 10, 3);
INSERT INTO `item_mods` VALUES (15778, 252, 2);
INSERT INTO `item_mods` VALUES (15779, 8, 3);
INSERT INTO `item_mods` VALUES (15779, 11, 3);
INSERT INTO `item_mods` VALUES (15779, 244, 2);
INSERT INTO `item_mods` VALUES (15780, 1, 3);
INSERT INTO `item_mods` VALUES (15780, 23, 3);
INSERT INTO `item_mods` VALUES (15780, 24, 4);
INSERT INTO `item_mods` VALUES (15780, 54, 5);
INSERT INTO `item_mods` VALUES (15781, 1, 4);
INSERT INTO `item_mods` VALUES (15781, 23, 4);
INSERT INTO `item_mods` VALUES (15781, 24, 5);
INSERT INTO `item_mods` VALUES (15781, 54, 6);
INSERT INTO `item_mods` VALUES (15782, 54, 2);
INSERT INTO `item_mods` VALUES (15782, 59, 2);
INSERT INTO `item_mods` VALUES (15783, 1, 1);
INSERT INTO `item_mods` VALUES (15784, 1, 2);
INSERT INTO `item_mods` VALUES (15784, 8, -2);
INSERT INTO `item_mods` VALUES (15784, 9, -2);
INSERT INTO `item_mods` VALUES (15784, 12, 2);
INSERT INTO `item_mods` VALUES (15784, 13, 2);
INSERT INTO `item_mods` VALUES (15785, 1, 5);
INSERT INTO `item_mods` VALUES (15785, 29, 1);
INSERT INTO `item_mods` VALUES (15785, 162, -2);
INSERT INTO `item_mods` VALUES (15787, 2, 10);
INSERT INTO `item_mods` VALUES (15787, 5, 10);
INSERT INTO `item_mods` VALUES (15787, 26, 5);
INSERT INTO `item_mods` VALUES (15788, 1, 1);
INSERT INTO `item_mods` VALUES (15788, 25, -9);
INSERT INTO `item_mods` VALUES (15788, 26, 9);
INSERT INTO `item_mods` VALUES (15789, 1, 2);
INSERT INTO `item_mods` VALUES (15789, 25, -10);
INSERT INTO `item_mods` VALUES (15789, 26, 10);
INSERT INTO `item_mods` VALUES (15791, 29, 3);
INSERT INTO `item_mods` VALUES (15792, 10, 5);
INSERT INTO `item_mods` VALUES (15794, 8, 5);
INSERT INTO `item_mods` VALUES (15795, 9, 5);
INSERT INTO `item_mods` VALUES (15796, 11, 5);
INSERT INTO `item_mods` VALUES (15797, 13, 5);
INSERT INTO `item_mods` VALUES (15798, 12, 5);
INSERT INTO `item_mods` VALUES (15799, 9, 3);
INSERT INTO `item_mods` VALUES (15799, 10, 3);
INSERT INTO `item_mods` VALUES (15799, 11, 3);
INSERT INTO `item_mods` VALUES (15799, 25, 3);
INSERT INTO `item_mods` VALUES (15800, 12, 3);
INSERT INTO `item_mods` VALUES (15800, 13, 3);
INSERT INTO `item_mods` VALUES (15800, 14, 3);
INSERT INTO `item_mods` VALUES (15800, 30, 3);
INSERT INTO `item_mods` VALUES (15801, 68, 1);
INSERT INTO `item_mods` VALUES (15801, 72, 1);
INSERT INTO `item_mods` VALUES (15802, 68, 2);
INSERT INTO `item_mods` VALUES (15802, 72, 1);
INSERT INTO `item_mods` VALUES (15803, 2, 18);
INSERT INTO `item_mods` VALUES (15803, 8, 4);
INSERT INTO `item_mods` VALUES (15803, 54, 9);
INSERT INTO `item_mods` VALUES (15804, 2, 20);
INSERT INTO `item_mods` VALUES (15804, 8, 5);
INSERT INTO `item_mods` VALUES (15804, 54, 10);
INSERT INTO `item_mods` VALUES (15805, 5, 20);
INSERT INTO `item_mods` VALUES (15805, 13, 4);
INSERT INTO `item_mods` VALUES (15805, 59, 9);
INSERT INTO `item_mods` VALUES (15805, 71, 1);
INSERT INTO `item_mods` VALUES (15806, 5, 20);
INSERT INTO `item_mods` VALUES (15806, 13, 5);
INSERT INTO `item_mods` VALUES (15806, 59, 10);
INSERT INTO `item_mods` VALUES (15806, 71, 1);
INSERT INTO `item_mods` VALUES (15807, 12, 4);
INSERT INTO `item_mods` VALUES (15807, 13, 4);
INSERT INTO `item_mods` VALUES (15807, 14, 4);
INSERT INTO `item_mods` VALUES (15807, 30, 4);
INSERT INTO `item_mods` VALUES (15808, 23, 4);
INSERT INTO `item_mods` VALUES (15808, 25, 4);
INSERT INTO `item_mods` VALUES (15809, 24, 6);
INSERT INTO `item_mods` VALUES (15809, 26, 6);
INSERT INTO `item_mods` VALUES (15811, 2, 15);
INSERT INTO `item_mods` VALUES (15811, 68, 2);
INSERT INTO `item_mods` VALUES (15812, 2, 17);
INSERT INTO `item_mods` VALUES (15812, 68, 3);
INSERT INTO `item_mods` VALUES (15813, 121, 2);
INSERT INTO `item_mods` VALUES (15814, 121, 3);
INSERT INTO `item_mods` VALUES (15817, 25, 4);
INSERT INTO `item_mods` VALUES (15817, 73, 1);
INSERT INTO `item_mods` VALUES (15818, 8, 4);
INSERT INTO `item_mods` VALUES (15819, 144, 1);
INSERT INTO `item_mods` VALUES (15820, 145, 1);
INSERT INTO `item_mods` VALUES (15821, 146, 1);
INSERT INTO `item_mods` VALUES (15822, 147, 1);
INSERT INTO `item_mods` VALUES (15823, 148, 1);
INSERT INTO `item_mods` VALUES (15824, 149, 1);
INSERT INTO `item_mods` VALUES (15825, 150, 1);
INSERT INTO `item_mods` VALUES (15826, 151, 1);
INSERT INTO `item_mods` VALUES (15827, 30, 2);
INSERT INTO `item_mods` VALUES (15827, 241, 2);
INSERT INTO `item_mods` VALUES (15827, 244, 2);
INSERT INTO `item_mods` VALUES (15827, 245, 2);
INSERT INTO `item_mods` VALUES (15828, 25, 5);
INSERT INTO `item_mods` VALUES (15828, 242, 2);
INSERT INTO `item_mods` VALUES (15828, 243, 2);
INSERT INTO `item_mods` VALUES (15828, 248, 2);
INSERT INTO `item_mods` VALUES (15829, 3, 1);
INSERT INTO `item_mods` VALUES (15830, 6, 1);
INSERT INTO `item_mods` VALUES (15832, 85, 3);
INSERT INTO `item_mods` VALUES (15833, 5, 15);
INSERT INTO `item_mods` VALUES (15836, 11, 1);
INSERT INTO `item_mods` VALUES (15837, 11, 2);
INSERT INTO `item_mods` VALUES (15837, 25, 1);
INSERT INTO `item_mods` VALUES (15838, 11, 1);
INSERT INTO `item_mods` VALUES (15839, 118, 2);
INSERT INTO `item_mods` VALUES (15839, 122, 2);
INSERT INTO `item_mods` VALUES (15844, 161, -2);

-- -------------------------------------------------------
-- Krousis Ring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (15849, 1, 15);

INSERT INTO `item_mods` VALUES (15850, 54, 5);
INSERT INTO `item_mods` VALUES (15850, 56, 5);
INSERT INTO `item_mods` VALUES (15850, 58, 5);
INSERT INTO `item_mods` VALUES (15850, 60, 5);
INSERT INTO `item_mods` VALUES (15851, 55, 5);
INSERT INTO `item_mods` VALUES (15851, 57, 5);
INSERT INTO `item_mods` VALUES (15851, 59, 5);
INSERT INTO `item_mods` VALUES (15851, 61, 5);
INSERT INTO `item_mods` VALUES (15852, 161, -1);
INSERT INTO `item_mods` VALUES (15853, 163, -2);
INSERT INTO `item_mods` VALUES (15854, 8, 4);
INSERT INTO `item_mods` VALUES (15854, 25, 2);
INSERT INTO `item_mods` VALUES (15854, 27, -1);

-- -------------------------------------------------------
-- Krousis Ring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (15855, 1, 20);

-- -------------------------------------------------------
-- Succor Ring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (15859, 5, 30); -- mp 30
INSERT INTO `item_mods` VALUES (15859, 160, -3); -- damge taken -3%

INSERT INTO `item_mods` VALUES (15861, 1, 5);
INSERT INTO `item_mods` VALUES (15862, 1, 5);
INSERT INTO `item_mods` VALUES (15863, 1, 2);
INSERT INTO `item_mods` VALUES (15863, 8, 1);
INSERT INTO `item_mods` VALUES (15863, 9, -1);
INSERT INTO `item_mods` VALUES (15863, 10, 1);
INSERT INTO `item_mods` VALUES (15863, 11, -1);
INSERT INTO `item_mods` VALUES (15864, 1, 2);
INSERT INTO `item_mods` VALUES (15864, 8, 1);
INSERT INTO `item_mods` VALUES (15864, 9, -1);
INSERT INTO `item_mods` VALUES (15864, 10, 1);
INSERT INTO `item_mods` VALUES (15864, 11, -1);
INSERT INTO `item_mods` VALUES (15865, 1, 2);
INSERT INTO `item_mods` VALUES (15865, 8, 1);
INSERT INTO `item_mods` VALUES (15865, 9, -1);
INSERT INTO `item_mods` VALUES (15865, 10, 1);
INSERT INTO `item_mods` VALUES (15865, 11, -1);
INSERT INTO `item_mods` VALUES (15866, 1, 2);
INSERT INTO `item_mods` VALUES (15866, 8, 1);
INSERT INTO `item_mods` VALUES (15866, 9, -1);
INSERT INTO `item_mods` VALUES (15866, 10, 1);
INSERT INTO `item_mods` VALUES (15866, 11, -1);
INSERT INTO `item_mods` VALUES (15867, 1, 7);
INSERT INTO `item_mods` VALUES (15867, 2, 20);
INSERT INTO `item_mods` VALUES (15867, 14, 3);
INSERT INTO `item_mods` VALUES (15868, 1, 7);
INSERT INTO `item_mods` VALUES (15868, 2, 20);
INSERT INTO `item_mods` VALUES (15868, 14, 3);
INSERT INTO `item_mods` VALUES (15869, 1, 7);
INSERT INTO `item_mods` VALUES (15869, 2, 20);
INSERT INTO `item_mods` VALUES (15869, 14, 3);
INSERT INTO `item_mods` VALUES (15870, 1, 7);
INSERT INTO `item_mods` VALUES (15870, 2, 20);
INSERT INTO `item_mods` VALUES (15870, 14, 3);
INSERT INTO `item_mods` VALUES (15871, 1, 5);
INSERT INTO `item_mods` VALUES (15871, 8, 5);
INSERT INTO `item_mods` VALUES (15871, 25, 7);
INSERT INTO `item_mods` VALUES (15871, 166, -2);
INSERT INTO `item_mods` VALUES (15872, 1, 4);
INSERT INTO `item_mods` VALUES (15872, 5, 40);
INSERT INTO `item_mods` VALUES (15872, 13, 6);
INSERT INTO `item_mods` VALUES (15872, 71, 3);
INSERT INTO `item_mods` VALUES (15873, 1, 4);
INSERT INTO `item_mods` VALUES (15873, 12, 4);
INSERT INTO `item_mods` VALUES (15873, 13, 4);
INSERT INTO `item_mods` VALUES (15873, 71, 4);
INSERT INTO `item_mods` VALUES (15873, 72, 4);
INSERT INTO `item_mods` VALUES (15874, 1, 4);
INSERT INTO `item_mods` VALUES (15874, 2, 20);
INSERT INTO `item_mods` VALUES (15874, 12, 6);
INSERT INTO `item_mods` VALUES (15874, 168, 8);
INSERT INTO `item_mods` VALUES (15875, 1, 5);
INSERT INTO `item_mods` VALUES (15875, 14, 6);
INSERT INTO `item_mods` VALUES (15875, 25, 7);
INSERT INTO `item_mods` VALUES (15875, 27, -3);
INSERT INTO `item_mods` VALUES (15876, 1, 4);
INSERT INTO `item_mods` VALUES (15876, 11, 5);
INSERT INTO `item_mods` VALUES (15876, 24, 7);
INSERT INTO `item_mods` VALUES (15876, 26, 7);
INSERT INTO `item_mods` VALUES (15877, 1, 4);
INSERT INTO `item_mods` VALUES (15877, 30, 2);
INSERT INTO `item_mods` VALUES (15877, 68, 4);
INSERT INTO `item_mods` VALUES (15877, 384, 40);
INSERT INTO `item_mods` VALUES (15878, 1, 5);
INSERT INTO `item_mods` VALUES (15878, 10, 5);
INSERT INTO `item_mods` VALUES (15878, 23, 7);
INSERT INTO `item_mods` VALUES (15878, 25, 7);
INSERT INTO `item_mods` VALUES (15879, 1, 4);
INSERT INTO `item_mods` VALUES (15879, 9, 5);
INSERT INTO `item_mods` VALUES (15879, 25, 7);
INSERT INTO `item_mods` VALUES (15879, 26, 7);
INSERT INTO `item_mods` VALUES (15880, 1, 2);
INSERT INTO `item_mods` VALUES (15880, 9, 1);
INSERT INTO `item_mods` VALUES (15880, 298, 1);
INSERT INTO `item_mods` VALUES (15881, 1, 1);
INSERT INTO `item_mods` VALUES (15882, 1, 4);
INSERT INTO `item_mods` VALUES (15882, 8, 4);
INSERT INTO `item_mods` VALUES (15882, 10, 4);
INSERT INTO `item_mods` VALUES (15883, 1, 3);
INSERT INTO `item_mods` VALUES (15883, 5, 20);
INSERT INTO `item_mods` VALUES (15884, 1, 5);
INSERT INTO `item_mods` VALUES (15884, 8, 3);
INSERT INTO `item_mods` VALUES (15884, 25, 8);
INSERT INTO `item_mods` VALUES (15885, 1, 5);
INSERT INTO `item_mods` VALUES (15885, 5, 10);
INSERT INTO `item_mods` VALUES (15885, 27, -4);
INSERT INTO `item_mods` VALUES (15886, 1, 5);
INSERT INTO `item_mods` VALUES (15886, 25, 5);
INSERT INTO `item_mods` VALUES (15886, 26, 5);
INSERT INTO `item_mods` VALUES (15887, 1, 5);
INSERT INTO `item_mods` VALUES (15887, 29, 2);
INSERT INTO `item_mods` VALUES (15887, 168, 8);
INSERT INTO `item_mods` VALUES (15888, 1, 5);
INSERT INTO `item_mods` VALUES (15888, 26, 4);
INSERT INTO `item_mods` VALUES (15888, 106, 5);
INSERT INTO `item_mods` VALUES (15889, 1, 2);
INSERT INTO `item_mods` VALUES (15890, 1, 7);
INSERT INTO `item_mods` VALUES (15890, 2, 22);
INSERT INTO `item_mods` VALUES (15890, 9, 2);
INSERT INTO `item_mods` VALUES (15890, 10, 5);
INSERT INTO `item_mods` VALUES (15890, 72, 1);
INSERT INTO `item_mods` VALUES (15891, 1, 4);
INSERT INTO `item_mods` VALUES (15891, 5, 15);
INSERT INTO `item_mods` VALUES (15891, 12, 2);
INSERT INTO `item_mods` VALUES (15891, 13, 2);
INSERT INTO `item_mods` VALUES (15891, 14, 2);
INSERT INTO `item_mods` VALUES (15891, 168, 6);
INSERT INTO `item_mods` VALUES (15892, 1, 5);
INSERT INTO `item_mods` VALUES (15892, 5, 17);
INSERT INTO `item_mods` VALUES (15892, 12, 3);
INSERT INTO `item_mods` VALUES (15892, 13, 3);
INSERT INTO `item_mods` VALUES (15892, 14, 3);
INSERT INTO `item_mods` VALUES (15892, 168, 8);
INSERT INTO `item_mods` VALUES (15893, 1, 8);
INSERT INTO `item_mods` VALUES (15893, 2, 24);
INSERT INTO `item_mods` VALUES (15893, 9, 3);
INSERT INTO `item_mods` VALUES (15893, 10, 5);
INSERT INTO `item_mods` VALUES (15893, 72, 2);
INSERT INTO `item_mods` VALUES (15894, 25, -20);
INSERT INTO `item_mods` VALUES (15894, 28, 2);
INSERT INTO `item_mods` VALUES (15894, 30, -1);
INSERT INTO `item_mods` VALUES (15894, 68, -20);
INSERT INTO `item_mods` VALUES (15894, 384, -50);
INSERT INTO `item_mods` VALUES (15895, 1, 5);
INSERT INTO `item_mods` VALUES (15895, 2, 14);
INSERT INTO `item_mods` VALUES (15895, 27, 4);
INSERT INTO `item_mods` VALUES (15896, 1, 3);
INSERT INTO `item_mods` VALUES (15896, 5, 25);
INSERT INTO `item_mods` VALUES (15896, 12, 3);
INSERT INTO `item_mods` VALUES (15896, 27, -1);
INSERT INTO `item_mods` VALUES (15897, 1, 2);
INSERT INTO `item_mods` VALUES (15897, 5, 22);
INSERT INTO `item_mods` VALUES (15897, 11, 3);
INSERT INTO `item_mods` VALUES (15897, 13, 3);
INSERT INTO `item_mods` VALUES (15898, 1, 7);
INSERT INTO `item_mods` VALUES (15898, 168, 8);
INSERT INTO `item_mods` VALUES (15899, 384, 61);
INSERT INTO `item_mods` VALUES (15900, 1, 6);
INSERT INTO `item_mods` VALUES (15900, 25, 10);
INSERT INTO `item_mods` VALUES (15901, 1, 6);
INSERT INTO `item_mods` VALUES (15901, 23, 10);
INSERT INTO `item_mods` VALUES (15902, 1, 4);
INSERT INTO `item_mods` VALUES (15902, 5, 48);
INSERT INTO `item_mods` VALUES (15903, 1, 4);
INSERT INTO `item_mods` VALUES (15903, 12, 5);
INSERT INTO `item_mods` VALUES (15903, 13, 5);
INSERT INTO `item_mods` VALUES (15904, 1, 4);
INSERT INTO `item_mods` VALUES (15904, 27, -5);
INSERT INTO `item_mods` VALUES (15905, 1, 2);
INSERT INTO `item_mods` VALUES (15905, 5, 10);
INSERT INTO `item_mods` VALUES (15905, 71, 1);
INSERT INTO `item_mods` VALUES (15906, 1, 3);
INSERT INTO `item_mods` VALUES (15906, 5, 12);
INSERT INTO `item_mods` VALUES (15906, 71, 2);
INSERT INTO `item_mods` VALUES (15907, 1, 4);
INSERT INTO `item_mods` VALUES (15907, 5, 12);
INSERT INTO `item_mods` VALUES (15907, 71, 2);
INSERT INTO `item_mods` VALUES (15908, 1, 5);
INSERT INTO `item_mods` VALUES (15908, 5, 14);
INSERT INTO `item_mods` VALUES (15908, 71, 3);
INSERT INTO `item_mods` VALUES (15910, 14, 5);
INSERT INTO `item_mods` VALUES (15911, 1, 4);
INSERT INTO `item_mods` VALUES (15911, 8, 4);
INSERT INTO `item_mods` VALUES (15911, 26, 7);
INSERT INTO `item_mods` VALUES (15911, 27, -4);
INSERT INTO `item_mods` VALUES (15912, 1, 5);
INSERT INTO `item_mods` VALUES (15912, 2, 15);
INSERT INTO `item_mods` VALUES (15912, 5, 15);
INSERT INTO `item_mods` VALUES (15912, 162, -2);
INSERT INTO `item_mods` VALUES (15912, 163, -5);
INSERT INTO `item_mods` VALUES (15913, 1, 4);
INSERT INTO `item_mods` VALUES (15913, 246, 2);
INSERT INTO `item_mods` VALUES (15913, 289, 5);
INSERT INTO `item_mods` VALUES (15914, 1, 5);
INSERT INTO `item_mods` VALUES (15914, 246, 3);
INSERT INTO `item_mods` VALUES (15914, 289, 10);
INSERT INTO `item_mods` VALUES (15915, 1, 5);
INSERT INTO `item_mods` VALUES (15915, 12, 4);
INSERT INTO `item_mods` VALUES (15915, 13, 4);
INSERT INTO `item_mods` VALUES (15916, 1, 4);
INSERT INTO `item_mods` VALUES (15916, 24, 3);
INSERT INTO `item_mods` VALUES (15916, 26, 3);
INSERT INTO `item_mods` VALUES (15917, 1, 6);
INSERT INTO `item_mods` VALUES (15917, 2, 15);
INSERT INTO `item_mods` VALUES (15917, 9, 6);
INSERT INTO `item_mods` VALUES (15917, 23, 10);
INSERT INTO `item_mods` VALUES (15918, 1, 4);
INSERT INTO `item_mods` VALUES (15918, 12, 5);
INSERT INTO `item_mods` VALUES (15918, 13, 5);
INSERT INTO `item_mods` VALUES (15918, 30, 2);
INSERT INTO `item_mods` VALUES (15920, 1, 4);
INSERT INTO `item_mods` VALUES (15920, 8, 4);
INSERT INTO `item_mods` VALUES (15920, 24, 5);
INSERT INTO `item_mods` VALUES (15920, 26, 8);
INSERT INTO `item_mods` VALUES (15922, 9, 2);
INSERT INTO `item_mods` VALUES (15922, 25, 3);
INSERT INTO `item_mods` VALUES (15923, 1, 4);
INSERT INTO `item_mods` VALUES (15923, 8, 3);
INSERT INTO `item_mods` VALUES (15923, 9, 3);
INSERT INTO `item_mods` VALUES (15923, 11, 3);
INSERT INTO `item_mods` VALUES (15923, 23, 3);
INSERT INTO `item_mods` VALUES (15924, 1, 6);
INSERT INTO `item_mods` VALUES (15924, 5, 15);
INSERT INTO `item_mods` VALUES (15924, 12, 3);
INSERT INTO `item_mods` VALUES (15924, 13, 3);
INSERT INTO `item_mods` VALUES (15924, 14, 3);
INSERT INTO `item_mods` VALUES (15925, 1, 6);
INSERT INTO `item_mods` VALUES (15925, 5, 20);
INSERT INTO `item_mods` VALUES (15925, 12, 5);
INSERT INTO `item_mods` VALUES (15925, 13, 5);
INSERT INTO `item_mods` VALUES (15925, 29, 2);
INSERT INTO `item_mods` VALUES (15925, 30, 2);
INSERT INTO `item_mods` VALUES (15926, 26, 1);
INSERT INTO `item_mods` VALUES (15927, 1, 2);
INSERT INTO `item_mods` VALUES (15928, 25, 9);
INSERT INTO `item_mods` VALUES (15934, 116, 2);

-- -------------------------------------------------------
-- Earthy Belt
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (15936, 43, 3); -- Earth Elemental Magic Accuracy+3
-- [NOT CODED] Campaign: Earth Elemental Magic Accuracy+15

INSERT INTO `item_mods` VALUES (15937, 2, 20);
INSERT INTO `item_mods` VALUES (15938, 5, 20);
INSERT INTO `item_mods` VALUES (15939, 1, 1);
INSERT INTO `item_mods` VALUES (15939, 2, 1);
INSERT INTO `item_mods` VALUES (15939, 5, 1);
INSERT INTO `item_mods` VALUES (15939, 14, 1);
INSERT INTO `item_mods` VALUES (15940, 1, 2);
INSERT INTO `item_mods` VALUES (15940, 308, 5);
INSERT INTO `item_mods` VALUES (15941, 23, 4);
INSERT INTO `item_mods` VALUES (15941, 384, 30);
INSERT INTO `item_mods` VALUES (15942, 5, 6);
INSERT INTO `item_mods` VALUES (15942, 117, 2);
INSERT INTO `item_mods` VALUES (15943, 23, 4);
INSERT INTO `item_mods` VALUES (15943, 25, 12);
INSERT INTO `item_mods` VALUES (15944, 10, 2);
INSERT INTO `item_mods` VALUES (15944, 14, 2);
INSERT INTO `item_mods` VALUES (15945, 1, 4);
INSERT INTO `item_mods` VALUES (15945, 11, 3);
INSERT INTO `item_mods` VALUES (15945, 26, 3);
INSERT INTO `item_mods` VALUES (15946, 10, 1);
INSERT INTO `item_mods` VALUES (15947, 1, 2);
INSERT INTO `item_mods` VALUES (15947, 2, 2);
INSERT INTO `item_mods` VALUES (15947, 5, 2);
INSERT INTO `item_mods` VALUES (15947, 14, 2);

-- -------------------------------------------------------
-- Bobcat Belt
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (15948, 1, 6); -- def 6
INSERT INTO `item_mods` VALUES (15948, 8, 8); -- str 8
INSERT INTO `item_mods` VALUES (15948, 23, -6); -- attack -6
INSERT INTO `item_mods` VALUES (15948, 73, -6); -- store tp -6

-- -------------------------------------------------------
-- Pythia Sash
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (15949, 1, 4); -- def 4
INSERT INTO `item_mods` VALUES (15949, 13, 5); -- mnd 5
INSERT INTO `item_mods` VALUES (15949, 27, -4); -- enmity -4
INSERT INTO `item_mods` VALUES (15949, 296, 4); -- conserve mp +4

-- -------------------------------------------------------
-- Pythia Sash +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (15950, 1, 4); -- def 4
INSERT INTO `item_mods` VALUES (15950, 13, 6); -- mnd 6
INSERT INTO `item_mods` VALUES (15950, 27, -4); -- enmity -4
INSERT INTO `item_mods` VALUES (15950, 296, 5); -- conserve mp +5

-- -------------------------------------------------------
-- Toxon Belt
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (15951, 1, 5); -- def 5
INSERT INTO `item_mods` VALUES (15951, 8, 2); -- str 2
INSERT INTO `item_mods` VALUES (15951, 11, -4); -- agi -4
INSERT INTO `item_mods` VALUES (15951, 24, 9); -- ranged attack 9
INSERT INTO `item_mods` VALUES (15951, 26, -11); -- ranged accuracy -11

-- -------------------------------------------------------
-- Toxon Belt +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (15952, 1, 5); -- def 5
INSERT INTO `item_mods` VALUES (15952, 8, 3); -- str 3
INSERT INTO `item_mods` VALUES (15952, 11, -3); -- agi -3
INSERT INTO `item_mods` VALUES (15952, 24, 10); -- ranged attack 10
INSERT INTO `item_mods` VALUES (15952, 26, -10); -- ranged accuracy -10

-- -------------------------------------------------------
-- Marching Belt
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (15953, 1, 3); -- def 3
INSERT INTO `item_mods` VALUES (15953, 7, 15); -- hp to mp 15
INSERT INTO `item_mods` VALUES (15953, 121, 3); -- wind skill +3

-- -------------------------------------------------------
-- Fierce Belt
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (15954, 23, 15); -- attack +15

-- -------------------------------------------------------
-- Fatality Belt *Has Latent Effect
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (15955, 1, 7); -- def 7
INSERT INTO `item_mods` VALUES (15955, 9, 4); -- dex 4
INSERT INTO `item_mods` VALUES (15955, 25, 4); -- accuracy 4

INSERT INTO `item_mods` VALUES (15961, 68, 5);
INSERT INTO `item_mods` VALUES (15961, 120, 5);
INSERT INTO `item_mods` VALUES (15961, 121, 5);
INSERT INTO `item_mods` VALUES (15962, 13, 2);
INSERT INTO `item_mods` VALUES (15962, 29, 2);
INSERT INTO `item_mods` VALUES (15962, 487, 5);
INSERT INTO `item_mods` VALUES (15963, 5, 20);
INSERT INTO `item_mods` VALUES (15963, 71, 1);
INSERT INTO `item_mods` VALUES (15963, 168, 8);
INSERT INTO `item_mods` VALUES (15963, 296, 5);
INSERT INTO `item_mods` VALUES (15964, 9, 2);
INSERT INTO `item_mods` VALUES (15964, 25, 3);
INSERT INTO `item_mods` VALUES (15964, 26, 3);
INSERT INTO `item_mods` VALUES (15964, 432, 3);
INSERT INTO `item_mods` VALUES (15965, 2, 15);
INSERT INTO `item_mods` VALUES (15965, 23, 5);
INSERT INTO `item_mods` VALUES (15965, 68, 5);
INSERT INTO `item_mods` VALUES (15965, 516, 3);
INSERT INTO `item_mods` VALUES (15966, 24, 2);

-- -------------------------------------------------------
-- Temple Earring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (15967, 46, 1); -- Light Elemental Magic Accuracy+1
-- [NOT CODED] Campaign: Light Elemental Magic Accuracy+15

INSERT INTO `item_mods` VALUES (15968, 23, 5);
INSERT INTO `item_mods` VALUES (15970, 2, 20);
INSERT INTO `item_mods` VALUES (15970, 72, 1);
INSERT INTO `item_mods` VALUES (15970, 251, 2);
INSERT INTO `item_mods` VALUES (15971, 5, 15);
INSERT INTO `item_mods` VALUES (15971, 71, 1);
INSERT INTO `item_mods` VALUES (15971, 241, 2);
INSERT INTO `item_mods` VALUES (15972, 2, 15);
INSERT INTO `item_mods` VALUES (15972, 5, 15);
INSERT INTO `item_mods` VALUES (15972, 240, 2);
INSERT INTO `item_mods` VALUES (15973, 26, 2);
INSERT INTO `item_mods` VALUES (15973, 243, 2);
INSERT INTO `item_mods` VALUES (15974, 68, 4);
INSERT INTO `item_mods` VALUES (15974, 250, 2);
INSERT INTO `item_mods` VALUES (15978, 5, 10);
INSERT INTO `item_mods` VALUES (15978, 71, 1);
INSERT INTO `item_mods` VALUES (15979, 8, 1);
INSERT INTO `item_mods` VALUES (15979, 25, 3);
INSERT INTO `item_mods` VALUES (15979, 225, 2);
INSERT INTO `item_mods` VALUES (15980, 26, 1);
INSERT INTO `item_mods` VALUES (15980, 71, 1);
INSERT INTO `item_mods` VALUES (15980, 72, 1);
INSERT INTO `item_mods` VALUES (15981, 1, 1);
INSERT INTO `item_mods` VALUES (15982, 1, 1);
INSERT INTO `item_mods` VALUES (15983, 1, 1);
INSERT INTO `item_mods` VALUES (15984, 252, 2);
INSERT INTO `item_mods` VALUES (15985, 242, 2);
INSERT INTO `item_mods` VALUES (15986, 10, 3);
INSERT INTO `item_mods` VALUES (15987, 14, 3);
INSERT INTO `item_mods` VALUES (15988, 26, 2);
INSERT INTO `item_mods` VALUES (15989, 5, 15);
INSERT INTO `item_mods` VALUES (15990, 9, 2);
INSERT INTO `item_mods` VALUES (15990, 14, 2);
INSERT INTO `item_mods` VALUES (15990, 27, -3);
INSERT INTO `item_mods` VALUES (15991, 5, 20);
INSERT INTO `item_mods` VALUES (15991, 13, 2);
INSERT INTO `item_mods` VALUES (15991, 54, 11);
INSERT INTO `item_mods` VALUES (15991, 59, 11);
INSERT INTO `item_mods` VALUES (15992, 5, 22);
INSERT INTO `item_mods` VALUES (15992, 13, 3);
INSERT INTO `item_mods` VALUES (15992, 54, 12);
INSERT INTO `item_mods` VALUES (15992, 59, 12);
INSERT INTO `item_mods` VALUES (15993, 2, 20);
INSERT INTO `item_mods` VALUES (15993, 54, 10);
INSERT INTO `item_mods` VALUES (15993, 55, 10);
INSERT INTO `item_mods` VALUES (15994, 2, 25);
INSERT INTO `item_mods` VALUES (15994, 8, 2);
INSERT INTO `item_mods` VALUES (15994, 54, 11);
INSERT INTO `item_mods` VALUES (15994, 55, 11);
INSERT INTO `item_mods` VALUES (15995, 9, 1);
INSERT INTO `item_mods` VALUES (15995, 12, 1);
INSERT INTO `item_mods` VALUES (15995, 296, 1);
INSERT INTO `item_mods` VALUES (16001, 2, 5);
INSERT INTO `item_mods` VALUES (16001, 5, -5);
INSERT INTO `item_mods` VALUES (16001, 28, 2);
INSERT INTO `item_mods` VALUES (16002, 1, 1);
INSERT INTO `item_mods` VALUES (16009, 2, 15);
INSERT INTO `item_mods` VALUES (16009, 11, 2);
INSERT INTO `item_mods` VALUES (16010, 2, 17);
INSERT INTO `item_mods` VALUES (16010, 11, 3);
INSERT INTO `item_mods` VALUES (16011, 30, 1);
INSERT INTO `item_mods` VALUES (16012, 13, 3);
INSERT INTO `item_mods` VALUES (16013, 24, 1);
INSERT INTO `item_mods` VALUES (16013, 106, 1);
INSERT INTO `item_mods` VALUES (16034, 14, 2);
INSERT INTO `item_mods` VALUES (16034, 25, 2);
INSERT INTO `item_mods` VALUES (16035, 26, 1);
INSERT INTO `item_mods` VALUES (16036, 24, 1);
INSERT INTO `item_mods` VALUES (16037, 2, 5);
INSERT INTO `item_mods` VALUES (16038, 5, 5);

-- -------------------------------------------------------
-- Incubus Earring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16052, 27, 1); -- enmity +1
INSERT INTO `item_mods` VALUES (16052, 30, 2); -- magic accuracy +2

-- -------------------------------------------------------
-- Incubus Earring +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16053, 27, 1); -- enmity +1
INSERT INTO `item_mods` VALUES (16053, 30, 3); -- magic accuracy +3


-- -------------------------------------------------------
-- Hirudinea Earring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16054, 2, -5); -- hp -5
INSERT INTO `item_mods` VALUES (16054, 5, -5); -- mp -5
-- [NOT CODED] Enhances effect of "Drain" and "Aspir"

-- -------------------------------------------------------
-- Choreia Earring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16055, 60, 10); -- element light +10
INSERT INTO `item_mods` VALUES (16055, 403, 2); -- Increases "Step" accuracy

-- -------------------------------------------------------
-- Pagondas Earring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16056, 1, 10); -- def 10

-- -------------------------------------------------------
-- Aesir Ear Pendant *Has Latent Effect
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16057, 23, 7); -- attack 7
INSERT INTO `item_mods` VALUES (16057, 73, 3); -- store tp 3

-- -------------------------------------------------------
-- Colossus's Earring *Has Latent Effect
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16058, 2, 10); -- hp 10
INSERT INTO `item_mods` VALUES (16058, 5, 10); -- mp 10
INSERT INTO `item_mods` VALUES (16058, 161, -1); -- physical damage taken -1%

INSERT INTO `item_mods` VALUES (16059, 7, 45);
INSERT INTO `item_mods` VALUES (16061, 1, 19);
INSERT INTO `item_mods` VALUES (16061, 2, 8);
INSERT INTO `item_mods` VALUES (16061, 8, 3);
INSERT INTO `item_mods` VALUES (16061, 11, 3);
INSERT INTO `item_mods` VALUES (16062, 1, 23);
INSERT INTO `item_mods` VALUES (16062, 23, 5);
INSERT INTO `item_mods` VALUES (16062, 68, 2);
INSERT INTO `item_mods` VALUES (16062, 72, 2);
INSERT INTO `item_mods` VALUES (16063, 1, 21);
INSERT INTO `item_mods` VALUES (16063, 2, -5);
INSERT INTO `item_mods` VALUES (16063, 23, 2);
INSERT INTO `item_mods` VALUES (16063, 24, 1);
INSERT INTO `item_mods` VALUES (16064, 1, 21);
INSERT INTO `item_mods` VALUES (16064, 13, 4);
INSERT INTO `item_mods` VALUES (16064, 27, -5);
INSERT INTO `item_mods` VALUES (16064, 28, 2);
INSERT INTO `item_mods` VALUES (16064, 71, 1);
INSERT INTO `item_mods` VALUES (16065, 1, 15);
INSERT INTO `item_mods` VALUES (16065, 25, 4);
INSERT INTO `item_mods` VALUES (16065, 30, 2);
INSERT INTO `item_mods` VALUES (16066, 1, 15);
INSERT INTO `item_mods` VALUES (16066, 5, 18);
INSERT INTO `item_mods` VALUES (16066, 29, 2);
INSERT INTO `item_mods` VALUES (16066, 71, 1);
INSERT INTO `item_mods` VALUES (16067, 1, 20);
INSERT INTO `item_mods` VALUES (16067, 2, 10);
INSERT INTO `item_mods` VALUES (16067, 8, 4);
INSERT INTO `item_mods` VALUES (16067, 11, 4);
INSERT INTO `item_mods` VALUES (16068, 1, 22);
INSERT INTO `item_mods` VALUES (16068, 2, -5);
INSERT INTO `item_mods` VALUES (16068, 23, 3);
INSERT INTO `item_mods` VALUES (16068, 24, 2);
INSERT INTO `item_mods` VALUES (16069, 1, 15);
INSERT INTO `item_mods` VALUES (16069, 2, 25);
INSERT INTO `item_mods` VALUES (16069, 23, 5);
INSERT INTO `item_mods` VALUES (16069, 25, 7);
INSERT INTO `item_mods` VALUES (16069, 26, 7);
INSERT INTO `item_mods` VALUES (16071, 1, 27);
INSERT INTO `item_mods` VALUES (16072, 1, 22);
INSERT INTO `item_mods` VALUES (16072, 23, 2);
INSERT INTO `item_mods` VALUES (16072, 25, 2);
INSERT INTO `item_mods` VALUES (16072, 384, 11);
INSERT INTO `item_mods` VALUES (16073, 1, 30);
INSERT INTO `item_mods` VALUES (16073, 9, 1);
INSERT INTO `item_mods` VALUES (16073, 11, 2);
INSERT INTO `item_mods` VALUES (16073, 25, 5);
INSERT INTO `item_mods` VALUES (16073, 68, 5);
INSERT INTO `item_mods` VALUES (16073, 163, -5);
INSERT INTO `item_mods` VALUES (16074, 1, 31);
INSERT INTO `item_mods` VALUES (16074, 9, 2);
INSERT INTO `item_mods` VALUES (16074, 11, 3);
INSERT INTO `item_mods` VALUES (16074, 25, 6);
INSERT INTO `item_mods` VALUES (16074, 68, 6);
INSERT INTO `item_mods` VALUES (16074, 163, -7);
INSERT INTO `item_mods` VALUES (16075, 1, 1);
INSERT INTO `item_mods` VALUES (16076, 1, 2);
INSERT INTO `item_mods` VALUES (16077, 1, 18);
INSERT INTO `item_mods` VALUES (16078, 1, 7);
INSERT INTO `item_mods` VALUES (16079, 1, 17);
INSERT INTO `item_mods` VALUES (16079, 2, 18);
INSERT INTO `item_mods` VALUES (16079, 5, 18);
INSERT INTO `item_mods` VALUES (16080, 1, 18);
INSERT INTO `item_mods` VALUES (16080, 2, 19);
INSERT INTO `item_mods` VALUES (16080, 5, 19);
INSERT INTO `item_mods` VALUES (16080, 13, 1);
INSERT INTO `item_mods` VALUES (16081, 1, 18);
INSERT INTO `item_mods` VALUES (16081, 2, 25);
INSERT INTO `item_mods` VALUES (16081, 5, 25);
INSERT INTO `item_mods` VALUES (16081, 71, 1);
INSERT INTO `item_mods` VALUES (16082, 1, 27);
INSERT INTO `item_mods` VALUES (16082, 71, 2);
INSERT INTO `item_mods` VALUES (16083, 1, 28);
INSERT INTO `item_mods` VALUES (16083, 27, -4);
INSERT INTO `item_mods` VALUES (16084, 1, 28);
INSERT INTO `item_mods` VALUES (16084, 3, 2);
INSERT INTO `item_mods` VALUES (16084, 6, 2);
INSERT INTO `item_mods` VALUES (16084, 23, 12);
INSERT INTO `item_mods` VALUES (16084, 25, 12);
INSERT INTO `item_mods` VALUES (16084, 68, -12);
INSERT INTO `item_mods` VALUES (16085, 1, 6);
INSERT INTO `item_mods` VALUES (16085, 25, 1);
INSERT INTO `item_mods` VALUES (16086, 1, 11);
INSERT INTO `item_mods` VALUES (16086, 23, 1);
INSERT INTO `item_mods` VALUES (16086, 25, 1);
INSERT INTO `item_mods` VALUES (16087, 1, 13);
INSERT INTO `item_mods` VALUES (16087, 6, 1);
INSERT INTO `item_mods` VALUES (16087, 23, 1);
INSERT INTO `item_mods` VALUES (16087, 25, 1);
INSERT INTO `item_mods` VALUES (16088, 1, 15);
INSERT INTO `item_mods` VALUES (16088, 9, 4);
INSERT INTO `item_mods` VALUES (16088, 11, 4);
INSERT INTO `item_mods` VALUES (16088, 23, 6);
INSERT INTO `item_mods` VALUES (16088, 24, 6);
INSERT INTO `item_mods` VALUES (16088, 384, 30);
INSERT INTO `item_mods` VALUES (16089, 1, 4);
INSERT INTO `item_mods` VALUES (16089, 24, 1);
INSERT INTO `item_mods` VALUES (16090, 1, 9);
INSERT INTO `item_mods` VALUES (16090, 11, 1);
INSERT INTO `item_mods` VALUES (16090, 24, 1);
INSERT INTO `item_mods` VALUES (16091, 1, 10);
INSERT INTO `item_mods` VALUES (16091, 9, 1);
INSERT INTO `item_mods` VALUES (16091, 11, 1);
INSERT INTO `item_mods` VALUES (16091, 24, 1);
INSERT INTO `item_mods` VALUES (16092, 1, 20);
INSERT INTO `item_mods` VALUES (16092, 8, 3);
INSERT INTO `item_mods` VALUES (16092, 11, 3);
INSERT INTO `item_mods` VALUES (16092, 25, 7);
INSERT INTO `item_mods` VALUES (16092, 68, 7);
INSERT INTO `item_mods` VALUES (16092, 384, 30);
INSERT INTO `item_mods` VALUES (16093, 1, 5);
INSERT INTO `item_mods` VALUES (16093, 11, 1);
INSERT INTO `item_mods` VALUES (16094, 1, 10);
INSERT INTO `item_mods` VALUES (16094, 11, 1);
INSERT INTO `item_mods` VALUES (16094, 25, 1);
INSERT INTO `item_mods` VALUES (16095, 1, 12);
INSERT INTO `item_mods` VALUES (16095, 11, 1);
INSERT INTO `item_mods` VALUES (16095, 25, 1);
INSERT INTO `item_mods` VALUES (16095, 68, 1);
INSERT INTO `item_mods` VALUES (16096, 1, 17);
INSERT INTO `item_mods` VALUES (16096, 6, 4);
INSERT INTO `item_mods` VALUES (16096, 13, 3);
INSERT INTO `item_mods` VALUES (16096, 14, 3);
INSERT INTO `item_mods` VALUES (16096, 27, -3);
INSERT INTO `item_mods` VALUES (16096, 111, 7);
INSERT INTO `item_mods` VALUES (16096, 117, 7);
INSERT INTO `item_mods` VALUES (16096, 119, 7);
INSERT INTO `item_mods` VALUES (16097, 1, 3);
INSERT INTO `item_mods` VALUES (16097, 6, 1);
INSERT INTO `item_mods` VALUES (16098, 1, 8);
INSERT INTO `item_mods` VALUES (16098, 6, 1);
INSERT INTO `item_mods` VALUES (16098, 13, 1);
INSERT INTO `item_mods` VALUES (16099, 1, 9);
INSERT INTO `item_mods` VALUES (16099, 6, 1);
INSERT INTO `item_mods` VALUES (16099, 13, 1);
INSERT INTO `item_mods` VALUES (16099, 14, 1);
INSERT INTO `item_mods` VALUES (16100, 1, 15);
INSERT INTO `item_mods` VALUES (16100, 5, 20);
INSERT INTO `item_mods` VALUES (16100, 8, 4);
INSERT INTO `item_mods` VALUES (16100, 12, 4);
INSERT INTO `item_mods` VALUES (16100, 13, 4);
INSERT INTO `item_mods` VALUES (16100, 25, 5);
INSERT INTO `item_mods` VALUES (16100, 30, 5);
INSERT INTO `item_mods` VALUES (16101, 1, 3);
INSERT INTO `item_mods` VALUES (16101, 5, 1);
INSERT INTO `item_mods` VALUES (16102, 1, 7);
INSERT INTO `item_mods` VALUES (16102, 5, 1);
INSERT INTO `item_mods` VALUES (16102, 12, 1);
INSERT INTO `item_mods` VALUES (16103, 1, 8);
INSERT INTO `item_mods` VALUES (16103, 5, 1);
INSERT INTO `item_mods` VALUES (16103, 12, 1);
INSERT INTO `item_mods` VALUES (16103, 30, 1);
INSERT INTO `item_mods` VALUES (16104, 1, 26);
INSERT INTO `item_mods` VALUES (16104, 2, 8);
INSERT INTO `item_mods` VALUES (16104, 5, 8);
INSERT INTO `item_mods` VALUES (16104, 27, -3);
INSERT INTO `item_mods` VALUES (16105, 1, 27);
INSERT INTO `item_mods` VALUES (16105, 2, 9);
INSERT INTO `item_mods` VALUES (16105, 5, 9);
INSERT INTO `item_mods` VALUES (16105, 27, -5);
INSERT INTO `item_mods` VALUES (16106, 1, 23);
INSERT INTO `item_mods` VALUES (16106, 8, 4);
INSERT INTO `item_mods` VALUES (16106, 9, 4);
INSERT INTO `item_mods` VALUES (16106, 10, 4);
INSERT INTO `item_mods` VALUES (16106, 384, 40);
INSERT INTO `item_mods` VALUES (16107, 1, 21);
INSERT INTO `item_mods` VALUES (16107, 11, 4);
INSERT INTO `item_mods` VALUES (16107, 13, 4);
INSERT INTO `item_mods` VALUES (16107, 23, 3);
INSERT INTO `item_mods` VALUES (16107, 68, 3);
INSERT INTO `item_mods` VALUES (16107, 384, 40);
INSERT INTO `item_mods` VALUES (16108, 1, 20);
INSERT INTO `item_mods` VALUES (16108, 2, 20);
INSERT INTO `item_mods` VALUES (16108, 5, 20);
INSERT INTO `item_mods` VALUES (16108, 13, 5);
INSERT INTO `item_mods` VALUES (16108, 14, 5);
INSERT INTO `item_mods` VALUES (16108, 27, -4);
INSERT INTO `item_mods` VALUES (16108, 71, 2);
INSERT INTO `item_mods` VALUES (16109, 1, 1);
INSERT INTO `item_mods` VALUES (16109, 517, 1);
INSERT INTO `item_mods` VALUES (16110, 1, 12);
INSERT INTO `item_mods` VALUES (16111, 1, 19);
INSERT INTO `item_mods` VALUES (16111, 2, 10);
INSERT INTO `item_mods` VALUES (16111, 25, 1);
INSERT INTO `item_mods` VALUES (16111, 68, 1);
INSERT INTO `item_mods` VALUES (16112, 1, 20);
INSERT INTO `item_mods` VALUES (16112, 2, 12);
INSERT INTO `item_mods` VALUES (16112, 25, 2);
INSERT INTO `item_mods` VALUES (16112, 68, 2);
INSERT INTO `item_mods` VALUES (16113, 1, 35);
INSERT INTO `item_mods` VALUES (16113, 2, 15);
INSERT INTO `item_mods` VALUES (16113, 5, 15);
INSERT INTO `item_mods` VALUES (16113, 9, 4);
INSERT INTO `item_mods` VALUES (16113, 23, 9);
INSERT INTO `item_mods` VALUES (16113, 25, 2);
INSERT INTO `item_mods` VALUES (16114, 1, 36);
INSERT INTO `item_mods` VALUES (16114, 2, 17);
INSERT INTO `item_mods` VALUES (16114, 5, 17);
INSERT INTO `item_mods` VALUES (16114, 9, 5);
INSERT INTO `item_mods` VALUES (16114, 23, 10);
INSERT INTO `item_mods` VALUES (16114, 25, 3);
INSERT INTO `item_mods` VALUES (16115, 1, 18);
INSERT INTO `item_mods` VALUES (16115, 5, 35);
INSERT INTO `item_mods` VALUES (16115, 27, -3);
INSERT INTO `item_mods` VALUES (16115, 30, 5);
INSERT INTO `item_mods` VALUES (16115, 161, 3);
INSERT INTO `item_mods` VALUES (16116, 1, 19);
INSERT INTO `item_mods` VALUES (16116, 5, 40);
INSERT INTO `item_mods` VALUES (16116, 27, -4);
INSERT INTO `item_mods` VALUES (16116, 30, 6);
INSERT INTO `item_mods` VALUES (16116, 161, 4);
INSERT INTO `item_mods` VALUES (16117, 1, 40);
INSERT INTO `item_mods` VALUES (16117, 2, 30);
INSERT INTO `item_mods` VALUES (16117, 10, 4);
INSERT INTO `item_mods` VALUES (16117, 160, -5);
INSERT INTO `item_mods` VALUES (16117, 384, -50);
INSERT INTO `item_mods` VALUES (16121, 1, 21);
INSERT INTO `item_mods` VALUES (16122, 1, 23);
INSERT INTO `item_mods` VALUES (16123, 1, 21);
INSERT INTO `item_mods` VALUES (16124, 1, 21);

-- ------------------------------------------
-- Breeder Mask
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (16125, 1, 22);
INSERT INTO `item_mods` VALUES (16125, 25, 4);
INSERT INTO `item_mods` VALUES (16125, 27, -3);
INSERT INTO `item_mods` VALUES (16125, 384, 11);
INSERT INTO `item_mods` VALUES (16125, 499, 1); -- blaze spikes
INSERT INTO `item_mods` VALUES (16125, 500, 20); -- spikes dmg
INSERT INTO `item_mods` VALUES (16125, 501, 15); -- spikes proc rate

INSERT INTO `item_mods` VALUES (16126, 1, 25);
INSERT INTO `item_mods` VALUES (16126, 9, 4);
INSERT INTO `item_mods` VALUES (16126, 26, 10);
INSERT INTO `item_mods` VALUES (16126, 251, 2);
INSERT INTO `item_mods` VALUES (16127, 5, 30);
INSERT INTO `item_mods` VALUES (16127, 30, 4);
INSERT INTO `item_mods` VALUES (16127, 251, 2);
INSERT INTO `item_mods` VALUES (16128, 1, 15);
INSERT INTO `item_mods` VALUES (16128, 2, -20);
INSERT INTO `item_mods` VALUES (16128, 5, 38);
INSERT INTO `item_mods` VALUES (16128, 57, 10);
INSERT INTO `item_mods` VALUES (16129, 1, 16);
INSERT INTO `item_mods` VALUES (16129, 2, -22);
INSERT INTO `item_mods` VALUES (16129, 5, 40);
INSERT INTO `item_mods` VALUES (16129, 57, 12);
INSERT INTO `item_mods` VALUES (16130, 1, 20);
INSERT INTO `item_mods` VALUES (16130, 8, 2);
INSERT INTO `item_mods` VALUES (16130, 10, 2);
INSERT INTO `item_mods` VALUES (16130, 68, 10);
INSERT INTO `item_mods` VALUES (16131, 1, 21);
INSERT INTO `item_mods` VALUES (16131, 8, 3);
INSERT INTO `item_mods` VALUES (16131, 10, 3);
INSERT INTO `item_mods` VALUES (16131, 68, 11);
INSERT INTO `item_mods` VALUES (16132, 25, 2);
INSERT INTO `item_mods` VALUES (16133, 25, 3);
INSERT INTO `item_mods` VALUES (16134, 1, 21);
INSERT INTO `item_mods` VALUES (16135, 1, 23);
INSERT INTO `item_mods` VALUES (16136, 1, 21);
INSERT INTO `item_mods` VALUES (16137, 1, 21);
INSERT INTO `item_mods` VALUES (16138, 1, 18);
INSERT INTO `item_mods` VALUES (16138, 2, 10);
INSERT INTO `item_mods` VALUES (16138, 14, 4);
INSERT INTO `item_mods` VALUES (16138, 27, -2);
INSERT INTO `item_mods` VALUES (16138, 490, 30);
INSERT INTO `item_mods` VALUES (16139, 1, 18);
INSERT INTO `item_mods` VALUES (16139, 2, 10);
INSERT INTO `item_mods` VALUES (16139, 14, 4);
INSERT INTO `item_mods` VALUES (16139, 27, -2);
INSERT INTO `item_mods` VALUES (16139, 490, 30);
INSERT INTO `item_mods` VALUES (16140, 1, 15);
INSERT INTO `item_mods` VALUES (16140, 5, 15);
INSERT INTO `item_mods` VALUES (16140, 12, 4);
INSERT INTO `item_mods` VALUES (16140, 401, 1);
INSERT INTO `item_mods` VALUES (16141, 1, 13);
INSERT INTO `item_mods` VALUES (16141, 11, 2);
INSERT INTO `item_mods` VALUES (16142, 1, 18);
INSERT INTO `item_mods` VALUES (16142, 10, 3);
INSERT INTO `item_mods` VALUES (16143, 1, 17);
INSERT INTO `item_mods` VALUES (16143, 12, 2);
INSERT INTO `item_mods` VALUES (16143, 71, 1);
INSERT INTO `item_mods` VALUES (16144, 1, 3);
INSERT INTO `item_mods` VALUES (16144, 71, 1);
INSERT INTO `item_mods` VALUES (16144, 72, 1);
INSERT INTO `item_mods` VALUES (16144, 370, 1);
INSERT INTO `item_mods` VALUES (16145, 1, 3);
INSERT INTO `item_mods` VALUES (16145, 71, 1);
INSERT INTO `item_mods` VALUES (16145, 72, 1);
INSERT INTO `item_mods` VALUES (16146, 1, 29);
INSERT INTO `item_mods` VALUES (16146, 2, 20);
INSERT INTO `item_mods` VALUES (16146, 27, 5);
INSERT INTO `item_mods` VALUES (16146, 29, 3);
INSERT INTO `item_mods` VALUES (16147, 1, 23);
INSERT INTO `item_mods` VALUES (16147, 8, 3);
INSERT INTO `item_mods` VALUES (16147, 68, 5);
INSERT INTO `item_mods` VALUES (16147, 289, 4);
INSERT INTO `item_mods` VALUES (16148, 1, 22);
INSERT INTO `item_mods` VALUES (16148, 25, 4);
INSERT INTO `item_mods` VALUES (16148, 27, -4);
INSERT INTO `item_mods` VALUES (16149, 1, 12);
INSERT INTO `item_mods` VALUES (16149, 2, 15);
INSERT INTO `item_mods` VALUES (16149, 5, 15);
INSERT INTO `item_mods` VALUES (16149, 28, 1);
INSERT INTO `item_mods` VALUES (16149, 296, 2);
INSERT INTO `item_mods` VALUES (16150, 1, 26);
INSERT INTO `item_mods` VALUES (16150, 2, 50);
INSERT INTO `item_mods` VALUES (16150, 56, 10);
INSERT INTO `item_mods` VALUES (16150, 402, 25);

-- -------------------------------------------------------
-- Leonine Mask
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16151, 1, 28); -- def 28
INSERT INTO `item_mods` VALUES (16151, 8, 3); -- str 3
INSERT INTO `item_mods` VALUES (16151, 11, 3); -- agi 3
INSERT INTO `item_mods` VALUES (16151, 165, 3); -- critical hit rate 3%

INSERT INTO `item_mods` VALUES (16152, 1, 22);
INSERT INTO `item_mods` VALUES (16152, 23, 8);
INSERT INTO `item_mods` VALUES (16152, 25, 8);
INSERT INTO `item_mods` VALUES (16153, 1, 19);
INSERT INTO `item_mods` VALUES (16153, 2, -20);
INSERT INTO `item_mods` VALUES (16153, 5, 20);
INSERT INTO `item_mods` VALUES (16154, 1, 20);
INSERT INTO `item_mods` VALUES (16155, 1, 23);
INSERT INTO `item_mods` VALUES (16155, 8, 3);
INSERT INTO `item_mods` VALUES (16155, 23, 4);
INSERT INTO `item_mods` VALUES (16155, 25, 4);
INSERT INTO `item_mods` VALUES (16155, 68, -7);
INSERT INTO `item_mods` VALUES (16155, 384, 20);
INSERT INTO `item_mods` VALUES (16156, 1, 19);
INSERT INTO `item_mods` VALUES (16156, 2, 15);
INSERT INTO `item_mods` VALUES (16156, 5, 25);
INSERT INTO `item_mods` VALUES (16156, 71, 2);
INSERT INTO `item_mods` VALUES (16156, 115, 5);
INSERT INTO `item_mods` VALUES (16157, 1, 23);
INSERT INTO `item_mods` VALUES (16157, 9, 3);
INSERT INTO `item_mods` VALUES (16157, 11, 3);
INSERT INTO `item_mods` VALUES (16157, 25, 8);
INSERT INTO `item_mods` VALUES (16157, 26, 8);
INSERT INTO `item_mods` VALUES (16157, 289, 2);
INSERT INTO `item_mods` VALUES (16158, 1, 24);
INSERT INTO `item_mods` VALUES (16158, 8, 6);
INSERT INTO `item_mods` VALUES (16158, 9, 4);
INSERT INTO `item_mods` VALUES (16158, 23, 8);
INSERT INTO `item_mods` VALUES (16158, 384, -50);
INSERT INTO `item_mods` VALUES (16159, 1, 23);
INSERT INTO `item_mods` VALUES (16159, 24, 8);
INSERT INTO `item_mods` VALUES (16159, 26, 8);
INSERT INTO `item_mods` VALUES (16159, 27, -5);
INSERT INTO `item_mods` VALUES (16160, 1, 21);
INSERT INTO `item_mods` VALUES (16160, 12, 2);
INSERT INTO `item_mods` VALUES (16160, 13, 2);
INSERT INTO `item_mods` VALUES (16160, 14, 2);
INSERT INTO `item_mods` VALUES (16160, 28, 2);
INSERT INTO `item_mods` VALUES (16160, 30, 2);
INSERT INTO `item_mods` VALUES (16161, 1, 21);
INSERT INTO `item_mods` VALUES (16161, 2, 25);
INSERT INTO `item_mods` VALUES (16161, 246, 2);
INSERT INTO `item_mods` VALUES (16162, 1, 18);
INSERT INTO `item_mods` VALUES (16162, 25, 4);
INSERT INTO `item_mods` VALUES (16162, 68, 4);
INSERT INTO `item_mods` VALUES (16163, 1, 22);
INSERT INTO `item_mods` VALUES (16163, 2, 30);
INSERT INTO `item_mods` VALUES (16163, 246, 3);
INSERT INTO `item_mods` VALUES (16164, 1, 19);
INSERT INTO `item_mods` VALUES (16164, 25, 5);
INSERT INTO `item_mods` VALUES (16164, 68, 5);
INSERT INTO `item_mods` VALUES (16165, 1, 19);
INSERT INTO `item_mods` VALUES (16166, 1, 1);
INSERT INTO `item_mods` VALUES (16167, 1, 1);
INSERT INTO `item_mods` VALUES (16168, 1, 10);
INSERT INTO `item_mods` VALUES (16168, 8, 3);
INSERT INTO `item_mods` VALUES (16168, 384, 11);

-- ------------------------------------------
-- Caballero Shield
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (16169, 1, 21);
INSERT INTO `item_mods` VALUES (16169, 27, 2);
INSERT INTO `item_mods` VALUES (16169, 29, 2);
INSERT INTO `item_mods` VALUES (16169, 499, 1); -- spikes
INSERT INTO `item_mods` VALUES (16169, 500, 28); -- spikes dmg
INSERT INTO `item_mods` VALUES (16169, 501, 25); -- spikes proc rate

INSERT INTO `item_mods` VALUES (16170, 1, 12);
INSERT INTO `item_mods` VALUES (16170, 27, 5);
INSERT INTO `item_mods` VALUES (16171, 1, 13);
INSERT INTO `item_mods` VALUES (16171, 27, 6);
INSERT INTO `item_mods` VALUES (16172, 1, 15);
INSERT INTO `item_mods` VALUES (16172, 8, 3);
INSERT INTO `item_mods` VALUES (16172, 10, 3);
INSERT INTO `item_mods` VALUES (16172, 23, 3);
INSERT INTO `item_mods` VALUES (16172, 68, 3);
INSERT INTO `item_mods` VALUES (16173, 1, 20);
INSERT INTO `item_mods` VALUES (16173, 364, 5);
INSERT INTO `item_mods` VALUES (16174, 1, 21);
INSERT INTO `item_mods` VALUES (16175, 1, 15);
INSERT INTO `item_mods` VALUES (16175, 13, 7);
INSERT INTO `item_mods` VALUES (16175, 14, 7);
INSERT INTO `item_mods` VALUES (16175, 168, 10);
INSERT INTO `item_mods` VALUES (16176, 1, 24);
INSERT INTO `item_mods` VALUES (16176, 2, 10);
INSERT INTO `item_mods` VALUES (16176, 5, 10);
INSERT INTO `item_mods` VALUES (16176, 27, 2);
INSERT INTO `item_mods` VALUES (16177, 1, 16);
INSERT INTO `item_mods` VALUES (16177, 5, 20);
INSERT INTO `item_mods` VALUES (16177, 27, -2);
INSERT INTO `item_mods` VALUES (16177, 71, 5);
INSERT INTO `item_mods` VALUES (16178, 1, 15);
INSERT INTO `item_mods` VALUES (16178, 27, 5);
INSERT INTO `item_mods` VALUES (16178, 28, 5);
INSERT INTO `item_mods` VALUES (16178, 160, 10);
INSERT INTO `item_mods` VALUES (16179, 1, 17);
INSERT INTO `item_mods` VALUES (16179, 14, 2);
INSERT INTO `item_mods` VALUES (16179, 25, 2);
INSERT INTO `item_mods` VALUES (16179, 384, 11);
INSERT INTO `item_mods` VALUES (16180, 1, 13);
INSERT INTO `item_mods` VALUES (16180, 28, 3);
INSERT INTO `item_mods` VALUES (16180, 30, 3);
INSERT INTO `item_mods` VALUES (16181, 1, 20);
INSERT INTO `item_mods` VALUES (16181, 2, 20);
INSERT INTO `item_mods` VALUES (16181, 27, 4);
INSERT INTO `item_mods` VALUES (16182, 1, 8);
INSERT INTO `item_mods` VALUES (16183, 1, 8);
INSERT INTO `item_mods` VALUES (16184, 12, 1);
INSERT INTO `item_mods` VALUES (16184, 13, 1);
INSERT INTO `item_mods` VALUES (16184, 71, 2);
INSERT INTO `item_mods` VALUES (16185, 1, 1);
INSERT INTO `item_mods` VALUES (16185, 5, 5);
INSERT INTO `item_mods` VALUES (16186, 1, 2);
INSERT INTO `item_mods` VALUES (16186, 7, 15);
INSERT INTO `item_mods` VALUES (16186, 13, 2);
INSERT INTO `item_mods` VALUES (16187, 1, 15);

-- -------------------------------------------------------
-- Rusty Shield
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16188, 1, 1); -- DEF:1

INSERT INTO `item_mods` VALUES (16189, 1, 31);
INSERT INTO `item_mods` VALUES (16190, 1, 22);
INSERT INTO `item_mods` VALUES (16190, 2, 15);
INSERT INTO `item_mods` VALUES (16190, 370, 1);
INSERT INTO `item_mods` VALUES (16195, 385, 210);
INSERT INTO `item_mods` VALUES (16196, 385, 220);
INSERT INTO `item_mods` VALUES (16197, 385, 230);
INSERT INTO `item_mods` VALUES (16198, 385, 240);
INSERT INTO `item_mods` VALUES (16200, 385, 250);

-- ------------------------------------------
-- Genesis Shield
-- ------------------------------------------
INSERT INTO `item_mods` VALUES (16201, 1, 21);
INSERT INTO `item_mods` VALUES (16201, 60, 30);
INSERT INTO `item_mods` VALUES (16201, 302, 1);
INSERT INTO `item_mods` VALUES (16201, 499, 4); -- Curse Spikes
INSERT INTO `item_mods` VALUES (16201, 500, 0); -- Spikes DMG
INSERT INTO `item_mods` VALUES (16201, 501, 20); -- Spikes Proc Rate

INSERT INTO `item_mods` VALUES (16202, 1, 29);
INSERT INTO `item_mods` VALUES (16202, 27, 6);
INSERT INTO `item_mods` VALUES (16202, 374, 5);

-- -------------------------------------------------------
-- Sylvan Chlamys
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16205, 1, 9); -- Defence
INSERT INTO `item_mods` VALUES (16205, 8, 6); -- str
INSERT INTO `item_mods` VALUES (16205, 11, 6); -- agi
INSERT INTO `item_mods` VALUES (16205, 27, -3); -- enmity
INSERT INTO `item_mods` VALUES (16205, 73, 5); -- Store tp

-- -------------------------------------------------------
-- Iga Dochugappa
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16207, 1, 10); -- Defence
INSERT INTO `item_mods` VALUES (16207, 9, 5); -- DEX
INSERT INTO `item_mods` VALUES (16207, 165, 3); -- crit rate
INSERT INTO `item_mods` VALUES (16207, 73, 5); -- Store tp

INSERT INTO `item_mods` VALUES (16210, 1, 6);
INSERT INTO `item_mods` VALUES (16210, 2, 45);
INSERT INTO `item_mods` VALUES (16210, 5, 45);
INSERT INTO `item_mods` VALUES (16210, 60, 20);
INSERT INTO `item_mods` VALUES (16210, 61, 20);
INSERT INTO `item_mods` VALUES (16211, 1, 10);
INSERT INTO `item_mods` VALUES (16211, 3, 2);
INSERT INTO `item_mods` VALUES (16211, 24, 10);
INSERT INTO `item_mods` VALUES (16212, 1, 12);
INSERT INTO `item_mods` VALUES (16212, 8, 3);
INSERT INTO `item_mods` VALUES (16212, 23, 12);
INSERT INTO `item_mods` VALUES (16212, 27, 3);
INSERT INTO `item_mods` VALUES (16212, 54, 10);
INSERT INTO `item_mods` VALUES (16213, 1, 8);
INSERT INTO `item_mods` VALUES (16213, 5, 24);
INSERT INTO `item_mods` VALUES (16213, 29, 3);
INSERT INTO `item_mods` VALUES (16214, 1, 9);
INSERT INTO `item_mods` VALUES (16214, 5, 26);
INSERT INTO `item_mods` VALUES (16214, 29, 4);
INSERT INTO `item_mods` VALUES (16215, 1, 11);
INSERT INTO `item_mods` VALUES (16215, 3, 3);
INSERT INTO `item_mods` VALUES (16215, 24, 11);
INSERT INTO `item_mods` VALUES (16216, 1, 13);
INSERT INTO `item_mods` VALUES (16216, 8, 4);
INSERT INTO `item_mods` VALUES (16216, 23, 15);
INSERT INTO `item_mods` VALUES (16216, 27, 4);
INSERT INTO `item_mods` VALUES (16216, 54, 12);
INSERT INTO `item_mods` VALUES (16217, 1, 2);
INSERT INTO `item_mods` VALUES (16218, 1, 2);
INSERT INTO `item_mods` VALUES (16219, 1, 2);
INSERT INTO `item_mods` VALUES (16220, 1, 6);
INSERT INTO `item_mods` VALUES (16221, 1, 5);
INSERT INTO `item_mods` VALUES (16221, 25, 6);
INSERT INTO `item_mods` VALUES (16221, 26, 6);
INSERT INTO `item_mods` VALUES (16222, 1, 7);
INSERT INTO `item_mods` VALUES (16222, 251, 2);
INSERT INTO `item_mods` VALUES (16228, 1, 7);
INSERT INTO `item_mods` VALUES (16228, 2, -20);
INSERT INTO `item_mods` VALUES (16228, 5, 20);
INSERT INTO `item_mods` VALUES (16228, 13, 5);
INSERT INTO `item_mods` VALUES (16228, 14, -5);
INSERT INTO `item_mods` VALUES (16229, 1, 7);
INSERT INTO `item_mods` VALUES (16229, 2, 20);
INSERT INTO `item_mods` VALUES (16229, 5, -20);
INSERT INTO `item_mods` VALUES (16229, 10, -5);
INSERT INTO `item_mods` VALUES (16229, 12, 5);
INSERT INTO `item_mods` VALUES (16230, 1, 8);
INSERT INTO `item_mods` VALUES (16230, 2, 40);
INSERT INTO `item_mods` VALUES (16230, 5, 20);
INSERT INTO `item_mods` VALUES (16231, 1, 9);
INSERT INTO `item_mods` VALUES (16231, 8, 4);
INSERT INTO `item_mods` VALUES (16232, 1, 10);
INSERT INTO `item_mods` VALUES (16232, 8, 5);
INSERT INTO `item_mods` VALUES (16233, 1, 7);
INSERT INTO `item_mods` VALUES (16233, 241, 2);
INSERT INTO `item_mods` VALUES (16233, 242, 2);
INSERT INTO `item_mods` VALUES (16233, 246, 2);
INSERT INTO `item_mods` VALUES (16234, 1, 8);
INSERT INTO `item_mods` VALUES (16234, 241, 3);
INSERT INTO `item_mods` VALUES (16234, 242, 3);
INSERT INTO `item_mods` VALUES (16234, 246, 3);
INSERT INTO `item_mods` VALUES (16235, 1, 8);
INSERT INTO `item_mods` VALUES (16235, 3, -1);
INSERT INTO `item_mods` VALUES (16235, 26, 5);
INSERT INTO `item_mods` VALUES (16235, 68, 5);
INSERT INTO `item_mods` VALUES (16236, 1, 9);
INSERT INTO `item_mods` VALUES (16236, 3, -1);
INSERT INTO `item_mods` VALUES (16236, 26, 6);
INSERT INTO `item_mods` VALUES (16236, 68, 6);
INSERT INTO `item_mods` VALUES (16237, 1, 7);
INSERT INTO `item_mods` VALUES (16237, 3, -1);
INSERT INTO `item_mods` VALUES (16237, 26, 4);
INSERT INTO `item_mods` VALUES (16237, 68, 4);
INSERT INTO `item_mods` VALUES (16238, 1, 7);
INSERT INTO `item_mods` VALUES (16238, 5, 20);
INSERT INTO `item_mods` VALUES (16239, 1, 6);
INSERT INTO `item_mods` VALUES (16239, 2, -20);
INSERT INTO `item_mods` VALUES (16239, 28, 2);
INSERT INTO `item_mods` VALUES (16239, 168, 8);
INSERT INTO `item_mods` VALUES (16240, 1, 6);
INSERT INTO `item_mods` VALUES (16240, 5, 18);
INSERT INTO `item_mods` VALUES (16240, 120, 4);
INSERT INTO `item_mods` VALUES (16241, 1, 8);
INSERT INTO `item_mods` VALUES (16241, 8, 4);
INSERT INTO `item_mods` VALUES (16241, 9, 4);
INSERT INTO `item_mods` VALUES (16241, 25, 5);
INSERT INTO `item_mods` VALUES (16242, 1, 5);
INSERT INTO `item_mods` VALUES (16242, 7, 20);
INSERT INTO `item_mods` VALUES (16242, 8, -5);
INSERT INTO `item_mods` VALUES (16242, 9, -5);
INSERT INTO `item_mods` VALUES (16242, 10, -5);
INSERT INTO `item_mods` VALUES (16242, 11, -5);
INSERT INTO `item_mods` VALUES (16242, 12, 5);
INSERT INTO `item_mods` VALUES (16242, 13, 5);
INSERT INTO `item_mods` VALUES (16242, 14, 5);
INSERT INTO `item_mods` VALUES (16242, 27, -2);
INSERT INTO `item_mods` VALUES (16243, 1, 1);
INSERT INTO `item_mods` VALUES (16244, 1, 6);
INSERT INTO `item_mods` VALUES (16244, 5, 20);
INSERT INTO `item_mods` VALUES (16244, 25, 7);
INSERT INTO `item_mods` VALUES (16244, 30, 3);
INSERT INTO `item_mods` VALUES (16245, 1, 6);
INSERT INTO `item_mods` VALUES (16245, 9, 5);
INSERT INTO `item_mods` VALUES (16245, 23, 15);

-- -------------------------------------------------------
-- Viator Cape
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16246, 1, 9);
INSERT INTO `item_mods` VALUES (16246, 2, 15);
INSERT INTO `item_mods` VALUES (16246, 5, 15);

INSERT INTO `item_mods` VALUES (16247, 1, 6);
INSERT INTO `item_mods` VALUES (16247, 5, 10);
INSERT INTO `item_mods` VALUES (16247, 28, 1);
INSERT INTO `item_mods` VALUES (16248, 1, 5);
INSERT INTO `item_mods` VALUES (16248, 9, 5);
INSERT INTO `item_mods` VALUES (16248, 14, 5);
INSERT INTO `item_mods` VALUES (16248, 25, 5);
INSERT INTO `item_mods` VALUES (16248, 68, 5);
INSERT INTO `item_mods` VALUES (16250, 1, 6);
INSERT INTO `item_mods` VALUES (16250, 24, 10);
INSERT INTO `item_mods` VALUES (16250, 26, 5);
INSERT INTO `item_mods` VALUES (16251, 1, 6);
INSERT INTO `item_mods` VALUES (16251, 54, 7);
INSERT INTO `item_mods` VALUES (16252, 1, 3);
INSERT INTO `item_mods` VALUES (16253, 1, 3);
INSERT INTO `item_mods` VALUES (16254, 1, 3);
INSERT INTO `item_mods` VALUES (16255, 1, 3);
INSERT INTO `item_mods` VALUES (16256, 1, 3);
INSERT INTO `item_mods` VALUES (16258, 114, 2);
INSERT INTO `item_mods` VALUES (16261, 1, 1);
INSERT INTO `item_mods` VALUES (16261, 5, 5);
INSERT INTO `item_mods` VALUES (16261, 12, 1);
INSERT INTO `item_mods` VALUES (16261, 13, 1);
INSERT INTO `item_mods` VALUES (16262, 1, 2);
INSERT INTO `item_mods` VALUES (16262, 5, 6);
INSERT INTO `item_mods` VALUES (16262, 12, 2);
INSERT INTO `item_mods` VALUES (16262, 13, 2);
INSERT INTO `item_mods` VALUES (16263, 1, 4);
INSERT INTO `item_mods` VALUES (16263, 5, 20);
INSERT INTO `item_mods` VALUES (16263, 71, 1);
INSERT INTO `item_mods` VALUES (16264, 1, 5);
INSERT INTO `item_mods` VALUES (16264, 5, 22);
INSERT INTO `item_mods` VALUES (16264, 71, 2);
INSERT INTO `item_mods` VALUES (16265, 1, 8);
INSERT INTO `item_mods` VALUES (16265, 25, 5);
INSERT INTO `item_mods` VALUES (16265, 26, 5);
INSERT INTO `item_mods` VALUES (16266, 1, 9);
INSERT INTO `item_mods` VALUES (16266, 25, 6);
INSERT INTO `item_mods` VALUES (16266, 26, 6);
INSERT INTO `item_mods` VALUES (16267, 1, 8);
INSERT INTO `item_mods` VALUES (16267, 2, 25);
INSERT INTO `item_mods` VALUES (16267, 27, 3);
INSERT INTO `item_mods` VALUES (16267, 68, 5);
INSERT INTO `item_mods` VALUES (16268, 1, 5);
INSERT INTO `item_mods` VALUES (16268, 8, 4);
INSERT INTO `item_mods` VALUES (16268, 9, 4);
INSERT INTO `item_mods` VALUES (16268, 160, 5);
INSERT INTO `item_mods` VALUES (16269, 7, 40);
INSERT INTO `item_mods` VALUES (16269, 8, -2);
INSERT INTO `item_mods` VALUES (16269, 9, -2);
INSERT INTO `item_mods` VALUES (16269, 13, 5);
INSERT INTO `item_mods` VALUES (16270, 25, 2);
INSERT INTO `item_mods` VALUES (16271, 25, 4);
INSERT INTO `item_mods` VALUES (16271, 27, -1);
INSERT INTO `item_mods` VALUES (16271, 30, 2);
INSERT INTO `item_mods` VALUES (16272, 23, 5);
INSERT INTO `item_mods` VALUES (16272, 24, 5);
INSERT INTO `item_mods` VALUES (16274, 289, 2);
INSERT INTO `item_mods` VALUES (16275, 9, 4);
INSERT INTO `item_mods` VALUES (16275, 25, 9);
INSERT INTO `item_mods` VALUES (16276, 27, -2);
INSERT INTO `item_mods` VALUES (16276, 71, 1);
INSERT INTO `item_mods` VALUES (16276, 72, 1);
INSERT INTO `item_mods` VALUES (16277, 68, 5);
INSERT INTO `item_mods` VALUES (16278, 14, 5);
INSERT INTO `item_mods` VALUES (16278, 121, 5);
INSERT INTO `item_mods` VALUES (16279, 2, 3);
INSERT INTO `item_mods` VALUES (16279, 25, 1);
INSERT INTO `item_mods` VALUES (16280, 1, 2);
INSERT INTO `item_mods` VALUES (16281, 2, 3);
INSERT INTO `item_mods` VALUES (16282, 2, 5);
INSERT INTO `item_mods` VALUES (16283, 13, 5);
INSERT INTO `item_mods` VALUES (16283, 71, 3);
INSERT INTO `item_mods` VALUES (16284, 28, 2);
INSERT INTO `item_mods` VALUES (16284, 54, 5);
INSERT INTO `item_mods` VALUES (16284, 55, 5);
INSERT INTO `item_mods` VALUES (16284, 56, 5);
INSERT INTO `item_mods` VALUES (16284, 57, 5);
INSERT INTO `item_mods` VALUES (16284, 58, 5);
INSERT INTO `item_mods` VALUES (16284, 59, 5);
INSERT INTO `item_mods` VALUES (16284, 60, 5);
INSERT INTO `item_mods` VALUES (16284, 61, 5);
INSERT INTO `item_mods` VALUES (16291, 10, 4);
INSERT INTO `item_mods` VALUES (16292, 8, 4);
INSERT INTO `item_mods` VALUES (16293, 2, 30);
INSERT INTO `item_mods` VALUES (16294, 11, 4);
INSERT INTO `item_mods` VALUES (16296, 8, 1);
INSERT INTO `item_mods` VALUES (16296, 10, 1);
INSERT INTO `item_mods` VALUES (16298, 9, 4);
INSERT INTO `item_mods` VALUES (16298, 23, 2);
INSERT INTO `item_mods` VALUES (16299, 11, 4);
INSERT INTO `item_mods` VALUES (16299, 24, 4);
INSERT INTO `item_mods` VALUES (16299, 26, 4);
INSERT INTO `item_mods` VALUES (16300, 12, 4);
INSERT INTO `item_mods` VALUES (16301, 25, 2);
INSERT INTO `item_mods` VALUES (16302, 2, 60);
INSERT INTO `item_mods` VALUES (16303, 23, 6);
INSERT INTO `item_mods` VALUES (16303, 25, 4);
INSERT INTO `item_mods` VALUES (16304, 25, 3);

-- -------------------------------------------------------
-- Sanctus Rosary
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16305, 1, 3); -- def 3
INSERT INTO `item_mods` VALUES (16305, 5, 10); -- mp 10
INSERT INTO `item_mods` VALUES (16305, 61, 20); -- element dark +20
INSERT INTO `item_mods` VALUES (16305, 234, 2); -- enhances demon killer effect

-- -------------------------------------------------------
-- Halting Stole
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16306, 9, 3); -- dex 3

-- -------------------------------------------------------
-- Repelling Collar
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16307, 161, -1); -- physical damage taken -1%
INSERT INTO `item_mods` VALUES (16307, 163, 1); -- magic damage taken 1%

INSERT INTO `item_mods` VALUES (16308, 5, 20);
INSERT INTO `item_mods` VALUES (16308, 12, 7);
INSERT INTO `item_mods` VALUES (16308, 27, 5);
INSERT INTO `item_mods` VALUES (16309, 27, 5);
INSERT INTO `item_mods` VALUES (16309, 60, 20);
INSERT INTO `item_mods` VALUES (16309, 61, 20);
INSERT INTO `item_mods` VALUES (16311, 1, 27);
INSERT INTO `item_mods` VALUES (16311, 5, 20);
INSERT INTO `item_mods` VALUES (16311, 27, -1);
INSERT INTO `item_mods` VALUES (16311, 336, 15);
INSERT INTO `item_mods` VALUES (16312, 1, 23);
INSERT INTO `item_mods` VALUES (16312, 9, 2);
INSERT INTO `item_mods` VALUES (16312, 11, 2);
INSERT INTO `item_mods` VALUES (16313, 1, 30);
INSERT INTO `item_mods` VALUES (16313, 11, 3);
INSERT INTO `item_mods` VALUES (16314, 1, 23);
INSERT INTO `item_mods` VALUES (16314, 12, 1);
INSERT INTO `item_mods` VALUES (16314, 14, 1);
INSERT INTO `item_mods` VALUES (16314, 61, 7);
INSERT INTO `item_mods` VALUES (16315, 1, 36);
INSERT INTO `item_mods` VALUES (16315, 2, 28);
INSERT INTO `item_mods` VALUES (16315, 27, 4);
INSERT INTO `item_mods` VALUES (16315, 29, 4);
INSERT INTO `item_mods` VALUES (16316, 1, 27);
INSERT INTO `item_mods` VALUES (16316, 8, 4);
INSERT INTO `item_mods` VALUES (16316, 68, 4);
INSERT INTO `item_mods` VALUES (16316, 289, 4);
INSERT INTO `item_mods` VALUES (16317, 1, 26);
INSERT INTO `item_mods` VALUES (16317, 25, 5);
INSERT INTO `item_mods` VALUES (16317, 27, -4);
INSERT INTO `item_mods` VALUES (16318, 1, 24);
INSERT INTO `item_mods` VALUES (16318, 2, 25);
INSERT INTO `item_mods` VALUES (16318, 5, 25);
INSERT INTO `item_mods` VALUES (16318, 28, 2);
INSERT INTO `item_mods` VALUES (16318, 296, 2);
INSERT INTO `item_mods` VALUES (16319, 1, 35);
INSERT INTO `item_mods` VALUES (16319, 5, 12);
INSERT INTO `item_mods` VALUES (16319, 12, 6);
INSERT INTO `item_mods` VALUES (16319, 68, 3);
INSERT INTO `item_mods` VALUES (16320, 1, 29);
INSERT INTO `item_mods` VALUES (16320, 9, 5);
INSERT INTO `item_mods` VALUES (16320, 10, 5);
INSERT INTO `item_mods` VALUES (16321, 1, 1);
INSERT INTO `item_mods` VALUES (16322, 1, 1);
INSERT INTO `item_mods` VALUES (16323, 1, 1);
INSERT INTO `item_mods` VALUES (16324, 1, 1);
INSERT INTO `item_mods` VALUES (16325, 1, 1);
INSERT INTO `item_mods` VALUES (16326, 1, 1);
INSERT INTO `item_mods` VALUES (16327, 1, 1);
INSERT INTO `item_mods` VALUES (16328, 1, 1);
INSERT INTO `item_mods` VALUES (16329, 1, 2);
INSERT INTO `item_mods` VALUES (16330, 1, 2);
INSERT INTO `item_mods` VALUES (16331, 1, 2);
INSERT INTO `item_mods` VALUES (16332, 1, 2);
INSERT INTO `item_mods` VALUES (16333, 1, 2);
INSERT INTO `item_mods` VALUES (16334, 1, 2);
INSERT INTO `item_mods` VALUES (16335, 1, 2);
INSERT INTO `item_mods` VALUES (16336, 1, 2);
INSERT INTO `item_mods` VALUES (16337, 1, 42);
INSERT INTO `item_mods` VALUES (16337, 8, 10);
INSERT INTO `item_mods` VALUES (16337, 23, 5);
INSERT INTO `item_mods` VALUES (16337, 306, 1);
INSERT INTO `item_mods` VALUES (16338, 1, 31);
INSERT INTO `item_mods` VALUES (16338, 2, 10);
INSERT INTO `item_mods` VALUES (16338, 5, 10);
INSERT INTO `item_mods` VALUES (16338, 8, 2);
INSERT INTO `item_mods` VALUES (16338, 13, 2);
INSERT INTO `item_mods` VALUES (16339, 1, 32);
INSERT INTO `item_mods` VALUES (16339, 24, 5);
INSERT INTO `item_mods` VALUES (16339, 305, 5);
INSERT INTO `item_mods` VALUES (16340, 1, 32);
INSERT INTO `item_mods` VALUES (16341, 1, 40);
INSERT INTO `item_mods` VALUES (16341, 8, 4);
INSERT INTO `item_mods` VALUES (16341, 10, 4);
INSERT INTO `item_mods` VALUES (16341, 23, -4);
INSERT INTO `item_mods` VALUES (16341, 25, 7);
INSERT INTO `item_mods` VALUES (16341, 68, -8);
INSERT INTO `item_mods` VALUES (16342, 1, 30);
INSERT INTO `item_mods` VALUES (16342, 2, 15);
INSERT INTO `item_mods` VALUES (16342, 5, 25);
INSERT INTO `item_mods` VALUES (16342, 71, 2);
INSERT INTO `item_mods` VALUES (16342, 117, 5);
INSERT INTO `item_mods` VALUES (16343, 1, 40);
INSERT INTO `item_mods` VALUES (16343, 8, 4);
INSERT INTO `item_mods` VALUES (16343, 9, 4);
INSERT INTO `item_mods` VALUES (16343, 289, 5);
INSERT INTO `item_mods` VALUES (16344, 1, 35);
INSERT INTO `item_mods` VALUES (16344, 9, 5);
INSERT INTO `item_mods` VALUES (16344, 11, 5);
INSERT INTO `item_mods` VALUES (16344, 25, 5);
INSERT INTO `item_mods` VALUES (16344, 26, 5);
INSERT INTO `item_mods` VALUES (16344, 169, -12);
INSERT INTO `item_mods` VALUES (16345, 1, 34);
INSERT INTO `item_mods` VALUES (16345, 2, 25);
INSERT INTO `item_mods` VALUES (16345, 9, 5);
INSERT INTO `item_mods` VALUES (16345, 10, 5);
INSERT INTO `item_mods` VALUES (16345, 11, 5);
INSERT INTO `item_mods` VALUES (16345, 168, 12);
INSERT INTO `item_mods` VALUES (16346, 1, 31);
INSERT INTO `item_mods` VALUES (16346, 2, 10);
INSERT INTO `item_mods` VALUES (16346, 5, 10);
INSERT INTO `item_mods` VALUES (16346, 8, 3);
INSERT INTO `item_mods` VALUES (16346, 25, 5);
INSERT INTO `item_mods` VALUES (16346, 30, 3);
INSERT INTO `item_mods` VALUES (16347, 1, 32);
INSERT INTO `item_mods` VALUES (16347, 2, 15);
INSERT INTO `item_mods` VALUES (16347, 5, 15);
INSERT INTO `item_mods` VALUES (16347, 8, 3);
INSERT INTO `item_mods` VALUES (16347, 25, 5);
INSERT INTO `item_mods` VALUES (16347, 30, 5);
INSERT INTO `item_mods` VALUES (16348, 1, 29);
INSERT INTO `item_mods` VALUES (16348, 2, 25);
INSERT INTO `item_mods` VALUES (16348, 11, 5);
INSERT INTO `item_mods` VALUES (16348, 12, 5);
INSERT INTO `item_mods` VALUES (16348, 27, -4);
INSERT INTO `item_mods` VALUES (16349, 1, 30);
INSERT INTO `item_mods` VALUES (16349, 2, 22);
INSERT INTO `item_mods` VALUES (16349, 8, 3);
INSERT INTO `item_mods` VALUES (16349, 11, 3);
INSERT INTO `item_mods` VALUES (16349, 23, 3);
INSERT INTO `item_mods` VALUES (16349, 68, 3);
INSERT INTO `item_mods` VALUES (16350, 1, 31);
INSERT INTO `item_mods` VALUES (16350, 2, 22);
INSERT INTO `item_mods` VALUES (16350, 8, 3);
INSERT INTO `item_mods` VALUES (16350, 11, 3);
INSERT INTO `item_mods` VALUES (16350, 23, 7);
INSERT INTO `item_mods` VALUES (16350, 68, 7);
INSERT INTO `item_mods` VALUES (16351, 1, 26);
INSERT INTO `item_mods` VALUES (16351, 2, 16);
INSERT INTO `item_mods` VALUES (16351, 9, 5);
INSERT INTO `item_mods` VALUES (16351, 14, 5);
INSERT INTO `item_mods` VALUES (16352, 1, 32);
INSERT INTO `item_mods` VALUES (16352, 2, 13);
INSERT INTO `item_mods` VALUES (16352, 8, 2);
INSERT INTO `item_mods` VALUES (16352, 10, 2);
INSERT INTO `item_mods` VALUES (16352, 25, 5);
INSERT INTO `item_mods` VALUES (16353, 1, 33);
INSERT INTO `item_mods` VALUES (16353, 2, 13);
INSERT INTO `item_mods` VALUES (16353, 8, 2);
INSERT INTO `item_mods` VALUES (16353, 10, 2);
INSERT INTO `item_mods` VALUES (16353, 25, 7);
INSERT INTO `item_mods` VALUES (16354, 1, 31);
INSERT INTO `item_mods` VALUES (16354, 244, 2);
INSERT INTO `item_mods` VALUES (16355, 1, 29);
INSERT INTO `item_mods` VALUES (16356, 1, 28);
INSERT INTO `item_mods` VALUES (16356, 14, 8);
INSERT INTO `item_mods` VALUES (16356, 23, 4);
INSERT INTO `item_mods` VALUES (16356, 28, 4);
INSERT INTO `item_mods` VALUES (16356, 60, 20);
INSERT INTO `item_mods` VALUES (16357, 1, 29);
INSERT INTO `item_mods` VALUES (16357, 2, 15);
INSERT INTO `item_mods` VALUES (16357, 10, 5);
INSERT INTO `item_mods` VALUES (16357, 14, 5);
INSERT INTO `item_mods` VALUES (16357, 23, 5);
INSERT INTO `item_mods` VALUES (16357, 25, 5);
INSERT INTO `item_mods` VALUES (16357, 27, -1);
INSERT INTO `item_mods` VALUES (16358, 1, 29);
INSERT INTO `item_mods` VALUES (16358, 2, 15);
INSERT INTO `item_mods` VALUES (16358, 10, 5);
INSERT INTO `item_mods` VALUES (16358, 14, 5);
INSERT INTO `item_mods` VALUES (16358, 23, 5);
INSERT INTO `item_mods` VALUES (16358, 25, 5);
INSERT INTO `item_mods` VALUES (16358, 27, -1);
INSERT INTO `item_mods` VALUES (16359, 1, 28);
INSERT INTO `item_mods` VALUES (16359, 5, 25);
INSERT INTO `item_mods` VALUES (16359, 10, 3);
INSERT INTO `item_mods` VALUES (16359, 13, 3);
INSERT INTO `item_mods` VALUES (16359, 27, -2);
INSERT INTO `item_mods` VALUES (16359, 336, 15);
INSERT INTO `item_mods` VALUES (16360, 1, 28);
INSERT INTO `item_mods` VALUES (16360, 8, 3);
INSERT INTO `item_mods` VALUES (16360, 14, 3);
INSERT INTO `item_mods` VALUES (16360, 384, 30);
INSERT INTO `item_mods` VALUES (16360, 492, 30);
INSERT INTO `item_mods` VALUES (16360, 495, 100);
INSERT INTO `item_mods` VALUES (16361, 1, 29);
INSERT INTO `item_mods` VALUES (16361, 8, 4);
INSERT INTO `item_mods` VALUES (16361, 14, 4);
INSERT INTO `item_mods` VALUES (16361, 384, 30);
INSERT INTO `item_mods` VALUES (16361, 492, 30);
INSERT INTO `item_mods` VALUES (16361, 495, 100);
INSERT INTO `item_mods` VALUES (16362, 1, 27);
INSERT INTO `item_mods` VALUES (16362, 2, 15);
INSERT INTO `item_mods` VALUES (16362, 5, 15);
INSERT INTO `item_mods` VALUES (16362, 12, 5);
INSERT INTO `item_mods` VALUES (16362, 27, -2);
INSERT INTO `item_mods` VALUES (16362, 116, 7);
INSERT INTO `item_mods` VALUES (16363, 1, 28);
INSERT INTO `item_mods` VALUES (16363, 2, 17);
INSERT INTO `item_mods` VALUES (16363, 5, 17);
INSERT INTO `item_mods` VALUES (16363, 12, 6);
INSERT INTO `item_mods` VALUES (16363, 27, -3);
INSERT INTO `item_mods` VALUES (16363, 116, 7);
INSERT INTO `item_mods` VALUES (16364, 1, 2);
INSERT INTO `item_mods` VALUES (16364, 60, 10);
INSERT INTO `item_mods` VALUES (16365, 1, 4);
INSERT INTO `item_mods` VALUES (16366, 1, 4);
INSERT INTO `item_mods` VALUES (16366, 14, 2);
INSERT INTO `item_mods` VALUES (16367, 1, 10);
INSERT INTO `item_mods` VALUES (16367, 8, 1);
INSERT INTO `item_mods` VALUES (16368, 1, 8);
INSERT INTO `item_mods` VALUES (16369, 1, 37);
INSERT INTO `item_mods` VALUES (16369, 8, 2);
INSERT INTO `item_mods` VALUES (16369, 10, 2);
INSERT INTO `item_mods` VALUES (16370, 1, 34);
INSERT INTO `item_mods` VALUES (16370, 9, 2);
INSERT INTO `item_mods` VALUES (16370, 11, 2);
INSERT INTO `item_mods` VALUES (16371, 1, 31);
INSERT INTO `item_mods` VALUES (16371, 12, 2);
INSERT INTO `item_mods` VALUES (16371, 13, 2);
INSERT INTO `item_mods` VALUES (16371, 14, 2);
INSERT INTO `item_mods` VALUES (16372, 1, 30);
INSERT INTO `item_mods` VALUES (16373, 1, 20);
INSERT INTO `item_mods` VALUES (16373, 292, 2);
INSERT INTO `item_mods` VALUES (16374, 1, 23);
INSERT INTO `item_mods` VALUES (16374, 2, 9);
INSERT INTO `item_mods` VALUES (16374, 5, 9);
INSERT INTO `item_mods` VALUES (16374, 114, 2);
INSERT INTO `item_mods` VALUES (16375, 1, 36);
INSERT INTO `item_mods` VALUES (16375, 23, 6);
INSERT INTO `item_mods` VALUES (16375, 25, 12);
INSERT INTO `item_mods` VALUES (16375, 384, -81);
INSERT INTO `item_mods` VALUES (16376, 1, 36);
INSERT INTO `item_mods` VALUES (16376, 8, 5);
INSERT INTO `item_mods` VALUES (16376, 25, 12);
INSERT INTO `item_mods` VALUES (16376, 68, -4);
INSERT INTO `item_mods` VALUES (16376, 384, -102);
INSERT INTO `item_mods` VALUES (16377, 1, 21);
INSERT INTO `item_mods` VALUES (16377, 8, 1);
INSERT INTO `item_mods` VALUES (16377, 292, 2);

-- -------------------------------------------------------
-- Dinner Hose
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16378, 1, 1); -- DEF:1

INSERT INTO `item_mods` VALUES (16381, 1, 31);
INSERT INTO `item_mods` VALUES (16381, 9, 5);
INSERT INTO `item_mods` VALUES (16381, 14, 5);
INSERT INTO `item_mods` VALUES (16381, 23, 18);
INSERT INTO `item_mods` VALUES (16382, 1, 25);
INSERT INTO `item_mods` VALUES (16382, 2, -30);
INSERT INTO `item_mods` VALUES (16382, 5, 75);
INSERT INTO `item_mods` VALUES (16382, 168, 5);
INSERT INTO `item_mods` VALUES (16385, 25, 3);
INSERT INTO `item_mods` VALUES (16386, 25, 3);

-- -------------------------------------------------------
-- Poison Cesti
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16387, 25, 3);
INSERT INTO `item_mods` VALUES (16387, 431, 1); -- Additional Effect: Poison

INSERT INTO `item_mods` VALUES (16388, 25, 3);
INSERT INTO `item_mods` VALUES (16389, 9, 1);
INSERT INTO `item_mods` VALUES (16389, 11, 1);
INSERT INTO `item_mods` VALUES (16389, 25, 3);
INSERT INTO `item_mods` VALUES (16390, 25, 2);
INSERT INTO `item_mods` VALUES (16391, 25, 2);
INSERT INTO `item_mods` VALUES (16392, 25, 2);
INSERT INTO `item_mods` VALUES (16393, 25, 2);
INSERT INTO `item_mods` VALUES (16394, 25, 2);
INSERT INTO `item_mods` VALUES (16395, 10, 2);
INSERT INTO `item_mods` VALUES (16395, 25, 2);
INSERT INTO `item_mods` VALUES (16396, 14, 2);
INSERT INTO `item_mods` VALUES (16396, 25, 2);
INSERT INTO `item_mods` VALUES (16397, 2, 15);
INSERT INTO `item_mods` VALUES (16397, 25, 3);

-- -------------------------------------------------------
-- Burning Cesti
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16398, 25, 3);
INSERT INTO `item_mods` VALUES (16398, 431, 1); -- Additional Effect: Fire Damage

-- -------------------------------------------------------
-- Poison Katars
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16403, 431, 1); -- Additional Effect: Poison

-- -------------------------------------------------------
-- Poison Baghnakhs
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16410, 431, 1); -- Additional Effect: Poison

INSERT INTO `item_mods` VALUES (16416, 54, 5);

-- -------------------------------------------------------
-- Poison Claws
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16417, 431, 1); -- Additional Effect: Poison

INSERT INTO `item_mods` VALUES (16423, 10, 2);
INSERT INTO `item_mods` VALUES (16426, 1, -10);
INSERT INTO `item_mods` VALUES (16426, 23, 10);

-- -------------------------------------------------------
-- Item: Silence baghnakhs
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16429, 431, 1); -- Additional Effect: Silence

INSERT INTO `item_mods` VALUES (16433, 23, 3);
INSERT INTO `item_mods` VALUES (16433, 25, 2);

-- -------------------------------------------------------
-- Sonic Knuckles
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16434, 25, 2);
INSERT INTO `item_mods` VALUES (16434, 431, 1); -- Additional Effect: Wind Damage

INSERT INTO `item_mods` VALUES (16437, 25, 3);

-- -------------------------------------------------------
-- Item: Silence baghnakhs +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16438, 431, 1); -- Additional Effect: Silence

-- -------------------------------------------------------
-- Poison Claws +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16439, 431, 1); -- Additional Effect: Poison

INSERT INTO `item_mods` VALUES (16440, 25, 3);
INSERT INTO `item_mods` VALUES (16443, 25, 3);
INSERT INTO `item_mods` VALUES (16446, 25, 3);
INSERT INTO `item_mods` VALUES (16452, 5, 10);
INSERT INTO `item_mods` VALUES (16452, 9, 2);
INSERT INTO `item_mods` VALUES (16452, 10, 2);
INSERT INTO `item_mods` VALUES (16452, 13, 2);
INSERT INTO `item_mods` VALUES (16453, 5, 20);
INSERT INTO `item_mods` VALUES (16453, 12, 2);

-- -------------------------------------------------------
-- Blind Dagger
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16454, 431, 1); -- Additional Effect: Blind

-- -------------------------------------------------------
-- Poison Baselard
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16458, 431, 1); -- Additional Effect: Poison

-- -------------------------------------------------------
-- Acid Baselard
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16459, 431, 1); -- Additional Effect: Weakens defense

INSERT INTO `item_mods` VALUES (16461, 5, 10);
INSERT INTO `item_mods` VALUES (16461, 9, 2);
INSERT INTO `item_mods` VALUES (16461, 10, 2);
INSERT INTO `item_mods` VALUES (16461, 12, 2);
INSERT INTO `item_mods` VALUES (16470, 2, 10);
INSERT INTO `item_mods` VALUES (16470, 9, 2);
INSERT INTO `item_mods` VALUES (16470, 10, 2);
INSERT INTO `item_mods` VALUES (16470, 59, 8);

-- -------------------------------------------------------
-- Blind Knife
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16471, 431, 1); -- Additional Effect: Blind

-- -------------------------------------------------------
-- Poison Knife
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16472, 431, 1); -- Additional Effect: Poison

-- -------------------------------------------------------
-- Poison Kukri
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16478, 431, 1); -- Additional Effect: Poison

-- -------------------------------------------------------
-- Acid Kukri
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16479, 431, 1); -- Additional Effect: Weakens Defense

INSERT INTO `item_mods` VALUES (16480, 303, 1);
INSERT INTO `item_mods` VALUES (16484, 9, 2);
INSERT INTO `item_mods` VALUES (16484, 13, -3);
INSERT INTO `item_mods` VALUES (16486, 9, 1);
INSERT INTO `item_mods` VALUES (16486, 11, 1);
INSERT INTO `item_mods` VALUES (16487, 14, 5);
INSERT INTO `item_mods` VALUES (16487, 68, 3);
-- -------------------------------------------------------
-- Poison Kukri +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16489, 431, 1); -- Additional Effect: Poison

-- -------------------------------------------------------
-- Blind Knife +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16490, 431, 1); -- Additional Effect: Blind

-- -------------------------------------------------------
-- Blind Dagger +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16493, 431, 1); -- Additional Effect: Blind

-- -------------------------------------------------------
-- Corrosive Kukri
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16494, 431, 1); -- Additional Effect: Weakens Defense

-- -------------------------------------------------------
-- Item: Silence Dagger
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16495, 431, 1); -- Additional Effect: Silence

-- -------------------------------------------------------
-- Poison Dagger
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16496, 431, 1); -- Additional Effect: Poison

-- -------------------------------------------------------
-- Sleep Dagger
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16497, 431, 1); -- Additional Effect: Sleep

-- -------------------------------------------------------
-- Acid Knife
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16501, 431, 1); -- Additional Effect: Weakens Defense

-- -------------------------------------------------------
-- Item: Silence Dagger +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16508, 431, 1); -- Additional Effect: Silence

-- -------------------------------------------------------
-- Aspir Knife
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16509, 431, 1); -- Additional Effect: MP Drain

INSERT INTO `item_mods` VALUES (16520, 5, 18);
INSERT INTO `item_mods` VALUES (16520, 110, 7);
INSERT INTO `item_mods` VALUES (16521, 110, 5);
INSERT INTO `item_mods` VALUES (16527, 25, 2);
INSERT INTO `item_mods` VALUES (16541, 8, 2);
INSERT INTO `item_mods` VALUES (16541, 10, 2);
INSERT INTO `item_mods` VALUES (16541, 11, 2);
INSERT INTO `item_mods` VALUES (16542, 8, 2);
INSERT INTO `item_mods` VALUES (16542, 10, 2);
INSERT INTO `item_mods` VALUES (16542, 11, 2);

-- -------------------------------------------------------
-- Item: Fire Sword
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16543, 431, 1); -- Additional Effect: Fire Damage

INSERT INTO `item_mods` VALUES (16547, 2, 10);
INSERT INTO `item_mods` VALUES (16547, 9, 2);
INSERT INTO `item_mods` VALUES (16547, 10, 2);
INSERT INTO `item_mods` VALUES (16548, 59, 8);

-- -------------------------------------------------------
-- Divine Sword
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16549, 431, 1); -- Additional Effect: Light Damage

-- -------------------------------------------------------
-- Hallowed Sword
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16550, 431, 1); -- Additional Effect: Light Damage

INSERT INTO `item_mods` VALUES (16557, 23, 6);
INSERT INTO `item_mods` VALUES (16557, 25, 3);
INSERT INTO `item_mods` VALUES (16562, 9, 1);
INSERT INTO `item_mods` VALUES (16575, 14, 7);
INSERT INTO `item_mods` VALUES (16578, 10, 2);
INSERT INTO `item_mods` VALUES (16578, 13, 2);
INSERT INTO `item_mods` VALUES (16578, 23, 5);
INSERT INTO `item_mods` VALUES (16579, 2, 10);
INSERT INTO `item_mods` VALUES (16579, 9, 2);
INSERT INTO `item_mods` VALUES (16579, 10, 2);
INSERT INTO `item_mods` VALUES (16580, 8, 4);
INSERT INTO `item_mods` VALUES (16580, 9, 4);
INSERT INTO `item_mods` VALUES (16580, 10, -8);
INSERT INTO `item_mods` VALUES (16580, 11, 4);
INSERT INTO `item_mods` VALUES (16580, 12, 4);
INSERT INTO `item_mods` VALUES (16580, 13, -8);
INSERT INTO `item_mods` VALUES (16580, 14, -8);

-- -------------------------------------------------------
-- Holy Sword
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16581, 431, 1); -- Additional Effect: Light Damage

INSERT INTO `item_mods` VALUES (16587, 25, 4);

-- -------------------------------------------------------
-- Item: Flame Claymore
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16588, 431, 1); -- Additional Effect: Fire Damage

-- -------------------------------------------------------
-- Inferno Sword
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16594, 431, 1); -- Additional Effect: Fire Damage

INSERT INTO `item_mods` VALUES (16596, 13, 2);
INSERT INTO `item_mods` VALUES (16596, 23, 5);
INSERT INTO `item_mods` VALUES (16597, 2, 10);
INSERT INTO `item_mods` VALUES (16597, 9, 2);
INSERT INTO `item_mods` VALUES (16597, 10, 2);
INSERT INTO `item_mods` VALUES (16598, 23, 4);
INSERT INTO `item_mods` VALUES (16598, 25, 4);
INSERT INTO `item_mods` VALUES (16599, 8, 2);
INSERT INTO `item_mods` VALUES (16599, 13, 3);
INSERT INTO `item_mods` VALUES (16599, 14, 1);
INSERT INTO `item_mods` VALUES (16605, 432, 5);
INSERT INTO `item_mods` VALUES (16610, 25, 2);
INSERT INTO `item_mods` VALUES (16611, 25, 2);

-- -------------------------------------------------------
-- Spirit Sword
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16613, 431, 1); -- Additional Effect: Light Damage

INSERT INTO `item_mods` VALUES (16619, 25, 3);
INSERT INTO `item_mods` VALUES (16620, 59, 9);

-- -------------------------------------------------------
-- Item: Flame Sword
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16621, 431, 1); -- Additional Effect: Fire Damage

INSERT INTO `item_mods` VALUES (16629, 9, 2);
INSERT INTO `item_mods` VALUES (16637, 1, -6);
INSERT INTO `item_mods` VALUES (16637, 23, 8);
INSERT INTO `item_mods` VALUES (16653, 2, 10);
INSERT INTO `item_mods` VALUES (16653, 9, 2);
INSERT INTO `item_mods` VALUES (16653, 10, 2);
INSERT INTO `item_mods` VALUES (16656, 8, 2);
INSERT INTO `item_mods` VALUES (16656, 12, -1);
INSERT INTO `item_mods` VALUES (16656, 13, -1);
INSERT INTO `item_mods` VALUES (16656, 14, -1);
INSERT INTO `item_mods` VALUES (16659, 2, 10);
INSERT INTO `item_mods` VALUES (16659, 9, 2);
INSERT INTO `item_mods` VALUES (16659, 10, 2);
INSERT INTO `item_mods` VALUES (16669, 23, 5);
INSERT INTO `item_mods` VALUES (16673, 8, 1);
INSERT INTO `item_mods` VALUES (16673, 9, 1);
INSERT INTO `item_mods` VALUES (16675, 55, -10);
INSERT INTO `item_mods` VALUES (16675, 56, 10);
INSERT INTO `item_mods` VALUES (16675, 57, 10);
INSERT INTO `item_mods` VALUES (16676, 25, 10);
INSERT INTO `item_mods` VALUES (16676, 68, -10);
INSERT INTO `item_mods` VALUES (16678, 8, 2);
INSERT INTO `item_mods` VALUES (16678, 9, 2);
INSERT INTO `item_mods` VALUES (16679, 8, 7);
INSERT INTO `item_mods` VALUES (16679, 9, -1);
INSERT INTO `item_mods` VALUES (16679, 10, -1);
INSERT INTO `item_mods` VALUES (16679, 11, -1);
INSERT INTO `item_mods` VALUES (16679, 12, -1);
INSERT INTO `item_mods` VALUES (16679, 13, -1);
INSERT INTO `item_mods` VALUES (16679, 14, -1);
INSERT INTO `item_mods` VALUES (16680, 8, 2);
INSERT INTO `item_mods` VALUES (16680, 14, 2);
INSERT INTO `item_mods` VALUES (16684, 13, 3);
INSERT INTO `item_mods` VALUES (16684, 14, 3);
INSERT INTO `item_mods` VALUES (16684, 25, 4);
INSERT INTO `item_mods` VALUES (16685, 2, 11);
INSERT INTO `item_mods` VALUES (16685, 9, 3);
INSERT INTO `item_mods` VALUES (16685, 10, 3);
INSERT INTO `item_mods` VALUES (16689, 25, 3);
INSERT INTO `item_mods` VALUES (16690, 25, 4);
INSERT INTO `item_mods` VALUES (16691, 25, 3);
INSERT INTO `item_mods` VALUES (16691, 54, 2);

-- -------------------------------------------------------
-- Poison Baghnakhs +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16692, 431, 1); -- Additional Effect: Poison

-- -------------------------------------------------------
-- Poison Katars +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16693, 431, 1); -- Additional Effect: Poison

INSERT INTO `item_mods` VALUES (16694, 1, -10);
INSERT INTO `item_mods` VALUES (16694, 23, 10);
INSERT INTO `item_mods` VALUES (16698, 25, 3);
INSERT INTO `item_mods` VALUES (16699, 25, 4);
INSERT INTO `item_mods` VALUES (16700, 25, 4);
INSERT INTO `item_mods` VALUES (16700, 431, 1); -- Additional Effect: Poison

INSERT INTO `item_mods` VALUES (16701, 9, 2);

-- -------------------------------------------------------
-- Cougar Baghnakhs
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16702, 55, 4);
INSERT INTO `item_mods` VALUES (16702, 431, 1); -- Additional Effect: Ice Damage

INSERT INTO `item_mods` VALUES (16703, 8, 1);
INSERT INTO `item_mods` VALUES (16703, 25, 3);
INSERT INTO `item_mods` VALUES (16707, 2, 10);
INSERT INTO `item_mods` VALUES (16707, 9, 2);
INSERT INTO `item_mods` VALUES (16707, 10, 2);
INSERT INTO `item_mods` VALUES (16708, 10, 1);
INSERT INTO `item_mods` VALUES (16708, 23, 8);

-- -------------------------------------------------------
-- Item: Inferno Axe
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16709, 431, 1); -- Additional Effect: Fire Damage

INSERT INTO `item_mods` VALUES (16710, 8, 4);
INSERT INTO `item_mods` VALUES (16710, 12, -4);
INSERT INTO `item_mods` VALUES (16711, 8, 6);
INSERT INTO `item_mods` VALUES (16711, 12, 6);
INSERT INTO `item_mods` VALUES (16711, 116, 6);

-- -------------------------------------------------------
-- Item: Hellfire Axe
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16713, 431, 1); -- Additional Effect: Fire Damage

INSERT INTO `item_mods` VALUES (16714, 25, 5);
INSERT INTO `item_mods` VALUES (16719, 9, 1);
INSERT INTO `item_mods` VALUES (16721, 8, 2);
INSERT INTO `item_mods` VALUES (16722, 8, 3);
INSERT INTO `item_mods` VALUES (16722, 9, -3);
INSERT INTO `item_mods` VALUES (16723, 8, 5);
INSERT INTO `item_mods` VALUES (16723, 10, -5);
INSERT INTO `item_mods` VALUES (16726, 8, 1);
INSERT INTO `item_mods` VALUES (16727, 9, 2);
INSERT INTO `item_mods` VALUES (16727, 14, 2);
INSERT INTO `item_mods` VALUES (16728, 60, -11);
INSERT INTO `item_mods` VALUES (16728, 61, 11);
INSERT INTO `item_mods` VALUES (16730, 2, 10);
INSERT INTO `item_mods` VALUES (16730, 8, 4);
INSERT INTO `item_mods` VALUES (16730, 12, -4);
INSERT INTO `item_mods` VALUES (16731, 2, 12);
INSERT INTO `item_mods` VALUES (16731, 8, 5);
INSERT INTO `item_mods` VALUES (16731, 12, -5);

-- -------------------------------------------------------
-- Trials Weapon
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16735, 2, 20);
INSERT INTO `item_mods` VALUES (16735, 57, 10);
INSERT INTO `item_mods` VALUES (16735, 59, 10);

-- -------------------------------------------------------
-- Poison Dagger +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16741, 431, 1); -- Additional Effect: Poison

-- -------------------------------------------------------
-- Poison Knife +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16742, 431, 1); -- Additional Effect: Poison

-- -------------------------------------------------------
-- Python Baselard
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16743, 431, 1); -- Additional Effect: Poison

INSERT INTO `item_mods` VALUES (16744, 25, 3);
INSERT INTO `item_mods` VALUES (16745, 25, 2);
INSERT INTO `item_mods` VALUES (16746, 25, 2);
INSERT INTO `item_mods` VALUES (16747, 25, 3);
INSERT INTO `item_mods` VALUES (16753, 5, 10);
INSERT INTO `item_mods` VALUES (16754, 110, 10);
INSERT INTO `item_mods` VALUES (16755, 11, 1);
INSERT INTO `item_mods` VALUES (16755, 26, 10);
INSERT INTO `item_mods` VALUES (16757, 23, 10);
INSERT INTO `item_mods` VALUES (16764, 9, 2);
INSERT INTO `item_mods` VALUES (16764, 11, 2);
INSERT INTO `item_mods` VALUES (16765, 8, -1);
INSERT INTO `item_mods` VALUES (16765, 9, -1);
INSERT INTO `item_mods` VALUES (16765, 10, -1);
INSERT INTO `item_mods` VALUES (16765, 11, 7);
INSERT INTO `item_mods` VALUES (16765, 12, -1);
INSERT INTO `item_mods` VALUES (16765, 13, -1);
INSERT INTO `item_mods` VALUES (16765, 14, -1);
INSERT INTO `item_mods` VALUES (16766, 11, 2);
INSERT INTO `item_mods` VALUES (16766, 14, 2);
INSERT INTO `item_mods` VALUES (16767, 302, 1);
INSERT INTO `item_mods` VALUES (16771, 9, 4);
INSERT INTO `item_mods` VALUES (16771, 11, -4);

-- -------------------------------------------------------
-- Cruel Scythe
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16773, 12, 2);
INSERT INTO `item_mods` VALUES (16773, 13, -2);
INSERT INTO `item_mods` VALUES (16773, 60, -2);
INSERT INTO `item_mods` VALUES (16773, 61, 2);
INSERT INTO `item_mods` VALUES (16773, 431, 1); -- Additional Effect: Impairs Evasion

INSERT INTO `item_mods` VALUES (16780, 8, 2);
INSERT INTO `item_mods` VALUES (16780, 10, -1);

-- -------------------------------------------------------
-- Frostreaper
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16784, 55, 6);
INSERT INTO `item_mods` VALUES (16784, 431, 1); -- Additional Effect: Ice Damage

INSERT INTO `item_mods` VALUES (16786, 23, 25);
INSERT INTO `item_mods` VALUES (16786, 25, -5);
INSERT INTO `item_mods` VALUES (16787, 61, 12);
INSERT INTO `item_mods` VALUES (16788, 3, -5);
INSERT INTO `item_mods` VALUES (16788, 25, 5);

-- -------------------------------------------------------
-- Trials Weapon
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16793, 2, 20);
INSERT INTO `item_mods` VALUES (16793, 58, 10);
INSERT INTO `item_mods` VALUES (16793, 60, 10);

INSERT INTO `item_mods` VALUES (16798, 8, 2);
INSERT INTO `item_mods` VALUES (16798, 12, 2);
INSERT INTO `item_mods` VALUES (16799, 242, 2);
INSERT INTO `item_mods` VALUES (16805, 25, 6);
INSERT INTO `item_mods` VALUES (16805, 110, 5);
INSERT INTO `item_mods` VALUES (16806, 23, 4);
INSERT INTO `item_mods` VALUES (16806, 25, 3);
INSERT INTO `item_mods` VALUES (16807, 23, 5);
INSERT INTO `item_mods` VALUES (16807, 25, 3);
INSERT INTO `item_mods` VALUES (16808, 1, 3);
INSERT INTO `item_mods` VALUES (16808, 68, 3);
INSERT INTO `item_mods` VALUES (16809, 23, 14);
INSERT INTO `item_mods` VALUES (16810, 23, 12);

-- -------------------------------------------------------
-- Holy Sword +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16816, 431, 1); -- Additional Effect: Light Damage

INSERT INTO `item_mods` VALUES (16818, 23, 5);
INSERT INTO `item_mods` VALUES (16819, 9, 3);
INSERT INTO `item_mods` VALUES (16820, 11, 3);
INSERT INTO `item_mods` VALUES (16821, 110, 10);
INSERT INTO `item_mods` VALUES (16822, 5, 10);
INSERT INTO `item_mods` VALUES (16822, 12, 5);

-- -------------------------------------------------------
-- Divine Sword +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16826, 431, 1); -- Additional Effect: Light Damage

INSERT INTO `item_mods` VALUES (16829, 5, 10);
INSERT INTO `item_mods` VALUES (16829, 12, 1);
INSERT INTO `item_mods` VALUES (16829, 13, 1);
INSERT INTO `item_mods` VALUES (16830, 8, -1);
INSERT INTO `item_mods` VALUES (16830, 9, -1);
INSERT INTO `item_mods` VALUES (16830, 10, 7);
INSERT INTO `item_mods` VALUES (16830, 11, -1);
INSERT INTO `item_mods` VALUES (16830, 12, -1);
INSERT INTO `item_mods` VALUES (16830, 13, -1);
INSERT INTO `item_mods` VALUES (16830, 14, -1);
INSERT INTO `item_mods` VALUES (16831, 8, -1);
INSERT INTO `item_mods` VALUES (16831, 9, 7);
INSERT INTO `item_mods` VALUES (16831, 10, -1);
INSERT INTO `item_mods` VALUES (16831, 11, -1);
INSERT INTO `item_mods` VALUES (16831, 12, -1);
INSERT INTO `item_mods` VALUES (16831, 13, -1);
INSERT INTO `item_mods` VALUES (16831, 14, -1);
INSERT INTO `item_mods` VALUES (16838, 11, 3);
INSERT INTO `item_mods` VALUES (16838, 27, 3);
INSERT INTO `item_mods` VALUES (16840, 2, 10);
INSERT INTO `item_mods` VALUES (16840, 9, 2);
INSERT INTO `item_mods` VALUES (16840, 10, 2);
INSERT INTO `item_mods` VALUES (16841, 10, 4);
INSERT INTO `item_mods` VALUES (16841, 11, 4);
INSERT INTO `item_mods` VALUES (16849, 25, 2);
INSERT INTO `item_mods` VALUES (16855, 2, 25);
INSERT INTO `item_mods` VALUES (16855, 8, 3);
INSERT INTO `item_mods` VALUES (16855, 10, 5);
INSERT INTO `item_mods` VALUES (16856, 8, 1);
INSERT INTO `item_mods` VALUES (16856, 12, -1);
INSERT INTO `item_mods` VALUES (16856, 13, -1);
INSERT INTO `item_mods` VALUES (16857, 56, 4);

-- -------------------------------------------------------
-- Cruel Spear
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16863, 12, 2);
INSERT INTO `item_mods` VALUES (16863, 13, -2);
INSERT INTO `item_mods` VALUES (16863, 60, -2);
INSERT INTO `item_mods` VALUES (16863, 61, 2);
INSERT INTO `item_mods` VALUES (16863, 431, 1); -- Additional Effect: Impairs Evasion

INSERT INTO `item_mods` VALUES (16867, 2, 7);
INSERT INTO `item_mods` VALUES (16867, 14, 4);
INSERT INTO `item_mods` VALUES (16868, 68, -3);
INSERT INTO `item_mods` VALUES (16869, 9, 3);
INSERT INTO `item_mods` VALUES (16869, 55, 11);
INSERT INTO `item_mods` VALUES (16869, 57, -11);
INSERT INTO `item_mods` VALUES (16869, 58, 11);
INSERT INTO `item_mods` VALUES (16870, 8, -1);
INSERT INTO `item_mods` VALUES (16870, 9, -1);
INSERT INTO `item_mods` VALUES (16870, 10, -1);
INSERT INTO `item_mods` VALUES (16870, 11, -1);
INSERT INTO `item_mods` VALUES (16870, 12, -1);
INSERT INTO `item_mods` VALUES (16870, 13, -1);
INSERT INTO `item_mods` VALUES (16870, 14, 7);
INSERT INTO `item_mods` VALUES (16873, 10, 5);
INSERT INTO `item_mods` VALUES (16873, 11, 5);
INSERT INTO `item_mods` VALUES (16879, 25, 3);
INSERT INTO `item_mods` VALUES (16882, 11, 2);
INSERT INTO `item_mods` VALUES (16882, 13, 2);
INSERT INTO `item_mods` VALUES (16884, 2, 15);
INSERT INTO `item_mods` VALUES (16884, 112, 10);
INSERT INTO `item_mods` VALUES (16885, 2, 10);
INSERT INTO `item_mods` VALUES (16885, 5, 10);
INSERT INTO `item_mods` VALUES (16885, 59, 7);
INSERT INTO `item_mods` VALUES (16886, 25, 7);
INSERT INTO `item_mods` VALUES (16887, 9, 1);
INSERT INTO `item_mods` VALUES (16887, 10, 1);
INSERT INTO `item_mods` VALUES (16888, 9, 2);
INSERT INTO `item_mods` VALUES (16889, 9, 3);
INSERT INTO `item_mods` VALUES (16890, 8, 2);
INSERT INTO `item_mods` VALUES (16890, 12, -1);
INSERT INTO `item_mods` VALUES (16890, 13, -1);
INSERT INTO `item_mods` VALUES (16891, 8, 3);
INSERT INTO `item_mods` VALUES (16891, 12, -1);
INSERT INTO `item_mods` VALUES (16891, 13, -1);

-- -------------------------------------------------------
-- Trials Weapon
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16892, 2, 20);
INSERT INTO `item_mods` VALUES (16892, 59, 10);
INSERT INTO `item_mods` VALUES (16892, 61, 10);

INSERT INTO `item_mods` VALUES (16893, 244, 2);
INSERT INTO `item_mods` VALUES (16894, 2, 11);
INSERT INTO `item_mods` VALUES (16894, 9, 3);
INSERT INTO `item_mods` VALUES (16894, 10, 3);
INSERT INTO `item_mods` VALUES (16899, 25, 3);
INSERT INTO `item_mods` VALUES (16904, 165, 3);

-- -------------------------------------------------------
-- Item: Mokuto
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16906, 431, 1); -- Additional Effect: Silence

-- -------------------------------------------------------
-- Busuto
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16907, 431, 1); -- Additional Effect: Poison

-- -------------------------------------------------------
-- Yoto
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16908, 431, 1); -- Additional Effect: Weakens defense

INSERT INTO `item_mods` VALUES (16911, 25, -1);
INSERT INTO `item_mods` VALUES (16913, 9, 3);
INSERT INTO `item_mods` VALUES (16924, 135, 3);

-- -------------------------------------------------------
-- Item: Mokuto +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16925, 431, 1); -- Additional Effect: Silence

-- -------------------------------------------------------
-- Busuto +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16927, 431, 1); -- Additional Effect: Poison

-- -------------------------------------------------------
-- Hellfire Sword
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16928, 431, 1); -- Additional Effect: Fire Damage

-- -------------------------------------------------------
-- Item: Burning Claymore
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16929, 431, 1); -- Additional Effect: Fire Damage

INSERT INTO `item_mods` VALUES (16930, 23, 7);
INSERT INTO `item_mods` VALUES (16934, 9, 2);
INSERT INTO `item_mods` VALUES (16934, 25, 5);
INSERT INTO `item_mods` VALUES (16935, 23, 15);
INSERT INTO `item_mods` VALUES (16935, 25, -5);

-- -------------------------------------------------------
-- Demonic Sword
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16936, 61, 8);
INSERT INTO `item_mods` VALUES (16936, 431, 1); -- Additional Effect: Darkness Damage

-- -------------------------------------------------------
-- Item:  Ice Brand
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16937, 55, 8);
INSERT INTO `item_mods` VALUES (16937, 431, 1); -- Additional Effect: Fire Damage

INSERT INTO `item_mods` VALUES (16938, 60, 12);
INSERT INTO `item_mods` VALUES (16941, 13, 3);
INSERT INTO `item_mods` VALUES (16941, 23, 7);
INSERT INTO `item_mods` VALUES (16942, 3, -5);
INSERT INTO `item_mods` VALUES (16942, 23, 13);
INSERT INTO `item_mods` VALUES (16942, 25, 5);
INSERT INTO `item_mods` VALUES (16943, 8, 3);
INSERT INTO `item_mods` VALUES (16943, 10, 3);
INSERT INTO `item_mods` VALUES (16943, 13, 3);
INSERT INTO `item_mods` VALUES (16945, 54, 7);
INSERT INTO `item_mods` VALUES (16945, 59, 7);
INSERT INTO `item_mods` VALUES (16946, 5, 6);
INSERT INTO `item_mods` VALUES (16946, 23, 7);
INSERT INTO `item_mods` VALUES (16947, 5, 8);
INSERT INTO `item_mods` VALUES (16947, 23, 7);

-- -------------------------------------------------------
-- Trials Weapon
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16952, 2, 20);
INSERT INTO `item_mods` VALUES (16952, 55, 10);
INSERT INTO `item_mods` VALUES (16952, 57, 10);

INSERT INTO `item_mods` VALUES (16953, 243, 2);
INSERT INTO `item_mods` VALUES (16954, 2, 10);
INSERT INTO `item_mods` VALUES (16954, 9, 2);
INSERT INTO `item_mods` VALUES (16954, 10, 2);
INSERT INTO `item_mods` VALUES (16955, 2, 11);
INSERT INTO `item_mods` VALUES (16955, 9, 3);
INSERT INTO `item_mods` VALUES (16955, 10, 3);
INSERT INTO `item_mods` VALUES (16956, 25, 3);
INSERT INTO `item_mods` VALUES (16961, 3, -5);
INSERT INTO `item_mods` VALUES (16961, 54, 16);
INSERT INTO `item_mods` VALUES (16965, 8, 1);
INSERT INTO `item_mods` VALUES (16965, 25, 2);
INSERT INTO `item_mods` VALUES (16968, 25, 5);
INSERT INTO `item_mods` VALUES (16972, 14, 2);

-- -------------------------------------------------------
-- Homura
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16973, 431, 1); -- Additional Effect: Fire Damage

-- -------------------------------------------------------
-- Dotanuki
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16974, 431, 1); -- Additional Effect

INSERT INTO `item_mods` VALUES (16980, 23, 7);
INSERT INTO `item_mods` VALUES (16980, 288, 1);

-- -------------------------------------------------------
-- Homura +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16986, 431, 1); -- Additional Effect: Fire Damage

INSERT INTO `item_mods` VALUES (16990, 8, 3);
INSERT INTO `item_mods` VALUES (17038, 5, 10);
INSERT INTO `item_mods` VALUES (17038, 9, 2);
INSERT INTO `item_mods` VALUES (17038, 10, 2);
INSERT INTO `item_mods` VALUES (17039, 10, 1);
INSERT INTO `item_mods` VALUES (17046, 23, 10);
INSERT INTO `item_mods` VALUES (17049, 12, 1);
INSERT INTO `item_mods` VALUES (17049, 13, 1);
INSERT INTO `item_mods` VALUES (17050, 12, 2);
INSERT INTO `item_mods` VALUES (17050, 13, 2);
INSERT INTO `item_mods` VALUES (17051, 12, 3);
INSERT INTO `item_mods` VALUES (17051, 13, 3);
INSERT INTO `item_mods` VALUES (17052, 12, 4);
INSERT INTO `item_mods` VALUES (17052, 13, 4);
INSERT INTO `item_mods` VALUES (17053, 12, 5);
INSERT INTO `item_mods` VALUES (17053, 13, 5);
INSERT INTO `item_mods` VALUES (17054, 12, 6);
INSERT INTO `item_mods` VALUES (17054, 13, 6);
INSERT INTO `item_mods` VALUES (17056, 12, 8);
INSERT INTO `item_mods` VALUES (17056, 13, 8);
INSERT INTO `item_mods` VALUES (17056, 61, 15);
INSERT INTO `item_mods` VALUES (17057, 374, 15);
INSERT INTO `item_mods` VALUES (17058, 134, 1);
INSERT INTO `item_mods` VALUES (17059, 2, 3);
INSERT INTO `item_mods` VALUES (17060, 2, 6);
INSERT INTO `item_mods` VALUES (17061, 2, 9);
INSERT INTO `item_mods` VALUES (17062, 2, 12);
INSERT INTO `item_mods` VALUES (17063, 2, 15);
INSERT INTO `item_mods` VALUES (17064, 2, 24);
INSERT INTO `item_mods` VALUES (17064, 9, 2);
INSERT INTO `item_mods` VALUES (17064, 10, 2);
INSERT INTO `item_mods` VALUES (17065, 2, 18);
INSERT INTO `item_mods` VALUES (17067, 2, 18);
INSERT INTO `item_mods` VALUES (17067, 13, 1);
INSERT INTO `item_mods` VALUES (17067, 14, 1);
INSERT INTO `item_mods` VALUES (17070, 2, 21);

-- -------------------------------------------------------
-- Heat Rod
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17071, 431, 1); -- Additional Effect: Lightning Damage

INSERT INTO `item_mods` VALUES (17072, 5, 10);
INSERT INTO `item_mods` VALUES (17072, 12, 5);
INSERT INTO `item_mods` VALUES (17073, 12, 10);
INSERT INTO `item_mods` VALUES (17073, 13, 10);

-- -------------------------------------------------------
-- Chocobo Wand
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17074, 511, 30); -- Chocobo riding time +30 min

INSERT INTO `item_mods` VALUES (17075, 2, 27);

-- -------------------------------------------------------
-- Earth Wand
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17076, 431, 1); -- Additional Effect: Earth Damage

-- -------------------------------------------------------
-- Holy Maul
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17080, 13, 2);
INSERT INTO `item_mods` VALUES (17080, 61, 3);
INSERT INTO `item_mods` VALUES (17080, 431, 1); -- Additional Effect: Light Damage

INSERT INTO `item_mods` VALUES (17081, 2, 3);
INSERT INTO `item_mods` VALUES (17081, 12, 1);
INSERT INTO `item_mods` VALUES (17082, 5, 5);
INSERT INTO `item_mods` VALUES (17082, 12, 5);
INSERT INTO `item_mods` VALUES (17082, 13, 5);
INSERT INTO `item_mods` VALUES (17085, 111, 4);
INSERT INTO `item_mods` VALUES (17087, 12, 2);
INSERT INTO `item_mods` VALUES (17087, 13, 2);
INSERT INTO `item_mods` VALUES (17088, 2, 2);
INSERT INTO `item_mods` VALUES (17088, 5, 2);
INSERT INTO `item_mods` VALUES (17089, 2, 4);
INSERT INTO `item_mods` VALUES (17089, 5, 4);
INSERT INTO `item_mods` VALUES (17090, 2, 6);
INSERT INTO `item_mods` VALUES (17090, 5, 6);
INSERT INTO `item_mods` VALUES (17091, 2, 8);
INSERT INTO `item_mods` VALUES (17091, 5, 8);
INSERT INTO `item_mods` VALUES (17092, 2, 10);
INSERT INTO `item_mods` VALUES (17092, 5, 10);
INSERT INTO `item_mods` VALUES (17094, 2, 10);
INSERT INTO `item_mods` VALUES (17094, 5, 10);
INSERT INTO `item_mods` VALUES (17101, 61, 15);
INSERT INTO `item_mods` VALUES (17102, 23, 8);
INSERT INTO `item_mods` VALUES (17102, 25, 4);
INSERT INTO `item_mods` VALUES (17108, 5, 50);
INSERT INTO `item_mods` VALUES (17108, 374, 10);
INSERT INTO `item_mods` VALUES (17111, 2, 4);
INSERT INTO `item_mods` VALUES (17113, 369, 4);

-- -------------------------------------------------------
-- Holy Maul +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17114, 13, 3);
INSERT INTO `item_mods` VALUES (17114, 61, 4);
INSERT INTO `item_mods` VALUES (17114, 431, 1); -- Additional Effect: Light Damage

-- -------------------------------------------------------
-- Misery Staff
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17116, 431, 1); -- Additional Effect: Curse

-- -------------------------------------------------------
-- Hypno Staff
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17117, 431, 1); -- Additional Effect: Sleep

INSERT INTO `item_mods` VALUES (17123, 2, 3);
INSERT INTO `item_mods` VALUES (17123, 5, 3);
INSERT INTO `item_mods` VALUES (17125, 2, 5);
INSERT INTO `item_mods` VALUES (17125, 5, 5);
INSERT INTO `item_mods` VALUES (17126, 2, 7);
INSERT INTO `item_mods` VALUES (17126, 5, 7);
INSERT INTO `item_mods` VALUES (17127, 2, 9);
INSERT INTO `item_mods` VALUES (17127, 5, 9);
INSERT INTO `item_mods` VALUES (17128, 2, 6);
INSERT INTO `item_mods` VALUES (17128, 5, 6);
INSERT INTO `item_mods` VALUES (17129, 23, 3);
INSERT INTO `item_mods` VALUES (17129, 25, 3);
INSERT INTO `item_mods` VALUES (17130, 2, 6);
INSERT INTO `item_mods` VALUES (17130, 5, 6);
INSERT INTO `item_mods` VALUES (17132, 2, 5);
INSERT INTO `item_mods` VALUES (17132, 5, 5);
INSERT INTO `item_mods` VALUES (17132, 10, -5);
INSERT INTO `item_mods` VALUES (17132, 14, 8);
INSERT INTO `item_mods` VALUES (17133, 12, -6);
INSERT INTO `item_mods` VALUES (17133, 13, 6);
INSERT INTO `item_mods` VALUES (17133, 14, 6);
INSERT INTO `item_mods` VALUES (17133, 119, 4);

-- -------------------------------------------------------
-- Dolphin Staff
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17134, 2, 7);
INSERT INTO `item_mods` VALUES (17134, 5, 7);
INSERT INTO `item_mods` VALUES (17134, 59, 6);
INSERT INTO `item_mods` VALUES (17134, 431, 1); -- Additional Effect: Water Damage

INSERT INTO `item_mods` VALUES (17135, 2, 9);
INSERT INTO `item_mods` VALUES (17135, 5, 9);
INSERT INTO `item_mods` VALUES (17135, 55, 10);
INSERT INTO `item_mods` VALUES (17136, 8, -1);
INSERT INTO `item_mods` VALUES (17136, 9, -1);
INSERT INTO `item_mods` VALUES (17136, 10, -1);
INSERT INTO `item_mods` VALUES (17136, 11, -1);
INSERT INTO `item_mods` VALUES (17136, 12, 7);
INSERT INTO `item_mods` VALUES (17136, 13, -1);
INSERT INTO `item_mods` VALUES (17136, 14, -1);
INSERT INTO `item_mods` VALUES (17138, 12, 3);
INSERT INTO `item_mods` VALUES (17138, 13, 3);
INSERT INTO `item_mods` VALUES (17140, 12, 4);
INSERT INTO `item_mods` VALUES (17140, 13, 4);
INSERT INTO `item_mods` VALUES (17141, 12, 5);
INSERT INTO `item_mods` VALUES (17141, 13, 5);
INSERT INTO `item_mods` VALUES (17143, 12, 6);
INSERT INTO `item_mods` VALUES (17143, 13, 6);
INSERT INTO `item_mods` VALUES (17146, 2, 7);
INSERT INTO `item_mods` VALUES (17148, 2, 4);
INSERT INTO `item_mods` VALUES (17148, 12, 1);
INSERT INTO `item_mods` VALUES (17150, 23, 5);
INSERT INTO `item_mods` VALUES (17151, 2, 19);
INSERT INTO `item_mods` VALUES (17165, 2, 10);
INSERT INTO `item_mods` VALUES (17165, 8, 1);
INSERT INTO `item_mods` VALUES (17166, 5, 10);
INSERT INTO `item_mods` VALUES (17166, 29, 1);
INSERT INTO `item_mods` VALUES (17172, 26, 3);
INSERT INTO `item_mods` VALUES (17173, 24, 18);
INSERT INTO `item_mods` VALUES (17173, 26, 2);
INSERT INTO `item_mods` VALUES (17175, 26, 3);
INSERT INTO `item_mods` VALUES (17176, 26, 3);
INSERT INTO `item_mods` VALUES (17177, 24, 3);
INSERT INTO `item_mods` VALUES (17177, 26, 2);
INSERT INTO `item_mods` VALUES (17178, 24, 9);
INSERT INTO `item_mods` VALUES (17178, 26, 2);
INSERT INTO `item_mods` VALUES (17179, 26, 3);
INSERT INTO `item_mods` VALUES (17180, 24, 12);
INSERT INTO `item_mods` VALUES (17180, 26, 2);
INSERT INTO `item_mods` VALUES (17181, 24, 15);
INSERT INTO `item_mods` VALUES (17181, 26, 2);
INSERT INTO `item_mods` VALUES (17182, 26, 3);
INSERT INTO `item_mods` VALUES (17183, 8, 1);
INSERT INTO `item_mods` VALUES (17183, 11, 1);
INSERT INTO `item_mods` VALUES (17183, 24, 5);
INSERT INTO `item_mods` VALUES (17183, 26, 2);
INSERT INTO `item_mods` VALUES (17184, 11, 2);
INSERT INTO `item_mods` VALUES (17184, 26, 3);
INSERT INTO `item_mods` VALUES (17186, 11, 4);
INSERT INTO `item_mods` VALUES (17186, 26, 3);
INSERT INTO `item_mods` VALUES (17187, 8, 3);
INSERT INTO `item_mods` VALUES (17187, 11, 3);
INSERT INTO `item_mods` VALUES (17187, 24, 23);
INSERT INTO `item_mods` VALUES (17187, 26, 2);
INSERT INTO `item_mods` VALUES (17188, 11, 4);
INSERT INTO `item_mods` VALUES (17189, 26, 3);
INSERT INTO `item_mods` VALUES (17190, 8, 1);
INSERT INTO `item_mods` VALUES (17190, 12, 1);
INSERT INTO `item_mods` VALUES (17190, 26, 8);
INSERT INTO `item_mods` VALUES (17192, 8, 3);
INSERT INTO `item_mods` VALUES (17192, 24, 10);
INSERT INTO `item_mods` VALUES (17193, 11, 2);
INSERT INTO `item_mods` VALUES (17193, 26, 8);
INSERT INTO `item_mods` VALUES (17194, 11, 2);
INSERT INTO `item_mods` VALUES (17194, 26, 10);
INSERT INTO `item_mods` VALUES (17195, 24, 2);
INSERT INTO `item_mods` VALUES (17196, 24, 3);
INSERT INTO `item_mods` VALUES (17197, 26, 1);
INSERT INTO `item_mods` VALUES (17198, 26, 2);
INSERT INTO `item_mods` VALUES (17199, 26, 12);
INSERT INTO `item_mods` VALUES (17200, 2, 10);
INSERT INTO `item_mods` VALUES (17200, 10, 3);
INSERT INTO `item_mods` VALUES (17201, 2, 12);
INSERT INTO `item_mods` VALUES (17201, 10, 4);
INSERT INTO `item_mods` VALUES (17201, 26, 3);
INSERT INTO `item_mods` VALUES (17203, 24, 12);
INSERT INTO `item_mods` VALUES (17203, 26, 4);
INSERT INTO `item_mods` VALUES (17204, 26, 5);
INSERT INTO `item_mods` VALUES (17205, 11, 2);
INSERT INTO `item_mods` VALUES (17206, 11, 3);
INSERT INTO `item_mods` VALUES (17206, 26, 3);
INSERT INTO `item_mods` VALUES (17207, 26, 9);
INSERT INTO `item_mods` VALUES (17207, 379, 13);
INSERT INTO `item_mods` VALUES (17209, 345, 1000);
INSERT INTO `item_mods` VALUES (17210, 345, 1000);
INSERT INTO `item_mods` VALUES (17211, 24, 4);
INSERT INTO `item_mods` VALUES (17212, 8, 2);
INSERT INTO `item_mods` VALUES (17213, 11, 4);
INSERT INTO `item_mods` VALUES (17213, 234, 2);
INSERT INTO `item_mods` VALUES (17214, 11, 4);
INSERT INTO `item_mods` VALUES (17214, 24, 18);
INSERT INTO `item_mods` VALUES (17214, 234, 2);
INSERT INTO `item_mods` VALUES (17215, 11, 1);
INSERT INTO `item_mods` VALUES (17215, 26, 2);
INSERT INTO `item_mods` VALUES (17222, 26, 5);
INSERT INTO `item_mods` VALUES (17225, 24, 6);
INSERT INTO `item_mods` VALUES (17226, 24, 12);
INSERT INTO `item_mods` VALUES (17227, 24, 15);
INSERT INTO `item_mods` VALUES (17228, 24, 3);
INSERT INTO `item_mods` VALUES (17229, 24, 9);
INSERT INTO `item_mods` VALUES (17230, 11, 1);
INSERT INTO `item_mods` VALUES (17233, 24, 18);
INSERT INTO `item_mods` VALUES (17235, 24, 10);
INSERT INTO `item_mods` VALUES (17235, 26, 3);
INSERT INTO `item_mods` VALUES (17238, 2, 4);
INSERT INTO `item_mods` VALUES (17239, 2, 6);
INSERT INTO `item_mods` VALUES (17240, 9, 2);
INSERT INTO `item_mods` VALUES (17240, 58, 6);
INSERT INTO `item_mods` VALUES (17241, 9, 3);
INSERT INTO `item_mods` VALUES (17241, 26, 3);
INSERT INTO `item_mods` VALUES (17241, 58, 7);
INSERT INTO `item_mods` VALUES (17242, 11, 1);
INSERT INTO `item_mods` VALUES (17243, 11, 2);
INSERT INTO `item_mods` VALUES (17243, 24, 16);
INSERT INTO `item_mods` VALUES (17244, 24, 18);
INSERT INTO `item_mods` VALUES (17245, 11, 4);
INSERT INTO `item_mods` VALUES (17245, 24, 3);
INSERT INTO `item_mods` VALUES (17245, 26, 12);
INSERT INTO `item_mods` VALUES (17246, 26, 8);
INSERT INTO `item_mods` VALUES (17247, 24, 3);
INSERT INTO `item_mods` VALUES (17247, 26, 3);
INSERT INTO `item_mods` VALUES (17251, 24, 15);
INSERT INTO `item_mods` VALUES (17251, 26, 5);
INSERT INTO `item_mods` VALUES (17252, 24, 18);
INSERT INTO `item_mods` VALUES (17252, 26, -10);
INSERT INTO `item_mods` VALUES (17253, 26, 10);
INSERT INTO `item_mods` VALUES (17255, 54, 2);
INSERT INTO `item_mods` VALUES (17256, 24, 10);
INSERT INTO `item_mods` VALUES (17256, 26, 10);
INSERT INTO `item_mods` VALUES (17259, 57, -3);
INSERT INTO `item_mods` VALUES (17259, 59, 6);
INSERT INTO `item_mods` VALUES (17260, 26, 5);
INSERT INTO `item_mods` VALUES (17260, 57, -3);
INSERT INTO `item_mods` VALUES (17260, 58, 3);
INSERT INTO `item_mods` VALUES (17260, 59, 9);
INSERT INTO `item_mods` VALUES (17264, 24, 17);
INSERT INTO `item_mods` VALUES (17264, 26, 7);
INSERT INTO `item_mods` VALUES (17269, 26, 10);
INSERT INTO `item_mods` VALUES (17270, 26, 10);
INSERT INTO `item_mods` VALUES (17272, 24, 7);
INSERT INTO `item_mods` VALUES (17275, 26, 9);
INSERT INTO `item_mods` VALUES (17275, 379, 13);
INSERT INTO `item_mods` VALUES (17276, 26, -6);
INSERT INTO `item_mods` VALUES (17277, 5, 30);
INSERT INTO `item_mods` VALUES (17277, 27, -1);
INSERT INTO `item_mods` VALUES (17278, 26, 5);
INSERT INTO `item_mods` VALUES (17283, 24, 5);
INSERT INTO `item_mods` VALUES (17283, 26, 5);
INSERT INTO `item_mods` VALUES (17291, 54, 4);
INSERT INTO `item_mods` VALUES (17292, 11, 2);
INSERT INTO `item_mods` VALUES (17294, 2, 15);
INSERT INTO `item_mods` VALUES (17294, 5, 15);
INSERT INTO `item_mods` VALUES (17294, 24, 20);
INSERT INTO `item_mods` VALUES (17294, 26, 10);
INSERT INTO `item_mods` VALUES (17294, 60, 4);
INSERT INTO `item_mods` VALUES (17294, 61, 4);
INSERT INTO `item_mods` VALUES (17295, 26, 10);
INSERT INTO `item_mods` VALUES (17300, 26, 10);
INSERT INTO `item_mods` VALUES (17317, 26, 15);

-- -------------------------------------------------------
-- Kabura Arrow
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17325, 431, 1); -- Additional effect: Silence

INSERT INTO `item_mods` VALUES (17327, 24, 20);
INSERT INTO `item_mods` VALUES (17327, 26, 10);
INSERT INTO `item_mods` VALUES (17328, 24, 20);
INSERT INTO `item_mods` VALUES (17328, 26, 10);

-- -------------------------------------------------------
-- Patriarch Protectors Arrow
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17329, 26, 40);
INSERT INTO `item_mods` VALUES (17329, 431, 1); -- Additional effect: Paralysis

INSERT INTO `item_mods` VALUES (17331, 26, -3);
INSERT INTO `item_mods` VALUES (17332, 26, 5);
INSERT INTO `item_mods` VALUES (17334, 26, 15);
INSERT INTO `item_mods` VALUES (17335, 26, -3);
INSERT INTO `item_mods` VALUES (17344, 434, 1);
INSERT INTO `item_mods` VALUES (17346, 436, 2);
INSERT INTO `item_mods` VALUES (17347, 437, 1);
INSERT INTO `item_mods` VALUES (17348, 438, 1);
INSERT INTO `item_mods` VALUES (17349, 443, 2);
INSERT INTO `item_mods` VALUES (17350, 448, 1);
INSERT INTO `item_mods` VALUES (17351, 439, 1);
INSERT INTO `item_mods` VALUES (17352, 447, 1);
INSERT INTO `item_mods` VALUES (17354, 433, 1);
INSERT INTO `item_mods` VALUES (17355, 441, 1);
INSERT INTO `item_mods` VALUES (17357, 435, 1);
INSERT INTO `item_mods` VALUES (17358, 370, 1);
INSERT INTO `item_mods` VALUES (17358, 435, 3);
INSERT INTO `item_mods` VALUES (17359, 61, 15);
INSERT INTO `item_mods` VALUES (17359, 441, 1);
INSERT INTO `item_mods` VALUES (17360, 441, 3);
INSERT INTO `item_mods` VALUES (17360, 443, 3);
INSERT INTO `item_mods` VALUES (17361, 445, 1);
INSERT INTO `item_mods` VALUES (17362, 2, 15);
INSERT INTO `item_mods` VALUES (17362, 436, 2);
INSERT INTO `item_mods` VALUES (17363, 449, 3);
INSERT INTO `item_mods` VALUES (17363, 451, 1);
INSERT INTO `item_mods` VALUES (17364, 14, 2);
INSERT INTO `item_mods` VALUES (17364, 60, 5);
INSERT INTO `item_mods` VALUES (17364, 450, 1);
INSERT INTO `item_mods` VALUES (17365, 8, 2);
INSERT INTO `item_mods` VALUES (17365, 12, -4);
INSERT INTO `item_mods` VALUES (17365, 14, -4);
INSERT INTO `item_mods` VALUES (17366, 440, 1);
INSERT INTO `item_mods` VALUES (17367, 14, 3);
INSERT INTO `item_mods` VALUES (17367, 443, 1);
INSERT INTO `item_mods` VALUES (17368, 437, 2);
INSERT INTO `item_mods` VALUES (17369, 434, 2);
INSERT INTO `item_mods` VALUES (17370, 439, 2);
INSERT INTO `item_mods` VALUES (17371, 447, 2);
INSERT INTO `item_mods` VALUES (17372, 436, 1);
INSERT INTO `item_mods` VALUES (17373, 433, 1);
INSERT INTO `item_mods` VALUES (17374, 433, 2);
INSERT INTO `item_mods` VALUES (17375, 438, 2);
INSERT INTO `item_mods` VALUES (17376, 441, 2);
INSERT INTO `item_mods` VALUES (17377, 445, 2);
INSERT INTO `item_mods` VALUES (17378, 448, 2);
INSERT INTO `item_mods` VALUES (17379, 14, 2);
INSERT INTO `item_mods` VALUES (17379, 68, 3);
INSERT INTO `item_mods` VALUES (17379, 436, 2);
INSERT INTO `item_mods` VALUES (17409, 2, 10);
INSERT INTO `item_mods` VALUES (17410, 2, 13);
INSERT INTO `item_mods` VALUES (17410, 61, 3);
INSERT INTO `item_mods` VALUES (17412, 2, 20);
INSERT INTO `item_mods` VALUES (17412, 5, -20);
INSERT INTO `item_mods` VALUES (17413, 12, 2);
INSERT INTO `item_mods` VALUES (17413, 13, 2);
INSERT INTO `item_mods` VALUES (17413, 168, 25);

-- -------------------------------------------------------
-- Pixie Mace
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17414, 25, 5);
INSERT INTO `item_mods` VALUES (17414, 60, 3);
INSERT INTO `item_mods` VALUES (17414, 61, 3);
INSERT INTO `item_mods` VALUES (17414, 431, 1); -- Additional Effect: Light Damage

INSERT INTO `item_mods` VALUES (17415, 2, 7);
INSERT INTO `item_mods` VALUES (17415, 14, 4);
INSERT INTO `item_mods` VALUES (17417, 3, 1);
INSERT INTO `item_mods` VALUES (17417, 6, 1);
INSERT INTO `item_mods` VALUES (17418, 3, 1);
INSERT INTO `item_mods` VALUES (17418, 6, 1);
INSERT INTO `item_mods` VALUES (17419, 3, 1);
INSERT INTO `item_mods` VALUES (17419, 6, 1);
INSERT INTO `item_mods` VALUES (17420, 3, 1);
INSERT INTO `item_mods` VALUES (17420, 6, 1);
INSERT INTO `item_mods` VALUES (17421, 3, 1);
INSERT INTO `item_mods` VALUES (17421, 6, 1);
INSERT INTO `item_mods` VALUES (17422, 5, 10);
INSERT INTO `item_mods` VALUES (17422, 13, 2);
INSERT INTO `item_mods` VALUES (17423, 5, 20);
INSERT INTO `item_mods` VALUES (17424, 23, 3);
INSERT INTO `item_mods` VALUES (17425, 23, 5);
INSERT INTO `item_mods` VALUES (17427, 12, 7);
INSERT INTO `item_mods` VALUES (17427, 13, 7);
INSERT INTO `item_mods` VALUES (17429, 13, 7);
INSERT INTO `item_mods` VALUES (17430, 12, 7);
INSERT INTO `item_mods` VALUES (17431, 10, 2);
INSERT INTO `item_mods` VALUES (17432, 23, 12);
INSERT INTO `item_mods` VALUES (17433, 12, 9);
INSERT INTO `item_mods` VALUES (17433, 13, 9);
INSERT INTO `item_mods` VALUES (17433, 61, 20);
INSERT INTO `item_mods` VALUES (17434, 111, 5);
INSERT INTO `item_mods` VALUES (17435, 2, 16);
INSERT INTO `item_mods` VALUES (17436, 2, 19);
INSERT INTO `item_mods` VALUES (17437, 2, 9);
INSERT INTO `item_mods` VALUES (17437, 8, -3);
INSERT INTO `item_mods` VALUES (17437, 9, -3);
INSERT INTO `item_mods` VALUES (17437, 10, -3);
INSERT INTO `item_mods` VALUES (17437, 11, -3);
INSERT INTO `item_mods` VALUES (17437, 12, 5);
INSERT INTO `item_mods` VALUES (17437, 13, 5);
INSERT INTO `item_mods` VALUES (17437, 14, 5);
INSERT INTO `item_mods` VALUES (17438, 10, 3);
INSERT INTO `item_mods` VALUES (17439, 13, 3);
INSERT INTO `item_mods` VALUES (17441, 5, 5);
INSERT INTO `item_mods` VALUES (17441, 12, 2);
INSERT INTO `item_mods` VALUES (17441, 13, 2);
INSERT INTO `item_mods` VALUES (17441, 168, 25);
INSERT INTO `item_mods` VALUES (17442, 5, 6);
INSERT INTO `item_mods` VALUES (17442, 12, 2);
INSERT INTO `item_mods` VALUES (17442, 13, 2);
INSERT INTO `item_mods` VALUES (17442, 168, 25);
INSERT INTO `item_mods` VALUES (17443, 3, 1);
INSERT INTO `item_mods` VALUES (17443, 6, 1);
INSERT INTO `item_mods` VALUES (17444, 2, 2);
INSERT INTO `item_mods` VALUES (17444, 5, 2);
INSERT INTO `item_mods` VALUES (17445, 2, 3);
INSERT INTO `item_mods` VALUES (17445, 5, 3);
INSERT INTO `item_mods` VALUES (17446, 5, 5);
INSERT INTO `item_mods` VALUES (17446, 12, 5);
INSERT INTO `item_mods` VALUES (17446, 13, 5);
INSERT INTO `item_mods` VALUES (17447, 5, 5);
INSERT INTO `item_mods` VALUES (17447, 12, 5);
INSERT INTO `item_mods` VALUES (17447, 13, 5);
INSERT INTO `item_mods` VALUES (17448, 23, 5);
INSERT INTO `item_mods` VALUES (17449, 23, 5);
INSERT INTO `item_mods` VALUES (17450, 112, 7);
INSERT INTO `item_mods` VALUES (17452, 25, 2);
INSERT INTO `item_mods` VALUES (17453, 25, 3);
INSERT INTO `item_mods` VALUES (17454, 7, 30);
INSERT INTO `item_mods` VALUES (17454, 374, 5);
INSERT INTO `item_mods` VALUES (17455, 12, 7);
INSERT INTO `item_mods` VALUES (17455, 13, 7);
INSERT INTO `item_mods` VALUES (17455, 14, 7);
INSERT INTO `item_mods` VALUES (17455, 60, 15);
INSERT INTO `item_mods` VALUES (17455, 111, 3);

-- -------------------------------------------------------
-- Trials Weapon
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17456, 2, 10);
INSERT INTO `item_mods` VALUES (17456, 5, 10);
INSERT INTO `item_mods` VALUES (17456, 57, 10);
INSERT INTO `item_mods` VALUES (17456, 59, 10);

INSERT INTO `item_mods` VALUES (17457, 2, 30);
INSERT INTO `item_mods` VALUES (17457, 23, 6);
INSERT INTO `item_mods` VALUES (17458, 2, 30);
INSERT INTO `item_mods` VALUES (17458, 25, 6);
INSERT INTO `item_mods` VALUES (17459, 2, 25);
INSERT INTO `item_mods` VALUES (17459, 9, 3);
INSERT INTO `item_mods` VALUES (17459, 10, 3);
INSERT INTO `item_mods` VALUES (17460, 5, 11);
INSERT INTO `item_mods` VALUES (17460, 9, 3);
INSERT INTO `item_mods` VALUES (17460, 10, 3);
INSERT INTO `item_mods` VALUES (17463, 13, 2);
INSERT INTO `item_mods` VALUES (17463, 111, 1);
INSERT INTO `item_mods` VALUES (17464, 8, 3);
INSERT INTO `item_mods` VALUES (17464, 13, 3);
INSERT INTO `item_mods` VALUES (17465, 12, 1);
INSERT INTO `item_mods` VALUES (17465, 13, 1);
INSERT INTO `item_mods` VALUES (17466, 374, 1);
INSERT INTO `item_mods` VALUES (17467, 345, 1000);
INSERT INTO `item_mods` VALUES (17468, 13, 2);
INSERT INTO `item_mods` VALUES (17469, 13, 4);
INSERT INTO `item_mods` VALUES (17470, 5, 10);
INSERT INTO `item_mods` VALUES (17470, 9, 2);
INSERT INTO `item_mods` VALUES (17470, 10, 2);
INSERT INTO `item_mods` VALUES (17472, 25, 3);
INSERT INTO `item_mods` VALUES (17472, 68, -10);
INSERT INTO `item_mods` VALUES (17472, 291, 5);
INSERT INTO `item_mods` VALUES (17473, 9, 2);
INSERT INTO `item_mods` VALUES (17473, 11, 2);
INSERT INTO `item_mods` VALUES (17473, 25, 5);
INSERT INTO `item_mods` VALUES (17478, 9, 2);
INSERT INTO `item_mods` VALUES (17478, 10, 2);
INSERT INTO `item_mods` VALUES (17478, 25, 3);
INSERT INTO `item_mods` VALUES (17479, 2, 17);
INSERT INTO `item_mods` VALUES (17479, 25, 4);
INSERT INTO `item_mods` VALUES (17480, 10, 3);
INSERT INTO `item_mods` VALUES (17480, 25, 3);
INSERT INTO `item_mods` VALUES (17481, 14, 3);
INSERT INTO `item_mods` VALUES (17481, 25, 3);
INSERT INTO `item_mods` VALUES (17485, 54, 6);

-- -------------------------------------------------------
-- Corrosive Claws
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17487, 431, 1); -- Additional Effect: Weakens defense

INSERT INTO `item_mods` VALUES (17491, 25, 2);
INSERT INTO `item_mods` VALUES (17492, 12, 3);
INSERT INTO `item_mods` VALUES (17492, 25, 8);
INSERT INTO `item_mods` VALUES (17493, 25, 10);
INSERT INTO `item_mods` VALUES (17494, 25, 12);
INSERT INTO `item_mods` VALUES (17495, 23, 2);
INSERT INTO `item_mods` VALUES (17495, 25, 3);
INSERT INTO `item_mods` VALUES (17495, 54, 2);
INSERT INTO `item_mods` VALUES (17496, 23, 3);
INSERT INTO `item_mods` VALUES (17496, 25, 3);
INSERT INTO `item_mods` VALUES (17496, 54, 2);
INSERT INTO `item_mods` VALUES (17497, 25, 1);
INSERT INTO `item_mods` VALUES (17498, 25, 2);
INSERT INTO `item_mods` VALUES (17499, 2, 2);
INSERT INTO `item_mods` VALUES (17499, 5, 2);
INSERT INTO `item_mods` VALUES (17499, 23, 3);
INSERT INTO `item_mods` VALUES (17499, 25, 2);
INSERT INTO `item_mods` VALUES (17500, 2, 3);
INSERT INTO `item_mods` VALUES (17500, 5, 3);
INSERT INTO `item_mods` VALUES (17500, 23, 3);
INSERT INTO `item_mods` VALUES (17500, 25, 2);
INSERT INTO `item_mods` VALUES (17501, 1, -10);
INSERT INTO `item_mods` VALUES (17501, 23, 10);
INSERT INTO `item_mods` VALUES (17502, 1, -10);
INSERT INTO `item_mods` VALUES (17502, 23, 10);
INSERT INTO `item_mods` VALUES (17503, 9, 1);
INSERT INTO `item_mods` VALUES (17503, 11, 1);
INSERT INTO `item_mods` VALUES (17503, 59, 9);
INSERT INTO `item_mods` VALUES (17504, 10, 3);
INSERT INTO `item_mods` VALUES (17504, 25, 2);
INSERT INTO `item_mods` VALUES (17504, 59, 11);
INSERT INTO `item_mods` VALUES (17505, 8, 1);
INSERT INTO `item_mods` VALUES (17505, 9, 1);
INSERT INTO `item_mods` VALUES (17505, 11, -1);
INSERT INTO `item_mods` VALUES (17505, 25, 3);
INSERT INTO `item_mods` VALUES (17506, 8, 2);
INSERT INTO `item_mods` VALUES (17506, 9, 2);
INSERT INTO `item_mods` VALUES (17506, 11, -1);
INSERT INTO `item_mods` VALUES (17506, 25, 4);

-- -------------------------------------------------------
-- Trials Weapon
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17507, 2, 20);
INSERT INTO `item_mods` VALUES (17507, 57, 10);
INSERT INTO `item_mods` VALUES (17507, 59, 10);

INSERT INTO `item_mods` VALUES (17508, 241, 2);
INSERT INTO `item_mods` VALUES (17509, 377, 13);

-- -------------------------------------------------------
-- Vampiric Claws
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17510, 431, 1); -- Additional Effect: HP Drain

INSERT INTO `item_mods` VALUES (17511, 302, 1);
INSERT INTO `item_mods` VALUES (17518, 10, 3);
INSERT INTO `item_mods` VALUES (17520, 2, 12);
INSERT INTO `item_mods` VALUES (17520, 5, 12);
INSERT INTO `item_mods` VALUES (17522, 8, -1);
INSERT INTO `item_mods` VALUES (17522, 9, -1);
INSERT INTO `item_mods` VALUES (17522, 10, -1);
INSERT INTO `item_mods` VALUES (17522, 11, -1);
INSERT INTO `item_mods` VALUES (17522, 12, -1);
INSERT INTO `item_mods` VALUES (17522, 13, 7);
INSERT INTO `item_mods` VALUES (17522, 14, -1);
INSERT INTO `item_mods` VALUES (17523, 23, 4);
INSERT INTO `item_mods` VALUES (17524, 23, 7);
INSERT INTO `item_mods` VALUES (17526, 61, 20);

-- -------------------------------------------------------
-- Trials Weapon
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17527, 2, 10);
INSERT INTO `item_mods` VALUES (17527, 5, 10);
INSERT INTO `item_mods` VALUES (17527, 54, 10);
INSERT INTO `item_mods` VALUES (17527, 60, 10);

INSERT INTO `item_mods` VALUES (17528, 2, 18);
INSERT INTO `item_mods` VALUES (17528, 5, 18);
INSERT INTO `item_mods` VALUES (17528, 346, 2);
INSERT INTO `item_mods` VALUES (17530, 2, 20);
INSERT INTO `item_mods` VALUES (17530, 5, 10);
INSERT INTO `item_mods` VALUES (17531, 9, 3);
INSERT INTO `item_mods` VALUES (17532, 5, 20);

-- -------------------------------------------------------
-- Whale Staff
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17533, 2, 14);
INSERT INTO `item_mods` VALUES (17533, 5, 7);
INSERT INTO `item_mods` VALUES (17533, 59, 7);
INSERT INTO `item_mods` VALUES (17533, 431, 1); -- Additional Effect: Water Damage

-- -------------------------------------------------------
-- Whale Staff +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17534, 2, 15);
INSERT INTO `item_mods` VALUES (17534, 5, 7);
INSERT INTO `item_mods` VALUES (17534, 59, 8);
INSERT INTO `item_mods` VALUES (17534, 431, 1); -- Additional Effect: Water Damage

INSERT INTO `item_mods` VALUES (17535, 23, 3);
INSERT INTO `item_mods` VALUES (17536, 23, 5);
INSERT INTO `item_mods` VALUES (17537, 2, 6);
INSERT INTO `item_mods` VALUES (17537, 5, 6);
INSERT INTO `item_mods` VALUES (17537, 23, 2);
INSERT INTO `item_mods` VALUES (17538, 2, 6);
INSERT INTO `item_mods` VALUES (17538, 5, 6);
INSERT INTO `item_mods` VALUES (17538, 23, 3);
INSERT INTO `item_mods` VALUES (17539, 23, 3);
INSERT INTO `item_mods` VALUES (17539, 25, 3);
INSERT INTO `item_mods` VALUES (17540, 23, 3);
INSERT INTO `item_mods` VALUES (17540, 25, 3);
INSERT INTO `item_mods` VALUES (17541, 2, 6);
INSERT INTO `item_mods` VALUES (17541, 5, 6);
INSERT INTO `item_mods` VALUES (17541, 25, 1);
INSERT INTO `item_mods` VALUES (17542, 2, 6);
INSERT INTO `item_mods` VALUES (17542, 5, 6);
INSERT INTO `item_mods` VALUES (17542, 25, 2);
INSERT INTO `item_mods` VALUES (17543, 23, 10);
INSERT INTO `item_mods` VALUES (17543, 25, 3);
INSERT INTO `item_mods` VALUES (17544, 23, 12);
INSERT INTO `item_mods` VALUES (17544, 25, 4);
INSERT INTO `item_mods` VALUES (17545, 8, 4);
INSERT INTO `item_mods` VALUES (17545, 23, 10);
INSERT INTO `item_mods` VALUES (17545, 24, 10);
INSERT INTO `item_mods` VALUES (17545, 55, 15);
INSERT INTO `item_mods` VALUES (17545, 347, 1);
INSERT INTO `item_mods` VALUES (17546, 8, 5);
INSERT INTO `item_mods` VALUES (17546, 23, 10);
INSERT INTO `item_mods` VALUES (17546, 24, 10);
INSERT INTO `item_mods` VALUES (17546, 55, 20);
INSERT INTO `item_mods` VALUES (17546, 347, 2);
INSERT INTO `item_mods` VALUES (17547, 12, 4);
INSERT INTO `item_mods` VALUES (17547, 56, 15);
INSERT INTO `item_mods` VALUES (17547, 115, 10);
INSERT INTO `item_mods` VALUES (17547, 350, 1);
INSERT INTO `item_mods` VALUES (17548, 12, 5);
INSERT INTO `item_mods` VALUES (17548, 56, 20);
INSERT INTO `item_mods` VALUES (17548, 115, 10);
INSERT INTO `item_mods` VALUES (17548, 350, 2);
INSERT INTO `item_mods` VALUES (17549, 11, 4);
INSERT INTO `item_mods` VALUES (17549, 57, 15);
INSERT INTO `item_mods` VALUES (17549, 68, 10);
INSERT INTO `item_mods` VALUES (17549, 352, 1);
INSERT INTO `item_mods` VALUES (17550, 11, 5);
INSERT INTO `item_mods` VALUES (17550, 57, 20);
INSERT INTO `item_mods` VALUES (17550, 68, 10);
INSERT INTO `item_mods` VALUES (17550, 352, 2);
INSERT INTO `item_mods` VALUES (17551, 10, 4);
INSERT INTO `item_mods` VALUES (17551, 58, 15);
INSERT INTO `item_mods` VALUES (17551, 161, -20);
INSERT INTO `item_mods` VALUES (17551, 348, 1);
INSERT INTO `item_mods` VALUES (17552, 10, 5);
INSERT INTO `item_mods` VALUES (17552, 58, 20);
INSERT INTO `item_mods` VALUES (17552, 161, -20);
INSERT INTO `item_mods` VALUES (17552, 348, 2);
INSERT INTO `item_mods` VALUES (17553, 9, 4);
INSERT INTO `item_mods` VALUES (17553, 59, 15);
INSERT INTO `item_mods` VALUES (17553, 165, 15);
INSERT INTO `item_mods` VALUES (17553, 351, 1);
INSERT INTO `item_mods` VALUES (17554, 9, 5);
INSERT INTO `item_mods` VALUES (17554, 59, 20);
INSERT INTO `item_mods` VALUES (17554, 165, 15);
INSERT INTO `item_mods` VALUES (17554, 351, 2);
INSERT INTO `item_mods` VALUES (17555, 13, 4);
INSERT INTO `item_mods` VALUES (17555, 54, 15);
INSERT INTO `item_mods` VALUES (17555, 111, 10);
INSERT INTO `item_mods` VALUES (17555, 349, 1);
INSERT INTO `item_mods` VALUES (17556, 13, 5);
INSERT INTO `item_mods` VALUES (17556, 54, 20);
INSERT INTO `item_mods` VALUES (17556, 111, 10);
INSERT INTO `item_mods` VALUES (17556, 349, 2);
INSERT INTO `item_mods` VALUES (17557, 8, 1);
INSERT INTO `item_mods` VALUES (17557, 9, 1);
INSERT INTO `item_mods` VALUES (17557, 10, 1);
INSERT INTO `item_mods` VALUES (17557, 11, 1);
INSERT INTO `item_mods` VALUES (17557, 12, 1);
INSERT INTO `item_mods` VALUES (17557, 13, 1);
INSERT INTO `item_mods` VALUES (17557, 14, 1);
INSERT INTO `item_mods` VALUES (17557, 61, 15);
INSERT INTO `item_mods` VALUES (17557, 353, 1);
INSERT INTO `item_mods` VALUES (17557, 374, 10);
INSERT INTO `item_mods` VALUES (17557, 391, 10);
INSERT INTO `item_mods` VALUES (17558, 8, 2);
INSERT INTO `item_mods` VALUES (17558, 9, 2);
INSERT INTO `item_mods` VALUES (17558, 10, 2);
INSERT INTO `item_mods` VALUES (17558, 11, 2);
INSERT INTO `item_mods` VALUES (17558, 12, 2);
INSERT INTO `item_mods` VALUES (17558, 13, 2);
INSERT INTO `item_mods` VALUES (17558, 14, 2);
INSERT INTO `item_mods` VALUES (17558, 61, 20);
INSERT INTO `item_mods` VALUES (17558, 353, 2);
INSERT INTO `item_mods` VALUES (17558, 374, 10);
INSERT INTO `item_mods` VALUES (17558, 391, 15);
INSERT INTO `item_mods` VALUES (17559, 8, 1);
INSERT INTO `item_mods` VALUES (17559, 9, 1);
INSERT INTO `item_mods` VALUES (17559, 10, 1);
INSERT INTO `item_mods` VALUES (17559, 11, 1);
INSERT INTO `item_mods` VALUES (17559, 12, 1);
INSERT INTO `item_mods` VALUES (17559, 13, 1);
INSERT INTO `item_mods` VALUES (17559, 14, 1);
INSERT INTO `item_mods` VALUES (17559, 60, 15);
INSERT INTO `item_mods` VALUES (17559, 71, 10);
INSERT INTO `item_mods` VALUES (17559, 354, 1);
INSERT INTO `item_mods` VALUES (17560, 8, 2);
INSERT INTO `item_mods` VALUES (17560, 9, 2);
INSERT INTO `item_mods` VALUES (17560, 10, 2);
INSERT INTO `item_mods` VALUES (17560, 11, 2);
INSERT INTO `item_mods` VALUES (17560, 12, 2);
INSERT INTO `item_mods` VALUES (17560, 13, 2);
INSERT INTO `item_mods` VALUES (17560, 14, 2);
INSERT INTO `item_mods` VALUES (17560, 60, 20);
INSERT INTO `item_mods` VALUES (17560, 71, 10);
INSERT INTO `item_mods` VALUES (17560, 354, 2);
INSERT INTO `item_mods` VALUES (17561, 2, 9);
INSERT INTO `item_mods` VALUES (17561, 5, 9);
INSERT INTO `item_mods` VALUES (17562, 2, 10);
INSERT INTO `item_mods` VALUES (17562, 5, 10);
INSERT INTO `item_mods` VALUES (17563, 2, 13);
INSERT INTO `item_mods` VALUES (17563, 5, 13);
INSERT INTO `item_mods` VALUES (17563, 8, 7);
INSERT INTO `item_mods` VALUES (17564, 2, 13);
INSERT INTO `item_mods` VALUES (17564, 55, 20);
INSERT INTO `item_mods` VALUES (17565, 2, 1);
INSERT INTO `item_mods` VALUES (17565, 5, 1);
INSERT INTO `item_mods` VALUES (17566, 2, 5);
INSERT INTO `item_mods` VALUES (17566, 5, 5);
INSERT INTO `item_mods` VALUES (17567, 2, 20);
INSERT INTO `item_mods` VALUES (17567, 5, 20);
INSERT INTO `item_mods` VALUES (17567, 12, 10);
INSERT INTO `item_mods` VALUES (17567, 13, 10);
INSERT INTO `item_mods` VALUES (17567, 54, 15);
INSERT INTO `item_mods` VALUES (17567, 55, 15);
INSERT INTO `item_mods` VALUES (17567, 56, 15);
INSERT INTO `item_mods` VALUES (17567, 57, 15);
INSERT INTO `item_mods` VALUES (17567, 58, 15);
INSERT INTO `item_mods` VALUES (17567, 59, 15);
INSERT INTO `item_mods` VALUES (17567, 60, 15);
INSERT INTO `item_mods` VALUES (17567, 61, 15);
INSERT INTO `item_mods` VALUES (17568, 23, 9);
INSERT INTO `item_mods` VALUES (17568, 25, 5);
INSERT INTO `item_mods` VALUES (17569, 9, 2);
INSERT INTO `item_mods` VALUES (17569, 72, 3);
INSERT INTO `item_mods` VALUES (17570, 9, 3);
INSERT INTO `item_mods` VALUES (17570, 72, 4);
INSERT INTO `item_mods` VALUES (17572, 5, 22);
INSERT INTO `item_mods` VALUES (17572, 116, 3);
INSERT INTO `item_mods` VALUES (17573, 5, 63);
INSERT INTO `item_mods` VALUES (17573, 357, -3);
INSERT INTO `item_mods` VALUES (17574, 12, 4);
INSERT INTO `item_mods` VALUES (17574, 13, 4);
INSERT INTO `item_mods` VALUES (17575, 8, 6);
INSERT INTO `item_mods` VALUES (17575, 13, 5);
INSERT INTO `item_mods` VALUES (17575, 14, -1);
INSERT INTO `item_mods` VALUES (17576, 8, 5);
INSERT INTO `item_mods` VALUES (17576, 13, 6);
INSERT INTO `item_mods` VALUES (17577, 384, 51);
INSERT INTO `item_mods` VALUES (17578, 5, 24);
INSERT INTO `item_mods` VALUES (17578, 71, 2);
INSERT INTO `item_mods` VALUES (17580, 12, 1);
INSERT INTO `item_mods` VALUES (17582, 12, -4);
INSERT INTO `item_mods` VALUES (17582, 13, 4);
INSERT INTO `item_mods` VALUES (17582, 54, 6);
INSERT INTO `item_mods` VALUES (17582, 55, 6);
INSERT INTO `item_mods` VALUES (17582, 56, 6);
INSERT INTO `item_mods` VALUES (17582, 57, 6);
INSERT INTO `item_mods` VALUES (17582, 58, 6);
INSERT INTO `item_mods` VALUES (17582, 59, 6);
INSERT INTO `item_mods` VALUES (17582, 60, 6);
INSERT INTO `item_mods` VALUES (17582, 61, 6);
INSERT INTO `item_mods` VALUES (17582, 112, 10);
INSERT INTO `item_mods` VALUES (17586, 5, 30);
INSERT INTO `item_mods` VALUES (17587, 2, 1);
INSERT INTO `item_mods` VALUES (17587, 5, 1);
INSERT INTO `item_mods` VALUES (17588, 2, 5);
INSERT INTO `item_mods` VALUES (17588, 5, 5);
INSERT INTO `item_mods` VALUES (17590, 165, 5);
INSERT INTO `item_mods` VALUES (17591, 165, 7);
INSERT INTO `item_mods` VALUES (17592, 165, 5);
INSERT INTO `item_mods` VALUES (17593, 345, 1000);
INSERT INTO `item_mods` VALUES (17594, 72, 4);
INSERT INTO `item_mods` VALUES (17595, 11, 7);
INSERT INTO `item_mods` VALUES (17596, 9, 2);
INSERT INTO `item_mods` VALUES (17596, 72, 3);
INSERT INTO `item_mods` VALUES (17597, 5, 20);
INSERT INTO `item_mods` VALUES (17597, 346, 1);
INSERT INTO `item_mods` VALUES (17598, 5, 30);
INSERT INTO `item_mods` VALUES (17598, 117, 5);
INSERT INTO `item_mods` VALUES (17598, 346, 3);

-- -------------------------------------------------------
-- Acid Dagger
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17605, 431, 1); -- Additional Effect: Weakens Defense

-- -------------------------------------------------------
-- Corrosive Dagger
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17606, 431, 1); -- Additional Effect: Weakens Defense

-- -------------------------------------------------------
-- Corrosive Baselard
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17607, 431, 1); -- Additional Effect: Weakens defense

-- -------------------------------------------------------
-- Corrosive Knife
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17608, 431, 1); -- Additional Effect: Weakens Defense

INSERT INTO `item_mods` VALUES (17610, 23, 3);
INSERT INTO `item_mods` VALUES (17610, 25, 3);
INSERT INTO `item_mods` VALUES (17610, 60, -5);
INSERT INTO `item_mods` VALUES (17611, 23, 5);
INSERT INTO `item_mods` VALUES (17611, 25, 5);
INSERT INTO `item_mods` VALUES (17611, 60, -5);
INSERT INTO `item_mods` VALUES (17612, 11, 1);
INSERT INTO `item_mods` VALUES (17613, 11, 2);

-- -------------------------------------------------------
-- Trials Weapon
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17616, 2, 20);
INSERT INTO `item_mods` VALUES (17616, 55, 10);
INSERT INTO `item_mods` VALUES (17616, 57, 10);

INSERT INTO `item_mods` VALUES (17618, 165, 5);
INSERT INTO `item_mods` VALUES (17620, 5, 11);
INSERT INTO `item_mods` VALUES (17620, 9, 3);
INSERT INTO `item_mods` VALUES (17620, 10, 3);
INSERT INTO `item_mods` VALUES (17620, 13, 3);
INSERT INTO `item_mods` VALUES (17621, 2, 11);
INSERT INTO `item_mods` VALUES (17621, 9, 3);
INSERT INTO `item_mods` VALUES (17621, 10, 3);
INSERT INTO `item_mods` VALUES (17621, 59, 9);
INSERT INTO `item_mods` VALUES (17622, 59, 7);
INSERT INTO `item_mods` VALUES (17623, 11, 2);
INSERT INTO `item_mods` VALUES (17623, 59, 8);
INSERT INTO `item_mods` VALUES (17623, 298, 2);
INSERT INTO `item_mods` VALUES (17625, 2, 10);
INSERT INTO `item_mods` VALUES (17625, 9, 2);
INSERT INTO `item_mods` VALUES (17625, 10, 2);
INSERT INTO `item_mods` VALUES (17625, 59, 8);

-- -------------------------------------------------------
-- Item: Garuda's dagger
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17627, 11, 3);
INSERT INTO `item_mods` VALUES (17627, 23, 7);
INSERT INTO `item_mods` VALUES (17627, 431, 1); -- Additional Effect: Silence

INSERT INTO `item_mods` VALUES (17628, 2, 25);
INSERT INTO `item_mods` VALUES (17628, 23, 8);
INSERT INTO `item_mods` VALUES (17629, 2, 30);
INSERT INTO `item_mods` VALUES (17629, 23, 10);
INSERT INTO `item_mods` VALUES (17630, 11, 2);
INSERT INTO `item_mods` VALUES (17630, 14, 2);
INSERT INTO `item_mods` VALUES (17630, 26, 11);
INSERT INTO `item_mods` VALUES (17631, 11, 3);
INSERT INTO `item_mods` VALUES (17631, 14, 3);
INSERT INTO `item_mods` VALUES (17631, 26, 12);
INSERT INTO `item_mods` VALUES (17633, 110, 6);
INSERT INTO `item_mods` VALUES (17636, 8, 3);
INSERT INTO `item_mods` VALUES (17636, 10, 3);
INSERT INTO `item_mods` VALUES (17636, 11, 3);
INSERT INTO `item_mods` VALUES (17637, 8, 3);
INSERT INTO `item_mods` VALUES (17637, 10, 3);
INSERT INTO `item_mods` VALUES (17637, 11, 3);
INSERT INTO `item_mods` VALUES (17640, 9, 2);
INSERT INTO `item_mods` VALUES (17643, 10, 2);
INSERT INTO `item_mods` VALUES (17643, 13, 2);
INSERT INTO `item_mods` VALUES (17645, 10, 3);
INSERT INTO `item_mods` VALUES (17645, 13, 3);
INSERT INTO `item_mods` VALUES (17645, 23, 7);
INSERT INTO `item_mods` VALUES (17647, 25, 3);
INSERT INTO `item_mods` VALUES (17647, 110, 5);
INSERT INTO `item_mods` VALUES (17648, 13, 1);

-- -------------------------------------------------------
-- Nadrs
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17650, 59, 3);
INSERT INTO `item_mods` VALUES (17650, 431, 1); -- Additional Effect: Poison

INSERT INTO `item_mods` VALUES (17652, 61, 14);
INSERT INTO `item_mods` VALUES (17653, 54, 15);
INSERT INTO `item_mods` VALUES (17653, 59, -15);
INSERT INTO `item_mods` VALUES (17653, 162, -10);
INSERT INTO `item_mods` VALUES (17653, 233, 2);

-- -------------------------------------------------------
-- Trials Weapon
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17654, 2, 20);
INSERT INTO `item_mods` VALUES (17654, 54, 10);
INSERT INTO `item_mods` VALUES (17654, 56, 10);

INSERT INTO `item_mods` VALUES (17655, 241, 2);
INSERT INTO `item_mods` VALUES (17656, 5, 20);
INSERT INTO `item_mods` VALUES (17656, 110, 8);
INSERT INTO `item_mods` VALUES (17657, 2, 11);
INSERT INTO `item_mods` VALUES (17657, 9, 3);
INSERT INTO `item_mods` VALUES (17657, 10, 3);
INSERT INTO `item_mods` VALUES (17658, 1, 14);
INSERT INTO `item_mods` VALUES (17658, 2, 30);
INSERT INTO `item_mods` VALUES (17658, 23, -10);
INSERT INTO `item_mods` VALUES (17659, 59, 10);
INSERT INTO `item_mods` VALUES (17659, 68, 5);
INSERT INTO `item_mods` VALUES (17659, 229, 2);
INSERT INTO `item_mods` VALUES (17660, 5, 15);
INSERT INTO `item_mods` VALUES (17663, 5, 20);
INSERT INTO `item_mods` VALUES (17665, 8, 3);
INSERT INTO `item_mods` VALUES (17665, 23, 10);
INSERT INTO `item_mods` VALUES (17672, 23, 4);
INSERT INTO `item_mods` VALUES (17672, 25, 3);
INSERT INTO `item_mods` VALUES (17673, 23, 4);
INSERT INTO `item_mods` VALUES (17673, 25, 3);
INSERT INTO `item_mods` VALUES (17674, 23, 5);
INSERT INTO `item_mods` VALUES (17674, 25, 3);
INSERT INTO `item_mods` VALUES (17675, 23, 5);
INSERT INTO `item_mods` VALUES (17675, 25, 3);
INSERT INTO `item_mods` VALUES (17676, 23, 12);
INSERT INTO `item_mods` VALUES (17677, 23, 12);
INSERT INTO `item_mods` VALUES (17678, 2, 4);
INSERT INTO `item_mods` VALUES (17679, 2, 6);

-- -------------------------------------------------------
-- Sacred Sword
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17682, 431, 1); -- Additional Effect: Light Damage

INSERT INTO `item_mods` VALUES (17690, 110, 5);
INSERT INTO `item_mods` VALUES (17691, 110, 6);
INSERT INTO `item_mods` VALUES (17693, 27, 1);
INSERT INTO `item_mods` VALUES (17694, 8, 1);
INSERT INTO `item_mods` VALUES (17694, 13, 6);
INSERT INTO `item_mods` VALUES (17695, 8, 3);

-- -------------------------------------------------------
-- Bayard's Sword
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17695, 13, 3);
INSERT INTO `item_mods` VALUES (17695, 431, 1); -- Additional Effect: Light Damage

INSERT INTO `item_mods` VALUES (17696, 9, 1);
INSERT INTO `item_mods` VALUES (17697, 9, 2);
INSERT INTO `item_mods` VALUES (17698, 8, 4);
INSERT INTO `item_mods` VALUES (17698, 10, -6);
INSERT INTO `item_mods` VALUES (17698, 14, -6);
INSERT INTO `item_mods` VALUES (17698, 27, -6);
INSERT INTO `item_mods` VALUES (17699, 377, 13);
INSERT INTO `item_mods` VALUES (17700, 10, 7);
INSERT INTO `item_mods` VALUES (17700, 27, 1);
INSERT INTO `item_mods` VALUES (17701, 25, 2);
INSERT INTO `item_mods` VALUES (17701, 109, -5);
INSERT INTO `item_mods` VALUES (17702, 25, 3);
INSERT INTO `item_mods` VALUES (17702, 109, -3);
INSERT INTO `item_mods` VALUES (17703, 2, 10);
INSERT INTO `item_mods` VALUES (17703, 9, 2);
INSERT INTO `item_mods` VALUES (17703, 10, 2);

-- -------------------------------------------------------
-- Vulcan Sword
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17704, 431, 1); -- Additional Effect: Fire Damage

INSERT INTO `item_mods` VALUES (17707, 345, 1000);
INSERT INTO `item_mods` VALUES (17708, 25, 2);
INSERT INTO `item_mods` VALUES (17709, 11, -4);
INSERT INTO `item_mods` VALUES (17709, 14, 4);
INSERT INTO `item_mods` VALUES (17709, 25, 4);
INSERT INTO `item_mods` VALUES (17710, 8, 7);
INSERT INTO `item_mods` VALUES (17711, 12, 4);
INSERT INTO `item_mods` VALUES (17711, 25, 8);
INSERT INTO `item_mods` VALUES (17711, 109, -5);
INSERT INTO `item_mods` VALUES (17712, 2, 11);
INSERT INTO `item_mods` VALUES (17712, 9, 3);
INSERT INTO `item_mods` VALUES (17712, 10, 3);
INSERT INTO `item_mods` VALUES (17713, 23, 9);
INSERT INTO `item_mods` VALUES (17713, 25, -3);
INSERT INTO `item_mods` VALUES (17714, 23, 11);
INSERT INTO `item_mods` VALUES (17714, 25, -4);
INSERT INTO `item_mods` VALUES (17714, 27, 4);
INSERT INTO `item_mods` VALUES (17716, 25, -8);
INSERT INTO `item_mods` VALUES (17717, 5, 10);
INSERT INTO `item_mods` VALUES (17717, 8, 1);
INSERT INTO `item_mods` VALUES (17717, 12, 1);
INSERT INTO `item_mods` VALUES (17718, 5, 12);
INSERT INTO `item_mods` VALUES (17721, 2, 20);
INSERT INTO `item_mods` VALUES (17721, 5, 20);
INSERT INTO `item_mods` VALUES (17721, 10, 4);
INSERT INTO `item_mods` VALUES (17722, 24, 5);
INSERT INTO `item_mods` VALUES (17722, 26, 5);
INSERT INTO `item_mods` VALUES (17722, 110, 5);
INSERT INTO `item_mods` VALUES (17723, 5, 20);
INSERT INTO `item_mods` VALUES (17724, 5, 15);
INSERT INTO `item_mods` VALUES (17725, 5, 20);
INSERT INTO `item_mods` VALUES (17726, 2, 10);
INSERT INTO `item_mods` VALUES (17726, 5, 10);
INSERT INTO `item_mods` VALUES (17726, 25, 5);
INSERT INTO `item_mods` VALUES (17727, 5, 15);
INSERT INTO `item_mods` VALUES (17727, 9, 2);
INSERT INTO `item_mods` VALUES (17727, 10, 2);
INSERT INTO `item_mods` VALUES (17728, 5, 20);
INSERT INTO `item_mods` VALUES (17728, 9, 3);
INSERT INTO `item_mods` VALUES (17728, 10, 3);
INSERT INTO `item_mods` VALUES (17729, 5, 15);
INSERT INTO `item_mods` VALUES (17729, 224, 2);
INSERT INTO `item_mods` VALUES (17730, 5, 20);
INSERT INTO `item_mods` VALUES (17730, 224, 2);
INSERT INTO `item_mods` VALUES (17731, 5, 15);
INSERT INTO `item_mods` VALUES (17731, 228, 2);
INSERT INTO `item_mods` VALUES (17732, 5, 20);
INSERT INTO `item_mods` VALUES (17732, 228, 2);
INSERT INTO `item_mods` VALUES (17733, 5, 15);
INSERT INTO `item_mods` VALUES (17733, 9, 2);
INSERT INTO `item_mods` VALUES (17733, 10, 2);
INSERT INTO `item_mods` VALUES (17733, 233, 2);
INSERT INTO `item_mods` VALUES (17734, 5, 20);
INSERT INTO `item_mods` VALUES (17734, 9, 3);
INSERT INTO `item_mods` VALUES (17734, 10, 3);
INSERT INTO `item_mods` VALUES (17734, 233, 2);
INSERT INTO `item_mods` VALUES (17735, 5, 15);
INSERT INTO `item_mods` VALUES (17735, 9, 2);
INSERT INTO `item_mods` VALUES (17735, 10, 2);
INSERT INTO `item_mods` VALUES (17735, 234, 2);
INSERT INTO `item_mods` VALUES (17736, 5, 20);
INSERT INTO `item_mods` VALUES (17736, 9, 3);
INSERT INTO `item_mods` VALUES (17736, 10, 3);
INSERT INTO `item_mods` VALUES (17736, 234, 2);
INSERT INTO `item_mods` VALUES (17738, 25, 7);
INSERT INTO `item_mods` VALUES (17738, 111, 8);
INSERT INTO `item_mods` VALUES (17738, 161, -7);
INSERT INTO `item_mods` VALUES (17739, 5, 10);
INSERT INTO `item_mods` VALUES (17740, 5, 15);
INSERT INTO `item_mods` VALUES (17745, 3, 3);
INSERT INTO `item_mods` VALUES (17745, 13, 5);
INSERT INTO `item_mods` VALUES (17745, 14, 5);
INSERT INTO `item_mods` VALUES (17746, 5, 14);
INSERT INTO `item_mods` VALUES (17747, 5, 16);

-- -------------------------------------------------------
-- Anthos Xiphos
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17750, 8, 1);
INSERT INTO `item_mods` VALUES (17750, 431, 1); -- Additional Effect: Water Damage

INSERT INTO `item_mods` VALUES (17751, 5, 20);
INSERT INTO `item_mods` VALUES (17751, 25, 4);
INSERT INTO `item_mods` VALUES (17751, 30, 2);
INSERT INTO `item_mods` VALUES (17753, 2, -55);
INSERT INTO `item_mods` VALUES (17753, 8, 3);
INSERT INTO `item_mods` VALUES (17753, 23, 10);
INSERT INTO `item_mods` VALUES (17753, 165, 3);
INSERT INTO `item_mods` VALUES (17754, 56, 10);
INSERT INTO `item_mods` VALUES (17754, 57, -10);
INSERT INTO `item_mods` VALUES (17755, 5, 20);
INSERT INTO `item_mods` VALUES (17755, 9, 3);
INSERT INTO `item_mods` VALUES (17755, 10, 3);
INSERT INTO `item_mods` VALUES (17755, 230, 2);
INSERT INTO `item_mods` VALUES (17756, 109, 5);
INSERT INTO `item_mods` VALUES (17757, 28, 2);
INSERT INTO `item_mods` VALUES (17758, 240, 2);
INSERT INTO `item_mods` VALUES (17758, 244, 2);
INSERT INTO `item_mods` VALUES (17758, 247, 2);
INSERT INTO `item_mods` VALUES (17758, 249, 2);
INSERT INTO `item_mods` VALUES (17759, 8, 4);
INSERT INTO `item_mods` VALUES (17759, 9, 4);
INSERT INTO `item_mods` VALUES (17759, 224, 2);
INSERT INTO `item_mods` VALUES (17760, 11, 2);
INSERT INTO `item_mods` VALUES (17760, 68, 2);

-- -------------------------------------------------------
-- Erlking's Sword
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17762, 366, 4); -- Main hand: DMG:38

-- -------------------------------------------------------
-- Erlking's Blade
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17763, 366, 6); -- Main hand: DMG:39

-- -------------------------------------------------------
-- Yoto +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17768, 431, 1); -- Additional Effect: Weakens defense

INSERT INTO `item_mods` VALUES (17771, 8, -1);
INSERT INTO `item_mods` VALUES (17771, 9, 2);
INSERT INTO `item_mods` VALUES (17772, 8, 2);
INSERT INTO `item_mods` VALUES (17772, 9, -1);

-- -------------------------------------------------------
-- Trials Weapon
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17773, 2, 20);
INSERT INTO `item_mods` VALUES (17773, 54, 10);
INSERT INTO `item_mods` VALUES (17773, 60, 10);

-- -------------------------------------------------------
-- Shiranui
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17774, 68, 3);
INSERT INTO `item_mods` VALUES (17774, 431, 1);

INSERT INTO `item_mods` VALUES (17775, 8, 1);
INSERT INTO `item_mods` VALUES (17775, 11, 1);
INSERT INTO `item_mods` VALUES (17787, 8, 1);
INSERT INTO `item_mods` VALUES (17787, 9, 1);
INSERT INTO `item_mods` VALUES (17788, 8, 3);
INSERT INTO `item_mods` VALUES (17789, 8, 3);
INSERT INTO `item_mods` VALUES (17789, 9, 3);
INSERT INTO `item_mods` VALUES (17789, 10, -1);
INSERT INTO `item_mods` VALUES (17789, 289, 1);
INSERT INTO `item_mods` VALUES (17790, 8, 2);
INSERT INTO `item_mods` VALUES (17790, 9, 4);
INSERT INTO `item_mods` VALUES (17790, 11, -1);
INSERT INTO `item_mods` VALUES (17790, 289, 1);
INSERT INTO `item_mods` VALUES (17791, 165, 5);
INSERT INTO `item_mods` VALUES (17792, 168, 25);
INSERT INTO `item_mods` VALUES (17793, 377, 13);
INSERT INTO `item_mods` VALUES (17794, 288, 1);
INSERT INTO `item_mods` VALUES (17795, 110, 3);
INSERT INTO `item_mods` VALUES (17796, 110, 5);

-- -------------------------------------------------------
-- Item: Seito
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17797, 431, 1); -- Additional Effect: Silence

INSERT INTO `item_mods` VALUES (17798, 345, 1000);
INSERT INTO `item_mods` VALUES (17799, 27, 2);
INSERT INTO `item_mods` VALUES (17804, 2, 15);
INSERT INTO `item_mods` VALUES (17804, 8, 2);
INSERT INTO `item_mods` VALUES (17804, 27, 2);
INSERT INTO `item_mods` VALUES (17805, 14, 3);
INSERT INTO `item_mods` VALUES (17807, 23, 4);
INSERT INTO `item_mods` VALUES (17807, 25, 4);
INSERT INTO `item_mods` VALUES (17810, 9, 8);
INSERT INTO `item_mods` VALUES (17810, 73, 8);
INSERT INTO `item_mods` VALUES (17811, 8, 1);
INSERT INTO `item_mods` VALUES (17811, 9, 1);
INSERT INTO `item_mods` VALUES (17812, 8, 1);
INSERT INTO `item_mods` VALUES (17812, 11, 1);
INSERT INTO `item_mods` VALUES (17814, 25, 3);
INSERT INTO `item_mods` VALUES (17814, 169, -12);

-- -------------------------------------------------------
-- Trials Weapon
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17815, 2, 20);
INSERT INTO `item_mods` VALUES (17815, 55, 10);
INSERT INTO `item_mods` VALUES (17815, 61, 10);

INSERT INTO `item_mods` VALUES (17821, 10, 2);
INSERT INTO `item_mods` VALUES (17822, 9, 4);
INSERT INTO `item_mods` VALUES (17823, 8, 5);
INSERT INTO `item_mods` VALUES (17823, 11, 1);
INSERT INTO `item_mods` VALUES (17823, 12, -1);
INSERT INTO `item_mods` VALUES (17824, 8, 2);
INSERT INTO `item_mods` VALUES (17826, 14, 2);

-- -------------------------------------------------------
-- Koen
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17828, 431, 1); -- Additional Effect: Fire Damage

INSERT INTO `item_mods` VALUES (17829, 345, 1000);
INSERT INTO `item_mods` VALUES (17832, 2, 20);
INSERT INTO `item_mods` VALUES (17832, 436, 3);
INSERT INTO `item_mods` VALUES (17833, 435, 2);
INSERT INTO `item_mods` VALUES (17834, 61, 20);
INSERT INTO `item_mods` VALUES (17834, 441, 2);
INSERT INTO `item_mods` VALUES (17835, 2, 3);
INSERT INTO `item_mods` VALUES (17835, 5, 3);
INSERT INTO `item_mods` VALUES (17835, 14, 3);
INSERT INTO `item_mods` VALUES (17835, 443, 1);
INSERT INTO `item_mods` VALUES (17836, 2, 4);
INSERT INTO `item_mods` VALUES (17836, 5, 4);
INSERT INTO `item_mods` VALUES (17836, 14, 3);
INSERT INTO `item_mods` VALUES (17836, 443, 1);
INSERT INTO `item_mods` VALUES (17837, 14, 3);
INSERT INTO `item_mods` VALUES (17837, 60, 6);
INSERT INTO `item_mods` VALUES (17837, 450, 2);
INSERT INTO `item_mods` VALUES (17838, 446, 2);
INSERT INTO `item_mods` VALUES (17839, 444, 2);
INSERT INTO `item_mods` VALUES (17840, 384, 20);
INSERT INTO `item_mods` VALUES (17840, 449, 2);
INSERT INTO `item_mods` VALUES (17841, 440, 2);
INSERT INTO `item_mods` VALUES (17842, 437, 3);
INSERT INTO `item_mods` VALUES (17843, 23, 3);
INSERT INTO `item_mods` VALUES (17843, 25, 3);
INSERT INTO `item_mods` VALUES (17844, 2, 5);
INSERT INTO `item_mods` VALUES (17844, 436, 1);
INSERT INTO `item_mods` VALUES (17845, 5, 10);
INSERT INTO `item_mods` VALUES (17845, 438, 2);
INSERT INTO `item_mods` VALUES (17846, 11, 1);
INSERT INTO `item_mods` VALUES (17846, 434, 2);
INSERT INTO `item_mods` VALUES (17847, 12, 1);
INSERT INTO `item_mods` VALUES (17847, 445, 2);
INSERT INTO `item_mods` VALUES (17848, 25, 1);
INSERT INTO `item_mods` VALUES (17848, 435, 2);
INSERT INTO `item_mods` VALUES (17849, 23, 3);
INSERT INTO `item_mods` VALUES (17849, 68, 3);
INSERT INTO `item_mods` VALUES (17849, 439, 1);
INSERT INTO `item_mods` VALUES (17850, 23, 4);
INSERT INTO `item_mods` VALUES (17850, 68, 4);
INSERT INTO `item_mods` VALUES (17850, 439, 2);
INSERT INTO `item_mods` VALUES (17852, 436, 4);
INSERT INTO `item_mods` VALUES (17853, 14, 4);
INSERT INTO `item_mods` VALUES (17853, 443, 2);
INSERT INTO `item_mods` VALUES (17854, 14, 1);
INSERT INTO `item_mods` VALUES (17854, 440, 2);
INSERT INTO `item_mods` VALUES (17855, 444, 2);
INSERT INTO `item_mods` VALUES (17856, 433, 3);
INSERT INTO `item_mods` VALUES (17856, 447, 3);
INSERT INTO `item_mods` VALUES (17925, 24, 7);
INSERT INTO `item_mods` VALUES (17925, 26, 7);
INSERT INTO `item_mods` VALUES (17926, 8, 2);
INSERT INTO `item_mods` VALUES (17926, 9, 1);
INSERT INTO `item_mods` VALUES (17926, 10, -3);
INSERT INTO `item_mods` VALUES (17926, 11, -2);
INSERT INTO `item_mods` VALUES (17927, 14, 5);
INSERT INTO `item_mods` VALUES (17928, 2, 18);
INSERT INTO `item_mods` VALUES (17928, 8, 3);
INSERT INTO `item_mods` VALUES (17928, 11, -3);
INSERT INTO `item_mods` VALUES (17928, 23, 30);
INSERT INTO `item_mods` VALUES (17929, 25, 1);
INSERT INTO `item_mods` VALUES (17930, 25, 2);
INSERT INTO `item_mods` VALUES (17931, 23, 5);
INSERT INTO `item_mods` VALUES (17932, 23, 5);

-- -------------------------------------------------------
-- Trials Weapon
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17933, 2, 20);
INSERT INTO `item_mods` VALUES (17933, 56, 10);
INSERT INTO `item_mods` VALUES (17933, 58, 10);

INSERT INTO `item_mods` VALUES (17934, 248, 2);
INSERT INTO `item_mods` VALUES (17935, 2, 11);
INSERT INTO `item_mods` VALUES (17935, 9, 3);
INSERT INTO `item_mods` VALUES (17935, 10, 3);
INSERT INTO `item_mods` VALUES (17936, 360, 1);
INSERT INTO `item_mods` VALUES (17937, 8, 3);
INSERT INTO `item_mods` VALUES (17937, 13, -1);
INSERT INTO `item_mods` VALUES (17937, 14, 3);
INSERT INTO `item_mods` VALUES (17938, 8, 4);
INSERT INTO `item_mods` VALUES (17938, 168, 5);
INSERT INTO `item_mods` VALUES (17939, 11, 5);
INSERT INTO `item_mods` VALUES (17939, 24, 8);
INSERT INTO `item_mods` VALUES (17939, 26, 4);
INSERT INTO `item_mods` VALUES (17940, 25, 1);
INSERT INTO `item_mods` VALUES (17941, 10, 1);
INSERT INTO `item_mods` VALUES (17941, 14, 1);
INSERT INTO `item_mods` VALUES (17944, 377, 13);
INSERT INTO `item_mods` VALUES (17945, 345, 1000);
INSERT INTO `item_mods` VALUES (17948, 14, 7);
INSERT INTO `item_mods` VALUES (17949, 2, 10);
INSERT INTO `item_mods` VALUES (17949, 9, 2);
INSERT INTO `item_mods` VALUES (17949, 10, 2);
INSERT INTO `item_mods` VALUES (17949, 54, 8);
INSERT INTO `item_mods` VALUES (17953, 364, 10);
INSERT INTO `item_mods` VALUES (17958, 23, 10);
INSERT INTO `item_mods` VALUES (17958, 248, 2);
INSERT INTO `item_mods` VALUES (17959, 2, 16);
INSERT INTO `item_mods` VALUES (17959, 236, 2);
INSERT INTO `item_mods` VALUES (17960, 8, 2);
INSERT INTO `item_mods` VALUES (17960, 11, 2);
INSERT INTO `item_mods` VALUES (17960, 23, 7);
INSERT INTO `item_mods` VALUES (17960, 24, 7);
INSERT INTO `item_mods` VALUES (17962, 68, 5);
INSERT INTO `item_mods` VALUES (17963, 12, -1);
INSERT INTO `item_mods` VALUES (17963, 13, -1);
INSERT INTO `item_mods` VALUES (17963, 14, -1);
INSERT INTO `item_mods` VALUES (17963, 73, 1);
INSERT INTO `item_mods` VALUES (17964, 48, 5);
INSERT INTO `item_mods` VALUES (17964, 229, 2);
INSERT INTO `item_mods` VALUES (17965, 55, 5);
INSERT INTO `item_mods` VALUES (17965, 56, 5);

-- -------------------------------------------------------
-- Erlking's Tabar
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (17966, 366, 4); -- Main hand: DMG:45

INSERT INTO `item_mods` VALUES (17967, 26, 4);
INSERT INTO `item_mods` VALUES (17968, 24, 3);
INSERT INTO `item_mods` VALUES (17971, 24, 3);
INSERT INTO `item_mods` VALUES (17971, 26, 3);
INSERT INTO `item_mods` VALUES (17971, 27, -5);
INSERT INTO `item_mods` VALUES (17972, 25, 3);
INSERT INTO `item_mods` VALUES (17973, 25, 3);
INSERT INTO `item_mods` VALUES (17974, 25, 2);
INSERT INTO `item_mods` VALUES (17974, 68, 2);
INSERT INTO `item_mods` VALUES (17975, 25, 2);
INSERT INTO `item_mods` VALUES (17975, 68, 3);
INSERT INTO `item_mods` VALUES (17976, 23, 3);
INSERT INTO `item_mods` VALUES (17976, 25, 2);
INSERT INTO `item_mods` VALUES (17977, 23, 5);
INSERT INTO `item_mods` VALUES (17977, 25, 2);
INSERT INTO `item_mods` VALUES (17978, 25, 3);
INSERT INTO `item_mods` VALUES (17979, 25, 3);
INSERT INTO `item_mods` VALUES (17980, 9, 1);
INSERT INTO `item_mods` VALUES (17980, 11, 1);
INSERT INTO `item_mods` VALUES (17981, 61, 10);
INSERT INTO `item_mods` VALUES (17982, 14, 5);
INSERT INTO `item_mods` VALUES (17992, 5, 25);
INSERT INTO `item_mods` VALUES (17992, 12, 2);
INSERT INTO `item_mods` VALUES (17994, 9, 3);
INSERT INTO `item_mods` VALUES (17995, 8, 2);
INSERT INTO `item_mods` VALUES (17995, 14, 1);
INSERT INTO `item_mods` VALUES (17996, 9, 4);
INSERT INTO `item_mods` VALUES (17996, 11, 2);
INSERT INTO `item_mods` VALUES (17996, 27, 1);
INSERT INTO `item_mods` VALUES (17997, 68, -1);
INSERT INTO `item_mods` VALUES (17997, 115, 3);
INSERT INTO `item_mods` VALUES (17998, 23, -1);
INSERT INTO `item_mods` VALUES (17998, 114, 4);
INSERT INTO `item_mods` VALUES (17999, 25, -1);
INSERT INTO `item_mods` VALUES (17999, 120, 3);
INSERT INTO `item_mods` VALUES (18000, 11, 1);
INSERT INTO `item_mods` VALUES (18000, 14, 1);
INSERT INTO `item_mods` VALUES (18002, 246, 2);
INSERT INTO `item_mods` VALUES (18004, 26, 14);
INSERT INTO `item_mods` VALUES (18005, 377, 15);
INSERT INTO `item_mods` VALUES (18007, 26, 12);

-- -------------------------------------------------------
-- Hushed Dagger
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18008, 431, 1); -- Additional Effect: Silence

INSERT INTO `item_mods` VALUES (18009, 345, 1000);

-- -------------------------------------------------------
-- Melt Dagger
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18010, 431, 1); -- Additional Effect: Weakens Defense

-- -------------------------------------------------------
-- Melt Knife
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18011, 431, 1); -- Additional Effect: Weakens Defense

-- -------------------------------------------------------
-- Melt Baselard
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18012, 431, 1); -- Additional Effect: Water Damage

-- -------------------------------------------------------
-- Melt Kukri
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18013, 431, 1); -- Additional Effect: Weakens Defense

INSERT INTO `item_mods` VALUES (18018, 55, -7);
INSERT INTO `item_mods` VALUES (18018, 56, 7);
INSERT INTO `item_mods` VALUES (18018, 431, 1);
INSERT INTO `item_mods` VALUES (18021, 10, 4);
INSERT INTO `item_mods` VALUES (18021, 23, 8);
INSERT INTO `item_mods` VALUES (18022, 5, 11);
INSERT INTO `item_mods` VALUES (18022, 9, 3);
INSERT INTO `item_mods` VALUES (18022, 10, 3);
INSERT INTO `item_mods` VALUES (18022, 12, 3);
INSERT INTO `item_mods` VALUES (18022, 27, -1);
INSERT INTO `item_mods` VALUES (18023, 2, 20);
INSERT INTO `item_mods` VALUES (18023, 245, 2);
INSERT INTO `item_mods` VALUES (18024, 2, 22);
INSERT INTO `item_mods` VALUES (18024, 245, 3);
INSERT INTO `item_mods` VALUES (18026, 68, -10);
INSERT INTO `item_mods` VALUES (18027, 24, 5);
INSERT INTO `item_mods` VALUES (18027, 110, 5);
INSERT INTO `item_mods` VALUES (18027, 291, 1);
INSERT INTO `item_mods` VALUES (18028, 9, 4);
INSERT INTO `item_mods` VALUES (18030, 2, 15);
INSERT INTO `item_mods` VALUES (18030, 68, 4);
INSERT INTO `item_mods` VALUES (18031, 2, 20);
INSERT INTO `item_mods` VALUES (18031, 68, 5);

-- -------------------------------------------------------
-- Adder Jambiya
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18032, 2, 15);
INSERT INTO `item_mods` VALUES (18032, 68, 4);
INSERT INTO `item_mods` VALUES (18032, 241, 2);
INSERT INTO `item_mods` VALUES (18032, 246, 2);
INSERT INTO `item_mods` VALUES (18032, 431, 1); -- Additional Effect

-- -------------------------------------------------------
-- Adder Jambiya +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18033, 2, 20);
INSERT INTO `item_mods` VALUES (18033, 68, 5);
INSERT INTO `item_mods` VALUES (18033, 241, 3);
INSERT INTO `item_mods` VALUES (18033, 246, 3);
INSERT INTO `item_mods` VALUES (18033, 431, 1); -- Additional Effect

INSERT INTO `item_mods` VALUES (18035, 23, 3);
INSERT INTO `item_mods` VALUES (18035, 25, 3);
INSERT INTO `item_mods` VALUES (18035, 60, -5);
INSERT INTO `item_mods` VALUES (18038, 5, 4);
INSERT INTO `item_mods` VALUES (18038, 8, 2);
INSERT INTO `item_mods` VALUES (18038, 10, -1);
INSERT INTO `item_mods` VALUES (18039, 5, 6);
INSERT INTO `item_mods` VALUES (18039, 8, 2);
INSERT INTO `item_mods` VALUES (18039, 10, -1);
INSERT INTO `item_mods` VALUES (18040, 250, 2);
INSERT INTO `item_mods` VALUES (18042, 54, 8);
INSERT INTO `item_mods` VALUES (18042, 60, 8);
INSERT INTO `item_mods` VALUES (18043, 25, 5);
INSERT INTO `item_mods` VALUES (18043, 54, 10);
INSERT INTO `item_mods` VALUES (18043, 225, 2);
INSERT INTO `item_mods` VALUES (18044, 288, 1);
INSERT INTO `item_mods` VALUES (18046, 25, 3);
INSERT INTO `item_mods` VALUES (18047, 8, 2);
INSERT INTO `item_mods` VALUES (18047, 10, -2);
INSERT INTO `item_mods` VALUES (18047, 12, 4);
INSERT INTO `item_mods` VALUES (18048, 5, 20);
INSERT INTO `item_mods` VALUES (18048, 14, 5);
INSERT INTO `item_mods` VALUES (18049, 12, 2);
INSERT INTO `item_mods` VALUES (18054, 7, 10);
INSERT INTO `item_mods` VALUES (18054, 12, 1);
INSERT INTO `item_mods` VALUES (18055, 7, 15);
INSERT INTO `item_mods` VALUES (18055, 12, 2);
INSERT INTO `item_mods` VALUES (18056, 345, 1000);
INSERT INTO `item_mods` VALUES (18057, 3, -5);
INSERT INTO `item_mods` VALUES (18057, 25, 5);
INSERT INTO `item_mods` VALUES (18057, 354, 1);
INSERT INTO `item_mods` VALUES (18058, 25, 2);
INSERT INTO `item_mods` VALUES (18058, 30, 2);
INSERT INTO `item_mods` VALUES (18059, 25, 3);
INSERT INTO `item_mods` VALUES (18059, 30, 3);
INSERT INTO `item_mods` VALUES (18060, 25, 2);
INSERT INTO `item_mods` VALUES (18060, 30, 2);
INSERT INTO `item_mods` VALUES (18063, 11, 4);
INSERT INTO `item_mods` VALUES (18066, 5, 20);
INSERT INTO `item_mods` VALUES (18066, 12, 4);
INSERT INTO `item_mods` VALUES (18066, 116, 5);
INSERT INTO `item_mods` VALUES (18068, 23, 3);
INSERT INTO `item_mods` VALUES (18069, 23, 5);
INSERT INTO `item_mods` VALUES (18074, 2, 10);
INSERT INTO `item_mods` VALUES (18074, 5, 10);
INSERT INTO `item_mods` VALUES (18074, 160, -10);
INSERT INTO `item_mods` VALUES (18074, 244, 2);
INSERT INTO `item_mods` VALUES (18075, 25, 2);
INSERT INTO `item_mods` VALUES (18080, 9, 2);
INSERT INTO `item_mods` VALUES (18081, 9, 3);
INSERT INTO `item_mods` VALUES (18082, 10, 3);
INSERT INTO `item_mods` VALUES (18083, 10, 4);
INSERT INTO `item_mods` VALUES (18086, 11, 2);
INSERT INTO `item_mods` VALUES (18087, 8, 2);
INSERT INTO `item_mods` VALUES (18087, 10, 4);
INSERT INTO `item_mods` VALUES (18088, 8, 4);
INSERT INTO `item_mods` VALUES (18088, 9, 1);
INSERT INTO `item_mods` VALUES (18089, 8, 5);
INSERT INTO `item_mods` VALUES (18089, 110, 6);
INSERT INTO `item_mods` VALUES (18090, 8, 1);
INSERT INTO `item_mods` VALUES (18091, 10, 2);
INSERT INTO `item_mods` VALUES (18097, 377, 13);
INSERT INTO `item_mods` VALUES (18098, 345, 1000);
INSERT INTO `item_mods` VALUES (18100, 9, 7);

-- -------------------------------------------------------
-- Fuscina
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18104, 431, 1); -- Additional Effect: Lightning Damage

INSERT INTO `item_mods` VALUES (18105, 25, 2);
INSERT INTO `item_mods` VALUES (18105, 26, 2);
INSERT INTO `item_mods` VALUES (18106, 25, 3);
INSERT INTO `item_mods` VALUES (18106, 26, 3);
INSERT INTO `item_mods` VALUES (18107, 25, 2);
INSERT INTO `item_mods` VALUES (18107, 26, 2);
INSERT INTO `item_mods` VALUES (18109, 13, 8);
INSERT INTO `item_mods` VALUES (18109, 23, 8);

-- -------------------------------------------------------
-- Mezraq
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18110, 8, 2);
INSERT INTO `item_mods` VALUES (18110, 10, 2);
INSERT INTO `item_mods` VALUES (18110, 431, 1);

-- -------------------------------------------------------
-- Mezraq +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18111, 8, 3);
INSERT INTO `item_mods` VALUES (18111, 10, 3);
INSERT INTO `item_mods` VALUES (18111, 431, 1);

-- -------------------------------------------------------
-- Tournament Lance
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18114, 73, 3); -- "Store TP"+3

INSERT INTO `item_mods` VALUES (18115, 25, 2);
INSERT INTO `item_mods` VALUES (18115, 73, 1);
INSERT INTO `item_mods` VALUES (18116, 25, 3);

-- -------------------------------------------------------
-- Dark Mezraq
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18118, 431, 1);

-- -------------------------------------------------------
-- Dark Mezraq +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18119, 431, 1);

INSERT INTO `item_mods` VALUES (18121, 288, 3);
INSERT INTO `item_mods` VALUES (18122, 8, 2);
INSERT INTO `item_mods` VALUES (18122, 12, -1);
INSERT INTO `item_mods` VALUES (18122, 13, -1);

-- -------------------------------------------------------
-- Thalassocrat
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18123, 2, 10);
INSERT INTO `item_mods` VALUES (18123, 9, 2);
INSERT INTO `item_mods` VALUES (18123, 10, 2);
INSERT INTO `item_mods` VALUES (18123, 245, 2);
INSERT INTO `item_mods` VALUES (18123, 431, 1);

-- -------------------------------------------------------
-- Thalassocrat +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18124, 2, 12);
INSERT INTO `item_mods` VALUES (18124, 9, 3);
INSERT INTO `item_mods` VALUES (18124, 10, 3);
INSERT INTO `item_mods` VALUES (18124, 245, 3);
INSERT INTO `item_mods` VALUES (18124, 431, 1);

INSERT INTO `item_mods` VALUES (18125, 2, 15);
INSERT INTO `item_mods` VALUES (18125, 5, 15);
INSERT INTO `item_mods` VALUES (18125, 10, 5);
INSERT INTO `item_mods` VALUES (18125, 13, 5);
INSERT INTO `item_mods` VALUES (18125, 165, 3);
INSERT INTO `item_mods` VALUES (18126, 23, 5);
INSERT INTO `item_mods` VALUES (18126, 25, 5);
INSERT INTO `item_mods` VALUES (18126, 110, 10);
INSERT INTO `item_mods` VALUES (18126, 289, 5);
INSERT INTO `item_mods` VALUES (18127, 25, 4);
INSERT INTO `item_mods` VALUES (18128, 361, 50);
INSERT INTO `item_mods` VALUES (18129, 25, 10);
INSERT INTO `item_mods` VALUES (18129, 68, 10);
INSERT INTO `item_mods` VALUES (18129, 289, 5);
INSERT INTO `item_mods` VALUES (18130, 25, 11);
INSERT INTO `item_mods` VALUES (18130, 68, 11);
INSERT INTO `item_mods` VALUES (18130, 289, 6);
INSERT INTO `item_mods` VALUES (18131, 23, 8);
INSERT INTO `item_mods` VALUES (18131, 230, 2);
INSERT INTO `item_mods` VALUES (18134, 24, 5);
INSERT INTO `item_mods` VALUES (18134, 26, 5);
INSERT INTO `item_mods` VALUES (18135, 24, 5);
INSERT INTO `item_mods` VALUES (18135, 26, 5);
INSERT INTO `item_mods` VALUES (18136, 5, 3);
INSERT INTO `item_mods` VALUES (18136, 12, 1);
INSERT INTO `item_mods` VALUES (18137, 5, 5);
INSERT INTO `item_mods` VALUES (18137, 13, 1);
INSERT INTO `item_mods` VALUES (18138, 25, 3);
INSERT INTO `item_mods` VALUES (18138, 26, 3);
INSERT INTO `item_mods` VALUES (18139, 23, 12);
INSERT INTO `item_mods` VALUES (18139, 54, -6);
INSERT INTO `item_mods` VALUES (18140, 5, 10);
INSERT INTO `item_mods` VALUES (18140, 12, 2);
INSERT INTO `item_mods` VALUES (18141, 2, 8);
INSERT INTO `item_mods` VALUES (18141, 5, 8);
INSERT INTO `item_mods` VALUES (18141, 56, 8);
INSERT INTO `item_mods` VALUES (18141, 68, 8);
INSERT INTO `item_mods` VALUES (18142, 24, 15);
INSERT INTO `item_mods` VALUES (18143, 24, 16);

-- -------------------------------------------------------
-- Trials Weapon
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18144, 2, 20);
INSERT INTO `item_mods` VALUES (18144, 56, 10);
INSERT INTO `item_mods` VALUES (18144, 58, 10);

INSERT INTO `item_mods` VALUES (18145, 243, 2);
INSERT INTO `item_mods` VALUES (18146, 2, 20);
INSERT INTO `item_mods` VALUES (18146, 57, 10);
INSERT INTO `item_mods` VALUES (18146, 59, 10);

INSERT INTO `item_mods` VALUES (18147, 24, 20);
INSERT INTO `item_mods` VALUES (18147, 26, -12);
INSERT INTO `item_mods` VALUES (18148, 431, 1);
INSERT INTO `item_mods` VALUES (18149, 431, 1);
INSERT INTO `item_mods` VALUES (18150, 431, 1);
INSERT INTO `item_mods` VALUES (18151, 431, 1);
INSERT INTO `item_mods` VALUES (18152, 431, 1);
INSERT INTO `item_mods` VALUES (18153, 431, 1);
INSERT INTO `item_mods` VALUES (18154, 26, 5);
INSERT INTO `item_mods` VALUES (18155, 26, 5);
INSERT INTO `item_mods` VALUES (18156, 26, 5);

-- -------------------------------------------------------
-- Poison Arrow
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18157, 431, 1); -- Additional effect: Poison

-- -------------------------------------------------------
-- Sleep Arrow
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18158, 431, 1); -- Additional effect: Sleep
-- -------------------------------------------------------
-- Demon Arrow
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18159, 431, 1); -- Additonal effect: Attack Down

-- -------------------------------------------------------
-- Spartan Bullet
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18160, 431, 1); -- Additional effect: Stun

-- -------------------------------------------------------
-- Winds
-- Hidden effect: removes Sky gods additional effect damage.
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18161, 431, 1);
INSERT INTO `item_mods` VALUES (18162, 431, 1);
INSERT INTO `item_mods` VALUES (18163, 431, 1);
INSERT INTO `item_mods` VALUES (18164, 431, 1);

INSERT INTO `item_mods` VALUES (18166, 3, 1);
INSERT INTO `item_mods` VALUES (18166, 10, 1);
INSERT INTO `item_mods` VALUES (18167, 6, 1);
INSERT INTO `item_mods` VALUES (18167, 10, 1);
INSERT INTO `item_mods` VALUES (18168, 14, 3);
INSERT INTO `item_mods` VALUES (18168, 26, 99);
INSERT INTO `item_mods` VALUES (18168, 72, 3);
INSERT INTO `item_mods` VALUES (18169, 14, 4);
INSERT INTO `item_mods` VALUES (18169, 26, 100);
INSERT INTO `item_mods` VALUES (18169, 72, 4);
INSERT INTO `item_mods` VALUES (18172, 9, 2);
INSERT INTO `item_mods` VALUES (18172, 26, 8);
INSERT INTO `item_mods` VALUES (18173, 26, 18);
INSERT INTO `item_mods` VALUES (18173, 27, 2);
INSERT INTO `item_mods` VALUES (18174, 5, 12);
INSERT INTO `item_mods` VALUES (18175, 25, 1);
INSERT INTO `item_mods` VALUES (18176, 12, 1);
INSERT INTO `item_mods` VALUES (18176, 13, 1);
INSERT INTO `item_mods` VALUES (18176, 14, 2);
INSERT INTO `item_mods` VALUES (18177, 23, 2);
INSERT INTO `item_mods` VALUES (18177, 162, -2);
INSERT INTO `item_mods` VALUES (18178, 26, 5);
INSERT INTO `item_mods` VALUES (18180, 8, 1);
INSERT INTO `item_mods` VALUES (18181, 26, -3);
INSERT INTO `item_mods` VALUES (18182, 26, -4);
INSERT INTO `item_mods` VALUES (18183, 26, -4);
INSERT INTO `item_mods` VALUES (18184, 26, -5);
INSERT INTO `item_mods` VALUES (18185, 26, -5);
INSERT INTO `item_mods` VALUES (18186, 26, -6);
INSERT INTO `item_mods` VALUES (18187, 26, -6);
INSERT INTO `item_mods` VALUES (18188, 26, -7);
INSERT INTO `item_mods` VALUES (18189, 26, -3);
INSERT INTO `item_mods` VALUES (18190, 26, -4);
INSERT INTO `item_mods` VALUES (18191, 26, -5);
INSERT INTO `item_mods` VALUES (18192, 26, -5);
INSERT INTO `item_mods` VALUES (18193, 26, -6);
INSERT INTO `item_mods` VALUES (18194, 26, -7);
INSERT INTO `item_mods` VALUES (18195, 26, -4);
INSERT INTO `item_mods` VALUES (18196, 243, 2);
INSERT INTO `item_mods` VALUES (18197, 2, 11);
INSERT INTO `item_mods` VALUES (18197, 9, 3);
INSERT INTO `item_mods` VALUES (18197, 10, 3);
INSERT INTO `item_mods` VALUES (18198, 23, 5);
INSERT INTO `item_mods` VALUES (18198, 56, 10);
INSERT INTO `item_mods` VALUES (18198, 230, 2);
INSERT INTO `item_mods` VALUES (18199, 73, 1);
INSERT INTO `item_mods` VALUES (18211, 8, 1);
INSERT INTO `item_mods` VALUES (18211, 10, 5);
INSERT INTO `item_mods` VALUES (18211, 11, -2);
INSERT INTO `item_mods` VALUES (18212, 11, 1);
INSERT INTO `item_mods` VALUES (18213, 10, 1);
INSERT INTO `item_mods` VALUES (18213, 11, 1);
INSERT INTO `item_mods` VALUES (18220, 431, 1);
INSERT INTO `item_mods` VALUES (18221, 345, 1000);
INSERT INTO `item_mods` VALUES (18222, 10, 7);
INSERT INTO `item_mods` VALUES (18223, 2, 10);
INSERT INTO `item_mods` VALUES (18223, 9, 2);
INSERT INTO `item_mods` VALUES (18223, 10, 2);
INSERT INTO `item_mods` VALUES (18223, 55, 8);
INSERT INTO `item_mods` VALUES (18224, 2, 11);
INSERT INTO `item_mods` VALUES (18224, 9, 3);
INSERT INTO `item_mods` VALUES (18224, 10, 3);
INSERT INTO `item_mods` VALUES (18224, 55, 9);
INSERT INTO `item_mods` VALUES (18225, 2, 10);
INSERT INTO `item_mods` VALUES (18225, 9, 2);
INSERT INTO `item_mods` VALUES (18225, 10, 2);
INSERT INTO `item_mods` VALUES (18225, 55, 8);
INSERT INTO `item_mods` VALUES (18235, 26, 25);
INSERT INTO `item_mods` VALUES (18245, 30, 8);
INSERT INTO `item_mods` VALUES (18246, 11, 1);
INSERT INTO `item_mods` VALUES (18247, 8, 1);
INSERT INTO `item_mods` VALUES (18247, 12, 1);
INSERT INTO `item_mods` VALUES (18248, 8, 1);
INSERT INTO `item_mods` VALUES (18248, 12, 1);
INSERT INTO `item_mods` VALUES (18249, 8, 2);
INSERT INTO `item_mods` VALUES (18250, 8, 2);
INSERT INTO `item_mods` VALUES (18251, 12, 2);
INSERT INTO `item_mods` VALUES (18252, 9, 1);
INSERT INTO `item_mods` VALUES (18252, 11, 1);
INSERT INTO `item_mods` VALUES (18253, 10, 2);
INSERT INTO `item_mods` VALUES (18254, 2, -25);
INSERT INTO `item_mods` VALUES (18254, 23, 2);
INSERT INTO `item_mods` VALUES (18254, 25, 2);
INSERT INTO `item_mods` VALUES (18254, 68, -4);
INSERT INTO `item_mods` VALUES (18255, 24, 20);
INSERT INTO `item_mods` VALUES (18255, 26, -15);
INSERT INTO `item_mods` VALUES (18256, 119, 1);
INSERT INTO `item_mods` VALUES (18257, 10, 4);
INSERT INTO `item_mods` VALUES (18257, 59, 3);
INSERT INTO `item_mods` VALUES (18257, 228, 2);
INSERT INTO `item_mods` VALUES (18263, 356, 10);

-- -------------------------------------------------------
-- Spharai (75)
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18264, 23, 20);
INSERT INTO `item_mods` VALUES (18264, 291, 5);
INSERT INTO `item_mods` VALUES (18264, 355, 10);
INSERT INTO `item_mods` VALUES (18264, 506, 160); -- 16% chance of extra dmg.
INSERT INTO `item_mods` VALUES (18264, 507, 250); -- Occ. 2.5x dmg

INSERT INTO `item_mods` VALUES (18269, 356, 26);

-- -------------------------------------------------------
-- Mandau (75)
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18270, 23, 20);
INSERT INTO `item_mods` VALUES (18270, 355, 26);
INSERT INTO `item_mods` VALUES (18270, 431, 1); -- Add. Effect
INSERT INTO `item_mods` VALUES (18270, 506, 160); -- 16% chance of extra dmg.
INSERT INTO `item_mods` VALUES (18270, 507, 300); -- Occ. 3x dmg

INSERT INTO `item_mods` VALUES (18275, 356, 43);

-- -------------------------------------------------------
-- Excalibur (75)
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18276, 23, 20);
INSERT INTO `item_mods` VALUES (18276, 355, 43);
INSERT INTO `item_mods` VALUES (18276, 431, 1); -- Add. Effect
INSERT INTO `item_mods` VALUES (18276, 506, 160); -- 16% chance of extra dmg.
INSERT INTO `item_mods` VALUES (18276, 507, 250); -- Occ. 2.5x dmg

INSERT INTO `item_mods` VALUES (18281, 356, 57);

-- -------------------------------------------------------
-- Ragnarok (75)
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18282, 25, 20);
INSERT INTO `item_mods` VALUES (18282, 165, 5);
INSERT INTO `item_mods` VALUES (18282, 355, 57);
INSERT INTO `item_mods` VALUES (18282, 506, 160); -- 16% chance of extra dmg.
INSERT INTO `item_mods` VALUES (18282, 507, 250); -- Occ. 2.5x dmg

INSERT INTO `item_mods` VALUES (18287, 356, 73);

-- -------------------------------------------------------
-- Guttler (75)
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18288, 23, 20);
INSERT INTO `item_mods` VALUES (18288, 355, 73);
INSERT INTO `item_mods` VALUES (18288, 431, 1); -- Add. Effect
INSERT INTO `item_mods` VALUES (18288, 506, 160); -- 16% chance of extra dmg.
INSERT INTO `item_mods` VALUES (18288, 507, 250); -- Occ. 2.5x dmg

INSERT INTO `item_mods` VALUES (18293, 356, 89);

-- -------------------------------------------------------
-- Bravura (75)
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18294, 25, 20);
INSERT INTO `item_mods` VALUES (18294, 355, 89);
INSERT INTO `item_mods` VALUES (18294, 431, 1); -- Add. Effect
INSERT INTO `item_mods` VALUES (18294, 506, 160); -- 16% chance of extra dmg.
INSERT INTO `item_mods` VALUES (18294, 507, 200); -- Occ. 2x dmg

INSERT INTO `item_mods` VALUES (18299, 356, 121);

-- -------------------------------------------------------
-- Gungnir (75)
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18300, 25, 20);
INSERT INTO `item_mods` VALUES (18300, 355, 121);
INSERT INTO `item_mods` VALUES (18300, 431, 1); -- Add. Effect
INSERT INTO `item_mods` VALUES (18300, 506, 160); -- 16% chance of extra dmg.
INSERT INTO `item_mods` VALUES (18300, 507, 250); -- Occ. 2.5x dmg

INSERT INTO `item_mods` VALUES (18305, 356, 105);

-- -------------------------------------------------------
-- Apocalypse (75)
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18306, 25, 20);
INSERT INTO `item_mods` VALUES (18306, 355, 105);
INSERT INTO `item_mods` VALUES (18306, 431, 1); -- Add. Effect
INSERT INTO `item_mods` VALUES (18306, 506, 160); -- 16% chance of extra dmg.
INSERT INTO `item_mods` VALUES (18306, 507, 200); -- Occ. 2x dmg

INSERT INTO `item_mods` VALUES (18311, 356, 137);

-- -------------------------------------------------------
-- Kikoku (75)
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18312, 23, 20);
INSERT INTO `item_mods` VALUES (18312, 355, 137);
INSERT INTO `item_mods` VALUES (18312, 431, 1); -- Add. Effect
INSERT INTO `item_mods` VALUES (18312, 506, 160); -- 16% chance of extra dmg.
INSERT INTO `item_mods` VALUES (18312, 507, 300); -- Occ. 3x dmg

INSERT INTO `item_mods` VALUES (18317, 356, 153);

-- -------------------------------------------------------
-- Amanomurakumo (75)
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18318, 25, 20);
INSERT INTO `item_mods` VALUES (18318, 355, 153);
INSERT INTO `item_mods` VALUES (18318, 431, 1); -- Add. Effect
INSERT INTO `item_mods` VALUES (18318, 506, 160); -- 16% chance of extra dmg.
INSERT INTO `item_mods` VALUES (18318, 507, 250); -- Occ. 2.5x dmg

INSERT INTO `item_mods` VALUES (18323, 356, 170);

-- -------------------------------------------------------
-- Mjollnir (75)
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18324, 23, 20);
INSERT INTO `item_mods` VALUES (18324, 355, 170);
INSERT INTO `item_mods` VALUES (18324, 431, 1); -- Add. Effect
INSERT INTO `item_mods` VALUES (18324, 506, 160); -- 16% chance of extra dmg.
INSERT INTO `item_mods` VALUES (18324, 507, 300); -- Occ. 3x dmg

INSERT INTO `item_mods` VALUES (18329, 356, 185);

-- -------------------------------------------------------
-- Claustrum (75)
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18330, 25, 20);
INSERT INTO `item_mods` VALUES (18330, 355, 185);
INSERT INTO `item_mods` VALUES (18330, 431, 1); -- Add. Effect
INSERT INTO `item_mods` VALUES (18330, 506, 160); -- 16% chance of extra dmg.
INSERT INTO `item_mods` VALUES (18330, 507, 250); -- Occ. 2.5x dmg

INSERT INTO `item_mods` VALUES (18335, 356, 216);

-- -------------------------------------------------------
-- Annihilator (75)
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18336, 24, 10);
INSERT INTO `item_mods` VALUES (18336, 26, 20);
INSERT INTO `item_mods` VALUES (18336, 355, 216);
INSERT INTO `item_mods` VALUES (18336, 506, 160); -- 16% chance of extra dmg.
INSERT INTO `item_mods` VALUES (18336, 507, 300); -- Occ. 3x dmg

INSERT INTO `item_mods` VALUES (18342, 14, 4);
INSERT INTO `item_mods` VALUES (18342, 119, 10);
INSERT INTO `item_mods` VALUES (18342, 121, 10);
INSERT INTO `item_mods` VALUES (18342, 452, 2);
INSERT INTO `item_mods` VALUES (18343, 440, 3);
INSERT INTO `item_mods` VALUES (18343, 444, 3);
INSERT INTO `item_mods` VALUES (18347, 356, 200);

-- -------------------------------------------------------
-- Yoichinoyumi (75)
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18348, 24, 10);
INSERT INTO `item_mods` VALUES (18348, 26, 20);
INSERT INTO `item_mods` VALUES (18348, 355, 200);
INSERT INTO `item_mods` VALUES (18348, 506, 160); -- 16% chance of extra dmg.
INSERT INTO `item_mods` VALUES (18348, 507, 300); -- Occ. 3x dmg

INSERT INTO `item_mods` VALUES (18350, 10, 3);
INSERT INTO `item_mods` VALUES (18351, 8, 3);
INSERT INTO `item_mods` VALUES (18351, 10, 4);
INSERT INTO `item_mods` VALUES (18351, 289, 1);
INSERT INTO `item_mods` VALUES (18352, 68, 5);
INSERT INTO `item_mods` VALUES (18353, 10, 1);
INSERT INTO `item_mods` VALUES (18353, 107, 2);
INSERT INTO `item_mods` VALUES (18354, 10, 2);
INSERT INTO `item_mods` VALUES (18354, 107, 3);
INSERT INTO `item_mods` VALUES (18355, 431, 1);
INSERT INTO `item_mods` VALUES (18356, 345, 1000);

-- -------------------------------------------------------
-- Melt Claws
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18357, 431, 1); -- Additional Effect: Water Damage

-- -------------------------------------------------------
-- Boreas Cesti
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18359, 431, 1); -- Additional Effect: Wind Damage (100% proc rate)

INSERT INTO `item_mods` VALUES (18360, 13, 7);
INSERT INTO `item_mods` VALUES (18361, 10, 2);
INSERT INTO `item_mods` VALUES (18362, 25, 2);
INSERT INTO `item_mods` VALUES (18362, 68, 1);
INSERT INTO `item_mods` VALUES (18363, 25, 3);
INSERT INTO `item_mods` VALUES (18363, 68, 2);
INSERT INTO `item_mods` VALUES (18370, 13, 2);
INSERT INTO `item_mods` VALUES (18370, 23, 5);
INSERT INTO `item_mods` VALUES (18371, 13, 3);
INSERT INTO `item_mods` VALUES (18371, 23, 7);
INSERT INTO `item_mods` VALUES (18372, 2, 13);
INSERT INTO `item_mods` VALUES (18372, 8, 2);
INSERT INTO `item_mods` VALUES (18372, 12, 4);
INSERT INTO `item_mods` VALUES (18373, 5, 13);
INSERT INTO `item_mods` VALUES (18373, 8, 4);
INSERT INTO `item_mods` VALUES (18373, 12, 2);
INSERT INTO `item_mods` VALUES (18374, 8, 1);
INSERT INTO `item_mods` VALUES (18374, 9, 1);
INSERT INTO `item_mods` VALUES (18378, 377, 13);
INSERT INTO `item_mods` VALUES (18379, 431, 1);
INSERT INTO `item_mods` VALUES (18380, 345, 1000);

-- -------------------------------------------------------
-- Prominence Sword
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18381, 431, 1); -- Additional Effect: Fire Damage

INSERT INTO `item_mods` VALUES (18385, 23, 3);
INSERT INTO `item_mods` VALUES (18385, 302, 3);
INSERT INTO `item_mods` VALUES (18386, 28, 2);
INSERT INTO `item_mods` VALUES (18386, 30, 2);

-- -------------------------------------------------------
-- Sacred Maul
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18392, 13, 2);
INSERT INTO `item_mods` VALUES (18392, 61, 3);
INSERT INTO `item_mods` VALUES (18392, 431, 1); -- Additional Effect: Light Damage

INSERT INTO `item_mods` VALUES (18393, 111, 4);
INSERT INTO `item_mods` VALUES (18394, 71, 2);
INSERT INTO `item_mods` VALUES (18395, 8, 5);
INSERT INTO `item_mods` VALUES (18395, 23, 5);
INSERT INTO `item_mods` VALUES (18395, 25, 15);
INSERT INTO `item_mods` VALUES (18396, 13, 5);
INSERT INTO `item_mods` VALUES (18396, 23, 15);
INSERT INTO `item_mods` VALUES (18396, 25, -5);
INSERT INTO `item_mods` VALUES (18397, 12, 7);
INSERT INTO `item_mods` VALUES (18402, 12, 2);
INSERT INTO `item_mods` VALUES (18402, 13, 2);
INSERT INTO `item_mods` VALUES (18403, 12, 4);
INSERT INTO `item_mods` VALUES (18403, 13, 4);
INSERT INTO `item_mods` VALUES (18404, 9, 5);
INSERT INTO `item_mods` VALUES (18404, 23, 5);
INSERT INTO `item_mods` VALUES (18405, 2, 29);
INSERT INTO `item_mods` VALUES (18405, 5, -29);
INSERT INTO `item_mods` VALUES (18405, 10, 5);
INSERT INTO `item_mods` VALUES (18406, 2, 31);
INSERT INTO `item_mods` VALUES (18406, 5, -31);
INSERT INTO `item_mods` VALUES (18406, 10, 6);
INSERT INTO `item_mods` VALUES (18409, 5, -58);

-- -------------------------------------------------------
-- Melt Katana
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18410, 431, 1); -- Additional Effect: Water Damage

INSERT INTO `item_mods` VALUES (18411, 8, 2);
INSERT INTO `item_mods` VALUES (18411, 9, 2);
INSERT INTO `item_mods` VALUES (18411, 11, 2);
INSERT INTO `item_mods` VALUES (18412, 11, 1);
INSERT INTO `item_mods` VALUES (18413, 25, 2);
INSERT INTO `item_mods` VALUES (18413, 30, 2);
INSERT INTO `item_mods` VALUES (18414, 25, 3);
INSERT INTO `item_mods` VALUES (18414, 30, 3);
INSERT INTO `item_mods` VALUES (18415, 25, 2);
INSERT INTO `item_mods` VALUES (18415, 30, 2);
INSERT INTO `item_mods` VALUES (18418, 11, 2);
INSERT INTO `item_mods` VALUES (18418, 110, 4);
INSERT INTO `item_mods` VALUES (18419, 8, 2);
INSERT INTO `item_mods` VALUES (18419, 110, 1);
INSERT INTO `item_mods` VALUES (18420, 289, 1);
INSERT INTO `item_mods` VALUES (18421, 289, 2);
INSERT INTO `item_mods` VALUES (18423, 23, 3);
INSERT INTO `item_mods` VALUES (18424, 23, 5);
INSERT INTO `item_mods` VALUES (18429, 2, -20);
INSERT INTO `item_mods` VALUES (18429, 9, 3);
INSERT INTO `item_mods` VALUES (18429, 25, 5);
INSERT INTO `item_mods` VALUES (18429, 289, 2);
INSERT INTO `item_mods` VALUES (18430, 2, 20);
INSERT INTO `item_mods` VALUES (18430, 27, 2);
INSERT INTO `item_mods` VALUES (18430, 68, 4);
INSERT INTO `item_mods` VALUES (18431, 2, 10);
INSERT INTO `item_mods` VALUES (18431, 9, 2);
INSERT INTO `item_mods` VALUES (18431, 10, 2);
INSERT INTO `item_mods` VALUES (18431, 54, 8);
INSERT INTO `item_mods` VALUES (18432, 2, 11);
INSERT INTO `item_mods` VALUES (18432, 9, 3);
INSERT INTO `item_mods` VALUES (18432, 10, 3);
INSERT INTO `item_mods` VALUES (18432, 54, 9);
INSERT INTO `item_mods` VALUES (18433, 2, 10);
INSERT INTO `item_mods` VALUES (18433, 9, 2);
INSERT INTO `item_mods` VALUES (18433, 10, 2);
INSERT INTO `item_mods` VALUES (18433, 54, 8);
INSERT INTO `item_mods` VALUES (18438, 165, 5);
INSERT INTO `item_mods` VALUES (18438, 306, 1);
INSERT INTO `item_mods` VALUES (18439, 8, 2);
INSERT INTO `item_mods` VALUES (18439, 12, 2);
INSERT INTO `item_mods` VALUES (18440, 8, 3);
INSERT INTO `item_mods` VALUES (18440, 12, 3);
INSERT INTO `item_mods` VALUES (18446, 23, 12);
INSERT INTO `item_mods` VALUES (18446, 25, -6);
INSERT INTO `item_mods` VALUES (18446, 73, 2);
INSERT INTO `item_mods` VALUES (18447, 8, 7);
INSERT INTO `item_mods` VALUES (18447, 9, 7);
INSERT INTO `item_mods` VALUES (18447, 306, 100);
INSERT INTO `item_mods` VALUES (18448, 25, 4);
INSERT INTO `item_mods` VALUES (18449, 27, 5);
INSERT INTO `item_mods` VALUES (18450, 289, 2);

-- -------------------------------------------------------
-- Mokusa
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18451, 431, 1); -- Additional Effect: Wind Damage

INSERT INTO `item_mods` VALUES (18482, 245, 2);
INSERT INTO `item_mods` VALUES (18483, 245, 3);
INSERT INTO `item_mods` VALUES (18487, 23, 6);
INSERT INTO `item_mods` VALUES (18487, 25, 6);
INSERT INTO `item_mods` VALUES (18489, 245, 2);
INSERT INTO `item_mods` VALUES (18490, 245, 3);
INSERT INTO `item_mods` VALUES (18494, 23, 10);
INSERT INTO `item_mods` VALUES (18494, 243, 2);
INSERT INTO `item_mods` VALUES (18495, 245, 2);
INSERT INTO `item_mods` VALUES (18496, 245, 3);
INSERT INTO `item_mods` VALUES (18497, 23, 7);
INSERT INTO `item_mods` VALUES (18497, 25, 7);
INSERT INTO `item_mods` VALUES (18498, 10, 8);
INSERT INTO `item_mods` VALUES (18498, 161, -8);
INSERT INTO `item_mods` VALUES (18499, 2, 10);
INSERT INTO `item_mods` VALUES (18499, 5, 10);
INSERT INTO `item_mods` VALUES (18500, 384, 11);

-- -------------------------------------------------------
-- Mammut
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18503, 431, 1); -- Additional Effect: Ice Damage

INSERT INTO `item_mods` VALUES (18504, 11, 4);
INSERT INTO `item_mods` VALUES (18504, 229, 2);
INSERT INTO `item_mods` VALUES (18506, 288, 1);
INSERT INTO `item_mods` VALUES (18509, 288, 1);
INSERT INTO `item_mods` VALUES (18531, 24, 4);

-- -------------------------------------------------------
-- Twilight Scythe
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18551, 8, 8); -- STR+8
INSERT INTO `item_mods` VALUES (18551, 431, 1); -- Additional Effect: DEATH

INSERT INTO `item_mods` VALUES (18571, 453, 2);
INSERT INTO `item_mods` VALUES (18571, 454, 30);
INSERT INTO `item_mods` VALUES (18572, 452, 4);
INSERT INTO `item_mods` VALUES (18575, 453, 1);
INSERT INTO `item_mods` VALUES (18575, 454, 25);
INSERT INTO `item_mods` VALUES (18576, 453, 1);
INSERT INTO `item_mods` VALUES (18576, 454, 30);
INSERT INTO `item_mods` VALUES (18577, 452, 2);
INSERT INTO `item_mods` VALUES (18578, 452, 2);
INSERT INTO `item_mods` VALUES (18579, 452, 3);
INSERT INTO `item_mods` VALUES (18580, 452, 3);
INSERT INTO `item_mods` VALUES (18581, 14, 4);
INSERT INTO `item_mods` VALUES (18584, 71, 9);
INSERT INTO `item_mods` VALUES (18585, 2, 25);
INSERT INTO `item_mods` VALUES (18585, 5, 25);
INSERT INTO `item_mods` VALUES (18585, 71, 2);
INSERT INTO `item_mods` VALUES (18585, 72, 2);
INSERT INTO `item_mods` VALUES (18587, 5, 50);
INSERT INTO `item_mods` VALUES (18587, 374, 10);
INSERT INTO `item_mods` VALUES (18591, 23, 4);
INSERT INTO `item_mods` VALUES (18593, 2, -10);
INSERT INTO `item_mods` VALUES (18593, 12, 10);
INSERT INTO `item_mods` VALUES (18593, 13, 10);
INSERT INTO `item_mods` VALUES (18593, 14, 10);
INSERT INTO `item_mods` VALUES (18593, 30, 20);
INSERT INTO `item_mods` VALUES (18594, 5, 20);
INSERT INTO `item_mods` VALUES (18594, 28, 25);
INSERT INTO `item_mods` VALUES (18594, 71, 10);
INSERT INTO `item_mods` VALUES (18595, 8, 5);
INSERT INTO `item_mods` VALUES (18595, 23, 12);
INSERT INTO `item_mods` VALUES (18595, 25, -4);
INSERT INTO `item_mods` VALUES (18595, 73, 5);
INSERT INTO `item_mods` VALUES (18596, 29, 5);
INSERT INTO `item_mods` VALUES (18599, 5, 10);
INSERT INTO `item_mods` VALUES (18599, 431, 1);
INSERT INTO `item_mods` VALUES (18600, 57, 2);
INSERT INTO `item_mods` VALUES (18604, 12, 2);
INSERT INTO `item_mods` VALUES (18604, 30, 3);
INSERT INTO `item_mods` VALUES (18605, 12, -2);
INSERT INTO `item_mods` VALUES (18605, 13, 2);
INSERT INTO `item_mods` VALUES (18605, 374, 3);
INSERT INTO `item_mods` VALUES (18606, 13, 1);
INSERT INTO `item_mods` VALUES (18606, 30, 3);
INSERT INTO `item_mods` VALUES (18607, 5, 8);
INSERT INTO `item_mods` VALUES (18607, 374, 1);
INSERT INTO `item_mods` VALUES (18608, 2, 5);
INSERT INTO `item_mods` VALUES (18608, 24, 14);
INSERT INTO `item_mods` VALUES (18608, 27, -1);
INSERT INTO `item_mods` VALUES (18610, 71, 4);
INSERT INTO `item_mods` VALUES (18611, 28, 3);
INSERT INTO `item_mods` VALUES (18615, 13, 2);
INSERT INTO `item_mods` VALUES (18615, 30, 4);
INSERT INTO `item_mods` VALUES (18616, 28, 4);
INSERT INTO `item_mods` VALUES (18630, 374, 14);
INSERT INTO `item_mods` VALUES (18631, 374, 15);
INSERT INTO `item_mods` VALUES (18632, 8, 4);
INSERT INTO `item_mods` VALUES (18632, 9, 4);
INSERT INTO `item_mods` VALUES (18632, 10, 4);
INSERT INTO `item_mods` VALUES (18632, 11, 4);
INSERT INTO `item_mods` VALUES (18632, 12, 4);
INSERT INTO `item_mods` VALUES (18632, 13, 4);
INSERT INTO `item_mods` VALUES (18632, 14, 4);
INSERT INTO `item_mods` VALUES (18632, 54, 15);
INSERT INTO `item_mods` VALUES (18632, 55, 15);
INSERT INTO `item_mods` VALUES (18632, 56, 15);
INSERT INTO `item_mods` VALUES (18632, 57, 15);
INSERT INTO `item_mods` VALUES (18632, 58, 15);
INSERT INTO `item_mods` VALUES (18632, 59, 15);
INSERT INTO `item_mods` VALUES (18632, 60, 15);
INSERT INTO `item_mods` VALUES (18632, 61, 15);
INSERT INTO `item_mods` VALUES (18632, 71, 10);
INSERT INTO `item_mods` VALUES (18632, 347, 1);
INSERT INTO `item_mods` VALUES (18632, 348, 1);
INSERT INTO `item_mods` VALUES (18632, 349, 1);
INSERT INTO `item_mods` VALUES (18632, 350, 1);
INSERT INTO `item_mods` VALUES (18632, 351, 1);
INSERT INTO `item_mods` VALUES (18632, 352, 1);
INSERT INTO `item_mods` VALUES (18632, 353, 1);
INSERT INTO `item_mods` VALUES (18632, 354, 1);
INSERT INTO `item_mods` VALUES (18632, 374, 10);
INSERT INTO `item_mods` VALUES (18633, 8, 5);
INSERT INTO `item_mods` VALUES (18633, 9, 5);
INSERT INTO `item_mods` VALUES (18633, 10, 5);
INSERT INTO `item_mods` VALUES (18633, 11, 5);
INSERT INTO `item_mods` VALUES (18633, 12, 5);
INSERT INTO `item_mods` VALUES (18633, 13, 5);
INSERT INTO `item_mods` VALUES (18633, 14, 5);
INSERT INTO `item_mods` VALUES (18633, 54, 20);
INSERT INTO `item_mods` VALUES (18633, 55, 20);
INSERT INTO `item_mods` VALUES (18633, 56, 20);
INSERT INTO `item_mods` VALUES (18633, 57, 20);
INSERT INTO `item_mods` VALUES (18633, 58, 20);
INSERT INTO `item_mods` VALUES (18633, 59, 20);
INSERT INTO `item_mods` VALUES (18633, 60, 20);
INSERT INTO `item_mods` VALUES (18633, 61, 20);
INSERT INTO `item_mods` VALUES (18633, 71, 10);
INSERT INTO `item_mods` VALUES (18633, 347, 2);
INSERT INTO `item_mods` VALUES (18633, 348, 2);
INSERT INTO `item_mods` VALUES (18633, 349, 2);
INSERT INTO `item_mods` VALUES (18633, 350, 2);
INSERT INTO `item_mods` VALUES (18633, 351, 2);
INSERT INTO `item_mods` VALUES (18633, 352, 2);
INSERT INTO `item_mods` VALUES (18633, 353, 2);
INSERT INTO `item_mods` VALUES (18633, 354, 2);
INSERT INTO `item_mods` VALUES (18633, 374, 10);
INSERT INTO `item_mods` VALUES (18681, 26, 5);
INSERT INTO `item_mods` VALUES (18682, 5, 12);
INSERT INTO `item_mods` VALUES (18682, 26, 8);
INSERT INTO `item_mods` VALUES (18682, 29, 2);
INSERT INTO `item_mods` VALUES (18687, 26, 7);
INSERT INTO `item_mods` VALUES (18688, 26, -8);
INSERT INTO `item_mods` VALUES (18695, 11, 2);
INSERT INTO `item_mods` VALUES (18695, 54, 13);
INSERT INTO `item_mods` VALUES (18695, 61, 13);
INSERT INTO `item_mods` VALUES (18696, 431, 1);
INSERT INTO `item_mods` VALUES (18701, 11, 4);
INSERT INTO `item_mods` VALUES (18701, 24, 24);
INSERT INTO `item_mods` VALUES (18701, 54, 14);
INSERT INTO `item_mods` VALUES (18701, 61, 14);
INSERT INTO `item_mods` VALUES (18702, 11, 2);
INSERT INTO `item_mods` VALUES (18702, 26, 2);
INSERT INTO `item_mods` VALUES (18703, 26, 5);
INSERT INTO `item_mods` VALUES (18704, 26, 4);
INSERT INTO `item_mods` VALUES (18705, 26, 6);
INSERT INTO `item_mods` VALUES (18706, 11, 5);
INSERT INTO `item_mods` VALUES (18706, 27, -2);
INSERT INTO `item_mods` VALUES (18707, 23, 6);
INSERT INTO `item_mods` VALUES (18707, 25, 6);
INSERT INTO `item_mods` VALUES (18707, 54, -6);
INSERT INTO `item_mods` VALUES (18708, 370, 1);
INSERT INTO `item_mods` VALUES (18709, 370, 1);
INSERT INTO `item_mods` VALUES (18711, 24, 10);
INSERT INTO `item_mods` VALUES (18712, 24, 10);
INSERT INTO `item_mods` VALUES (18714, 8, 3);
INSERT INTO `item_mods` VALUES (18714, 11, 3);
INSERT INTO `item_mods` VALUES (18714, 24, 23);
INSERT INTO `item_mods` VALUES (18714, 26, 2);
INSERT INTO `item_mods` VALUES (18715, 26, 3);
INSERT INTO `item_mods` VALUES (18716, 26, 5);
INSERT INTO `item_mods` VALUES (18726, 8, 1);
INSERT INTO `item_mods` VALUES (18726, 11, 1);
INSERT INTO `item_mods` VALUES (18727, 24, 6);
INSERT INTO `item_mods` VALUES (18727, 26, 6);
INSERT INTO `item_mods` VALUES (18728, 26, 5);
INSERT INTO `item_mods` VALUES (18728, 243, 2);
INSERT INTO `item_mods` VALUES (18734, 30, 2);
INSERT INTO `item_mods` VALUES (18738, 24, 20);
INSERT INTO `item_mods` VALUES (18738, 26, 10);
INSERT INTO `item_mods` VALUES (18739, 24, 20);
INSERT INTO `item_mods` VALUES (18739, 26, 10);
INSERT INTO `item_mods` VALUES (18740, 24, 10);
INSERT INTO `item_mods` VALUES (18740, 26, 40);
INSERT INTO `item_mods` VALUES (18741, 25, 1);
INSERT INTO `item_mods` VALUES (18742, 23, 2);
INSERT INTO `item_mods` VALUES (18743, 25, 2);
INSERT INTO `item_mods` VALUES (18743, 68, 1);
INSERT INTO `item_mods` VALUES (18744, 25, 3);
INSERT INTO `item_mods` VALUES (18744, 68, 2);
INSERT INTO `item_mods` VALUES (18745, 25, 2);
INSERT INTO `item_mods` VALUES (18745, 68, 1);
INSERT INTO `item_mods` VALUES (18746, 25, 3);
INSERT INTO `item_mods` VALUES (18746, 68, 2);
INSERT INTO `item_mods` VALUES (18747, 25, 3);
INSERT INTO `item_mods` VALUES (18748, 25, 7);
INSERT INTO `item_mods` VALUES (18748, 27, 7);
INSERT INTO `item_mods` VALUES (18748, 68, 7);
INSERT INTO `item_mods` VALUES (18748, 289, 7);
INSERT INTO `item_mods` VALUES (18749, 25, 9);
INSERT INTO `item_mods` VALUES (18749, 27, 9);
INSERT INTO `item_mods` VALUES (18749, 68, 9);
INSERT INTO `item_mods` VALUES (18749, 289, 9);
INSERT INTO `item_mods` VALUES (18750, 10, 2);
INSERT INTO `item_mods` VALUES (18750, 107, 4);
INSERT INTO `item_mods` VALUES (18751, 10, 3);
INSERT INTO `item_mods` VALUES (18751, 107, 5);
INSERT INTO `item_mods` VALUES (18752, 25, 3);
INSERT INTO `item_mods` VALUES (18752, 68, -10);
INSERT INTO `item_mods` VALUES (18752, 291, 5);
INSERT INTO `item_mods` VALUES (18755, 25, 3);
INSERT INTO `item_mods` VALUES (18756, 23, 7);
INSERT INTO `item_mods` VALUES (18756, 241, 2);
INSERT INTO `item_mods` VALUES (18759, 8, 3);
INSERT INTO `item_mods` VALUES (18759, 25, 10);
INSERT INTO `item_mods` VALUES (18759, 288, 1);
INSERT INTO `item_mods` VALUES (18759, 289, 3);
INSERT INTO `item_mods` VALUES (18760, 292, 3);
INSERT INTO `item_mods` VALUES (18762, 431, 1);
INSERT INTO `item_mods` VALUES (18769, 8, 1);
INSERT INTO `item_mods` VALUES (18769, 9, 1);
INSERT INTO `item_mods` VALUES (18770, 25, 4);
INSERT INTO `item_mods` VALUES (18770, 165, 3);
INSERT INTO `item_mods` VALUES (18773, 8, 2);
INSERT INTO `item_mods` VALUES (18773, 9, 1);
INSERT INTO `item_mods` VALUES (18786, 8, 10);
INSERT INTO `item_mods` VALUES (18786, 9, 10);
INSERT INTO `item_mods` VALUES (18786, 291, 5);
INSERT INTO `item_mods` VALUES (18811, 370, 1);
INSERT INTO `item_mods` VALUES (18831, 442, 1);
INSERT INTO `item_mods` VALUES (18832, 434, 3);
INSERT INTO `item_mods` VALUES (18833, 438, 3);
INSERT INTO `item_mods` VALUES (18833, 448, 3);
INSERT INTO `item_mods` VALUES (18834, 439, 3);
INSERT INTO `item_mods` VALUES (18834, 446, 3);
INSERT INTO `item_mods` VALUES (18839, 453, 2);
INSERT INTO `item_mods` VALUES (18839, 454, 30);
INSERT INTO `item_mods` VALUES (18840, 452, 4);
INSERT INTO `item_mods` VALUES (18841, 13, 5);
INSERT INTO `item_mods` VALUES (18841, 231, 2);
INSERT INTO `item_mods` VALUES (18841, 374, 10);
INSERT INTO `item_mods` VALUES (18843, 23, 9);
INSERT INTO `item_mods` VALUES (18843, 25, 9);
INSERT INTO `item_mods` VALUES (18843, 28, 5);
INSERT INTO `item_mods` VALUES (18847, 2, 27);
INSERT INTO `item_mods` VALUES (18847, 5, 27);
INSERT INTO `item_mods` VALUES (18847, 58, 7);
INSERT INTO `item_mods` VALUES (18847, 59, 7);
INSERT INTO `item_mods` VALUES (18847, 60, 7);
INSERT INTO `item_mods` VALUES (18847, 115, 7);
INSERT INTO `item_mods` VALUES (18847, 296, 7);
INSERT INTO `item_mods` VALUES (18848, 2, 29);
INSERT INTO `item_mods` VALUES (18848, 5, -29);
INSERT INTO `item_mods` VALUES (18848, 10, 5);
INSERT INTO `item_mods` VALUES (18849, 2, 31);
INSERT INTO `item_mods` VALUES (18849, 5, -31);
INSERT INTO `item_mods` VALUES (18849, 10, 6);

-- -------------------------------------------------------
-- Spirit Maul
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18853, 13, 2);
INSERT INTO `item_mods` VALUES (18853, 61, 3);
INSERT INTO `item_mods` VALUES (18853, 431, 1); -- Additional Effect: Light Damage

INSERT INTO `item_mods` VALUES (18854, 2, 30);
INSERT INTO `item_mods` VALUES (18854, 5, 30);
INSERT INTO `item_mods` VALUES (18854, 28, 4);
INSERT INTO `item_mods` VALUES (18854, 296, 4);
INSERT INTO `item_mods` VALUES (18856, 5, 30);
INSERT INTO `item_mods` VALUES (18856, 23, 9);
INSERT INTO `item_mods` VALUES (18856, 25, 9);
INSERT INTO `item_mods` VALUES (18856, 291, 1);
INSERT INTO `item_mods` VALUES (18857, 2, -20);
INSERT INTO `item_mods` VALUES (18857, 5, 20);
INSERT INTO `item_mods` VALUES (18857, 28, 10);
INSERT INTO `item_mods` VALUES (18857, 30, 10);
INSERT INTO `item_mods` VALUES (18858, 72, 2);
INSERT INTO `item_mods` VALUES (18858, 370, 1);
INSERT INTO `item_mods` VALUES (18860, 72, 3);
INSERT INTO `item_mods` VALUES (18860, 370, 1);
INSERT INTO `item_mods` VALUES (18861, 23, 5);
INSERT INTO `item_mods` VALUES (18861, 28, 5);
INSERT INTO `item_mods` VALUES (18862, 25, 5);
INSERT INTO `item_mods` VALUES (18862, 30, 5);
INSERT INTO `item_mods` VALUES (18864, 119, 1);
INSERT INTO `item_mods` VALUES (18865, 8, 3);
INSERT INTO `item_mods` VALUES (18865, 23, 8);
INSERT INTO `item_mods` VALUES (18865, 224, 2);
INSERT INTO `item_mods` VALUES (18866, 10, -1);
INSERT INTO `item_mods` VALUES (18867, 5, 15);
INSERT INTO `item_mods` VALUES (18867, 25, 4);

-- -------------------------------------------------------
-- Dweomer Maul
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18870, 366, 3); -- Main hand: DMG:38

INSERT INTO `item_mods` VALUES (18873, 2, 36);
INSERT INTO `item_mods` VALUES (18873, 8, 3);
INSERT INTO `item_mods` VALUES (18873, 10, 3);
INSERT INTO `item_mods` VALUES (18874, 2, 38);
INSERT INTO `item_mods` VALUES (18874, 8, 4);
INSERT INTO `item_mods` VALUES (18874, 10, 4);
INSERT INTO `item_mods` VALUES (18903, 2, 50);
INSERT INTO `item_mods` VALUES (18903, 5, 50);
INSERT INTO `item_mods` VALUES (18903, 8, 10);
INSERT INTO `item_mods` VALUES (18903, 10, 10);
INSERT INTO `item_mods` VALUES (18906, 374, 10);
INSERT INTO `item_mods` VALUES (18909, 374, 13);
INSERT INTO `item_mods` VALUES (18909, 375, 10);
INSERT INTO `item_mods` VALUES (18946, 25, 7);
INSERT INTO `item_mods` VALUES (18946, 242, 2);
INSERT INTO `item_mods` VALUES (18947, 8, 3);
INSERT INTO `item_mods` VALUES (18948, 8, 3);
INSERT INTO `item_mods` VALUES (18948, 9, 3);
INSERT INTO `item_mods` VALUES (18948, 68, -6);
INSERT INTO `item_mods` VALUES (18950, 12, 4);
INSERT INTO `item_mods` VALUES (18950, 28, 8);
INSERT INTO `item_mods` VALUES (18951, 230, 2);

-- -------------------------------------------------------
-- Faucheuse
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18952, 161, -5);

-- -------------------------------------------------------
-- Beluga
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18953, 2, 12); -- Max HP
INSERT INTO `item_mods` VALUES (18953, 5, 12); -- Max MP
INSERT INTO `item_mods` VALUES (18953, 431, 1); -- Additional Effect: Water Damage

-- -------------------------------------------------------
-- Terpsichore
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18989, 355, 29);

-- -------------------------------------------------------
-- Tupsimati
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18990, 355, 188);

-- -------------------------------------------------------
-- Conqueror
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18991, 355, 90);

-- -------------------------------------------------------
-- Glanzfaust
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18992, 355, 11);

-- -------------------------------------------------------
-- Yagrush
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18993, 30, 10);
INSERT INTO `item_mods` VALUES (18993, 355, 171);

-- -------------------------------------------------------
-- Laevateinn
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18994, 25, 30);
INSERT INTO `item_mods` VALUES (18994, 28, 20);
INSERT INTO `item_mods` VALUES (18994, 30, 10);
INSERT INTO `item_mods` VALUES (18994, 355, 186);

-- -------------------------------------------------------
-- Murgleis
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18995, 30, 10);
INSERT INTO `item_mods` VALUES (18995, 355, 44);

-- -------------------------------------------------------
-- Vajra
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18996, 355, 27);

-- -------------------------------------------------------
-- Burtgang
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18997, 27, 10);
INSERT INTO `item_mods` VALUES (18997, 161, -10);
INSERT INTO `item_mods` VALUES (18997, 355, 45);

-- -------------------------------------------------------
-- Liberator
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18998, 30, 20);
INSERT INTO `item_mods` VALUES (18998, 355, 106);

-- -------------------------------------------------------
-- Aymur
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (18999, 355, 74);

-- -------------------------------------------------------
-- Carnwenhan
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (19000, 30, 10);
INSERT INTO `item_mods` VALUES (19000, 355, 28);

-- -------------------------------------------------------
-- Gastraphetes
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (19001, 355, 217);

-- -------------------------------------------------------
-- Kogarasumaru
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (19002, 355, 154);
INSERT INTO `item_mods` VALUES (19002, 508, 15);

-- -------------------------------------------------------
-- Gastraphetes (75)
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (19001, 365, 5); -- Snap shot (Ranged delay decrease)
INSERT INTO `item_mods` VALUES (19001, 450, 10); -- Barrage accuracy

-- -------------------------------------------------------
-- Nagi
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (19003, 27, 10);
INSERT INTO `item_mods` VALUES (19003, 30, 10);
INSERT INTO `item_mods` VALUES (19003, 355, 138);

-- -------------------------------------------------------
-- Ryunohige
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (19004, 355, 122);

-- -------------------------------------------------------
-- Nirvana
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (19005, 25, 30);
INSERT INTO `item_mods` VALUES (19005, 346, 4);
INSERT INTO `item_mods` VALUES (19005, 355, 187);

-- -------------------------------------------------------
-- Tizona
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (19006, 30, 10);
INSERT INTO `item_mods` VALUES (19006, 355, 46);

-- -------------------------------------------------------
-- Death Penalty
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (19007, 355, 218);

-- -------------------------------------------------------
-- Kenkonken
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (19008, 355, 12);

INSERT INTO `item_mods` VALUES (19009, 9, 1);
INSERT INTO `item_mods` VALUES (19010, 9, 2);
INSERT INTO `item_mods` VALUES (19011, 2, 5);
INSERT INTO `item_mods` VALUES (19011, 5, 5);
INSERT INTO `item_mods` VALUES (19012, 2, 10);
INSERT INTO `item_mods` VALUES (19012, 5, 10);
INSERT INTO `item_mods` VALUES (19013, 8, 1);
INSERT INTO `item_mods` VALUES (19013, 10, 1);
INSERT INTO `item_mods` VALUES (19013, 25, 1);
INSERT INTO `item_mods` VALUES (19014, 8, 2);
INSERT INTO `item_mods` VALUES (19014, 10, 2);
INSERT INTO `item_mods` VALUES (19014, 25, 2);
INSERT INTO `item_mods` VALUES (19015, 2, 10);
INSERT INTO `item_mods` VALUES (19015, 5, 5);
INSERT INTO `item_mods` VALUES (19015, 13, 1);
INSERT INTO `item_mods` VALUES (19016, 2, 15);
INSERT INTO `item_mods` VALUES (19016, 5, 10);
INSERT INTO `item_mods` VALUES (19016, 13, 2);
INSERT INTO `item_mods` VALUES (19017, 5, 5);
INSERT INTO `item_mods` VALUES (19017, 13, 1);
INSERT INTO `item_mods` VALUES (19017, 14, 1);
INSERT INTO `item_mods` VALUES (19018, 5, 10);
INSERT INTO `item_mods` VALUES (19018, 12, 1);
INSERT INTO `item_mods` VALUES (19018, 13, 1);
INSERT INTO `item_mods` VALUES (19018, 14, 1);
INSERT INTO `item_mods` VALUES (19019, 25, 2);
INSERT INTO `item_mods` VALUES (19020, 25, 3);
INSERT INTO `item_mods` VALUES (19021, 306, 5);
INSERT INTO `item_mods` VALUES (19022, 2, 20);
INSERT INTO `item_mods` VALUES (19022, 8, 3);
INSERT INTO `item_mods` VALUES (19023, 5, 20);
INSERT INTO `item_mods` VALUES (19023, 27, -2);
INSERT INTO `item_mods` VALUES (19025, 288, 2);
INSERT INTO `item_mods` VALUES (19026, 2, 10);
INSERT INTO `item_mods` VALUES (19026, 5, 10);
INSERT INTO `item_mods` VALUES (19026, 9, 3);
INSERT INTO `item_mods` VALUES (19027, 165, 3);
INSERT INTO `item_mods` VALUES (19028, 5, 23);
INSERT INTO `item_mods` VALUES (19028, 168, 5);
INSERT INTO `item_mods` VALUES (19031, 7, 20);
INSERT INTO `item_mods` VALUES (19032, 7, 20);
INSERT INTO `item_mods` VALUES (19033, 7, 20);
INSERT INTO `item_mods` VALUES (19034, 7, 20);
INSERT INTO `item_mods` VALUES (19035, 7, 20);
INSERT INTO `item_mods` VALUES (19036, 7, 20);
INSERT INTO `item_mods` VALUES (19037, 7, 20);
INSERT INTO `item_mods` VALUES (19038, 7, 20);
INSERT INTO `item_mods` VALUES (19039, 23, 3);
INSERT INTO `item_mods` VALUES (19040, 2, 10);
INSERT INTO `item_mods` VALUES (19040, 27, 3);
INSERT INTO `item_mods` VALUES (19041, 73, 4);
INSERT INTO `item_mods` VALUES (19042, 71, 1);
INSERT INTO `item_mods` VALUES (19043, 23, 1);
INSERT INTO `item_mods` VALUES (19044, 25, 1);
INSERT INTO `item_mods` VALUES (19045, 5, 8);
INSERT INTO `item_mods` VALUES (19046, 5, 10);
INSERT INTO `item_mods` VALUES (19046, 11, 1);
INSERT INTO `item_mods` VALUES (19047, 5, 12);
INSERT INTO `item_mods` VALUES (19047, 11, 2);

-- -------------------------------------------------------
-- Reign Grip
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (19048, 13, 3); -- MND+3
INSERT INTO `item_mods` VALUES (19048, 14, 3); -- CHR+3

INSERT INTO `item_mods` VALUES (19049, 170, 1);
INSERT INTO `item_mods` VALUES (19051, 12, 1);
INSERT INTO `item_mods` VALUES (19051, 170, 1);

-- -------------------------------------------------------
-- Gastraphetes (80)
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (19070, 365, 5); -- Snap shot (Ranged delay decrease)
INSERT INTO `item_mods` VALUES (19070, 450, 15); -- Barrage accuracy

-- -------------------------------------------------------
-- Gastraphetes (85)
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (19090, 365, 5); -- Snap shot (Ranged delay decrease)
INSERT INTO `item_mods` VALUES (19090, 450, 20); -- Barrage accuracy

INSERT INTO `item_mods` VALUES (19100, 2, 16);
INSERT INTO `item_mods` VALUES (19100, 5, 16);
INSERT INTO `item_mods` VALUES (19100, 248, 2);
INSERT INTO `item_mods` VALUES (19103, 25, 1);
INSERT INTO `item_mods` VALUES (19104, 25, 2);
INSERT INTO `item_mods` VALUES (19105, 9, 1);
INSERT INTO `item_mods` VALUES (19106, 9, 2);
INSERT INTO `item_mods` VALUES (19107, 11, 4);
INSERT INTO `item_mods` VALUES (19107, 25, 4);
INSERT INTO `item_mods` VALUES (19107, 68, 4);
INSERT INTO `item_mods` VALUES (19108, 68, 5);
INSERT INTO `item_mods` VALUES (19111, 14, 4);
INSERT INTO `item_mods` VALUES (19111, 119, 2);
INSERT INTO `item_mods` VALUES (19112, 12, 4);
INSERT INTO `item_mods` VALUES (19113, 68, 8);
INSERT INTO `item_mods` VALUES (19113, 227, 2);
INSERT INTO `item_mods` VALUES (19114, 2, 8);
INSERT INTO `item_mods` VALUES (19114, 10, 2);
INSERT INTO `item_mods` VALUES (19119, 26, 6);
INSERT INTO `item_mods` VALUES (19120, 14, 2);
INSERT INTO `item_mods` VALUES (19121, 23, 3);
INSERT INTO `item_mods` VALUES (19121, 289, 3);
INSERT INTO `item_mods` VALUES (19122, 11, 5);
INSERT INTO `item_mods` VALUES (19122, 26, 11);
INSERT INTO `item_mods` VALUES (19124, 2, 10);
INSERT INTO `item_mods` VALUES (19124, 11, 3);
INSERT INTO `item_mods` VALUES (19124, 14, -5);
INSERT INTO `item_mods` VALUES (19124, 30, 3);
INSERT INTO `item_mods` VALUES (19127, 26, 7);
INSERT INTO `item_mods` VALUES (19150, 5, 8);
INSERT INTO `item_mods` VALUES (19150, 23, 7);
INSERT INTO `item_mods` VALUES (19151, 2, 10);
INSERT INTO `item_mods` VALUES (19151, 9, 2);
INSERT INTO `item_mods` VALUES (19151, 10, 2);
INSERT INTO `item_mods` VALUES (19152, 2, 12);
INSERT INTO `item_mods` VALUES (19152, 9, 3);
INSERT INTO `item_mods` VALUES (19152, 10, 3);
INSERT INTO `item_mods` VALUES (19153, 23, 20);
INSERT INTO `item_mods` VALUES (19153, 25, 4);
INSERT INTO `item_mods` VALUES (19153, 30, 3);
INSERT INTO `item_mods` VALUES (19154, 25, 4);
INSERT INTO `item_mods` VALUES (19155, 8, 3);
INSERT INTO `item_mods` VALUES (19156, 2, 10);
INSERT INTO `item_mods` VALUES (19156, 5, 10);
INSERT INTO `item_mods` VALUES (19157, 2, 5);
INSERT INTO `item_mods` VALUES (19157, 5, 5);
INSERT INTO `item_mods` VALUES (19158, 110, 5);
INSERT INTO `item_mods` VALUES (19158, 227, 2);

-- -------------------------------------------------------
-- Estramacon
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (19160, 431, 1); -- Additional Effect: TP Drain

-- -------------------------------------------------------
-- Nightfall
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (19163, 368, 100); -- Regain

INSERT INTO `item_mods` VALUES (19173, 369, 1);

-- -------------------------------------------------------
-- Tiny Tathlum
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (19186, 2, 3); -- HP+3
INSERT INTO `item_mods` VALUES (19186, 23, 1); -- Attack+1

INSERT INTO `item_mods` VALUES (19202, 26, -4);
INSERT INTO `item_mods` VALUES (19203, 14, 3);
INSERT INTO `item_mods` VALUES (19206, 26, 6);
INSERT INTO `item_mods` VALUES (19207, 26, 8);
INSERT INTO `item_mods` VALUES (19208, 26, 10);
INSERT INTO `item_mods` VALUES (19211, 23, 10);
INSERT INTO `item_mods` VALUES (19212, 9, 1);
INSERT INTO `item_mods` VALUES (19212, 23, 4);
INSERT INTO `item_mods` VALUES (19212, 25, 4);
INSERT INTO `item_mods` VALUES (19213, 2, 15);
INSERT INTO `item_mods` VALUES (19213, 5, 15);
INSERT INTO `item_mods` VALUES (19213, 27, -2);
INSERT INTO `item_mods` VALUES (19213, 73, 2);
INSERT INTO `item_mods` VALUES (19215, 24, 15);
INSERT INTO `item_mods` VALUES (19216, 26, 10);
INSERT INTO `item_mods` VALUES (19216, 27, -5);
INSERT INTO `item_mods` VALUES (19216, 289, 5);
INSERT INTO `item_mods` VALUES (19217, 24, 8);
INSERT INTO `item_mods` VALUES (19218, 26, 8);

-- -------------------------------------------------------
-- Iwatsubute
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (19219, 2, 10);
INSERT INTO `item_mods` VALUES (19219, 10, 1);

INSERT INTO `item_mods` VALUES (19220, 25, 2);
INSERT INTO `item_mods` VALUES (19220, 68, 2);
INSERT INTO `item_mods` VALUES (19221, 11, 1);
INSERT INTO `item_mods` VALUES (19222, 26, 3);
INSERT INTO `item_mods` VALUES (19223, 2, 8);
INSERT INTO `item_mods` VALUES (19223, 57, 3);
INSERT INTO `item_mods` VALUES (19226, 11, 2);
INSERT INTO `item_mods` VALUES (19227, 11, 3);
INSERT INTO `item_mods` VALUES (19230, 13, 4);
INSERT INTO `item_mods` VALUES (19231, 11, 1);
INSERT INTO `item_mods` VALUES (19231, 27, -1);
INSERT INTO `item_mods` VALUES (19232, 26, 3);
INSERT INTO `item_mods` VALUES (19235, 24, -20);
INSERT INTO `item_mods` VALUES (19235, 26, -20);
INSERT INTO `item_mods` VALUES (19235, 28, 5);
INSERT INTO `item_mods` VALUES (19235, 30, 5);
INSERT INTO `item_mods` VALUES (19236, 24, 10);
INSERT INTO `item_mods` VALUES (19237, 9, 1);
INSERT INTO `item_mods` VALUES (19238, 12, 1);
INSERT INTO `item_mods` VALUES (19238, 13, 1);
INSERT INTO `item_mods` VALUES (19239, 8, 1);
INSERT INTO `item_mods` VALUES (19239, 25, 3);
INSERT INTO `item_mods` VALUES (19240, 27, 1);
INSERT INTO `item_mods` VALUES (19241, 11, 2);
INSERT INTO `item_mods` VALUES (19241, 27, -2);
INSERT INTO `item_mods` VALUES (19242, 27, 2);
INSERT INTO `item_mods` VALUES (19243, 5, 3);
INSERT INTO `item_mods` VALUES (19243, 30, 1);

-- -------------------------------------------------------
-- Jinx Ampulla
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (19245, 2, -15); -- HP-15
-- [NOT CODED] INSERT INTO `item_mods` VALUES (19245, 1, 1); -- Magic critical hit rate +1%

-- -------------------------------------------------------
-- Tantra Tathlum
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (19254, 8, 3); -- STR
INSERT INTO `item_mods` VALUES (19254, 10, 3); -- VIT
INSERT INTO `item_mods` VALUES (19254, 25, 6); -- accuracy

INSERT INTO `item_mods` VALUES (19271, 1, 10);
INSERT INTO `item_mods` VALUES (19273, 68, 5);
INSERT INTO `item_mods` VALUES (19273, 230, 2);
INSERT INTO `item_mods` VALUES (19276, 68, 1);
INSERT INTO `item_mods` VALUES (19277, 25, 1);
INSERT INTO `item_mods` VALUES (19278, 27, -5);
INSERT INTO `item_mods` VALUES (19280, 68, 5);
INSERT INTO `item_mods` VALUES (19280, 163, -12);
INSERT INTO `item_mods` VALUES (19281, 68, 2);
INSERT INTO `item_mods` VALUES (19285, 8,3);
INSERT INTO `item_mods` VALUES (19285, 11,3);
INSERT INTO `item_mods` VALUES (19286, 8,4);
INSERT INTO `item_mods` VALUES (19286, 11,4);

-- -------------------------------------------------------
-- Gastraphetes (90)
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (19622, 365, 5); -- Snap shot (Ranged delay decrease)
INSERT INTO `item_mods` VALUES (19622, 420, 25); -- Barrage accuracy

-- -------------------------------------------------------
-- Gastraphetes (95)
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (19720, 365, 5); -- Snap shot (Ranged delay decrease)
INSERT INTO `item_mods` VALUES (19720, 420, 30); -- Barrage accuracy

-- -------------------------------------------------------
-- Gastraphetes (99)
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (19829, 365, 5); -- Snap shot (Ranged delay decrease)
INSERT INTO `item_mods` VALUES (19829, 420, 35); -- Barrage accuracy


-- -------------------------------------------------------
-- Redemption
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (19859, 8, 13); -- STR+13
INSERT INTO `item_mods` VALUES (19859, 13, 13); -- MND+13

-- -------------------------------------------------------
-- Gastraphetes (Afterglow)
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (19958, 365, 5); -- Snap shot (Ranged delay decrease)
INSERT INTO `item_mods` VALUES (19958, 450, 35); -- Barrage accuracy

-- -------------------------------------------------------
-- Sowilo Claymore
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (20781, 2, 5); -- HP+5

-- -------------------------------------------------------
-- Uruz Blade +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (20784, 23, 9); -- Attack+9
INSERT INTO `item_mods` VALUES (20784, 29, 5); -- "Magic Def. Bonus"+5

-- -------------------------------------------------------
-- Matre Bell
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (21460, 5, 5); -- MP+5

-- -------------------------------------------------------
-- Sakonji Haidate
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27174, 1, 89);
INSERT INTO `item_mods` VALUES (27174, 2, 23);
INSERT INTO `item_mods` VALUES (27174, 8, 21);
INSERT INTO `item_mods` VALUES (27174, 10, 12);
INSERT INTO `item_mods` VALUES (27174, 11, 9);
INSERT INTO `item_mods` VALUES (27174, 12, 17);
INSERT INTO `item_mods` VALUES (27174, 13, 10);
INSERT INTO `item_mods` VALUES (27174, 14, 8);
INSERT INTO `item_mods` VALUES (27174, 23, 15);
INSERT INTO `item_mods` VALUES (27174, 29, 1);
INSERT INTO `item_mods` VALUES (27174, 31, 51);
INSERT INTO `item_mods` VALUES (27174, 68, 25);
INSERT INTO `item_mods` VALUES (27174, 384, 51);
INSERT INTO `item_mods` VALUES (27174, 508, 35);

INSERT INTO `item_mods` VALUES (27651, 374, 11);

-- -------------------------------------------------------
-- Ate's Mask
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27658, 1, 19); -- DEF:19
INSERT INTO `item_mods` VALUES (27658, 8, 2); -- STR+2
INSERT INTO `item_mods` VALUES (27658, 10, 2); -- VIT+2
INSERT INTO `item_mods` VALUES (27658, 288, 1); -- "Double Attack"+1%

-- -------------------------------------------------------
-- Idi's Mask
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27659, 1, 16); -- DEF:16
INSERT INTO `item_mods` VALUES (27659, 23, 2); -- Attack+2
INSERT INTO `item_mods` VALUES (27659, 289, 1); -- "Subtle Blow"+1
INSERT INTO `item_mods` VALUES (27659, 302, 1); -- "Triple Attack"+1%

-- -------------------------------------------------------
-- Genta Kabuto
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27660, 1, 17); -- DEF:17
INSERT INTO `item_mods` VALUES (27660, 9, 2); -- DEX+2
INSERT INTO `item_mods` VALUES (27660, 11, 2); -- AGI+2
INSERT INTO `item_mods` VALUES (27660, 23, 2); -- Attack+2
INSERT INTO `item_mods` VALUES (27660, 73, 1); -- "Store TP"+1

-- -------------------------------------------------------
-- Namru's Tiara
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27661, 1, 16); -- DEF:16
INSERT INTO `item_mods` VALUES (27661, 5, 10); -- MP+10
INSERT INTO `item_mods` VALUES (27661, 113, 2); -- Enhancing magic skill +2

-- -------------------------------------------------------
-- Neit's Crown
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27662, 1, 15); -- DEF:15
INSERT INTO `item_mods` VALUES (27662, 12, 2); -- INT+2
INSERT INTO `item_mods` VALUES (27662, 13, 2); -- MND+2
INSERT INTO `item_mods` VALUES (27662, 30, 1); -- Magic Accuracy+1

-- -------------------------------------------------------
-- Slime Cap
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27756, 2, 3); -- HP+3
INSERT INTO `item_mods` VALUES (27756, 1, 1); -- DEF:1

-- -------------------------------------------------------
-- Ate's Cuirass
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27798, 1, 36); -- DEF:36
INSERT INTO `item_mods` VALUES (27798, 8, 2); -- STR+2
INSERT INTO `item_mods` VALUES (27798, 9, 2); -- DEX+2
INSERT INTO `item_mods` VALUES (27798, 25, 2); -- Accuracy+2
INSERT INTO `item_mods` VALUES (27798, 23, 2); -- Attack+2
INSERT INTO `item_mods` VALUES (27798, 289, 1); -- "Subtle Blow"+1

-- -------------------------------------------------------
-- Idi's Jerkin
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27799, 1, 32); -- DEF:32
INSERT INTO `item_mods` VALUES (27799, 25, 3); -- Accuracy+3
INSERT INTO `item_mods` VALUES (27799, 26, 3); -- Ranged Accuracy+3
INSERT INTO `item_mods` VALUES (27799, 289, 2); -- "Subtle Blow"+2
INSERT INTO `item_mods` VALUES (27799, 302, 1); -- "Triple Attack"+1%

-- -------------------------------------------------------
-- Genta Hara-Ate
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27800, 1, 33); -- DEF:33
INSERT INTO `item_mods` VALUES (27800, 8, 3); -- STR+3
INSERT INTO `item_mods` VALUES (27800, 9, 3); -- DEX+3
INSERT INTO `item_mods` VALUES (27800, 10, 3); -- VIT+3
INSERT INTO `item_mods` VALUES (27800, 23, 3); -- Attack+3
INSERT INTO `item_mods` VALUES (27800, 289, 2); -- "Subtle Blow"+2

-- -------------------------------------------------------
-- Namru's Jubbah
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27801, 1, 30); -- DEF:30
INSERT INTO `item_mods` VALUES (27801, 3, 1); -- HP+1%
INSERT INTO `item_mods` VALUES (27801, 6, 1); -- MP+1%
INSERT INTO `item_mods` VALUES (27801, 8, 2); -- STR+2
INSERT INTO `item_mods` VALUES (27801, 12, 2); -- INT+2
INSERT INTO `item_mods` VALUES (27801, 13, 2); -- MND+2
INSERT INTO `item_mods` VALUES (27801, 14, 2); -- CHR+2
INSERT INTO `item_mods` VALUES (27801, 384, 10); -- Haste+1%

-- -------------------------------------------------------
-- Neit's Coat
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27802, 1, 31); -- DEF:31
INSERT INTO `item_mods` VALUES (27802, 30, 2); -- Magic Accuracy+2
INSERT INTO `item_mods` VALUES (27802, 28, 2); -- "Magic Atk. Bonus"+2
INSERT INTO `item_mods` VALUES (27802, 114, 2); -- Enfeebling magic skill +2
INSERT INTO `item_mods` VALUES (27802, 113, 2); -- Elemental magic skill +2

-- -------------------------------------------------------
-- Ate's Gauntlets
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27938, 1, 12); -- DEF:12
INSERT INTO `item_mods` VALUES (27938, 8, 2); -- STR+2
INSERT INTO `item_mods` VALUES (27938, 23, 2); -- Attack+2
INSERT INTO `item_mods` VALUES (27938, 28, 1); -- "Magic Atk. Bonus"+1
INSERT INTO `item_mods` VALUES (27938, 27, 1); -- Enmity+1

-- -------------------------------------------------------
-- Idi's Gloves
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27939, 1, 10); -- DEF:10
INSERT INTO `item_mods` VALUES (27939, 11, 2); -- AGI+2
INSERT INTO `item_mods` VALUES (27939, 26, 2); -- Ranged Accuracy+2
INSERT INTO `item_mods` VALUES (27939, 24, 2); -- Ranged Attack+2
INSERT INTO `item_mods` VALUES (27939, 105, 2); -- Marksmanship skill +2

-- -------------------------------------------------------
-- Genta Gote
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27940, 1, 11); -- DEF:11
INSERT INTO `item_mods` VALUES (27940, 9, 2); -- DEX+2
INSERT INTO `item_mods` VALUES (27940, 11, 2); -- AGI+2
INSERT INTO `item_mods` VALUES (27940, 25, 2); -- Accuracy+2
INSERT INTO `item_mods` VALUES (27940, 26, 2); -- Ranged Accuracy+2
INSERT INTO `item_mods` VALUES (27940, 68, 2); -- Evasion+2

-- -------------------------------------------------------
-- Namru's Dastanas
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27941, 1, 11); -- DEF:11
INSERT INTO `item_mods` VALUES (27941, 8, 2); -- STR+2
INSERT INTO `item_mods` VALUES (27941, 11, 2); -- AGI+2
INSERT INTO `item_mods` VALUES (27941, 25, 2); -- Accuracy+2
INSERT INTO `item_mods` VALUES (27941, 23, 2); -- Attack+2
INSERT INTO `item_mods` VALUES (27941, 112, 2); -- Healing magic skill +2

-- -------------------------------------------------------
-- Neit's Cuffs
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (27942, 1, 10); -- DEF:10
INSERT INTO `item_mods` VALUES (27942, 8, 2); -- STR+2
INSERT INTO `item_mods` VALUES (27942, 9, 2); -- DEX+2
INSERT INTO `item_mods` VALUES (27942, 28, 1); -- "Magic Atk. Bonus"+1

-- -------------------------------------------------------
-- Abatteur Subligar
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28068, 1, 50); -- def 50
INSERT INTO `item_mods` VALUES (28068, 8, 10); -- str 10
INSERT INTO `item_mods` VALUES (28068, 9, 10); -- dex 10
INSERT INTO `item_mods` VALUES (28068, 23, 14); -- attack 14
INSERT INTO `item_mods` VALUES (28068, 25, 7); -- Accuracy+7
INSERT INTO `item_mods` VALUES (28068, 289, 5); -- subtle blow+5
INSERT INTO `item_mods` VALUES (28068, 384, 51); -- haste 5%

-- -------------------------------------------------------
-- Ate's Flanchard
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28081, 1, 27); -- DEF:27
INSERT INTO `item_mods` VALUES (28081, 23, 2); -- Attack+2
INSERT INTO `item_mods` VALUES (28081, 73, 2); -- "Store TP"+2
INSERT INTO `item_mods` VALUES (28081, 288, 1); -- "Double Attack"+1%

-- -------------------------------------------------------
-- Idi's Trousers
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28082, 1, 23); -- DEF:23
INSERT INTO `item_mods` VALUES (28082, 9, 2); -- DEX+2
INSERT INTO `item_mods` VALUES (28082, 14, 2); -- CHR+2
INSERT INTO `item_mods` VALUES (28082, 25, 2); -- Accuracy+2
INSERT INTO `item_mods` VALUES (28082, 73, 1); -- "Store TP"+1

-- -------------------------------------------------------
-- Genta-no-Hakama
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28083, 1, 24); -- DEF:24
INSERT INTO `item_mods` VALUES (28083, 8, 2); -- STR+2
INSERT INTO `item_mods` VALUES (28083, 9, 2); -- DEX+2
INSERT INTO `item_mods` VALUES (28083, 11, 2); -- AGI+2
-- [NOT CODED] Automaton: STR+2 DEX+2 AGI+2

-- -------------------------------------------------------
-- Namru's Shalwar
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28084, 1, 20); -- DEF:20
INSERT INTO `item_mods` VALUES (28084, 5, 8); -- MP+8
INSERT INTO `item_mods` VALUES (28084, 112, 2); -- Healing magic skill +2
INSERT INTO `item_mods` VALUES (28084, 114, 2); -- Enfeebling magic skill +2

-- -------------------------------------------------------
-- Neit's Slops
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28085, 1, 21); -- DEF:21
INSERT INTO `item_mods` VALUES (28085, 3, 8); -- HP+8
INSERT INTO `item_mods` VALUES (28085, 5, 8); -- MP+8
INSERT INTO `item_mods` VALUES (28085, 13, 2); -- MND+2
INSERT INTO `item_mods` VALUES (28085, 170, 1); -- Enhances "Fast Cast" effect

-- -------------------------------------------------------
-- Ate's Sollerets
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28218, 1, 12); -- DEF:12
INSERT INTO `item_mods` VALUES (28218, 10, 2); -- VIT+2
INSERT INTO `item_mods` VALUES (28218, 12, 2); -- INT+2
INSERT INTO `item_mods` VALUES (28218, 23, 2); -- Attack+2
INSERT INTO `item_mods` VALUES (28218, 288, 1); -- "Double Attack"+1%

-- -------------------------------------------------------
-- Idi's Ledelsens
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28219, 1, 10); -- DEF:10
INSERT INTO `item_mods` VALUES (28219, 9, 2); -- DEX+2
INSERT INTO `item_mods` VALUES (28219, 10, 2); -- VIT+2
INSERT INTO `item_mods` VALUES (28219, 11, 2); -- AGI+2
INSERT INTO `item_mods` VALUES (28219, 68, 2); -- Evasion+2
-- [NOT CODED] Pet: Evasion+2

-- -------------------------------------------------------
-- Genta Sune-Ate
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28220, 1, 12); -- DEF:12
INSERT INTO `item_mods` VALUES (28220, 8, 2); -- STR+2
INSERT INTO `item_mods` VALUES (28220, 23, 2); -- Attack+2
INSERT INTO `item_mods` VALUES (28220, 68, 2); -- Evasion+2

-- -------------------------------------------------------
-- Namru's Crackows
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28221, 1, 9); -- DEF:9
INSERT INTO `item_mods` VALUES (28221, 14, 2); -- CHR+2
INSERT INTO `item_mods` VALUES (28221, 119, 1); -- Singing skill +1
INSERT INTO `item_mods` VALUES (28221, 120, 2); -- String instrument skill +2

-- -------------------------------------------------------
-- Neit's Pigaches
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28222, 1, 9); -- DEF:9
INSERT INTO `item_mods` VALUES (28222, 8, 2); -- STR+2
INSERT INTO `item_mods` VALUES (28222, 12, 2); -- INT+2
INSERT INTO `item_mods` VALUES (28222, 13, 2); -- MND+2
INSERT INTO `item_mods` VALUES (28222, 23, 2); -- Attack+2
INSERT INTO `item_mods` VALUES (28222, 25, 2); -- Accuracy+2

-- -------------------------------------------------------
-- Manibozho Boots
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28339, 1, 51); -- DEF+51
INSERT INTO `item_mods` VALUES (28339, 2, 7); -- HP+7
INSERT INTO `item_mods` VALUES (28339, 5, 45); -- MP+45
INSERT INTO `item_mods` VALUES (28339, 9, 8); -- DEX+8
INSERT INTO `item_mods` VALUES (28339, 11, 17); -- AGI+17
INSERT INTO `item_mods` VALUES (28339, 14, 12); -- CHR+12
INSERT INTO `item_mods` VALUES (28339, 23, 12); -- Attack+12
INSERT INTO `item_mods` VALUES (28339, 68, 36); -- Evasion+36
INSERT INTO `item_mods` VALUES (28339, 29, 2); -- "Magic Def. Bonus"+2
INSERT INTO `item_mods` VALUES (28339, 31, 49); -- Magic Evasion+49
INSERT INTO `item_mods` VALUES (28339, 288, 2); -- "Double Attack"+2%
INSERT INTO `item_mods` VALUES (28339, 384, 40); -- Haste+4%

-- -------------------------------------------------------
-- Bokwus Boots
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28340, 1, 46); -- DEF+46
INSERT INTO `item_mods` VALUES (28340, 2, 7); -- HP+7
INSERT INTO `item_mods` VALUES (28340, 5, 12); -- MP+12
INSERT INTO `item_mods` VALUES (28340, 9, 1); -- DEX+1
INSERT INTO `item_mods` VALUES (28340, 11, 12); -- AGI+12
INSERT INTO `item_mods` VALUES (28340, 12, 2); -- INT+2
INSERT INTO `item_mods` VALUES (28340, 13, 3); -- MND+3
INSERT INTO `item_mods` VALUES (28340, 14, 13); -- CHR+13
INSERT INTO `item_mods` VALUES (28340, 121, 10); -- Wind instrument skill +10
INSERT INTO `item_mods` VALUES (28340, 30, 7); -- Magic Accuracy+7
INSERT INTO `item_mods` VALUES (28340, 68, 28); -- Evasion+28
INSERT INTO `item_mods` VALUES (28340, 29, 3); -- "Magic Def. Bonus"+3
INSERT INTO `item_mods` VALUES (28340, 384, 30); -- Haste+3%
INSERT INTO `item_mods` VALUES (28340, 31, 76); -- Magic Evasion+76
INSERT INTO `item_mods` VALUES (28340, 455, 6); -- Song casting time -6%

-- -------------------------------------------------------
-- Fiend Torque
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28390, 2, 5); -- HP+5

-- -------------------------------------------------------
-- Eddy Necklace
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28401, 5, 20); -- MP+20
INSERT INTO `item_mods` VALUES (28401, 30, 5); -- Magic Accuracy+5
INSERT INTO `item_mods` VALUES (28401, 28, 11); -- "Magic Atk. Bonus"+11

-- -------------------------------------------------------
-- Asperity Necklace
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28402, 23, 8); -- Attack+8
INSERT INTO `item_mods` VALUES (28402, 73, 3); -- "Store TP"+3
INSERT INTO `item_mods` VALUES (28402, 288, 2); -- "Double Attack"+2%

-- -------------------------------------------------------
-- Inq. Bead Necklace
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28403, 1, 13); -- DEF:13
INSERT INTO `item_mods` VALUES (28403, 2, 55); -- HP+55
INSERT INTO `item_mods` VALUES (28403, 29, 8); -- "Magic Def. Bonus"+8

-- -------------------------------------------------------
-- Ej Necklace
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28404, 25, 15); -- Accuracy+15
INSERT INTO `item_mods` VALUES (28404, 26, 15); -- Ranged Accuracy+15
INSERT INTO `item_mods` VALUES (28404, 68, 15); -- Evasion+15

-- -------------------------------------------------------
-- Ej Necklace +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28405, 25, 16); -- Accuracy+16
INSERT INTO `item_mods` VALUES (28405, 26, 16); -- Ranged Accuracy+16
INSERT INTO `item_mods` VALUES (28405, 68, 16); -- Evasion+16


-- -------------------------------------------------------
-- Hurch'lan Sash
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28462, 1, 13); -- DEF:13
INSERT INTO `item_mods` VALUES (28462, 25, 15); -- Accuracy+15
INSERT INTO `item_mods` VALUES (28462, 384, 71); -- Haste+7%
INSERT INTO `item_mods` VALUES (28462, 315, 10); -- Pet: Accuracy+10
-- [NOT CODED] Pet: Haste+5%
-- [NOT CODED] Pet: Ranged Accuracy+10

-- -------------------------------------------------------
-- Zoran's Belt
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28463, 1, 10); -- DEF:10
INSERT INTO `item_mods` VALUES (28463, 9, 7); -- DEX+7
INSERT INTO `item_mods` VALUES (28463, 23, 14); -- Attack+14
INSERT INTO `item_mods` VALUES (28463, 384, 71); -- Haste+7%

-- -------------------------------------------------------
-- Pya'ekue Belt
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28464, 1, 14); -- DEF:14
INSERT INTO `item_mods` VALUES (28464, 384, 92); -- Haste+9%

-- -------------------------------------------------------
-- Pya'ekue Belt +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28465, 1, 15); -- DEF:15
INSERT INTO `item_mods` VALUES (28465, 384, 102); -- Haste+10%

-- -------------------------------------------------------
-- Slime Earring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28511, 2, 1); -- HP+1

-- -------------------------------------------------------
-- Steelflash Earring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28520, 25, 8); -- Accuracy+8
INSERT INTO `item_mods` VALUES (28520, 73, 1); -- "Store TP"+1

-- -------------------------------------------------------
-- Bladeborn Earring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28521, 23, 8); -- Attack+8
INSERT INTO `item_mods` VALUES (28521, 73, 1); -- "Store TP"+1

-- -------------------------------------------------------
-- Dudgeon Earring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28522, 23, 8); -- Attack+8
INSERT INTO `item_mods` VALUES (28522, 289, 1); -- "Subtle Blow"+1

-- -------------------------------------------------------
-- Heartseeker Earring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28523, 25, 8); -- Accuracy+8
INSERT INTO `item_mods` VALUES (28523, 289, 1); -- "Subtle Blow"+1

-- -------------------------------------------------------
-- Lifestorm Earring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28524, 13, 4); -- MND+4
INSERT INTO `item_mods` VALUES (28524, 27, -1); -- Enmity-1

-- -------------------------------------------------------
-- Psystorm Earring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28525, 12, 4); -- INT+4
INSERT INTO `item_mods` VALUES (28525, 27, -1); -- Enmity-1

-- -------------------------------------------------------
-- Tati Earring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28526, 25, 5); -- Accuracy+5
INSERT INTO `item_mods` VALUES (28526, 23, 15); -- Attack+15
INSERT INTO `item_mods` VALUES (28526, 68, -7); -- Evasion-7

-- -------------------------------------------------------
-- Tati Earring +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28527, 25, 6); -- Accuracy+6
INSERT INTO `item_mods` VALUES (28527, 23, 16); -- Attack+16
INSERT INTO `item_mods` VALUES (28527, 68, -8); -- Evasion-8

-- -------------------------------------------------------
-- K'ayres Ring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28579, 2, 70); -- HP+70
INSERT INTO `item_mods` VALUES (28579, 23, 5); -- Attack+5
INSERT INTO `item_mods` VALUES (28579, 73, 5); -- "Store TP"+5

-- -------------------------------------------------------
-- Sangoma Ring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28580, 5, 70); -- MP+70
INSERT INTO `item_mods` VALUES (28580, 30, 8); -- Magic Accuracy+8
INSERT INTO `item_mods` VALUES (28580, 27, -2); -- Enmity-2

-- -------------------------------------------------------
-- Beeline Ring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28581, 2, 50); -- HP+50
INSERT INTO `item_mods` VALUES (28581, 25, 6); -- Accuracy+6
INSERT INTO `item_mods` VALUES (28581, 26, 6); -- Ranged Accuracy+6
INSERT INTO `item_mods` VALUES (28581, 68, 6); -- Evasion+6
INSERT INTO `item_mods` VALUES (28581, 289, 6); -- "Subtle Blow"+6

-- -------------------------------------------------------
-- Artificer's Ring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28587, 144, 1); -- Woodworking Success Rate 1%
INSERT INTO `item_mods` VALUES (28587, 145, 1); -- Smithing Success Rate 1%
INSERT INTO `item_mods` VALUES (28587, 146, 1); -- Goldsmithing Success Rate 1%
INSERT INTO `item_mods` VALUES (28587, 147, 1); -- Clothcraft Success Rate 1%
INSERT INTO `item_mods` VALUES (28587, 148, 1); -- Leathercraft Success Rate 1%
INSERT INTO `item_mods` VALUES (28587, 149, 1); -- Bonecraft Success Rate 1%
INSERT INTO `item_mods` VALUES (28587, 150, 1); -- Alchemy Success Rate 1%
INSERT INTO `item_mods` VALUES (28587, 151, 1); -- Cooking Success Rate 1%

-- -------------------------------------------------------
--  Vespid Mantle
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28641, 1, 20); -- DEF:20
INSERT INTO `item_mods` VALUES (28641, 23, 35); -- Attack+35
INSERT INTO `item_mods` VALUES (28641, 48, 10); -- Weapon Skill Accuracy+10

-- -------------------------------------------------------
-- Contriver's Cape
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28642, 1, 17); -- DEF:17
INSERT INTO `item_mods` VALUES (28642, 29, 4); -- "Magic Def. Bonus" +4
INSERT INTO `item_mods` VALUES (28642, 68, 10); -- Evasion+10
-- [NOT CODED] Automaton: Adds "Regen" and "Refresh" effects

-- -------------------------------------------------------
-- Refraction Cape
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28643, 1, 16); -- DEF:16
INSERT INTO `item_mods` VALUES (28643, 12, 8); -- INT+8
INSERT INTO `item_mods` VALUES (28643, 13, 8); -- MND+8
INSERT INTO `item_mods` VALUES (28643, 14, 8); -- CHR+8
INSERT INTO `item_mods` VALUES (28643, 30, 3); -- Magic accuracy+3
-- [NOT CODED] Automaton: INT+8 MND+8 Magic Accuracy+3

-- -------------------------------------------------------
-- Ogapepo Cape
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28644, 1, 19); -- DEF:19
INSERT INTO `item_mods` VALUES (28644, 30, 10); -- Magic accuracy+10

-- -------------------------------------------------------
-- Ogapepo Cape +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28645, 1, 20); -- DEF:20
INSERT INTO `item_mods` VALUES (28645, 30, 11); -- Magic accuracy+11

-- -------------------------------------------------------
-- Slime Shield
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28655, 2, 3); -- HP+3
INSERT INTO `item_mods` VALUES (28655, 1, 1); -- DEF:1

-- -------------------------------------------------------
-- Steadfast Shield
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28663, 1, 50); -- DEF:50
INSERT INTO `item_mods` VALUES (28663, 5, 60); -- MP+60
INSERT INTO `item_mods` VALUES (28663, 109, 85); -- Shield skill +85
INSERT INTO `item_mods` VALUES (28663, 160, -7); -- Damage taken -7%

-- -------------------------------------------------------
-- Killedar Shield
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28664, 1, 60); -- DEF:60
INSERT INTO `item_mods` VALUES (28664, 2, 80); -- HP+80
INSERT INTO `item_mods` VALUES (28664, 10, 10); -- VIT+10
INSERT INTO `item_mods` VALUES (28664, 29, 5); -- "Magic Def. Bonus" +5
INSERT INTO `item_mods` VALUES (28664, 109, 100); -- Shield skill +100
INSERT INTO `item_mods` VALUES (28664, 161, -7); -- Physical damage taken -7%

-- -------------------------------------------------------
-- Killedar Shield +1
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28665, 1, 61); -- DEF:61
INSERT INTO `item_mods` VALUES (28665, 2, 85); -- HP+85
INSERT INTO `item_mods` VALUES (28665, 10, 11); -- VIT+11
INSERT INTO `item_mods` VALUES (28665, 29, 6); -- "Magic Def. Bonus" +6
INSERT INTO `item_mods` VALUES (28665, 109, 106); -- Shield skill +106
INSERT INTO `item_mods` VALUES (28665, 161, -8); -- Physical damage taken -8%

-- -------------------------------------------------------
-- Leafkin Shield
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (28670, 1, 1); -- DEF:1

-- -------------------------------------------------------
-- Roundel Earring
-- -------------------------------------------------------
INSERT INTO `item_mods` VALUES (16002, 374, 5);
INSERT INTO `item_mods` VALUES (16002, 491, 5);
