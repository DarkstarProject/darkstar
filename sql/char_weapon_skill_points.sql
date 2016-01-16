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
-- Table structure for `char_weapon_skill_points`
-- ----------------------------
DROP TABLE IF EXISTS `char_weapon_skill_points`;
CREATE TABLE `char_weapon_skill_points` (
  `itemindex` int(10) NOT NULL,
  `charid` int(10) NOT NULL,
  `points` int(10) NOT NULL,
  PRIMARY KEY (`itemindex`, `charid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of char_points
-- ----------------------------
