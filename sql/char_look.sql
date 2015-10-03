/*
MySQL Data Transfer
Source Host: localhost
Source Database: dspdb
Target Host: localhost
Target Database: dspdb
Date: 10/3/2015 5:04:22 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for char_look
-- ----------------------------
CREATE TABLE `char_look` (
  `charid` int(10) unsigned NOT NULL,
  `face` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `race` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `size` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `head` smallint(4) unsigned NOT NULL DEFAULT '0',
  `body` smallint(4) unsigned NOT NULL DEFAULT '8',
  `hands` smallint(4) unsigned NOT NULL DEFAULT '8',
  `legs` smallint(4) unsigned NOT NULL DEFAULT '8',
  `feet` smallint(4) unsigned NOT NULL DEFAULT '8',
  `main` smallint(4) unsigned NOT NULL DEFAULT '0',
  `sub` smallint(4) unsigned NOT NULL DEFAULT '0',
  `ranged` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=24;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `char_look` VALUES ('21828', '2', '1', '2', '300', '40', '241', '241', '241', '717', '605', '0');
INSERT INTO `char_look` VALUES ('21829', '5', '2', '2', '104', '301', '142', '329', '142', '601', '0', '0');
INSERT INTO `char_look` VALUES ('21830', '0', '3', '2', '16', '16', '16', '16', '1', '251', '44', '0');
INSERT INTO `char_look` VALUES ('21831', '13', '5', '2', '0', '8', '8', '8', '8', '459', '0', '0');
INSERT INTO `char_look` VALUES ('21832', '0', '6', '1', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21833', '1', '1', '1', '300', '40', '89', '89', '89', '605', '110', '41');
INSERT INTO `char_look` VALUES ('21834', '1', '3', '2', '0', '87', '141', '87', '87', '612', '0', '0');
INSERT INTO `char_look` VALUES ('21835', '11', '8', '2', '0', '8', '8', '8', '8', '265', '0', '0');
INSERT INTO `char_look` VALUES ('21836', '4', '1', '2', '0', '0', '0', '0', '0', '265', '0', '0');
INSERT INTO `char_look` VALUES ('21837', '5', '2', '1', '0', '8', '8', '8', '8', '220', '0', '0');
INSERT INTO `char_look` VALUES ('21838', '11', '5', '0', '0', '0', '0', '0', '0', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21839', '10', '7', '0', '0', '8', '8', '8', '8', '159', '0', '0');
INSERT INTO `char_look` VALUES ('21840', '10', '5', '0', '294', '294', '294', '294', '294', '578', '0', '0');
INSERT INTO `char_look` VALUES ('21841', '0', '2', '0', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21842', '10', '5', '1', '182', '384', '182', '11', '182', '545', '59', '0');
INSERT INTO `char_look` VALUES ('21843', '0', '1', '0', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21844', '10', '5', '0', '183', '183', '183', '183', '183', '459', '544', '25');
INSERT INTO `char_look` VALUES ('21845', '13', '5', '2', '294', '237', '89', '237', '294', '589', '367', '0');
INSERT INTO `char_look` VALUES ('21846', '13', '5', '2', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21847', '13', '5', '2', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21848', '1', '1', '1', '182', '182', '182', '182', '182', '545', '59', '0');
INSERT INTO `char_look` VALUES ('21849', '0', '3', '2', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21850', '1', '3', '2', '0', '8', '8', '8', '8', '0', '0', '0');
INSERT INTO `char_look` VALUES ('21851', '2', '1', '1', '182', '182', '182', '182', '182', '545', '59', '0');
INSERT INTO `char_look` VALUES ('21852', '3', '5', '0', '294', '294', '294', '320', '294', '367', '110', '0');
INSERT INTO `char_look` VALUES ('21853', '11', '8', '2', '0', '16', '15', '105', '6', '145', '0', '0');
INSERT INTO `char_look` VALUES ('21854', '4', '1', '2', '0', '0', '0', '0', '0', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21855', '5', '2', '1', '0', '160', '160', '109', '162', '185', '110', '0');
INSERT INTO `char_look` VALUES ('21856', '13', '8', '2', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21857', '10', '2', '0', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21858', '2', '1', '2', '0', '184', '184', '184', '184', '551', '313', '0');
INSERT INTO `char_look` VALUES ('21859', '0', '2', '2', '73', '301', '120', '329', '186', '601', '0', '0');
INSERT INTO `char_look` VALUES ('21860', '0', '1', '0', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21861', '3', '2', '1', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21862', '5', '1', '1', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21863', '9', '6', '1', '185', '185', '185', '69', '69', '532', '110', '0');
INSERT INTO `char_look` VALUES ('21864', '3', '3', '2', '195', '195', '195', '195', '195', '196', '0', '52');
INSERT INTO `char_look` VALUES ('21865', '2', '6', '0', '112', '230', '157', '230', '157', '0', '0', '0');
INSERT INTO `char_look` VALUES ('21866', '10', '4', '1', '29', '29', '29', '29', '29', '320', '47', '0');
INSERT INTO `char_look` VALUES ('21867', '1', '3', '1', '0', '8', '8', '8', '8', '265', '0', '0');
INSERT INTO `char_look` VALUES ('21868', '11', '5', '0', '57', '26', '10', '1', '130', '271', '271', '0');
INSERT INTO `char_look` VALUES ('21869', '13', '1', '0', '139', '36', '139', '139', '139', '552', '0', '82');
INSERT INTO `char_look` VALUES ('21870', '15', '8', '2', '0', '8', '8', '8', '8', '208', '0', '0');
INSERT INTO `char_look` VALUES ('21871', '15', '5', '2', '149', '149', '131', '3', '105', '231', '226', '0');
INSERT INTO `char_look` VALUES ('21872', '3', '2', '0', '0', '8', '8', '8', '8', '268', '0', '0');
INSERT INTO `char_look` VALUES ('21873', '3', '3', '1', '15', '15', '15', '15', '6', '131', '4227', '0');
INSERT INTO `char_look` VALUES ('21874', '13', '6', '2', '0', '8', '8', '8', '8', '0', '0', '0');
INSERT INTO `char_look` VALUES ('21875', '9', '7', '1', '149', '149', '104', '149', '149', '188', '43', '0');
INSERT INTO `char_look` VALUES ('21876', '3', '1', '1', '57', '204', '186', '240', '186', '326', '0', '0');
INSERT INTO `char_look` VALUES ('21877', '15', '2', '0', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21878', '2', '2', '0', '160', '197', '197', '197', '197', '601', '0', '0');
INSERT INTO `char_look` VALUES ('21879', '14', '2', '0', '300', '300', '241', '208', '241', '313', '313', '0');
INSERT INTO `char_look` VALUES ('21880', '7', '7', '1', '120', '196', '75', '206', '106', '544', '259', '52');
INSERT INTO `char_look` VALUES ('21881', '11', '5', '0', '71', '186', '197', '186', '197', '554', '0', '0');
INSERT INTO `char_look` VALUES ('21882', '6', '2', '0', '0', '8', '8', '8', '8', '126', '4222', '0');
INSERT INTO `char_look` VALUES ('21883', '15', '3', '2', '0', '8', '8', '8', '8', '265', '0', '36');
INSERT INTO `char_look` VALUES ('21884', '12', '7', '0', '0', '47', '165', '165', '165', '382', '36', '27');
INSERT INTO `char_look` VALUES ('21885', '10', '2', '0', '182', '159', '182', '182', '182', '550', '0', '0');
INSERT INTO `char_look` VALUES ('21886', '2', '1', '0', '0', '8', '8', '8', '8', '265', '0', '0');
INSERT INTO `char_look` VALUES ('21887', '4', '3', '1', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21888', '3', '8', '2', '0', '8', '8', '8', '8', '265', '0', '0');
INSERT INTO `char_look` VALUES ('21889', '14', '8', '2', '56', '34', '172', '165', '165', '256', '256', '0');
INSERT INTO `char_look` VALUES ('21890', '15', '6', '0', '0', '8', '8', '8', '8', '0', '0', '0');
INSERT INTO `char_look` VALUES ('21891', '9', '5', '2', '160', '186', '197', '160', '197', '601', '0', '0');
INSERT INTO `char_look` VALUES ('21892', '8', '3', '2', '0', '8', '8', '8', '8', '94', '0', '0');
INSERT INTO `char_look` VALUES ('21893', '12', '8', '2', '196', '304', '196', '196', '196', '428', '185', '0');
INSERT INTO `char_look` VALUES ('21894', '0', '1', '0', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21895', '0', '1', '0', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21896', '10', '7', '2', '196', '172', '196', '196', '168', '185', '0', '95');
INSERT INTO `char_look` VALUES ('21897', '15', '5', '2', '149', '149', '104', '3', '105', '226', '0', '0');
INSERT INTO `char_look` VALUES ('21898', '3', '5', '2', '149', '149', '131', '3', '21', '226', '0', '0');
INSERT INTO `char_look` VALUES ('21899', '14', '1', '1', '72', '72', '286', '286', '73', '601', '0', '26');
INSERT INTO `char_look` VALUES ('21900', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_look` VALUES ('21901', '5', '1', '0', '184', '184', '184', '184', '184', '552', '0', '86');
INSERT INTO `char_look` VALUES ('21902', '13', '7', '0', '0', '37', '9', '15', '4', '147', '0', '0');
INSERT INTO `char_look` VALUES ('21903', '14', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_look` VALUES ('21904', '1', '1', '2', '73', '73', '73', '73', '73', '532', '46', '0');
INSERT INTO `char_look` VALUES ('21905', '14', '3', '0', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21906', '1', '2', '1', '0', '8', '8', '8', '8', '0', '0', '0');
INSERT INTO `char_look` VALUES ('21907', '1', '2', '1', '0', '47', '214', '214', '214', '0', '0', '0');
INSERT INTO `char_look` VALUES ('21908', '14', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_look` VALUES ('21909', '3', '7', '0', '0', '159', '159', '196', '196', '544', '422', '0');
INSERT INTO `char_look` VALUES ('21910', '3', '2', '0', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21911', '10', '5', '1', '0', '8', '8', '8', '8', '159', '0', '0');
INSERT INTO `char_look` VALUES ('21912', '11', '5', '0', '0', '8', '8', '8', '8', '291', '0', '0');
INSERT INTO `char_look` VALUES ('21913', '10', '3', '2', '300', '196', '196', '196', '196', '497', '4593', '0');
INSERT INTO `char_look` VALUES ('21914', '5', '2', '0', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21915', '6', '1', '1', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21916', '9', '3', '1', '0', '8', '8', '8', '8', '0', '0', '0');
INSERT INTO `char_look` VALUES ('21917', '0', '3', '0', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21918', '0', '3', '0', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21919', '0', '2', '0', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21920', '0', '1', '0', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21921', '0', '1', '0', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21922', '0', '1', '0', '0', '8', '8', '8', '8', '0', '0', '0');
INSERT INTO `char_look` VALUES ('21923', '0', '1', '0', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21924', '0', '1', '0', '0', '8', '8', '8', '8', '0', '0', '0');
INSERT INTO `char_look` VALUES ('21925', '0', '1', '0', '0', '8', '8', '8', '8', '0', '0', '0');
INSERT INTO `char_look` VALUES ('21926', '0', '1', '0', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21927', '0', '1', '0', '0', '8', '8', '8', '8', '0', '0', '0');
INSERT INTO `char_look` VALUES ('21928', '3', '7', '1', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21929', '0', '8', '0', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21930', '0', '5', '0', '0', '8', '8', '8', '8', '0', '0', '0');
INSERT INTO `char_look` VALUES ('21931', '2', '6', '1', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21932', '0', '4', '0', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21933', '6', '5', '0', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21934', '6', '6', '0', '0', '8', '8', '8', '8', '0', '0', '0');
INSERT INTO `char_look` VALUES ('21935', '15', '6', '2', '0', '8', '8', '8', '8', '164', '0', '0');
INSERT INTO `char_look` VALUES ('21936', '3', '3', '1', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21937', '10', '7', '1', '0', '267', '267', '267', '267', '460', '460', '0');
INSERT INTO `char_look` VALUES ('21938', '13', '8', '2', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21939', '7', '8', '2', '0', '149', '149', '149', '149', '302', '0', '0');
INSERT INTO `char_look` VALUES ('21940', '10', '5', '0', '0', '8', '8', '8', '8', '265', '0', '0');
INSERT INTO `char_look` VALUES ('21941', '7', '1', '1', '23', '26', '23', '26', '23', '253', '38', '0');
INSERT INTO `char_look` VALUES ('21942', '0', '6', '0', '15', '15', '15', '15', '15', '268', '37', '0');
INSERT INTO `char_look` VALUES ('21943', '3', '8', '2', '0', '8', '8', '8', '8', '310', '310', '0');
INSERT INTO `char_look` VALUES ('21944', '10', '7', '2', '129', '129', '129', '129', '129', '160', '160', '27');
INSERT INTO `char_look` VALUES ('21945', '2', '5', '2', '0', '0', '0', '0', '0', '601', '0', '0');
INSERT INTO `char_look` VALUES ('21946', '2', '5', '0', '0', '8', '8', '8', '8', '159', '0', '0');
INSERT INTO `char_look` VALUES ('21947', '10', '8', '2', '0', '8', '8', '8', '8', '0', '0', '0');
INSERT INTO `char_look` VALUES ('21948', '10', '8', '2', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21949', '10', '8', '2', '0', '8', '8', '8', '8', '0', '0', '0');
INSERT INTO `char_look` VALUES ('21950', '10', '8', '2', '0', '8', '8', '8', '8', '265', '0', '0');
INSERT INTO `char_look` VALUES ('21951', '3', '5', '1', '0', '8', '8', '8', '8', '291', '0', '0');
INSERT INTO `char_look` VALUES ('21952', '12', '3', '2', '0', '34', '74', '16', '6', '171', '178', '0');
INSERT INTO `char_look` VALUES ('21953', '1', '3', '2', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21954', '4', '8', '1', '56', '40', '26', '13', '150', '92', '0', '0');
INSERT INTO `char_look` VALUES ('21955', '4', '1', '2', '165', '165', '165', '165', '165', '256', '256', '0');
INSERT INTO `char_look` VALUES ('21956', '2', '2', '2', '72', '72', '72', '72', '72', '601', '0', '0');
INSERT INTO `char_look` VALUES ('21957', '3', '2', '1', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21958', '4', '2', '0', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21959', '15', '7', '1', '0', '8', '8', '8', '8', '159', '0', '0');
INSERT INTO `char_look` VALUES ('21960', '7', '1', '2', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21961', '5', '8', '2', '0', '8', '8', '8', '8', '0', '0', '0');
INSERT INTO `char_look` VALUES ('21962', '14', '7', '0', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21963', '5', '1', '2', '0', '0', '0', '0', '0', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21964', '8', '7', '1', '0', '8', '8', '8', '8', '291', '0', '0');
INSERT INTO `char_look` VALUES ('21965', '5', '8', '2', '0', '8', '8', '8', '8', '265', '0', '0');
INSERT INTO `char_look` VALUES ('21966', '3', '3', '1', '1', '1', '1', '1', '1', '268', '0', '0');
INSERT INTO `char_look` VALUES ('21967', '9', '8', '2', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21968', '10', '5', '0', '0', '8', '8', '8', '8', '164', '0', '0');
INSERT INTO `char_look` VALUES ('21969', '9', '6', '0', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21970', '4', '2', '0', '0', '8', '8', '8', '8', '314', '314', '29');
INSERT INTO `char_look` VALUES ('21971', '0', '4', '0', '0', '8', '8', '8', '8', '0', '0', '0');
INSERT INTO `char_look` VALUES ('21972', '14', '7', '0', '0', '0', '0', '0', '0', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21973', '14', '7', '0', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21974', '6', '5', '0', '0', '8', '8', '8', '8', '0', '0', '0');
INSERT INTO `char_look` VALUES ('21975', '6', '7', '0', '0', '8', '8', '8', '8', '94', '0', '0');
INSERT INTO `char_look` VALUES ('21976', '2', '1', '1', '78', '78', '78', '78', '78', '211', '0', '0');
INSERT INTO `char_look` VALUES ('21977', '10', '7', '0', '92', '92', '322', '92', '92', '567', '0', '26');
INSERT INTO `char_look` VALUES ('21978', '6', '3', '2', '117', '302', '120', '208', '208', '96', '0', '62');
INSERT INTO `char_look` VALUES ('21979', '5', '6', '1', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21980', '3', '3', '2', '0', '8', '8', '8', '8', '95', '0', '0');
INSERT INTO `char_look` VALUES ('21981', '3', '2', '0', '0', '129', '31', '15', '6', '160', '160', '0');
INSERT INTO `char_look` VALUES ('21982', '9', '7', '0', '0', '8', '8', '8', '8', '159', '0', '0');
INSERT INTO `char_look` VALUES ('21983', '5', '7', '1', '0', '8', '8', '8', '8', '159', '0', '0');
INSERT INTO `char_look` VALUES ('21984', '2', '1', '1', '0', '3', '149', '20', '3', '290', '0', '0');
INSERT INTO `char_look` VALUES ('21985', '2', '8', '2', '0', '8', '8', '8', '6', '127', '4223', '0');
INSERT INTO `char_look` VALUES ('21986', '12', '4', '0', '0', '1', '8', '8', '6', '310', '310', '0');
INSERT INTO `char_look` VALUES ('21987', '2', '5', '0', '0', '8', '8', '8', '8', '0', '0', '0');
INSERT INTO `char_look` VALUES ('21988', '6', '3', '1', '0', '8', '8', '8', '8', '21', '0', '0');
INSERT INTO `char_look` VALUES ('21989', '12', '1', '2', '86', '86', '86', '86', '86', '146', '0', '41');
INSERT INTO `char_look` VALUES ('21990', '4', '4', '0', '0', '5', '15', '15', '6', '88', '41', '0');
INSERT INTO `char_look` VALUES ('21991', '3', '8', '2', '0', '34', '26', '15', '6', '93', '0', '0');
INSERT INTO `char_look` VALUES ('21992', '4', '3', '1', '0', '8', '8', '8', '8', '159', '0', '0');
INSERT INTO `char_look` VALUES ('21993', '15', '5', '0', '0', '8', '8', '8', '8', '164', '0', '0');
