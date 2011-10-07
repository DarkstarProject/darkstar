/*
Navicat MySQL Data Transfer

Source Server         : DarkStar
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : dspdb

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2011-10-07 07:57:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `abilities`
-- ----------------------------
DROP TABLE IF EXISTS `abilities`;
CREATE TABLE `abilities` (
  `abilityId` tinyint(3) unsigned NOT NULL,
  `name` tinytext,
  `job` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `validTarget` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `recastTime` smallint(5) unsigned NOT NULL DEFAULT '0',
  `recastId` smallint(5) NOT NULL DEFAULT '0',
  `animation` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `range` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `isAOE` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`abilityId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=56;

-- ----------------------------
-- Records of abilities
-- ----------------------------
INSERT INTO `abilities` VALUES ('0', 'mighty_strikes', '1', '0', '1', '7200', '0', '33', '20', '0');
INSERT INTO `abilities` VALUES ('1', 'hundred_fists', '2', '0', '1', '7200', '0', '34', '20', '0');
INSERT INTO `abilities` VALUES ('2', 'benediction', '3', '0', '1', '7200', '0', '35', '20', '1');
INSERT INTO `abilities` VALUES ('3', 'manafont', '4', '0', '1', '7200', '0', '36', '20', '0');
INSERT INTO `abilities` VALUES ('4', 'chainspell', '5', '0', '1', '7200', '0', '37', '20', '0');
INSERT INTO `abilities` VALUES ('5', 'perfect_dodge', '6', '0', '1', '7200', '0', '38', '20', '0');
INSERT INTO `abilities` VALUES ('6', 'invincible', '7', '0', '1', '7200', '0', '18', '20', '0');
INSERT INTO `abilities` VALUES ('7', 'blood_weapon', '8', '0', '1', '7200', '0', '19', '20', '0');
INSERT INTO `abilities` VALUES ('8', 'familiar', '9', '0', '1', '7200', '0', '39', '20', '0');
INSERT INTO `abilities` VALUES ('9', 'soul_voice', '10', '0', '1', '7200', '0', '40', '20', '0');
INSERT INTO `abilities` VALUES ('10', 'eagle_eye_shot', '11', '0', '4', '7200', '0', '186', '20', '0');
INSERT INTO `abilities` VALUES ('11', 'meikyo_shisui', '12', '0', '1', '7200', '0', '96', '20', '0');
INSERT INTO `abilities` VALUES ('12', 'mijin_gakure', '13', '0', '4', '7200', '0', '93', '20', '0');
INSERT INTO `abilities` VALUES ('13', 'spirit_surge', '14', '0', '1', '7200', '0', '97', '20', '0');
INSERT INTO `abilities` VALUES ('14', 'astral_flow', '15', '0', '1', '7200', '0', '95', '20', '0');
INSERT INTO `abilities` VALUES ('15', 'berserk', '1', '15', '1', '300', '1', '0', '20', '0');
INSERT INTO `abilities` VALUES ('16', 'warcry', '1', '35', '1', '300', '2', '28', '20', '1');
INSERT INTO `abilities` VALUES ('17', 'defender', '1', '25', '1', '300', '3', '1', '20', '0');
INSERT INTO `abilities` VALUES ('18', 'aggressor', '1', '45', '1', '300', '4', '2', '20', '0');
INSERT INTO `abilities` VALUES ('19', 'provoke', '1', '5', '4', '30', '5', '3', '18', '0');
INSERT INTO `abilities` VALUES ('20', 'focus', '2', '25', '1', '300', '13', '4', '20', '0');
INSERT INTO `abilities` VALUES ('21', 'dodge', '2', '15', '1', '300', '14', '5', '20', '0');
INSERT INTO `abilities` VALUES ('22', 'chakra', '2', '35', '1', '300', '15', '6', '20', '0');
INSERT INTO `abilities` VALUES ('23', 'boost', '2', '5', '1', '15', '16', '7', '20', '0');
INSERT INTO `abilities` VALUES ('24', 'counterstance', '2', '45', '1', '300', '17', '8', '20', '0');
INSERT INTO `abilities` VALUES ('25', 'steal', '6', '5', '4', '300', '61', '181', '20', '0');
INSERT INTO `abilities` VALUES ('26', 'flee', '6', '25', '1', '300', '62', '9', '20', '0');
INSERT INTO `abilities` VALUES ('27', 'hide', '6', '45', '1', '300', '63', '10', '20', '0');
INSERT INTO `abilities` VALUES ('28', 'sneak_attack', '6', '15', '1', '60', '64', '17', '20', '0');
INSERT INTO `abilities` VALUES ('29', 'mug', '6', '35', '4', '900', '65', '183', '20', '0');
INSERT INTO `abilities` VALUES ('30', 'shield_bash', '7', '15', '4', '300', '73', '185', '20', '0');
INSERT INTO `abilities` VALUES ('31', 'holy_circle', '7', '5', '1', '600', '74', '29', '20', '1');
INSERT INTO `abilities` VALUES ('32', 'sentinel', '7', '30', '1', '300', '75', '11', '20', '0');
INSERT INTO `abilities` VALUES ('33', 'souleater', '8', '30', '1', '360', '85', '20', '20', '0');
INSERT INTO `abilities` VALUES ('34', 'arcane_circle', '8', '5', '1', '600', '86', '30', '20', '1');
INSERT INTO `abilities` VALUES ('35', 'last_resort', '8', '15', '1', '300', '87', '12', '20', '0');
INSERT INTO `abilities` VALUES ('36', 'charm', '9', '1', '4', '15', '97', '13', '18', '0');
INSERT INTO `abilities` VALUES ('37', 'gauge', '9', '10', '4', '30', '98', '14', '18', '0');
INSERT INTO `abilities` VALUES ('38', 'tame', '9', '30', '4', '600', '99', '15', '18', '0');
INSERT INTO `abilities` VALUES ('39', 'pet_commands', '9', '1', '1', '0', '0', '0', '18', '0');
INSERT INTO `abilities` VALUES ('40', 'scavenge', '11', '10', '1', '300', '121', '21', '20', '0');
INSERT INTO `abilities` VALUES ('41', 'shadowbind', '11', '40', '4', '300', '122', '188', '18', '0');
INSERT INTO `abilities` VALUES ('42', 'camouflage', '11', '20', '1', '300', '123', '10', '20', '0');
INSERT INTO `abilities` VALUES ('43', 'sharpshot', '11', '1', '1', '300', '124', '22', '20', '0');
INSERT INTO `abilities` VALUES ('44', 'barrage', '11', '30', '1', '300', '125', '23', '20', '0');
INSERT INTO `abilities` VALUES ('45', 'call_wyvern', '14', '1', '1', '1200', '163', '94', '20', '0');
INSERT INTO `abilities` VALUES ('46', 'third_eye', '12', '15', '1', '60', '133', '24', '20', '0');
INSERT INTO `abilities` VALUES ('47', 'meditate', '12', '30', '1', '180', '134', '25', '20', '0');
INSERT INTO `abilities` VALUES ('48', 'warding_circle', '12', '5', '1', '600', '135', '32', '20', '1');
INSERT INTO `abilities` VALUES ('49', 'ancient_circle', '14', '5', '1', '600', '157', '31', '20', '1');
INSERT INTO `abilities` VALUES ('50', 'jump', '14', '10', '4', '90', '158', '204', '20', '0');
INSERT INTO `abilities` VALUES ('51', 'high_jump', '14', '35', '4', '180', '159', '209', '20', '0');
INSERT INTO `abilities` VALUES ('52', 'super_jump', '14', '50', '4', '180', '160', '214', '20', '0');
INSERT INTO `abilities` VALUES ('53', 'fight', '9', '1', '4', '10', '100', '83', '18', '0');
INSERT INTO `abilities` VALUES ('54', 'heel', '9', '10', '1', '5', '101', '83', '18', '0');
INSERT INTO `abilities` VALUES ('55', 'leave', '9', '35', '1', '10', '101', '83', '18', '0');
INSERT INTO `abilities` VALUES ('56', 'sic', '9', '25', '1', '120', '102', '83', '18', '0');
INSERT INTO `abilities` VALUES ('57', 'stay', '9', '15', '1', '5', '101', '83', '18', '0');
INSERT INTO `abilities` VALUES ('58', 'divine_seal', '3', '15', '1', '600', '26', '81', '20', '0');
INSERT INTO `abilities` VALUES ('59', 'elemental_seal', '4', '15', '1', '600', '38', '80', '20', '0');
INSERT INTO `abilities` VALUES ('60', 'trick_attack', '6', '30', '1', '60', '66', '82', '20', '0');
INSERT INTO `abilities` VALUES ('61', 'weapon_bash', '8', '20', '4', '300', '88', '201', '20', '0');
INSERT INTO `abilities` VALUES ('62', 'reward', '9', '12', '1', '90', '103', '84', '18', '0');
INSERT INTO `abilities` VALUES ('63', 'cover', '7', '35', '2', '180', '76', '86', '20', '0');
INSERT INTO `abilities` VALUES ('64', 'spirit_link', '14', '25', '1', '180', '162', '196', '20', '0');
INSERT INTO `abilities` VALUES ('66', 'chi_blast', '2', '41', '4', '180', '18', '92', '20', '0');
INSERT INTO `abilities` VALUES ('67', 'convert', '5', '40', '1', '600', '49', '88', '20', '0');
INSERT INTO `abilities` VALUES ('68', 'accomplice', '6', '65', '2', '300', '69', '220', '20', '0');
INSERT INTO `abilities` VALUES ('69', 'call_beast', '9', '23', '1', '300', '104', '83', '18', '0');
INSERT INTO `abilities` VALUES ('70', 'unlimited_shot', '11', '51', '1', '180', '126', '90', '20', '0');
INSERT INTO `abilities` VALUES ('71', 'dismiss', '14', '1', '1', '300', '161', '94', '20', '0');
INSERT INTO `abilities` VALUES ('72', 'assault', '15', '1', '4', '10', '170', '94', '20', '0');
INSERT INTO `abilities` VALUES ('73', 'retreat', '15', '1', '1', '10', '171', '94', '20', '0');
INSERT INTO `abilities` VALUES ('74', 'release', '15', '1', '1', '10', '172', '94', '20', '0');
INSERT INTO `abilities` VALUES ('75', 'blood_pact_rage', '15', '1', '1', '0', '173', '0', '20', '0');
INSERT INTO `abilities` VALUES ('76', 'rampart', '7', '62', '1', '300', '77', '91', '20', '1');
INSERT INTO `abilities` VALUES ('77', 'azure_lore', '16', '0', '1', '7200', '0', '142', '20', '0');
INSERT INTO `abilities` VALUES ('78', 'chain_affinity', '16', '25', '1', '120', '181', '140', '20', '0');
INSERT INTO `abilities` VALUES ('79', 'burst_affinity', '16', '40', '1', '120', '182', '141', '20', '0');
INSERT INTO `abilities` VALUES ('80', 'wild_card', '17', '0', '1', '7200', '0', '132', '20', '1');
INSERT INTO `abilities` VALUES ('81', 'phantom_roll', '17', '5', '1', '0', '193', '0', '18', '0');
INSERT INTO `abilities` VALUES ('82', 'fighters_roll', '17', '49', '1', '60', '193', '98', '20', '1');
INSERT INTO `abilities` VALUES ('83', 'monks_roll', '17', '31', '1', '60', '193', '99', '20', '1');
INSERT INTO `abilities` VALUES ('84', 'healers_roll', '17', '20', '1', '60', '193', '100', '20', '1');
INSERT INTO `abilities` VALUES ('85', 'wizards_roll', '17', '58', '1', '60', '193', '111', '20', '1');
INSERT INTO `abilities` VALUES ('86', 'warlocks_roll', '17', '46', '1', '60', '193', '102', '20', '1');
INSERT INTO `abilities` VALUES ('87', 'rogues_roll', '17', '43', '1', '60', '193', '103', '20', '1');
INSERT INTO `abilities` VALUES ('88', 'gallants_roll', '17', '55', '1', '60', '193', '101', '20', '1');
INSERT INTO `abilities` VALUES ('89', 'chaos_roll', '17', '14', '1', '60', '193', '105', '20', '1');
INSERT INTO `abilities` VALUES ('90', 'beast_roll', '17', '34', '1', '60', '193', '106', '20', '1');
INSERT INTO `abilities` VALUES ('91', 'choral_roll', '17', '26', '1', '60', '193', '107', '20', '1');
INSERT INTO `abilities` VALUES ('92', 'hunters_roll', '17', '11', '1', '60', '193', '108', '20', '1');
INSERT INTO `abilities` VALUES ('93', 'samurai_roll', '17', '34', '1', '60', '193', '109', '20', '1');
INSERT INTO `abilities` VALUES ('94', 'ninja_roll', '17', '8', '1', '60', '193', '110', '20', '1');
INSERT INTO `abilities` VALUES ('95', 'drachen_roll', '17', '52', '1', '60', '193', '104', '20', '1');
INSERT INTO `abilities` VALUES ('96', 'evokers_roll', '17', '40', '1', '60', '193', '112', '20', '1');
INSERT INTO `abilities` VALUES ('97', 'maguss_roll', '17', '17', '1', '60', '193', '113', '20', '1');
INSERT INTO `abilities` VALUES ('98', 'corsairs_roll', '17', '5', '1', '60', '193', '114', '20', '1');
INSERT INTO `abilities` VALUES ('99', 'puppet_roll', '17', '23', '1', '60', '193', '115', '20', '1');
INSERT INTO `abilities` VALUES ('100', 'dancers_roll', '17', '61', '1', '60', '193', '167', '20', '1');
INSERT INTO `abilities` VALUES ('101', 'scholars_roll', '17', '64', '1', '60', '193', '168', '20', '1');
INSERT INTO `abilities` VALUES ('107', 'double-up', '17', '5', '1', '8', '194', '116', '20', '0');
INSERT INTO `abilities` VALUES ('108', 'quick_draw', '17', '40', '1', '0', '0', '0', '18', '0');
INSERT INTO `abilities` VALUES ('109', 'fire_shot', '17', '40', '4', '60', '195', '125', '18', '0');
INSERT INTO `abilities` VALUES ('110', 'ice_shot', '17', '40', '4', '60', '195', '126', '18', '0');
INSERT INTO `abilities` VALUES ('111', 'wind_shot', '17', '40', '4', '60', '195', '127', '18', '0');
INSERT INTO `abilities` VALUES ('112', 'earth_shot', '17', '40', '4', '60', '195', '128', '18', '0');
INSERT INTO `abilities` VALUES ('113', 'thunder_shot', '17', '40', '4', '60', '195', '129', '18', '0');
INSERT INTO `abilities` VALUES ('114', 'water_shot', '17', '40', '4', '60', '195', '130', '18', '0');
INSERT INTO `abilities` VALUES ('115', 'light_shot', '17', '40', '4', '60', '195', '123', '18', '0');
INSERT INTO `abilities` VALUES ('116', 'dark_shot', '17', '40', '4', '60', '195', '124', '18', '0');
INSERT INTO `abilities` VALUES ('117', 'random_deal', '17', '50', '1', '1200', '196', '131', '20', '1');
INSERT INTO `abilities` VALUES ('119', 'overdrive', '18', '0', '1', '7200', '0', '143', '20', '0');
INSERT INTO `abilities` VALUES ('120', 'activate', '18', '1', '1', '1200', '205', '83', '20', '0');
INSERT INTO `abilities` VALUES ('121', 'repair', '18', '15', '1', '180', '206', '83', '18', '0');
INSERT INTO `abilities` VALUES ('122', 'deploy', '18', '1', '4', '10', '207', '83', '18', '0');
INSERT INTO `abilities` VALUES ('123', 'deactivate', '18', '1', '1', '60', '208', '83', '18', '0');
INSERT INTO `abilities` VALUES ('124', 'retrieve', '18', '10', '1', '10', '209', '83', '18', '0');
INSERT INTO `abilities` VALUES ('125', 'fire_maneuver', '18', '1', '1', '10', '210', '83', '18', '0');
INSERT INTO `abilities` VALUES ('126', 'ice_maneuver', '18', '1', '1', '10', '210', '83', '18', '0');
INSERT INTO `abilities` VALUES ('127', 'wind_maneuver', '18', '1', '1', '10', '210', '83', '18', '0');
INSERT INTO `abilities` VALUES ('128', 'earth_maneuver', '18', '1', '1', '10', '210', '83', '18', '0');
INSERT INTO `abilities` VALUES ('129', 'thunder_maneuver', '18', '1', '1', '10', '210', '83', '18', '0');
INSERT INTO `abilities` VALUES ('130', 'water_maneuver', '18', '1', '1', '10', '210', '83', '18', '0');
INSERT INTO `abilities` VALUES ('131', 'light_maneuver', '18', '1', '1', '10', '210', '83', '18', '0');
INSERT INTO `abilities` VALUES ('132', 'dark_maneuver', '18', '1', '1', '10', '210', '83', '18', '0');
INSERT INTO `abilities` VALUES ('133', 'warriors_charge', '1', '75', '1', '900', '6', '154', '20', '0');
INSERT INTO `abilities` VALUES ('134', 'tomahawk', '1', '75', '4', '180', '7', '244', '20', '0');
INSERT INTO `abilities` VALUES ('135', 'mantra', '2', '75', '1', '600', '19', '155', '20', '1');
INSERT INTO `abilities` VALUES ('136', 'formless_strikes', '2', '75', '1', '600', '20', '156', '20', '0');
INSERT INTO `abilities` VALUES ('137', 'martyr', '3', '75', '2', '1200', '27', '157', '20', '0');
INSERT INTO `abilities` VALUES ('138', 'devotion', '3', '75', '2', '1200', '28', '158', '20', '0');
INSERT INTO `abilities` VALUES ('139', 'assassins_charge', '6', '75', '1', '900', '67', '160', '20', '0');
INSERT INTO `abilities` VALUES ('140', 'feint', '6', '75', '1', '600', '68', '159', '20', '0');
INSERT INTO `abilities` VALUES ('141', 'fealty', '7', '75', '1', '1200', '78', '148', '20', '0');
INSERT INTO `abilities` VALUES ('142', 'chivalry', '7', '75', '1', '1200', '79', '149', '20', '0');
INSERT INTO `abilities` VALUES ('143', 'dark_seal', '8', '75', '1', '900', '89', '144', '20', '0');
INSERT INTO `abilities` VALUES ('144', 'diabolic_eye', '8', '75', '1', '900', '90', '145', '20', '0');
INSERT INTO `abilities` VALUES ('145', 'feral_howl', '9', '75', '4', '900', '105', '146', '20', '0');
INSERT INTO `abilities` VALUES ('146', 'killer_instinct', '9', '75', '1', '900', '106', '147', '20', '1');
INSERT INTO `abilities` VALUES ('147', 'nightingale', '10', '75', '1', '1200', '109', '161', '20', '0');
INSERT INTO `abilities` VALUES ('148', 'troubadour', '10', '75', '1', '1200', '110', '162', '20', '0');
INSERT INTO `abilities` VALUES ('149', 'stealth_shot', '11', '75', '1', '300', '127', '150', '20', '0');
INSERT INTO `abilities` VALUES ('150', 'flashy_shot', '11', '75', '1', '1200', '128', '151', '20', '0');
INSERT INTO `abilities` VALUES ('151', 'shikikoyo', '12', '75', '2', '900', '136', '152', '20', '0');
INSERT INTO `abilities` VALUES ('152', 'blade_bash', '12', '75', '1', '900', '137', '202', '20', '0');
INSERT INTO `abilities` VALUES ('153', 'deep_breathing', '14', '75', '1', '900', '164', '153', '20', '0');
INSERT INTO `abilities` VALUES ('154', 'angon', '14', '75', '4', '180', '165', '245', '20', '0');
INSERT INTO `abilities` VALUES ('155', 'sange', '13', '75', '1', '900', '145', '200', '20', '0');
INSERT INTO `abilities` VALUES ('156', 'blood_pact_ward', '15', '1', '1', '0', '174', '0', '20', '0');
INSERT INTO `abilities` VALUES ('157', 'hasso', '12', '25', '1', '60', '138', '163', '20', '0');
INSERT INTO `abilities` VALUES ('158', 'seigan', '12', '35', '1', '60', '139', '164', '20', '0');
INSERT INTO `abilities` VALUES ('159', 'convergence', '16', '75', '1', '600', '183', '165', '20', '0');
INSERT INTO `abilities` VALUES ('160', 'diffusion', '16', '75', '1', '1200', '184', '166', '20', '1');
INSERT INTO `abilities` VALUES ('161', 'snake_eye', '17', '75', '1', '900', '197', '220', '20', '0');
INSERT INTO `abilities` VALUES ('162', 'fold', '17', '75', '1', '900', '198', '220', '20', '0');
INSERT INTO `abilities` VALUES ('163', 'role_reversal', '18', '75', '1', '240', '211', '169', '20', '0');
INSERT INTO `abilities` VALUES ('164', 'ventriloquy', '18', '75', '4', '120', '212', '170', '20', '0');
INSERT INTO `abilities` VALUES ('165', 'trance', '19', '0', '1', '7200', '0', '184', '20', '0');
INSERT INTO `abilities` VALUES ('166', 'sambas', '19', '5', '1', '0', '216', '0', '20', '0');
INSERT INTO `abilities` VALUES ('167', 'waltzes', '19', '15', '1', '0', '216', '0', '20', '0');
INSERT INTO `abilities` VALUES ('168', 'drain_samba', '19', '5', '1', '60', '216', '0', '20', '0');
INSERT INTO `abilities` VALUES ('169', 'drain_samba_ii', '19', '35', '1', '60', '216', '1', '20', '0');
INSERT INTO `abilities` VALUES ('170', 'drain_samba_iii', '19', '64', '1', '60', '216', '2', '20', '0');
INSERT INTO `abilities` VALUES ('171', 'aspir_samba', '19', '25', '1', '60', '216', '3', '20', '0');
INSERT INTO `abilities` VALUES ('172', 'aspir_samba_ii', '19', '60', '1', '60', '216', '4', '20', '0');
INSERT INTO `abilities` VALUES ('173', 'haste_samba', '19', '45', '1', '60', '216', '5', '20', '0');
INSERT INTO `abilities` VALUES ('174', 'curing_waltz', '19', '15', '27', '6', '217', '6', '20', '0');
INSERT INTO `abilities` VALUES ('175', 'curing_waltz_ii', '19', '30', '27', '8', '217', '7', '20', '0');
INSERT INTO `abilities` VALUES ('176', 'curing_waltz_iii', '19', '50', '27', '10', '217', '8', '20', '0');
INSERT INTO `abilities` VALUES ('177', 'curing_waltz_iv', '19', '70', '27', '17', '217', '9', '20', '0');
INSERT INTO `abilities` VALUES ('178', 'healing_waltz', '19', '35', '27', '15', '217', '10', '20', '1');
INSERT INTO `abilities` VALUES ('179', 'divine_waltz', '19', '25', '27', '13', '217', '11', '20', '1');
INSERT INTO `abilities` VALUES ('180', 'spectral_jig', '19', '25', '1', '30', '218', '12', '20', '0');
INSERT INTO `abilities` VALUES ('181', 'chocobo_jig', '19', '55', '1', '60', '218', '13', '20', '0');
INSERT INTO `abilities` VALUES ('182', 'jigs', '19', '25', '1', '0', '0', '0', '20', '0');
INSERT INTO `abilities` VALUES ('183', 'steps', '19', '20', '1', '0', '0', '0', '20', '0');
INSERT INTO `abilities` VALUES ('184', 'flourishes_i', '19', '20', '1', '0', '0', '0', '20', '0');
INSERT INTO `abilities` VALUES ('185', 'quickstep', '19', '20', '4', '15', '220', '220', '20', '0');
INSERT INTO `abilities` VALUES ('186', 'box_step', '19', '30', '4', '15', '220', '220', '20', '0');
INSERT INTO `abilities` VALUES ('187', 'stutter_step', '19', '40', '4', '15', '220', '220', '20', '0');
INSERT INTO `abilities` VALUES ('188', 'animated_flourish', '19', '20', '4', '30', '221', '181', '20', '0');
INSERT INTO `abilities` VALUES ('189', 'desperate_flourish', '19', '30', '4', '20', '221', '220', '20', '0');
INSERT INTO `abilities` VALUES ('190', 'reverse_flourish', '19', '40', '1', '30', '222', '182', '20', '0');
INSERT INTO `abilities` VALUES ('191', 'violent_flourish', '19', '45', '4', '20', '221', '220', '20', '0');
INSERT INTO `abilities` VALUES ('192', 'building_flourish', '19', '50', '1', '10', '222', '220', '20', '0');
INSERT INTO `abilities` VALUES ('193', 'wild_flourish', '19', '60', '4', '30', '222', '220', '20', '0');
INSERT INTO `abilities` VALUES ('194', 'tabula_rasa', '20', '0', '1', '7200', '0', '190', '20', '0');
INSERT INTO `abilities` VALUES ('195', 'light_arts', '20', '10', '1', '60', '228', '191', '20', '0');
INSERT INTO `abilities` VALUES ('196', 'dark_arts', '20', '10', '1', '60', '231', '192', '20', '0');
INSERT INTO `abilities` VALUES ('197', 'flourishes_ii', '19', '40', '1', '0', '0', '0', '20', '0');
INSERT INTO `abilities` VALUES ('198', 'modus_veritas', '20', '65', '4', '600', '230', '188', '20', '0');
INSERT INTO `abilities` VALUES ('199', 'penury', '20', '10', '1', '0', '231', '172', '20', '0');
INSERT INTO `abilities` VALUES ('200', 'celerity', '20', '25', '1', '0', '231', '173', '20', '0');
INSERT INTO `abilities` VALUES ('201', 'rapture', '20', '55', '1', '0', '231', '174', '20', '0');
INSERT INTO `abilities` VALUES ('202', 'accession', '20', '40', '1', '0', '231', '175', '20', '0');
INSERT INTO `abilities` VALUES ('203', 'parsimony', '20', '10', '1', '0', '231', '177', '20', '0');
INSERT INTO `abilities` VALUES ('204', 'alacrity', '20', '25', '1', '0', '231', '178', '20', '0');
INSERT INTO `abilities` VALUES ('205', 'ebullience', '20', '55', '1', '0', '231', '179', '20', '0');
INSERT INTO `abilities` VALUES ('206', 'manifestation', '20', '40', '1', '0', '231', '180', '20', '0');
INSERT INTO `abilities` VALUES ('207', 'stratagems', '20', '10', '1', '0', '231', '0', '20', '0');
INSERT INTO `abilities` VALUES ('208', 'velocity_shot', '11', '45', '1', '300', '129', '186', '20', '0');
INSERT INTO `abilities` VALUES ('209', 'snarl', '9', '45', '1', '30', '107', '87', '20', '0');
INSERT INTO `abilities` VALUES ('210', 'retaliation', '1', '60', '1', '180', '8', '185', '20', '0');
INSERT INTO `abilities` VALUES ('211', 'footwork', '2', '65', '1', '300', '21', '197', '20', '0');
INSERT INTO `abilities` VALUES ('213', 'pianissimo', '10', '45', '1', '15', '111', '194', '20', '0');
INSERT INTO `abilities` VALUES ('214', 'sekkanoki', '12', '60', '1', '300', '140', '199', '20', '0');
INSERT INTO `abilities` VALUES ('216', 'elemental_siphon', '15', '50', '1', '300', '175', '201', '20', '0');
INSERT INTO `abilities` VALUES ('217', 'sublimation', '20', '35', '1', '30', '234', '189', '20', '0');
INSERT INTO `abilities` VALUES ('218', 'addendum_white', '20', '10', '1', '0', '231', '171', '20', '0');
INSERT INTO `abilities` VALUES ('219', 'addendum_black', '20', '30', '1', '0', '231', '176', '20', '0');
INSERT INTO `abilities` VALUES ('220', 'collaborator', '6', '65', '2', '60', '17', '220', '20', '0');
INSERT INTO `abilities` VALUES ('221', 'saber_dance', '19', '75', '1', '300', '217', '207', '20', '0');
INSERT INTO `abilities` VALUES ('222', 'fan_dance', '19', '75', '1', '300', '216', '208', '20', '0');
INSERT INTO `abilities` VALUES ('223', 'no_foot_rise', '19', '75', '1', '180', '223', '209', '20', '0');
INSERT INTO `abilities` VALUES ('224', 'altruism', '20', '75', '1', '0', '231', '210', '20', '0');
INSERT INTO `abilities` VALUES ('225', 'focalization', '20', '75', '1', '0', '231', '212', '20', '0');
INSERT INTO `abilities` VALUES ('226', 'tranquility', '20', '75', '1', '0', '231', '211', '20', '0');
INSERT INTO `abilities` VALUES ('227', 'equanimity', '20', '75', '1', '0', '231', '213', '20', '0');
INSERT INTO `abilities` VALUES ('228', 'enlightenment', '20', '75', '1', '600', '231', '214', '20', '0');
INSERT INTO `abilities` VALUES ('229', 'afflatus_solace', '3', '40', '1', '60', '29', '216', '20', '0');
INSERT INTO `abilities` VALUES ('230', 'afflatus_misery', '3', '40', '1', '60', '30', '217', '20', '0');
INSERT INTO `abilities` VALUES ('231', 'composure', '5', '50', '1', '300', '50', '215', '20', '0');
INSERT INTO `abilities` VALUES ('232', 'yonin', '13', '40', '1', '300', '146', '218', '20', '0');
INSERT INTO `abilities` VALUES ('233', 'innin', '13', '40', '1', '300', '147', '219', '20', '0');
