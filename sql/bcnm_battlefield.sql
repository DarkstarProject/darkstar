/*
MySQL Data Transfer
Source Host: localhost
Source Database: dspdb
Target Host: localhost
Target Database: dspdb
Date: 2/20/2013 11:24:05 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for bcnm_battlefield
-- ----------------------------
DROP TABLE IF EXISTS `bcnm_battlefield`;
CREATE TABLE `bcnm_battlefield` (
  `bcnmId` smallint(5) unsigned NOT NULL,
  `battlefieldNumber` tinyint(3) DEFAULT NULL,
  `monsterId` int(10) NOT NULL,
  `conditions` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=56;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `bcnm_battlefield` VALUES ('0', '1', '17346561', '3');
INSERT INTO `bcnm_battlefield` VALUES ('0', '1', '17346562', '3');
INSERT INTO `bcnm_battlefield` VALUES ('0', '2', '17346563', '3');
INSERT INTO `bcnm_battlefield` VALUES ('0', '2', '17346564', '3');
INSERT INTO `bcnm_battlefield` VALUES ('0', '3', '17346565', '3');
INSERT INTO `bcnm_battlefield` VALUES ('0', '3', '17346566', '3');
INSERT INTO `bcnm_battlefield` VALUES ('3', '1', '17346567', '3');
INSERT INTO `bcnm_battlefield` VALUES ('3', '1', '17346568', '3');
INSERT INTO `bcnm_battlefield` VALUES ('3', '1', '17346569', '3');
INSERT INTO `bcnm_battlefield` VALUES ('3', '1', '17346570', '3');
INSERT INTO `bcnm_battlefield` VALUES ('3', '1', '17346571', '3');
INSERT INTO `bcnm_battlefield` VALUES ('3', '1', '17346572', '3');
INSERT INTO `bcnm_battlefield` VALUES ('3', '2', '17346573', '3');
INSERT INTO `bcnm_battlefield` VALUES ('3', '2', '17346574', '3');
INSERT INTO `bcnm_battlefield` VALUES ('3', '2', '17346575', '3');
INSERT INTO `bcnm_battlefield` VALUES ('3', '2', '17346576', '3');
INSERT INTO `bcnm_battlefield` VALUES ('3', '2', '17346577', '3');
INSERT INTO `bcnm_battlefield` VALUES ('3', '2', '17346578', '3');
INSERT INTO `bcnm_battlefield` VALUES ('3', '3', '17346579', '3');
INSERT INTO `bcnm_battlefield` VALUES ('3', '3', '17346580', '3');
INSERT INTO `bcnm_battlefield` VALUES ('3', '3', '17346581', '3');
INSERT INTO `bcnm_battlefield` VALUES ('3', '3', '17346582', '3');
INSERT INTO `bcnm_battlefield` VALUES ('3', '3', '17346583', '3');
INSERT INTO `bcnm_battlefield` VALUES ('3', '3', '17346584', '3');
INSERT INTO `bcnm_battlefield` VALUES ('4', '1', '17346684', '3');
INSERT INTO `bcnm_battlefield` VALUES ('4', '1', '17346685', '3');
INSERT INTO `bcnm_battlefield` VALUES ('4', '1', '17346686', '3');
INSERT INTO `bcnm_battlefield` VALUES ('4', '2', '17346688', '3');
INSERT INTO `bcnm_battlefield` VALUES ('4', '2', '17346689', '3');
INSERT INTO `bcnm_battlefield` VALUES ('4', '2', '17346690', '3');
INSERT INTO `bcnm_battlefield` VALUES ('4', '3', '17346692', '3');
INSERT INTO `bcnm_battlefield` VALUES ('4', '3', '17346693', '3');
INSERT INTO `bcnm_battlefield` VALUES ('4', '3', '17346694', '3');
INSERT INTO `bcnm_battlefield` VALUES ('5', '1', '17346585', '3');
INSERT INTO `bcnm_battlefield` VALUES ('5', '2', '17346586', '3');
INSERT INTO `bcnm_battlefield` VALUES ('5', '3', '17346587', '3');
INSERT INTO `bcnm_battlefield` VALUES ('6', '1', '17346588', '3');
INSERT INTO `bcnm_battlefield` VALUES ('6', '2', '17346589', '3');
INSERT INTO `bcnm_battlefield` VALUES ('6', '3', '17346590', '3');
INSERT INTO `bcnm_battlefield` VALUES ('7', '1', '17346591', '3');
INSERT INTO `bcnm_battlefield` VALUES ('7', '2', '17346592', '3');
INSERT INTO `bcnm_battlefield` VALUES ('7', '3', '17346593', '3');
INSERT INTO `bcnm_battlefield` VALUES ('10', '1', '17346615', '3');
INSERT INTO `bcnm_battlefield` VALUES ('10', '1', '17346616', '3');
INSERT INTO `bcnm_battlefield` VALUES ('10', '1', '17346617', '3');
INSERT INTO `bcnm_battlefield` VALUES ('10', '1', '17346618', '3');
INSERT INTO `bcnm_battlefield` VALUES ('10', '1', '17346619', '3');
INSERT INTO `bcnm_battlefield` VALUES ('10', '1', '17346620', '3');
INSERT INTO `bcnm_battlefield` VALUES ('10', '1', '17346621', '3');
INSERT INTO `bcnm_battlefield` VALUES ('10', '1', '17346622', '3');
INSERT INTO `bcnm_battlefield` VALUES ('10', '1', '17346623', '3');
INSERT INTO `bcnm_battlefield` VALUES ('10', '2', '17346625', '3');
INSERT INTO `bcnm_battlefield` VALUES ('10', '2', '17346626', '3');
INSERT INTO `bcnm_battlefield` VALUES ('10', '2', '17346627', '3');
INSERT INTO `bcnm_battlefield` VALUES ('10', '2', '17346628', '3');
INSERT INTO `bcnm_battlefield` VALUES ('10', '2', '17346629', '3');
INSERT INTO `bcnm_battlefield` VALUES ('10', '2', '17346630', '3');
INSERT INTO `bcnm_battlefield` VALUES ('10', '2', '17346631', '3');
INSERT INTO `bcnm_battlefield` VALUES ('10', '2', '17346632', '3');
INSERT INTO `bcnm_battlefield` VALUES ('10', '2', '17346633', '3');
INSERT INTO `bcnm_battlefield` VALUES ('10', '3', '17346635', '3');
INSERT INTO `bcnm_battlefield` VALUES ('10', '3', '17346636', '3');
INSERT INTO `bcnm_battlefield` VALUES ('10', '3', '17346637', '3');
INSERT INTO `bcnm_battlefield` VALUES ('10', '3', '17346638', '3');
INSERT INTO `bcnm_battlefield` VALUES ('10', '3', '17346639', '3');
INSERT INTO `bcnm_battlefield` VALUES ('10', '3', '17346640', '3');
INSERT INTO `bcnm_battlefield` VALUES ('10', '3', '17346641', '3');
INSERT INTO `bcnm_battlefield` VALUES ('10', '3', '17346642', '3');
INSERT INTO `bcnm_battlefield` VALUES ('10', '3', '17346643', '3');
INSERT INTO `bcnm_battlefield` VALUES ('11', '1', '17346717', '3');
INSERT INTO `bcnm_battlefield` VALUES ('11', '2', '17346719', '3');
INSERT INTO `bcnm_battlefield` VALUES ('11', '3', '17346721', '3');
INSERT INTO `bcnm_battlefield` VALUES ('12', '1', '17346672', '3');
INSERT INTO `bcnm_battlefield` VALUES ('12', '1', '17346673', '3');
INSERT INTO `bcnm_battlefield` VALUES ('12', '1', '17346674', '3');
INSERT INTO `bcnm_battlefield` VALUES ('12', '2', '17346676', '3');
INSERT INTO `bcnm_battlefield` VALUES ('12', '2', '17346677', '3');
INSERT INTO `bcnm_battlefield` VALUES ('12', '2', '17346678', '3');
INSERT INTO `bcnm_battlefield` VALUES ('12', '3', '17346680', '3');
INSERT INTO `bcnm_battlefield` VALUES ('12', '3', '17346681', '3');
INSERT INTO `bcnm_battlefield` VALUES ('12', '3', '17346682', '3');
INSERT INTO `bcnm_battlefield` VALUES ('15', '1', '17346735', '3');
INSERT INTO `bcnm_battlefield` VALUES ('15', '1', '17346736', '3');
INSERT INTO `bcnm_battlefield` VALUES ('15', '2', '17346738', '3');
INSERT INTO `bcnm_battlefield` VALUES ('15', '2', '17346739', '3');
INSERT INTO `bcnm_battlefield` VALUES ('15', '3', '17346741', '3');
INSERT INTO `bcnm_battlefield` VALUES ('15', '3', '17346742', '3');
INSERT INTO `bcnm_battlefield` VALUES ('17', '1', '17346750', '3');
INSERT INTO `bcnm_battlefield` VALUES ('17', '2', '17346752', '3');
INSERT INTO `bcnm_battlefield` VALUES ('17', '3', '17346754', '3');
INSERT INTO `bcnm_battlefield` VALUES ('32', '1', '17350662', '3');
INSERT INTO `bcnm_battlefield` VALUES ('32', '1', '17350663', '3');
INSERT INTO `bcnm_battlefield` VALUES ('32', '1', '17350664', '3');
INSERT INTO `bcnm_battlefield` VALUES ('33', '1', '17350928', '3');
INSERT INTO `bcnm_battlefield` VALUES ('34', '1', '17350929', '3');
INSERT INTO `bcnm_battlefield` VALUES ('34', '1', '17350930', '3');
INSERT INTO `bcnm_battlefield` VALUES ('34', '1', '17350931', '3');
INSERT INTO `bcnm_battlefield` VALUES ('35', '1', '17350934', '3');
INSERT INTO `bcnm_battlefield` VALUES ('35', '1', '17350933', '3');
INSERT INTO `bcnm_battlefield` VALUES ('36', '1', '17350936', '3');
INSERT INTO `bcnm_battlefield` VALUES ('36', '1', '17350937', '3');
INSERT INTO `bcnm_battlefield` VALUES ('36', '1', '17350938', '3');
INSERT INTO `bcnm_battlefield` VALUES ('36', '1', '17350939', '3');
INSERT INTO `bcnm_battlefield` VALUES ('64', '1', '17367041', '3');
INSERT INTO `bcnm_battlefield` VALUES ('64', '1', '17367042', '3');
INSERT INTO `bcnm_battlefield` VALUES ('64', '2', '17367043', '3');
INSERT INTO `bcnm_battlefield` VALUES ('64', '2', '17367044', '3');
INSERT INTO `bcnm_battlefield` VALUES ('64', '3', '17367045', '3');
INSERT INTO `bcnm_battlefield` VALUES ('64', '3', '17367046', '3');
INSERT INTO `bcnm_battlefield` VALUES ('67', '1', '17367047', '3');
INSERT INTO `bcnm_battlefield` VALUES ('67', '1', '17367048', '3');
INSERT INTO `bcnm_battlefield` VALUES ('67', '1', '17367049', '3');
INSERT INTO `bcnm_battlefield` VALUES ('67', '1', '17367050', '3');
INSERT INTO `bcnm_battlefield` VALUES ('67', '2', '17367051', '3');
INSERT INTO `bcnm_battlefield` VALUES ('67', '2', '17367052', '3');
INSERT INTO `bcnm_battlefield` VALUES ('67', '2', '17367053', '3');
INSERT INTO `bcnm_battlefield` VALUES ('67', '2', '17367054', '3');
INSERT INTO `bcnm_battlefield` VALUES ('67', '3', '17367055', '3');
INSERT INTO `bcnm_battlefield` VALUES ('67', '3', '17367056', '3');
INSERT INTO `bcnm_battlefield` VALUES ('67', '3', '17367057', '3');
INSERT INTO `bcnm_battlefield` VALUES ('67', '3', '17367058', '3');
INSERT INTO `bcnm_battlefield` VALUES ('68', '1', '17367059', '3');
INSERT INTO `bcnm_battlefield` VALUES ('68', '1', '17367060', '3');
INSERT INTO `bcnm_battlefield` VALUES ('68', '1', '17367061', '3');
INSERT INTO `bcnm_battlefield` VALUES ('68', '1', '17367062', '0');
INSERT INTO `bcnm_battlefield` VALUES ('68', '2', '17367064', '3');
INSERT INTO `bcnm_battlefield` VALUES ('68', '2', '17367065', '3');
INSERT INTO `bcnm_battlefield` VALUES ('68', '2', '17367066', '3');
INSERT INTO `bcnm_battlefield` VALUES ('68', '2', '17367067', '0');
INSERT INTO `bcnm_battlefield` VALUES ('68', '3', '17367069', '3');
INSERT INTO `bcnm_battlefield` VALUES ('68', '3', '17367070', '3');
INSERT INTO `bcnm_battlefield` VALUES ('68', '3', '17367071', '3');
INSERT INTO `bcnm_battlefield` VALUES ('68', '3', '17367072', '0');
INSERT INTO `bcnm_battlefield` VALUES ('70', '1', '17367074', '3');
INSERT INTO `bcnm_battlefield` VALUES ('70', '2', '17367075', '3');
INSERT INTO `bcnm_battlefield` VALUES ('70', '3', '17367076', '3');
INSERT INTO `bcnm_battlefield` VALUES ('71', '1', '17367077', '3');
INSERT INTO `bcnm_battlefield` VALUES ('71', '2', '17367078', '3');
INSERT INTO `bcnm_battlefield` VALUES ('71', '3', '17367079', '3');
INSERT INTO `bcnm_battlefield` VALUES ('72', '1', '17367080', '3');
INSERT INTO `bcnm_battlefield` VALUES ('72', '1', '17367081', '0');
INSERT INTO `bcnm_battlefield` VALUES ('72', '2', '17367082', '3');
INSERT INTO `bcnm_battlefield` VALUES ('72', '2', '17367083', '0');
INSERT INTO `bcnm_battlefield` VALUES ('72', '3', '17367084', '3');
INSERT INTO `bcnm_battlefield` VALUES ('72', '3', '17367085', '0');
INSERT INTO `bcnm_battlefield` VALUES ('81', '1', '17367266', '3');
INSERT INTO `bcnm_battlefield` VALUES ('81', '1', '17367267', '3');
INSERT INTO `bcnm_battlefield` VALUES ('81', '1', '17367268', '3');
INSERT INTO `bcnm_battlefield` VALUES ('81', '1', '17367269', '3');
INSERT INTO `bcnm_battlefield` VALUES ('81', '1', '17367270', '3');
INSERT INTO `bcnm_battlefield` VALUES ('81', '1', '17367271', '3');
INSERT INTO `bcnm_battlefield` VALUES ('81', '2', '17367272', '3');
INSERT INTO `bcnm_battlefield` VALUES ('81', '2', '17367273', '3');
INSERT INTO `bcnm_battlefield` VALUES ('81', '2', '17367274', '3');
INSERT INTO `bcnm_battlefield` VALUES ('81', '2', '17367275', '3');
INSERT INTO `bcnm_battlefield` VALUES ('81', '2', '17367276', '3');
INSERT INTO `bcnm_battlefield` VALUES ('81', '2', '17367277', '3');
INSERT INTO `bcnm_battlefield` VALUES ('81', '3', '17367278', '3');
INSERT INTO `bcnm_battlefield` VALUES ('81', '3', '17367279', '3');
INSERT INTO `bcnm_battlefield` VALUES ('81', '3', '17367280', '3');
INSERT INTO `bcnm_battlefield` VALUES ('81', '3', '17367281', '3');
INSERT INTO `bcnm_battlefield` VALUES ('81', '3', '17367282', '3');
INSERT INTO `bcnm_battlefield` VALUES ('81', '3', '17367283', '3');
INSERT INTO `bcnm_battlefield` VALUES ('73', '1', '17367098', '3');
INSERT INTO `bcnm_battlefield` VALUES ('73', '1', '17367099', '3');
INSERT INTO `bcnm_battlefield` VALUES ('73', '1', '17367100', '3');
INSERT INTO `bcnm_battlefield` VALUES ('73', '2', '17367102', '3');
INSERT INTO `bcnm_battlefield` VALUES ('73', '2', '17367103', '3');
INSERT INTO `bcnm_battlefield` VALUES ('73', '2', '17367104', '3');
INSERT INTO `bcnm_battlefield` VALUES ('73', '3', '17367106', '3');
INSERT INTO `bcnm_battlefield` VALUES ('73', '3', '17367107', '3');
INSERT INTO `bcnm_battlefield` VALUES ('73', '3', '17367108', '3');
INSERT INTO `bcnm_battlefield` VALUES ('76', '1', '17367230', '3');
INSERT INTO `bcnm_battlefield` VALUES ('76', '2', '17367232', '3');
INSERT INTO `bcnm_battlefield` VALUES ('76', '3', '17367234', '3');
INSERT INTO `bcnm_battlefield` VALUES ('79', '1', '17367242', '3');
INSERT INTO `bcnm_battlefield` VALUES ('79', '2', '17367244', '3');
INSERT INTO `bcnm_battlefield` VALUES ('79', '3', '17367246', '3');
INSERT INTO `bcnm_battlefield` VALUES ('82', '1', '17367287', '3');
INSERT INTO `bcnm_battlefield` VALUES ('82', '1', '17367288', '3');
INSERT INTO `bcnm_battlefield` VALUES ('82', '1', '17367289', '3');
INSERT INTO `bcnm_battlefield` VALUES ('82', '1', '17367290', '3');
INSERT INTO `bcnm_battlefield` VALUES ('82', '2', '17367292', '3');
INSERT INTO `bcnm_battlefield` VALUES ('82', '2', '17367293', '3');
INSERT INTO `bcnm_battlefield` VALUES ('82', '2', '17367294', '3');
INSERT INTO `bcnm_battlefield` VALUES ('82', '2', '17367295', '3');
INSERT INTO `bcnm_battlefield` VALUES ('82', '3', '17367297', '3');
INSERT INTO `bcnm_battlefield` VALUES ('82', '3', '17367298', '3');
INSERT INTO `bcnm_battlefield` VALUES ('82', '3', '17367299', '3');
INSERT INTO `bcnm_battlefield` VALUES ('82', '3', '17367300', '3');
INSERT INTO `bcnm_battlefield` VALUES ('96', '1', '17375233', '3');
INSERT INTO `bcnm_battlefield` VALUES ('96', '1', '17375234', '3');
INSERT INTO `bcnm_battlefield` VALUES ('96', '2', '17375235', '3');
INSERT INTO `bcnm_battlefield` VALUES ('96', '2', '17375236', '3');
INSERT INTO `bcnm_battlefield` VALUES ('96', '3', '17375237', '3');
INSERT INTO `bcnm_battlefield` VALUES ('96', '3', '17375238', '3');
INSERT INTO `bcnm_battlefield` VALUES ('99', '1', '17375239', '3');
INSERT INTO `bcnm_battlefield` VALUES ('99', '1', '17375240', '3');
INSERT INTO `bcnm_battlefield` VALUES ('99', '1', '17375241', '3');
INSERT INTO `bcnm_battlefield` VALUES ('99', '1', '17375242', '3');
INSERT INTO `bcnm_battlefield` VALUES ('99', '1', '17375243', '0');
INSERT INTO `bcnm_battlefield` VALUES ('99', '2', '17375245', '3');
INSERT INTO `bcnm_battlefield` VALUES ('99', '2', '17375246', '3');
INSERT INTO `bcnm_battlefield` VALUES ('99', '2', '17375247', '3');
INSERT INTO `bcnm_battlefield` VALUES ('99', '2', '17375248', '3');
INSERT INTO `bcnm_battlefield` VALUES ('99', '2', '17375249', '3');
INSERT INTO `bcnm_battlefield` VALUES ('99', '3', '17375251', '3');
INSERT INTO `bcnm_battlefield` VALUES ('99', '3', '17375252', '3');
INSERT INTO `bcnm_battlefield` VALUES ('99', '3', '17375253', '3');
INSERT INTO `bcnm_battlefield` VALUES ('99', '3', '17375254', '3');
INSERT INTO `bcnm_battlefield` VALUES ('99', '3', '17375255', '3');
INSERT INTO `bcnm_battlefield` VALUES ('100', '1', '17375353', '3');
INSERT INTO `bcnm_battlefield` VALUES ('100', '1', '17375354', '3');
INSERT INTO `bcnm_battlefield` VALUES ('100', '1', '17375355', '3');
INSERT INTO `bcnm_battlefield` VALUES ('100', '2', '17375357', '3');
INSERT INTO `bcnm_battlefield` VALUES ('100', '2', '17375358', '3');
INSERT INTO `bcnm_battlefield` VALUES ('100', '2', '17375359', '3');
INSERT INTO `bcnm_battlefield` VALUES ('100', '3', '17375361', '3');
INSERT INTO `bcnm_battlefield` VALUES ('100', '3', '17375362', '3');
INSERT INTO `bcnm_battlefield` VALUES ('100', '3', '17375363', '3');
INSERT INTO `bcnm_battlefield` VALUES ('101', '1', '17375257', '3');
INSERT INTO `bcnm_battlefield` VALUES ('101', '2', '17375258', '3');
INSERT INTO `bcnm_battlefield` VALUES ('101', '3', '17375259', '3');
INSERT INTO `bcnm_battlefield` VALUES ('102', '1', '17375260', '3');
INSERT INTO `bcnm_battlefield` VALUES ('102', '2', '17375261', '3');
INSERT INTO `bcnm_battlefield` VALUES ('102', '3', '17375262', '3');
INSERT INTO `bcnm_battlefield` VALUES ('103', '1', '17375263', '3');
INSERT INTO `bcnm_battlefield` VALUES ('103', '1', '17375264', '0');
INSERT INTO `bcnm_battlefield` VALUES ('103', '2', '17375265', '3');
INSERT INTO `bcnm_battlefield` VALUES ('103', '2', '17375266', '0');
INSERT INTO `bcnm_battlefield` VALUES ('103', '3', '17375267', '3');
INSERT INTO `bcnm_battlefield` VALUES ('103', '3', '17375268', '0');
INSERT INTO `bcnm_battlefield` VALUES ('105', '1', '17375270', '3');
INSERT INTO `bcnm_battlefield` VALUES ('105', '2', '17375274', '3');
INSERT INTO `bcnm_battlefield` VALUES ('105', '3', '17375278', '3');
INSERT INTO `bcnm_battlefield` VALUES ('105', '1', '17375271', '3');
INSERT INTO `bcnm_battlefield` VALUES ('105', '2', '17375275', '3');
INSERT INTO `bcnm_battlefield` VALUES ('105', '3', '17375279', '3');
INSERT INTO `bcnm_battlefield` VALUES ('105', '1', '17375269', '3');
INSERT INTO `bcnm_battlefield` VALUES ('105', '2', '17375273', '3');
INSERT INTO `bcnm_battlefield` VALUES ('105', '3', '17375277', '3');
INSERT INTO `bcnm_battlefield` VALUES ('107', '1', '17375386', '3');
INSERT INTO `bcnm_battlefield` VALUES ('107', '2', '17375388', '3');
INSERT INTO `bcnm_battlefield` VALUES ('107', '3', '17375390', '3');
INSERT INTO `bcnm_battlefield` VALUES ('128', '1', '17444865', '3');
INSERT INTO `bcnm_battlefield` VALUES ('128', '1', '17444866', '3');
INSERT INTO `bcnm_battlefield` VALUES ('128', '1', '17444867', '3');
INSERT INTO `bcnm_battlefield` VALUES ('128', '1', '17444868', '0');
INSERT INTO `bcnm_battlefield` VALUES ('128', '1', '17444869', '0');
INSERT INTO `bcnm_battlefield` VALUES ('128', '2', '17444870', '3');
INSERT INTO `bcnm_battlefield` VALUES ('128', '2', '17444871', '3');
INSERT INTO `bcnm_battlefield` VALUES ('128', '2', '17444872', '3');
INSERT INTO `bcnm_battlefield` VALUES ('128', '2', '17444873', '0');
INSERT INTO `bcnm_battlefield` VALUES ('128', '2', '17444874', '0');
INSERT INTO `bcnm_battlefield` VALUES ('128', '3', '17444875', '3');
INSERT INTO `bcnm_battlefield` VALUES ('128', '3', '17444876', '3');
INSERT INTO `bcnm_battlefield` VALUES ('128', '3', '17444877', '3');
INSERT INTO `bcnm_battlefield` VALUES ('128', '3', '17444878', '0');
INSERT INTO `bcnm_battlefield` VALUES ('128', '3', '17444879', '0');
INSERT INTO `bcnm_battlefield` VALUES ('129', '1', '17444880', '3');
INSERT INTO `bcnm_battlefield` VALUES ('129', '1', '17444881', '3');
INSERT INTO `bcnm_battlefield` VALUES ('129', '1', '17444882', '3');
INSERT INTO `bcnm_battlefield` VALUES ('129', '1', '17444883', '3');
INSERT INTO `bcnm_battlefield` VALUES ('129', '1', '17444885', '0');
INSERT INTO `bcnm_battlefield` VALUES ('129', '1', '17444886', '0');
INSERT INTO `bcnm_battlefield` VALUES ('129', '2', '17444887', '3');
INSERT INTO `bcnm_battlefield` VALUES ('129', '2', '17444888', '3');
INSERT INTO `bcnm_battlefield` VALUES ('129', '2', '17444889', '3');
INSERT INTO `bcnm_battlefield` VALUES ('129', '2', '17444890', '3');
INSERT INTO `bcnm_battlefield` VALUES ('129', '2', '17444892', '0');
INSERT INTO `bcnm_battlefield` VALUES ('129', '2', '17444893', '0');
INSERT INTO `bcnm_battlefield` VALUES ('129', '3', '17444894', '3');
INSERT INTO `bcnm_battlefield` VALUES ('129', '3', '17444895', '3');
INSERT INTO `bcnm_battlefield` VALUES ('129', '3', '17444896', '3');
INSERT INTO `bcnm_battlefield` VALUES ('129', '3', '17444897', '3');
INSERT INTO `bcnm_battlefield` VALUES ('129', '3', '17444899', '0');
INSERT INTO `bcnm_battlefield` VALUES ('129', '3', '17444900', '0');
INSERT INTO `bcnm_battlefield` VALUES ('160', '1', '17453057', '1');
INSERT INTO `bcnm_battlefield` VALUES ('160', '1', '17453060', '2');
INSERT INTO `bcnm_battlefield` VALUES ('160', '2', '17453058', '1');
INSERT INTO `bcnm_battlefield` VALUES ('160', '2', '17453061', '2');
INSERT INTO `bcnm_battlefield` VALUES ('160', '3', '17453059', '1');
INSERT INTO `bcnm_battlefield` VALUES ('160', '3', '17453062', '2');
INSERT INTO `bcnm_battlefield` VALUES ('161', '1', '17453063', '1');
INSERT INTO `bcnm_battlefield` VALUES ('161', '1', '17453064', '2');
INSERT INTO `bcnm_battlefield` VALUES ('161', '1', '17453065', '3');
INSERT INTO `bcnm_battlefield` VALUES ('161', '1', '17453066', '3');
INSERT INTO `bcnm_battlefield` VALUES ('161', '2', '17453067', '1');
INSERT INTO `bcnm_battlefield` VALUES ('161', '2', '17453068', '2');
INSERT INTO `bcnm_battlefield` VALUES ('161', '2', '17453069', '3');
INSERT INTO `bcnm_battlefield` VALUES ('161', '2', '17453070', '3');
INSERT INTO `bcnm_battlefield` VALUES ('161', '3', '17453071', '1');
INSERT INTO `bcnm_battlefield` VALUES ('161', '3', '17453072', '2');
INSERT INTO `bcnm_battlefield` VALUES ('161', '3', '17453073', '3');
INSERT INTO `bcnm_battlefield` VALUES ('161', '3', '17453074', '3');
INSERT INTO `bcnm_battlefield` VALUES ('192', '1', '17465345', '3');
INSERT INTO `bcnm_battlefield` VALUES ('192', '1', '17465346', '3');
INSERT INTO `bcnm_battlefield` VALUES ('192', '1', '17465347', '3');
INSERT INTO `bcnm_battlefield` VALUES ('192', '2', '17465348', '3');
INSERT INTO `bcnm_battlefield` VALUES ('192', '2', '17465349', '3');
INSERT INTO `bcnm_battlefield` VALUES ('192', '2', '17465350', '3');
INSERT INTO `bcnm_battlefield` VALUES ('192', '3', '17465351', '3');
INSERT INTO `bcnm_battlefield` VALUES ('192', '3', '17465352', '3');
INSERT INTO `bcnm_battlefield` VALUES ('192', '3', '17465353', '3');
INSERT INTO `bcnm_battlefield` VALUES ('194', '1', '17465354', '3');
INSERT INTO `bcnm_battlefield` VALUES ('194', '2', '17465355', '3');
INSERT INTO `bcnm_battlefield` VALUES ('194', '3', '17465356', '3');
INSERT INTO `bcnm_battlefield` VALUES ('195', '1', '17465357', '3');
INSERT INTO `bcnm_battlefield` VALUES ('195', '2', '17465358', '3');
INSERT INTO `bcnm_battlefield` VALUES ('195', '3', '17465359', '3');
INSERT INTO `bcnm_battlefield` VALUES ('196', '1', '17465360', '3');
INSERT INTO `bcnm_battlefield` VALUES ('196', '1', '17465361', '0');
INSERT INTO `bcnm_battlefield` VALUES ('196', '2', '17465362', '3');
INSERT INTO `bcnm_battlefield` VALUES ('196', '2', '17465363', '0');
INSERT INTO `bcnm_battlefield` VALUES ('196', '3', '17465364', '3');
INSERT INTO `bcnm_battlefield` VALUES ('196', '3', '17465365', '0');
INSERT INTO `bcnm_battlefield` VALUES ('224', '1', '17473537', '3');
INSERT INTO `bcnm_battlefield` VALUES ('224', '2', '17473538', '3');
INSERT INTO `bcnm_battlefield` VALUES ('224', '3', '17473539', '3');
INSERT INTO `bcnm_battlefield` VALUES ('225', '1', '17473540', '1');
INSERT INTO `bcnm_battlefield` VALUES ('225', '1', '17473541', '1');
INSERT INTO `bcnm_battlefield` VALUES ('225', '1', '17473542', '1');
INSERT INTO `bcnm_battlefield` VALUES ('225', '1', '17473543', '1');
INSERT INTO `bcnm_battlefield` VALUES ('225', '1', '17473544', '2');
INSERT INTO `bcnm_battlefield` VALUES ('225', '1', '17473545', '2');
INSERT INTO `bcnm_battlefield` VALUES ('225', '2', '17473546', '1');
INSERT INTO `bcnm_battlefield` VALUES ('225', '2', '17473547', '1');
INSERT INTO `bcnm_battlefield` VALUES ('225', '2', '17473548', '1');
INSERT INTO `bcnm_battlefield` VALUES ('225', '2', '17473549', '1');
INSERT INTO `bcnm_battlefield` VALUES ('225', '2', '17473550', '2');
INSERT INTO `bcnm_battlefield` VALUES ('225', '2', '17473551', '2');
INSERT INTO `bcnm_battlefield` VALUES ('225', '3', '17473552', '1');
INSERT INTO `bcnm_battlefield` VALUES ('225', '3', '17473553', '1');
INSERT INTO `bcnm_battlefield` VALUES ('225', '3', '17473554', '1');
INSERT INTO `bcnm_battlefield` VALUES ('225', '3', '17473555', '1');
INSERT INTO `bcnm_battlefield` VALUES ('225', '3', '17473556', '2');
INSERT INTO `bcnm_battlefield` VALUES ('225', '3', '17473557', '2');
INSERT INTO `bcnm_battlefield` VALUES ('256', '1', '17510401', '3');
INSERT INTO `bcnm_battlefield` VALUES ('256', '2', '17510402', '3');
INSERT INTO `bcnm_battlefield` VALUES ('256', '3', '17510403', '3');
INSERT INTO `bcnm_battlefield` VALUES ('320', '1', '17518595', '1');
INSERT INTO `bcnm_battlefield` VALUES ('320', '1', '17518596', '1');
INSERT INTO `bcnm_battlefield` VALUES ('320', '1', '17518597', '2');
INSERT INTO `bcnm_battlefield` VALUES ('320', '2', '17518600', '1');
INSERT INTO `bcnm_battlefield` VALUES ('320', '2', '17518601', '1');
INSERT INTO `bcnm_battlefield` VALUES ('320', '2', '17518602', '2');
INSERT INTO `bcnm_battlefield` VALUES ('320', '3', '17518605', '1');
INSERT INTO `bcnm_battlefield` VALUES ('320', '3', '17518606', '1');
INSERT INTO `bcnm_battlefield` VALUES ('320', '3', '17518607', '2');
INSERT INTO `bcnm_battlefield` VALUES ('416', '1', '17600513', '3');
INSERT INTO `bcnm_battlefield` VALUES ('416', '2', '17600514', '3');
INSERT INTO `bcnm_battlefield` VALUES ('416', '3', '17600515', '3');
INSERT INTO `bcnm_battlefield` VALUES ('418', '1', '17600519', '3');
INSERT INTO `bcnm_battlefield` VALUES ('418', '2', '17600520', '3');
INSERT INTO `bcnm_battlefield` VALUES ('418', '3', '17600521', '3');
INSERT INTO `bcnm_battlefield` VALUES ('420', '1', '17600537', '3');
INSERT INTO `bcnm_battlefield` VALUES ('420', '2', '17600538', '3');
INSERT INTO `bcnm_battlefield` VALUES ('420', '3', '17600539', '3');
INSERT INTO `bcnm_battlefield` VALUES ('448', '1', '17604609', '3');
INSERT INTO `bcnm_battlefield` VALUES ('448', '2', '17604610', '3');
INSERT INTO `bcnm_battlefield` VALUES ('448', '3', '17604611', '3');
INSERT INTO `bcnm_battlefield` VALUES ('450', '1', '17604618', '3');
INSERT INTO `bcnm_battlefield` VALUES ('450', '2', '17604619', '3');
INSERT INTO `bcnm_battlefield` VALUES ('450', '3', '17604620', '3');
INSERT INTO `bcnm_battlefield` VALUES ('452', '1', '17604636', '3');
INSERT INTO `bcnm_battlefield` VALUES ('452', '2', '17604637', '3');
INSERT INTO `bcnm_battlefield` VALUES ('452', '3', '17604638', '3');
INSERT INTO `bcnm_battlefield` VALUES ('480', '1', '17608705', '3');
INSERT INTO `bcnm_battlefield` VALUES ('480', '2', '17608706', '3');
INSERT INTO `bcnm_battlefield` VALUES ('480', '3', '17608707', '3');
INSERT INTO `bcnm_battlefield` VALUES ('482', '1', '17608726', '3');
INSERT INTO `bcnm_battlefield` VALUES ('482', '2', '17608727', '3');
INSERT INTO `bcnm_battlefield` VALUES ('482', '3', '17608728', '3');
INSERT INTO `bcnm_battlefield` VALUES ('484', '1', '17608744', '3');
INSERT INTO `bcnm_battlefield` VALUES ('484', '2', '17608745', '3');
INSERT INTO `bcnm_battlefield` VALUES ('484', '3', '17608746', '3');

-- Nation mission 5-1
INSERT INTO `bcnm_battlefield` VALUES ('512', '1', '17620993', '3'); -- Archlich Taber'quoan
INSERT INTO `bcnm_battlefield` VALUES ('512', '1', '17620994', '1'); -- Ancient Sorcerer
INSERT INTO `bcnm_battlefield` VALUES ('512', '1', '17620995', '1'); -- Ancient Sorcerer
INSERT INTO `bcnm_battlefield` VALUES ('512', '1', '17620996', '0'); -- Ancient Warrior
INSERT INTO `bcnm_battlefield` VALUES ('512', '1', '17620997', '0'); -- Ancient Warrior
INSERT INTO `bcnm_battlefield` VALUES ('512', '1', '17620998', '0'); -- Ancient Warrior
INSERT INTO `bcnm_battlefield` VALUES ('512', '1', '17620999', '0'); -- Ancient Warrior
INSERT INTO `bcnm_battlefield` VALUES ('512', '2', '17621000', '3'); -- Archlich Taber'quoan
INSERT INTO `bcnm_battlefield` VALUES ('512', '2', '17621001', '1'); -- Ancient Sorcerer
INSERT INTO `bcnm_battlefield` VALUES ('512', '2', '17621002', '1'); -- Ancient Sorcerer
INSERT INTO `bcnm_battlefield` VALUES ('512', '2', '17621003', '0'); -- Ancient Warrior
INSERT INTO `bcnm_battlefield` VALUES ('512', '2', '17621004', '0'); -- Ancient Warrior
INSERT INTO `bcnm_battlefield` VALUES ('512', '2', '17621005', '0'); -- Ancient Warrior
INSERT INTO `bcnm_battlefield` VALUES ('512', '2', '17621006', '0'); -- Ancient Warrior
INSERT INTO `bcnm_battlefield` VALUES ('512', '3', '17621007', '3'); -- Archlich Taber'quoan
INSERT INTO `bcnm_battlefield` VALUES ('512', '3', '17621008', '1'); -- Ancient Sorcerer
INSERT INTO `bcnm_battlefield` VALUES ('512', '3', '17621009', '1'); -- Ancient Sorcerer
INSERT INTO `bcnm_battlefield` VALUES ('512', '3', '17621010', '0'); -- Ancient Warrior
INSERT INTO `bcnm_battlefield` VALUES ('512', '3', '17621011', '0'); -- Ancient Warrior
INSERT INTO `bcnm_battlefield` VALUES ('512', '3', '17621012', '0'); -- Ancient Warrior
INSERT INTO `bcnm_battlefield` VALUES ('512', '3', '17621013', '0'); -- Ancient Warrior

INSERT INTO `bcnm_battlefield` VALUES ('516', '1', '17621014', '2');
INSERT INTO `bcnm_battlefield` VALUES ('516', '1', '17621015', '2');
INSERT INTO `bcnm_battlefield` VALUES ('516', '1', '17621016', '2');
INSERT INTO `bcnm_battlefield` VALUES ('516', '1', '17621017', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '1', '17621018', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '1', '17621019', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '1', '17621020', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '1', '17621021', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '1', '17621022', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '1', '17621023', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '1', '17621024', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '1', '17621025', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '1', '17621026', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '1', '17621027', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '2', '17621028', '2');
INSERT INTO `bcnm_battlefield` VALUES ('516', '2', '17621029', '2');
INSERT INTO `bcnm_battlefield` VALUES ('516', '2', '17621030', '2');
INSERT INTO `bcnm_battlefield` VALUES ('516', '2', '17621031', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '2', '17621032', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '2', '17621033', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '2', '17621034', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '2', '17621035', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '2', '17621036', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '2', '17621037', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '2', '17621038', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '2', '17621039', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '2', '17621040', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '2', '17621041', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '3', '17621042', '2');
INSERT INTO `bcnm_battlefield` VALUES ('516', '3', '17621043', '2');
INSERT INTO `bcnm_battlefield` VALUES ('516', '3', '17621044', '2');
INSERT INTO `bcnm_battlefield` VALUES ('516', '3', '17621045', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '3', '17621046', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '3', '17621047', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '3', '17621048', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '3', '17621049', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '3', '17621050', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '3', '17621051', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '3', '17621052', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '3', '17621053', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '3', '17621054', '1');
INSERT INTO `bcnm_battlefield` VALUES ('516', '3', '17621055', '1');
INSERT INTO `bcnm_battlefield` VALUES ('517', '1', '17621056', '3');
INSERT INTO `bcnm_battlefield` VALUES ('517', '2', '17621057', '3');
INSERT INTO `bcnm_battlefield` VALUES ('517', '2', '17621058', '3');
INSERT INTO `bcnm_battlefield` VALUES ('518', '1', '17621059', '3');
INSERT INTO `bcnm_battlefield` VALUES ('518', '2', '17621060', '3');
INSERT INTO `bcnm_battlefield` VALUES ('518', '3', '17621061', '3');
INSERT INTO `bcnm_battlefield` VALUES ('519', '1', '17621062', '3');
INSERT INTO `bcnm_battlefield` VALUES ('519', '2', '17621063', '3');
INSERT INTO `bcnm_battlefield` VALUES ('519', '3', '17621064', '3');
INSERT INTO `bcnm_battlefield` VALUES ('544', '1', '17625089', '3');
INSERT INTO `bcnm_battlefield` VALUES ('544', '2', '17625090', '3');
INSERT INTO `bcnm_battlefield` VALUES ('544', '3', '17625091', '3');
INSERT INTO `bcnm_battlefield` VALUES ('545', '1', '17625092', '3');
INSERT INTO `bcnm_battlefield` VALUES ('545', '2', '17625093', '3');
INSERT INTO `bcnm_battlefield` VALUES ('545', '3', '17625094', '3');
INSERT INTO `bcnm_battlefield` VALUES ('547', '1', '17625110', '3');
INSERT INTO `bcnm_battlefield` VALUES ('547', '2', '17625111', '3');
INSERT INTO `bcnm_battlefield` VALUES ('547', '3', '17625112', '3');
INSERT INTO `bcnm_battlefield` VALUES ('576', '1', '17633281', '3');
INSERT INTO `bcnm_battlefield` VALUES ('576', '2', '17633282', '3');
INSERT INTO `bcnm_battlefield` VALUES ('576', '3', '17633283', '3');
INSERT INTO `bcnm_battlefield` VALUES ('578', '1', '17633287', '3');
INSERT INTO `bcnm_battlefield` VALUES ('578', '2', '17633288', '3');
INSERT INTO `bcnm_battlefield` VALUES ('578', '3', '17633289', '3');
INSERT INTO `bcnm_battlefield` VALUES ('580', '1', '17633305', '3');
INSERT INTO `bcnm_battlefield` VALUES ('580', '2', '17633306', '3');
INSERT INTO `bcnm_battlefield` VALUES ('580', '3', '17633307', '3');
INSERT INTO `bcnm_battlefield` VALUES ('608', '1', '17641473', '3');
INSERT INTO `bcnm_battlefield` VALUES ('608', '2', '17641474', '3');
INSERT INTO `bcnm_battlefield` VALUES ('608', '3', '17641475', '3');
INSERT INTO `bcnm_battlefield` VALUES ('609', '1', '17641476', '3');
INSERT INTO `bcnm_battlefield` VALUES ('609', '2', '17641477', '3');
INSERT INTO `bcnm_battlefield` VALUES ('609', '3', '17641478', '3');
INSERT INTO `bcnm_battlefield` VALUES ('611', '1', '17641494', '3');
INSERT INTO `bcnm_battlefield` VALUES ('611', '2', '17641495', '3');
INSERT INTO `bcnm_battlefield` VALUES ('611', '3', '17641496', '3');
INSERT INTO `bcnm_battlefield` VALUES ('288', '1', '17514497', '3');
INSERT INTO `bcnm_battlefield` VALUES ('288', '2', '17514498', '3');
INSERT INTO `bcnm_battlefield` VALUES ('288', '3', '17514499', '3');
INSERT INTO `bcnm_battlefield` VALUES ('290', '1', '17514500', '3');
INSERT INTO `bcnm_battlefield` VALUES ('290', '2', '17514501', '3');
INSERT INTO `bcnm_battlefield` VALUES ('290', '3', '17514502', '3');
INSERT INTO `bcnm_battlefield` VALUES ('290', '1', '17514503', '0');
INSERT INTO `bcnm_battlefield` VALUES ('290', '2', '17514504', '0');
INSERT INTO `bcnm_battlefield` VALUES ('290', '3', '17514505', '0');
INSERT INTO `bcnm_battlefield` VALUES ('290', '1', '17514506', '0');
INSERT INTO `bcnm_battlefield` VALUES ('290', '2', '17514507', '0');
INSERT INTO `bcnm_battlefield` VALUES ('290', '3', '17514508', '0');
INSERT INTO `bcnm_battlefield` VALUES ('291', '1', '17514509', '3');
INSERT INTO `bcnm_battlefield` VALUES ('291', '2', '17514510', '3');
INSERT INTO `bcnm_battlefield` VALUES ('291', '3', '17514511', '3');
INSERT INTO `bcnm_battlefield` VALUES ('289', '1', '17514512', '3');
INSERT INTO `bcnm_battlefield` VALUES ('289', '2', '17514513', '3');
INSERT INTO `bcnm_battlefield` VALUES ('289', '3', '17514514', '3');
INSERT INTO `bcnm_battlefield` VALUES ('292', '1', '17514515', '3');
INSERT INTO `bcnm_battlefield` VALUES ('292', '2', '17514516', '3');
INSERT INTO `bcnm_battlefield` VALUES ('292', '3', '17514517', '3');
INSERT INTO `bcnm_battlefield` VALUES ('292', '1', '17514518', '0');
INSERT INTO `bcnm_battlefield` VALUES ('292', '2', '17514519', '0');
INSERT INTO `bcnm_battlefield` VALUES ('292', '3', '17514520', '0');
INSERT INTO `bcnm_battlefield` VALUES ('293', '1', '17514521', '3');
INSERT INTO `bcnm_battlefield` VALUES ('293', '1', '17514522', '3');
INSERT INTO `bcnm_battlefield` VALUES ('293', '1', '17514523', '0');
INSERT INTO `bcnm_battlefield` VALUES ('293', '1', '17514524', '0');
INSERT INTO `bcnm_battlefield` VALUES ('293', '1', '17514525', '3');
INSERT INTO `bcnm_battlefield` VALUES ('293', '1', '17514526', '3');
INSERT INTO `bcnm_battlefield` VALUES ('293', '1', '17514527', '3');
INSERT INTO `bcnm_battlefield` VALUES ('293', '1', '17514528', '0');
INSERT INTO `bcnm_battlefield` VALUES ('293', '2', '17514529', '3');
INSERT INTO `bcnm_battlefield` VALUES ('293', '2', '17514530', '3');
INSERT INTO `bcnm_battlefield` VALUES ('293', '2', '17514531', '0');
INSERT INTO `bcnm_battlefield` VALUES ('293', '2', '17514532', '0');
INSERT INTO `bcnm_battlefield` VALUES ('293', '2', '17514533', '3');
INSERT INTO `bcnm_battlefield` VALUES ('293', '2', '17514534', '3');
INSERT INTO `bcnm_battlefield` VALUES ('293', '2', '17514535', '3');
INSERT INTO `bcnm_battlefield` VALUES ('293', '2', '17514536', '0');
INSERT INTO `bcnm_battlefield` VALUES ('293', '3', '17514537', '3');
INSERT INTO `bcnm_battlefield` VALUES ('293', '3', '17514538', '3');
INSERT INTO `bcnm_battlefield` VALUES ('293', '3', '17514539', '3');
INSERT INTO `bcnm_battlefield` VALUES ('293', '3', '17514540', '0');
INSERT INTO `bcnm_battlefield` VALUES ('293', '3', '17514541', '3');
INSERT INTO `bcnm_battlefield` VALUES ('293', '3', '17514542', '3');
INSERT INTO `bcnm_battlefield` VALUES ('293', '3', '17514543', '3');
INSERT INTO `bcnm_battlefield` VALUES ('293', '3', '17514544', '3');
INSERT INTO `bcnm_battlefield` VALUES ('532', '1', '17621290', '3');
INSERT INTO `bcnm_battlefield` VALUES ('532', '1', '17621291', '3');
INSERT INTO `bcnm_battlefield` VALUES ('532', '1', '17621292', '3');
INSERT INTO `bcnm_battlefield` VALUES ('532', '1', '17621293', '3');
INSERT INTO `bcnm_battlefield` VALUES ('532', '2', '17621294', '3');
INSERT INTO `bcnm_battlefield` VALUES ('532', '2', '17621295', '3');
INSERT INTO `bcnm_battlefield` VALUES ('532', '2', '17621296', '3');
INSERT INTO `bcnm_battlefield` VALUES ('532', '2', '17621297', '3');
INSERT INTO `bcnm_battlefield` VALUES ('532', '3', '17621298', '3');
INSERT INTO `bcnm_battlefield` VALUES ('532', '3', '17621299', '3');
INSERT INTO `bcnm_battlefield` VALUES ('532', '3', '17621300', '3');
INSERT INTO `bcnm_battlefield` VALUES ('532', '3', '17621301', '3');
INSERT INTO `bcnm_battlefield` VALUES ('640', '1', '16801793', '3');
INSERT INTO `bcnm_battlefield` VALUES ('640', '2', '16801794', '3');
INSERT INTO `bcnm_battlefield` VALUES ('640', '3', '16801795', '3');
INSERT INTO `bcnm_battlefield` VALUES ('672', '1', '16809987', '3');
INSERT INTO `bcnm_battlefield` VALUES ('672', '1', '16809986', '3');
INSERT INTO `bcnm_battlefield` VALUES ('672', '1', '16809985', '3');
INSERT INTO `bcnm_battlefield` VALUES ('672', '1', '16809989', '0');
INSERT INTO `bcnm_battlefield` VALUES ('672', '1', '16809988', '0');
INSERT INTO `bcnm_battlefield` VALUES ('672', '2', '16809992', '3');
INSERT INTO `bcnm_battlefield` VALUES ('672', '2', '16809991', '3');
INSERT INTO `bcnm_battlefield` VALUES ('672', '2', '16809990', '3');
INSERT INTO `bcnm_battlefield` VALUES ('672', '2', '16809994', '0');
INSERT INTO `bcnm_battlefield` VALUES ('672', '2', '16809993', '0');
INSERT INTO `bcnm_battlefield` VALUES ('672', '3', '16809997', '3');
INSERT INTO `bcnm_battlefield` VALUES ('672', '3', '16809996', '3');
INSERT INTO `bcnm_battlefield` VALUES ('672', '3', '16809995', '3');
INSERT INTO `bcnm_battlefield` VALUES ('672', '3', '16809999', '0');
INSERT INTO `bcnm_battlefield` VALUES ('672', '3', '16809998', '0');
INSERT INTO `bcnm_battlefield` VALUES ('673', '1', '16810018', '3');	-- Race Runner
INSERT INTO `bcnm_battlefield` VALUES ('736', '1', '16830466', '3');
INSERT INTO `bcnm_battlefield` VALUES ('736', '1', '16830465', '3');
INSERT INTO `bcnm_battlefield` VALUES ('736', '1', '16830468', '3');
INSERT INTO `bcnm_battlefield` VALUES ('736', '1', '16830467', '3');
INSERT INTO `bcnm_battlefield` VALUES ('736', '1', '16830469', '3');
INSERT INTO `bcnm_battlefield` VALUES ('736', '2', '16830471', '3');
INSERT INTO `bcnm_battlefield` VALUES ('736', '2', '16830470', '3');
INSERT INTO `bcnm_battlefield` VALUES ('736', '2', '16830473', '3');
INSERT INTO `bcnm_battlefield` VALUES ('736', '2', '16830472', '3');
INSERT INTO `bcnm_battlefield` VALUES ('736', '2', '16830474', '3');
INSERT INTO `bcnm_battlefield` VALUES ('736', '3', '16830476', '3');
INSERT INTO `bcnm_battlefield` VALUES ('736', '3', '16830475', '3');
INSERT INTO `bcnm_battlefield` VALUES ('736', '3', '16830478', '3');
INSERT INTO `bcnm_battlefield` VALUES ('736', '3', '16830477', '3');
INSERT INTO `bcnm_battlefield` VALUES ('736', '3', '16830479', '3');
INSERT INTO `bcnm_battlefield` VALUES ('768', '1', '16846849', '3');
INSERT INTO `bcnm_battlefield` VALUES ('768', '2', '16846850', '3');
INSERT INTO `bcnm_battlefield` VALUES ('768', '3', '16846851', '3');
INSERT INTO `bcnm_battlefield` VALUES ('800', '1', '16855041', '3');
INSERT INTO `bcnm_battlefield` VALUES ('800', '2', '16855046', '3');
INSERT INTO `bcnm_battlefield` VALUES ('800', '3', '16855051', '3');
INSERT INTO `bcnm_battlefield` VALUES ('832', '1', '16863233', '3');
INSERT INTO `bcnm_battlefield` VALUES ('832', '2', '16863234', '3');
INSERT INTO `bcnm_battlefield` VALUES ('832', '3', '16863235', '3');
INSERT INTO `bcnm_battlefield` VALUES ('864', '1', '16871425', '3');
INSERT INTO `bcnm_battlefield` VALUES ('864', '1', '16871426', '3');
INSERT INTO `bcnm_battlefield` VALUES ('864', '1', '16871431', '3');
INSERT INTO `bcnm_battlefield` VALUES ('864', '2', '16871432', '3');
INSERT INTO `bcnm_battlefield` VALUES ('864', '2', '16871433', '3');
INSERT INTO `bcnm_battlefield` VALUES ('864', '2', '16871438', '3');
INSERT INTO `bcnm_battlefield` VALUES ('864', '3', '16871439', '3');
INSERT INTO `bcnm_battlefield` VALUES ('864', '3', '16871440', '3');
INSERT INTO `bcnm_battlefield` VALUES ('864', '3', '16871445', '3');
INSERT INTO `bcnm_battlefield` VALUES ('896', '1', '16896156', '3');
INSERT INTO `bcnm_battlefield` VALUES ('960', '1', '16904193', '3');
INSERT INTO `bcnm_battlefield` VALUES ('960', '1', '16904194', '3');
INSERT INTO `bcnm_battlefield` VALUES ('960', '1', '16904195', '3');
INSERT INTO `bcnm_battlefield` VALUES ('960', '2', '16904196', '3');
INSERT INTO `bcnm_battlefield` VALUES ('960', '2', '16904197', '3');
INSERT INTO `bcnm_battlefield` VALUES ('960', '2', '16904198', '3');
INSERT INTO `bcnm_battlefield` VALUES ('960', '3', '16904199', '3');
INSERT INTO `bcnm_battlefield` VALUES ('960', '3', '16904200', '3');
INSERT INTO `bcnm_battlefield` VALUES ('960', '3', '16904201', '3');
INSERT INTO `bcnm_battlefield` VALUES ('961', '1', '16904202', '3');
INSERT INTO `bcnm_battlefield` VALUES ('961', '2', '16904203', '3');
INSERT INTO `bcnm_battlefield` VALUES ('961', '3', '16904204', '3');
INSERT INTO `bcnm_battlefield` VALUES ('704', '1', '16818177', '3');
INSERT INTO `bcnm_battlefield` VALUES ('704', '1', '16818178', '1');
INSERT INTO `bcnm_battlefield` VALUES ('704', '1', '16818179', '1');
INSERT INTO `bcnm_battlefield` VALUES ('704', '1', '16818180', '1');
INSERT INTO `bcnm_battlefield` VALUES ('704', '1', '16818181', '1');
INSERT INTO `bcnm_battlefield` VALUES ('704', '1', '16818182', '1');
INSERT INTO `bcnm_battlefield` VALUES ('704', '1', '16818183', '1');
INSERT INTO `bcnm_battlefield` VALUES ('704', '2', '16818184', '3');
INSERT INTO `bcnm_battlefield` VALUES ('704', '2', '16818185', '1');
INSERT INTO `bcnm_battlefield` VALUES ('704', '2', '16818186', '1');
INSERT INTO `bcnm_battlefield` VALUES ('704', '2', '16818187', '1');
INSERT INTO `bcnm_battlefield` VALUES ('704', '2', '16818188', '1');
INSERT INTO `bcnm_battlefield` VALUES ('704', '2', '16818189', '1');
INSERT INTO `bcnm_battlefield` VALUES ('704', '2', '16818190', '1');
INSERT INTO `bcnm_battlefield` VALUES ('704', '3', '16818191', '3');
INSERT INTO `bcnm_battlefield` VALUES ('704', '3', '16818192', '1');
INSERT INTO `bcnm_battlefield` VALUES ('704', '3', '16818193', '1');
INSERT INTO `bcnm_battlefield` VALUES ('704', '3', '16818194', '1');
INSERT INTO `bcnm_battlefield` VALUES ('704', '3', '16818195', '1');
INSERT INTO `bcnm_battlefield` VALUES ('704', '3', '16818196', '1');
INSERT INTO `bcnm_battlefield` VALUES ('704', '3', '16818197', '1');
INSERT INTO `bcnm_battlefield` VALUES ('706', '1', '16818204', '3');
INSERT INTO `bcnm_battlefield` VALUES ('706', '1', '16818205', '1');
INSERT INTO `bcnm_battlefield` VALUES ('706', '1', '16818206', '1');
INSERT INTO `bcnm_battlefield` VALUES ('706', '1', '16818207', '1');
INSERT INTO `bcnm_battlefield` VALUES ('706', '1', '16818208', '1');
INSERT INTO `bcnm_battlefield` VALUES ('706', '1', '16818209', '1');
INSERT INTO `bcnm_battlefield` VALUES ('706', '1', '16818210', '1');
INSERT INTO `bcnm_battlefield` VALUES ('706', '2', '16818211', '3');
INSERT INTO `bcnm_battlefield` VALUES ('706', '2', '16818212', '1');
INSERT INTO `bcnm_battlefield` VALUES ('706', '2', '16818213', '1');
INSERT INTO `bcnm_battlefield` VALUES ('706', '2', '16818214', '1');
INSERT INTO `bcnm_battlefield` VALUES ('706', '2', '16818215', '1');
INSERT INTO `bcnm_battlefield` VALUES ('706', '2', '16818216', '1');
INSERT INTO `bcnm_battlefield` VALUES ('706', '2', '16818217', '1');
INSERT INTO `bcnm_battlefield` VALUES ('706', '3', '16818218', '3');
INSERT INTO `bcnm_battlefield` VALUES ('706', '3', '16818219', '1');
INSERT INTO `bcnm_battlefield` VALUES ('706', '3', '16818220', '1');
INSERT INTO `bcnm_battlefield` VALUES ('706', '3', '16818221', '1');
INSERT INTO `bcnm_battlefield` VALUES ('706', '3', '16818222', '1');
INSERT INTO `bcnm_battlefield` VALUES ('706', '3', '16818223', '1');
INSERT INTO `bcnm_battlefield` VALUES ('706', '3', '16818224', '1');
INSERT INTO `bcnm_battlefield` VALUES ('577', '1', '17633284', '3');
INSERT INTO `bcnm_battlefield` VALUES ('577', '2', '17633285', '3');
INSERT INTO `bcnm_battlefield` VALUES ('577', '3', '17633286', '3');
INSERT INTO `bcnm_battlefield` VALUES ('481', '1', '17608708', '3');
INSERT INTO `bcnm_battlefield` VALUES ('481', '1', '17608709', '3');
INSERT INTO `bcnm_battlefield` VALUES ('481', '1', '17608710', '3');
INSERT INTO `bcnm_battlefield` VALUES ('481', '1', '17608711', '3');
INSERT INTO `bcnm_battlefield` VALUES ('481', '1', '17608712', '3');
INSERT INTO `bcnm_battlefield` VALUES ('481', '1', '17608713', '3');
INSERT INTO `bcnm_battlefield` VALUES ('481', '2', '17608714', '3');
INSERT INTO `bcnm_battlefield` VALUES ('481', '2', '17608715', '3');
INSERT INTO `bcnm_battlefield` VALUES ('481', '2', '17608716', '3');
INSERT INTO `bcnm_battlefield` VALUES ('481', '2', '17608717', '3');
INSERT INTO `bcnm_battlefield` VALUES ('481', '2', '17608718', '3');
INSERT INTO `bcnm_battlefield` VALUES ('481', '2', '17608719', '3');
INSERT INTO `bcnm_battlefield` VALUES ('481', '3', '17608720', '3');
INSERT INTO `bcnm_battlefield` VALUES ('481', '3', '17608721', '3');
INSERT INTO `bcnm_battlefield` VALUES ('481', '3', '17608722', '3');
INSERT INTO `bcnm_battlefield` VALUES ('481', '3', '17608723', '3');
INSERT INTO `bcnm_battlefield` VALUES ('481', '3', '17608724', '3');
INSERT INTO `bcnm_battlefield` VALUES ('481', '3', '17608725', '3');
INSERT INTO `bcnm_battlefield` VALUES ('417', '1', '17600516', '3');
INSERT INTO `bcnm_battlefield` VALUES ('417', '2', '17600517', '3');
INSERT INTO `bcnm_battlefield` VALUES ('417', '3', '17600518', '3');
INSERT INTO `bcnm_battlefield` VALUES ('449', '1', '17604612', '3');
INSERT INTO `bcnm_battlefield` VALUES ('449', '1', '17604613', '3');
INSERT INTO `bcnm_battlefield` VALUES ('449', '2', '17604614', '3');
INSERT INTO `bcnm_battlefield` VALUES ('449', '2', '17604615', '3');
INSERT INTO `bcnm_battlefield` VALUES ('449', '3', '17604616', '3');
INSERT INTO `bcnm_battlefield` VALUES ('449', '3', '17604617', '3');
INSERT INTO `bcnm_battlefield` VALUES ('992','1','16908289','1');
INSERT INTO `bcnm_battlefield` VALUES ('992','1','16908290','1');
INSERT INTO `bcnm_battlefield` VALUES ('992','1','16908291','1');
INSERT INTO `bcnm_battlefield` VALUES ('992','1','16908292','1');
INSERT INTO `bcnm_battlefield` VALUES ('992','1','16908293','1');
INSERT INTO `bcnm_battlefield` VALUES ('992','1','16908294','2');
INSERT INTO `bcnm_battlefield` VALUES ('992','1','16908295','2');
INSERT INTO `bcnm_battlefield` VALUES ('992','2','16908296','1');
INSERT INTO `bcnm_battlefield` VALUES ('992','2','16908297','1');
INSERT INTO `bcnm_battlefield` VALUES ('992','2','16908298','1');
INSERT INTO `bcnm_battlefield` VALUES ('992','2','16908299','1');
INSERT INTO `bcnm_battlefield` VALUES ('992','2','16908300','1');
INSERT INTO `bcnm_battlefield` VALUES ('992','2','16908301','2');
INSERT INTO `bcnm_battlefield` VALUES ('992','2','16908302','2');
INSERT INTO `bcnm_battlefield` VALUES ('992','3','16908303','1');
INSERT INTO `bcnm_battlefield` VALUES ('992','3','16908304','1');
INSERT INTO `bcnm_battlefield` VALUES ('992','3','16908305','1');
INSERT INTO `bcnm_battlefield` VALUES ('992','3','16908306','1');
INSERT INTO `bcnm_battlefield` VALUES ('992','3','16908307','1');
INSERT INTO `bcnm_battlefield` VALUES ('992','3','16908308','2');
INSERT INTO `bcnm_battlefield` VALUES ('992','3','16908309','2');
INSERT INTO `bcnm_battlefield` VALUES ('993','1','16908311','0');
INSERT INTO `bcnm_battlefield` VALUES ('993','1','16908312','0');
INSERT INTO `bcnm_battlefield` VALUES ('993','1','16908313','0');
INSERT INTO `bcnm_battlefield` VALUES ('993','1','16908310','3');
INSERT INTO `bcnm_battlefield` VALUES ('993','2','16908314','3');
INSERT INTO `bcnm_battlefield` VALUES ('993','2','16908315','0');
INSERT INTO `bcnm_battlefield` VALUES ('993','2','16908316','0');
INSERT INTO `bcnm_battlefield` VALUES ('993','2','16908317','0');
INSERT INTO `bcnm_battlefield` VALUES ('993','3','16908318','3');
INSERT INTO `bcnm_battlefield` VALUES ('993','3','16908319','0');
INSERT INTO `bcnm_battlefield` VALUES ('993','3','16908320','0');
INSERT INTO `bcnm_battlefield` VALUES ('993','3','16908321','0');
INSERT INTO `bcnm_battlefield` VALUES ('1024','1','16921011','3');
INSERT INTO `bcnm_battlefield` VALUES ('1024','1','16921012','3');
INSERT INTO `bcnm_battlefield` VALUES ('1024','1','16921013','3');
INSERT INTO `bcnm_battlefield` VALUES ('1024','1','16921014','3');
INSERT INTO `bcnm_battlefield` VALUES ('1056','1','16924673','1');
INSERT INTO `bcnm_battlefield` VALUES ('1056','1','16924674','2');
INSERT INTO `bcnm_battlefield` VALUES ('1056','2','16924675','1');
INSERT INTO `bcnm_battlefield` VALUES ('1056','2','16924676','2');
INSERT INTO `bcnm_battlefield` VALUES ('1056','3','16924677','1');
INSERT INTO `bcnm_battlefield` VALUES ('1056','3','16924678','2');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539350', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539351', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539352', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539353', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539354', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539355', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539356', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539357', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539358', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539359', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539360', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539361', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539362', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539363', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539364', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539365', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539366', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539367', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539368', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539369', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539370', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539371', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539372', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539373', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539374', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539375', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539376', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539377', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539378', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539379', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539380', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539381', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539382', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539383', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539384', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539385', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539386', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539387', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539388', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539389', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539390', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539391', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539392', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539393', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539394', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539395', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539396', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539397', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539398', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539399', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539400', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539401', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539402', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539403', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539404', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539405', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539406', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539407', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539408', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539409', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539410', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539411', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539412', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539413', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539414', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539415', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539416', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539417', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539418', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539419', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539420', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539421', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539422', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539423', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539424', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539425', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539426', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539427', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539428', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539429', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539430', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539431', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539432', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539433', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539434', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539435', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539436', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539437', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539438', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539439', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539440', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539441', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539442', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539443', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539444', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539445', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539446', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539447', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539448', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539449', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539450', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '1', '17539451', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539452', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539453', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539454', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539455', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539456', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539457', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539458', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539459', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539460', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539461', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539462', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539463', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539464', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539465', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539466', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539467', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539468', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539469', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539470', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539471', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539472', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539473', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539474', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539475', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539476', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539477', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539478', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539479', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539480', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539481', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539482', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1280', '2', '17539483', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535250', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535251', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535252', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535253', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535254', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535255', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535256', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535257', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535258', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535259', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535260', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535261', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535262', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535263', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535264', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535265', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535266', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535267', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535268', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535269', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535270', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535271', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535272', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535273', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535274', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535275', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535276', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535277', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535278', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535279', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535280', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535281', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535282', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535283', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535284', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535285', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535286', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535287', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535288', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535289', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535290', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535291', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535292', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535293', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535294', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535295', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535296', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535297', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535298', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535299', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535300', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535301', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535302', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535303', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535304', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535305', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535306', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535307', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535308', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535309', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535310', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535311', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535312', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535313', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535314', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535315', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535316', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535317', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535318', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535319', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535320', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535321', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535322', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535323', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535324', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535325', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535326', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535327', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535328', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535329', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535330', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535331', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535332', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535333', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535334', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535335', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535336', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535337', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535338', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535339', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535340', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535341', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535342', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535343', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535344', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535345', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535346', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535347', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535348', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '1', '17535349', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '2', '17535356', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '2', '17535357', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '2', '17535358', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '2', '17535359', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '2', '17535360', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '2', '17535361', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '2', '17535362', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '2', '17535363', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '2', '17535364', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '2', '17535365', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '2', '17535366', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '2', '17535367', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '2', '17535368', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '2', '17535369', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '2', '17535370', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '2', '17535371', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '2', '17535372', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '2', '17535373', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '2', '17535374', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '2', '17535375', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '2', '17535376', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '2', '17535377', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '2', '17535378', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '2', '17535379', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1281', '2', '17535380', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543461', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543462', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543463', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543490', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543491', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543492', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543493', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543494', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543495', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543496', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543497', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543498', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543499', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543500', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543501', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543502', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543503', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543504', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543505', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543506', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543507', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543508', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543509', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543510', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543511', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543512', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543513', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543514', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543515', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543516', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543517', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543518', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543519', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543520', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543521', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543522', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543527', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543528', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543529', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543532', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543533', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543534', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543538', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543539', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543540', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543541', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543542', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543545', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543548', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543550', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543553', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543556', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543560', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543362', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543363', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543564', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543565', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543567', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543569', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543570', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543571', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543572', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543573', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543577', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543580', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543581', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543582', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543583', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '1', '17543392', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '2', '17543601', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '2', '17543602', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '2', '17543603', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '2', '17543604', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '2', '17543605', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '2', '17543606', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '2', '17543607', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '2', '17543608', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '2', '17543609', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '2', '17543610', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '2', '17543611', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '2', '17543612', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '2', '17543613', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '2', '17543614', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '2', '17543615', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '2', '17543616', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '2', '17543617', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '2', '17543618', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '2', '17543619', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '2', '17543620', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '2', '17543621', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '2', '17543622', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '2', '17543623', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '2', '17543624', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1282', '2', '17543625', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547530', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547531', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547532', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547533', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547534', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547535', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547536', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547537', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547538', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547539', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547540', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547541', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547542', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547543', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547544', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547545', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547546', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547547', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547548', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547549', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547550', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547551', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547552', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547553', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547554', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547555', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547556', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547557', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547558', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547559', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547560', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547561', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547562', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547563', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547564', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547565', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547566', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547567', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547568', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547569', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547570', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547571', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547572', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547573', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547574', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547575', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547576', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547577', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547578', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547579', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547580', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547581', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547582', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547583', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547584', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547585', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547586', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547587', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547588', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547589', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547590', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547591', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547592', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547593', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547594', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547595', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547596', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547597', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547598', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547599', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547600', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547601', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547602', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547603', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547604', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547605', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '1', '17547606', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547649', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547650', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547651', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547652', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547653', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547654', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547655', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547656', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547657', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547658', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547659', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547660', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547661', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547662', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547663', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547664', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547665', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547666', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547667', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547668', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547669', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547670', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547671', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547672', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547673', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547674', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547675', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547676', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547677', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1283', '2', '17547678', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326207', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326279', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326353', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326468', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326830', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326831', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326832', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326833', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326834', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326835', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326836', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326837', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326838', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326839', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326840', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326841', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326842', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326843', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326844', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326845', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326846', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326847', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326848', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326849', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326850', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326851', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326852', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326853', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326854', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326855', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326856', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326857', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326858', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326859', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326860', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326861', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326862', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326863', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326864', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326865', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326866', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326867', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326868', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326869', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326870', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326871', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326872', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326873', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326874', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326875', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326876', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326877', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326878', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326879', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326880', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326881', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326882', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326883', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326884', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326885', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326886', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326887', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326888', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326889', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326890', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326891', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326892', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326893', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326894', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326895', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326896', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326897', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326898', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326899', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326900', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326901', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326902', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326903', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326904', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326905', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326906', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326907', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326908', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326909', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326910', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326911', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326912', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326913', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326914', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326915', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326916', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326917', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326918', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326919', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326920', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326921', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326922', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326923', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326924', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326925', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326926', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326927', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326928', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326929', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326930', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326931', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326932', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326933', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326934', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326935', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326473', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326478', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326484', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326494', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326501', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326507', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326514', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326519', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326525', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326530', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326536', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326542', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326547', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326558', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326565', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326572', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326579', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326586', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326593', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326600', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326607', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326612', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326617', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326623', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326629', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326634', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326639', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326646', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326651', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326656', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326661', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326668', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326673', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326678', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326683', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326688', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326692', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326696', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326701', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326721', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326727', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326732', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326737', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326742', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326748', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326754', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326765', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326771', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326781', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326786', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326790', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1284', '1', '17326081', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330199', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330200', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330201', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330202', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330203', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330204', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330205', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330206', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330207', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330208', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330209', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330210', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330211', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330212', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330213', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330214', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330293', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330302', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330312', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330322', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330534', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330340', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330350', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330358', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330368', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330531', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330375', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330812', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330386', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330398', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330426', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330438', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330448', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330460', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330498', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330506', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330542', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330549', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330562', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330567', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330581', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330586', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330610', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330617', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330631', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330636', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330662', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330668', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330685', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330690', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330718', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330756', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330815', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330816', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330817', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330818', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330819', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330820', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330821', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330822', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330533', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330823', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330824', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330825', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330826', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330827', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330828', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330829', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330831', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330832', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330833', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330834', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330835', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330836', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330837', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330838', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330839', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330840', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330841', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330842', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330843', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330844', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330845', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330846', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330847', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330848', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330849', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330850', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330851', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330852', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330853', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330854', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330855', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330856', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330857', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330858', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330859', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330860', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330861', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330862', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330863', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330864', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330865', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330866', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330867', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330868', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330869', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330870', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330871', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330872', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330873', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330874', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330875', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330876', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330877', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330878', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330879', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330880', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330881', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330882', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330883', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330884', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330885', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330886', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330887', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330888', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330889', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330890', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330891', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330892', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330893', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330894', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330895', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330896', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330897', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330898', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330899', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330900', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330901', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330902', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330903', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330904', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330905', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330906', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330907', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330908', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330909', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330910', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330913', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330914', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330915', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330916', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330917', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330918', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330507', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330508', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330509', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330510', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330511', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330512', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330519', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330520', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330521', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1285', '1', '17330528', '3');
-- dyna valk
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16936961', '3'); -- MEGABOSS
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937051', '3'); -- BOSS
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937077', '3'); -- BOSS
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937100', '3'); -- BOSS
-- statue
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937208',  '3'); -- orc spawner n277
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937209',  '3'); -- orc spawner n269
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937210',  '3'); -- orc spawner n281
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937211',  '3'); -- orc spawner n273
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937214',  '3'); -- timer
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937233',  '3'); -- HP statue
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937234',  '3'); -- quadav spawner n286
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937235',  '3'); -- quadav spawner n298
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937236',  '3'); -- quadav spawner n294
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937239',  '3'); -- timer
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937258',  '3'); -- yag spawner n303
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937259',  '3'); -- yag spawner n307
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937260',  '3'); -- yag spawner n311
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937261',  '3'); -- yag spawner n315
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937264',  '3'); -- timer
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937283',  '3'); -- HP statu
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937284',  '3'); -- MP statue
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937285',  '3'); -- gob spawner
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937286',  '3'); -- gob spawner
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937289',  '3'); -- timer
-- Base mob
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937437',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937438',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937439',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937440',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937441',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937442',   '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937443',   '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937444',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937445',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937446',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937447',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937448',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937449',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937450',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937451',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937452',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937453',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937454',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937165',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937166',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937167',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937168',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937375',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937376',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16936962',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16936963',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16936964',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16936965',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16936966',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16936967',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16936968',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16936969',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16936970',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16936971',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16936972',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16936973',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16936974',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16936975',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16936976',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16936977',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16936978',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16936979',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16936980',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16936981',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16936982',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16936983',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16936984',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16936985',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16936986',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937116',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937117',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937118',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937119',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937120',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937121',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937122',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937123',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937124',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937125',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937126',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937127',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937128',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937129',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937130',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937131',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937132',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937133',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937134',  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937135',  '3');
-- manticore
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937355','3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937356','3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937357','3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937358','3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937359','3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937360','3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937361','3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937362', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937363','3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937364','3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937365','3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937366', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937367', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937368', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937369','3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937370', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937371', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937372', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937373', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1', '16937374', '3');
-- Nightmare_Fly
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937012', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937013', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937014', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937015', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937016', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937017', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937018', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937019', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937020', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937021', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937022', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937023', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937024', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937025', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937026', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937027', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937028', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937029', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937030', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937031', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937032', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937033', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937034', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937035', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937036', '3');
-- trean
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937052','3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937053', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937054','3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937055', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937056','3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937057', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937058', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937059', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937060', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937061', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937062', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937037', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937038', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937039', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937040','3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937041', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937042', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937043', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937044', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937045', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937046', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937047', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937048','3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937049','3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937050','3');
-- goobue
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937063','3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937064', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937065','3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937066', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937067', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937068', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937069', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937070', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937071', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937072', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937073', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937074', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937075', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937076', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937078', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937079', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937080', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937081', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937082', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937083', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937084', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937085', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937086', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937087', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937088', '3');
-- Nightmare_Funguar
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937089','3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937090', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937091', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937092', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937093', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937094', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937095', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937096', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937097', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937098','3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937099', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937101', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937102', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937103', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937104', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937105', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937106', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937107', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937108', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937109', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937110', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937111', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937112', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937113', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937114', '3');
-- Nightmare_Flytrap
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937140', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937141', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937142', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937143', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937144', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937145', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937146', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937147', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937148', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937149', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937150', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937151', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937152', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937153', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937154', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937155', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937156', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937157', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937158', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937159', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937160', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937161', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937162', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937163', '3');
INSERT INTO `bcnm_battlefield` VALUES ('1286', '1','16937164', '3');
-- dyna buburimu
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941057', '3'); -- Apocalyptic_Beast
-- statue
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941190', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941191', '3');  -- Ree_Nata_the_Melomanic
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941192', '3');  -- Koo_Rahi_the_Levinblade			
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941208', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941209', '3');  -- Doo_Peku_the_Fleetfoot
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941210', '3');  -- Baa_Dava_the_Bibliophage
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941471', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941472', '3');  -- Va_Rhu_Bodysnatcher
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941473', '3');  -- Te_Zha_Ironclad											
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941485', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941486', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941487', '3'); 		
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941068', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941069', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941070', '3');  -- Woodnix_Shrillwhistle
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941083', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941084', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941085', '3');  -- Shamblix_Rottenheart
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941098', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941099', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941100', '3');  -- Gosspix_Blabberlips				
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941381', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941382', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941383', '3'); 						
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941395', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941396', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941397', '3'); 					
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941118', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941119 ', '3'); -- Flamecaller_Zoeqdoq
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941120', '3');  -- Elvaansticker_Bxafraff
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941135', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941136', '3');  -- Hamfist_Gukhbuk
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941137', '3');  -- Lyncean_Juwgneg				
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941411', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941412', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941413', '3'); 				
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941425', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941426', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941427', '3'); 	 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941153', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941154', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941155', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941171', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941172', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941173', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941440', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941441', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941442', '3'); 					
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941455', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941456', '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941457', '3'); 

INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941364' , '3');      -- BOSS
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941365' , '3');      -- BOSS
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941366' ,'3');       -- BOSS
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941367' ,'3');    -- BOSS

INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941458' , '3');  -- timer  statue
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941121' , '3');   -- timer  statue
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941071' , '3');   -- timer  statue
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941211' , '3');   -- timer  statue
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941086' , '3');  -- timer  statue
--  'Nightmare_Crab'
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941212' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941213' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941214' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941215' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941216' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941217' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941218' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941219' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941220' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941221' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941222' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941223' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941224' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941225' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941226' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941227' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941228' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941229' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941230' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941231' , '3');
--  'Nightmare_Dhalmel'
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941232' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941233' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941234' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941235' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941236' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941237' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941238' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941239' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941240' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941241' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941242' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941243' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941244' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941245' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941246' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941247' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941248' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941249' ,  '3');
-- 'Nightmare_Uragnite'
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941250' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941251' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941252' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941253' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941254' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941255' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941256' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941257' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941258' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941259' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941260' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941261' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941262' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941263' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941264' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941265' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941266' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941267' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941268' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941269' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941270' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941271' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941272' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941273' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941274' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941275' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941276' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941277' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941278' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941279' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941280' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941281' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941282' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941283' ,  '3');
-- 'Nightmare_Bunny'
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941284' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941285' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941286' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941287' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941288' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941289' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941290' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941291' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941292' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941293' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941294' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941295' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941296' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941297' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941298' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941299' ,  '3');
-- 'Nightmare_Mandragora'
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941300' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941301' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941302' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941303' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941304' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941305' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941306' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941307' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941308' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941309' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941310' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941311' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941312' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941313' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941314' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941315' ,  '3');
-- 'Nightmare_Crawler'
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941316' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941317' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941318' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941319' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941320' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941321' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941322' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941323' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941324' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941325' ,  '3');
-- 'Nightmare_Raven'
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941326' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941327' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941328' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941329' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941330' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941331' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941332' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941333' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941334' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941335' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941336' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941337' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941338' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941339' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941340' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941341' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941342' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941343' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941344' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941345' ,  '3');
-- 'Nightmare_Eft'
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941346' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941347' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941348' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941349' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941350' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941351' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941352' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941353' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941354' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941355' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941356' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941357' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941358' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941359' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941360' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941361' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941362' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1287', '1','16941363' ,  '3');
-- dyna qufim

INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945153' ,  '3'); -- MEGABOOS
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945381' ,  '3'); -- NM
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945287' ,   '3'); -- NM
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945320' ,   '3'); -- NM

INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945477' ,   '3');-- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945478' ,    '3'); -- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945479' ,    '3'); -- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945488' ,    '3'); -- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945489' ,    '3'); -- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945490' ,    '3'); -- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945497' ,    '3'); -- statue

INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945506' ,    '3'); -- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945507' ,    '3'); -- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945508' ,    '3'); -- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945527' ,    '3'); -- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945528' ,    '3'); -- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945529' ,    '3');-- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945536' ,    '3'); -- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945537' ,    '3'); -- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945538' ,    '3'); -- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945545' ,    '3');-- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945546' ,    '3'); -- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945547' ,    '3'); -- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945250' ,    '3'); -- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945251' ,    '3');-- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945252' ,    '3');-- statue

INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945565' ,    '3'); -- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945566' ,    '3'); -- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945567' ,    '3'); -- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945575' ,    '3'); -- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945576' ,    '3'); -- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945577' ,    '3'); -- statue

INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945605' ,    '3'); -- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945606' ,    '3'); -- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945607' ,    '3'); -- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945615' ,    '3'); -- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945616' ,    '3'); -- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945617' ,    '3'); -- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945625' ,    '3'); -- statue
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945626' ,    '3'); -- statue


INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945480' ,     '3'); -- statue  timer +10
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945509' ,    '3'); -- statue  timer +10
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945530' ,     '3');-- statue  timer +20
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945193' ,      '3');-- statue  timer +10
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945243' ,     '3'); -- statue  timer +10
-- 'Nightmare_Kraken'
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945274' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945275' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945276' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945277' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945278' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945279' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945280' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945281' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945282' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945283' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945284' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945285' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945286' ,  '3'); 
--  'Nightmare_Weapon'
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945288' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945289' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945290' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945291' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945292' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945293' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945294' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945295' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945296' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945297' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945298' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945299' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945300' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945301' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945302' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945303' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945304' ,  '3'); 
-- 'Nightmare_Stirge'
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945305' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945306' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945307' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945308' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945309' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945310' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945311' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945312' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945313' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945314' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945315' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945316' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945317' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945318' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945319' ,    '3'); 
-- 'Nightmare_Gaylas'
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945321' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945322' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945323' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945324' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945325' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945326' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945327' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945328' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945329' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945330' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945331' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945332' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945333' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945334' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945335' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945336' ,    '3'); 
-- 'Nightmare_Tiger'
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945337' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945338' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945339' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945340' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945341' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945342' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945343' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945344' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945345' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945346' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945347' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945348' ,   '3'); 
-- 'Nightmare_Diremite'
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945349' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945350' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945351' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945352' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945353' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945354' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945355' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945356' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945357' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945358' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945359' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945360' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945361' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945362' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945363' ,   '3'); 
--  'Nightmare_Roc'
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945364' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945365' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945366' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945404' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945405' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945406' ,  '3'); 
-- 'Nightmare_Raptor'
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945367' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945368' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945369' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945370' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945371' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945372' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945373' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945374' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945375' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945376' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945377' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945378' ,    '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945379' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945380' ,   '3'); 
-- 'Nightmare_Snoll'
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945382' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945383' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945384' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945385' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945386' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945387' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945388' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945389' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945390' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945391' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945392' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945393' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945394' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945395' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945396' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945397' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945398' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945399' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945400' ,   '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945401' ,  '3'); 
INSERT INTO `bcnm_battlefield` VALUES ('1288', '1','16945402' ,    '3'); 
-- dyna tavnazia
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949255' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949256' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949257' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949258' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949259' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949260' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949261' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949262' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949263' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949264' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949265' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949266' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949267' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949268' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949272' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949306' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949380' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949292' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949325' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949273' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949274' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949275' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949276' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949277' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949278' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949279' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949280' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949317' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949318' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949319' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949320' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949321' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949332' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949333' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949334' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949335' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949336' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949337' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949338' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949339' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949340' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949341' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949342' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949343' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949344' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949345' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949346' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949347' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949348' ,'3');
-- eyes third floor
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949475' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949476' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949477' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949478' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949479' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949480' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949481' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949482' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949483' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949484' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949485' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949486' , '3');
-- eyes second floor
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949487' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949488' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949489' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949490' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949491' , '3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949492' ,  '3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949493' ,'3');
INSERT INTO `bcnm_battlefield` VALUES ('1289', '1','16949494' ,'3');
-- //////////////////////////////////////////////////////////////
--               APPOLYON  SE
-- //////////////////////////////////////////////////////////////
-- FIRST FLOOR
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16932993','1');-- 'Metalloid_Amoeba'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16932994','1');-- 'Metalloid_Amoeba'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16932995','1');-- 'Metalloid_Amoeba'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16932996','1');-- 'Metalloid_Amoeba'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16932997','1');-- 'Metalloid_Amoeba'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16932998','1');-- 'Metalloid_Amoeba'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16932999','1');-- 'Metalloid_Amoeba'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16933000','1');-- 'Metalloid_Amoeba'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16932992','1');-- 'Ghost_Clot'
-- Second Floor
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16933007','1');-- 'Adamantshell'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16933008','1');-- 'Adamantshell'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16933009','1');-- 'Adamantshell'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16933010','1');-- 'Adamantshell'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16933011','1');-- 'Adamantshell'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16933012','1');-- 'Adamantshell'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16933013','1');-- 'Adamantshell'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16933014','1');-- 'Adamantshell'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16933006','1');-- 'Tieholtsodi'
-- Third Floor
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16933021','1');-- 'Inhumer'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16933022','1');-- 'Inhumer'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16933023','1');-- 'Inhumer'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16933024','1');-- 'Inhumer'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16933025','1');-- 'Inhumer'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16933026','1');-- 'Inhumer'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16933027','1');-- 'Inhumer'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16933028','1');-- 'Inhumer'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16933020','1');-- 'Grave_Digger'
-- Fourth Floor
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16933032','1');-- 'Evil_Armory'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16933033','1');-- 'Flying_Spear'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16933034','1');-- 'Flying_Spear'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16933035','1');-- 'Flying_Spear'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16933036','1');-- 'Flying_Spear'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16933037','1');-- 'Flying_Spear'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16933038','1');-- 'Flying_Spear'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16933039','1');-- 'Flying_Spear'
INSERT INTO `bcnm_battlefield` VALUES ('1293', '4','16933040','1');-- 'Flying_Spear'

-- ----------------------------------------------------------------
-- //////////////////////////////////////////////////////////////
--               APPOLYON  NE
-- //////////////////////////////////////////////////////////////
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933044','1');-- 'Goobbue_Harvestet'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933045','1');-- 'Barometz'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933046','1');-- 'Borametz'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933047','1');-- 'Barometz'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933048','1');-- 'Borametz'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933049','1');-- 'Barometz'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933050','1');-- 'Borametz'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933051','1');-- 'Barometz'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933052','1');-- 'Borametz'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933055','1');-- 'Barometz'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933056','1');-- 'Borametz'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933057','1');-- 'Barometz'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933058','1');-- 'Borametz'

INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933062','1');-- 'Thiazi'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933063','1');-- 'Thiazi'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933064','1');-- 'Bialozar'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933065','1');-- 'Bialozar'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933066','1');-- 'Cornu'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933067','1');-- 'Cornu'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933068','1');-- 'Cornu'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933069','1');-- 'Cornu'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933070','1');-- 'Sirin'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933071','1');-- 'Sirin'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933072','1');-- 'Sirin'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933073','1');-- 'Sirin'

INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933081','1');-- 'Apollyon_Sweeper'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933082','1');-- 'Apollyon_Cleaner'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933083','1');-- 'Apollyon_Cleaner'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933084','1');-- 'Apollyon_Cleaner'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933085','1');-- 'Apollyon_Cleaner'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933086','1');-- 'Apollyon_Sweeper'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933087','1');-- 'Apollyon_Cleaner'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933088','1');--  'Apollyon_Cleaner'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933090','1');-- 'Apollyon_Cleaner'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933091','1');-- 'Apollyon_Sweeper'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933092','1');-- 'Apollyon_Cleaner'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933093','1');-- 'Apollyon_Cleaner'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933094','1');-- 'Apollyon_Cleaner'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933095','1');-- 'Apollyon_Cleaner'

INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933099','1');-- 'Hyperion'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933100','1');-- 'Okeanos'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933101','1');-- 'Cronos'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933102','1');-- 'Kerkopes'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933103','1');-- 'Kerkopes'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933104','1');-- 'Kerkopes'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933105','1');-- 'Kerkopes'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933106','1');-- 'Kerkopes'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933107','1');-- 'Kerkopes'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933108','1');-- 'Kerkopes'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933109','1');-- 'Kerkopes'

INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933113','1');-- 'Criosphinx'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933114','1');-- 'Hieracosphinx'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933115','1');-- 'Troglodyte_Dhalmel'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933116','1');-- 'Troglodyte_Dhalmel'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933117','1');-- 'Troglodyte_Dhalmel'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933118','1');-- 'Troglodyte_Dhalmel'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933119','1');-- 'Troglodyte_Dhalmel'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933120','1');-- 'Troglodyte_Dhalmel'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933121','1');-- 'Troglodyte_Dhalmel'
INSERT INTO `bcnm_battlefield` VALUES ('1292', '3','16933122','1');-- 'Troglodyte_Dhalmel'
-- //////////////////////////////////////////////////////////////
--               APPOLYON  NW
-- //////////////////////////////////////////////////////////////
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932868','1');-- 'FirBholg'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932869','1');-- 'FirBholg'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932870','1');-- 'FirBholg'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932871','1');-- 'FirBholg'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932872','1');-- 'FirBholg'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932873','1');-- 'FirBholg'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932874','1');-- 'FirBholg'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932875','1');-- 'FirBholg'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932876','1');-- 'FirBholg'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932877','1');-- 'FirBholg'

INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932882','1');-- 'Jidra'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932883','1');-- 'Jidra'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932884','1');-- 'Jidra'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932885','1');-- 'Jidra'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932886','1');-- 'Jidra'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932887','1');-- 'Jidra'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932888','1');-- 'Jidra'

-- INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932889','1');-- 'Arboricole_Hornet'
-- INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932890','1');-- 'Arboricole_Raven'
-- INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932891','1');-- 'Arboricole_Opo-opo'
-- INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932892','1');-- 'Arboricole_Spider'
-- INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932893','1');-- 'Arboricole_Beetle'
-- INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932894','1');-- 'Arboricole_Crawler'
-- INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932895','1');-- 'Apollyon_Sapling'

INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932896','1');-- 'Armoury_Crate'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932897','1');-- 'Armoury_Crate'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932898','1');-- 'Armoury_Crate'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932899','1');-- 'Armoury_Crate'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932900','1');-- 'Armoury_Crate'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932901','1');-- 'Armoury_Crate'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932902','1');-- 'Armoury_Crate'


INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932910','1');-- 'Air_Elemental'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932911','1');-- 'Dark_Elemental'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932912','1');-- 'Earth_Elemental'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932913','1');-- 'Fire_Elemental'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932914','1');-- 'Ice_Elemental'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932915','1');-- 'Light_Elemental'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932916','1');-- 'Water_Elemental'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932917','1');-- 'ThunderElement'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932918','1');-- 'Air_Elemental'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932919','1');-- 'Dark_Elemental'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932920','1');-- 'Earth_Elemental'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932921','1');-- 'Fire_Elemental'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932922','1');-- 'Ice_Elemental'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932923','1');-- 'Light_Elemental'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932924','1');-- 'Water_Elemental'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932925','1');-- 'ThunderElement'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932926','1');-- 'Air_Elemental'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932927','1');-- 'Dark_Elemental'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932928','1');-- 'Earth_Elemental'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932929','1');-- 'Fire_Elemental'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932930','1');-- 'Ice_Elemental'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932931','1');-- 'Light_Elemental'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932932','1');-- 'Water_Elemental'
INSERT INTO `bcnm_battlefield` VALUES ('1291', '2','16932933','1');-- 'Thunder_Elemental'
-- //////////////////////////////////////////////////////////////
--               APPOLYON SW
-- //////////////////////////////////////////////////////////////
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932937','1');-- 'Pluto'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932938','1');-- 'Bardha'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932939','1');-- 'Bardha'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932940','1');-- 'Bardha'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932941','1');-- 'Bardha'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932942','1');-- 'Bardha'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932943','1');-- 'Bardha'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932944','1');-- 'Bardha'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932950','1');-- 'Zlatorog'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932951','1');-- 'Mountain_Buffalo'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932952','1');-- 'Mountain_Buffalo'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932953','1');-- 'Mountain_Buffalo'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932954','1');-- 'Mountain_Buffalo'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932955','1');-- 'Mountain_Buffalo'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932956','1');-- 'Mountain_Buffalo'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932957','1');-- 'Mountain_Buffalo'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932963','1');-- 'Millenary_Mossback'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932964','1');-- 'Apollyon_Scavenger'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932965','1');-- 'Apollyon_Scavenger'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932966','1');-- 'Apollyon_Scavenger'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932967','1');-- 'Apollyon_Scavenger'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932968','1');-- 'Apollyon_Scavenger'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932969','1');-- 'Apollyon_Scavenger'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932970','1');-- 'Apollyon_Scavenger'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932976','1');-- 'Cynoprosopi'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932977','1');-- 'Gorynich'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932978','1');-- 'Gorynich'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932979','1');-- 'Gorynich'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932980','1');-- 'Gorynich'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932981','1');-- 'Gorynich'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932985','1');-- 'Kaiser_Behemoth'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932986','1');-- 'Kronprinz_Behemoth'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932987','1');-- 'Kronprinz_Behemoth'
INSERT INTO `bcnm_battlefield` VALUES ('1290', '1','16932988','1');-- 'Kronprinz_Behemoth'
-- //////////////////////////////////////////////////////////////
--               APPOLYON CS
-- //////////////////////////////////////////////////////////////
INSERT INTO `bcnm_battlefield` VALUES ('1294', '5','16933129','1');-- 'Carnagechief_Jackbodokk'
INSERT INTO `bcnm_battlefield` VALUES ('1294', '5','16933137','1');-- 'Na QbaChirurge'
INSERT INTO `bcnm_battlefield` VALUES ('1294', '5','16933144','1');-- 'DeeWapatheDe'
-- //////////////////////////////////////////////////////////////
--               APPOLYON CENTRAL
-- //////////////////////////////////////////////////////////////
INSERT INTO `bcnm_battlefield` VALUES ('1296', '6','16933124','1');-- 'Proto-Omega'
-- ------------------------------------
-- ------Temenos - Northern Tower
-- ------------------------------------
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928772','1');-- Goblin Slaughterman
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928773','1');-- Goblin Slaughterman
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928774','1');-- Moblin Dustman
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928775','1');-- Moblin Dustman
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928776','1');-- Moblin Dustman
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928777','1');-- Moblin Dustman
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928781','1');-- Skadi
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928782','1');-- Thrym
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928783','1');-- Beli
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928784','1');-- Kari
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928788','1');-- Telchines Bard
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928789','1');-- Telchines White Mage
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928790','1');-- Telchines Dragoon
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928791','1');-- Telchines's Wyvern
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928792','1');-- Telchines Monk
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928793','1');-- Telchines Monk
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928797','1');-- Kindred Warrior
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928798','1');-- Kindred Dark Knight
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928799','1');-- Kindred Summoner
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928800','1');-- Kindred's Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928802','1');-- Kindred Black Mage
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928803','1');-- Kindred Black Mage
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928804','1');-- Kindred Black Mage
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928805','1');-- Kindred Black Mage
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928809','1');-- Praetorian Guard CCXX
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928810','1');-- Praetorian Guard LXXIII
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928811','1');-- Praetorian Guard CXLVIII
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928812','1');-- Praetorian Guard CCCXI
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928816','1');-- Cryptonberry Charmer
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928817','1');-- Cryptonberry Skulker
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928818','1');-- Cryptonberry Abductor
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928819','1');-- Cryptonberry Designator
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928820','1');-- Tonberry's Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928822','1');-- Cryptonberry Abductor
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928823','1');-- Cryptonberry Designator
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928824','1');-- Tonberry's Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928826','1');-- Cryptonberry Abductor
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928827','1');-- Cryptonberry Designator
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928828','1');-- Tonberry's Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928831','1');-- Goblin Warlord
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928832','1');-- Goblin Fencer
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928833','1');-- Goblin Theurgist
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928834','1');-- Goblin Fencer
INSERT INTO `bcnm_battlefield` VALUES ('1299', '2','16928835','1');-- Goblin Theurgist
-- ------------------------
-- --Temenos - Eastern Tower
-- ------------------------
INSERT INTO `bcnm_battlefield` VALUES ('1300', '3','16928840','1');-- Fire Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1300', '3','16928841','1');-- Fire Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1300', '3','16928842','1');-- Fire Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1300', '3','16928843','1');-- Fire Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1300', '3','16928849','1');-- Ice Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1300', '3','16928850','1');-- Ice Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1300', '3','16928851','1');-- Ice Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1300', '3','16928852','1');-- Ice Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1300', '3','16928858','1');-- Air Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1300', '3','16928859','1');-- Air Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1300', '3','16928860','1');-- Air Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1300', '3','16928861','1');-- Air Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1300', '3','16928867','1');-- Earth Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1300', '3','16928868','1');-- Earth Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1300', '3','16928869','1');-- Earth Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1300', '3','16928870','1');-- Earth Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1300', '3','16928876','1');-- Thunder Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1300', '3','16928877','1');-- Thunder Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1300', '3','16928878','1');-- Thunder Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1300', '3','16928879','1');-- Thunder Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1300', '3','16928885','1');-- Water Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1300', '3','16928886','1');-- Water Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1300', '3','16928887','1');-- Water Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1300', '3','16928888','1');-- Water Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1300', '3','16928892','1');-- Dark Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1300', '3','16928893','1');-- Dark Elemental
-- ------------------------
-- Temenos - Western Tower
-- ------------------------
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928898','1');-- Enhanced Tiger
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928899','1');-- Enhanced Tiger
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928900','1');-- Enhanced Tiger
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928901','1');-- Enhanced Tiger
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928902','1');-- Enhanced Tiger
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928903','1');-- Enhanced Tiger
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928904','1');-- Enhanced Tiger
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928905','1');-- Enhanced Tiger
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928906','1');-- Enhanced Tiger
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928910','1');-- Enhanced Mandragora
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928911','1');-- Enhanced Mandragora
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928912','1');-- Enhanced Mandragora
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928913','1');-- Enhanced Mandragora
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928914','1');-- Enhanced Mandragora
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928915','1');-- Enhanced Mandragora
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928916','1');-- Enhanced Mandragora
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928917','1');-- Enhanced Mandragora
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928918','1');-- Enhanced Mandragora
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928922','1');-- Enhanced Beetle
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928923','1');-- Enhanced Beetle
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928924','1');-- Enhanced Beetle
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928925','1');-- Enhanced Beetle
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928926','1');-- Enhanced Beetle
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928927','1');-- Enhanced Beetle
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928931','1');-- Enhanced Lizard
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928932','1');-- Enhanced Lizard
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928933','1');-- Enhanced Lizard
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928934','1');-- Enhanced Lizard
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928935','1');-- Enhanced Lizard
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928936','1');-- Enhanced Lizard
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928937','1');-- Enhanced Lizard
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928938','1');-- Enhanced Lizard
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928939','1');-- Enhanced Lizard
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928943','1');-- Enhanced Slime
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928944','1');-- Enhanced Slime
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928945','1');-- Enhanced Slime
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928946','1');-- Enhanced Slime
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928947','1');-- Enhanced Slime
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928948','1');-- Enhanced Slime
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928952','1');-- Enhanced Pugil
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928953','1');-- Enhanced Pugil
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928954','1');-- Enhanced Pugil
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928955','1');-- Enhanced Pugil
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928956','1');-- Enhanced Pugil
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928957','1');-- Enhanced Pugil
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928959','1');-- Enhanced Vulture
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928960','1');-- Enhanced Vulture
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928961','1');-- Enhanced Vulture
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928962','1');-- Enhanced Vulture
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928963','1');-- Enhanced Vulture
INSERT INTO `bcnm_battlefield` VALUES ('1298', '1','16928964','1');-- Enhanced Vulture
-- ----------------------------
-- Central Temenos - 4th Floor
-- ----------------------------
INSERT INTO `bcnm_battlefield` VALUES ('1306', '8','16928966','1');-- Proto-Ultima
-- --------------------------------
-- Central Temenos - 3rd Floor
-- --------------------------------
INSERT INTO `bcnm_battlefield` VALUES ('1305', '7','16929005','1');-- Abyssdweller Jhabdebb
INSERT INTO `bcnm_battlefield` VALUES ('1305', '7','16929006','1');-- Orichalcum Quadav
INSERT INTO `bcnm_battlefield` VALUES ('1305', '7','16929007','1');-- Pee Qoho the Python
INSERT INTO `bcnm_battlefield` VALUES ('1305', '7','16929009','1');-- Yagudo's Avatar
INSERT INTO `bcnm_battlefield` VALUES ('1305', '7','16929010','1');-- Grognard Mesmerizer
INSERT INTO `bcnm_battlefield` VALUES ('1305', '7','16929011','1');-- Grognard Footsoldier
INSERT INTO `bcnm_battlefield` VALUES ('1305', '7','16929012','1');-- Grognard Predator
INSERT INTO `bcnm_battlefield` VALUES ('1305', '7','16929013','1');-- Grognard Neckchopper
INSERT INTO `bcnm_battlefield` VALUES ('1305', '7','16929014','1');-- Grognard Grappler
INSERT INTO `bcnm_battlefield` VALUES ('1305', '7','16929015','1');-- Grognard Impaler
INSERT INTO `bcnm_battlefield` VALUES ('1305', '7','16929016','1');-- Orc's Wyvern
INSERT INTO `bcnm_battlefield` VALUES ('1305', '7','16929017','1');-- Star Ruby Quadav
INSERT INTO `bcnm_battlefield` VALUES ('1305', '7','16929018','1');-- Fossil Quadav
INSERT INTO `bcnm_battlefield` VALUES ('1305', '7','16929019','1');-- Whitegold Quadav
INSERT INTO `bcnm_battlefield` VALUES ('1305', '7','16929020','1');-- Wootz Quadav
INSERT INTO `bcnm_battlefield` VALUES ('1305', '7','16929021','1');-- Star Sapphire Quadav
INSERT INTO `bcnm_battlefield` VALUES ('1305', '7','16929022','1');-- Lightsteel Quadav
INSERT INTO `bcnm_battlefield` VALUES ('1305', '7','16929023','1');-- Yagudo Archpriest
INSERT INTO `bcnm_battlefield` VALUES ('1305', '7','16929024','1');-- Yagudo Disciplinant
INSERT INTO `bcnm_battlefield` VALUES ('1305', '7','16929025','1');-- Yagudo Kapellmeister
INSERT INTO `bcnm_battlefield` VALUES ('1305', '7','16929026','1');-- Yagudo Knight Templar
INSERT INTO `bcnm_battlefield` VALUES ('1305', '7','16929027','1');-- Yagudo Prelatess
INSERT INTO `bcnm_battlefield` VALUES ('1305', '7','16929028','1');-- Yagudo Eradicator
-- -----------------------------
-- Central Temenos - 2nd Floor
-- ------------------------------
INSERT INTO `bcnm_battlefield` VALUES ('1304', '6','16929030','1');-- Mystic Avatar
INSERT INTO `bcnm_battlefield` VALUES ('1304', '6','16929031','1');-- Light Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1304', '6','16929032','1');-- Light Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1304', '6','16929033','1');-- Fire Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1304', '6','16929034','1');-- Ice Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1304', '6','16929035','1');-- Air Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1304', '6','16929036','1');-- Earth Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1304', '6','16929037','1');-- Thunder Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1304', '6','16929038','1');-- Water Elemental
-- -----------------------------
-- Central Temenos - 1st Floor
-- -----------------------------
INSERT INTO `bcnm_battlefield` VALUES ('1303', '5','16929046','1');-- Airi
INSERT INTO `bcnm_battlefield` VALUES ('1303', '5','16929047','1');-- Temenos Cleaner
INSERT INTO `bcnm_battlefield` VALUES ('1303', '5','16929048','1');-- Iruci
INSERT INTO `bcnm_battlefield` VALUES ('1303', '5','16929049','1');-- Temenos Weapon
INSERT INTO `bcnm_battlefield` VALUES ('1303', '5','16929050','1');-- Enhanced Dragon
INSERT INTO `bcnm_battlefield` VALUES ('1303', '5','16929051','1');-- Enhanced Ahriman
-- -------------------------------
-- Central Temenos - Basement 1
-- ------------------------------
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929053','1');-- Temenos Aern
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929054','1');-- Temenos Aern
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929055','1');-- Temenos Aern
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929056','1');-- Aern's Wynav
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929057','1');-- Temenos Aern
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929058','1');-- Temenos Aern
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929059','1');-- Aern's Euvhi
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929060','1');-- Temenos Aern
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929061','1');-- Temenos Aern
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929062','1');-- Temenos Aern
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929063','1');-- Temenos Aern
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929064','1');-- Temenos Aern
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929065','1');-- Temenos Aern
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929066','1');-- Temenos Aern
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929067','1');-- Aern's Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929069','1');-- Temenos Aern
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929070','1');-- Aern's Wynav
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929071','1');-- Temenos Aern
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929072','1');-- Temenos Aern
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929073','1');-- Temenos Aern
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929074','1');-- Aern's Euvhi
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929075','1');-- Temenos Aern
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929076','1');-- Temenos Aern
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929077','1');-- Temenos Aern
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929078','1');-- Temenos Aern
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929079','1');-- Temenos Aern
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929080','1');-- Aern's Elemental
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929082','1');-- Temenos Aern
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929083','1');-- Temenos Aern
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929084','1');-- Temenos Aern
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929085','1');-- Temenos Aern
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929086','1');-- Temenos Aern
INSERT INTO `bcnm_battlefield` VALUES ('1301', '4','16929087','1');-- Temenos Aern
-- -----------------------------------------
-- -----------------------------------------





