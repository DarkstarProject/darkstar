/*
Navicat MySQL Data Transfer

Source Server         : DarkStar
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : dspdb

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2011-10-21 01:36:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `traits`
-- ----------------------------
DROP TABLE IF EXISTS `traits`;
CREATE TABLE `traits` (
  `TraitID` int(11) DEFAULT NULL,
  `name` text,
  `job` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `mod` int(11) DEFAULT '0',
  `modValue` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of traits
-- ----------------------------
INSERT INTO `traits` VALUES ('5', 'Magic Atk. Bonus', '4', '10', '28', null);
INSERT INTO `traits` VALUES ('13', 'Conserve MP', '4', '20', '296', null);
INSERT INTO `traits` VALUES ('24', 'Clear Mind', '4', '15', '295', null);
INSERT INTO `traits` VALUES ('90', 'Enchainment', '16', '75', '0', null);
INSERT INTO `traits` VALUES ('91', 'Assimilation', '16', '75', '0', null);
INSERT INTO `traits` VALUES ('52', 'Resist Silence', '10', '5', '244', null);
INSERT INTO `traits` VALUES ('32', 'Beast Killer', '9', '70', '230', null);
INSERT INTO `traits` VALUES ('33', 'Plantoid Killer', '9', '60', '229', null);
INSERT INTO `traits` VALUES ('34', 'Vermin Killer', '9', '10', '224', null);
INSERT INTO `traits` VALUES ('35', 'Lizard Killer', '9', '40', '227', null);
INSERT INTO `traits` VALUES ('36', 'Bird Killer', '9', '20', '225', null);
INSERT INTO `traits` VALUES ('37', 'Amorph Killer', '9', '30', '226', null);
INSERT INTO `traits` VALUES ('38', 'Aquan Killer', '9', '50', '228', null);
INSERT INTO `traits` VALUES ('59', 'Resist Slow', '9', '15', '250', null);
INSERT INTO `traits` VALUES ('81', 'Beast Affinity ', '9', '75', '0', null);
INSERT INTO `traits` VALUES ('82', 'Beast Healer', '9', '75', '0', null);
INSERT INTO `traits` VALUES ('11', 'Rapid Shot', '17', '15', '0', null);
INSERT INTO `traits` VALUES ('50', 'Resist Paralyze', '17', '5', '242', null);
INSERT INTO `traits` VALUES ('92', 'Winning Streak', '17', '75', '0', null);
INSERT INTO `traits` VALUES ('93', 'Loaded Deck', '17', '75', '0', null);
INSERT INTO `traits` VALUES ('1', 'Accuracy Bonus', '19', '30', '64', null);
INSERT INTO `traits` VALUES ('2', 'Evasion Bonus', '19', '15', '69', null);
INSERT INTO `traits` VALUES ('59', 'Resist Slow', '19', '20', '250', null);
INSERT INTO `traits` VALUES ('67', 'Subtle Blow', '19', '25', '289', null);
INSERT INTO `traits` VALUES ('96', 'Closed Position', '19', '75', '0', null);
INSERT INTO `traits` VALUES ('1', 'Accuracy Bonus', '14', '30', '64', null);
INSERT INTO `traits` VALUES ('3', 'Attack Bonus', '14', '10', '23', null);
INSERT INTO `traits` VALUES ('43', 'Dragon Killer', '14', '25', '233', null);
INSERT INTO `traits` VALUES ('88', 'Empathy', '14', '75', '0', null);
INSERT INTO `traits` VALUES ('89', 'Strafe', '14', '75', '0', null);
INSERT INTO `traits` VALUES ('3', 'Attack Bonus', '8', '10', '23', null);
INSERT INTO `traits` VALUES ('41', 'Arcana Killer', '8', '25', '232', null);
INSERT INTO `traits` VALUES ('50', 'Resist Paralyze', '8', '20', '242', null);
INSERT INTO `traits` VALUES ('79', 'Muted Soul', '8', '75', '0', null);
INSERT INTO `traits` VALUES ('80', 'Desperate Blows', '8', '75', '0', null);
INSERT INTO `traits` VALUES ('7', 'Max HP Boost', '2', '35', '2', null);
INSERT INTO `traits` VALUES ('17', 'Counter', '2', '10', '291', null);
INSERT INTO `traits` VALUES ('23', 'Martial Arts', '2', '1', '173', null);
INSERT INTO `traits` VALUES ('66', 'Kick Attacks', '2', '51', '292', null);
INSERT INTO `traits` VALUES ('67', 'Subtle Blow', '2', '5', '289', null);
INSERT INTO `traits` VALUES ('73', 'Invigorate', '2', '75', '0', null);
INSERT INTO `traits` VALUES ('74', 'Penance', '2', '75', '0', null);
INSERT INTO `traits` VALUES ('18', 'Dual Wield', '13', '10', '259', null);
INSERT INTO `traits` VALUES ('22', 'Stealth', '13', '5', '0', null);
INSERT INTO `traits` VALUES ('57', 'Resist Bind', '13', '10', '247', null);
INSERT INTO `traits` VALUES ('67', 'Subtle Blow', '13', '15', '289', null);
INSERT INTO `traits` VALUES ('87', 'Ninja Tool Expert.', '13', '75', '308', null);
INSERT INTO `traits` VALUES ('55', 'Resist Curse', '0', '0', '248', null);
INSERT INTO `traits` VALUES ('56', 'Resist Stun', '0', '0', '251', null);
INSERT INTO `traits` VALUES ('60', 'Resist Charm', '0', '0', '252', null);
INSERT INTO `traits` VALUES ('65', 'Gilfinder II', '0', '0', '0', null);
INSERT INTO `traits` VALUES ('4', 'Defense Bonus', '7', '10', '1', null);
INSERT INTO `traits` VALUES ('10', 'Auto Refresh', '7', '35', '0', null);
INSERT INTO `traits` VALUES ('25', 'Shield Mastery', '7', '25', '0', null);
INSERT INTO `traits` VALUES ('39', 'Undead Killer', '7', '5', '231', null);
INSERT INTO `traits` VALUES ('48', 'Resist Sleep', '7', '20', '240', null);
INSERT INTO `traits` VALUES ('77', 'Iron Will', '7', '75', '0', null);
INSERT INTO `traits` VALUES ('78', 'Guardian', '7', '75', '0', null);
INSERT INTO `traits` VALUES ('2', 'Evasion Bonus', '18', '20', '69', null);
INSERT INTO `traits` VALUES ('23', 'Martial Arts', '18', '25', '173', null);
INSERT INTO `traits` VALUES ('59', 'Resist Slow', '18', '10', '250', null);
INSERT INTO `traits` VALUES ('94', 'Fine-Tuning', '18', '75', '0', null);
INSERT INTO `traits` VALUES ('95', 'Optimization', '18', '75', '0', null);
INSERT INTO `traits` VALUES ('5', 'Magic Atk. Bonus', '5', '20', '28', null);
INSERT INTO `traits` VALUES ('6', 'Magic Def. Bonus', '5', '25', '29', null);
INSERT INTO `traits` VALUES ('12', 'Fast Cast', '5', '15', '170', null);
INSERT INTO `traits` VALUES ('24', 'Clear Mind', '5', '31', '295', null);
INSERT INTO `traits` VALUES ('53', 'Resist Petrify', '5', '10', '246', null);
INSERT INTO `traits` VALUES ('1', 'Accuracy Bonus', '11', '10', '64', null);
INSERT INTO `traits` VALUES ('11', 'Rapid Shot', '11', '15', '0', null);
INSERT INTO `traits` VALUES ('21', 'Alertness', '11', '5', '0', null);
INSERT INTO `traits` VALUES ('49', 'Resist Poison', '11', '20', '241', null);
INSERT INTO `traits` VALUES ('83', 'Snapshot', '11', '75', '0', null);
INSERT INTO `traits` VALUES ('84', 'Recycle', '11', '75', '305', null);
INSERT INTO `traits` VALUES ('14', 'Store TP', '12', '10', '73', null);
INSERT INTO `traits` VALUES ('42', 'Demon Killer', '12', '40', '234', null);
INSERT INTO `traits` VALUES ('51', 'Resist Blind', '12', '5', '243', null);
INSERT INTO `traits` VALUES ('70', 'Zanshin', '12', '20', '306', null);
INSERT INTO `traits` VALUES ('85', 'Ikishoten', '12', '75', '0', null);
INSERT INTO `traits` VALUES ('86', 'Overwhelm', '12', '75', '0', null);
INSERT INTO `traits` VALUES ('8', 'Max MP Boost', '20', '30', '5', null);
INSERT INTO `traits` VALUES ('13', 'Conserve MP', '20', '25', '296', null);
INSERT INTO `traits` VALUES ('24', 'Clear Mind', '20', '20', '295', null);
INSERT INTO `traits` VALUES ('52', 'Resist Silence', '20', '10', '244', null);
INSERT INTO `traits` VALUES ('97', 'Stormsurge', '20', '75', '0', null);
INSERT INTO `traits` VALUES ('8', 'Max MP Boost', '15', '10', '5', null);
INSERT INTO `traits` VALUES ('10', 'Auto Refresh', '15', '25', '0', null);
INSERT INTO `traits` VALUES ('24', 'Clear Mind', '15', '15', '295', null);
INSERT INTO `traits` VALUES ('59', 'Resist Slow', '15', '20', '250', null);
INSERT INTO `traits` VALUES ('2', 'Evasion Bonus', '6', '10', '69', null);
INSERT INTO `traits` VALUES ('16', 'Triple Attack', '6', '55', '302', null);
INSERT INTO `traits` VALUES ('19', 'Treasure Hunter', '6', '15', '303', null);
INSERT INTO `traits` VALUES ('20', 'Gilfinder', '6', '5', '0', null);
INSERT INTO `traits` VALUES ('58', 'Resist Gravity', '6', '20', '249', null);
INSERT INTO `traits` VALUES ('64', 'Treasure Hunter II', '6', '45', '303', null);
INSERT INTO `traits` VALUES ('68', 'Assassin', '6', '60', '0', null);
INSERT INTO `traits` VALUES ('75', 'Aura Steal', '6', '75', '0', null);
INSERT INTO `traits` VALUES ('76', 'Ambush', '6', '75', '0', null);
INSERT INTO `traits` VALUES ('3', 'Attack Bonus', '1', '30', '23', null);
INSERT INTO `traits` VALUES ('4', 'Defense Bonus', '1', '10', '1', null);
INSERT INTO `traits` VALUES ('15', 'Double Attack', '1', '25', '288', null);
INSERT INTO `traits` VALUES ('54', 'Resist Virus', '1', '15', '245', null);
INSERT INTO `traits` VALUES ('71', 'Savagery', '1', '75', '0', null);
INSERT INTO `traits` VALUES ('72', 'Aggressive Aim', '1', '75', '0', null);
INSERT INTO `traits` VALUES ('6', 'Magic Def. Bonus', '3', '30', '29', null);
INSERT INTO `traits` VALUES ('9', 'Auto Regen', '3', '25', '0', null);
INSERT INTO `traits` VALUES ('24', 'Clear Mind', '3', '20', '295', null);
INSERT INTO `traits` VALUES ('69', 'Divine Veil', '3', '50', '0', null);
INSERT INTO `traits` VALUES ('52', 'Resist Silence', '10', '45', '244', null);
INSERT INTO `traits` VALUES ('52', 'Resist Silence', '10', '25', '244', null);
INSERT INTO `traits` VALUES ('59', 'Resist Slow', '9', '35', '250', null);
INSERT INTO `traits` VALUES ('59', 'Resist Slow', '9', '55', '250', null);
INSERT INTO `traits` VALUES ('59', 'Resist Slow', '9', '75', '250', null);
INSERT INTO `traits` VALUES ('52', 'Resist Silence', '10', '65', '244', null);
INSERT INTO `traits` VALUES ('5', 'Magic Atk. Bonus', '4', '30', '28', null);
INSERT INTO `traits` VALUES ('5', 'Magic Atk. Bonus', '4', '50', '28', null);
INSERT INTO `traits` VALUES ('5', 'Magic Atk. Bonus', '4', '70', '28', null);
INSERT INTO `traits` VALUES ('24', 'Clear Mind', '4', '30', '295', null);
INSERT INTO `traits` VALUES ('24', 'Clear Mind', '4', '45', '295', null);
INSERT INTO `traits` VALUES ('24', 'Clear Mind', '4', '60', '295', null);
INSERT INTO `traits` VALUES ('24', 'Clear Mind', '4', '75', '295', null);
INSERT INTO `traits` VALUES ('53', 'Resist Petrify', '5', '50', '246', null);
INSERT INTO `traits` VALUES ('53', 'Resist Petrify', '5', '30', '246', null);
INSERT INTO `traits` VALUES ('12', 'Fast Cast', '5', '35', '170', null);
INSERT INTO `traits` VALUES ('24', 'Clear Mind', '5', '53', '295', null);
INSERT INTO `traits` VALUES ('24', 'Clear Mind', '5', '75', '295', null);
INSERT INTO `traits` VALUES ('12', 'Fast Cast', '5', '55', '170', null);
INSERT INTO `traits` VALUES ('53', 'Resist Petrify', '5', '70', '246', null);
INSERT INTO `traits` VALUES ('5', 'Magic Atk. Bonus', '5', '40', '28', null);
INSERT INTO `traits` VALUES ('6', 'Magic Def. Bonus', '5', '45', '29', null);
INSERT INTO `traits` VALUES ('2', 'Evasion Bonus', '6', '30', '69', null);
INSERT INTO `traits` VALUES ('58', 'Resist Gravity', '6', '40', '249', null);
INSERT INTO `traits` VALUES ('2', 'Evasion Bonus', '6', '50', '69', null);
INSERT INTO `traits` VALUES ('58', 'Resist Gravity', '6', '60', '249', null);
INSERT INTO `traits` VALUES ('2', 'Evasion Bonus', '6', '70', '69', null);
INSERT INTO `traits` VALUES ('58', 'Resist Gravity', '6', '75', '249', null);
INSERT INTO `traits` VALUES ('54', 'Resist Virus', '1', '35', '245', null);
INSERT INTO `traits` VALUES ('54', 'Resist Virus', '1', '55', '245', null);
INSERT INTO `traits` VALUES ('54', 'Resist Virus', '1', '70', '245', null);
INSERT INTO `traits` VALUES ('23', 'Martial Arts', '2', '16', '173', null);
INSERT INTO `traits` VALUES ('23', 'Martial Arts', '2', '31', '173', null);
INSERT INTO `traits` VALUES ('7', 'Max HP Boost', '2', '15', '2', null);
INSERT INTO `traits` VALUES ('23', 'Martial Arts', '2', '46', '173', null);
INSERT INTO `traits` VALUES ('7', 'Max HP Boost', '2', '55', '2', null);
INSERT INTO `traits` VALUES ('23', 'Martial Arts', '2', '61', '173', null);
INSERT INTO `traits` VALUES ('7', 'Max HP Boost', '2', '70', '2', null);
INSERT INTO `traits` VALUES ('66', 'Kick Attacks', '2', '71', '292', null);
INSERT INTO `traits` VALUES ('23', 'Martial Arts', '2', '75', '173', null);
INSERT INTO `traits` VALUES ('6', 'Magic Def. Bonus', '3', '10', '29', null);
INSERT INTO `traits` VALUES ('24', 'Clear Mind', '3', '35', '295', null);
INSERT INTO `traits` VALUES ('6', 'Magic Def. Bonus', '3', '50', '29', null);
INSERT INTO `traits` VALUES ('24', 'Clear Mind', '3', '50', '295', null);
INSERT INTO `traits` VALUES ('24', 'Clear Mind', '3', '60', '295', null);
INSERT INTO `traits` VALUES ('6', 'Magic Def. Bonus', '3', '70', '29', null);
INSERT INTO `traits` VALUES ('4', 'Defense Bonus', '7', '30', '1', null);
INSERT INTO `traits` VALUES ('48', 'Resist Sleep', '7', '40', '240', null);
INSERT INTO `traits` VALUES ('4', 'Defense Bonus', '7', '50', '1', null);
INSERT INTO `traits` VALUES ('48', 'Resist Sleep', '7', '60', '240', null);
INSERT INTO `traits` VALUES ('4', 'Defense Bonus', '7', '70', '1', null);
INSERT INTO `traits` VALUES ('48', 'Resist Sleep', '7', '75', '240', null);
INSERT INTO `traits` VALUES ('3', 'Attack Bonus', '8', '30', '23', null);
INSERT INTO `traits` VALUES ('50', 'Resist Paralyze', '8', '40', '242', null);
INSERT INTO `traits` VALUES ('3', 'Attack Bonus', '8', '50', '23', null);
INSERT INTO `traits` VALUES ('50', 'Resist Paralyze', '8', '60', '242', null);
INSERT INTO `traits` VALUES ('3', 'Attack Bonus', '8', '70', '23', null);
INSERT INTO `traits` VALUES ('50', 'Resist Paralyze', '8', '75', '242', null);
INSERT INTO `traits` VALUES ('8', 'Max MP Boost', '15', '30', '5', null);
INSERT INTO `traits` VALUES ('24', 'Clear Mind', '15', '30', '295', null);
INSERT INTO `traits` VALUES ('59', 'Resist Slow', '15', '40', '250', null);
INSERT INTO `traits` VALUES ('24', 'Clear Mind', '15', '45', '295', null);
INSERT INTO `traits` VALUES ('8', 'Max MP Boost', '15', '50', '5', null);
INSERT INTO `traits` VALUES ('24', 'Clear Mind', '15', '60', '295', null);
INSERT INTO `traits` VALUES ('8', 'Max MP Boost', '15', '70', '5', null);
INSERT INTO `traits` VALUES ('59', 'Resist Slow', '15', '60', '250', null);
INSERT INTO `traits` VALUES ('24', 'Clear Mind', '15', '70', '295', null);
INSERT INTO `traits` VALUES ('1', 'Accuracy Bonus', '11', '30', '64', null);
INSERT INTO `traits` VALUES ('1', 'Accuracy Bonus', '11', '50', '64', null);
INSERT INTO `traits` VALUES ('1', 'Accuracy Bonus', '11', '70', '64', null);
INSERT INTO `traits` VALUES ('49', 'Resist Poison', '11', '40', '241', null);
INSERT INTO `traits` VALUES ('49', 'Resist Poison', '11', '60', '241', null);
INSERT INTO `traits` VALUES ('14', 'Store TP', '12', '30', '73', null);
INSERT INTO `traits` VALUES ('14', 'Store TP', '12', '50', '73', null);
INSERT INTO `traits` VALUES ('14', 'Store TP', '12', '70', '73', null);
INSERT INTO `traits` VALUES ('51', 'Resist Blind', '12', '25', '243', null);
INSERT INTO `traits` VALUES ('51', 'Resist Blind', '12', '45', '243', null);
INSERT INTO `traits` VALUES ('51', 'Resist Blind', '12', '65', '243', null);
INSERT INTO `traits` VALUES ('70', 'Zanshin', '12', '60', '306', null);
INSERT INTO `traits` VALUES ('18', 'Dual Wield', '13', '25', '259', null);
INSERT INTO `traits` VALUES ('18', 'Dual Wield', '13', '45', '259', null);
INSERT INTO `traits` VALUES ('18', 'Dual Wield', '13', '65', '259', null);
INSERT INTO `traits` VALUES ('57', 'Resist Bind', '13', '30', '247', null);
INSERT INTO `traits` VALUES ('57', 'Resist Bind', '13', '50', '247', null);
INSERT INTO `traits` VALUES ('57', 'Resist Bind', '13', '70', '247', null);
