/*
Navicat MySQL Data Transfer

Source Server         : DarkStar
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : dspdb

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2011-10-31 12:28:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `enmity`
-- ----------------------------
DROP TABLE IF EXISTS `enmity`;
CREATE TABLE `enmity` (
  `level` int(11) NOT NULL DEFAULT '0',
  `cmod` int(11) DEFAULT NULL,
  `dmod` int(11) DEFAULT NULL,
  PRIMARY KEY (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of enmity
-- ----------------------------
INSERT INTO `enmity` VALUES ('1', '11', '6');
INSERT INTO `enmity` VALUES ('2', '12', '7');
INSERT INTO `enmity` VALUES ('3', '13', '7');
INSERT INTO `enmity` VALUES ('4', '14', '8');
INSERT INTO `enmity` VALUES ('5', '15', '9');
INSERT INTO `enmity` VALUES ('6', '16', '9');
INSERT INTO `enmity` VALUES ('7', '17', '10');
INSERT INTO `enmity` VALUES ('8', '18', '10');
INSERT INTO `enmity` VALUES ('9', '19', '11');
INSERT INTO `enmity` VALUES ('10', '20', '12');
INSERT INTO `enmity` VALUES ('11', '20', '12');
INSERT INTO `enmity` VALUES ('12', '21', '13');
INSERT INTO `enmity` VALUES ('13', '21', '13');
INSERT INTO `enmity` VALUES ('14', '22', '14');
INSERT INTO `enmity` VALUES ('15', '22', '15');
INSERT INTO `enmity` VALUES ('16', '23', '15');
INSERT INTO `enmity` VALUES ('17', '23', '16');
INSERT INTO `enmity` VALUES ('18', '24', '17');
INSERT INTO `enmity` VALUES ('19', '24', '17');
INSERT INTO `enmity` VALUES ('20', '25', '18');
INSERT INTO `enmity` VALUES ('21', '25', '18');
INSERT INTO `enmity` VALUES ('22', '26', '19');
INSERT INTO `enmity` VALUES ('23', '26', '20');
INSERT INTO `enmity` VALUES ('24', '27', '20');
INSERT INTO `enmity` VALUES ('25', '27', '21');
INSERT INTO `enmity` VALUES ('26', '28', '22');
INSERT INTO `enmity` VALUES ('27', '28', '22');
INSERT INTO `enmity` VALUES ('28', '29', '23');
INSERT INTO `enmity` VALUES ('29', '29', '23');
INSERT INTO `enmity` VALUES ('30', '30', '24');
INSERT INTO `enmity` VALUES ('31', '30', '25');
INSERT INTO `enmity` VALUES ('32', '31', '25');
INSERT INTO `enmity` VALUES ('33', '31', '26');
INSERT INTO `enmity` VALUES ('34', '32', '27');
INSERT INTO `enmity` VALUES ('35', '32', '27');
INSERT INTO `enmity` VALUES ('36', '33', '28');
INSERT INTO `enmity` VALUES ('37', '33', '28');
INSERT INTO `enmity` VALUES ('38', '34', '29');
INSERT INTO `enmity` VALUES ('39', '34', '30');
INSERT INTO `enmity` VALUES ('40', '35', '30');
INSERT INTO `enmity` VALUES ('41', '35', '31');
INSERT INTO `enmity` VALUES ('42', '36', '32');
INSERT INTO `enmity` VALUES ('43', '36', '32');
INSERT INTO `enmity` VALUES ('44', '37', '33');
INSERT INTO `enmity` VALUES ('45', '37', '33');
INSERT INTO `enmity` VALUES ('46', '38', '34');
INSERT INTO `enmity` VALUES ('47', '38', '35');
INSERT INTO `enmity` VALUES ('48', '39', '35');
INSERT INTO `enmity` VALUES ('49', '39', '36');
INSERT INTO `enmity` VALUES ('50', '40', '37');
INSERT INTO `enmity` VALUES ('51', '40', '37');
INSERT INTO `enmity` VALUES ('52', '41', '38');
INSERT INTO `enmity` VALUES ('53', '41', '38');
INSERT INTO `enmity` VALUES ('54', '42', '39');
INSERT INTO `enmity` VALUES ('55', '43', '40');
INSERT INTO `enmity` VALUES ('56', '43', '40');
INSERT INTO `enmity` VALUES ('57', '44', '41');
INSERT INTO `enmity` VALUES ('58', '44', '42');
INSERT INTO `enmity` VALUES ('59', '45', '42');
INSERT INTO `enmity` VALUES ('60', '46', '43');
INSERT INTO `enmity` VALUES ('61', '46', '43');
INSERT INTO `enmity` VALUES ('62', '47', '44');
INSERT INTO `enmity` VALUES ('63', '47', '45');
INSERT INTO `enmity` VALUES ('64', '48', '45');
INSERT INTO `enmity` VALUES ('65', '49', '46');
INSERT INTO `enmity` VALUES ('66', '49', '47');
INSERT INTO `enmity` VALUES ('67', '50', '47');
INSERT INTO `enmity` VALUES ('68', '50', '48');
INSERT INTO `enmity` VALUES ('69', '51', '48');
INSERT INTO `enmity` VALUES ('70', '52', '49');
INSERT INTO `enmity` VALUES ('71', '52', '50');
INSERT INTO `enmity` VALUES ('72', '53', '50');
INSERT INTO `enmity` VALUES ('73', '53', '51');
INSERT INTO `enmity` VALUES ('74', '54', '52');
INSERT INTO `enmity` VALUES ('75', '55', '52');
INSERT INTO `enmity` VALUES ('76', '0', '53');
INSERT INTO `enmity` VALUES ('77', '0', '53');
INSERT INTO `enmity` VALUES ('78', '0', '54');
INSERT INTO `enmity` VALUES ('79', '0', '54');
INSERT INTO `enmity` VALUES ('80', '0', '55');
INSERT INTO `enmity` VALUES ('81', '0', '56');
INSERT INTO `enmity` VALUES ('82', '0', '56');
INSERT INTO `enmity` VALUES ('83', '0', '57');
INSERT INTO `enmity` VALUES ('84', '0', '58');
INSERT INTO `enmity` VALUES ('85', '0', '58');
INSERT INTO `enmity` VALUES ('86', '0', '59');
INSERT INTO `enmity` VALUES ('87', '0', '59');
INSERT INTO `enmity` VALUES ('88', '0', '60');
INSERT INTO `enmity` VALUES ('89', '0', '61');
INSERT INTO `enmity` VALUES ('90', '0', '61');
INSERT INTO `enmity` VALUES ('91', '0', '62');
INSERT INTO `enmity` VALUES ('92', '0', '63');
INSERT INTO `enmity` VALUES ('93', '0', '63');
INSERT INTO `enmity` VALUES ('94', '0', '64');
INSERT INTO `enmity` VALUES ('95', '0', '64');
