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
-- Table structure for `bcnm_treasure_chests`
-- ----------------------------
DROP TABLE IF EXISTS `bcnm_treasure_chests`;
CREATE TABLE `bcnm_treasure_chests` (
  `bcnmId` smallint(5) unsigned NOT NULL,
  `instanceNumber` tinyint(3),
  `npcId` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=56;

-- ----------------------------
-- Records of instance
-- ----------------------------
-- Horlais Peak

-- INSERT INTO `bcnm_treasure_chests` VALUES ('11', '1', '17346717');
-- INSERT INTO `bcnm_treasure_chests` VALUES ('11', '2', '17346719');
-- INSERT INTO `bcnm_treasure_chests` VALUES ('11', '3', '17346721');

-- Ghelsba Outpost

-- Waughroon Shrine
INSERT INTO `bcnm_treasure_chests` VALUES ('81', '1', '17367089');
INSERT INTO `bcnm_treasure_chests` VALUES ('81', '2', '17367093');
INSERT INTO `bcnm_treasure_chests` VALUES ('81', '3', '17367097');
INSERT INTO `bcnm_treasure_chests` VALUES ('76', '1', '17367101');
INSERT INTO `bcnm_treasure_chests` VALUES ('76', '2', '17367105');
INSERT INTO `bcnm_treasure_chests` VALUES ('76', '3', '17367109');

-- Balga's Dais

INSERT INTO `bcnm_treasure_chests` VALUES ('105', '1', '17375272');
INSERT INTO `bcnm_treasure_chests` VALUES ('105', '2', '17375276'); 
INSERT INTO `bcnm_treasure_chests` VALUES ('105', '3', '17375280');
-- INSERT INTO `bcnm_treasure_chests` VALUES ('107', '1', '17375386');
-- INSERT INTO `bcnm_treasure_chests` VALUES ('107', '2', '17375388');
-- INSERT INTO `bcnm_treasure_chests` VALUES ('107', '3', '17375390');

-- Sacrificial Chamber

-- Throne Room

-- Chamber of Oracles

-- Full Moon Fountain

-- Stellar Fulcrum

-- Cloister of Gales

-- Cloister of Storms

-- Cloister of Frost

-- Qu'Bia Arena

-- Cloister of Flames

-- Cloister of Tremors

-- Cloister of Tides
