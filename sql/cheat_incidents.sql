-- phpMyAdmin SQL Dump
-- version 4.3.10
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 30, 2019 at 08:05 PM
-- Server version: 10.3.12-MariaDB
-- PHP Version: 5.6.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dspdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `cheat_incidents`
--

DROP TABLE IF EXISTS `cheat_incidents`;
CREATE TABLE IF NOT EXISTS `cheat_incidents` (
  `charid` int(10) unsigned NOT NULL,
  `incident_time` datetime NOT NULL,
  `cheatid` int(10) unsigned NOT NULL,
  `cheatarg` int(10) unsigned NOT NULL,
  `severity` int(10) unsigned NOT NULL,
  `description` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
