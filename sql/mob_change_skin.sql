/*
Navicat MySQL Data Transfer

Source Server         : oo
Source Server Version : 50136
Source Host           : localhost:3306
Source Database       : dspdb

Target Server Type    : MYSQL
Target Server Version : 50136
File Encoding         : 65001

Date: 2013-01-16 11:57:21
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `mob_change_skin`
-- ----------------------------
DROP TABLE IF EXISTS `mob_change_skin`;
CREATE TABLE `mob_change_skin` (
  `skinid` int(10) NOT NULL,
  `skin_name` varchar(128) NOT NULL,
  `skin_model` binary(20) NOT NULL,
  `skin_animation` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`skinid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mob_change_skin
-- ----------------------------
INSERT INTO mob_change_skin VALUES ('1', 'Mammet_hand', 0x0600ED0300000000000000000000000000000000, '0');
INSERT INTO mob_change_skin VALUES ('2', 'Mammet_sword', 0x0600EE0300000000000000000000000000000000, '0');
INSERT INTO mob_change_skin VALUES ('3', 'Mammet_staff', 0x0600EF0300000000000000000000000000000000, '0');
INSERT INTO mob_change_skin VALUES ('4', 'Mammet_polearm', 0x0600F00300000000000000000000000000000000, '0');
