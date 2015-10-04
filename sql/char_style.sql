/*
MySQL Data Transfer
Source Host: localhost
Source Database: dspdb
Target Host: localhost
Target Database: dspdb
Date: 10/3/2015 5:05:07 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for char_style
-- ----------------------------
CREATE TABLE `char_style` (
  `charid` int(10) unsigned NOT NULL,
  `head` smallint(5) unsigned NOT NULL DEFAULT '0',
  `body` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hands` smallint(5) unsigned NOT NULL DEFAULT '0',
  `legs` smallint(5) unsigned NOT NULL DEFAULT '0',
  `feet` smallint(5) unsigned NOT NULL DEFAULT '0',
  `main` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sub` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ranged` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=20;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `char_style` VALUES ('21828', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21829', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21830', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21831', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21832', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21833', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21834', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21835', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21836', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21837', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21838', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21839', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21840', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21841', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21842', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21843', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21844', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21846', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21845', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21847', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21848', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21849', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21851', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21852', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21853', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21854', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21855', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21857', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21858', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21859', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21860', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21861', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21863', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21864', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21865', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21866', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21867', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21868', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21869', '15193', '13758', '14883', '15399', '15337', '19848', '19025', '19216');
INSERT INTO `char_style` VALUES ('21870', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21871', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21872', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21873', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21874', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21875', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21876', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21877', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21878', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21879', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21880', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21881', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21882', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21883', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21884', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21885', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21886', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21887', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21856', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21888', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21889', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21890', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21891', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21892', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21893', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21894', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21895', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21896', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21897', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21898', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21899', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21900', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21901', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21902', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21903', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21904', '10654', '10674', '10694', '10714', '10734', '17057', '10804', '0');
INSERT INTO `char_style` VALUES ('21905', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21906', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21907', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21908', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21909', '15224', '10278', '14905', '10559', '10625', '20556', '18996', '0');
INSERT INTO `char_style` VALUES ('21910', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21911', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21912', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21913', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21914', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21915', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21916', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21917', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21918', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21919', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21920', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21921', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21923', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21926', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21928', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21929', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21931', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21932', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21933', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21935', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21936', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21937', '11827', '12177', '12213', '12249', '12285', '17765', '17765', '0');
INSERT INTO `char_style` VALUES ('21938', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21939', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21940', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21941', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21942', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21943', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21944', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21945', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21946', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21948', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21950', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21951', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21952', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21953', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21954', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21955', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21956', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21862', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21957', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21958', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21959', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21960', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21962', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21963', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21964', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21965', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21966', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21967', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21968', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21969', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21970', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21971', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21972', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21973', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21975', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21976', '12516', '12645', '13968', '14221', '14096', '16887', '19043', '0');
INSERT INTO `char_style` VALUES ('21977', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21978', '10882', '11871', '10503', '11960', '11454', '18520', '19022', '17235');
INSERT INTO `char_style` VALUES ('21979', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21980', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21981', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21982', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21983', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21984', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21985', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21986', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21987', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21988', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21989', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21990', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21991', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `char_style` VALUES ('21992', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
INSERT INTO `char_style` VALUES ('21993', '52685', '52685', '52685', '52685', '52685', '52685', '52685', '52685');
