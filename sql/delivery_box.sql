-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Lun 26 Décembre 2011 à 19:57
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
-- Structure de la table `delivery_box`
--

DROP TABLE IF EXISTS `delivery_box`;
CREATE TABLE IF NOT EXISTS `delivery_box` (
  `charid` int(10) unsigned NOT NULL,
  `slot` tinyint(3) unsigned NOT NULL,
  `itemid` smallint(5) unsigned NOT NULL,
  `itemsubid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `quantity` int(10) unsigned NOT NULL,
  `sender` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`charid`,`slot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `delivery_box`
--

