/*
Navicat MySQL Data Transfer

Source Server         : oo
Source Server Version : 50136
Source Host           : localhost:3306
Source Database       : dspdb

Target Server Type    : MYSQL
Target Server Version : 50136
File Encoding         : 65001

Date: 2012-07-17 14:50:32
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `char_points`
-- ----------------------------
DROP TABLE IF EXISTS `char_points`;
CREATE TABLE `char_points` (
  `charid` int(10) NOT NULL,
  `sandoria_cp` int(15) NOT NULL DEFAULT '0',
  `bastok_cp` int(15) NOT NULL DEFAULT '0',
  `windurst_cp` int(15) NOT NULL DEFAULT '0',
  `sandoria_supply` int(10) NOT NULL DEFAULT '0',
  `bastok_supply` int(10) NOT NULL DEFAULT '0',
  `windurst_supply` int(10) NOT NULL DEFAULT '0',
  `imperial_standing` int(15) NOT NULL DEFAULT '0',
  `runic_portal` tinyint(3) NOT NULL DEFAULT '0',
  `leujaoam_assault_point` int(10) NOT NULL DEFAULT '0',
  `mamool_assault_point` int(10) NOT NULL DEFAULT '0',
  `lebros_assault_point` int(10) NOT NULL DEFAULT '0',
  `periqia_assault_point` int(10) NOT NULL DEFAULT '0',
  `ilrusi_assault_point` int(10) NOT NULL DEFAULT '0',
  `nyzul_isle_assault_point` int(10) NOT NULL DEFAULT '0',
  `zeni_point` int(15) NOT NULL DEFAULT '0',
  `maw` int(10) NOT NULL DEFAULT '0',
  `past_sandoria_tp` int(10) NOT NULL DEFAULT '0',
  `past_bastok_tp` int(10) NOT NULL DEFAULT '0',
  `past_windurst_tp` int(10) NOT NULL DEFAULT '0',
  `allied_notes` int(15) NOT NULL DEFAULT '0',
  `tabs` int(15) NOT NULL DEFAULT '0',
  PRIMARY KEY (`charid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of char_points
-- ----------------------------
