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
-- Horlais Peak
INSERT INTO `bcnm_instance` VALUES ('0', '1', '17346561');
INSERT INTO `bcnm_instance` VALUES ('0', '1', '17346562');
INSERT INTO `bcnm_instance` VALUES ('0', '2', '17346563');
INSERT INTO `bcnm_instance` VALUES ('0', '2', '17346564');
INSERT INTO `bcnm_instance` VALUES ('0', '3', '17346565');
INSERT INTO `bcnm_instance` VALUES ('0', '3', '17346566');
INSERT INTO `bcnm_instance` VALUES ('5', '1', '17346585');
INSERT INTO `bcnm_instance` VALUES ('5', '2', '17346586');
INSERT INTO `bcnm_instance` VALUES ('5', '3', '17346587');
INSERT INTO `bcnm_instance` VALUES ('6', '1', '17346588');
INSERT INTO `bcnm_instance` VALUES ('6', '2', '17346589');
INSERT INTO `bcnm_instance` VALUES ('6', '3', '17346590');
INSERT INTO `bcnm_instance` VALUES ('7', '1', '17346591');
INSERT INTO `bcnm_instance` VALUES ('7', '2', '17346592');
INSERT INTO `bcnm_instance` VALUES ('7', '3', '17346593');

-- Ghelsba Outpost
INSERT INTO `bcnm_instance` VALUES ('32', '1', '17350662');
INSERT INTO `bcnm_instance` VALUES ('32', '1', '17350663');
INSERT INTO `bcnm_instance` VALUES ('32', '1', '17350664');
INSERT INTO `bcnm_instance` VALUES ('33', '1', '17350928');

-- Waughroon Shrine
INSERT INTO `bcnm_instance` VALUES ('64', '1', '17367041');
INSERT INTO `bcnm_instance` VALUES ('64', '1', '17367042');
INSERT INTO `bcnm_instance` VALUES ('64', '2', '17367043');
INSERT INTO `bcnm_instance` VALUES ('64', '2', '17367044');
INSERT INTO `bcnm_instance` VALUES ('64', '3', '17367045');
INSERT INTO `bcnm_instance` VALUES ('64', '3', '17367046');
INSERT INTO `bcnm_instance` VALUES ('68', '1', '17367059');
INSERT INTO `bcnm_instance` VALUES ('68', '1', '17367060');
INSERT INTO `bcnm_instance` VALUES ('68', '1', '17367061');
INSERT INTO `bcnm_instance` VALUES ('68', '1', '17367062');
INSERT INTO `bcnm_instance` VALUES ('68', '2', '17367064');
INSERT INTO `bcnm_instance` VALUES ('68', '2', '17367065');
INSERT INTO `bcnm_instance` VALUES ('68', '2', '17367066');
INSERT INTO `bcnm_instance` VALUES ('68', '2', '17367067');
INSERT INTO `bcnm_instance` VALUES ('68', '3', '17367069');
INSERT INTO `bcnm_instance` VALUES ('68', '3', '17367070');
INSERT INTO `bcnm_instance` VALUES ('68', '3', '17367071');
INSERT INTO `bcnm_instance` VALUES ('68', '3', '17367072');
INSERT INTO `bcnm_instance` VALUES ('70', '1', '17367074');
INSERT INTO `bcnm_instance` VALUES ('70', '2', '17367075');
INSERT INTO `bcnm_instance` VALUES ('70', '3', '17367076');
INSERT INTO `bcnm_instance` VALUES ('71', '1', '17367077');
INSERT INTO `bcnm_instance` VALUES ('71', '2', '17367078');
INSERT INTO `bcnm_instance` VALUES ('71', '3', '17367079');
INSERT INTO `bcnm_instance` VALUES ('72', '1', '17367080');
INSERT INTO `bcnm_instance` VALUES ('72', '1', '17367081');
INSERT INTO `bcnm_instance` VALUES ('72', '2', '17367082');
INSERT INTO `bcnm_instance` VALUES ('72', '2', '17367083');
INSERT INTO `bcnm_instance` VALUES ('72', '3', '17367084');
INSERT INTO `bcnm_instance` VALUES ('72', '3', '17367085');

-- Balga's Dais
INSERT INTO `bcnm_instance` VALUES ('96', '1', '17375233');
INSERT INTO `bcnm_instance` VALUES ('96', '1', '17375234');
INSERT INTO `bcnm_instance` VALUES ('96', '2', '17375235');
INSERT INTO `bcnm_instance` VALUES ('96', '2', '17375236');
INSERT INTO `bcnm_instance` VALUES ('96', '3', '17375237');
INSERT INTO `bcnm_instance` VALUES ('96', '3', '17375238');
INSERT INTO `bcnm_instance` VALUES ('101', '1', '17375257');
INSERT INTO `bcnm_instance` VALUES ('101', '2', '17375258');
INSERT INTO `bcnm_instance` VALUES ('101', '3', '17375259');
INSERT INTO `bcnm_instance` VALUES ('102', '1', '17375260');
INSERT INTO `bcnm_instance` VALUES ('102', '2', '17375261');
INSERT INTO `bcnm_instance` VALUES ('102', '3', '17375262');
INSERT INTO `bcnm_instance` VALUES ('103', '1', '17375263');
INSERT INTO `bcnm_instance` VALUES ('103', '1', '17375264');
INSERT INTO `bcnm_instance` VALUES ('103', '2', '17375265');
INSERT INTO `bcnm_instance` VALUES ('103', '2', '17375266');
INSERT INTO `bcnm_instance` VALUES ('103', '3', '17375267');
INSERT INTO `bcnm_instance` VALUES ('103', '3', '17375268');

-- Sacrificial Chamber
INSERT INTO `bcnm_instance` VALUES ('128', '1', '17444865');
INSERT INTO `bcnm_instance` VALUES ('128', '1', '17444866');
INSERT INTO `bcnm_instance` VALUES ('128', '1', '17444867');
INSERT INTO `bcnm_instance` VALUES ('128', '2', '17444870');
INSERT INTO `bcnm_instance` VALUES ('128', '2', '17444871');
INSERT INTO `bcnm_instance` VALUES ('128', '2', '17444872');
INSERT INTO `bcnm_instance` VALUES ('128', '3', '17444875');
INSERT INTO `bcnm_instance` VALUES ('128', '3', '17444876');
INSERT INTO `bcnm_instance` VALUES ('128', '3', '17444877');

-- Throne Room
INSERT INTO `bcnm_instance` VALUES ('160', '1', '17453057');
INSERT INTO `bcnm_instance` VALUES ('160', '2', '17453058');
INSERT INTO `bcnm_instance` VALUES ('160', '3', '17453059');

-- Chamber of Oracles
INSERT INTO `bcnm_instance` VALUES ('192', '1', '17465345');
INSERT INTO `bcnm_instance` VALUES ('192', '1', '17465346');
INSERT INTO `bcnm_instance` VALUES ('192', '1', '17465347');
INSERT INTO `bcnm_instance` VALUES ('192', '2', '17465348');
INSERT INTO `bcnm_instance` VALUES ('192', '2', '17465349');
INSERT INTO `bcnm_instance` VALUES ('192', '2', '17465350');
INSERT INTO `bcnm_instance` VALUES ('192', '3', '17465351');
INSERT INTO `bcnm_instance` VALUES ('192', '3', '17465352');
INSERT INTO `bcnm_instance` VALUES ('192', '3', '17465353');
INSERT INTO `bcnm_instance` VALUES ('194', '1', '17465354');
INSERT INTO `bcnm_instance` VALUES ('194', '2', '17465355');
INSERT INTO `bcnm_instance` VALUES ('194', '3', '17465356');
INSERT INTO `bcnm_instance` VALUES ('195', '1', '17465357');
INSERT INTO `bcnm_instance` VALUES ('195', '2', '17465358');
INSERT INTO `bcnm_instance` VALUES ('195', '3', '17465359');
INSERT INTO `bcnm_instance` VALUES ('196', '1', '17465360');
INSERT INTO `bcnm_instance` VALUES ('196', '1', '17465361');
INSERT INTO `bcnm_instance` VALUES ('196', '2', '17465362');
INSERT INTO `bcnm_instance` VALUES ('196', '2', '17465363');
INSERT INTO `bcnm_instance` VALUES ('196', '3', '17465364');
INSERT INTO `bcnm_instance` VALUES ('196', '3', '17465365');

-- Stellar Fulcrum
INSERT INTO `bcnm_instance` VALUES ('256', '1', '17510401');
INSERT INTO `bcnm_instance` VALUES ('256', '2', '17510402');
INSERT INTO `bcnm_instance` VALUES ('256', '3', '17510403');

-- Cloister of Gales
INSERT INTO `bcnm_instance` VALUES ('416', '1', '17600513');
INSERT INTO `bcnm_instance` VALUES ('416', '2', '17600514');
INSERT INTO `bcnm_instance` VALUES ('416', '3', '17600515');
INSERT INTO `bcnm_instance` VALUES ('418', '1', '17600519');
INSERT INTO `bcnm_instance` VALUES ('418', '2', '17600520');
INSERT INTO `bcnm_instance` VALUES ('418', '3', '17600521');

-- Cloister of Storms
INSERT INTO `bcnm_instance` VALUES ('448', '1', '17604609');
INSERT INTO `bcnm_instance` VALUES ('448', '2', '17604610');
INSERT INTO `bcnm_instance` VALUES ('448', '3', '17604611');
INSERT INTO `bcnm_instance` VALUES ('450', '1', '17604618');
INSERT INTO `bcnm_instance` VALUES ('450', '2', '17604619');
INSERT INTO `bcnm_instance` VALUES ('450', '3', '17604620');

-- Cloister of Frost
INSERT INTO `bcnm_instance` VALUES ('480', '1', '17600513');
INSERT INTO `bcnm_instance` VALUES ('480', '2', '17600514');
INSERT INTO `bcnm_instance` VALUES ('480', '3', '17600515');
INSERT INTO `bcnm_instance` VALUES ('482', '1', '17600519');
INSERT INTO `bcnm_instance` VALUES ('482', '2', '17600520');
INSERT INTO `bcnm_instance` VALUES ('482', '3', '17600521');

-- Qu'Bia Arena
INSERT INTO `bcnm_instance` VALUES ('512', '1', '17621007');
INSERT INTO `bcnm_instance` VALUES ('512', '1', '17621008');
INSERT INTO `bcnm_instance` VALUES ('512', '1', '17621009');
INSERT INTO `bcnm_instance` VALUES ('512', '2', '17621000');
INSERT INTO `bcnm_instance` VALUES ('512', '2', '17621001');
INSERT INTO `bcnm_instance` VALUES ('512', '2', '17621002');
INSERT INTO `bcnm_instance` VALUES ('512', '3', '17621007');
INSERT INTO `bcnm_instance` VALUES ('512', '3', '17621008');
INSERT INTO `bcnm_instance` VALUES ('512', '3', '17621009');
INSERT INTO `bcnm_instance` VALUES ('517', '1', '17621056');
INSERT INTO `bcnm_instance` VALUES ('517', '2', '17621057');
INSERT INTO `bcnm_instance` VALUES ('517', '2', '17621058');
INSERT INTO `bcnm_instance` VALUES ('518', '1', '17621059');
INSERT INTO `bcnm_instance` VALUES ('518', '2', '17621060');
INSERT INTO `bcnm_instance` VALUES ('518', '3', '17621061');
INSERT INTO `bcnm_instance` VALUES ('519', '1', '17621062');
INSERT INTO `bcnm_instance` VALUES ('519', '2', '17621063');
INSERT INTO `bcnm_instance` VALUES ('519', '3', '17621064');

-- Cloister of Flames
INSERT INTO `bcnm_instance` VALUES ('544', '1', '17625089');
INSERT INTO `bcnm_instance` VALUES ('544', '2', '17625090');
INSERT INTO `bcnm_instance` VALUES ('544', '3', '17625091');
INSERT INTO `bcnm_instance` VALUES ('545', '1', '17625092');
INSERT INTO `bcnm_instance` VALUES ('545', '2', '17625093');
INSERT INTO `bcnm_instance` VALUES ('545', '3', '17625094');

-- Cloister of Tremors
INSERT INTO `bcnm_instance` VALUES ('576', '1', '17633281');
INSERT INTO `bcnm_instance` VALUES ('576', '2', '17633282');
INSERT INTO `bcnm_instance` VALUES ('576', '3', '17633283');
INSERT INTO `bcnm_instance` VALUES ('578', '1', '17633287');
INSERT INTO `bcnm_instance` VALUES ('578', '2', '17633288');
INSERT INTO `bcnm_instance` VALUES ('578', '3', '17633289');

-- Cloister of Tides
INSERT INTO `bcnm_instance` VALUES ('608', '1', '17641473');
INSERT INTO `bcnm_instance` VALUES ('608', '2', '17641474');
INSERT INTO `bcnm_instance` VALUES ('608', '3', '17641475');
INSERT INTO `bcnm_instance` VALUES ('609', '1', '17641476');
INSERT INTO `bcnm_instance` VALUES ('609', '2', '17641477');
INSERT INTO `bcnm_instance` VALUES ('609', '3', '17641478');