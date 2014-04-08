/*
Navicat MySQL Data Transfer

Source Server         : DarkStar
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : dspdb

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2011-11-21 19:42:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `elevators`
-- ----------------------------
DROP TABLE IF EXISTS `elevators`;
CREATE TABLE `elevators` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(35) NOT NULL,
  `elevator` int(10) unsigned NOT NULL DEFAULT '0',
  `upperDoor` int(10) unsigned NOT NULL DEFAULT '0',
  `lowerDoor` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `regime` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=38;

-- ----------------------------
-- Records of elevators
-- ----------------------------
INSERT INTO `elevators` VALUES ('1', 'Pso\'Xja_Elvtr_1', '16814440', '16814441', '16814442', '1', '1');
INSERT INTO `elevators` VALUES ('2', 'Pso\'Xja_Elvtr_2', '16814459', '16814460', '16814461', '1', '1');
INSERT INTO `elevators` VALUES ('3', 'Pso\'Xja_Elvtr_3', '16814462', '16814463', '16814464', '1', '1');
-- INSERT INTO `elevators` VALUES ('4', 'Pso\'Xja_Mvng_Flr_4', '16814465', '16814466', '16814467', '1', '1');
-- INSERT INTO `elevators` VALUES ('5', 'Pso\'Xja_Mvng_Flr_3', '16814469', '16814470', '16814471', '1', '1');
-- INSERT INTO `elevators` VALUES ('6', 'Pso\'Xja_Mvng_Flr_1', '16814472', '16814473', '16814474', '1', '1');
-- INSERT INTO `elevators` VALUES ('7', 'Pso\'Xja_Mvng_Flr_2', '16814475', '16814476', '16814477', '1', '1');
INSERT INTO `elevators` VALUES ('8', 'Pso\'Xja_1', '16814478', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('9', 'Pso\'Xja_2', '16814479', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('10', 'Pso\'Xja_3', '16814480', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('11', 'Pso\'Xja_4', '16814481', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('12', 'Pso\'Xja_5', '16814482', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('13', 'Pso\'Xja_6', '16814483', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('14', 'Pso\'Xja_Elvtr_4', '16814484', '16814485', '16814486', '1', '1');
INSERT INTO `elevators` VALUES ('15', 'Pso\'Xja_Elvtr_5', '16814503', '16814504', '16814505', '1', '1');
INSERT INTO `elevators` VALUES ('16', 'Pso\'Xja_Elvtr_6', '16814506', '16814507', '16814508', '1', '1');
INSERT INTO `elevators` VALUES ('17', 'Pso\'Xja_Elvtr_7', '16814509', '16814510', '16814511', '1', '1');
INSERT INTO `elevators` VALUES ('18', 'Pso\'Xja_Dspprng_Tls_4', '16814514', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('19', 'Pso\'Xja_Dspprng_Tls_1', '16814515', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('20', 'Pso\'Xja_Dspprng_Tls_2', '16814516', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('21', 'Fort_Ghelsba_Elvtr', '17354988', '17354990', '17354989', '0', '0');
INSERT INTO `elevators` VALUES ('22', 'Palborough_Mines_Elvtr', '17363340', '17363334', '17363333', '0', '0');
INSERT INTO `elevators` VALUES ('23', 'Davoi_Elvtr', '17387993', '17387996', '17387994', '0', '0');
INSERT INTO `elevators` VALUES ('24', 'Kuftal_Tunnel_Dspprng_Rck', '17490275', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('25', 'Port_Bastok_Drwbrdg', '17743962', '17743963', '17743964', '1', '1');
INSERT INTO `elevators` VALUES ('26', 'Metalworks_Elvtr_1', '17748035', '17748036', '17748037', '1', '1');
INSERT INTO `elevators` VALUES ('27', 'Metalworks_Elvtr_2', '17748038', '17748039', '17748040', '1', '1');