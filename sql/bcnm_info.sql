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
-- Table structure for `bcnm_info`
-- ----------------------------
DROP TABLE IF EXISTS `bcnm_info`;
CREATE TABLE `bcnm_info` (
  `bcnmId` smallint(5) unsigned NOT NULL,
  `zoneId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(15) NOT NULL,
  `fastestName` varchar(15),
  `fastestTime` smallint(5) unsigned,
  `timeLimit` smallint(5) unsigned NOT NULL DEFAULT '1800',
  `levelCap` smallint(5) unsigned NOT NULL DEFAULT '75',
  `lootDropId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `rules` blob, 
  PRIMARY KEY (`bcnmId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=56;

-- rules blob format (bits): 0 0 00 00 00 = A B C D E
-- A = allow SJs (1 if yes)
-- B = lose exp on death (1 if yes)
-- C = party size limit (00=solo 01=single pt 10=alliance 11=zone)
-- D = all dead rules (00=nothing, 01=remove immediately, 10=remove after 3 min, 11=<reserved> 
-- E = reserved
-- e.g. 00001000 = no sjs, no exp loss, solo only, remove player after 3mins
-- ----------------------------
-- Records of abilities
-- ----------------------------
INSERT INTO `bcnm_info` VALUES ('1', '139', 'maat_horlais', NULL, NULL, '600', '75', '0', 0x08);
INSERT INTO `bcnm_info` VALUES ('2', '146', 'maat_balgas', NULL, NULL, '600', '75', '0', 0x08);
INSERT INTO `bcnm_info` VALUES ('3', '206', 'maat_qubia', NULL, NULL, '600', '75', '0', 0x08);
INSERT INTO `bcnm_info` VALUES ('4', '144', 'maat_waughroon', NULL, NULL, '600', '75', '0', 0x08);
INSERT INTO `bcnm_info` VALUES ('5', '168', 'maat_oracles', NULL, NULL, '600', '75', '0', 0x08);