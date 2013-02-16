/*
MySQL Data Transfer
Source Host: localhost
Source Database: dspdb
Target Host: localhost
Target Database: dspdb
Date: 1/28/2013 6:30:40 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for blue_spell_mods
-- ----------------------------
DROP TABLE IF EXISTS `blue_spell_mods`;
CREATE TABLE `blue_spell_mods` (
  `spellId` smallint(3) unsigned NOT NULL,
  `modid` smallint(5) unsigned NOT NULL,
  `value` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`spellId`,`modid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('513', '13', '2');
INSERT INTO `blue_spell_mods` VALUES ('515', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('517', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('519', '10', '1');
INSERT INTO `blue_spell_mods` VALUES ('519', '14', '1');
INSERT INTO `blue_spell_mods` VALUES ('519', '2', '10');
INSERT INTO `blue_spell_mods` VALUES ('521', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('522', '2', '-5');
INSERT INTO `blue_spell_mods` VALUES ('522', '5', '5');
INSERT INTO `blue_spell_mods` VALUES ('524', '10', '1');
INSERT INTO `blue_spell_mods` VALUES ('527', '11', '3');
INSERT INTO `blue_spell_mods` VALUES ('529', '8', '1');
INSERT INTO `blue_spell_mods` VALUES ('530', '11', '2');
INSERT INTO `blue_spell_mods` VALUES ('531', '12', '1');
INSERT INTO `blue_spell_mods` VALUES ('532', '9', '3');
INSERT INTO `blue_spell_mods` VALUES ('533', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('534', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('535', '12', '-1');
INSERT INTO `blue_spell_mods` VALUES ('536', '13', '1');
INSERT INTO `blue_spell_mods` VALUES ('537', '11', '1');
INSERT INTO `blue_spell_mods` VALUES ('538', '12', '1');
INSERT INTO `blue_spell_mods` VALUES ('539', '2', '-5');
INSERT INTO `blue_spell_mods` VALUES ('539', '5', '10');
INSERT INTO `blue_spell_mods` VALUES ('540', '10', '2');
INSERT INTO `blue_spell_mods` VALUES ('540', '12', '1');
INSERT INTO `blue_spell_mods` VALUES ('540', '13', '1');
INSERT INTO `blue_spell_mods` VALUES ('541', '2', '-5');
INSERT INTO `blue_spell_mods` VALUES ('541', '5', '5');
INSERT INTO `blue_spell_mods` VALUES ('542', '2', '-5');
INSERT INTO `blue_spell_mods` VALUES ('542', '5', '5');
INSERT INTO `blue_spell_mods` VALUES ('543', '12', '1');
INSERT INTO `blue_spell_mods` VALUES ('544', '13', '1');
INSERT INTO `blue_spell_mods` VALUES ('545', '2', '-5');
INSERT INTO `blue_spell_mods` VALUES ('545', '5', '15');
INSERT INTO `blue_spell_mods` VALUES ('547', '9', '3');
INSERT INTO `blue_spell_mods` VALUES ('548', '10', '1');
INSERT INTO `blue_spell_mods` VALUES ('549', '2', '5');
INSERT INTO `blue_spell_mods` VALUES ('549', '14', '1');
INSERT INTO `blue_spell_mods` VALUES ('551', '13', '1');
INSERT INTO `blue_spell_mods` VALUES ('554', '13', '2');
INSERT INTO `blue_spell_mods` VALUES ('554', '14', '2');
INSERT INTO `blue_spell_mods` VALUES ('554', '2', '5');
INSERT INTO `blue_spell_mods` VALUES ('555', '10', '2');
INSERT INTO `blue_spell_mods` VALUES ('557', '2', '-5');
INSERT INTO `blue_spell_mods` VALUES ('557', '5', '15');
INSERT INTO `blue_spell_mods` VALUES ('560', '12', '1');
INSERT INTO `blue_spell_mods` VALUES ('561', '11', '2');
INSERT INTO `blue_spell_mods` VALUES ('563', '11', '1');
INSERT INTO `blue_spell_mods` VALUES ('564', '10', '1');
INSERT INTO `blue_spell_mods` VALUES ('564', '5', '5');
INSERT INTO `blue_spell_mods` VALUES ('565', '2', '5');
INSERT INTO `blue_spell_mods` VALUES ('565', '14', '1');
INSERT INTO `blue_spell_mods` VALUES ('567', '14', '1');
INSERT INTO `blue_spell_mods` VALUES ('567', '2', '5');
INSERT INTO `blue_spell_mods` VALUES ('569', '9', '2');
INSERT INTO `blue_spell_mods` VALUES ('570', '5', '5');
INSERT INTO `blue_spell_mods` VALUES ('572', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('573', '11', '1');
INSERT INTO `blue_spell_mods` VALUES ('574', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('576', '2', '5');
INSERT INTO `blue_spell_mods` VALUES ('576', '14', '1');
INSERT INTO `blue_spell_mods` VALUES ('577', '11', '1');
INSERT INTO `blue_spell_mods` VALUES ('578', '2', '5');
INSERT INTO `blue_spell_mods` VALUES ('579', '11', '2');
INSERT INTO `blue_spell_mods` VALUES ('581', '2', '10');
INSERT INTO `blue_spell_mods` VALUES ('581', '14', '1');
INSERT INTO `blue_spell_mods` VALUES ('582', '11', '1');
INSERT INTO `blue_spell_mods` VALUES ('584', '2', '5');
INSERT INTO `blue_spell_mods` VALUES ('584', '14', '1');
INSERT INTO `blue_spell_mods` VALUES ('585', '2', '5');
INSERT INTO `blue_spell_mods` VALUES ('587', '10', '1');
INSERT INTO `blue_spell_mods` VALUES ('588', '2', '-5');
INSERT INTO `blue_spell_mods` VALUES ('589', '9', '1');
INSERT INTO `blue_spell_mods` VALUES ('589', '14', '1');
INSERT INTO `blue_spell_mods` VALUES ('589', '2', '5');
INSERT INTO `blue_spell_mods` VALUES ('591', '8', '3');
INSERT INTO `blue_spell_mods` VALUES ('592', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('593', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('594', '8', '2');
INSERT INTO `blue_spell_mods` VALUES ('594', '9', '1');
INSERT INTO `blue_spell_mods` VALUES ('595', '10', '3');
INSERT INTO `blue_spell_mods` VALUES ('595', '11', '3');
INSERT INTO `blue_spell_mods` VALUES ('596', '8', '1');
INSERT INTO `blue_spell_mods` VALUES ('597', '13', '1');
INSERT INTO `blue_spell_mods` VALUES ('598', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('599', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('603', '14', '1');
INSERT INTO `blue_spell_mods` VALUES ('603', '2', '10');
INSERT INTO `blue_spell_mods` VALUES ('604', '12', '2');
INSERT INTO `blue_spell_mods` VALUES ('604', '13', '2');
INSERT INTO `blue_spell_mods` VALUES ('605', '2', '-5');
INSERT INTO `blue_spell_mods` VALUES ('605', '5', '10');
INSERT INTO `blue_spell_mods` VALUES ('608', '12', '1');
INSERT INTO `blue_spell_mods` VALUES ('610', '12', '1');
INSERT INTO `blue_spell_mods` VALUES ('611', '12', '1');
INSERT INTO `blue_spell_mods` VALUES ('611', '13', '1');
INSERT INTO `blue_spell_mods` VALUES ('612', '2', '20');
INSERT INTO `blue_spell_mods` VALUES ('612', '14', '2');
INSERT INTO `blue_spell_mods` VALUES ('614', '5', '10');
INSERT INTO `blue_spell_mods` VALUES ('614', '10', '2');
INSERT INTO `blue_spell_mods` VALUES ('614', '11', '2');
INSERT INTO `blue_spell_mods` VALUES ('617', '10', '1');
INSERT INTO `blue_spell_mods` VALUES ('617', '2', '-5');
INSERT INTO `blue_spell_mods` VALUES ('617', '5', '5');
INSERT INTO `blue_spell_mods` VALUES ('618', '8', '1');
INSERT INTO `blue_spell_mods` VALUES ('620', '9', '2');
INSERT INTO `blue_spell_mods` VALUES ('622', '12', '1');
INSERT INTO `blue_spell_mods` VALUES ('623', '9', '2');
INSERT INTO `blue_spell_mods` VALUES ('626', '8', '2');
INSERT INTO `blue_spell_mods` VALUES ('629', '11', '1');
INSERT INTO `blue_spell_mods` VALUES ('631', '13', '2');
INSERT INTO `blue_spell_mods` VALUES ('632', '10', '1');
INSERT INTO `blue_spell_mods` VALUES ('633', '2', '-5');
INSERT INTO `blue_spell_mods` VALUES ('633', '5', '5');
INSERT INTO `blue_spell_mods` VALUES ('634', '2', '15');
INSERT INTO `blue_spell_mods` VALUES ('634', '14', '1');
INSERT INTO `blue_spell_mods` VALUES ('636', '10', '1');
INSERT INTO `blue_spell_mods` VALUES ('637', '8', '3');
INSERT INTO `blue_spell_mods` VALUES ('638', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('640', '13', '2');
INSERT INTO `blue_spell_mods` VALUES ('641', '9', '2');
INSERT INTO `blue_spell_mods` VALUES ('641', '11', '1');
INSERT INTO `blue_spell_mods` VALUES ('646', '5', '-5');
INSERT INTO `blue_spell_mods` VALUES ('646', '13', '2');
INSERT INTO `blue_spell_mods` VALUES ('647', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('648', '5', '3');
INSERT INTO `blue_spell_mods` VALUES ('648', '12', '1');
INSERT INTO `blue_spell_mods` VALUES ('648', '13', '1');
INSERT INTO `blue_spell_mods` VALUES ('652', '2', '5');
INSERT INTO `blue_spell_mods` VALUES ('652', '8', '1');
INSERT INTO `blue_spell_mods` VALUES ('656', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('657', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('658', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('662', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('663', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('664', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('665', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('666', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('667', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('668', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('669', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('670', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('671', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('672', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('673', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('677', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('678', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('679', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('681', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('682', '0', '0');
