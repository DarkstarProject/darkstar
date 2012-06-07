/*
Navicat MySQL Data Transfer

Source Server         : DarkStar
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : dspdb

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2011-10-28 20:17:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bcnm_instance`
-- ----------------------------
DROP TABLE IF EXISTS `bcnm_instance`;
CREATE TABLE `bcnm_instance` (
  `bcnmId` smallint(5) unsigned NOT NULL,
  `instanceNumber` tinyint(3),
  `monsterId` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=56;

-- ----------------------------
-- Records of instance
-- ----------------------------
INSERT INTO `bcnm_instance` VALUES ('1', '1', '17346585');
INSERT INTO `bcnm_instance` VALUES ('1', '2', '17346586');
INSERT INTO `bcnm_instance` VALUES ('1', '3', '17346587');
INSERT INTO `bcnm_instance` VALUES ('5', '1', '17465354');
INSERT INTO `bcnm_instance` VALUES ('5', '2', '17465355');
INSERT INTO `bcnm_instance` VALUES ('5', '3', '17465356');