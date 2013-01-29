/*
MySQL Data Transfer
Source Host: localhost
Source Database: dspdb
Target Host: localhost
Target Database: dspdb
Date: 1/28/2013 6:43:56 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for blue_spell_list
-- ----------------------------
DROP TABLE IF EXISTS `blue_spell_list`;
CREATE TABLE `blue_spell_list` (
  `spellid` smallint(3) NOT NULL,
  `mob_skill_id` smallint(4) unsigned NOT NULL,
  `set_points` smallint(2) NOT NULL,
  `trait_category` smallint(2) NOT NULL,
  `trait_category_weight` smallint(2) NOT NULL,
  PRIMARY KEY (`spellid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `blue_spell_list` VALUES ('513', '1316', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('515', '206', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('517', '192', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('519', '196', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('521', '165', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('522', '181', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('524', '170', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('527', '257', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('529', '427', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('530', '313', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('531', '420', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('532', '279', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('533', '253', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('534', '267', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('535', '1390', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('536', '210', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('537', '233', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('538', '274', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('539', '219', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('540', '1522', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('541', '229', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('542', '177', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('543', '23', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('544', '403', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('545', '554', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('547', '90', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('548', '108', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('549', '79', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('551', '82', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('554', '97', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('555', '535', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('557', '293', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('560', '1455', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('561', '245', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('563', '304', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('564', '389', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('565', '565', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('567', '366', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('569', '139', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('570', '138', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('572', '154', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('573', '1445', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('574', '146', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('576', '1457', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('577', '1', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('578', '67', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('579', '1451', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('581', '31', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('582', '397', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('584', '8', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('585', '10', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('587', '17', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('588', '241', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('589', '190', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('591', '544', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('592', '36', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('593', '39', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('594', '328', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('595', '66', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('596', '73', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('597', '431', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('598', '178', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('599', '54', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('603', '46', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('604', '63', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('605', '260', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('608', '121', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('610', '116', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('611', '1128', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('612', '1185', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('614', '1096', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('617', '1191', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('618', '392', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('620', '353', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('622', '409', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('623', '356', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('626', '335', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('629', '104', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('631', '521', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('632', '1488', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('633', '1489', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('634', '529', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('636', '1478', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('637', '1477', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('638', '361', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('640', '1515', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('641', '1510', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('646', '1702', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('647', '1466', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('648', '1897', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('652', '1925', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('656', '2306', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('657', '2308', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('658', '1913', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('662', '269', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('663', '75', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('664', '205', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('665', '80', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('666', '334', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('667', '132', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('668', '299', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('669', '258', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('670', '2373', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('671', '964', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('672', '2375', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('673', '485', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('677', '974', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('678', '45', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('679', '999', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('681', '989', '0', '0', '1');
INSERT INTO `blue_spell_list` VALUES ('682', '1898', '0', '0', '1');
