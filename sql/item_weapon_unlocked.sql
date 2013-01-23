

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for item_weapon_unlocked
-- ----------------------------
DROP TABLE IF EXISTS `item_weapon_unlocked`;
CREATE TABLE `item_weapon_unlocked` 
(
	`Id` tinyint(3) unsigned NOT NULL default '0', 
	`itemId` smallint(5) unsigned NOT NULL default '0',  
	`name` text, 
	`skill` tinyint(2) unsigned NOT NULL default '0',
	`dmgType` int(10) unsigned NOT NULL default '0',
	`hit` tinyint(1) unsigned NOT NULL default '1',
	`delay` int(10) NOT NULL default '0',
	`dmg` int(10) unsigned NOT NULL default '0',
	`points` int(4) unsigned NOT NULL default '0',
	PRIMARY KEY  (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=54 PACK_KEYS=1 CHECKSUM=1;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `item_weapon_unlocked` VALUES ('1', '16735', 'axe_of_trials', '6', '2', '1', '504', '87', '150');
INSERT INTO `item_weapon_unlocked` VALUES ('2', '16793', 'scythe_of_trials', '7', '2', '1', '480', '82', '150');
INSERT INTO `item_weapon_unlocked` VALUES ('3', '16952', 'sword_of_trials', '4', '2', '1', '444', '74', '150');
INSERT INTO `item_weapon_unlocked` VALUES ('4', '17207', 'expunger', '25', '1', '1', '120', '26', '500');
INSERT INTO `item_weapon_unlocked` VALUES ('5', '17275', 'coffinmaker', '26', '1', '1', '360', '27', '500');
INSERT INTO `item_weapon_unlocked` VALUES ('6', '17456', 'club_of_trials', '11', '3', '1', '267', '29', '150');
INSERT INTO `item_weapon_unlocked` VALUES ('7', '17507', 'knuckles_of_trials', '1', '4', '1', '576', '19', '150');
INSERT INTO `item_weapon_unlocked` VALUES ('8', '17509', 'destroyers', '1', '4', '1', '528', '21', '500');
INSERT INTO `item_weapon_unlocked` VALUES ('9', '17527', 'pole_of_trials', '12', '3', '1', '402', '55', '150');
INSERT INTO `item_weapon_unlocked` VALUES ('10', '17616', 'dagger_of_trials', '2', '1', '1', '200', '27', '150');
INSERT INTO `item_weapon_unlocked` VALUES ('11', '17654', 'sapara_of_trials', '3', '2', '1', '236', '38', '150');
INSERT INTO `item_weapon_unlocked` VALUES ('12', '17699', 'dissector', '3', '2', '1', '231', '36', '500');
INSERT INTO `item_weapon_unlocked` VALUES ('13', '17773', 'kodachi_of_trials', '9', '2', '1', '227', '33', '150');
INSERT INTO `item_weapon_unlocked` VALUES ('14', '17793', 'senjuinrikio', '9', '2', '1', '227', '25', '500');
INSERT INTO `item_weapon_unlocked` VALUES ('15', '17815', 'tachi_of_trials', '10', '2', '1', '450', '76', '150');
INSERT INTO `item_weapon_unlocked` VALUES ('16', '16892', 'spear_of_trials', '8', '1', '1', '396', '68', '150');
INSERT INTO `item_weapon_unlocked` VALUES ('17', '17933', 'pick_of_trials', '5', '2', '1', '312', '46', '150');
INSERT INTO `item_weapon_unlocked` VALUES ('18', '17944', 'retributor', '5', '2', '1', '312', '33', '500');
INSERT INTO `item_weapon_unlocked` VALUES ('19', '18005', 'heart_snatcher', '2', '1', '1', '205', '15', '500');
INSERT INTO `item_weapon_unlocked` VALUES ('20', '18097', 'gondo-shizunori', '8', '1', '1', '480', '72', '500');
INSERT INTO `item_weapon_unlocked` VALUES ('21', '18144', 'bow_of_trials', '25', '1', '1', '120', '39', '150');
INSERT INTO `item_weapon_unlocked` VALUES ('22', '18146', 'gun_of_trials', '26', '1', '1', '360', '39', '150');
INSERT INTO `item_weapon_unlocked` VALUES ('23', '18378', 'subduer', '4', '2', '1', '444', '72', '500');



