-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Ven 24 Juin 2011 à 08:10
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
-- Structure de la table `npc_patrols`
--

DROP TABLE IF EXISTS `npc_patrols`;
CREATE TABLE IF NOT EXISTS `npc_patrols` (
  `npcid` int(10) unsigned NOT NULL,
  `order` int(8) NOT NULL DEFAULT '0',
  `pos_x` float(7,3) NOT NULL DEFAULT '0.000',
  `pos_y` float(7,3) NOT NULL DEFAULT '0.000',
  `pos_z` float(7,3) NOT NULL DEFAULT '0.000',
  `wait` int(4) NOT NULL DEFAULT '0',
  `look` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`npcid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `npc_patrols`
--

INSERT INTO `npc_patrols` VALUES('17187457', '0', '-217', '-57', '379', '0', '0');
INSERT INTO `npc_patrols` VALUES('17187457', '0', '-264', '-55', '378', '0', '0');