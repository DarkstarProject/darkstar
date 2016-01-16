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
INSERT INTO `bcnm_loot` VALUES ('100', '13292', '75', '0'); -- Guardian's Ring
INSERT INTO `bcnm_loot` VALUES ('100', '13287', '32', '0'); -- Kampfer Ring
INSERT INTO `bcnm_loot` VALUES ('100', '13300', '54', '0'); -- Conjurer's Ring
INSERT INTO `bcnm_loot` VALUES ('100', '13298', '32', '0'); -- Shinobi Ring
INSERT INTO `bcnm_loot` VALUES ('100', '13293', '97', '0'); -- Slayer's Ring
INSERT INTO `bcnm_loot` VALUES ('100', '13289', '75', '0'); -- Sorcerer's Ring
INSERT INTO `bcnm_loot` VALUES ('100', '13286', '108', '0'); -- Soldier's Ring
INSERT INTO `bcnm_loot` VALUES ('100', '13294', '22', '0'); -- Tamer's Ring
INSERT INTO `bcnm_loot` VALUES ('100', '13296', '65', '0'); -- Tracker's Ring
INSERT INTO `bcnm_loot` VALUES ('100', '13299', '32', '0'); -- Drake Ring
INSERT INTO `bcnm_loot` VALUES ('100', '13290', '32', '0'); -- Fencer's Ring
INSERT INTO `bcnm_loot` VALUES ('100', '13295', '86', '0'); -- Minstrel's Ring
INSERT INTO `bcnm_loot` VALUES ('100', '13288', '86', '0'); -- Medicine Ring
INSERT INTO `bcnm_loot` VALUES ('100', '13291', '75', '0'); -- Rogue's Ring
INSERT INTO `bcnm_loot` VALUES ('100', '13297', '11', '0'); -- Ronin Ring
INSERT INTO `bcnm_loot` VALUES ('100', '13447', '32', '0'); -- Platinum Ring
INSERT INTO `bcnm_loot` VALUES ('100', '13548', '376', '1'); -- Astral Ring
INSERT INTO `bcnm_loot` VALUES ('100', '13447', '22', '1'); -- Platinum Ring
INSERT INTO `bcnm_loot` VALUES ('100', '4818', '65', '1'); -- Scroll of Quake
INSERT INTO `bcnm_loot` VALUES ('100', '859', '0', '1'); -- Ram Skin, 0% according to wiki
INSERT INTO `bcnm_loot` VALUES ('100', '4172', '11', '1'); -- Reraiser
INSERT INTO `bcnm_loot` VALUES ('100', '653', '22', '1'); -- Mythril Ingot
INSERT INTO `bcnm_loot` VALUES ('100', '4902', '0', '1'); -- Light Spirit Pact, 0% according to wiki
INSERT INTO `bcnm_loot` VALUES ('100', '4814', '32', '1'); -- Scroll of Freeze
INSERT INTO `bcnm_loot` VALUES ('100', '4719', '43', '1'); -- Scroll of Regen III
INSERT INTO `bcnm_loot` VALUES ('100', '4621', '32', '1'); -- Scroll of Raise II
INSERT INTO `bcnm_loot` VALUES ('100', '703', '11', '1'); -- Petrified Log
INSERT INTO `bcnm_loot` VALUES ('100', '887', '11', '1'); -- Coral Fragment
INSERT INTO `bcnm_loot` VALUES ('100', '700', '11', '1'); -- Mahogany Log
INSERT INTO `bcnm_loot` VALUES ('100', '738', '43', '1'); -- Platinum Ore
INSERT INTO `bcnm_loot` VALUES ('100', '737', '108', '1'); -- Gold Ore
INSERT INTO `bcnm_loot` VALUES ('100', '645', '32', '1'); -- Darksteel Ore
INSERT INTO `bcnm_loot` VALUES ('100', '644', '65', '1'); -- Mythril Ore
INSERT INTO `bcnm_loot` VALUES ('100', '745', '0', '1'); -- Gold Ingot, 0% according to wiki 
INSERT INTO `bcnm_loot` VALUES ('100', '654', '11', '1'); -- Darksteel Ingot
INSERT INTO `bcnm_loot` VALUES ('100', '746', '11', '1'); -- Platinum Ingot
INSERT INTO `bcnm_loot` VALUES ('100', '702', '11', '1'); -- Ebony Log
INSERT INTO `bcnm_loot` VALUES ('100', '895', '11', '1'); -- Ram Horn
INSERT INTO `bcnm_loot` VALUES ('100', '902', '11', '1'); -- Demon Horn
INSERT INTO `bcnm_loot` VALUES ('100', '1116', '0', '1'); -- Manticore Hide, 0% according to wiki
INSERT INTO `bcnm_loot` VALUES ('100', '1122', '11', '1'); -- Wyvern Skin
INSERT INTO `bcnm_loot` VALUES ('100', '866', '11', '1'); -- Wyvern Scales
INSERT INTO `bcnm_loot` VALUES ('73', '4570', '1000', '0'); -- Bird Egg
INSERT INTO `bcnm_loot` VALUES ('73', '14735', '125', '1'); -- Ashigaru Earring
INSERT INTO `bcnm_loot` VALUES ('73', '14732', '125', '1'); -- Trimmer's Earring
INSERT INTO `bcnm_loot` VALUES ('73', '14734', '125', '1'); -- Beater's Earring
INSERT INTO `bcnm_loot` VALUES ('73', '13437', '125', '1'); -- Healer's Earring
INSERT INTO `bcnm_loot` VALUES ('73', '13435', '125', '1'); -- Mercenary's Earring
INSERT INTO `bcnm_loot` VALUES ('73', '14733', '125', '1'); -- Singer's Earring
INSERT INTO `bcnm_loot` VALUES ('73', '13438', '125', '1'); -- Wizard's Earring
INSERT INTO `bcnm_loot` VALUES ('73', '13436', '125', '1'); -- Wrestler's Earring
INSERT INTO `bcnm_loot` VALUES ('73', '15285', '142', '2'); -- Avatar Belt
INSERT INTO `bcnm_loot` VALUES ('73', '15276', '142', '2'); -- Dagger Belt
INSERT INTO `bcnm_loot` VALUES ('73', '15284', '142', '2'); -- Lance Belt
INSERT INTO `bcnm_loot` VALUES ('73', '15275', '142', '2'); -- Rapier Belt
INSERT INTO `bcnm_loot` VALUES ('73', '15283', '142', '2'); -- Sarashi
INSERT INTO `bcnm_loot` VALUES ('73', '15278', '142', '2'); -- Scythe Belt
INSERT INTO `bcnm_loot` VALUES ('73', '15277', '142', '2'); -- Shield Belt
INSERT INTO `bcnm_loot` VALUES ('73', '4868', '105', '3'); -- Scroll of Dispel
INSERT INTO `bcnm_loot` VALUES ('73', '4751', '79', '3'); -- Scroll of Erase
INSERT INTO `bcnm_loot` VALUES ('73', '5070', '421', '3'); -- Scroll of Magic Finale
INSERT INTO `bcnm_loot` VALUES ('73', '4947', '79', '3'); -- Scroll of Utsusemi: Ni
INSERT INTO `bcnm_loot` VALUES ('73', '847', '330', '4'); -- Bird Feather
INSERT INTO `bcnm_loot` VALUES ('73', '694', '130', '4'); -- Chestnut Log
INSERT INTO `bcnm_loot` VALUES ('73', '690', '125', '4'); -- Elm Log
INSERT INTO `bcnm_loot` VALUES ('73', '4132', '210', '4'); -- Hi-Ether
INSERT INTO `bcnm_loot` VALUES ('73', '4222', '235', '4'); -- Horn Quiver
INSERT INTO `bcnm_loot` VALUES ('73', '651', '98', '4'); -- Iron Ingot
INSERT INTO `bcnm_loot` VALUES ('73', '795', '130', '4'); -- Lapis Lazuli
INSERT INTO `bcnm_loot` VALUES ('73', '796', '150', '4'); -- Light Opal
INSERT INTO `bcnm_loot` VALUES ('73', '653', '184', '4'); -- Mythril Ingot
INSERT INTO `bcnm_loot` VALUES ('73', '644', '159', '4'); -- Mythril Ore
INSERT INTO `bcnm_loot` VALUES ('73', '799', '160', '4'); -- Onyx
INSERT INTO `bcnm_loot` VALUES ('73', '736', '180', '4'); -- Silver Ore
INSERT INTO `bcnm_loot` VALUES ('73', '744', '175', '4'); -- Silver Ingot
INSERT INTO `bcnm_loot` VALUES ('76', '18047', '188', '0');
INSERT INTO `bcnm_loot` VALUES ('76', '17939', '27', '0');
INSERT INTO `bcnm_loot` VALUES ('76', '17937', '170', '0');
INSERT INTO `bcnm_loot` VALUES ('76', '1441', '295', '0');
INSERT INTO `bcnm_loot` VALUES ('76', '18351', '27', '0');
INSERT INTO `bcnm_loot` VALUES ('76', '17464', '71', '0');
INSERT INTO `bcnm_loot` VALUES ('76', '17575', '196', '0');
INSERT INTO `bcnm_loot` VALUES ('76', '18211', '45', '1');
INSERT INTO `bcnm_loot` VALUES ('76', '17576', '259', '1');
INSERT INTO `bcnm_loot` VALUES ('76', '17245', '241', '1');
INSERT INTO `bcnm_loot` VALUES ('76', '17838', '143', '1');
INSERT INTO `bcnm_loot` VALUES ('76', '1442', '161', '1');
INSERT INTO `bcnm_loot` VALUES ('76', '17996', '143', '1');
INSERT INTO `bcnm_loot` VALUES ('76', '17578', '36', '1');
INSERT INTO `bcnm_loot` VALUES ('76', '683', '446', '2');
INSERT INTO `bcnm_loot` VALUES ('76', '908', '420', '2');
INSERT INTO `bcnm_loot` VALUES ('76', '1312', '71', '2');
INSERT INTO `bcnm_loot` VALUES ('76', '14080', '26', '2');
INSERT INTO `bcnm_loot` VALUES ('76', '887', '116', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '645', '89', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '902', '71', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '702', '152', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '737', '107', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '823', '89', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '1465', '45', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '4173', '71', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '700', '107', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '703', '223', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '738', '116', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '830', '54', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '895', '54', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '1132', '71', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '4172', '45', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '866', '54', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '4174', '63', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '4175', '45', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '683', '268', '4');
INSERT INTO `bcnm_loot` VALUES ('76', '1525', '143', '4');
INSERT INTO `bcnm_loot` VALUES ('76', '4205', '80', '4');
INSERT INTO `bcnm_loot` VALUES ('76', '4201', '143', '4');
INSERT INTO `bcnm_loot` VALUES ('76', '4199', '214', '4');
INSERT INTO `bcnm_loot` VALUES ('76', '4203', '196', '4');
INSERT INTO `bcnm_loot` VALUES ('76', '646', '107', '5');
INSERT INTO `bcnm_loot` VALUES ('76', '4211', '89', '5');
INSERT INTO `bcnm_loot` VALUES ('76', '645', '179', '5');
INSERT INTO `bcnm_loot` VALUES ('76', '4213', '134', '5');
INSERT INTO `bcnm_loot` VALUES ('76', '4207', '152', '5');
INSERT INTO `bcnm_loot` VALUES ('76', '4209', '80', '5');
INSERT INTO `bcnm_loot` VALUES ('76', '739', '80', '5');
INSERT INTO `bcnm_loot` VALUES ('76', '738', '107', '5');
INSERT INTO `bcnm_loot` VALUES ('76', '17698', '152', '5');
INSERT INTO `bcnm_loot` VALUES ('76', '4135', '295', '6');
INSERT INTO `bcnm_loot` VALUES ('76', '4119', '250', '6');
INSERT INTO `bcnm_loot` VALUES ('76', '4173', '196', '6');
INSERT INTO `bcnm_loot` VALUES ('76', '4175', '214', '6');
INSERT INTO `bcnm_loot` VALUES ('76', '887', '139', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '645', '59', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '902', '50', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '702', '109', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '737', '69', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '1465', '99', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '4173', '79', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '700', '129', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '644', '119', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '844', '69', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '703', '168', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '738', '129', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '895', '109', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '1132', '79', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '4174', '69', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '866', '79', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '4172', '50', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '823', '89', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '1110', '109', '8');
INSERT INTO `bcnm_loot` VALUES ('76', '836', '89', '8');
INSERT INTO `bcnm_loot` VALUES ('76', '658', '78', '8');
INSERT INTO `bcnm_loot` VALUES ('76', '837', '99', '8');
INSERT INTO `bcnm_loot` VALUES ('76', '942', '188', '8');
INSERT INTO `bcnm_loot` VALUES ('76', '844', '238', '8');
INSERT INTO `bcnm_loot` VALUES ('76', '1132', '109', '8');
INSERT INTO `bcnm_loot` VALUES ('76', '722', '79', '9');
INSERT INTO `bcnm_loot` VALUES ('76', '1446', '257', '9');
INSERT INTO `bcnm_loot` VALUES ('76', '703', '337', '9');
INSERT INTO `bcnm_loot` VALUES ('76', '831', '149', '9');
INSERT INTO `bcnm_loot` VALUES ('76', '3343', '1', '10');
INSERT INTO `bcnm_loot` VALUES ('105', '1603', '100', '0');
INSERT INTO `bcnm_loot` VALUES ('105', '915', '250', '1');
INSERT INTO `bcnm_loot` VALUES ('105', '4112', '300', '1');
INSERT INTO `bcnm_loot` VALUES ('105', '4113', '180', '1');
INSERT INTO `bcnm_loot` VALUES ('105', '4898', '130', '1');
INSERT INTO `bcnm_loot` VALUES ('105', '825', '280', '1');
INSERT INTO `bcnm_loot` VALUES ('105', '749', '250', '2');
INSERT INTO `bcnm_loot` VALUES ('105', '17786', '190', '2');
INSERT INTO `bcnm_loot` VALUES ('105', '827', '270', '2');
INSERT INTO `bcnm_loot` VALUES ('105', '18171', '145', '2');
INSERT INTO `bcnm_loot` VALUES ('105', '824', '295', '2');
INSERT INTO `bcnm_loot` VALUES ('105', '826', '260', '2');
INSERT INTO `bcnm_loot` VALUES ('105', '18209', '100', '3');
INSERT INTO `bcnm_loot` VALUES ('105', '0', '100', '3');
INSERT INTO `bcnm_loot` VALUES ('105', '924', '100', '4');
INSERT INTO `bcnm_loot` VALUES ('105', '924', '100', '5');
INSERT INTO `bcnm_loot` VALUES ('105', '18170', '235', '6');
INSERT INTO `bcnm_loot` VALUES ('105', '17271', '235', '6');
INSERT INTO `bcnm_loot` VALUES ('105', '17692', '235', '6');
INSERT INTO `bcnm_loot` VALUES ('105', '17571', '235', '6');
INSERT INTO `bcnm_loot` VALUES ('105', '17820', '255', '6');
INSERT INTO `bcnm_loot` VALUES ('105', '1601', '260', '6');
INSERT INTO `bcnm_loot` VALUES ('105', '4853', '250', '6');
INSERT INTO `bcnm_loot` VALUES ('105', '930', '190', '6');
INSERT INTO `bcnm_loot` VALUES ('81', '1473', '813', '0');
INSERT INTO `bcnm_loot` VALUES ('81', '13552', '55', '0');
INSERT INTO `bcnm_loot` VALUES ('81', '901', '123', '0');
INSERT INTO `bcnm_loot` VALUES ('81', '17207', '216', '1');
INSERT INTO `bcnm_loot` VALUES ('81', '18005', '295', '1');
INSERT INTO `bcnm_loot` VALUES ('81', '18217', '239', '1');
INSERT INTO `bcnm_loot` VALUES ('81', '17793', '231', '1');
INSERT INTO `bcnm_loot` VALUES ('81', '17624', '504', '2');
INSERT INTO `bcnm_loot` VALUES ('81', '655', '4', '2');
INSERT INTO `bcnm_loot` VALUES ('81', '19027', '86', '2');
INSERT INTO `bcnm_loot` VALUES ('81', '747', '22', '2');
INSERT INTO `bcnm_loot` VALUES ('81', '19025', '146', '2');
INSERT INTO `bcnm_loot` VALUES ('81', '19024', '22', '2');
INSERT INTO `bcnm_loot` VALUES ('81', '15295', '287', '3');
INSERT INTO `bcnm_loot` VALUES ('81', '12407', '216', '3');
INSERT INTO `bcnm_loot` VALUES ('81', '14871', '198', '3');
INSERT INTO `bcnm_loot` VALUES ('81', '15294', '287', '3');
INSERT INTO `bcnm_loot` VALUES ('81', '887', '52', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '645', '56', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '902', '41', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '702', '63', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '737', '52', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '823', '26', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '1465', '11', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '4173', '37', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '700', '101', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '653', '0', '4'); -- this is "zero" on ffxiclopedia???
INSERT INTO `bcnm_loot` VALUES ('81', '644', '52', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '703', '116', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '844', '15', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '942', '56', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '738', '45', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '830', '22', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '895', '67', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '1132', '119', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '4172', '45', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '4174', '19', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '4175', '41', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '866', '34', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '1110', '78', '5');
INSERT INTO `bcnm_loot` VALUES ('81', '836', '56', '5');
INSERT INTO `bcnm_loot` VALUES ('81', '658', '93', '5');
INSERT INTO `bcnm_loot` VALUES ('81', '837', '56', '5');
INSERT INTO `bcnm_loot` VALUES ('81', '942', '157', '5');
INSERT INTO `bcnm_loot` VALUES ('81', '844', '276', '5');
INSERT INTO `bcnm_loot` VALUES ('81', '1132', '209', '5');
INSERT INTO `bcnm_loot` VALUES ('82', '843', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('82', '17827', '217', '1');
INSERT INTO `bcnm_loot` VALUES ('82', '17699', '174', '1');
INSERT INTO `bcnm_loot` VALUES ('82', '17275', '333', '1');
INSERT INTO `bcnm_loot` VALUES ('82', '18053', '174', '1');
INSERT INTO `bcnm_loot` VALUES ('82', '19027', '144', '2');
INSERT INTO `bcnm_loot` VALUES ('82', '658', '275', '2');
INSERT INTO `bcnm_loot` VALUES ('82', '843', '275', '2');       
INSERT INTO `bcnm_loot` VALUES ('82', '19025', '203', '2');
INSERT INTO `bcnm_loot` VALUES ('82', '19026', '116', '2');
INSERT INTO `bcnm_loot` VALUES ('82', '655', '159', '3');
INSERT INTO `bcnm_loot` VALUES ('82', '747', '290', '3');
INSERT INTO `bcnm_loot` VALUES ('82', '14765', '406', '3');
INSERT INTO `bcnm_loot` VALUES ('82', '15325', '159', '4');
INSERT INTO `bcnm_loot` VALUES ('82', '14872', '217', '4');
INSERT INTO `bcnm_loot` VALUES ('82', '15181', '145', '4');
INSERT INTO `bcnm_loot` VALUES ('82', '15387', '159', '4');
INSERT INTO `bcnm_loot` VALUES ('82', '887', '101', '5');
INSERT INTO `bcnm_loot` VALUES ('82', '645', '29', '5');
INSERT INTO `bcnm_loot` VALUES ('82', '902', '29', '5');
INSERT INTO `bcnm_loot` VALUES ('82', '702', '29', '5');
INSERT INTO `bcnm_loot` VALUES ('82', '737', '101', '5');
INSERT INTO `bcnm_loot` VALUES ('82', '823', '29', '5');
INSERT INTO `bcnm_loot` VALUES ('82', '1465', '29', '5');
INSERT INTO `bcnm_loot` VALUES ('82', '700', '43', '5');
INSERT INTO `bcnm_loot` VALUES ('82', '644', '29', '5');
INSERT INTO `bcnm_loot` VALUES ('82', '703', '58', '5');
INSERT INTO `bcnm_loot` VALUES ('82', '738', '14', '5');
INSERT INTO `bcnm_loot` VALUES ('82', '830', '58', '5');
INSERT INTO `bcnm_loot` VALUES ('82', '895', '14', '5');
INSERT INTO `bcnm_loot` VALUES ('82', '4174', '58', '5');
INSERT INTO `bcnm_loot` VALUES ('82', '4175', '29', '5');
INSERT INTO `bcnm_loot` VALUES ('82', '837', '72', '5');
INSERT INTO `bcnm_loot` VALUES ('82', '1110', '87', '6');
INSERT INTO `bcnm_loot` VALUES ('82', '658', '14', '6');
INSERT INTO `bcnm_loot` VALUES ('82', '836', '29', '6');
INSERT INTO `bcnm_loot` VALUES ('82', '942', '174', '6');
INSERT INTO `bcnm_loot` VALUES ('82', '844', '246', '6');
INSERT INTO `bcnm_loot` VALUES ('82', '1132', '159', '6');
INSERT INTO `bcnm_loot` VALUES ('34', '891', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('34', '4900', '306', '1');
INSERT INTO `bcnm_loot` VALUES ('34', '4744', '319', '1');
INSERT INTO `bcnm_loot` VALUES ('34', '4745', '125', '1');
INSERT INTO `bcnm_loot` VALUES ('34', '4746', '222', '1');
INSERT INTO `bcnm_loot` VALUES ('34', '17786', '153', '2');
INSERT INTO `bcnm_loot` VALUES ('34', '18170', '139', '2');
INSERT INTO `bcnm_loot` VALUES ('34', '16687', '83', '2');
INSERT INTO `bcnm_loot` VALUES ('34', '17571', '97', '2');
INSERT INTO `bcnm_loot` VALUES ('34', '17993', '125', '2');
INSERT INTO `bcnm_loot` VALUES ('34', '749', '444', '2');
INSERT INTO `bcnm_loot` VALUES ('34', '773', '56', '2');
INSERT INTO `bcnm_loot` VALUES ('34', '17820', '111', '3');
INSERT INTO `bcnm_loot` VALUES ('34', '17993', '139', '3');
INSERT INTO `bcnm_loot` VALUES ('34', '18170', '139', '3');
INSERT INTO `bcnm_loot` VALUES ('34', '18085', '42', '3');
INSERT INTO `bcnm_loot` VALUES ('34', '16959', '181', '3');
INSERT INTO `bcnm_loot` VALUES ('34', '774', '97', '3');
INSERT INTO `bcnm_loot` VALUES ('34', '769', '69', '3');
INSERT INTO `bcnm_loot` VALUES ('34', '776', '14', '3');
INSERT INTO `bcnm_loot` VALUES ('34', '775', '28', '3');
INSERT INTO `bcnm_loot` VALUES ('34', '772', '28', '3');
INSERT INTO `bcnm_loot` VALUES ('34', '771', '14', '3');
INSERT INTO `bcnm_loot` VALUES ('34', '770', '69', '3');
INSERT INTO `bcnm_loot` VALUES ('34', '13548', '167', '4');
INSERT INTO `bcnm_loot` VALUES ('34', '922', '444', '4');
INSERT INTO `bcnm_loot` VALUES ('34', '0', '600', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '3339', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('107', '1441', '312', '1');
INSERT INTO `bcnm_loot` VALUES ('107', '17694', '182', '1');
INSERT INTO `bcnm_loot` VALUES ('107', '18047', '65', '1');
INSERT INTO `bcnm_loot` VALUES ('107', '17937', '43', '1');
INSERT INTO `bcnm_loot` VALUES ('107', '18173', '181', '1');
INSERT INTO `bcnm_loot` VALUES ('107', '17823', '217', '1');
INSERT INTO `bcnm_loot` VALUES ('107', '17575', '43', '1');
INSERT INTO `bcnm_loot` VALUES ('107', '1442', '159', '2');
INSERT INTO `bcnm_loot` VALUES ('107', '17695', '151', '2');
INSERT INTO `bcnm_loot` VALUES ('107', '18088', '167', '2');
INSERT INTO `bcnm_loot` VALUES ('107', '17576', '95', '2');
INSERT INTO `bcnm_loot` VALUES ('107', '17245', '95', '2');
INSERT INTO `bcnm_loot` VALUES ('107', '17996', '56', '2');
INSERT INTO `bcnm_loot` VALUES ('107', '17789', '341', '2');
INSERT INTO `bcnm_loot` VALUES ('107', '4486', '522', '3');
INSERT INTO `bcnm_loot` VALUES ('107', '4272', '346', '3');
INSERT INTO `bcnm_loot` VALUES ('107', '17928', '82', '3');
INSERT INTO `bcnm_loot` VALUES ('107', '13189', '59', '3');
INSERT INTO `bcnm_loot` VALUES ('107', '887', '32', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '645', '71', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '902', '79', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '702', '56', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '737', '71', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '823', '32', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '4173', '48', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '700', '127', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '644', '111', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '703', '183', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '942', '40', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '738', '56', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '895', '24', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '1132', '119', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '4172', '56', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '4175', '40', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '866', '24', '4');
INSERT INTO `bcnm_loot` VALUES ('107', '1526', '210', '5');
INSERT INTO `bcnm_loot` VALUES ('107', '1313', '775', '5');
INSERT INTO `bcnm_loot` VALUES ('107', '4209', '94', '6');
INSERT INTO `bcnm_loot` VALUES ('107', '4207', '130', '6');
INSERT INTO `bcnm_loot` VALUES ('107', '4211', '116', '6');
INSERT INTO `bcnm_loot` VALUES ('107', '4213', '51', '6');
INSERT INTO `bcnm_loot` VALUES ('107', '1132', '246', '6');
INSERT INTO `bcnm_loot` VALUES ('107', '17582', '246', '6');
INSERT INTO `bcnm_loot` VALUES ('107', '4135', '290', '7');
INSERT INTO `bcnm_loot` VALUES ('107', '4119', '225', '7');
INSERT INTO `bcnm_loot` VALUES ('107', '4173', '210', '7');
INSERT INTO `bcnm_loot` VALUES ('107', '4175', '217', '7');
INSERT INTO `bcnm_loot` VALUES ('107', '887', '87', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '645', '80', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '902', '58', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '702', '72', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '737', '87', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '823', '14', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '4173', '22', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '700', '80', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '644', '36', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '703', '145', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '844', '7', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '738', '51', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '830', '29', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '895', '36', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '1132', '72', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '4172', '29', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '4174', '29', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '4175', '7', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '866', '22', '8');
INSERT INTO `bcnm_loot` VALUES ('107', '1110', '58', '9');
INSERT INTO `bcnm_loot` VALUES ('107', '836', '36', '9');
INSERT INTO `bcnm_loot` VALUES ('107', '658', '72', '9');
INSERT INTO `bcnm_loot` VALUES ('107', '837', '22', '9');
INSERT INTO `bcnm_loot` VALUES ('107', '942', '275', '9');
INSERT INTO `bcnm_loot` VALUES ('107', '844', '196', '9');
INSERT INTO `bcnm_loot` VALUES ('107', '1132', '225', '9');
INSERT INTO `bcnm_loot` VALUES ('107', '722', '94', '10');
INSERT INTO `bcnm_loot` VALUES ('107', '1446', '196', '10');
INSERT INTO `bcnm_loot` VALUES ('107', '703', '572', '10');
INSERT INTO `bcnm_loot` VALUES ('107', '831', '43', '10');
INSERT INTO `bcnm_loot` VALUES ('10', '13153', '250', '0');
INSERT INTO `bcnm_loot` VALUES ('10', '13156', '250', '0');
INSERT INTO `bcnm_loot` VALUES ('10', '13157', '250', '0');
INSERT INTO `bcnm_loot` VALUES ('10', '13161', '250', '0');
INSERT INTO `bcnm_loot` VALUES ('10', '751', '258', '1');
INSERT INTO `bcnm_loot` VALUES ('10', '4874', '48', '1');
INSERT INTO `bcnm_loot` VALUES ('10', '4751', '143', '1');
INSERT INTO `bcnm_loot` VALUES ('10', '4714', '119', '1');
INSERT INTO `bcnm_loot` VALUES ('10', '4896', '48', '1');
INSERT INTO `bcnm_loot` VALUES ('10', '1255', '48', '1');
INSERT INTO `bcnm_loot` VALUES ('10', '1256', '48', '1');
INSERT INTO `bcnm_loot` VALUES ('10', '1257', '48', '1');
INSERT INTO `bcnm_loot` VALUES ('10', '1258', '48', '1');
INSERT INTO `bcnm_loot` VALUES ('10', '1259', '48', '1');
INSERT INTO `bcnm_loot` VALUES ('10', '1260', '48', '1');
INSERT INTO `bcnm_loot` VALUES ('10', '1261', '48', '1');
INSERT INTO `bcnm_loot` VALUES ('10', '1262', '48', '1');
INSERT INTO `bcnm_loot` VALUES ('10', '751', '833', '2');
INSERT INTO `bcnm_loot` VALUES ('10', '1256', '169', '2');
INSERT INTO `bcnm_loot` VALUES ('10', '13155', '250', '3');
INSERT INTO `bcnm_loot` VALUES ('10', '13148', '250', '3');
INSERT INTO `bcnm_loot` VALUES ('10', '13151', '250', '3');
INSERT INTO `bcnm_loot` VALUES ('10', '13158', '250', '3');
INSERT INTO `bcnm_loot` VALUES ('10', '654', '154', '4');
INSERT INTO `bcnm_loot` VALUES ('10', '797', '154', '4');
INSERT INTO `bcnm_loot` VALUES ('10', '745', '154', '4');
INSERT INTO `bcnm_loot` VALUES ('10', '791', '77', '4');
INSERT INTO `bcnm_loot` VALUES ('10', '4175', '77', '4');
INSERT INTO `bcnm_loot` VALUES ('10', '653', '153', '4');
INSERT INTO `bcnm_loot` VALUES ('10', '801', '30', '4');
INSERT INTO `bcnm_loot` VALUES ('10', '802', '30', '4');
INSERT INTO `bcnm_loot` VALUES ('10', '803', '30', '4');
INSERT INTO `bcnm_loot` VALUES ('10', '805', '30', '4'); -- lots of unknown groupings in group 4
INSERT INTO `bcnm_loot` VALUES ('10', '791', '30', '4');
INSERT INTO `bcnm_loot` VALUES ('10', '702', '30', '4');
INSERT INTO `bcnm_loot` VALUES ('10', '700', '30', '4');
INSERT INTO `bcnm_loot` VALUES ('10', '942', '30', '4');
INSERT INTO `bcnm_loot` VALUES ('10', '654', '77', '5');
INSERT INTO `bcnm_loot` VALUES ('10', '802', '134', '5');
INSERT INTO `bcnm_loot` VALUES ('10', '652', '154', '5');
INSERT INTO `bcnm_loot` VALUES ('10', '801', '50', '5');
INSERT INTO `bcnm_loot` VALUES ('10', '4173', '154', '5');
INSERT INTO `bcnm_loot` VALUES ('10', '784', '121', '5'); -- lots of unknown groupings in group 5
INSERT INTO `bcnm_loot` VALUES ('10', '837', '10', '5');
INSERT INTO `bcnm_loot` VALUES ('10', '1110', '10', '5');
INSERT INTO `bcnm_loot` VALUES ('10', '769', '30', '5');
INSERT INTO `bcnm_loot` VALUES ('10', '770', '30', '5');
INSERT INTO `bcnm_loot` VALUES ('10', '771', '30', '5');
INSERT INTO `bcnm_loot` VALUES ('10', '772', '30', '5');
INSERT INTO `bcnm_loot` VALUES ('10', '773', '30', '5');
INSERT INTO `bcnm_loot` VALUES ('10', '774', '30', '5');
INSERT INTO `bcnm_loot` VALUES ('10', '775', '30', '5');
INSERT INTO `bcnm_loot` VALUES ('10', '776', '30', '5');
INSERT INTO `bcnm_loot` VALUES ('10', '810', '50', '5');
INSERT INTO `bcnm_loot` VALUES ('11', '1441', '169', '0');
INSERT INTO `bcnm_loot` VALUES ('11', '17939', '268', '0');
INSERT INTO `bcnm_loot` VALUES ('11', '17823', '99', '0');
INSERT INTO `bcnm_loot` VALUES ('11', '18173', '85', '0');
INSERT INTO `bcnm_loot` VALUES ('11', '17694', '70', '0');
INSERT INTO `bcnm_loot` VALUES ('11', '17464', '85', '0');
INSERT INTO `bcnm_loot` VALUES ('11', '18351', '225', '0');
INSERT INTO `bcnm_loot` VALUES ('11', '1442', '169', '1');
INSERT INTO `bcnm_loot` VALUES ('11', '17789', '14', '1');
INSERT INTO `bcnm_loot` VALUES ('11', '17838', '239', '1');
INSERT INTO `bcnm_loot` VALUES ('11', '18088', '85', '1');
INSERT INTO `bcnm_loot` VALUES ('11', '18211', '254', '1');
INSERT INTO `bcnm_loot` VALUES ('11', '17578', '183', '1');
INSERT INTO `bcnm_loot` VALUES ('11', '17695', '70', '1');
INSERT INTO `bcnm_loot` VALUES ('11', '860', '535', '2');
INSERT INTO `bcnm_loot` VALUES ('11', '883', '366', '2');
INSERT INTO `bcnm_loot` VALUES ('11', '17108', '48', '2');
INSERT INTO `bcnm_loot` VALUES ('11', '902', '99', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '703', '70', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '1132', '70', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '830', '28', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '4173', '113', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '703', '211', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '942', '141', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '737', '56', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '644', '85', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '887', '70', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '700', '85', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '866', '42', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '645', '42', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '895', '70', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '702', '85', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '4172', '28', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '738', '42', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '4174', '42', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '4175', '7', '3');
INSERT INTO `bcnm_loot` VALUES ('11', '1527', '208', '4');
INSERT INTO `bcnm_loot` VALUES ('11', '883', '296', '4');
INSERT INTO `bcnm_loot` VALUES ('11', '4199', '155', '4');
INSERT INTO `bcnm_loot` VALUES ('11', '4201', '70', '4');
INSERT INTO `bcnm_loot` VALUES ('11', '4205', '141', '4');
INSERT INTO `bcnm_loot` VALUES ('11', '4203', '113', '4');
INSERT INTO `bcnm_loot` VALUES ('11', '3341', '1000', '5');
INSERT INTO `bcnm_loot` VALUES ('11', '4209', '169', '6');
INSERT INTO `bcnm_loot` VALUES ('11', '4207', '70', '6');
INSERT INTO `bcnm_loot` VALUES ('11', '4211', '113', '6');
INSERT INTO `bcnm_loot` VALUES ('11', '4213', '155', '6');
INSERT INTO `bcnm_loot` VALUES ('11', '17840', '254', '6');
INSERT INTO `bcnm_loot` VALUES ('11', '785', '99', '6');
INSERT INTO `bcnm_loot` VALUES ('11', '804', '42', '6');
INSERT INTO `bcnm_loot` VALUES ('11', '786', '56', '6');
INSERT INTO `bcnm_loot` VALUES ('11', '787', '28', '6');
INSERT INTO `bcnm_loot` VALUES ('11', '4135', '296', '7');
INSERT INTO `bcnm_loot` VALUES ('11', '4119', '225', '7');
INSERT INTO `bcnm_loot` VALUES ('11', '4173', '197', '7');
INSERT INTO `bcnm_loot` VALUES ('11', '4175', '282', '7');
INSERT INTO `bcnm_loot` VALUES ('11', '887', '141', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '1132', '14', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '902', '113', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '737', '28', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '644', '85', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '4174', '56', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '895', '28', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '703', '296', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '738', '14', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '700', '56', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '866', '70', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '1465', '42', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '645', '42', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '702', '42', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '4173', '42', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '823', '113', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '830', '28', '8');
INSERT INTO `bcnm_loot` VALUES ('11', '1132', '127', '9');
INSERT INTO `bcnm_loot` VALUES ('11', '837', '56', '9');
INSERT INTO `bcnm_loot` VALUES ('11', '942', '225', '9');
INSERT INTO `bcnm_loot` VALUES ('11', '844', '423', '9');
INSERT INTO `bcnm_loot` VALUES ('11', '836', '70', '9');
INSERT INTO `bcnm_loot` VALUES ('11', '658', '42', '9');
INSERT INTO `bcnm_loot` VALUES ('11', '1110', '85', '9');
INSERT INTO `bcnm_loot` VALUES ('11', '703', '563', '10');
INSERT INTO `bcnm_loot` VALUES ('11', '1446', '296', '10');
INSERT INTO `bcnm_loot` VALUES ('11', '831', '14', '10');
INSERT INTO `bcnm_loot` VALUES ('11', '722', '141', '10');
INSERT INTO `bcnm_loot` VALUES ('12', '846', '1000', '0'); -- LootID 12 needs 100% chance to drop 4k gil
INSERT INTO `bcnm_loot` VALUES ('12', '1601', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('12', '12486', '364', '2');
INSERT INTO `bcnm_loot` VALUES ('12', '846', '636', '2'); -- Temp fix for Chance to get zero items (This item doesnt drop here)  ~63.6%
INSERT INTO `bcnm_loot` VALUES ('12', '12400', '175', '3');
INSERT INTO `bcnm_loot` VALUES ('12', '12399', '175', '3');
INSERT INTO `bcnm_loot` VALUES ('12', '12395', '175', '3');
INSERT INTO `bcnm_loot` VALUES ('12', '12390', '175', '3');
INSERT INTO `bcnm_loot` VALUES ('12', '809', '100', '3');
INSERT INTO `bcnm_loot` VALUES ('12', '795', '100', '3');
INSERT INTO `bcnm_loot` VALUES ('12', '796', '100', '3');
INSERT INTO `bcnm_loot` VALUES ('12', '13659', '250', '4');
INSERT INTO `bcnm_loot` VALUES ('12', '13668', '250', '4');
INSERT INTO `bcnm_loot` VALUES ('12', '13662', '250', '4');
INSERT INTO `bcnm_loot` VALUES ('12', '13672', '250', '4');
INSERT INTO `bcnm_loot` VALUES ('12', '4947', '70', '5');
INSERT INTO `bcnm_loot` VALUES ('12', '5070', '70', '5');
INSERT INTO `bcnm_loot` VALUES ('12', '17863', '150', '5');
INSERT INTO `bcnm_loot` VALUES ('12', '799', '100', '5');
INSERT INTO `bcnm_loot` VALUES ('12', '795', '100', '5');
INSERT INTO `bcnm_loot` VALUES ('12', '796', '100', '5');
INSERT INTO `bcnm_loot` VALUES ('12', '4868', '150', '5'); -- putting all 4 unkown groups in this collumn
INSERT INTO `bcnm_loot` VALUES ('12', '4751', '100', '5');
INSERT INTO `bcnm_loot` VALUES ('12', '690', '90', '5');
INSERT INTO `bcnm_loot` VALUES ('12', '1602', '70', '5');
INSERT INTO `bcnm_loot` VALUES ('14', '939', '50', '0'); --  Temp fix for Chance to get zero items (This item doesnt drop here)  ~5%
INSERT INTO `bcnm_loot` VALUES ('14', '13254', '95', '0');
INSERT INTO `bcnm_loot` VALUES ('14', '13253', '95', '0');
INSERT INTO `bcnm_loot` VALUES ('14', '13255', '95', '0');
INSERT INTO `bcnm_loot` VALUES ('14', '13252', '95', '0');
INSERT INTO `bcnm_loot` VALUES ('14', '13256', '95', '0');
INSERT INTO `bcnm_loot` VALUES ('14', '13259', '95', '0');
INSERT INTO `bcnm_loot` VALUES ('14', '13258', '95', '0');
INSERT INTO `bcnm_loot` VALUES ('14', '13260', '95', '0');
INSERT INTO `bcnm_loot` VALUES ('14', '13257', '95', '0');
INSERT INTO `bcnm_loot` VALUES ('14', '13292', '64', '1');
INSERT INTO `bcnm_loot` VALUES ('14', '13287', '65', '1');
INSERT INTO `bcnm_loot` VALUES ('14', '13300', '65', '1');
INSERT INTO `bcnm_loot` VALUES ('14', '13298', '65', '1');
INSERT INTO `bcnm_loot` VALUES ('14', '13293', '65', '1');
INSERT INTO `bcnm_loot` VALUES ('14', '13289', '65', '1');
INSERT INTO `bcnm_loot` VALUES ('14', '13286', '64', '1');
INSERT INTO `bcnm_loot` VALUES ('14', '13294', '65', '1');
INSERT INTO `bcnm_loot` VALUES ('14', '13296', '64', '1');
INSERT INTO `bcnm_loot` VALUES ('14', '13299', '65', '1');
INSERT INTO `bcnm_loot` VALUES ('14', '13290', '65', '1');
INSERT INTO `bcnm_loot` VALUES ('14', '13295', '65', '1');
INSERT INTO `bcnm_loot` VALUES ('14', '13288', '64', '1');
INSERT INTO `bcnm_loot` VALUES ('14', '13291', '65', '1');
INSERT INTO `bcnm_loot` VALUES ('14', '13297', '64', '1');
INSERT INTO `bcnm_loot` VALUES ('14', '13447', '30', '1');
INSERT INTO `bcnm_loot` VALUES ('14', '939', '166', '2'); -- Temp fix for Chance to get zero items (This item doesnt drop here) ~16.6% 
INSERT INTO `bcnm_loot` VALUES ('14', '4902', '10', '2');
INSERT INTO `bcnm_loot` VALUES ('14', '4814', '176', '2');
INSERT INTO `bcnm_loot` VALUES ('14', '4719', '176', '2');
INSERT INTO `bcnm_loot` VALUES ('14', '4172', '60', '2');
INSERT INTO `bcnm_loot` VALUES ('14', '4174', '60', '2');
INSERT INTO `bcnm_loot` VALUES ('14', '4621', '176', '2');
INSERT INTO `bcnm_loot` VALUES ('14', '895', '59', '3'); -- Scaled back this groups wiki %'s a bit to == 100
INSERT INTO `bcnm_loot` VALUES ('14', '700', '59', '3');
INSERT INTO `bcnm_loot` VALUES ('14', '653', '200', '3');
INSERT INTO `bcnm_loot` VALUES ('14', '1116', '59', '3');
INSERT INTO `bcnm_loot` VALUES ('14', '866', '90', '3');
INSERT INTO `bcnm_loot` VALUES ('14', '1122', '90', '3');
INSERT INTO `bcnm_loot` VALUES ('14', '703', '176', '3');
INSERT INTO `bcnm_loot` VALUES ('14', '654', '59', '3');
INSERT INTO `bcnm_loot` VALUES ('14', '749', '59', '3');
INSERT INTO `bcnm_loot` VALUES ('14', '859', '59', '3');
INSERT INTO `bcnm_loot` VALUES ('14', '746', '90', '3');
INSERT INTO `bcnm_loot` VALUES ('15', '18378', '222', '0');
INSERT INTO `bcnm_loot` VALUES ('15', '17699', '302', '0');
INSERT INTO `bcnm_loot` VALUES ('15', '17509', '245', '0');
INSERT INTO `bcnm_loot` VALUES ('15', '18005', '208', '0');
INSERT INTO `bcnm_loot` VALUES ('15', '1133', '0', '1'); -- Yes "0" on ffxiclopedia
INSERT INTO `bcnm_loot` VALUES ('15', '4486', '176', '1');
INSERT INTO `bcnm_loot` VALUES ('15', '4272', '176', '1');
INSERT INTO `bcnm_loot` VALUES ('15', '19026', '354', '2');
INSERT INTO `bcnm_loot` VALUES ('15', '19024', '165', '2');
INSERT INTO `bcnm_loot` VALUES ('15', '19025', '89', '2');
INSERT INTO `bcnm_loot` VALUES ('15', '14764', '586', '3');
INSERT INTO `bcnm_loot` VALUES ('15', '655', '184', '3');
INSERT INTO `bcnm_loot` VALUES ('15', '747', '207', '3');
INSERT INTO `bcnm_loot` VALUES ('15', '17842', '238', '4');
INSERT INTO `bcnm_loot` VALUES ('15', '14762', '250', '4');
INSERT INTO `bcnm_loot` VALUES ('15', '17700', '225', '4');
INSERT INTO `bcnm_loot` VALUES ('15', '18006', '275', '4');
INSERT INTO `bcnm_loot` VALUES ('15', '737', '122', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '4172', '54', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '644', '41', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '902', '81', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '702', '149', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '866', '54', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '4175', '27', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '700', '41', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '887', '95', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '703', '108', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '844', '135', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '738', '54', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '895', '14', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '830', '14', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '645', '68', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '4173', '14', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '1132', '135', '5');
INSERT INTO `bcnm_loot` VALUES ('15', '836', '96', '6');
INSERT INTO `bcnm_loot` VALUES ('15', '658', '27', '6');
INSERT INTO `bcnm_loot` VALUES ('15', '942', '164', '6');
INSERT INTO `bcnm_loot` VALUES ('15', '844', '260', '6');
INSERT INTO `bcnm_loot` VALUES ('15', '837', '96', '6');
INSERT INTO `bcnm_loot` VALUES ('15', '1132', '288', '6');
INSERT INTO `bcnm_loot` VALUES ('15', '1110', '41', '6');
INSERT INTO `bcnm_loot` VALUES ('16', '13056', '90', '0');
INSERT INTO `bcnm_loot` VALUES ('16', '939', '910', '0'); -- temp fix for 100% drop rate PCC (This item doesnt drop here) 91%
INSERT INTO `bcnm_loot` VALUES ('16', '939', '467', '1'); -- temp placeholder for the "chance to get no item" (This item doesnt drop here) 46.7%
INSERT INTO `bcnm_loot` VALUES ('16', '18086', '48', '1');
INSERT INTO `bcnm_loot` VALUES ('16', '18046', '61', '1');
INSERT INTO `bcnm_loot` VALUES ('16', '18210', '46', '1');
INSERT INTO `bcnm_loot` VALUES ('16', '15286', '302', '1');
INSERT INTO `bcnm_loot` VALUES ('16', '18350', '76', '1');
INSERT INTO `bcnm_loot` VALUES ('16', '939', '413', '2'); -- temp placeholder for the "chance to get no item" (This item doesnt drop here) 41.3%
INSERT INTO `bcnm_loot` VALUES ('16', '17696', '42', '2');
INSERT INTO `bcnm_loot` VALUES ('16', '17936', '77', '2');
INSERT INTO `bcnm_loot` VALUES ('16', '17693', '73', '2');
INSERT INTO `bcnm_loot` VALUES ('16', '15287', '258', '2');
INSERT INTO `bcnm_loot` VALUES ('16', '4717', '68', '2');
INSERT INTO `bcnm_loot` VALUES ('16', '4947', '55', '2');
INSERT INTO `bcnm_loot` VALUES ('16', '4858', '14', '2');
INSERT INTO `bcnm_loot` VALUES ('16', '4858', '114', '3');
INSERT INTO `bcnm_loot` VALUES ('16', '4717', '174', '3');
INSERT INTO `bcnm_loot` VALUES ('16', '4947', '138', '3');
INSERT INTO `bcnm_loot` VALUES ('16', '769', '16', '3');
INSERT INTO `bcnm_loot` VALUES ('16', '770', '17', '3');
INSERT INTO `bcnm_loot` VALUES ('16', '771', '17', '3');
INSERT INTO `bcnm_loot` VALUES ('16', '772', '18', '3');
INSERT INTO `bcnm_loot` VALUES ('16', '773', '17', '3');
INSERT INTO `bcnm_loot` VALUES ('16', '774', '16', '3');
INSERT INTO `bcnm_loot` VALUES ('16', '775', '18', '3');
INSERT INTO `bcnm_loot` VALUES ('16', '776', '16', '3');
INSERT INTO `bcnm_loot` VALUES ('16', '749', '102', '3');
INSERT INTO `bcnm_loot` VALUES ('16', '748', '120', '3');
INSERT INTO `bcnm_loot` VALUES ('16', '699', '22', '3');
INSERT INTO `bcnm_loot` VALUES ('16', '811', '18', '3');
INSERT INTO `bcnm_loot` VALUES ('16', '793', '18', '3');
INSERT INTO `bcnm_loot` VALUES ('16', '790', '20', '3');
INSERT INTO `bcnm_loot` VALUES ('16', '808', '19', '3');
INSERT INTO `bcnm_loot` VALUES ('16', '792', '21', '3');
INSERT INTO `bcnm_loot` VALUES ('16', '788', '35', '3');
INSERT INTO `bcnm_loot` VALUES ('16', '815', '17', '3');
INSERT INTO `bcnm_loot` VALUES ('16', '798', '23', '3');
INSERT INTO `bcnm_loot` VALUES ('16', '4172', '21', '3');
INSERT INTO `bcnm_loot` VALUES ('16', '4174', '16', '3');
INSERT INTO `bcnm_loot` VALUES ('16', '4896', '116', '4');
INSERT INTO `bcnm_loot` VALUES ('16', '4874', '113', '4');
INSERT INTO `bcnm_loot` VALUES ('16', '4751', '137', '4');
INSERT INTO `bcnm_loot` VALUES ('16', '4858', '67', '4');
INSERT INTO `bcnm_loot` VALUES ('16', '4714', '99', '4');
INSERT INTO `bcnm_loot` VALUES ('16', '811', '58', '4');
INSERT INTO `bcnm_loot` VALUES ('16', '793', '52', '4');
INSERT INTO `bcnm_loot` VALUES ('16', '790', '51', '4');
INSERT INTO `bcnm_loot` VALUES ('16', '808', '65', '4');
INSERT INTO `bcnm_loot` VALUES ('16', '792', '61', '4');
INSERT INTO `bcnm_loot` VALUES ('16', '788', '63', '4');
INSERT INTO `bcnm_loot` VALUES ('16', '815', '55', '4');
INSERT INTO `bcnm_loot` VALUES ('16', '798', '62', '4');
INSERT INTO `bcnm_loot` VALUES ('16', '939', '1000', '5');
INSERT INTO `bcnm_loot` VALUES ('16', '914', '1000', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '837', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('17', '17827', '217', '1');
INSERT INTO `bcnm_loot` VALUES ('17', '17451', '174', '1');
INSERT INTO `bcnm_loot` VALUES ('17', '17793', '333', '1');
INSERT INTO `bcnm_loot` VALUES ('17', '17589', '174', '1');
INSERT INTO `bcnm_loot` VALUES ('17', '13402', '101', '2');
INSERT INTO `bcnm_loot` VALUES ('17', '19027', '43', '2');
INSERT INTO `bcnm_loot` VALUES ('17', '920', '275', '2');
INSERT INTO `bcnm_loot` VALUES ('17', '1013', '275', '2');
INSERT INTO `bcnm_loot` VALUES ('17', '19025', '203', '2');
INSERT INTO `bcnm_loot` VALUES ('17', '19026', '116', '2');
INSERT INTO `bcnm_loot` VALUES ('17', '655', '159', '3');
INSERT INTO `bcnm_loot` VALUES ('17', '747', '290', '3');
INSERT INTO `bcnm_loot` VALUES ('17', '13182', '406', '3');
INSERT INTO `bcnm_loot` VALUES ('17', '15325', '159', '4');
INSERT INTO `bcnm_loot` VALUES ('17', '14872', '217', '4');
INSERT INTO `bcnm_loot` VALUES ('17', '15181', '145', '4');
INSERT INTO `bcnm_loot` VALUES ('17', '15387', '159', '4');
INSERT INTO `bcnm_loot` VALUES ('17', '887', '101', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '645', '29', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '902', '29', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '702', '29', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '737', '101', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '823', '29', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '1465', '29', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '700', '43', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '644', '29', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '703', '58', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '738', '14', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '830', '58', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '895', '14', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '4174', '58', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '4175', '29', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '866', '72', '5');
INSERT INTO `bcnm_loot` VALUES ('17', '1110', '87', '6');
INSERT INTO `bcnm_loot` VALUES ('17', '658', '14', '6');
INSERT INTO `bcnm_loot` VALUES ('17', '836', '29', '6');
INSERT INTO `bcnm_loot` VALUES ('17', '837', '43', '6');
INSERT INTO `bcnm_loot` VALUES ('17', '942', '174', '6');
INSERT INTO `bcnm_loot` VALUES ('17', '844', '246', '6');
INSERT INTO `bcnm_loot` VALUES ('17', '1132', '159', '6');
INSERT INTO `bcnm_loot` VALUES ('79', '793', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('79', '792', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('79', '1311', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('79', '14666', '447', '3');
INSERT INTO `bcnm_loot` VALUES ('79', '14662', '487', '3');
INSERT INTO `bcnm_loot` VALUES ('79', '13175', '494', '4');
INSERT INTO `bcnm_loot` VALUES ('79', '13176', '449', '4');
INSERT INTO `bcnm_loot` VALUES ('79', '791', '51', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '801', '32', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '654', '39', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '702', '21', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '4173', '32', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '745', '55', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '784', '62', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '653', '81', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '802', '56', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '797', '195', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '652', '58', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '803', '38', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '773', '11', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '4175', '21', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '771', '15', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '805', '26', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '769', '21', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '700', '17', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '770', '9', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '810', '62', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '774', '11', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '775', '11', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '772', '11', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '776', '9', '5');
INSERT INTO `bcnm_loot` VALUES ('79', '15185', '55', '6');
INSERT INTO `bcnm_loot` VALUES ('79', '17440', '13', '5');
INSERT INTO `bcnm_loot` VALUES ('35', '852', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('35', '13014', '79', '1');
INSERT INTO `bcnm_loot` VALUES ('35', '0', '950', '1');
INSERT INTO `bcnm_loot` VALUES ('35', '15282', '53', '2');
INSERT INTO `bcnm_loot` VALUES ('35', '15275', '79', '2');
INSERT INTO `bcnm_loot` VALUES ('35', '15278', '157', '2');
INSERT INTO `bcnm_loot` VALUES ('35', '694', '184', '2');
INSERT INTO `bcnm_loot` VALUES ('35', '690', '368', '2');
INSERT INTO `bcnm_loot` VALUES ('35', '652', '79', '2');
INSERT INTO `bcnm_loot` VALUES ('35', '0', '600', '3');
INSERT INTO `bcnm_loot` VALUES ('35', '15282', '53', '3');
INSERT INTO `bcnm_loot` VALUES ('35', '15275', '79', '3');
INSERT INTO `bcnm_loot` VALUES ('35', '15278', '157', '3');
INSERT INTO `bcnm_loot` VALUES ('35', '694', '184', '3');
INSERT INTO `bcnm_loot` VALUES ('35', '690', '368', '3');
INSERT INTO `bcnm_loot` VALUES ('35', '652', '79', '3');
INSERT INTO `bcnm_loot` VALUES ('35', '15285', '105', '4');
INSERT INTO `bcnm_loot` VALUES ('35', '15279', '105', '4');
INSERT INTO `bcnm_loot` VALUES ('35', '651', '131', '4');
INSERT INTO `bcnm_loot` VALUES ('35', '643', '131', '4');
INSERT INTO `bcnm_loot` VALUES ('35', '644', '79', '4');
INSERT INTO `bcnm_loot` VALUES ('35', '736', '79', '4');
INSERT INTO `bcnm_loot` VALUES ('35', '795', '131', '4');
INSERT INTO `bcnm_loot` VALUES ('35', '17867', '552', '5');
INSERT INTO `bcnm_loot` VALUES ('35', '4877', '263', '5');
INSERT INTO `bcnm_loot` VALUES ('35', '4878', '210', '5');
INSERT INTO `bcnm_loot` VALUES ('35', '4876', '289', '5');
INSERT INTO `bcnm_loot` VALUES ('35', '4868', '105', '5');
INSERT INTO `bcnm_loot` VALUES ('35', '4751', '79', '5');
INSERT INTO `bcnm_loot` VALUES ('35', '5070', '421', '5');
INSERT INTO `bcnm_loot` VALUES ('35', '4947', '79', '5');
INSERT INTO `bcnm_loot` VALUES ('35', '15271', '552', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '15272', '131', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '809', '0', '6'); -- yes 0%
INSERT INTO `bcnm_loot` VALUES ('35', '15276', '79', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '645', '105', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '15281', '26', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '4132', '184', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '796', '79', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '15273', '157', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '653', '210', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '799', '26', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '15283', '263', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '15277', '105', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '15280', '105', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '15274', '131', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '744', '79', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '806', '131', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '0', '600', '6');
INSERT INTO `bcnm_loot` VALUES ('35', '15271', '552', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '15272', '131', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '809', '0', '7'); -- yes 0%
INSERT INTO `bcnm_loot` VALUES ('35', '15276', '79', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '645', '105', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '15281', '26', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '4132', '184', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '796', '79', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '15273', '157', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '653', '210', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '799', '26', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '15283', '263', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '15277', '105', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '15280', '105', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '15274', '131', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '744', '79', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '806', '131', '7');
INSERT INTO `bcnm_loot` VALUES ('35', '0', '600', '7');
-- limbus                      lootID,ItemID,Roll,lootgroup
-- SE Appollyon first floor
INSERT INTO `bcnm_loot` VALUES ('110', '1875', '1000', '0'); -- ancient beastcoin*4
INSERT INTO `bcnm_loot` VALUES ('110', '1875', '1000', '1'); 
INSERT INTO `bcnm_loot` VALUES ('110', '1875', '1000', '2'); 
INSERT INTO `bcnm_loot` VALUES ('110', '1875', '1000', '3'); 
INSERT INTO `bcnm_loot` VALUES ('110', '1939', '350', '4'); --  RDM,
INSERT INTO `bcnm_loot` VALUES ('110', '1941', '278', '4'); --  THF,
INSERT INTO `bcnm_loot` VALUES ('110', '1959', '174', '4'); --   SMN,
INSERT INTO `bcnm_loot` VALUES ('110', '1949', '200', '4');  --  BRD
INSERT INTO `bcnm_loot` VALUES ('110', '1945', '47', '5');  --  DRK,
INSERT INTO `bcnm_loot` VALUES ('110', '1951', '49', '5');  --  RNG,
INSERT INTO `bcnm_loot` VALUES ('110', '1955', '200', '5');  --  NIN,
INSERT INTO `bcnm_loot` VALUES ('110', '2659', '62', '5');  --  COR,
INSERT INTO `bcnm_loot` VALUES ('110', '2715', '407', '5');  --  DNC
-- -------------------------------------
-- SE Appollyon Second floor
-- -------------------------------------
INSERT INTO `bcnm_loot` VALUES ('111', '1875', '1000', '0'); -- ancient beastcoin*4
INSERT INTO `bcnm_loot` VALUES ('111', '1875', '1000', '1'); 
INSERT INTO `bcnm_loot` VALUES ('111', '1875', '1000', '2'); 
INSERT INTO `bcnm_loot` VALUES ('111', '1875', '1000', '3'); 
INSERT INTO `bcnm_loot` VALUES ('111', '1959', '47', '4'); --   SMN,
INSERT INTO `bcnm_loot` VALUES ('111', '1949', '30', '4');  --  BRD
INSERT INTO `bcnm_loot` VALUES ('111', '1943', '200', '4'); -- PLD,
INSERT INTO `bcnm_loot` VALUES ('111', '1947', '460', '4'); --  BST,
INSERT INTO `bcnm_loot` VALUES ('111', '2661', '400', '4'); --  PUP
INSERT INTO `bcnm_loot` VALUES ('111', '1951', '20', '5');  --  RNG,
INSERT INTO `bcnm_loot` VALUES ('111', '1955', '80', '5');  --  NIN,
INSERT INTO `bcnm_loot` VALUES ('111', '1945', '90', '5');  --  DRK,
INSERT INTO `bcnm_loot` VALUES ('111', '2659', '100', '5');  --  COR,
INSERT INTO `bcnm_loot` VALUES ('111', '2715', '120', '5');  --  DNC
-- SE Appollyon Third floor
-- -------------------------------------
INSERT INTO `bcnm_loot` VALUES ('112', '1875', '1000', '0'); -- ancient beastcoin*4
INSERT INTO `bcnm_loot` VALUES ('112', '1875', '1000', '1'); 
INSERT INTO `bcnm_loot` VALUES ('112', '1875', '1000', '2'); 
INSERT INTO `bcnm_loot` VALUES ('112', '1875', '1000', '3'); 
INSERT INTO `bcnm_loot` VALUES ('112', '1955', '59', '4');  --  NIN,
INSERT INTO `bcnm_loot` VALUES ('112', '1959', '139', '4'); --   SMN,
INSERT INTO `bcnm_loot` VALUES ('112', '1949', '39', '4');  --  BRD
INSERT INTO `bcnm_loot` VALUES ('112', '1681', '39', '4'); --   Light Steel 
INSERT INTO `bcnm_loot` VALUES ('112', '645', '39', '4');  --  Darksteel Ore
INSERT INTO `bcnm_loot` VALUES ('112', '1933', '627', '4'); --  MNK,
INSERT INTO `bcnm_loot` VALUES ('112', '1945', '159', '5');  --  DRK,
INSERT INTO `bcnm_loot` VALUES ('112', '1951', '139', '5');  --  RNG,
INSERT INTO `bcnm_loot` VALUES ('112', '2659', '39', '5');  --  COR,
INSERT INTO `bcnm_loot` VALUES ('112', '664', '20', '5');  --  Darksteel Sheet
INSERT INTO `bcnm_loot` VALUES ('112', '646', '20', '5');  --   Adaman Ore
INSERT INTO `bcnm_loot` VALUES ('112', '1931', '200', '5'); --  WAR,
-- ---SE Appollyon fourth floor-------------------------
INSERT INTO `bcnm_loot` VALUES ('113', '1875', '1000', '0'); -- ancient beastcoin*5
INSERT INTO `bcnm_loot` VALUES ('113', '1875', '1000', '1'); 
INSERT INTO `bcnm_loot` VALUES ('113', '1875', '1000', '2'); 
INSERT INTO `bcnm_loot` VALUES ('113', '1875', '1000', '3'); 
INSERT INTO `bcnm_loot` VALUES ('113', '1875', '1000', '4'); 
INSERT INTO `bcnm_loot` VALUES ('113', '1935', '220', '5'); --  WHM,
INSERT INTO `bcnm_loot` VALUES ('113', '1937', '300', '5'); -- BLM, 
INSERT INTO `bcnm_loot` VALUES ('113', '1957', '260', '5'); --  DRG, 
INSERT INTO `bcnm_loot` VALUES ('113', '1953', '340', '5');  --  SAM,
INSERT INTO `bcnm_loot` VALUES ('113', '2657', '220', '6');  --  BLU,
INSERT INTO `bcnm_loot` VALUES ('113', '2717', '180', '6');  --  SCH
INSERT INTO `bcnm_loot` VALUES ('113', '1931', '300', '6');  -- WAR,
INSERT INTO `bcnm_loot` VALUES ('113', '1909', '1000', '7'); --  Smalt Chip,
INSERT INTO `bcnm_loot` VALUES ('113', '2127', '59', '8');  --  metal chip
INSERT INTO `bcnm_loot` VALUES ('113', '1875', '100', '8'); 
--  ----NE APOLLYON FIRST FLOOR ----------------------------
INSERT INTO `bcnm_loot` VALUES ('114', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('114', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('114', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('114', '1875', '1000', '3');

INSERT INTO `bcnm_loot` VALUES ('114', '1953', '304', '4'); -- SAM,
INSERT INTO `bcnm_loot` VALUES ('114', '1943', '18', '4'); --  PLD,
INSERT INTO `bcnm_loot` VALUES ('114', '1941', '200', '4'); -- THF,
INSERT INTO `bcnm_loot` VALUES ('114', '2715', '200', '4'); -- DNC
INSERT INTO `bcnm_loot` VALUES ('114', '2661', '36', '4'); -- PUP

INSERT INTO `bcnm_loot` VALUES ('114', '1933', '18', '5'); -- MNK, 
INSERT INTO `bcnm_loot` VALUES ('114', '1939', '36', '5'); -- RDM,
INSERT INTO `bcnm_loot` VALUES ('114', '1935', '411', '5'); -- WHM,
INSERT INTO `bcnm_loot` VALUES ('114', '2717', '482', '5'); --  SCH,
INSERT INTO `bcnm_loot` VALUES ('114', '1947', '18', '5'); -- BST,

--  ----NE APOLLYON SECOND FLOOR ----------------------------
INSERT INTO `bcnm_loot` VALUES ('115', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('115', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('115', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('115', '1875', '1000', '3');

INSERT INTO `bcnm_loot` VALUES ('115', '1947', '26', '4'); -- BST,
INSERT INTO `bcnm_loot` VALUES ('115', '1933', '53', '4'); -- MNK, 
INSERT INTO `bcnm_loot` VALUES ('115', '1943', '26', '4'); -- PLD,
INSERT INTO `bcnm_loot` VALUES ('115', '2661', '26', '4'); -- PUP
INSERT INTO `bcnm_loot` VALUES ('115', '1937', '395', '4'); -- BLM

INSERT INTO `bcnm_loot` VALUES ('115', '1957', '289', '5'); -- DRG,
INSERT INTO `bcnm_loot` VALUES ('115', '1941', '53', '5'); -- THF,
INSERT INTO `bcnm_loot` VALUES ('115', '1939', '112', '5'); -- RDM
INSERT INTO `bcnm_loot` VALUES ('115', '2657', '477', '5'); -- BLU,

--  ----NE APOLLYON thIRd FLOOR ----------------------------
INSERT INTO `bcnm_loot` VALUES ('116', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('116', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('116', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('116', '1875', '1000', '3');

INSERT INTO `bcnm_loot` VALUES ('116', '1931', '788', '4'); -- WAR,
INSERT INTO `bcnm_loot` VALUES ('116', '1939', '30', '4'); -- RDM,
INSERT INTO `bcnm_loot` VALUES ('116', '1953', '130', '4'); -- SAM,
INSERT INTO `bcnm_loot` VALUES ('116', '1957', '100', '4'); --  DRG
INSERT INTO `bcnm_loot` VALUES ('116', '1947', '90', '4'); -- BST,

INSERT INTO `bcnm_loot` VALUES ('116', '1933', '30', '5'); -- MNK,
INSERT INTO `bcnm_loot` VALUES ('116', '1941', '99', '5'); -- THF
INSERT INTO `bcnm_loot` VALUES ('116', '2661', '61', '5'); -- PUP
INSERT INTO `bcnm_loot` VALUES ('116', '2715', '30', '5'); -- DNC
INSERT INTO `bcnm_loot` VALUES ('116', '1943', '160', '5'); -- PLD

INSERT INTO `bcnm_loot` VALUES ('116', '1633', '30', '6'); -- Clot Plasma
INSERT INTO `bcnm_loot` VALUES ('116', '821', '40', '6'); -- Rainbow Thread

INSERT INTO `bcnm_loot` VALUES ('116', '1311', '50', '7'); -- Oxblood
INSERT INTO `bcnm_loot` VALUES ('116', '1883', '40', '7'); -- Shell Powder
INSERT INTO `bcnm_loot` VALUES ('116', '2004', '20', '7'); -- Carapace Powder

--  ----NE APOLLYON FOURTH FLOOR ----------------------------
INSERT INTO `bcnm_loot` VALUES ('117', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('117', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('117', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('117', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('117', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('117', '1875', '1000', '5');

INSERT INTO `bcnm_loot` VALUES ('117', '1949', '326', '6'); -- BRD
INSERT INTO `bcnm_loot` VALUES ('117', '1945', '256', '6'); -- DRK
INSERT INTO `bcnm_loot` VALUES ('117', '1951', '395', '6'); -- RNG

INSERT INTO `bcnm_loot` VALUES ('117', '1959', '279', '7'); -- SMN
INSERT INTO `bcnm_loot` VALUES ('117', '1955', '256', '7'); -- NIN
INSERT INTO `bcnm_loot` VALUES ('117', '2659', '326', '7'); -- COR

--  ----NE APOLLYON FIVE FLOOR ----------------------------
INSERT INTO `bcnm_loot` VALUES ('118', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('118', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('118', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('118', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('118', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('118', '1875', '1000', '5');
INSERT INTO `bcnm_loot` VALUES ('118', '1875', '1000', '6');
INSERT INTO `bcnm_loot` VALUES ('118', '1875', '100', '7');
INSERT INTO `bcnm_loot` VALUES ('118', '2127', '59', '7'); -- Metal Chip. 
INSERT INTO `bcnm_loot` VALUES ('118', '1910', '1000', '8'); -- Smoky Chip.

--  ----SW APOLLYON FIRST FLOOR ----------------------------
INSERT INTO `bcnm_loot` VALUES ('119', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('119', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('119', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('119', '1875', '1000', '3');

INSERT INTO `bcnm_loot` VALUES ('119', '1949', '464', '4');-- BRD
INSERT INTO `bcnm_loot` VALUES ('119', '1945', '250', '4');-- DRK 
INSERT INTO `bcnm_loot` VALUES ('119', '1953', '110', '4');-- SAM 
INSERT INTO `bcnm_loot` VALUES ('119', '1937', '71', '4');-- BLM 

INSERT INTO `bcnm_loot` VALUES ('119', '1931', '180', '5');-- WAR
INSERT INTO `bcnm_loot` VALUES ('119', '2657', '210', '5');-- BLU
INSERT INTO `bcnm_loot` VALUES ('119', '2717', '111', '5');-- SCH
INSERT INTO `bcnm_loot` VALUES ('119', '1935', '107', '5');-- WHM

--  ----SW APOLLYON SECOND FLOOR ----------------------------
INSERT INTO `bcnm_loot` VALUES ('120', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('120', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('120', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('120', '1875', '1000', '3');

INSERT INTO `bcnm_loot` VALUES ('120', '1951', '154', '4');-- RNG
INSERT INTO `bcnm_loot` VALUES ('120', '1935', '95', '4');-- WHM
INSERT INTO `bcnm_loot` VALUES ('120', '1959', '269', '4');-- SMN

INSERT INTO `bcnm_loot` VALUES ('120', '1937', '106', '5');-- BLM
INSERT INTO `bcnm_loot` VALUES ('120', '1931', '77', '5');-- WAR
INSERT INTO `bcnm_loot` VALUES ('120', '2659', '423', '5');-- COR
INSERT INTO `bcnm_loot` VALUES ('120', '1957', '110', '5');-- DRG

--  ----SW APOLLYON THIRD FLOOR ----------------------------
INSERT INTO `bcnm_loot` VALUES ('121', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('121', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('121', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('121', '1875', '1000', '3');


INSERT INTO `bcnm_loot` VALUES ('121', '1955', '595', '4');-- NIN
INSERT INTO `bcnm_loot` VALUES ('121', '1957', '100', '4');-- DRG
INSERT INTO `bcnm_loot` VALUES ('121', '1937', '24', '4');-- BLM
INSERT INTO `bcnm_loot` VALUES ('121', '1953', '48', '4');-- SAM

INSERT INTO `bcnm_loot` VALUES ('121', '1931', '120', '5');-- WAR
INSERT INTO `bcnm_loot` VALUES ('121', '1953', '48', '5');-- SAM
INSERT INTO `bcnm_loot` VALUES ('121', '1935', '24', '5');-- WHM
INSERT INTO `bcnm_loot` VALUES ('121', '2657', '24', '5');-- BLU
INSERT INTO `bcnm_loot` VALUES ('121', '2717', '71', '5');-- SCH

INSERT INTO `bcnm_loot` VALUES ('121', '1311', '32', '6');-- Oxblood
INSERT INTO `bcnm_loot` VALUES ('121', '1883', '40', '6');-- Shell Powder
INSERT INTO `bcnm_loot` VALUES ('121', '1681', '31', '6');-- Light Steel
INSERT INTO `bcnm_loot` VALUES ('121', '1633', '71', '6');-- Clot Plasma
INSERT INTO `bcnm_loot` VALUES ('121', '645', '31', '6');-- Darksteel Ore
INSERT INTO `bcnm_loot` VALUES ('121', '664', '63', '6');-- Darksteel Sheet
INSERT INTO `bcnm_loot` VALUES ('121', '646', '31', '6');-- Adaman Ore
INSERT INTO `bcnm_loot` VALUES ('121', '821', '63', '6');-- Rainbow Thread

--  ----SW APOLLYON Fourth FLOOR ----------------------------
INSERT INTO `bcnm_loot` VALUES ('122', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('122', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('122', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('122', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('122', '1875', '1000', '4');

INSERT INTO `bcnm_loot` VALUES ('122', '1941', '468', '5');-- THF
INSERT INTO `bcnm_loot` VALUES ('122', '1947', '340', '5');-- BST 
INSERT INTO `bcnm_loot` VALUES ('122', '1933', '255', '5');-- MNK
INSERT INTO `bcnm_loot` VALUES ('122', '1939', '191', '5');-- RDM

INSERT INTO `bcnm_loot` VALUES ('122', '1943', '170', '6');-- PLD 
INSERT INTO `bcnm_loot` VALUES ('122', '2661', '340', '6');-- PUP
INSERT INTO `bcnm_loot` VALUES ('122', '2715', '170', '6');-- DNC

INSERT INTO `bcnm_loot` VALUES ('122', '1987', '1000', '7');-- Charcoal Chip
INSERT INTO `bcnm_loot` VALUES ('122', '2127', '59', '8');-- Metal Chip
INSERT INTO `bcnm_loot` VALUES ('122', '1875', '100', '8');
--  ----NW APOLLYON FIRST FLOOR ----------------------------
INSERT INTO `bcnm_loot` VALUES ('123', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('123', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('123', '1937', '25', '2');--  BLM,
INSERT INTO `bcnm_loot` VALUES ('123', '2657', '175', '2');--  BLU,
INSERT INTO `bcnm_loot` VALUES ('123', '1957', '100', '2');--  DRG,
INSERT INTO `bcnm_loot` VALUES ('123', '1943', '25', '2');--  PLD,
INSERT INTO `bcnm_loot` VALUES ('123', '1953', '250', '2');--  SAM,
INSERT INTO `bcnm_loot` VALUES ('123', '2717', '75', '2');--  SCH,
INSERT INTO `bcnm_loot` VALUES ('123', '1931', '225', '2');--  WAR,
INSERT INTO `bcnm_loot` VALUES ('123', '1935', '50', '2');--  WHM
--  ----NW APOLLYON SECOND FLOOR ----------------------------
INSERT INTO `bcnm_loot` VALUES ('124', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('124', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('124', '1943', '235', '2');--  BRD,
INSERT INTO `bcnm_loot` VALUES ('124', '2659', '59', '2');--  COR,
INSERT INTO `bcnm_loot` VALUES ('124', '1945', '235', '2');--  DRK,
INSERT INTO `bcnm_loot` VALUES ('124', '1955', '147', '2');--  NIN,
INSERT INTO `bcnm_loot` VALUES ('124', '1951', '118', '2');--  RNG,
INSERT INTO `bcnm_loot` VALUES ('124', '1959', '176', '2');--  SMN,
INSERT INTO `bcnm_loot` VALUES ('124', '1935', '110', '2');--  WHM 
--  ----NW APOLLYON THIRD FLOOR ----------------------------
INSERT INTO `bcnm_loot` VALUES ('125', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('125', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('125', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('125', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('125', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('125', '1947', '133', '5');--  BST,
INSERT INTO `bcnm_loot` VALUES ('125', '1933', '133', '5');--  MNK,
INSERT INTO `bcnm_loot` VALUES ('125', '1943', '133', '5');--  PLD,
INSERT INTO `bcnm_loot` VALUES ('125', '2661', '133', '5');--  PUP,
INSERT INTO `bcnm_loot` VALUES ('125', '1939', '110', '5');--  RDM,
INSERT INTO `bcnm_loot` VALUES ('125', '1941', '400', '5');--  THF,
INSERT INTO `bcnm_loot` VALUES ('125', '646', '50', '6');--  Adaman Ore,
INSERT INTO `bcnm_loot` VALUES ('125', '1633', '50', '6');--  Clot Plasma,
INSERT INTO `bcnm_loot` VALUES ('125', '664', '50', '6');--  Darksteel Sheet,
INSERT INTO `bcnm_loot` VALUES ('125', '645', '50', '6');--  Darksteel Ore,
INSERT INTO `bcnm_loot` VALUES ('125', '1311', '50', '6');--  Oxblood,
INSERT INTO `bcnm_loot` VALUES ('125', '1681', '50', '6');--  Light Steel,
INSERT INTO `bcnm_loot` VALUES ('125', '821', '50', '6');--  Rainbow Thread,
INSERT INTO `bcnm_loot` VALUES ('125', '1883', '50', '6');--  Shell Powder
--  ----NW APOLLYON FOURTH FLOOR ----------------------------
INSERT INTO `bcnm_loot` VALUES ('126', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('126', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('126', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('126', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('126', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('126', '1875', '1000', '5');
INSERT INTO `bcnm_loot` VALUES ('126', '1875', '1000', '6');
INSERT INTO `bcnm_loot` VALUES ('126', '1875', '1000', '7');
INSERT INTO `bcnm_loot` VALUES ('126', '1937', '80', '8');--  BLM,
INSERT INTO `bcnm_loot` VALUES ('126', '2657', '70', '8');--  BLU,
INSERT INTO `bcnm_loot` VALUES ('126', '1949', '48', '8');--  BRD
INSERT INTO `bcnm_loot` VALUES ('126', '1947', '30', '8');--  BST,
INSERT INTO `bcnm_loot` VALUES ('126', '2659', '25', '8');--  COR,
INSERT INTO `bcnm_loot` VALUES ('126', '1957', '19', '8');--  DRG,
INSERT INTO `bcnm_loot` VALUES ('126', '1945', '48', '8');--  DRK,
INSERT INTO `bcnm_loot` VALUES ('126', '1933', '90', '8');--  MNK,
INSERT INTO `bcnm_loot` VALUES ('126', '1955', '00', '8');--  NIN,
INSERT INTO `bcnm_loot` VALUES ('126', '2661', '48', '8');--  PUP,
INSERT INTO `bcnm_loot` VALUES ('126', '1939', '136', '8');--  RDM,
INSERT INTO `bcnm_loot` VALUES ('126', '1951', '80', '8');--  RNG,
INSERT INTO `bcnm_loot` VALUES ('126', '1953', '110', '8');--  SAM,
INSERT INTO `bcnm_loot` VALUES ('126', '1959', '95', '8');--  SMN,
INSERT INTO `bcnm_loot` VALUES ('126', '2715', '123', '8');--  DNC,
INSERT INTO `bcnm_loot` VALUES ('126', '1935', '48', '8');--  WHM
--  ----NW APOLLYON FIfth FLOOR ----------------------------
INSERT INTO `bcnm_loot` VALUES ('127', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('127', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('127', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('127', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('127', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('127', '1937', '109', '5');--  BLM,
INSERT INTO `bcnm_loot` VALUES ('127', '2657', '152', '5');--  BLU,
INSERT INTO `bcnm_loot` VALUES ('127', '1949', '283', '5');--  BRD,
INSERT INTO `bcnm_loot` VALUES ('127', '1947', '109', '5');--  BST,
INSERT INTO `bcnm_loot` VALUES ('127', '2659', '65', '5');--  COR,
INSERT INTO `bcnm_loot` VALUES ('127', '2715', '130', '5');--  DNC,
INSERT INTO `bcnm_loot` VALUES ('127', '1957', '65', '6');--  DRG,
INSERT INTO `bcnm_loot` VALUES ('127', '1945', '174', '6');--  DRK,
INSERT INTO `bcnm_loot` VALUES ('127', '1933', '130', '6');--  MNK,
INSERT INTO `bcnm_loot` VALUES ('127', '1955', '196', '6');--  NIN,
INSERT INTO `bcnm_loot` VALUES ('127', '1943', '174', '6');--  PLD,
INSERT INTO `bcnm_loot` VALUES ('127', '2661', '174', '6');--  PUP,
INSERT INTO `bcnm_loot` VALUES ('127', '1939', '109', '6');--  RDM
INSERT INTO `bcnm_loot` VALUES ('127', '1951', '130', '7');--  RNG,
INSERT INTO `bcnm_loot` VALUES ('127', '1953', '304', '7');--  SAM,
INSERT INTO `bcnm_loot` VALUES ('127', '2717', '87', '7');--  SCH,
INSERT INTO `bcnm_loot` VALUES ('127', '1959', '217', '7');--  SMN,
INSERT INTO `bcnm_loot` VALUES ('127', '1941', '174', '7');--  THF,
INSERT INTO `bcnm_loot` VALUES ('127', '1931', '130', '7');--  WAR,
INSERT INTO `bcnm_loot` VALUES ('127', '1935', '109', '7');--  WHM
INSERT INTO `bcnm_loot` VALUES ('127', '1988', '1000', '8');-- magenta-chip
INSERT INTO `bcnm_loot` VALUES ('127', '2127', '59', '9');-- Metal Chip
INSERT INTO `bcnm_loot` VALUES ('127', '1875', '100', '9');
-- ----------  CENTRAL APOLLYON --------------------------------

INSERT INTO `bcnm_loot` VALUES ('128', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('128', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('128', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('128', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('128', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('128', '1925', '659', '5'); -- Omega's Eye
INSERT INTO `bcnm_loot` VALUES ('128', '1927', '394', '5'); -- Omega's Foreleg
INSERT INTO `bcnm_loot` VALUES ('128', '1928', '388', '5'); -- Omega's Hind Leg
INSERT INTO `bcnm_loot` VALUES ('128', '1929', '404', '5'); -- Omega's Tail

INSERT INTO `bcnm_loot` VALUES ('128', '1928', '394', '6'); -- Omega's Hind Leg
INSERT INTO `bcnm_loot` VALUES ('128', '1929', '402', '6'); -- Omega's Tail
INSERT INTO `bcnm_loot` VALUES ('128', '1925', '659', '6'); -- Omega's Eye
INSERT INTO `bcnm_loot` VALUES ('128', '1927', '383', '6'); -- Omega's Foreleg

INSERT INTO `bcnm_loot` VALUES ('128', '1926', '265', '7'); -- Omega's Heart
INSERT INTO `bcnm_loot` VALUES ('128', '1875', '100', '7');
-- -----------------------------------------------------------------

INSERT INTO `bcnm_loot` VALUES ('129', '1933', '9', '0'); -- Ancient Brass (MNK)(0%)
INSERT INTO `bcnm_loot` VALUES ('129', '1931', '53', '0'); -- Argyro Rivet (WAR)(5.3%)
INSERT INTO `bcnm_loot` VALUES ('129', '1959', '6', '0'); -- Astral Leather (SMN)(0.6%)
INSERT INTO `bcnm_loot` VALUES ('129', '1935', '12', '0'); -- Benedict Yarn (WHM)(1.2%)
INSERT INTO `bcnm_loot` VALUES ('129', '1945', '29', '0'); -- Black Rivet (DRK)(2.9%)
INSERT INTO `bcnm_loot` VALUES ('129', '1957', '12', '0'); -- Blue Rivet (DRG)(1.2%)
INSERT INTO `bcnm_loot` VALUES ('129', '1949', '35', '0'); -- Brown Doeskin (BRD)(3.5%)
INSERT INTO `bcnm_loot` VALUES ('129', '2659', '35', '0'); -- Canvas Toile (COR)(3.5%)
INSERT INTO `bcnm_loot` VALUES ('129', '1939', '12', '0'); -- Cardinal Cloth (RDM) (1.2%)
INSERT INTO `bcnm_loot` VALUES ('129', '1951', '12', '0'); -- Charcoal Cotton (RNG) (1.2%)
INSERT INTO `bcnm_loot` VALUES ('129', '2661', '12', '0'); -- Corduroy Cloth (PUP) (1.2%)
INSERT INTO `bcnm_loot` VALUES ('129', '1937', '18', '0'); -- Diabolic Yarn (BLM)(1.8%)
INSERT INTO `bcnm_loot` VALUES ('129', '1955', '29', '0'); -- Ebony Lacquer (NIN) (2.9%)
INSERT INTO `bcnm_loot` VALUES ('129', '2717', '12', '0'); -- Electrum Stud (SCH)(1.2%)
INSERT INTO `bcnm_loot` VALUES ('129', '1947', '12', '0'); -- Fetid Lanolin (BST)(1.2%)
INSERT INTO `bcnm_loot` VALUES ('129', '2657', '18', '0'); -- Flameshun Cloth (BLU)(1.8%)
INSERT INTO `bcnm_loot` VALUES ('129', '2715', '5', '0'); -- Gold Stud (DNC) (0%)
INSERT INTO `bcnm_loot` VALUES ('129', '1953', '35', '0'); -- Kurogane (SAM)(3.5%)
INSERT INTO `bcnm_loot` VALUES ('129', '1941', '41', '0'); -- Light Filament (THF)(4.1%)
INSERT INTO `bcnm_loot` VALUES ('129', '1943', '18', '0'); -- White Rivet (PLD)(1.8%)
INSERT INTO `bcnm_loot` VALUES ('129', '1987', '53', '0'); -- Charcoal Chip (5.3%)
INSERT INTO `bcnm_loot` VALUES ('129', '1988', '76', '0'); -- Magenta Chip (7.6%)
INSERT INTO `bcnm_loot` VALUES ('129', '1909', '64', '0'); -- Smalt Chip (6.4%)
INSERT INTO `bcnm_loot` VALUES ('129', '1910', '41', '0'); -- Smoky Chip (4.1%)
INSERT INTO `bcnm_loot` VALUES ('129', '646', '50', '1');--  Adaman Ore,
INSERT INTO `bcnm_loot` VALUES ('129', '1633', '50', '1');--  Clot Plasma,
INSERT INTO `bcnm_loot` VALUES ('129', '664', '50', '1');--  Darksteel Sheet,
INSERT INTO `bcnm_loot` VALUES ('129', '645', '50', '1');--  Darksteel Ore,
INSERT INTO `bcnm_loot` VALUES ('129', '1311', '50', '1');--  Oxblood,
INSERT INTO `bcnm_loot` VALUES ('129', '1681', '50', '1');--  Light Steel,
INSERT INTO `bcnm_loot` VALUES ('129', '821', '50', '1');--  Rainbow Thread,
INSERT INTO `bcnm_loot` VALUES ('129', '1883', '50', '1');--  Shell Powder

-- ------------------------------------------------------------------------------------



-- Temenos_Northern_Tower --------------------------------------------------------------
-- F1
INSERT INTO `bcnm_loot` VALUES ('130', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('130', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('130', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('130', '1954', '159', '3'); -- NIN 
INSERT INTO `bcnm_loot` VALUES ('130', '1940', '146', '3'); -- THF
INSERT INTO `bcnm_loot` VALUES ('130', '1932', '85', '3'); -- MNK
INSERT INTO `bcnm_loot` VALUES ('130', '1956', '171', '3'); -- DRG
INSERT INTO `bcnm_loot` VALUES ('130', '1934', '110', '3'); -- WHM
INSERT INTO `bcnm_loot` VALUES ('130', '2658', '220', '3'); -- COR 
INSERT INTO `bcnm_loot` VALUES ('130', '2716', '98', '3'); -- SCH

-- F2
INSERT INTO `bcnm_loot` VALUES ('131', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('131', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('131', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('131', '1932', '333', '3'); -- MNK
INSERT INTO `bcnm_loot` VALUES ('131', '1954', '200', '3'); -- NIN
INSERT INTO `bcnm_loot` VALUES ('131', '1950', '100', '3'); -- RNG
INSERT INTO `bcnm_loot` VALUES ('131', '1940', '90', '3'); -- THF
INSERT INTO `bcnm_loot` VALUES ('131', '1942', '70', '3'); -- PLD
INSERT INTO `bcnm_loot` VALUES ('131', '1934', '90', '3'); -- WHM
INSERT INTO `bcnm_loot` VALUES ('131', '1936', '100', '3'); -- BLM
INSERT INTO `bcnm_loot` VALUES ('131', '1958', '90', '3'); -- SMN
INSERT INTO `bcnm_loot` VALUES ('131', '2656', '67', '3'); -- BLU
INSERT INTO `bcnm_loot` VALUES ('131', '1956', '167', '3'); -- DRG

-- F3
INSERT INTO `bcnm_loot` VALUES ('132', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('132', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('132', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('132', '1956', '27', '3'); -- DRG
INSERT INTO `bcnm_loot` VALUES ('132', '1932', '324', '3'); -- MNK
INSERT INTO `bcnm_loot` VALUES ('132', '1950', '80', '3'); -- RNG
INSERT INTO `bcnm_loot` VALUES ('132', '1934', '189', '3'); -- WHM
INSERT INTO `bcnm_loot` VALUES ('132', '1930', '50', '3'); -- WAR
INSERT INTO `bcnm_loot` VALUES ('132', '1940', '27', '4'); -- THF
INSERT INTO `bcnm_loot` VALUES ('132', '1936', '81', '4'); -- BLM
INSERT INTO `bcnm_loot` VALUES ('132', '1944', '80', '4'); -- DRK
INSERT INTO `bcnm_loot` VALUES ('132', '1958', '81', '4'); -- SMN
INSERT INTO `bcnm_loot` VALUES ('132', '2658', '270', '4'); -- COR
INSERT INTO `bcnm_loot` VALUES ('132', '2714', '108', '4'); -- DNC

-- F4
INSERT INTO `bcnm_loot` VALUES ('133', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('133', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('133', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('133', '1942', '90', '3'); -- PLD
INSERT INTO `bcnm_loot` VALUES ('133', '1934', '435', '3'); -- WHM
INSERT INTO `bcnm_loot` VALUES ('133', '1956', '80', '3'); -- DRG
INSERT INTO `bcnm_loot` VALUES ('133', '1940', '174', '3'); -- THF
INSERT INTO `bcnm_loot` VALUES ('133', '1958', '87', '3'); -- SMN
INSERT INTO `bcnm_loot` VALUES ('133', '1954', '90', '3'); -- NIN
INSERT INTO `bcnm_loot` VALUES ('133', '1936', '87', '3'); -- BLM 
INSERT INTO `bcnm_loot` VALUES ('133', '1930', '43', '3'); -- WAR
INSERT INTO `bcnm_loot` VALUES ('133', '2656', '27', '3'); -- BLU
INSERT INTO `bcnm_loot` VALUES ('133', '2658', '261', '3'); -- COR

-- F5
INSERT INTO `bcnm_loot` VALUES ('134', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('134', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('134', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('134', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('134', '1954', '67', '4'); -- NIN
INSERT INTO `bcnm_loot` VALUES ('134', '1940', '353', '4'); -- THF
INSERT INTO `bcnm_loot` VALUES ('134', '1936', '87', '4'); -- BLM
INSERT INTO `bcnm_loot` VALUES ('134', '1956', '110', '4'); -- DRG 
INSERT INTO `bcnm_loot` VALUES ('134', '1958', '87', '4'); -- SMN
INSERT INTO `bcnm_loot` VALUES ('134', '1942', '50', '4'); -- PLD
INSERT INTO `bcnm_loot` VALUES ('134', '1950', '60', '4'); -- RNG
INSERT INTO `bcnm_loot` VALUES ('134', '1932', '59', '4'); -- MNK
INSERT INTO `bcnm_loot` VALUES ('134', '2716', '100', '4'); -- SCH
INSERT INTO `bcnm_loot` VALUES ('134', '2714', '110', '4'); -- DNC

-- F6
INSERT INTO `bcnm_loot` VALUES ('135', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('135', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('135', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('135', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('135', '1954', '263', '4'); -- NIN
INSERT INTO `bcnm_loot` VALUES ('135', '1932', '59', '4'); -- MNK
INSERT INTO `bcnm_loot` VALUES ('135', '1942', '53', '4'); -- PLD
INSERT INTO `bcnm_loot` VALUES ('135', '1934', '60', '4'); -- WHM
INSERT INTO `bcnm_loot` VALUES ('135', '1956', '526', '4'); -- DRG
INSERT INTO `bcnm_loot` VALUES ('135', '1930', '60', '5'); -- WAR
INSERT INTO `bcnm_loot` VALUES ('135', '1936', '53', '5'); -- BLM
INSERT INTO `bcnm_loot` VALUES ('135', '1950', '158', '5'); -- RNG
INSERT INTO `bcnm_loot` VALUES ('135', '2716', '105', '5'); -- SCH

-- F7
INSERT INTO `bcnm_loot` VALUES ('136', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('136', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('136', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('136', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('136', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('136', '1875', '1000', '5');
INSERT INTO `bcnm_loot` VALUES ('136', '1956', '240', '6'); -- DRG
INSERT INTO `bcnm_loot` VALUES ('136', '1932', '120', '6'); -- MNK
INSERT INTO `bcnm_loot` VALUES ('136', '1940', '200', '6'); -- THF
INSERT INTO `bcnm_loot` VALUES ('136', '1934', '40', '7'); -- WHM
INSERT INTO `bcnm_loot` VALUES ('136', '1954', '120', '7'); -- NIN
INSERT INTO `bcnm_loot` VALUES ('136', '2658', '200', '7'); -- COR
INSERT INTO `bcnm_loot` VALUES ('136', '2716', '80', '7'); -- SCH 
INSERT INTO `bcnm_loot` VALUES ('136', '1875', '100', '8');
INSERT INTO `bcnm_loot` VALUES ('136', '2127', '55', '8'); -- Metal Chip
INSERT INTO `bcnm_loot` VALUES ('136', '1904', '1000', '9'); -- Ivory Chip

-- Temenos_Western_Tower --------------------------------------------------------------
-- F1
INSERT INTO `bcnm_loot` VALUES ('137', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('137', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('137', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('137', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('137', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('137', '1875', '1000', '5');
INSERT INTO `bcnm_loot` VALUES ('137', '1948', '172', '6'); -- BRD 
INSERT INTO `bcnm_loot` VALUES ('137', '1938', '138', '6'); -- RDM
INSERT INTO `bcnm_loot` VALUES ('137', '1952', '138', '6'); -- SAM
INSERT INTO `bcnm_loot` VALUES ('137', '1958', '207', '6'); -- SMN
INSERT INTO `bcnm_loot` VALUES ('137', '1930', '241', '6'); -- WAR
INSERT INTO `bcnm_loot` VALUES ('137', '2656', '172', '6'); -- BLU


-- F2
INSERT INTO `bcnm_loot` VALUES ('138', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('138', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('138', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('138', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('138', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('138', '1948', '179', '5'); -- BRD
INSERT INTO `bcnm_loot` VALUES ('138', '1938', '571', '5'); -- RDM
INSERT INTO `bcnm_loot` VALUES ('138', '1944', '71', '5'); -- DRK
INSERT INTO `bcnm_loot` VALUES ('138', '1952', '179', '5'); -- SAM
INSERT INTO `bcnm_loot` VALUES ('138', '1946', '120', '6'); -- BST
INSERT INTO `bcnm_loot` VALUES ('138', '1934', '71', '6'); -- WHM
INSERT INTO `bcnm_loot` VALUES ('138', '1930', '143', '6'); -- WAR
INSERT INTO `bcnm_loot` VALUES ('138', '2660', '143', '6'); -- PUP


-- F3
INSERT INTO `bcnm_loot` VALUES ('139', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('139', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('139', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('139', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('139', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('139', '1948', '536', '5'); -- BRD
INSERT INTO `bcnm_loot` VALUES ('139', '1952', '107', '5'); -- SAM
INSERT INTO `bcnm_loot` VALUES ('139', '1938', '60', '5'); -- RDM
INSERT INTO `bcnm_loot` VALUES ('139', '1934', '110', '5'); -- WHM
INSERT INTO `bcnm_loot` VALUES ('139', '1930', '80', '5'); -- WAR
INSERT INTO `bcnm_loot` VALUES ('139', '2660', '90', '5'); -- PUP
INSERT INTO `bcnm_loot` VALUES ('139', '1946', '71', '6'); -- BST
INSERT INTO `bcnm_loot` VALUES ('139', '1944', '103', '6'); -- DRK
INSERT INTO `bcnm_loot` VALUES ('139', '1958', '160', '6'); -- SMN
INSERT INTO `bcnm_loot` VALUES ('139', '1954', '36', '6'); -- NIN
INSERT INTO `bcnm_loot` VALUES ('139', '2656', '250', '6'); -- BLU
INSERT INTO `bcnm_loot` VALUES ('139', '2716', '350', '6'); -- SCH
-- F4
INSERT INTO `bcnm_loot` VALUES ('140', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('140', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('140', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('140', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('140', '1952', '533', '4'); -- SAM
INSERT INTO `bcnm_loot` VALUES ('140', '1946', '90', '4'); -- BST
INSERT INTO `bcnm_loot` VALUES ('140', '1938', '133', '4'); -- RDM
INSERT INTO `bcnm_loot` VALUES ('140', '1932', '90', '4'); -- MNK
INSERT INTO `bcnm_loot` VALUES ('140', '1958', '10', '5'); -- SMN
INSERT INTO `bcnm_loot` VALUES ('140', '1954', '133', '5'); -- NIN
INSERT INTO `bcnm_loot` VALUES ('140', '1944', '133', '5'); -- DRK
INSERT INTO `bcnm_loot` VALUES ('140', '1930', '133', '5'); -- WAR
INSERT INTO `bcnm_loot` VALUES ('140', '2660', '33', '5'); -- PUP


-- F5
INSERT INTO `bcnm_loot` VALUES ('141', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('141', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('141', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('141', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('141', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('141', '1875', '1000', '5');
INSERT INTO `bcnm_loot` VALUES ('141', '1954', '59', '6'); -- NIN
INSERT INTO `bcnm_loot` VALUES ('141', '1930', '294', '6'); -- WAR
INSERT INTO `bcnm_loot` VALUES ('141', '1946', '59', '6'); -- BST
INSERT INTO `bcnm_loot` VALUES ('141', '1934', '78', '6'); --  WHM
INSERT INTO `bcnm_loot` VALUES ('141', '2716', '59', '6'); -- SCH
INSERT INTO `bcnm_loot` VALUES ('141', '1958', '176', '7'); -- SMN
INSERT INTO `bcnm_loot` VALUES ('141', '1938', '59', '7'); -- RDM
INSERT INTO `bcnm_loot` VALUES ('141', '1948', '25', '7'); -- BRD
INSERT INTO `bcnm_loot` VALUES ('141', '1932', '118', '7'); -- MNK
INSERT INTO `bcnm_loot` VALUES ('141', '2656', '294', '7'); -- BLU

-- F6
INSERT INTO `bcnm_loot` VALUES ('142', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('142', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('142', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('142', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('142', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('142', '1875', '1000', '5');
INSERT INTO `bcnm_loot` VALUES ('142', '1954', '200', '6'); -- NIN
INSERT INTO `bcnm_loot` VALUES ('142', '1958', '400', '6'); -- SMN
INSERT INTO `bcnm_loot` VALUES ('142', '1948', '100', '6'); -- BRD
INSERT INTO `bcnm_loot` VALUES ('142', '1934', '150', '6'); -- WHM
INSERT INTO `bcnm_loot` VALUES ('142', '1932', '50', '7'); -- MNK
INSERT INTO `bcnm_loot` VALUES ('142', '1930', '60', '7'); -- WAR
INSERT INTO `bcnm_loot` VALUES ('142', '1938', '200', '7'); -- RDM
INSERT INTO `bcnm_loot` VALUES ('142', '1944', '60', '7'); -- DRK
INSERT INTO `bcnm_loot` VALUES ('142', '1952', '200', '7'); -- SAM

-- F7
INSERT INTO `bcnm_loot` VALUES ('143', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('143', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('143', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('143', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('143', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('143', '1875', '1000', '5');
INSERT INTO `bcnm_loot` VALUES ('143', '1948', '36', '6'); -- BRD
INSERT INTO `bcnm_loot` VALUES ('143', '1952', '143', '6'); -- SAM
INSERT INTO `bcnm_loot` VALUES ('143', '1930', '143', '6'); -- WAR
INSERT INTO `bcnm_loot` VALUES ('143', '1958', '214', '6'); -- SMN
INSERT INTO `bcnm_loot` VALUES ('143', '1938', '71', '6'); -- RDM
INSERT INTO `bcnm_loot` VALUES ('143', '2656', '321', '6'); -- BLU
INSERT INTO `bcnm_loot` VALUES ('143', '1875', '100', '7');
INSERT INTO `bcnm_loot` VALUES ('143', '2127', '55', '7'); -- Metal Chip
INSERT INTO `bcnm_loot` VALUES ('143', '1906', '1000', '8'); -- Emerald Chip
-- Temenos_Eastern_Tower --------------------------------------------------------------

-- F1
INSERT INTO `bcnm_loot` VALUES ('144', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('144', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('144', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('144', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('144', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('144', '1875', '1000', '5');
INSERT INTO `bcnm_loot` VALUES ('144', '1944', '65', '6'); -- DRK
INSERT INTO `bcnm_loot` VALUES ('144', '1936', '97', '6'); -- BLM
INSERT INTO `bcnm_loot` VALUES ('144', '1946', '40', '6'); -- BST
INSERT INTO `bcnm_loot` VALUES ('144', '1942', '95', '6'); -- PLD
INSERT INTO `bcnm_loot` VALUES ('144', '2660', '194', '6'); -- PUP
INSERT INTO `bcnm_loot` VALUES ('144', '2714', '32', '6'); -- DNC
INSERT INTO `bcnm_loot` VALUES ('144', '1950', '161', '6'); -- RNG
INSERT INTO `bcnm_loot` VALUES ('144', '2716', '190', '6'); -- SCH
INSERT INTO `bcnm_loot` VALUES ('144', '2656', '210', '6'); -- BLU
-- F2
INSERT INTO `bcnm_loot` VALUES ('145', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('145', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('145', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('145', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('145', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('145', '1875', '1000', '5');
INSERT INTO `bcnm_loot` VALUES ('145', '1936', '367', '6'); -- BLM
INSERT INTO `bcnm_loot` VALUES ('145', '1952', '70', '6'); -- SAM
INSERT INTO `bcnm_loot` VALUES ('145', '1950', '40', '6'); -- RNG
INSERT INTO `bcnm_loot` VALUES ('145', '1942', '333', '6'); -- PLD
INSERT INTO `bcnm_loot` VALUES ('145', '1958', '20', '6'); -- SMN 
INSERT INTO `bcnm_loot` VALUES ('145', '1956', '106', '7'); -- DRG
INSERT INTO `bcnm_loot` VALUES ('145', '1938', '33', '7'); -- RDM
INSERT INTO `bcnm_loot` VALUES ('145', '1944', '76', '7'); -- DRK
INSERT INTO `bcnm_loot` VALUES ('145', '1948', '95', '7'); -- BRD
INSERT INTO `bcnm_loot` VALUES ('145', '2658', '67', '7'); -- COR
INSERT INTO `bcnm_loot` VALUES ('145', '1946', '133', '7'); -- BST

-- F3
INSERT INTO `bcnm_loot` VALUES ('146', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('146', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('146', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('146', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('146', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('146', '1875', '1000', '5');
INSERT INTO `bcnm_loot` VALUES ('146', '1875', '1000', '6');
INSERT INTO `bcnm_loot` VALUES ('146', '1942', '625', '7'); -- PLD
INSERT INTO `bcnm_loot` VALUES ('146', '1944', '102', '7'); -- DRK
INSERT INTO `bcnm_loot` VALUES ('146', '1950', '42', '7'); -- RNG
INSERT INTO `bcnm_loot` VALUES ('146', '1952', '83', '7'); -- SAM
INSERT INTO `bcnm_loot` VALUES ('146', '1946', '50', '7'); -- BST
INSERT INTO `bcnm_loot` VALUES ('146', '1940', '83', '8'); -- THF
INSERT INTO `bcnm_loot` VALUES ('146', '1936', '70', '8'); -- BLM
INSERT INTO `bcnm_loot` VALUES ('146', '1938', '42', '8'); -- RDM
INSERT INTO `bcnm_loot` VALUES ('146', '1948', '42', '8'); -- BRD
INSERT INTO `bcnm_loot` VALUES ('146', '2660', '292', '8'); -- PUP

-- F4
INSERT INTO `bcnm_loot` VALUES ('147', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('147', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('147', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('147', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('147', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('147', '1875', '1000', '5');
INSERT INTO `bcnm_loot` VALUES ('147', '1950', '417', '6'); -- RNG
INSERT INTO `bcnm_loot` VALUES ('147', '1956', '75', '6'); -- DRG
INSERT INTO `bcnm_loot` VALUES ('147', '1944', '208', '6'); -- DRK
INSERT INTO `bcnm_loot` VALUES ('147', '1940', '167', '6'); -- THF
INSERT INTO `bcnm_loot` VALUES ('147', '1946', '62', '7'); -- BST
INSERT INTO `bcnm_loot` VALUES ('147', '1936', '69', '7'); -- BLM
INSERT INTO `bcnm_loot` VALUES ('147', '2660', '208', '7'); -- PUP
INSERT INTO `bcnm_loot` VALUES ('147', '1952', '42', '7'); -- SAM
INSERT INTO `bcnm_loot` VALUES ('147', '2658', '83', '7'); -- COR

-- F5
INSERT INTO `bcnm_loot` VALUES ('148', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('148', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('148', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('148', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('148', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('148', '1875', '1000', '5');
INSERT INTO `bcnm_loot` VALUES ('148', '1875', '1000', '6');
INSERT INTO `bcnm_loot` VALUES ('148', '1944', '208', '7'); -- DRK
INSERT INTO `bcnm_loot` VALUES ('148', '1938', '42', '7'); -- RDM
INSERT INTO `bcnm_loot` VALUES ('148', '1946', '36', '7'); -- BST
INSERT INTO `bcnm_loot` VALUES ('148', '1940', '83', '7'); -- THF
INSERT INTO `bcnm_loot` VALUES ('148', '1942', '20', '7'); -- PLD
INSERT INTO `bcnm_loot` VALUES ('148', '1952', '94', '8'); -- SAM
INSERT INTO `bcnm_loot` VALUES ('148', '1956', '42', '8'); -- DRG
INSERT INTO `bcnm_loot` VALUES ('148', '1936', '49', '8'); -- BLM
INSERT INTO `bcnm_loot` VALUES ('148', '1950', '167', '8'); -- RNG
INSERT INTO `bcnm_loot` VALUES ('148', '2714', '458', '8'); -- DNC

-- F6
INSERT INTO `bcnm_loot` VALUES ('149', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('149', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('149', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('149', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('149', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('149', '1875', '1000', '5');
INSERT INTO `bcnm_loot` VALUES ('149', '1942', '68', '6'); -- PLD
INSERT INTO `bcnm_loot` VALUES ('149', '1948', '74', '6'); -- BRD
INSERT INTO `bcnm_loot` VALUES ('149', '1936', '259', '6'); -- BLM
INSERT INTO `bcnm_loot` VALUES ('149', '1940', '74', '6'); -- THF
INSERT INTO `bcnm_loot` VALUES ('149', '1956', '74', '6'); -- DRG
INSERT INTO `bcnm_loot` VALUES ('149', '1950', '62', '6'); -- RNG
INSERT INTO `bcnm_loot` VALUES ('149', '2656', '150', '7'); -- BLU
INSERT INTO `bcnm_loot` VALUES ('149', '1938', '76', '7'); -- RDM
INSERT INTO `bcnm_loot` VALUES ('149', '1952', '53', '7'); -- SAM
INSERT INTO `bcnm_loot` VALUES ('149', '2658', '111', '7'); -- COR
INSERT INTO `bcnm_loot` VALUES ('149', '2714', '370', '7'); -- DNC
INSERT INTO `bcnm_loot` VALUES ('149', '1946', '333', '7'); -- BST

-- F7
INSERT INTO `bcnm_loot` VALUES ('150', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('150', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('150', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('150', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('150', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('150', '1875', '1000', '5');
INSERT INTO `bcnm_loot` VALUES ('150', '1875', '1000', '6');
INSERT INTO `bcnm_loot` VALUES ('150', '1942', '38', '7'); -- PLD
INSERT INTO `bcnm_loot` VALUES ('150', '1950', '67', '7'); -- RNG
INSERT INTO `bcnm_loot` VALUES ('150', '1944', '100', '7'); -- DRK
INSERT INTO `bcnm_loot` VALUES ('150', '1936', '233', '7'); -- BLM
INSERT INTO `bcnm_loot` VALUES ('150', '1946', '80', '7'); -- BST
INSERT INTO `bcnm_loot` VALUES ('150', '2660', '333', '7'); -- PUP
INSERT INTO `bcnm_loot` VALUES ('150', '2714', '67', '7'); -- DNC 
INSERT INTO `bcnm_loot` VALUES ('150', '1875', '100', '8');
INSERT INTO `bcnm_loot` VALUES ('150', '2127', '55', '8'); -- Metal Chip
INSERT INTO `bcnm_loot` VALUES ('150', '1905', '1000', '9'); -- Scarlet Chip,

-- Central_Temenos_1st_Floor --------------------------------------------------------------
INSERT INTO `bcnm_loot` VALUES ('151', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('151', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('151', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('151', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('151', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('151', '1875', '1000', '5');
INSERT INTO `bcnm_loot` VALUES ('151', '1875', '1000', '6');
INSERT INTO `bcnm_loot` VALUES ('151', '1930', '265', '7'); -- WAR
INSERT INTO `bcnm_loot` VALUES ('151', '1938', '118', '7'); -- RDM
INSERT INTO `bcnm_loot` VALUES ('151', '1948', '147', '7'); -- BRD
INSERT INTO `bcnm_loot` VALUES ('151', '1958', '147', '7'); -- SMN
INSERT INTO `bcnm_loot` VALUES ('151', '1952', '118', '7'); -- SAM
INSERT INTO `bcnm_loot` VALUES ('151', '2656', '235', '7'); -- BLU
INSERT INTO `bcnm_loot` VALUES ('151', '1986', '1000', '8'); -- Orchid Chip

-- Central_Temenos_2nd_Floor --------------------------------------------------------------
INSERT INTO `bcnm_loot` VALUES ('152', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('152', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('152', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('152', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('152', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('152', '1875', '1000', '5');
INSERT INTO `bcnm_loot` VALUES ('152', '1875', '1000', '6');
INSERT INTO `bcnm_loot` VALUES ('152', '1944', '250', '7'); -- DRK
INSERT INTO `bcnm_loot` VALUES ('152', '1936', '94', '7'); -- BLM
INSERT INTO `bcnm_loot` VALUES ('152', '1950', '63', '7'); -- RNG
INSERT INTO `bcnm_loot` VALUES ('152', '1942', '125', '7'); -- PLD
INSERT INTO `bcnm_loot` VALUES ('152', '1946', '63', '7'); -- BST
INSERT INTO `bcnm_loot` VALUES ('152', '2660', '281', '7'); -- PUP
INSERT INTO `bcnm_loot` VALUES ('152', '2714', '125', '7'); -- DNC
INSERT INTO `bcnm_loot` VALUES ('152', '1908', '1000', '8'); -- Cerulean Chip

-- Central_Temenos_3rd_Floor --------------------------------------------------------------
INSERT INTO `bcnm_loot` VALUES ('153', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('153', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('153', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('153', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('153', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('153', '1875', '1000', '5');
INSERT INTO `bcnm_loot` VALUES ('153', '1875', '1000', '6');
INSERT INTO `bcnm_loot` VALUES ('153', '1934', '53', '7'); -- WHM
INSERT INTO `bcnm_loot` VALUES ('153', '1940', '132', '7'); -- THF
INSERT INTO `bcnm_loot` VALUES ('153', '1954', '105', '7'); -- NIN
INSERT INTO `bcnm_loot` VALUES ('153', '1932', '211', '7'); -- MNK 
INSERT INTO `bcnm_loot` VALUES ('153', '1956', '211', '7'); -- DRG
INSERT INTO `bcnm_loot` VALUES ('153', '1930', '100', '7'); -- WAR
INSERT INTO `bcnm_loot` VALUES ('153', '2658', '211', '7'); -- COR
INSERT INTO `bcnm_loot` VALUES ('153', '2716', '105', '7'); -- SCH
INSERT INTO `bcnm_loot` VALUES ('153', '1907', '1000', '8'); -- Silver Chip
-- Central_Temenos_4th_Floor --------------------------------------------------------------
INSERT INTO `bcnm_loot` VALUES ('154', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('154', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('154', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('154', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('154', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('154', '1875', '1000', '5');
INSERT INTO `bcnm_loot` VALUES ('154', '1875', '1000', '6');
INSERT INTO `bcnm_loot` VALUES ('154', '1920', '659', '7'); -- Ultima's Cerebrum 
INSERT INTO `bcnm_loot` VALUES ('154', '1924', '394', '7'); -- Ultima's Tail
INSERT INTO `bcnm_loot` VALUES ('154', '1923', '388', '7'); -- ultimas-leg
INSERT INTO `bcnm_loot` VALUES ('154', '1922', '404', '7'); -- Ultima's Claw
INSERT INTO `bcnm_loot` VALUES ('154', '1924', '394', '8'); -- Ultima's Tail
INSERT INTO `bcnm_loot` VALUES ('154', '1922', '402', '8'); -- Ultima's Claw
INSERT INTO `bcnm_loot` VALUES ('154', '1920', '659', '8'); -- Ultima's Cerebrum 
INSERT INTO `bcnm_loot` VALUES ('154', '1923', '383', '8'); -- ultimas-leg
INSERT INTO `bcnm_loot` VALUES ('154', '1921', '265', '9'); -- Ultima's Heart
INSERT INTO `bcnm_loot` VALUES ('154', '1875', '100', '9');

INSERT INTO `bcnm_loot` VALUES ('155', '1875', '1000', '0');
INSERT INTO `bcnm_loot` VALUES ('155', '1875', '1000', '1');
INSERT INTO `bcnm_loot` VALUES ('155', '1875', '1000', '2');
INSERT INTO `bcnm_loot` VALUES ('155', '1875', '1000', '3');
INSERT INTO `bcnm_loot` VALUES ('155', '1875', '1000', '4');
INSERT INTO `bcnm_loot` VALUES ('155', '1875', '1000', '5');
INSERT INTO `bcnm_loot` VALUES ('155', '1934', '200', '6'); -- WHM
INSERT INTO `bcnm_loot` VALUES ('155', '1930', '200', '6'); -- WAR
INSERT INTO `bcnm_loot` VALUES ('155', '1958', '200', '6'); -- SMN
INSERT INTO `bcnm_loot` VALUES ('155', '2658', '400', '6'); -- COR
INSERT INTO `bcnm_loot` VALUES ('155', '1940', '200', '6'); -- THF

-- ENM Like the Wind
INSERT INTO `bcnm_loot` VALUES ('179','1763','30','1'); 
INSERT INTO `bcnm_loot` VALUES ('179','1769','30','1'); 
INSERT INTO `bcnm_loot` VALUES ('179','1764','30','1');
INSERT INTO `bcnm_loot` VALUES ('179','1842','100','0');
INSERT INTO `bcnm_loot` VALUES ('179','17946','100','2');
INSERT INTO `bcnm_loot` VALUES ('179','18358','100','2');
INSERT INTO `bcnm_loot` VALUES ('179','16976','100','2');
INSERT INTO `bcnm_loot` VALUES ('179','4990','230','2');
INSERT INTO `bcnm_loot` VALUES ('179','17946','100','3');
INSERT INTO `bcnm_loot` VALUES ('179','18358','100','3');
INSERT INTO `bcnm_loot` VALUES ('179','16976','100','3');
INSERT INTO `bcnm_loot` VALUES ('179','4990','230','3');
