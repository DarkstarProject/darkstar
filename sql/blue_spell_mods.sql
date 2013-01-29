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
INSERT INTO `blue_spell_mods` VALUES ('513', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('515', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('517', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('519', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('521', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('522', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('524', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('527', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('529', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('530', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('531', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('532', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('533', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('534', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('535', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('536', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('537', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('538', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('539', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('540', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('541', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('542', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('543', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('544', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('545', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('547', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('548', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('549', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('551', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('554', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('555', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('557', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('560', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('561', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('563', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('564', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('565', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('567', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('569', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('570', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('572', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('573', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('574', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('576', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('577', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('578', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('579', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('581', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('582', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('584', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('585', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('587', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('588', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('589', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('591', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('592', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('593', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('594', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('595', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('596', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('597', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('598', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('599', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('603', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('604', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('605', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('608', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('610', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('611', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('612', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('614', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('617', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('618', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('620', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('622', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('623', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('626', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('629', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('631', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('632', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('633', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('634', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('636', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('637', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('638', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('640', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('641', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('646', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('647', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('648', '0', '0');
INSERT INTO `blue_spell_mods` VALUES ('652', '0', '0');
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
