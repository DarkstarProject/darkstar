-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Sam 07 Janvier 2012 à 23:09
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
-- Structure de la table `server_variables`
--

DROP TABLE IF EXISTS `server_variables`;
CREATE TABLE IF NOT EXISTS `server_variables` (
  `name` varchar(30) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of server_variables
-- ----------------------------

INSERT INTO server_variables VALUES ('[BF]Save_The_Children_record', '600');
INSERT INTO server_variables VALUES ('[BF]The_Holy_Crest_record', '600');