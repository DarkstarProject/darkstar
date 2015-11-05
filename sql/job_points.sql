/*
MySQL Data Transfer
Source Host: localhost
Source Database: dspdb
Target Host: localhost
Target Database: dspdb
Date: ???
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for job points
-- ----------------------------
DROP TABLE IF EXISTS `job_points`;
CREATE TABLE `job_points` (
  `job_pointid` smallint(10) unsigned NOT NULL,
  `name` char(25) NOT NULL,
  `upgrade` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `jobs` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`job_pointid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records
-- ----------------------------
INSERT INTO `job_points` VALUES ('64', 'mighty_strikes_effect', '2', '1');
INSERT INTO `job_points` VALUES ('66', 'berserk_effect', '4', '1');
INSERT INTO `job_points` VALUES ('68', 'brazen_rush_effect', '2', '1');
INSERT INTO `job_points` VALUES ('70', 'defender_effect', '3', '1');
INSERT INTO `job_points` VALUES ('72', 'warcry_effect', '3', '1');
INSERT INTO `job_points` VALUES ('74', 'aggressor_effect', '1', '1');
INSERT INTO `job_points` VALUES ('76', 'retaliation_effect', '1', '1');
INSERT INTO `job_points` VALUES ('78', 'restraint_effect', '2', '1');
INSERT INTO `job_points` VALUES ('80', 'blood_rage_effect', '1', '1');
INSERT INTO `job_points` VALUES ('82', 'double_attack_effect', '1', '1');
INSERT INTO `job_points` VALUES ('128', 'hundred_fists_effect', '2', '2');
INSERT INTO `job_points` VALUES ('130', 'dodge_effect', '2', '2');
INSERT INTO `job_points` VALUES ('132', 'inner_strength_effect', '2', '2');
INSERT INTO `job_points` VALUES ('134', 'focus_effect', '2', '1');
INSERT INTO `job_points` VALUES ('136', 'chakra_effect', '1', '2');
INSERT INTO `job_points` VALUES ('138', 'counterstance_effect', '2', '2');
INSERT INTO `job_points` VALUES ('140', 'footwork_effect', '1', '2');
INSERT INTO `job_points` VALUES ('142', 'perfect_counter_effect', '1', '2');
INSERT INTO `job_points` VALUES ('144', 'impetus_effect', '2', '2');
INSERT INTO `job_points` VALUES ('146', 'kick_attacks_effect', '2', '2');
INSERT INTO `job_points` VALUES ('192', 'benediction_effect', '1', '3');
INSERT INTO `job_points` VALUES ('194', 'divine_seal_effect', '3', '3');
INSERT INTO `job_points` VALUES ('196', 'asylum_effect', '4', '3');
INSERT INTO `job_points` VALUES ('198', 'magic_accuracy_bonus', '1', '3');
INSERT INTO `job_points` VALUES ('200', 'afflatus_solace_effect', '2', '3');
INSERT INTO `job_points` VALUES ('202', 'afflatus_misery_effect', '2', '3');
INSERT INTO `job_points` VALUES ('204', 'divine_caress_duration', '2', '3');
INSERT INTO `job_points` VALUES ('206', 'sacrosanctity_effect', '1', '3');
INSERT INTO `job_points` VALUES ('208', 'regen_duration', '3', '3');
INSERT INTO `job_points` VALUES ('210', 'bar_spell_effect', '2', '3');
INSERT INTO `job_points` VALUES ('256', 'manafont_effect', '3', '4');
INSERT INTO `job_points` VALUES ('258', 'elemental_seal_effect', '3', '4');
INSERT INTO `job_points` VALUES ('260', 'subtle_sorcery_effect', '1', '4');
INSERT INTO `job_points` VALUES ('262', 'magic_burst_damage_bonus', '1', '4');
INSERT INTO `job_points` VALUES ('264', 'mana_wall_effect', '1', '4');
INSERT INTO `job_points` VALUES ('266', 'magic_accuracy_bonus', '1', '4');
INSERT INTO `job_points` VALUES ('268', 'enmity_douse_recast', '2', '4');
INSERT INTO `job_points` VALUES ('270', 'manawell_effect', '1', '4');
INSERT INTO `job_points` VALUES ('272', 'magic_burst_enmity_decrease', '1', '4');
INSERT INTO `job_points` VALUES ('274', 'magic_damage_bonus', '1', '4');
INSERT INTO `job_points` VALUES ('320', 'chainspell_effect', '2', '5');
INSERT INTO `job_points` VALUES ('322', 'convert_effect', '1', '5');
INSERT INTO `job_points` VALUES ('324', 'stymie_effect', '1', '5');
INSERT INTO `job_points` VALUES ('326', 'magic_accuracy_bonus', '1', '5');
INSERT INTO `job_points` VALUES ('328', 'composure_effect', '1', '5');
INSERT INTO `job_points` VALUES ('330', 'magic_atk_bonus', '1', '5');
INSERT INTO `job_points` VALUES ('332', 'saboteur_effect', '2', '5');
INSERT INTO `job_points` VALUES ('334', 'enfeebling_magic_duration', '1', '5');
INSERT INTO `job_points` VALUES ('336', 'quick_magic_effect', '2', '5');
INSERT INTO `job_points` VALUES ('338', 'enhancing_magic_duration', '1', '5');
INSERT INTO `job_points` VALUES ('384', 'perfect_dodge_effect', '3', '6');
INSERT INTO `job_points` VALUES ('386', 'sneak_attack_effect', '1', '6');
INSERT INTO `job_points` VALUES ('388', 'larceny_duration', '1', '6');
INSERT INTO `job_points` VALUES ('390', 'trick_attack_effect', '1', '6');
INSERT INTO `job_points` VALUES ('392', 'steal_recast', '2', '6');
INSERT INTO `job_points` VALUES ('394', 'mug_effect', '5', '6');
INSERT INTO `job_points` VALUES ('396', 'despoil_effect', '2', '6');
INSERT INTO `job_points` VALUES ('398', 'conspirator_effect', '1', '6');
INSERT INTO `job_points` VALUES ('400', 'bully_effect', '1', '6');
INSERT INTO `job_points` VALUES ('402', 'triple_attack_effect', '1', '6');
INSERT INTO `job_points` VALUES ('448', 'invincible_effect', '100', '7');
INSERT INTO `job_points` VALUES ('450', 'holy_circle_effect', '1', '7');
INSERT INTO `job_points` VALUES ('452', 'intervene_effect', '2', '7');
INSERT INTO `job_points` VALUES ('454', 'sentinel_effect', '1', '7');
INSERT INTO `job_points` VALUES ('456', 'shield_bash_effect', '10', '7');
INSERT INTO `job_points` VALUES ('458', 'cover_duration', '1', '7');
INSERT INTO `job_points` VALUES ('460', 'divine_emblem_effect', '2', '7');
INSERT INTO `job_points` VALUES ('462', 'sepulcher_duration', '1', '7');
INSERT INTO `job_points` VALUES ('464', 'palisade_effect', '1', '7');
INSERT INTO `job_points` VALUES ('466', 'enlight_effect', '1', '7');
INSERT INTO `job_points` VALUES ('512', 'blood_weapon_effect', '2', '8');
INSERT INTO `job_points` VALUES ('514', 'arcane_circle_effect', '1', '8');
INSERT INTO `job_points` VALUES ('516', 'soul_enslavement_effect', '1', '8');
INSERT INTO `job_points` VALUES ('518', 'last_resort_effect', '2', '8');
INSERT INTO `job_points` VALUES ('520', 'souleater_duration', '1', '8');
INSERT INTO `job_points` VALUES ('522', 'weapon_bash_effect, '1', '8');

