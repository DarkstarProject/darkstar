/*
MySQL Data Transfer
Source Host: localhost
Source Database: dspdb
Target Host: localhost
Target Database: dspdb
Date: 10/3/2015 5:04:58 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for char_storage
-- ----------------------------
CREATE TABLE `char_storage` (
  `charid` int(10) unsigned NOT NULL,
  `inventory` tinyint(2) unsigned NOT NULL DEFAULT '30',
  `safe` tinyint(2) unsigned NOT NULL DEFAULT '50',
  `locker` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `satchel` tinyint(2) unsigned NOT NULL DEFAULT '30',
  `sack` tinyint(2) unsigned NOT NULL DEFAULT '30',
  `case` tinyint(2) unsigned NOT NULL DEFAULT '80',
  PRIMARY KEY (`charid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `char_storage` VALUES ('21842', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21843', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21844', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21845', '80', '80', '80', '80', '80', '80');
INSERT INTO `char_storage` VALUES ('21846', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21847', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21833', '80', '80', '80', '80', '80', '80');
INSERT INTO `char_storage` VALUES ('21848', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21849', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21850', '30', '50', '0', '30', '30', '80');
INSERT INTO `char_storage` VALUES ('21851', '80', '50', '80', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21852', '80', '80', '80', '80', '80', '80');
INSERT INTO `char_storage` VALUES ('21853', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21854', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21855', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21856', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21857', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21858', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21859', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21860', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21861', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21862', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21863', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21864', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21865', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21866', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21867', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21868', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21869', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21870', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21871', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21872', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21873', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21874', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21875', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21876', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21877', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21878', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21879', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21880', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21881', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21882', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21883', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21884', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21885', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21886', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21887', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21888', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21889', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21890', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21891', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21892', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21893', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21894', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21895', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21896', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21897', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21898', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21899', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21900', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21901', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21902', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21903', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21904', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21905', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21906', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21907', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21908', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21909', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21910', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21911', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21912', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21913', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21914', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21915', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21916', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21917', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21918', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21919', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21920', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21921', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21922', '30', '50', '0', '30', '30', '80');
INSERT INTO `char_storage` VALUES ('21923', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21924', '30', '50', '0', '30', '30', '80');
INSERT INTO `char_storage` VALUES ('21925', '30', '50', '0', '30', '30', '80');
INSERT INTO `char_storage` VALUES ('21926', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21927', '30', '50', '0', '30', '30', '80');
INSERT INTO `char_storage` VALUES ('21928', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21929', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21930', '30', '50', '0', '30', '30', '80');
INSERT INTO `char_storage` VALUES ('21931', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21932', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21933', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21934', '30', '50', '0', '30', '30', '80');
INSERT INTO `char_storage` VALUES ('21935', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21936', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21937', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21938', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21939', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21940', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21941', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21942', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21943', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21944', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21945', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21946', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21947', '30', '50', '0', '30', '30', '80');
INSERT INTO `char_storage` VALUES ('21948', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21949', '30', '50', '0', '30', '30', '80');
INSERT INTO `char_storage` VALUES ('21950', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21951', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21952', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21953', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21954', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21955', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21956', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21957', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21958', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21959', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21960', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21961', '30', '50', '0', '30', '30', '80');
INSERT INTO `char_storage` VALUES ('21962', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21963', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21964', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21965', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21966', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21967', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21968', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21969', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21970', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21971', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21972', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21973', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21974', '30', '50', '0', '30', '30', '80');
INSERT INTO `char_storage` VALUES ('21975', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21976', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21977', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21978', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21979', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21980', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21981', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21982', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21983', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21984', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21985', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21986', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21987', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21988', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21989', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21990', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21991', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21992', '80', '50', '0', '80', '30', '80');
INSERT INTO `char_storage` VALUES ('21993', '80', '50', '0', '80', '30', '80');
