/*
MySQL Data Transfer
Source Host: localhost
Source Database: dspdb
Target Host: localhost
Target Database: dspdb
Date: 10/3/2015 5:06:28 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for linkshells
-- ----------------------------
CREATE TABLE `linkshells` (
  `linkshellid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `color` smallint(5) unsigned NOT NULL DEFAULT '61440',
  `poster` varchar(15) NOT NULL DEFAULT '',
  `message` blob,
  `messagetime` int(10) unsigned NOT NULL DEFAULT '0',
  `postrights` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkshellid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `linkshells` VALUES ('1', 'VRTRAFFXI', '65284', 'Wadski', 0x444F204E4F542055504441544520594F555220434C49454E5421212120484E4D20617265206275676765642061746D20616E64207265737061776E696E6720696E7374616E746C792E20456E6A6F797E2056727472612064726F70732064697361626C656420, '1443222530', '0');
INSERT INTO `linkshells` VALUES ('2', 'VRTRAGM', '65295', 'HIRO', 0x474D2063686174, '1439739187', '0');
INSERT INTO `linkshells` VALUES ('3', 'BLT', '63487', '', null, '0', '0');
