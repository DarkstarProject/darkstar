/*
Navicat MySQL Data Transfer

Source Server         : oo
Source Server Version : 50136
Source Host           : localhost:3306
Source Database       : dspdb

Target Server Type    : MYSQL
Target Server Version : 50136
File Encoding         : 65001

Date: 2013-01-21 00:16:20
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `char_inventory`
-- ----------------------------
DROP TABLE IF EXISTS `char_inventory`;
CREATE TABLE `char_inventory` (
  `charid` int(10) unsigned NOT NULL,
  `location` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `slot` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `itemId` smallint(5) unsigned NOT NULL DEFAULT '65535',
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `col` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `row` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `rotation` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `bazaar` int(8) unsigned NOT NULL DEFAULT '0',
  `signature` varchar(20) NOT NULL DEFAULT '',
  `currCharges` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `lastUseTime` int(10) unsigned NOT NULL DEFAULT '0',
  `worn` tinyint(1) NOT NULL DEFAULT '0',
  `augment0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `augment1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `augment2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `augment3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `trialNumber` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charid`,`location`,`slot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=28;

-- ----------------------------
-- Records of char_inventory
-- ----------------------------