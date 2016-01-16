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
  `battlefieldNumber` tinyint(3),
  `npcId` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=56;

-- ----------------------------
-- Records of instance
-- ----------------------------

-- Horlais Peak
INSERT INTO `bcnm_treasure_chests` VALUES ('4', '1', '17346675');
INSERT INTO `bcnm_treasure_chests` VALUES ('4', '2', '17346679');
INSERT INTO `bcnm_treasure_chests` VALUES ('4', '3', '17346683');
INSERT INTO `bcnm_treasure_chests` VALUES ('10', '1', '17346687');
INSERT INTO `bcnm_treasure_chests` VALUES ('10', '2', '17346691');
INSERT INTO `bcnm_treasure_chests` VALUES ('10', '3', '17346695');
INSERT INTO `bcnm_treasure_chests` VALUES ('11', '1', '17346597');
INSERT INTO `bcnm_treasure_chests` VALUES ('11', '2', '17346601');
INSERT INTO `bcnm_treasure_chests` VALUES ('11', '3', '17346605');
INSERT INTO `bcnm_treasure_chests` VALUES ('12', '1', '17346653');
INSERT INTO `bcnm_treasure_chests` VALUES ('12', '2', '17346662');
INSERT INTO `bcnm_treasure_chests` VALUES ('12', '3', '17346671');
INSERT INTO `bcnm_treasure_chests` VALUES ('15', '1', '17346608');
INSERT INTO `bcnm_treasure_chests` VALUES ('15', '2', '17346611');
INSERT INTO `bcnm_treasure_chests` VALUES ('15', '3', '17346614');
INSERT INTO `bcnm_treasure_chests` VALUES ('17', '1', '17346624');
INSERT INTO `bcnm_treasure_chests` VALUES ('17', '2', '17346634');
INSERT INTO `bcnm_treasure_chests` VALUES ('17', '3', '17346644');

-- Ghelsba Outpost
INSERT INTO `bcnm_treasure_chests` VALUES ('34', '1', '17350932');
INSERT INTO `bcnm_treasure_chests` VALUES ('35', '1', '17350935');
INSERT INTO `bcnm_treasure_chests` VALUES ('36', '1', '17350938');

-- Waughroon Shrine
INSERT INTO `bcnm_treasure_chests` VALUES ('81', '1', '17367089');
INSERT INTO `bcnm_treasure_chests` VALUES ('81', '2', '17367093');
INSERT INTO `bcnm_treasure_chests` VALUES ('81', '3', '17367097');
INSERT INTO `bcnm_treasure_chests` VALUES ('76', '1', '17367101');
INSERT INTO `bcnm_treasure_chests` VALUES ('76', '2', '17367105');
INSERT INTO `bcnm_treasure_chests` VALUES ('76', '3', '17367109');
INSERT INTO `bcnm_treasure_chests` VALUES ('79', '1', '17367138');
INSERT INTO `bcnm_treasure_chests` VALUES ('79', '2', '17367155');
INSERT INTO `bcnm_treasure_chests` VALUES ('79', '3', '17367172');
INSERT INTO `bcnm_treasure_chests` VALUES ('82', '1', '17367113');
INSERT INTO `bcnm_treasure_chests` VALUES ('82', '2', '17367117');
INSERT INTO `bcnm_treasure_chests` VALUES ('82', '3', '17367121');
INSERT INTO `bcnm_treasure_chests` VALUES ('73', '1', '17367182');
INSERT INTO `bcnm_treasure_chests` VALUES ('73', '2', '17367192');
INSERT INTO `bcnm_treasure_chests` VALUES ('73', '3', '17367202');



-- Balga's Dais
INSERT INTO `bcnm_treasure_chests` VALUES ('100', '1', '17375293');
INSERT INTO `bcnm_treasure_chests` VALUES ('100', '2', '17375300'); 
INSERT INTO `bcnm_treasure_chests` VALUES ('100', '3', '17375307');
INSERT INTO `bcnm_treasure_chests` VALUES ('105', '1', '17375272');
INSERT INTO `bcnm_treasure_chests` VALUES ('105', '2', '17375276'); 
INSERT INTO `bcnm_treasure_chests` VALUES ('105', '3', '17375280');
INSERT INTO `bcnm_treasure_chests` VALUES ('107', '1', '17375282');
INSERT INTO `bcnm_treasure_chests` VALUES ('107', '2', '17375284'); 
INSERT INTO `bcnm_treasure_chests` VALUES ('107', '3', '17375286');

-- Sacrificial Chamber
INSERT INTO `bcnm_treasure_chests` VALUES ('129', '1', '17444884');
INSERT INTO `bcnm_treasure_chests` VALUES ('129', '2', '17444891');
INSERT INTO `bcnm_treasure_chests` VALUES ('129', '3', '17444898');

-- Boneyard Gully
INSERT INTO `bcnm_treasure_chests` VALUES ('673', '1', '16810019');

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
