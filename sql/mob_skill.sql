/*
Navicat MySQL Data Transfer

Source Server         : DarkStar
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : dspdb

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2011-10-17 00:52:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `mob_skill`
-- ----------------------------
DROP TABLE IF EXISTS `mob_skill`;
CREATE TABLE `mob_skill` (
  `mob_skill_id` smallint(4) unsigned NOT NULL,
  `mob_skill_name` char(20) CHARACTER SET latin1 NOT NULL,
  `family_id` smallint(3) unsigned NOT NULL,
  `mob_skill_type` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `mob_skill_element` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `mob_skill_critical` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `mob_skill_num_hit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `mob_skill_aoe` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `mob_skill_distance` float(3,1) NOT NULL DEFAULT '0.0',
  `mob_skill_flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `mob_skill_effect` smallint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`mob_skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mob_skill
-- ----------------------------
INSERT INTO `mob_skill` VALUES ('1', 'Foot_Kick', '206', '1', '0', '1', '1', '0', '3.4', '2', '0');
INSERT INTO `mob_skill` VALUES ('2', 'Dust_Cloud', '206', '3', '2', '0', '0', '1', '10.0', '0', '5');
INSERT INTO `mob_skill` VALUES ('3', 'Whirl_Claws', '206', '1', '0', '0', '2', '3', '5.0', '4', '0');
INSERT INTO `mob_skill` VALUES ('168', 'Full-force_Blow', '258', '1', '0', '0', '1', '0', '3.4', '2', '0');
INSERT INTO `mob_skill` VALUES ('169', 'Gastric_Bomb', '258', '3', '3', '0', '0', '0', '26.8', '0', '147');
INSERT INTO `mob_skill` VALUES ('170', 'Sandspin', '258', '3', '2', '0', '0', '3', '26.8', '0', '146');
INSERT INTO `mob_skill` VALUES ('171', 'Tremors', '258', '3', '2', '0', '0', '3', '15.8', '8', '137');
INSERT INTO `mob_skill` VALUES ('172', 'MP_Absorption', '258', '3', '0', '0', '0', '0', '3.4', '0', '0');
INSERT INTO `mob_skill` VALUES ('173', 'Sound_Vacuum', '258', '6', '0', '0', '0', '0', '15.8', '0', '6');
