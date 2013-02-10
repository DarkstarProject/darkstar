/*
MySQL Data Transfer
Source Host: localhost
Source Database: dspdb
Target Host: localhost
Target Database: dspdb
Date: 1/3/2013 7:06:50 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for traits
-- ----------------------------
DROP TABLE IF EXISTS `traits`;
CREATE TABLE `traits` (
  `traitid` tinyint(3) unsigned NOT NULL,
  `name` text NOT NULL,
  `job` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '99',
  `modifier` smallint(5) unsigned NOT NULL DEFAULT '0',
  `value` smallint(5) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records
-- ----------------------------
INSERT INTO `traits` VALUES ('55', 'resist curse', '0', '0', '248', '2');
INSERT INTO `traits` VALUES ('56', 'resist stun', '0', '0', '251', '2');
INSERT INTO `traits` VALUES ('60', 'resist charm', '0', '0', '252', '2');
INSERT INTO `traits` VALUES ('65', 'gilfinder ii', '0', '0', '0', '0');
INSERT INTO `traits` VALUES ('4', 'defense bonus', '1', '10', '1', '10');
INSERT INTO `traits` VALUES ('54', 'resist virus', '1', '15', '245', '2');
INSERT INTO `traits` VALUES ('15', 'double attack', '1', '25', '288', '10');
INSERT INTO `traits` VALUES ('3', 'attack bonus', '1', '30', '23', '10');
INSERT INTO `traits` VALUES ('3', 'attack bonus', '1', '30', '24', '10');
INSERT INTO `traits` VALUES ('54', 'resist virus', '1', '35', '245', '1');
INSERT INTO `traits` VALUES ('54', 'resist virus', '1', '55', '245', '2');
INSERT INTO `traits` VALUES ('54', 'resist virus', '1', '70', '245', '1');
INSERT INTO `traits` VALUES ('71', 'savagery', '1', '75', '0', '0');
INSERT INTO `traits` VALUES ('72', 'aggressive aim', '1', '75', '0', '0');
INSERT INTO `traits` VALUES ('23', 'martial arts', '2', '1', '173', '80');
INSERT INTO `traits` VALUES ('67', 'subtle blow', '2', '5', '289', '5');
INSERT INTO `traits` VALUES ('17', 'counter', '2', '10', '291', '10');
INSERT INTO `traits` VALUES ('7', 'max hp boost', '2', '15', '2', '30');
INSERT INTO `traits` VALUES ('23', 'martial arts', '2', '16', '173', '20');
INSERT INTO `traits` VALUES ('67', 'subtle blow', '2', '25', '289', '5');
INSERT INTO `traits` VALUES ('23', 'martial arts', '2', '31', '173', '20');
INSERT INTO `traits` VALUES ('7', 'max hp boost', '2', '35', '2', '30');
INSERT INTO `traits` VALUES ('67', 'subtle blow', '2', '45', '289', '5');
INSERT INTO `traits` VALUES ('23', 'martial arts', '2', '46', '173', '20');
INSERT INTO `traits` VALUES ('66', 'kick attacks', '2', '51', '292', '10');
INSERT INTO `traits` VALUES ('7', 'max hp boost', '2', '55', '2', '60');
INSERT INTO `traits` VALUES ('23', 'martial arts', '2', '61', '173', '20');
INSERT INTO `traits` VALUES ('67', 'subtle blow', '2', '65', '289', '5');
INSERT INTO `traits` VALUES ('7', 'max hp boost', '2', '70', '2', '60');
INSERT INTO `traits` VALUES ('66', 'kick attacks', '2', '71', '292', '13');
INSERT INTO `traits` VALUES ('23', 'martial arts', '2', '75', '173', '20');
INSERT INTO `traits` VALUES ('73', 'invigorate', '2', '75', '0', '0');
INSERT INTO `traits` VALUES ('74', 'penance', '2', '75', '0', '0');
INSERT INTO `traits` VALUES ('6', 'magic def. bonus', '3', '10', '29', '10');
INSERT INTO `traits` VALUES ('24', 'clear mind', '3', '20', '295', '1');
INSERT INTO `traits` VALUES ('9', 'auto regen', '3', '25', '370', '1');
INSERT INTO `traits` VALUES ('6', 'magic def. bonus', '3', '30', '29', '2');
INSERT INTO `traits` VALUES ('24', 'clear mind', '3', '35', '295', '1');
INSERT INTO `traits` VALUES ('6', 'magic def. bonus', '3', '50', '29', '2');
INSERT INTO `traits` VALUES ('24', 'clear mind', '3', '50', '295', '1');
INSERT INTO `traits` VALUES ('69', 'divine veil', '3', '50', '0', '0');
INSERT INTO `traits` VALUES ('24', 'clear mind', '3', '65', '295', '1');
INSERT INTO `traits` VALUES ('6', 'magic def. bonus', '3', '70', '29', '2');
INSERT INTO `traits` VALUES ('5', 'magic atk. bonus', '4', '10', '28', '20');
INSERT INTO `traits` VALUES ('24', 'clear mind', '4', '15', '295', '1');
INSERT INTO `traits` VALUES ('13', 'conserve mp', '4', '20', '296', '0');
INSERT INTO `traits` VALUES ('5', 'magic atk. bonus', '4', '30', '28', '4');
INSERT INTO `traits` VALUES ('24', 'clear mind', '4', '30', '295', '1');
INSERT INTO `traits` VALUES ('24', 'clear mind', '4', '45', '295', '1');
INSERT INTO `traits` VALUES ('5', 'magic atk. bonus', '4', '50', '28', '4');
INSERT INTO `traits` VALUES ('24', 'clear mind', '4', '60', '295', '1');
INSERT INTO `traits` VALUES ('5', 'magic atk. bonus', '4', '70', '28', '4');
INSERT INTO `traits` VALUES ('24', 'clear mind', '4', '75', '295', '1');
INSERT INTO `traits` VALUES ('53', 'resist petrify', '5', '10', '246', '2');
INSERT INTO `traits` VALUES ('12', 'fast cast', '5', '15', '170', '10');
INSERT INTO `traits` VALUES ('5', 'magic atk. bonus', '5', '20', '28', '20');
INSERT INTO `traits` VALUES ('6', 'magic def. bonus', '5', '25', '29', '10');
INSERT INTO `traits` VALUES ('53', 'resist petrify', '5', '30', '246', '1');
INSERT INTO `traits` VALUES ('24', 'clear mind', '5', '31', '295', '1');
INSERT INTO `traits` VALUES ('12', 'fast cast', '5', '35', '170', '5');
INSERT INTO `traits` VALUES ('5', 'magic atk. bonus', '5', '40', '28', '4');
INSERT INTO `traits` VALUES ('6', 'magic def. bonus', '5', '45', '29', '2');
INSERT INTO `traits` VALUES ('53', 'resist petrify', '5', '50', '246', '2');
INSERT INTO `traits` VALUES ('24', 'clear mind', '5', '53', '295', '1');
INSERT INTO `traits` VALUES ('12', 'fast cast', '5', '55', '170', '5');
INSERT INTO `traits` VALUES ('53', 'resist petrify', '5', '70', '246', '1');
INSERT INTO `traits` VALUES ('24', 'clear mind', '5', '75', '295', '1');
INSERT INTO `traits` VALUES ('20', 'gilfinder', '6', '5', '0', '0');
INSERT INTO `traits` VALUES ('2', 'evasion bonus', '6', '10', '69', '10');
INSERT INTO `traits` VALUES ('19', 'treasure hunter', '6', '15', '303', '1');
INSERT INTO `traits` VALUES ('58', 'resist gravity', '6', '20', '249', '2');
INSERT INTO `traits` VALUES ('2', 'evasion bonus', '6', '30', '69', '12');
INSERT INTO `traits` VALUES ('58', 'resist gravity', '6', '40', '249', '1');
INSERT INTO `traits` VALUES ('64', 'treasure hunter ii', '6', '45', '303', '1');
INSERT INTO `traits` VALUES ('2', 'evasion bonus', '6', '50', '69', '13');
INSERT INTO `traits` VALUES ('16', 'triple attack', '6', '55', '302', '5');
INSERT INTO `traits` VALUES ('58', 'resist gravity', '6', '60', '249', '2');
INSERT INTO `traits` VALUES ('68', 'assassin', '6', '60', '0', '0');
INSERT INTO `traits` VALUES ('2', 'evasion bonus', '6', '70', '69', '13');
INSERT INTO `traits` VALUES ('58', 'resist gravity', '6', '75', '249', '1');
INSERT INTO `traits` VALUES ('75', 'aura steal', '6', '75', '0', '0');
INSERT INTO `traits` VALUES ('76', 'ambush', '6', '75', '0', '0');
INSERT INTO `traits` VALUES ('39', 'undead killer', '7', '5', '231', '10');
INSERT INTO `traits` VALUES ('4', 'defense bonus', '7', '10', '1', '10');
INSERT INTO `traits` VALUES ('48', 'resist sleep', '7', '20', '240', '2');
INSERT INTO `traits` VALUES ('25', 'shield mastery', '7', '25', '0', '0');
INSERT INTO `traits` VALUES ('4', 'defense bonus', '7', '30', '1', '12');
INSERT INTO `traits` VALUES ('10', 'auto refresh', '7', '35', '369', '1');
INSERT INTO `traits` VALUES ('48', 'resist sleep', '7', '40', '240', '1');
INSERT INTO `traits` VALUES ('4', 'defense bonus', '7', '50', '1', '13');
INSERT INTO `traits` VALUES ('25', 'shield mastery', '7', '50', '0', '0');
INSERT INTO `traits` VALUES ('48', 'resist sleep', '7', '60', '240', '2');
INSERT INTO `traits` VALUES ('4', 'defense bonus', '7', '70', '1', '13');
INSERT INTO `traits` VALUES ('48', 'resist sleep', '7', '75', '240', '1');
INSERT INTO `traits` VALUES ('77', 'iron will', '7', '75', '0', '0');
INSERT INTO `traits` VALUES ('78', 'guardian', '7', '75', '0', '0');
INSERT INTO `traits` VALUES ('25', 'shield mastery', '7', '75', '0', '0');
INSERT INTO `traits` VALUES ('3', 'attack bonus', '8', '10', '23', '10');
INSERT INTO `traits` VALUES ('3', 'attack bonus', '8', '10', '24', '10');
INSERT INTO `traits` VALUES ('50', 'resist paralyze', '8', '20', '242', '2');
INSERT INTO `traits` VALUES ('41', 'arcana killer', '8', '25', '232', '10');
INSERT INTO `traits` VALUES ('3', 'attack bonus', '8', '30', '23', '12');
INSERT INTO `traits` VALUES ('3', 'attack bonus', '8', '30', '24', '12');
INSERT INTO `traits` VALUES ('50', 'resist paralyze', '8', '40', '242', '1');
INSERT INTO `traits` VALUES ('3', 'attack bonus', '8', '50', '23', '13');
INSERT INTO `traits` VALUES ('3', 'attack bonus', '8', '50', '24', '13');
INSERT INTO `traits` VALUES ('50', 'resist paralyze', '8', '60', '242', '2');
INSERT INTO `traits` VALUES ('3', 'attack bonus', '8', '70', '23', '13');
INSERT INTO `traits` VALUES ('3', 'attack bonus', '8', '70', '24', '13');
INSERT INTO `traits` VALUES ('50', 'resist paralyze', '8', '75', '242', '1');
INSERT INTO `traits` VALUES ('79', 'muted soul', '8', '75', '0', '0');
INSERT INTO `traits` VALUES ('80', 'desperate blows', '8', '75', '0', '0');
INSERT INTO `traits` VALUES ('34', 'vermin killer', '9', '10', '224', '10');
INSERT INTO `traits` VALUES ('59', 'resist slow', '9', '15', '250', '2');
INSERT INTO `traits` VALUES ('36', 'bird killer', '9', '20', '225', '10');
INSERT INTO `traits` VALUES ('37', 'amorph killer', '9', '30', '226', '10');
INSERT INTO `traits` VALUES ('59', 'resist slow', '9', '35', '250', '1');
INSERT INTO `traits` VALUES ('35', 'lizard killer', '9', '40', '227', '10');
INSERT INTO `traits` VALUES ('38', 'aquan killer', '9', '50', '228', '10');
INSERT INTO `traits` VALUES ('59', 'resist slow', '9', '55', '250', '2');
INSERT INTO `traits` VALUES ('33', 'plantoid killer', '9', '60', '229', '10');
INSERT INTO `traits` VALUES ('32', 'beast killer', '9', '70', '230', '10');
INSERT INTO `traits` VALUES ('59', 'resist slow', '9', '75', '250', '1');
INSERT INTO `traits` VALUES ('81', 'beast affinity ', '9', '75', '0', '0');
INSERT INTO `traits` VALUES ('82', 'beast healer', '9', '75', '0', '0');
INSERT INTO `traits` VALUES ('52', 'resist silence', '10', '5', '244', '2');
INSERT INTO `traits` VALUES ('52', 'resist silence', '10', '25', '244', '1');
INSERT INTO `traits` VALUES ('52', 'resist silence', '10', '45', '244', '2');
INSERT INTO `traits` VALUES ('52', 'resist silence', '10', '65', '244', '1');
INSERT INTO `traits` VALUES ('21', 'alertness', '11', '5', '0', '0');
INSERT INTO `traits` VALUES ('1', 'accuracy bonus', '11', '10', '25', '10');
INSERT INTO `traits` VALUES ('1', 'accuracy bonus', '11', '10', '26', '10');
INSERT INTO `traits` VALUES ('11', 'rapid shot', '11', '15', '357', '10');
INSERT INTO `traits` VALUES ('49', 'resist poison', '11', '20', '241', '2');
INSERT INTO `traits` VALUES ('1', 'accuracy bonus', '11', '30', '25', '12');
INSERT INTO `traits` VALUES ('1', 'accuracy bonus', '11', '30', '26', '12');
INSERT INTO `traits` VALUES ('49', 'resist poison', '11', '40', '241', '1');
INSERT INTO `traits` VALUES ('1', 'accuracy bonus', '11', '50', '25', '13');
INSERT INTO `traits` VALUES ('1', 'accuracy bonus', '11', '50', '26', '13');
INSERT INTO `traits` VALUES ('49', 'resist poison', '11', '60', '241', '2');
INSERT INTO `traits` VALUES ('1', 'accuracy bonus', '11', '70', '25', '13');
INSERT INTO `traits` VALUES ('1', 'accuracy bonus', '11', '70', '26', '13');
INSERT INTO `traits` VALUES ('83', 'snapshot', '11', '75', '0', '0');
INSERT INTO `traits` VALUES ('84', 'recycle', '11', '75', '305', '10');
INSERT INTO `traits` VALUES ('51', 'resist blind', '12', '5', '243', '2');
INSERT INTO `traits` VALUES ('14', 'store tp', '12', '10', '73', '10');
INSERT INTO `traits` VALUES ('70', 'zanshin', '12', '20', '306', '15');
INSERT INTO `traits` VALUES ('51', 'resist blind', '12', '25', '243', '1');
INSERT INTO `traits` VALUES ('14', 'store tp', '12', '30', '73', '5');
INSERT INTO `traits` VALUES ('42', 'demon killer', '12', '40', '234', '10');
INSERT INTO `traits` VALUES ('51', 'resist blind', '12', '45', '243', '2');
INSERT INTO `traits` VALUES ('14', 'store tp', '12', '50', '73', '5');
INSERT INTO `traits` VALUES ('70', 'zanshin', '12', '35', '306', '10');
INSERT INTO `traits` VALUES ('70', 'zanshin', '12', '50', '306', '10');
INSERT INTO `traits` VALUES ('70', 'zanshin', '12', '75', '306', '10');
INSERT INTO `traits` VALUES ('51', 'resist blind', '12', '65', '243', '1');
INSERT INTO `traits` VALUES ('14', 'store tp', '12', '70', '73', '5');
INSERT INTO `traits` VALUES ('85', 'ikishoten', '12', '75', '0', '0');
INSERT INTO `traits` VALUES ('86', 'overwhelm', '12', '75', '0', '0');
INSERT INTO `traits` VALUES ('22', 'stealth', '13', '5', '358', '3');
INSERT INTO `traits` VALUES ('57', 'resist bind', '13', '10', '247', '2');
INSERT INTO `traits` VALUES ('67', 'subtle blow', '13', '15', '289', '5');
INSERT INTO `traits` VALUES ('57', 'resist bind', '13', '30', '247', '1');
INSERT INTO `traits` VALUES ('57', 'resist bind', '13', '50', '247', '2');
INSERT INTO `traits` VALUES ('57', 'resist bind', '13', '70', '247', '1');
INSERT INTO `traits` VALUES ('87', 'ninja tool expert.', '13', '75', '308', '0');
INSERT INTO `traits` VALUES ('3', 'attack bonus', '14', '10', '23', '10');
INSERT INTO `traits` VALUES ('3', 'attack bonus', '14', '10', '24', '10');
INSERT INTO `traits` VALUES ('43', 'dragon killer', '14', '25', '233', '10');
INSERT INTO `traits` VALUES ('1', 'accuracy bonus', '14', '30', '64', '10');
INSERT INTO `traits` VALUES ('1', 'accuracy bonus', '14', '50', '64', '12');
INSERT INTO `traits` VALUES ('88', 'empathy', '14', '75', '0', '0');
INSERT INTO `traits` VALUES ('89', 'strafe', '14', '75', '0', '0');
INSERT INTO `traits` VALUES ('8', 'max mp boost', '15', '10', '5', '10');
INSERT INTO `traits` VALUES ('24', 'clear mind', '15', '15', '295', '1');
INSERT INTO `traits` VALUES ('59', 'resist slow', '15', '20', '250', '2');
INSERT INTO `traits` VALUES ('10', 'auto refresh', '15', '25', '369', '1');
INSERT INTO `traits` VALUES ('8', 'max mp boost', '15', '30', '5', '10');
INSERT INTO `traits` VALUES ('24', 'clear mind', '15', '30', '295', '1');
INSERT INTO `traits` VALUES ('59', 'resist slow', '15', '40', '250', '1');
INSERT INTO `traits` VALUES ('24', 'clear mind', '15', '45', '295', '1');
INSERT INTO `traits` VALUES ('8', 'max mp boost', '15', '50', '5', '20');
INSERT INTO `traits` VALUES ('24', 'clear mind', '15', '60', '295', '1');
INSERT INTO `traits` VALUES ('59', 'resist slow', '15', '60', '250', '2');
INSERT INTO `traits` VALUES ('8', 'max mp boost', '15', '70', '5', '20');
INSERT INTO `traits` VALUES ('24', 'clear mind', '15', '70', '295', '1');
INSERT INTO `traits` VALUES ('59', 'resist slow', '15', '75', '250', '1');
INSERT INTO `traits` VALUES ('90', 'enchainment', '16', '75', '0', '0');
INSERT INTO `traits` VALUES ('91', 'assimilation', '16', '75', '0', '0');
INSERT INTO `traits` VALUES ('50', 'resist paralyze', '17', '5', '242', '2');
INSERT INTO `traits` VALUES ('11', 'rapid shot', '17', '15', '357', '10');
INSERT INTO `traits` VALUES ('92', 'winning streak', '17', '75', '0', '0');
INSERT INTO `traits` VALUES ('93', 'loaded deck', '17', '75', '0', '0');
INSERT INTO `traits` VALUES ('59', 'resist slow', '18', '10', '250', '2');
INSERT INTO `traits` VALUES ('2', 'evasion bonus', '18', '20', '69', '10');
INSERT INTO `traits` VALUES ('23', 'martial arts', '18', '25', '173', '20');
INSERT INTO `traits` VALUES ('94', 'fine-tuning', '18', '75', '0', '0');
INSERT INTO `traits` VALUES ('95', 'optimization', '18', '75', '0', '0');
INSERT INTO `traits` VALUES ('2', 'evasion bonus', '19', '15', '69', '10');
INSERT INTO `traits` VALUES ('59', 'resist slow', '19', '20', '250', '1');
INSERT INTO `traits` VALUES ('67', 'subtle blow', '19', '25', '289', '5');
INSERT INTO `traits` VALUES ('1', 'accuracy bonus', '19', '30', '64', '10');
INSERT INTO `traits` VALUES ('2', 'evasion bonus', '19', '45', '69', '12');
INSERT INTO `traits` VALUES ('67', 'subtle blow', '19', '45', '289', '5');
INSERT INTO `traits` VALUES ('1', 'accuracy bonus', '19', '60', '64', '12');
INSERT INTO `traits` VALUES ('67', 'subtle blow', '19', '65', '289', '5');
INSERT INTO `traits` VALUES ('2', 'evasion bonus', '19', '75', '69', '13');
INSERT INTO `traits` VALUES ('96', 'closed position', '19', '75', '0', '0');
INSERT INTO `traits` VALUES ('52', 'resist silence', '20', '10', '244', '2');
INSERT INTO `traits` VALUES ('24', 'clear mind', '20', '20', '295', '1');
INSERT INTO `traits` VALUES ('24', 'clear mind', '20', '35', '295', '1');
INSERT INTO `traits` VALUES ('24', 'clear mind', '20', '50', '295', '1');
INSERT INTO `traits` VALUES ('24', 'clear mind', '20', '65', '295', '1');
INSERT INTO `traits` VALUES ('13', 'conserve mp', '20', '25', '296', '0');
INSERT INTO `traits` VALUES ('8', 'max mp boost', '20', '30', '5', '10');
INSERT INTO `traits` VALUES ('97', 'stormsurge', '20', '75', '0', '0');
INSERT INTO `traits` VALUES ('59', 'widescan', '9', '1', '340', '50');
INSERT INTO `traits` VALUES ('59', 'widescan', '11', '1', '340', '150');
INSERT INTO `traits` VALUES ('59', 'widescan', '11', '20', '340', '50');
INSERT INTO `traits` VALUES ('59', 'widescan', '11', '40', '340', '50');
INSERT INTO `traits` VALUES ('59', 'widescan', '11', '60', '340', '50');
INSERT INTO `traits` VALUES ('59', 'widescan', '9', '20', '340', '100');
INSERT INTO `traits` VALUES ('59', 'widescan', '9', '40', '340', '50');
INSERT INTO `traits` VALUES ('59', 'widescan', '9', '60', '340', '50');

 -- Dual wield Ninja
INSERT INTO `traits` VALUES ('18', 'dual wield', '13', '10', '259', '10');	-- Dual wield I
INSERT INTO `traits` VALUES ('18', 'dual wield', '13', '25', '259', '5');	-- Dual wield II
INSERT INTO `traits` VALUES ('18', 'dual wield', '13', '45', '259', '10');  -- Dual wield III
INSERT INTO `traits` VALUES ('18', 'dual wield', '13', '65', '259', '5');	-- Dual wield VI
INSERT INTO `traits` VALUES ('18', 'dual wield', '13', '85', '259', '5');	-- Dual wield V

 -- Dual wield Dancer
INSERT INTO `traits` VALUES ('18', 'dual wield', '19', '20', '259', '10');	-- Dual wield I
INSERT INTO `traits` VALUES ('18', 'dual wield', '19', '40', '259', '5');	-- Dual wield II
INSERT INTO `traits` VALUES ('18', 'dual wield', '19', '60', '259', '10');  -- Dual wield III
INSERT INTO `traits` VALUES ('18', 'dual wield', '19', '80', '259', '5');	-- Dual wield VI

 -- Dual wield Thief
INSERT INTO `traits` VALUES ('18', 'dual wield', '6', '83', '259', '10');	-- Dual wield I
