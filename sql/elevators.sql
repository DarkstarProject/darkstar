/*
Navicat MySQL Data Transfer

Source Server         : DarkStar
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : dspdb

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2011-11-21 10:39:40
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
INSERT INTO `elevators` VALUES ('1', 'Pso\'Xja - ', '16814438', '16814439', '16814440', '1', '1');
INSERT INTO `elevators` VALUES ('2', 'Pso\'Xja - ', '16814457', '16814458', '16814459', '1', '1');
INSERT INTO `elevators` VALUES ('3', 'Pso\'Xja - ', '16814460', '16814461', '16814462', '1', '1');
INSERT INTO `elevators` VALUES ('4', 'Pso\'Xja - Moving floor - 4', '16814463', '16814464', '16814466', '1', '1');
INSERT INTO `elevators` VALUES ('5', 'Pso\'Xja - Moving floor - 3', '16814467', '16814468', '16814469', '1', '1');
INSERT INTO `elevators` VALUES ('6', 'Pso\'Xja - Moving floor - 1', '16814470', '16814471', '16814472', '1', '1');
INSERT INTO `elevators` VALUES ('7', 'Pso\'Xja - Moving floor - 2', '16814473', '16814474', '16814475', '1', '1');
INSERT INTO `elevators` VALUES ('8', 'Pso\'Xja - ', '16814482', '16814483', '16814484', '1', '1');
INSERT INTO `elevators` VALUES ('9', 'Pso\'Xja - ', '16814501', '16814502', '16814503', '1', '1');
INSERT INTO `elevators` VALUES ('10', 'Pso\'Xja - ', '16814504', '16814505', '16814506', '1', '1');
INSERT INTO `elevators` VALUES ('11', 'Pso\'Xja - ', '16814507', '16814508', '16814509', '1', '1');
INSERT INTO `elevators` VALUES ('12', 'Pso\'Xja - Disappearing tiles - 4', '16814512', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('13', 'Pso\'Xja - Disappearing tiles - 1', '16814513', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('14', 'Pso\'Xja - Disappearing tiles - 2', '16814514', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('15', 'Fort Ghelsba - Elevator', '17354988', '17354990', '17354989', '0', '0');
INSERT INTO `elevators` VALUES ('16', 'Palborough Mines - Elevator', '17363338', '17363332', '17363331', '0', '0');
INSERT INTO `elevators` VALUES ('17', 'Davoi - Elevator', '17387992', '17387995', '17387993', '0', '0');
INSERT INTO `elevators` VALUES ('18', 'Metalworks - Elevator', '17748035', '17748036', '17748037', '1', '1');
INSERT INTO `elevators` VALUES ('19', 'Metalworks - Elevator', '17748038', '17748039', '17748040', '1', '1');
INSERT INTO `elevators` VALUES ('20', 'Pso\'Xja - Door (dtr 1)', '16814476', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('21', 'Pso\'Xja - Door (dtr 1)', '16814477', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('22', 'Pso\'Xja - Door (dtr 2)', '16814478', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('23', 'Pso\'Xja - Door (dtr 2)', '16814479', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('24', 'Pso\'Xja - Door (dtr 4)', '16814480', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('25', 'Pso\'Xja - Door (dtr 4)', '16814481', '0', '0', '1', '1');
