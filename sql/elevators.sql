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
INSERT INTO `elevators` VALUES ('1', 'Pso\'Xja_Elvtr_1', '16814439', '16814440', '16814441', '1', '1');
INSERT INTO `elevators` VALUES ('2', 'Pso\'Xja_Elvtr_2', '16814458', '16814459', '16814460', '1', '1');
INSERT INTO `elevators` VALUES ('3', 'Pso\'Xja_Elvtr_3', '16814461', '16814462', '16814463', '1', '1');
INSERT INTO `elevators` VALUES ('4', 'Pso\'Xja_Mvng_Flr_4', '16814464', '16814465', '16814466', '1', '1');
INSERT INTO `elevators` VALUES ('5', 'Pso\'Xja_Mvng_Flr_3', '16814468', '16814469', '16814470', '1', '1');
INSERT INTO `elevators` VALUES ('6', 'Pso\'Xja_Mvng_Flr_1', '16814471', '16814472', '16814473', '1', '1');
INSERT INTO `elevators` VALUES ('7', 'Pso\'Xja_Mvng_Flr_2', '16814474', '16814476', '16814475', '1', '1');
INSERT INTO `elevators` VALUES ('8', 'Pso\'Xja_1', '16814477', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('9', 'Pso\'Xja_2', '16814478', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('10', 'Pso\'Xja_3', '16814479', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('11', 'Pso\'Xja_4', '16814480', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('12', 'Pso\'Xja_5', '16814481', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('13', 'Pso\'Xja_6', '16814482', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('14', 'Pso\'Xja_Elvtr_4', '16814483', '16814484', '16814485', '1', '1');
INSERT INTO `elevators` VALUES ('15', 'Pso\'Xja_Elvtr_5', '16814502', '16814503', '16814504', '1', '1');
INSERT INTO `elevators` VALUES ('16', 'Pso\'Xja_Elvtr_6', '16814505', '16814506', '16814507', '1', '1');
INSERT INTO `elevators` VALUES ('17', 'Pso\'Xja_Elvtr_7', '16814508', '16814509', '16814510', '1', '1');
INSERT INTO `elevators` VALUES ('18', 'Pso\'Xja_Dspprng_Tls_4', '16814513', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('19', 'Pso\'Xja_Dspprng_Tls_1', '16814514', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('20', 'Pso\'Xja_Dspprng_Tls_2', '16814515', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('21', 'Fort_Ghelsba_Elvtr', '17354988', '17354990', '17354989', '0', '0');
INSERT INTO `elevators` VALUES ('22', 'Palborough_Mines_Elvtr', '17363339', '17363333', '17363332', '0', '0');
INSERT INTO `elevators` VALUES ('23', 'Davoi_Elvtr', '17387992', '17387995', '17387993', '0', '0');
INSERT INTO `elevators` VALUES ('24', 'Kuftal_Tunnel_Dspprng_Rck', '17490274', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('25', 'Port_Bastok_Drwbrdg', '17743958', '17743959', '17743960', '1', '1');
INSERT INTO `elevators` VALUES ('26', 'Metalworks_Elvtr_1', '17748035', '17748036', '17748037', '1', '1');
INSERT INTO `elevators` VALUES ('27', 'Metalworks_Elvtr_2', '17748038', '17748039', '17748040', '1', '1');