-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Jeu 16 Juin 2011 à 20:20
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
-- Structure de la table `item_puppet`
--

DROP TABLE IF EXISTS `item_puppet`;
CREATE TABLE IF NOT EXISTS `item_puppet` (
  `itemid` smallint(5) unsigned NOT NULL,
  `name` tinytext NOT NULL,
  `slot` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `element` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `item_puppet`
--

INSERT INTO `item_puppet` VALUES (8193, 'harlequin_head', 1, 2236962);
INSERT INTO `item_puppet` VALUES (8194, 'valoredge_x-900_head', 1, 33698307);
INSERT INTO `item_puppet` VALUES (8195, 'sharpshot_z-500_head', 1, 35783427);
INSERT INTO `item_puppet` VALUES (8196, 'stormwaker_y-700_head', 1, 540025392);
INSERT INTO `item_puppet` VALUES (8197, 'soulsoother_c-1000_head', 1, 53486128);
INSERT INTO `item_puppet` VALUES (8198, 'spiritreaver_m-400_head', 1, 808460848);
INSERT INTO `item_puppet` VALUES (8224, 'harlequin_frame', 2, 858993459);
INSERT INTO `item_puppet` VALUES (8225, 'valoredge_x-900_frame', 2, 590562084);
INSERT INTO `item_puppet` VALUES (8226, 'sharpshot_z-500_frame', 2, 590623779);
INSERT INTO `item_puppet` VALUES (8227, 'stormwaker_y-700_frame', 2, 1127428674);
INSERT INTO `item_puppet` VALUES (8449, 'strobe', 3, 1);
INSERT INTO `item_puppet` VALUES (8450, 'tension_spring', 3, 2);
INSERT INTO `item_puppet` VALUES (8451, 'inhibitor', 3, 1);
INSERT INTO `item_puppet` VALUES (8452, 'tension_spring_ii', 3, 3);
INSERT INTO `item_puppet` VALUES (8453, 'attuner', 3, 2);
INSERT INTO `item_puppet` VALUES (8454, 'reactive_shield', 3, 2);
INSERT INTO `item_puppet` VALUES (8455, 'flame_holder', 3, 1);
INSERT INTO `item_puppet` VALUES (8456, 'heat_capacitor', 3, 2);
INSERT INTO `item_puppet` VALUES (8457, 'strobe_ii', 3, 2);
INSERT INTO `item_puppet` VALUES (8458, 'tension_spring_iii', 3, 4);
INSERT INTO `item_puppet` VALUES (8481, 'mana_booster', 3, 32);
INSERT INTO `item_puppet` VALUES (8482, 'loudspeaker', 3, 32);
INSERT INTO `item_puppet` VALUES (8483, 'scanner', 3, 16);
INSERT INTO `item_puppet` VALUES (8484, 'loudspeaker_ii', 3, 48);
INSERT INTO `item_puppet` VALUES (8485, 'tactical_processor', 3, 32);
INSERT INTO `item_puppet` VALUES (8486, 'tranquilizer', 3, 32);
INSERT INTO `item_puppet` VALUES (8487, 'ice_maker', 3, 16);
INSERT INTO `item_puppet` VALUES (8488, 'power_cooler', 3, 32);
INSERT INTO `item_puppet` VALUES (8489, 'loudspeaker_iii', 3, 64);
INSERT INTO `item_puppet` VALUES (8490, 'tranquilizer_ii', 3, 48);
INSERT INTO `item_puppet` VALUES (8513, 'accelerator', 3, 512);
INSERT INTO `item_puppet` VALUES (8514, 'scope', 3, 512);
INSERT INTO `item_puppet` VALUES (8515, 'pattern_reader', 3, 256);
INSERT INTO `item_puppet` VALUES (8516, 'accelerator_ii', 3, 768);
INSERT INTO `item_puppet` VALUES (8517, 'drum_magazine', 3, 512);
INSERT INTO `item_puppet` VALUES (8518, 'turbo_charger', 3, 512);
INSERT INTO `item_puppet` VALUES (8519, 'replicator', 3, 256);
INSERT INTO `item_puppet` VALUES (8520, 'barrage_turbine', 3, 768);
INSERT INTO `item_puppet` VALUES (8521, 'turbo_charger_ii', 3, 768);
INSERT INTO `item_puppet` VALUES (8522, 'accelerator_iii', 3, 1024);
INSERT INTO `item_puppet` VALUES (8523, 'scope_ii', 3, 512);
INSERT INTO `item_puppet` VALUES (8545, 'shock_absorber', 3, 4096);
INSERT INTO `item_puppet` VALUES (8546, 'armor_plate', 3, 8192);
INSERT INTO `item_puppet` VALUES (8547, 'analyzer', 3, 4096);
INSERT INTO `item_puppet` VALUES (8548, 'armor_plate_ii', 3, 12288);
INSERT INTO `item_puppet` VALUES (8549, 'equalizer', 3, 8192);
INSERT INTO `item_puppet` VALUES (8550, 'schurzen', 3, 8192);
INSERT INTO `item_puppet` VALUES (8551, 'hammermill', 3, 4096);
INSERT INTO `item_puppet` VALUES (8552, 'barrier_module', 3, 8192);
INSERT INTO `item_puppet` VALUES (8553, 'shock_absorber_ii', 3, 8192);
INSERT INTO `item_puppet` VALUES (8554, 'armor_plate_iii', 3, 16384);
INSERT INTO `item_puppet` VALUES (8577, 'stabilizer', 3, 131072);
INSERT INTO `item_puppet` VALUES (8578, 'volt_gun', 3, 131072);
INSERT INTO `item_puppet` VALUES (8579, 'heat_seeker', 3, 65536);
INSERT INTO `item_puppet` VALUES (8580, 'stabilizer_ii', 3, 196608);
INSERT INTO `item_puppet` VALUES (8581, 'target_marker', 3, 131072);
INSERT INTO `item_puppet` VALUES (8582, 'dynamo', 3, 131072);
INSERT INTO `item_puppet` VALUES (8583, 'coiler', 3, 131072);
INSERT INTO `item_puppet` VALUES (8584, 'galvanizer', 3, 131072);
INSERT INTO `item_puppet` VALUES (8585, 'stabilizer_iii', 3, 262144);
INSERT INTO `item_puppet` VALUES (8586, 'coiler_ii', 3, 196608);
INSERT INTO `item_puppet` VALUES (8609, 'mana_jammer', 3, 2097152);
INSERT INTO `item_puppet` VALUES (8610, 'heatsink', 3, 1048576);
INSERT INTO `item_puppet` VALUES (8611, 'stealth_screen', 3, 1048576);
INSERT INTO `item_puppet` VALUES (8612, 'mana_jammer_ii', 3, 3145728);
INSERT INTO `item_puppet` VALUES (8613, 'mana_channeler', 3, 2097152);
INSERT INTO `item_puppet` VALUES (8614, 'condenser', 3, 1048576);
INSERT INTO `item_puppet` VALUES (8615, 'steam_jacket', 3, 1048576);
INSERT INTO `item_puppet` VALUES (8616, 'percolator', 3, 1048576);
INSERT INTO `item_puppet` VALUES (8617, 'mana_jammer_iii', 3, 4194304);
INSERT INTO `item_puppet` VALUES (8618, 'stealth_screen_ii', 3, 2097152);
INSERT INTO `item_puppet` VALUES (8641, 'auto-repair_kit', 3, 33554432);
INSERT INTO `item_puppet` VALUES (8642, 'flashbulb', 3, 33554432);
INSERT INTO `item_puppet` VALUES (8643, 'damage_gauge', 3, 16777216);
INSERT INTO `item_puppet` VALUES (8644, 'auto-repair_kit_ii', 3, 50331648);
INSERT INTO `item_puppet` VALUES (8645, 'eraser', 3, 33554432);
INSERT INTO `item_puppet` VALUES (8646, 'optic_fiber', 3, 16777216);
INSERT INTO `item_puppet` VALUES (8648, 'vivi-valve', 3, 33554432);
INSERT INTO `item_puppet` VALUES (8649, 'vivi-valve_ii', 3, 50331648);
INSERT INTO `item_puppet` VALUES (8650, 'auto-repair_kit_iii', 3, 67108864);
INSERT INTO `item_puppet` VALUES (8673, 'mana_tank', 3, 536870912);
INSERT INTO `item_puppet` VALUES (8674, 'mana_converter', 3, 536870912);
INSERT INTO `item_puppet` VALUES (8675, 'mana_conserver', 3, 268435456);
INSERT INTO `item_puppet` VALUES (8676, 'mana_tank_ii', 3, 805306368);
INSERT INTO `item_puppet` VALUES (8677, 'smoke_screen', 3, 536870912);
INSERT INTO `item_puppet` VALUES (8678, 'economizer', 3, 268435456);
INSERT INTO `item_puppet` VALUES (8680, 'disruptor', 3, 536870912);
INSERT INTO `item_puppet` VALUES (8681, 'mana_tank_iii', 3, 1073741824);