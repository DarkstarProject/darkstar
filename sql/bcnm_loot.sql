/*
MySQL Data Transfer
Source Host: localhost
Source Database: dspdb
Target Host: localhost
Target Database: dspdb
Date: 31/08/2012 18:09:30
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for bcnm_loot
-- ----------------------------
DROP TABLE IF EXISTS `bcnm_loot`;
CREATE TABLE `bcnm_loot` (
  `LootDropId` smallint(5) unsigned NOT NULL default '0',
  `itemId` smallint(5) unsigned NOT NULL default '0',
  `rolls` smallint(5) unsigned NOT NULL default '0',
  `lootGroupId` tinyint(3) unsigned NOT NULL default '0',
  KEY `LootDropId` (`LootDropId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=9;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `bcnm_loot` VALUES ('0', '18047', '188', '0');
INSERT INTO `bcnm_loot` VALUES ('0', '17939', '27', '0');
INSERT INTO `bcnm_loot` VALUES ('0', '17937', '170', '0');
INSERT INTO `bcnm_loot` VALUES ('0', '1441', '295', '0');
INSERT INTO `bcnm_loot` VALUES ('0', '18351', '27', '0');
INSERT INTO `bcnm_loot` VALUES ('0', '17464', '71', '0');
INSERT INTO `bcnm_loot` VALUES ('0', '17575', '196', '0');
INSERT INTO `bcnm_loot` VALUES ('0', '18211', '45', '1');
INSERT INTO `bcnm_loot` VALUES ('0', '17576', '259', '1');
INSERT INTO `bcnm_loot` VALUES ('0', '17245', '241', '1');
INSERT INTO `bcnm_loot` VALUES ('0', '17838', '143', '1');
INSERT INTO `bcnm_loot` VALUES ('0', '1442', '161', '1');
INSERT INTO `bcnm_loot` VALUES ('0', '17996', '143', '1');
INSERT INTO `bcnm_loot` VALUES ('0', '17578', '36', '1');
INSERT INTO `bcnm_loot` VALUES ('0', '683', '446', '2');
INSERT INTO `bcnm_loot` VALUES ('0', '908', '420', '2');
INSERT INTO `bcnm_loot` VALUES ('0', '1312', '71', '2');
INSERT INTO `bcnm_loot` VALUES ('0', '14080', '26', '2');
INSERT INTO `bcnm_loot` VALUES ('0', '887', '116', '3');
INSERT INTO `bcnm_loot` VALUES ('0', '645', '89', '3');
INSERT INTO `bcnm_loot` VALUES ('0', '902', '71', '3');
INSERT INTO `bcnm_loot` VALUES ('0', '702', '152', '3');
INSERT INTO `bcnm_loot` VALUES ('0', '737', '107', '3');
INSERT INTO `bcnm_loot` VALUES ('0', '823', '89', '3');
INSERT INTO `bcnm_loot` VALUES ('0', '1465', '45', '3');
INSERT INTO `bcnm_loot` VALUES ('0', '4173', '71', '3');
INSERT INTO `bcnm_loot` VALUES ('0', '700', '107', '3');
INSERT INTO `bcnm_loot` VALUES ('0', '703', '223', '3');
INSERT INTO `bcnm_loot` VALUES ('0', '738', '116', '3');
INSERT INTO `bcnm_loot` VALUES ('0', '830', '54', '3');
INSERT INTO `bcnm_loot` VALUES ('0', '895', '54', '3');
INSERT INTO `bcnm_loot` VALUES ('0', '1132', '71', '3');
INSERT INTO `bcnm_loot` VALUES ('0', '4172', '45', '3');
INSERT INTO `bcnm_loot` VALUES ('0', '866', '54', '3');
INSERT INTO `bcnm_loot` VALUES ('0', '4174', '63', '3');
INSERT INTO `bcnm_loot` VALUES ('0', '4175', '45', '3');
INSERT INTO `bcnm_loot` VALUES ('0', '683', '268', '4');
INSERT INTO `bcnm_loot` VALUES ('0', '1525', '143', '4');
INSERT INTO `bcnm_loot` VALUES ('0', '4205', '80', '4');
INSERT INTO `bcnm_loot` VALUES ('0', '4201', '143', '4');
INSERT INTO `bcnm_loot` VALUES ('0', '4199', '214', '4');
INSERT INTO `bcnm_loot` VALUES ('0', '4203', '196', '4');
INSERT INTO `bcnm_loot` VALUES ('0', '646', '107', '5');
INSERT INTO `bcnm_loot` VALUES ('0', '4211', '89', '5');
INSERT INTO `bcnm_loot` VALUES ('0', '645', '179', '5');
INSERT INTO `bcnm_loot` VALUES ('0', '4213', '134', '5');
INSERT INTO `bcnm_loot` VALUES ('0', '4207', '152', '5');
INSERT INTO `bcnm_loot` VALUES ('0', '4209', '80', '5');
INSERT INTO `bcnm_loot` VALUES ('0', '739', '80', '5');
INSERT INTO `bcnm_loot` VALUES ('0', '738', '107', '5');
INSERT INTO `bcnm_loot` VALUES ('0', '17698', '152', '5');
INSERT INTO `bcnm_loot` VALUES ('0', '4135', '295', '6');
INSERT INTO `bcnm_loot` VALUES ('0', '4119', '250', '6');
INSERT INTO `bcnm_loot` VALUES ('0', '4173', '196', '6');
INSERT INTO `bcnm_loot` VALUES ('0', '4175', '214', '6');
INSERT INTO `bcnm_loot` VALUES ('0', '887', '139', '7');
INSERT INTO `bcnm_loot` VALUES ('0', '645', '59', '7');
INSERT INTO `bcnm_loot` VALUES ('0', '902', '50', '7');
INSERT INTO `bcnm_loot` VALUES ('0', '702', '109', '7');
INSERT INTO `bcnm_loot` VALUES ('0', '737', '69', '7');
INSERT INTO `bcnm_loot` VALUES ('0', '1465', '99', '7');
INSERT INTO `bcnm_loot` VALUES ('0', '4173', '79', '7');
INSERT INTO `bcnm_loot` VALUES ('0', '700', '129', '7');
INSERT INTO `bcnm_loot` VALUES ('0', '644', '119', '7');
INSERT INTO `bcnm_loot` VALUES ('0', '844', '69', '7');
INSERT INTO `bcnm_loot` VALUES ('0', '703', '168', '7');
INSERT INTO `bcnm_loot` VALUES ('0', '738', '129', '7');
INSERT INTO `bcnm_loot` VALUES ('0', '895', '109', '7');
INSERT INTO `bcnm_loot` VALUES ('0', '1132', '79', '7');
INSERT INTO `bcnm_loot` VALUES ('0', '4174', '69', '7');
INSERT INTO `bcnm_loot` VALUES ('0', '866', '79', '7');
INSERT INTO `bcnm_loot` VALUES ('0', '4172', '50', '7');
INSERT INTO `bcnm_loot` VALUES ('0', '823', '89', '7');
INSERT INTO `bcnm_loot` VALUES ('0', '1110', '109', '8');
INSERT INTO `bcnm_loot` VALUES ('0', '836', '89', '8');
INSERT INTO `bcnm_loot` VALUES ('0', '658', '78', '8');
INSERT INTO `bcnm_loot` VALUES ('0', '837', '99', '8');
INSERT INTO `bcnm_loot` VALUES ('0', '942', '188', '8');
INSERT INTO `bcnm_loot` VALUES ('0', '844', '238', '8');
INSERT INTO `bcnm_loot` VALUES ('0', '1132', '109', '8');
INSERT INTO `bcnm_loot` VALUES ('0', '722', '79', '9');
INSERT INTO `bcnm_loot` VALUES ('0', '1446', '257', '9');
INSERT INTO `bcnm_loot` VALUES ('0', '703', '337', '9');
INSERT INTO `bcnm_loot` VALUES ('0', '831', '149', '9');
