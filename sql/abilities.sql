-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http//www.phpmyadmin.net
--
-- Serveur localhost
-- Généré le  Dim 19 Juin 2011 à 1654
-- Version du serveur 6.0.0
-- Version de PHP 5.2.9-2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données `dspdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `abilities`
--

DROP TABLE IF EXISTS `abilities`;
CREATE TABLE IF NOT EXISTS `abilities` (
  `abilityId` tinyint(3) unsigned NOT NULL,
  `name` tinytext,
  `job` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `validTarget` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `recastTime` smallint(5) unsigned NOT NULL DEFAULT '0',
  `animation` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `range` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `isAOE` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`abilityId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=56;

--
-- Contenu de la table `abilities`
--

INSERT INTO `abilities` VALUES (0, 'mighty_strikes', 1, 0, 1, 7200, 33, 20, 0);
INSERT INTO `abilities` VALUES (1, 'hundred_fists', 2, 0, 1, 7200, 34, 20, 0);
INSERT INTO `abilities` VALUES (2, 'benediction', 3, 0, 1, 7200, 35, 20, 1);
INSERT INTO `abilities` VALUES (3, 'manafont', 4, 0, 1, 7200, 36, 20, 0);
INSERT INTO `abilities` VALUES (4, 'chainspell', 5, 0, 1, 7200, 37, 20, 0);
INSERT INTO `abilities` VALUES (5, 'perfect_dodge', 6, 0, 1, 7200, 38, 20, 0);
INSERT INTO `abilities` VALUES (6, 'invincible', 7, 0, 1, 7200, 18, 20, 0);
INSERT INTO `abilities` VALUES (7, 'blood_weapon', 8, 0, 1, 7200, 19, 20, 0);
INSERT INTO `abilities` VALUES (8, 'familiar', 9, 0, 1, 7200, 39, 20, 0);
INSERT INTO `abilities` VALUES (9, 'soul_voice', 10, 0, 1, 7200, 40, 20, 0);
INSERT INTO `abilities` VALUES (10, 'eagle_eye_shot', 11, 0, 4, 7200, 186, 20, 0);
INSERT INTO `abilities` VALUES (11, 'meikyo_shisui', 12, 0, 1, 7200, 96, 20, 0);
INSERT INTO `abilities` VALUES (12, 'mijin_gakure', 13, 0, 4, 7200, 93, 20, 0);
INSERT INTO `abilities` VALUES (13, 'spirit_surge', 14, 0, 1, 7200, 97, 20, 0);
INSERT INTO `abilities` VALUES (14, 'astral_flow', 15, 0, 1, 7200, 95, 20, 0);
INSERT INTO `abilities` VALUES (15, 'berserk', 1, 15, 1, 300, 0, 20, 0);
INSERT INTO `abilities` VALUES (16, 'warcry', 1, 35, 1, 300, 28, 20, 1);
INSERT INTO `abilities` VALUES (17, 'defender', 1, 25, 1, 300, 1, 20, 0);
INSERT INTO `abilities` VALUES (18, 'aggressor', 1, 45, 1, 300, 2, 20, 0);
INSERT INTO `abilities` VALUES (19, 'provoke', 1, 5, 4, 30, 3, 18, 0);
INSERT INTO `abilities` VALUES (20, 'focus', 2, 25, 1, 300, 4, 20, 0);
INSERT INTO `abilities` VALUES (21, 'dodge', 2, 15, 1, 300, 5, 20, 0);
INSERT INTO `abilities` VALUES (22, 'chakra', 2, 35, 1, 300, 6, 20, 0);
INSERT INTO `abilities` VALUES (23, 'boost', 2, 5, 1, 15, 7, 20, 0);
INSERT INTO `abilities` VALUES (24, 'counterstance', 2, 45, 1, 300, 8, 20, 0);
INSERT INTO `abilities` VALUES (25, 'steal', 6, 5, 4, 300, 181, 20, 0);
INSERT INTO `abilities` VALUES (26, 'flee', 6, 25, 1, 300, 9, 20, 0);
INSERT INTO `abilities` VALUES (27, 'hide', 6, 45, 1, 300, 10, 20, 0);
INSERT INTO `abilities` VALUES (28, 'sneak_attack', 6, 15, 1, 60, 17, 20, 0);
INSERT INTO `abilities` VALUES (29, 'mug', 6, 35, 4, 900, 183, 20, 0);
INSERT INTO `abilities` VALUES (30, 'shield_bash', 7, 15, 4, 300, 185, 20, 0);
INSERT INTO `abilities` VALUES (31, 'holy_circle', 7, 5, 1, 600, 29, 20, 1);
INSERT INTO `abilities` VALUES (32, 'sentinel', 7, 30, 1, 300, 11, 20, 0);
INSERT INTO `abilities` VALUES (33, 'souleater', 8, 30, 1, 360, 20, 20, 0);
INSERT INTO `abilities` VALUES (34, 'arcane_circle', 8, 5, 1, 600, 30, 20, 1);
INSERT INTO `abilities` VALUES (35, 'last_resort', 8, 15, 1, 300, 12, 20, 0);
INSERT INTO `abilities` VALUES (36, 'charm', 9, 1, 4, 15, 13, 18, 0);
INSERT INTO `abilities` VALUES (37, 'gauge', 9, 10, 4, 30, 14, 18, 0);
INSERT INTO `abilities` VALUES (38, 'tame', 9, 30, 4, 600, 15, 18, 0);
INSERT INTO `abilities` VALUES (39, 'pet_commands', 9, 1, 1, 0, 0, 18, 0);
INSERT INTO `abilities` VALUES (40, 'scavenge', 11, 10, 1, 300, 21, 20, 0);
INSERT INTO `abilities` VALUES (41, 'shadowbind', 11, 40, 4, 300, 188, 18, 0);
INSERT INTO `abilities` VALUES (42, 'camouflage', 11, 20, 1, 300, 10, 20, 0);
INSERT INTO `abilities` VALUES (43, 'sharpshot', 11, 1, 1, 300, 22, 20, 0);
INSERT INTO `abilities` VALUES (44, 'barrage', 11, 30, 1, 300, 23, 20, 0);
INSERT INTO `abilities` VALUES (45, 'call_wyvern', 14, 1, 1, 1200, 94, 20, 0);
INSERT INTO `abilities` VALUES (46, 'third_eye', 12, 15, 1, 60, 24, 20, 0);
INSERT INTO `abilities` VALUES (47, 'meditate', 12, 30, 1, 180, 25, 20, 0);
INSERT INTO `abilities` VALUES (48, 'warding_circle', 12, 5, 1, 600, 32, 20, 1);
INSERT INTO `abilities` VALUES (49, 'ancient_circle', 14, 5, 1, 600, 31, 20, 1);
INSERT INTO `abilities` VALUES (50, 'jump', 14, 10, 4, 90, 204, 20, 0);
INSERT INTO `abilities` VALUES (51, 'high_jump', 14, 35, 4, 180, 209, 20, 0);
INSERT INTO `abilities` VALUES (52, 'super_jump', 14, 50, 4, 180, 214, 20, 0);
INSERT INTO `abilities` VALUES (53, 'fight', 9, 1, 4, 10, 83, 18, 0);
INSERT INTO `abilities` VALUES (54, 'heel', 9, 10, 1, 5, 83, 18, 0);
INSERT INTO `abilities` VALUES (55, 'leave', 9, 35, 1, 10, 83, 18, 0);
INSERT INTO `abilities` VALUES (56, 'sic', 9, 25, 1, 120, 83, 18, 0);
INSERT INTO `abilities` VALUES (57, 'stay', 9, 15, 1, 5, 83, 18, 0);
INSERT INTO `abilities` VALUES (58, 'divine_seal', 3, 15, 1, 600, 81, 20, 0);
INSERT INTO `abilities` VALUES (59, 'elemental_seal', 4, 15, 1, 600, 80, 20, 0);
INSERT INTO `abilities` VALUES (60, 'trick_attack', 6, 30, 1, 60, 82, 20, 0);
INSERT INTO `abilities` VALUES (61, 'weapon_bash', 8, 20, 4, 300, 201, 20, 0);
INSERT INTO `abilities` VALUES (62, 'reward', 9, 12, 1, 90, 84, 18, 0);
INSERT INTO `abilities` VALUES (63, 'cover', 7, 35, 2, 180, 86, 20, 0);
INSERT INTO `abilities` VALUES (64, 'spirit_link', 14, 25, 1, 180, 196, 20, 0);
INSERT INTO `abilities` VALUES (66, 'chi_blast', 2, 41, 4, 180, 92, 20, 0);
INSERT INTO `abilities` VALUES (67, 'convert', 5, 40, 1, 600, 88, 20, 0);
INSERT INTO `abilities` VALUES (68, 'accomplice', 6, 65, 2, 300, 220, 20, 0);
INSERT INTO `abilities` VALUES (69, 'call_beast', 9, 23, 1, 300, 83, 18, 0);
INSERT INTO `abilities` VALUES (70, 'unlimited_shot', 11, 51, 1, 180, 90, 20, 0);
INSERT INTO `abilities` VALUES (71, 'dismiss', 14, 1, 1, 300, 94, 20, 0);
INSERT INTO `abilities` VALUES (72, 'assault', 15, 1, 4, 10, 94, 20, 0);
INSERT INTO `abilities` VALUES (73, 'retreat', 15, 1, 1, 10, 94, 20, 0);
INSERT INTO `abilities` VALUES (74, 'release', 15, 1, 1, 10, 94, 20, 0);
INSERT INTO `abilities` VALUES (75, 'blood_pact_rage', 15, 1, 1, 0, 0, 20, 0);
INSERT INTO `abilities` VALUES (76, 'rampart', 7, 62, 1, 300, 91, 20, 1);
INSERT INTO `abilities` VALUES (77, 'azure_lore', 16, 0, 1, 7200, 142, 20, 0);
INSERT INTO `abilities` VALUES (78, 'chain_affinity', 16, 25, 1, 120, 140, 20, 0);
INSERT INTO `abilities` VALUES (79, 'burst_affinity', 16, 40, 1, 120, 141, 20, 0);
INSERT INTO `abilities` VALUES (80, 'wild_card', 17, 0, 1, 7200, 132, 20, 1);
INSERT INTO `abilities` VALUES (81, 'phantom_roll', 17, 5, 1, 0, 0, 18, 0);
INSERT INTO `abilities` VALUES (82, 'fighters_roll', 17, 49, 1, 60, 98, 20, 1);
INSERT INTO `abilities` VALUES (83, 'monks_roll', 17, 31, 1, 60, 99, 20, 1);
INSERT INTO `abilities` VALUES (84, 'healers_roll', 17, 20, 1, 60, 100, 20, 1);
INSERT INTO `abilities` VALUES (85, 'wizards_roll', 17, 58, 1, 60, 111, 20, 1);
INSERT INTO `abilities` VALUES (86, 'warlocks_roll', 17, 46, 1, 60, 102, 20, 1);
INSERT INTO `abilities` VALUES (87, 'rogues_roll', 17, 43, 1, 60, 103, 20, 1);
INSERT INTO `abilities` VALUES (88, 'gallants_roll', 17, 55, 1, 60, 101, 20, 1);
INSERT INTO `abilities` VALUES (89, 'chaos_roll', 17, 14, 1, 60, 105, 20, 1);
INSERT INTO `abilities` VALUES (90, 'beast_roll', 17, 34, 1, 60, 106, 20, 1);
INSERT INTO `abilities` VALUES (91, 'choral_roll', 17, 26, 1, 60, 107, 20, 1);
INSERT INTO `abilities` VALUES (92, 'hunters_roll', 17, 11, 1, 60, 108, 20, 1);
INSERT INTO `abilities` VALUES (93, 'samurai_roll', 17, 34, 1, 60, 109, 20, 1);
INSERT INTO `abilities` VALUES (94, 'ninja_roll', 17, 8, 1, 60, 110, 20, 1);
INSERT INTO `abilities` VALUES (95, 'drachen_roll', 17, 52, 1, 60, 104, 20, 1);
INSERT INTO `abilities` VALUES (96, 'evokers_roll', 17, 40, 1, 60, 112, 20, 1);
INSERT INTO `abilities` VALUES (97, 'maguss_roll', 17, 17, 1, 60, 113, 20, 1);
INSERT INTO `abilities` VALUES (98, 'corsairs_roll', 17, 5, 1, 60, 114, 20, 1);
INSERT INTO `abilities` VALUES (99, 'puppet_roll', 17, 23, 1, 60, 115, 20, 1);
INSERT INTO `abilities` VALUES (100, 'dancers_roll', 17, 61, 1, 60, 167, 20, 1);
INSERT INTO `abilities` VALUES (101, 'scholars_roll', 17, 64, 1, 60, 168, 20, 1);
INSERT INTO `abilities` VALUES (107, 'double-up', 17, 5, 1, 8, 116, 20, 0);
INSERT INTO `abilities` VALUES (108, 'quick_draw', 17, 40, 1, 0, 0, 18, 0);
INSERT INTO `abilities` VALUES (109, 'fire_shot', 17, 40, 4, 60, 125, 18, 0);
INSERT INTO `abilities` VALUES (110, 'ice_shot', 17, 40, 4, 60, 126, 18, 0);
INSERT INTO `abilities` VALUES (111, 'wind_shot', 17, 40, 4, 60, 127, 18, 0);
INSERT INTO `abilities` VALUES (112, 'earth_shot', 17, 40, 4, 60, 128, 18, 0);
INSERT INTO `abilities` VALUES (113, 'thunder_shot', 17, 40, 4, 60, 129, 18, 0);
INSERT INTO `abilities` VALUES (114, 'water_shot', 17, 40, 4, 60, 130, 18, 0);
INSERT INTO `abilities` VALUES (115, 'light_shot', 17, 40, 4, 60, 123, 18, 0);
INSERT INTO `abilities` VALUES (116, 'dark_shot', 17, 40, 4, 60, 124, 18, 0);
INSERT INTO `abilities` VALUES (117, 'random_deal', 17, 50, 1, 1200, 131, 20, 1);
INSERT INTO `abilities` VALUES (119, 'overdrive', 18, 0, 1, 7200, 143, 20, 0);
INSERT INTO `abilities` VALUES (120, 'activate', 18, 1, 1, 1200, 83, 20, 0);
INSERT INTO `abilities` VALUES (121, 'repair', 18, 15, 1, 180, 83, 18, 0);
INSERT INTO `abilities` VALUES (122, 'deploy', 18, 1, 4, 10, 83, 18, 0);
INSERT INTO `abilities` VALUES (123, 'deactivate', 18, 1, 1, 60, 83, 18, 0);
INSERT INTO `abilities` VALUES (124, 'retrieve', 18, 10, 1, 10, 83, 18, 0);
INSERT INTO `abilities` VALUES (125, 'fire_maneuver', 18, 1, 1, 10, 83, 18, 0);
INSERT INTO `abilities` VALUES (126, 'ice_maneuver', 18, 1, 1, 10, 83, 18, 0);
INSERT INTO `abilities` VALUES (127, 'wind_maneuver', 18, 1, 1, 10, 83, 18, 0);
INSERT INTO `abilities` VALUES (128, 'earth_maneuver', 18, 1, 1, 10, 83, 18, 0);
INSERT INTO `abilities` VALUES (129, 'thunder_maneuver', 18, 1, 1, 10, 83, 18, 0);
INSERT INTO `abilities` VALUES (130, 'water_maneuver', 18, 1, 1, 10, 83, 18, 0);
INSERT INTO `abilities` VALUES (131, 'light_maneuver', 18, 1, 1, 10, 83, 18, 0);
INSERT INTO `abilities` VALUES (132, 'dark_maneuver', 18, 1, 1, 10, 83, 18, 0);
INSERT INTO `abilities` VALUES (133, 'warriors_charge', 1, 75, 1, 900, 154, 20, 0);
INSERT INTO `abilities` VALUES (134, 'tomahawk', 1, 75, 4, 180, 244, 20, 0);
INSERT INTO `abilities` VALUES (135, 'mantra', 2, 75, 1, 600, 155, 20, 1);
INSERT INTO `abilities` VALUES (136, 'formless_strikes', 2, 75, 1, 600, 156, 20, 0);
INSERT INTO `abilities` VALUES (137, 'martyr', 3, 75, 2, 1200, 157, 20, 0);
INSERT INTO `abilities` VALUES (138, 'devotion', 3, 75, 2, 1200, 158, 20, 0);
INSERT INTO `abilities` VALUES (139, 'assassins_charge', 6, 75, 1, 900, 160, 20, 0);
INSERT INTO `abilities` VALUES (140, 'feint', 6, 75, 1, 600, 159, 20, 0);
INSERT INTO `abilities` VALUES (141, 'fealty', 7, 75, 1, 1200, 148, 20, 0);
INSERT INTO `abilities` VALUES (142, 'chivalry', 7, 75, 1, 1200, 149, 20, 0);
INSERT INTO `abilities` VALUES (143, 'dark_seal', 8, 75, 1, 900, 144, 20, 0);
INSERT INTO `abilities` VALUES (144, 'diabolic_eye', 8, 75, 1, 900, 145, 20, 0);
INSERT INTO `abilities` VALUES (145, 'feral_howl', 9, 75, 4, 900, 146, 20, 0);
INSERT INTO `abilities` VALUES (146, 'killer_instinct', 9, 75, 1, 900, 147, 20, 1);
INSERT INTO `abilities` VALUES (147, 'nightingale', 10, 75, 1, 1200, 161, 20, 0);
INSERT INTO `abilities` VALUES (148, 'troubadour', 10, 75, 1, 1200, 162, 20, 0);
INSERT INTO `abilities` VALUES (149, 'stealth_shot', 11, 75, 1, 300, 150, 20, 0);
INSERT INTO `abilities` VALUES (150, 'flashy_shot', 11, 75, 1, 1200, 151, 20, 0);
INSERT INTO `abilities` VALUES (151, 'shikikoyo', 12, 75, 2, 900, 152, 20, 0);
INSERT INTO `abilities` VALUES (152, 'blade_bash', 12, 75, 1, 900, 202, 20, 0);
INSERT INTO `abilities` VALUES (153, 'deep_breathing', 14, 75, 1, 900, 153, 20, 0);
INSERT INTO `abilities` VALUES (154, 'angon', 14, 75, 4, 180, 245, 20, 0);
INSERT INTO `abilities` VALUES (155, 'sange', 13, 75, 1, 900, 200, 20, 0);
INSERT INTO `abilities` VALUES (156, 'blood_pact_ward', 15, 1, 1, 0, 0, 20, 0);
INSERT INTO `abilities` VALUES (157, 'hasso', 12, 25, 1, 60, 163, 20, 0);
INSERT INTO `abilities` VALUES (158, 'seigan', 12, 35, 1, 60, 164, 20, 0);
INSERT INTO `abilities` VALUES (159, 'convergence', 16, 75, 1, 600, 165, 20, 0);
INSERT INTO `abilities` VALUES (160, 'diffusion', 16, 75, 1, 1200, 166, 20, 1);
INSERT INTO `abilities` VALUES (161, 'snake_eye', 17, 75, 1, 900, 220, 20, 0);
INSERT INTO `abilities` VALUES (162, 'fold', 17, 75, 1, 900, 220, 20, 0);
INSERT INTO `abilities` VALUES (163, 'role_reversal', 18, 75, 1, 240, 169, 20, 0);
INSERT INTO `abilities` VALUES (164, 'ventriloquy', 18, 75, 4, 120, 170, 20, 0);
INSERT INTO `abilities` VALUES (165, 'trance', 19, 0, 1, 7200, 184, 20, 0);
INSERT INTO `abilities` VALUES (166, 'sambas', 19, 5, 1, 0, 0, 20, 0);
INSERT INTO `abilities` VALUES (167, 'waltzes', 19, 15, 1, 0, 0, 20, 0);
INSERT INTO `abilities` VALUES (168, 'drain_samba', 19, 5, 1, 60, 0, 20, 0);
INSERT INTO `abilities` VALUES (169, 'drain_samba_ii', 19, 35, 1, 60, 1, 20, 0);
INSERT INTO `abilities` VALUES (170, 'drain_samba_iii', 19, 64, 1, 60, 2, 20, 0);
INSERT INTO `abilities` VALUES (171, 'aspir_samba', 19, 25, 1, 60, 3, 20, 0);
INSERT INTO `abilities` VALUES (172, 'aspir_samba_ii', 19, 60, 1, 60, 4, 20, 0);
INSERT INTO `abilities` VALUES (173, 'haste_samba', 19, 45, 1, 60, 5, 20, 0);
INSERT INTO `abilities` VALUES (174, 'curing_waltz', 19, 15, 27, 6, 6, 20, 0);
INSERT INTO `abilities` VALUES (175, 'curing_waltz_ii', 19, 30, 27, 8, 7, 20, 0);
INSERT INTO `abilities` VALUES (176, 'curing_waltz_iii', 19, 50, 27, 10, 8, 20, 0);
INSERT INTO `abilities` VALUES (177, 'curing_waltz_iv', 19, 70, 27, 17, 9, 20, 0);
INSERT INTO `abilities` VALUES (178, 'healing_waltz', 19, 35, 27, 15, 10, 20, 1);
INSERT INTO `abilities` VALUES (179, 'divine_waltz', 19, 25, 27, 13, 11, 20, 1);
INSERT INTO `abilities` VALUES (180, 'spectral_jig', 19, 25, 1, 30, 12, 20, 0);
INSERT INTO `abilities` VALUES (181, 'chocobo_jig', 19, 55, 1, 60, 13, 20, 0);
INSERT INTO `abilities` VALUES (182, 'jigs', 19, 25, 1, 0, 0, 20, 0);
INSERT INTO `abilities` VALUES (183, 'steps', 19, 20, 1, 0, 0, 20, 0);
INSERT INTO `abilities` VALUES (184, 'flourishes_i', 19, 20, 1, 0, 0, 20, 0);
INSERT INTO `abilities` VALUES (185, 'quickstep', 19, 20, 4, 15, 220, 20, 0);
INSERT INTO `abilities` VALUES (186, 'box_step', 19, 30, 4, 15, 220, 20, 0);
INSERT INTO `abilities` VALUES (187, 'stutter_step', 19, 40, 4, 15, 220, 20, 0);
INSERT INTO `abilities` VALUES (188, 'animated_flourish', 19, 20, 4, 30, 181, 20, 0);
INSERT INTO `abilities` VALUES (189, 'desperate_flourish', 19, 30, 4, 20, 220, 20, 0);
INSERT INTO `abilities` VALUES (190, 'reverse_flourish', 19, 40, 1, 30, 182, 20, 0);
INSERT INTO `abilities` VALUES (191, 'violent_flourish', 19, 45, 4, 20, 220, 20, 0);
INSERT INTO `abilities` VALUES (192, 'building_flourish', 19, 50, 1, 10, 220, 20, 0);
INSERT INTO `abilities` VALUES (193, 'wild_flourish', 19, 60, 4, 30, 220, 20, 0);
INSERT INTO `abilities` VALUES (194, 'tabula_rasa', 20, 0, 1, 7200, 190, 20, 0);
INSERT INTO `abilities` VALUES (195, 'light_arts', 20, 10, 1, 60, 191, 20, 0);
INSERT INTO `abilities` VALUES (196, 'dark_arts', 20, 10, 1, 60, 192, 20, 0);
INSERT INTO `abilities` VALUES (197, 'flourishes_ii', 19, 40, 1, 0, 0, 20, 0);
INSERT INTO `abilities` VALUES (198, 'modus_veritas', 20, 65, 4, 600, 188, 20, 0);
INSERT INTO `abilities` VALUES (199, 'penury', 20, 10, 1, 0, 172, 20, 0);
INSERT INTO `abilities` VALUES (200, 'celerity', 20, 25, 1, 0, 173, 20, 0);
INSERT INTO `abilities` VALUES (201, 'rapture', 20, 55, 1, 0, 174, 20, 0);
INSERT INTO `abilities` VALUES (202, 'accession', 20, 40, 1, 0, 175, 20, 0);
INSERT INTO `abilities` VALUES (203, 'parsimony', 20, 10, 1, 0, 177, 20, 0);
INSERT INTO `abilities` VALUES (204, 'alacrity', 20, 25, 1, 0, 178, 20, 0);
INSERT INTO `abilities` VALUES (205, 'ebullience', 20, 55, 1, 0, 179, 20, 0);
INSERT INTO `abilities` VALUES (206, 'manifestation', 20, 40, 1, 0, 180, 20, 0);
INSERT INTO `abilities` VALUES (207, 'stratagems', 20, 10, 1, 0, 0, 20, 0);
INSERT INTO `abilities` VALUES (208, 'velocity_shot', 11, 45, 1, 300, 186, 20, 0);
INSERT INTO `abilities` VALUES (209, 'snarl', 9, 45, 1, 30, 87, 20, 0);
INSERT INTO `abilities` VALUES (210, 'retaliation', 1, 60, 1, 180, 185, 20, 0);
INSERT INTO `abilities` VALUES (211, 'footwork', 2, 65, 1, 300, 197, 20, 0);
INSERT INTO `abilities` VALUES (213, 'pianissimo', 10, 45, 1, 15, 194, 20, 0);
INSERT INTO `abilities` VALUES (214, 'sekkanoki', 12, 60, 1, 300, 199, 20, 0);
INSERT INTO `abilities` VALUES (216, 'elemental_siphon', 15, 50, 1, 300, 201, 20, 0);
INSERT INTO `abilities` VALUES (217, 'sublimation', 20, 35, 1, 30, 189, 20, 0);
INSERT INTO `abilities` VALUES (218, 'addendum_white', 20, 10, 1, 0, 171, 20, 0);
INSERT INTO `abilities` VALUES (219, 'addendum_black', 20, 30, 1, 0, 176, 20, 0);
INSERT INTO `abilities` VALUES (220, 'collaborator', 6, 65, 2, 60, 220, 20, 0);
INSERT INTO `abilities` VALUES (221, 'saber_dance', 19, 75, 1, 300, 207, 20, 0);
INSERT INTO `abilities` VALUES (222, 'fan_dance', 19, 75, 1, 300, 208, 20, 0);
INSERT INTO `abilities` VALUES (223, 'no_foot_rise', 19, 75, 1, 180, 209, 20, 0);
INSERT INTO `abilities` VALUES (224, 'altruism', 20, 75, 1, 0, 210, 20, 0);
INSERT INTO `abilities` VALUES (225, 'focalization', 20, 75, 1, 0, 212, 20, 0);
INSERT INTO `abilities` VALUES (226, 'tranquility', 20, 75, 1, 0, 211, 20, 0);
INSERT INTO `abilities` VALUES (227, 'equanimity', 20, 75, 1, 0, 213, 20, 0);
INSERT INTO `abilities` VALUES (228, 'enlightenment', 20, 75, 1, 600, 214, 20, 0);
INSERT INTO `abilities` VALUES (229, 'afflatus_solace', 3, 40, 1, 60, 216, 20, 0);
INSERT INTO `abilities` VALUES (230, 'afflatus_misery', 3, 40, 1, 60, 217, 20, 0);
INSERT INTO `abilities` VALUES (231, 'composure', 5, 50, 1, 300, 215, 20, 0);
INSERT INTO `abilities` VALUES (232, 'yonin', 13, 40, 1, 300, 218, 20, 0);
INSERT INTO `abilities` VALUES (233, 'innin', 13, 40, 1, 300, 219, 20, 0);