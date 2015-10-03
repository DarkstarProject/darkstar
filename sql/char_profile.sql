/*
MySQL Data Transfer
Source Host: localhost
Source Database: dspdb
Target Host: localhost
Target Database: dspdb
Date: 10/3/2015 5:04:47 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for char_profile
-- ----------------------------
CREATE TABLE `char_profile` (
  `charid` int(10) unsigned NOT NULL,
  `rank_points` int(10) unsigned NOT NULL DEFAULT '0',
  `rank_sandoria` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `rank_bastok` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `rank_windurst` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `fame_sandoria` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_bastok` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_windurst` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_norg` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fame_jeuno` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `char_profile` VALUES ('21861', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21858', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21830', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21845', '0', '10', '10', '10', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21846', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21847', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21832', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21862', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21850', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21851', '4000', '10', '1', '1', '0', '0', '0', '30', '120');
INSERT INTO `char_profile` VALUES ('21852', '0', '10', '10', '10', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21835', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21856', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21854', '0', '1', '6', '1', '3600', '3600', '0', '0', '4530');
INSERT INTO `char_profile` VALUES ('21855', '0', '1', '6', '1', '3600', '3600', '0', '0', '4530');
INSERT INTO `char_profile` VALUES ('21839', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21859', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21860', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21844', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21842', '4000', '1', '10', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21848', '4000', '10', '1', '1', '0', '0', '0', '0', '120');
INSERT INTO `char_profile` VALUES ('21843', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21853', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21849', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21857', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21863', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21864', '0', '2', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21865', '0', '10', '10', '10', '0', '120', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21866', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21867', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21868', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21869', '4000', '1', '6', '1', '0', '0', '0', '0', '930');
INSERT INTO `char_profile` VALUES ('21870', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21871', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21872', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21873', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21874', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21875', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21876', '4000', '1', '10', '1', '0', '0', '0', '3380', '120');
INSERT INTO `char_profile` VALUES ('21877', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21878', '0', '1', '6', '1', '0', '0', '0', '0', '930');
INSERT INTO `char_profile` VALUES ('21879', '4000', '6', '1', '1', '0', '0', '0', '0', '930');
INSERT INTO `char_profile` VALUES ('21880', '0', '1', '6', '1', '0', '0', '0', '0', '30');
INSERT INTO `char_profile` VALUES ('21881', '150', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21882', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21883', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21884', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21885', '3963', '2', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21886', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21887', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21888', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21889', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21890', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21891', '0', '1', '6', '1', '0', '0', '0', '0', '30');
INSERT INTO `char_profile` VALUES ('21892', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21893', '0', '1', '1', '1', '0', '0', '0', '0', '30');
INSERT INTO `char_profile` VALUES ('21894', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21895', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21896', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21897', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21898', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21899', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21900', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21901', '0', '1', '6', '1', '0', '0', '0', '0', '930');
INSERT INTO `char_profile` VALUES ('21902', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21903', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21904', '0', '1', '6', '1', '0', '0', '0', '0', '930');
INSERT INTO `char_profile` VALUES ('21905', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21906', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21907', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21908', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21909', '0', '1', '6', '1', '0', '0', '0', '0', '930');
INSERT INTO `char_profile` VALUES ('21910', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21911', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21912', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21913', '0', '6', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21914', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21915', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21916', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21917', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21918', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21919', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21920', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21921', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21922', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21923', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21924', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21925', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21926', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21927', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21928', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21929', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21930', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21931', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21932', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21933', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21934', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21935', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21936', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21937', '0', '1', '6', '1', '0', '0', '0', '0', '930');
INSERT INTO `char_profile` VALUES ('21938', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21939', '250', '2', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21940', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21941', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21942', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21943', '0', '2', '2', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21944', '0', '3', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21945', '4000', '2', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21946', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21947', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21948', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21949', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21950', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21951', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21952', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21953', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21954', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21955', '0', '1', '3', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21956', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21957', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21958', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21959', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21960', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21961', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21962', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21963', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21964', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21965', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21966', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21967', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21968', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21969', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21970', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21971', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21972', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21973', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21974', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21975', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21976', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21977', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21978', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21979', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21980', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21981', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21982', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21983', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21984', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21985', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21986', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21987', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21988', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21989', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21990', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21991', '0', '2', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21992', '0', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `char_profile` VALUES ('21993', '0', '1', '1', '1', '0', '0', '0', '0', '0');
