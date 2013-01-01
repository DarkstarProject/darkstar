/*
Navicat MySQL Data Transfer

Source Server         : oo
Source Server Version : 50136
Source Host           : localhost:3306
Source Database       : dspdb

Target Server Type    : MYSQL
Target Server Version : 50136
File Encoding         : 65001

Date: 2013-01-01 14:00:11
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `conquest_system`
-- ----------------------------
DROP TABLE IF EXISTS `conquest_system`;
CREATE TABLE `conquest_system` (
  `region_id` tinyint(2) NOT NULL DEFAULT '0',
  `region_control` tinyint(2) NOT NULL DEFAULT '0',
  `sandoria_influence` int(10) NOT NULL DEFAULT '0',
  `bastok_influence` int(10) NOT NULL DEFAULT '0',
  `windurst_influence` int(10) NOT NULL DEFAULT '0',
  `beastmen_influence` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`region_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of conquest_system
-- ----------------------------
INSERT INTO conquest_system VALUES ('0', '0', '0', '0', '0', '0');
INSERT INTO conquest_system VALUES ('1', '0', '0', '0', '0', '0');
INSERT INTO conquest_system VALUES ('2', '0', '0', '0', '0', '0');
INSERT INTO conquest_system VALUES ('3', '1', '0', '0', '0', '0');
INSERT INTO conquest_system VALUES ('4', '2', '0', '0', '0', '0');
INSERT INTO conquest_system VALUES ('5', '2', '0', '0', '0', '0');
INSERT INTO conquest_system VALUES ('6', '1', '0', '0', '0', '0');
INSERT INTO conquest_system VALUES ('7', '1', '0', '0', '0', '0');
INSERT INTO conquest_system VALUES ('8', '1', '0', '0', '0', '0');
INSERT INTO conquest_system VALUES ('9', '2', '0', '0', '0', '0');
INSERT INTO conquest_system VALUES ('10', '1', '0', '0', '0', '0');
INSERT INTO conquest_system VALUES ('11', '1', '0', '0', '0', '0');
INSERT INTO conquest_system VALUES ('12', '0', '0', '0', '0', '0');
INSERT INTO conquest_system VALUES ('13', '2', '0', '0', '0', '0');
INSERT INTO conquest_system VALUES ('14', '0', '0', '0', '0', '0');
INSERT INTO conquest_system VALUES ('15', '2', '0', '0', '0', '0');
INSERT INTO conquest_system VALUES ('16', '2', '0', '0', '0', '0');
INSERT INTO conquest_system VALUES ('17', '3', '0', '0', '0', '0');
INSERT INTO conquest_system VALUES ('18', '2', '0', '0', '0', '0');
