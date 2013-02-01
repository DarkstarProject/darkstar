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
INSERT INTO `elevators` VALUES ('1', 'Pso\'Xja - ', '16814439', '16814440', '16814441', '1', '1');
INSERT INTO `elevators` VALUES ('2', 'Pso\'Xja - ', '16814458', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('3', 'Pso\'Xja - ', '16814461', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('4', 'Pso\'Xja - Moving floor - 4', '16814464', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('5', 'Pso\'Xja - Moving floor - 3', '16814468', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('6', 'Pso\'Xja - Moving floor - 1', '16814471', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('7', 'Pso\'Xja - Moving floor - 2', '16814474', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('8', 'Pso\'Xja - ', '16814483', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('9', 'Pso\'Xja - ', '16814502', '16814503', '16814504', '1', '1');
INSERT INTO `elevators` VALUES ('10', 'Pso\'Xja - ', '16814505', '16814506', '16814507', '1', '1');
INSERT INTO `elevators` VALUES ('11', 'Pso\'Xja - ', '16814508', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('12', 'Pso\'Xja - Disappearing tiles - 4', '16814513', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('13', 'Pso\'Xja - Disappearing tiles - 1', '16814514', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('14', 'Pso\'Xja - Disappearing tiles - 2', '16814515', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('15', 'Fort Ghelsba - Elevator', '17354988', '17354990', '17354989', '0', '0');
INSERT INTO `elevators` VALUES ('16', 'Palborough Mines - Elevator', '17363339', '17363333', '17363332', '0', '0');
INSERT INTO `elevators` VALUES ('17', 'Davoi - Elevator', '17387992', '17387995', '17387993', '0', '0');
INSERT INTO `elevators` VALUES ('18', 'Metalworks - Elevator', '17748035', '17748036', '17748037', '1', '1');
INSERT INTO `elevators` VALUES ('19', 'Metalworks - Elevator', '17748038', '17748039', '17748040', '1', '1');
INSERT INTO `elevators` VALUES ('20', 'Pso\'Xja - Door (dtr 1)', '16814477', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('21', 'Pso\'Xja - Door (dtr 1)', '16814478', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('22', 'Pso\'Xja - Door (dtr 2)', '16814479', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('23', 'Pso\'Xja - Door (dtr 2)', '16814480', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('24', 'Pso\'Xja - Door (dtr 4)', '16814481', '0', '0', '1', '1');
INSERT INTO `elevators` VALUES ('25', 'Pso\'Xja - Door (dtr 4)', '16814482', '0', '0', '1', '1');
