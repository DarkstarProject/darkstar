/*
Navicat MySQL Data Transfer

Source Server         : DarkStar
Source Server Version : 50529
Source Host           : localhost:3306
Source Database       : dspdb

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2013-02-12 17:25:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bcnm_info`
-- ----------------------------
DROP TABLE IF EXISTS `bcnm_info`;
CREATE TABLE `bcnm_info` (
  `bcnmId` smallint(5) unsigned NOT NULL,
  `zoneId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL,
  `fastestName` varchar(15) DEFAULT NULL,
  `fastestTime` smallint(5) unsigned DEFAULT NULL,
  `timeLimit` smallint(5) unsigned NOT NULL DEFAULT '1800',
  `levelCap` smallint(5) unsigned NOT NULL DEFAULT '75',
  `partySize` smallint(5) unsigned NOT NULL DEFAULT '6',
  `lootDropId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `rules` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`bcnmId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=56;

-- ----------------------------
-- Records
-- ----------------------------
INSERT INTO `bcnm_info` VALUES ('0', '139', 'rank_2_mission', null, null, '1800', '25', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('1', '139', 'tails_of_woe', null, null, '1800', '40', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('2', '139', 'dismemberment_brigade', null, null, '1800', '60', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('3', '139', 'the_secret_weapon', null, null, '1800', '99', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('4', '139', 'hostile_herbivores', null, null, '1800', '50', '6', '14', '15');
INSERT INTO `bcnm_info` VALUES ('5', '139', 'shattering_stars', null, null, '600', '99', '1', '0', '22');
INSERT INTO `bcnm_info` VALUES ('6', '139', 'shattering_stars', null, null, '600', '99', '1', '0', '22');
INSERT INTO `bcnm_info` VALUES ('7', '139', 'shattering_stars', null, null, '600', '99', '1', '0', '22');
INSERT INTO `bcnm_info` VALUES ('8', '139', 'carapace_combatants', null, null, '900', '30', '3', '0', '15');
INSERT INTO `bcnm_info` VALUES ('9', '139', 'shooting_fish', null, null, '900', '20', '3', '0', '15');
INSERT INTO `bcnm_info` VALUES ('10', '139', 'dropping_like_flies', null, null, '1800', '30', '6', '12', '15');
INSERT INTO `bcnm_info` VALUES ('11', '139', 'horns_of_war', null, null, '1800', '0', '18', '11', '15');
INSERT INTO `bcnm_info` VALUES ('12', '139', 'under_observation', null, null, '900', '40', '3', '16', '15');
INSERT INTO `bcnm_info` VALUES ('13', '139', 'eye_of_the_tiger', null, null, '900', '50', '3', '0', '15');
INSERT INTO `bcnm_info` VALUES ('14', '139', 'shots_in_the_dark', null, null, '900', '60', '3', '0', '15');
INSERT INTO `bcnm_info` VALUES ('15', '139', 'double_dragonian', null, null, '1800', '0', '6', '15', '15');
INSERT INTO `bcnm_info` VALUES ('16', '139', 'todays_horoscope', null, null, '1800', '0', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('17', '139', 'contaminated_colosseum', null, null, '1800', '0', '6', '17', '15');
INSERT INTO `bcnm_info` VALUES ('18', '139', 'kindergarten_cap', null, null, '900', '0', '3', '0', '15');
INSERT INTO `bcnm_info` VALUES ('19', '139', 'last_orc-shunned_hero', null, null, '1800', '0', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('20', '139', 'beyond_infinity', null, null, '600', '0', '6', '0', '6');
INSERT INTO `bcnm_info` VALUES ('32', '140', 'save_the_children', null, null, '600', '0', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('33', '140', 'holy_crest', null, null, '600', '75', '6', '0', '7');
INSERT INTO `bcnm_info` VALUES ('34', '140', 'wings_of_fury', null, null, '900', '20', '3', '34', '15');
INSERT INTO `bcnm_info` VALUES ('35', '140', 'petrifying_pair', null, null, '900', '30', '3', '35', '15');
INSERT INTO `bcnm_info` VALUES ('36', '140', 'toadal_recall', null, null, '1800', '30', '6', '36', '15');
INSERT INTO `bcnm_info` VALUES ('37', '140', 'mirror_mirror', null, null, '900', '40', '3', '0', '7');
INSERT INTO `bcnm_info` VALUES ('64', '144', 'rank_2_mission', null, null, '1800', '25', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('65', '144', 'worms_turn', null, null, '1800', '40', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('66', '144', 'grimshell_shocktroopers', null, null, '1800', '60', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('67', '144', 'on_my_way', null, null, '1800', '99', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('68', '144', 'thief_in_norg', null, null, '1800', '99', '6', '0', '6');
INSERT INTO `bcnm_info` VALUES ('69', '144', '3_2_1', null, null, '1800', '50', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('70', '144', 'shattering_stars', null, null, '600', '99', '1', '0', '22');
INSERT INTO `bcnm_info` VALUES ('71', '144', 'shattering_stars', null, null, '600', '99', '1', '0', '22');
INSERT INTO `bcnm_info` VALUES ('72', '144', 'shattering_stars', null, null, '600', '99', '1', '0', '22');
INSERT INTO `bcnm_info` VALUES ('73', '144', 'birds_of_a_feather', null, null, '900', '30', '3', '73', '15');
INSERT INTO `bcnm_info` VALUES ('74', '144', 'crustacean_conundrum', null, null, '900', '20', '3', '0', '15');
INSERT INTO `bcnm_info` VALUES ('75', '144', 'grove_guardians', null, null, '1800', '30', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('76', '144', 'hills_are_alive', null, null, '1800', '0', '18', '76', '15');
INSERT INTO `bcnm_info` VALUES ('77', '144', 'royal_jelly', null, null, '900', '40', '3', '0', '15');
INSERT INTO `bcnm_info` VALUES ('78', '144', 'final_bout', null, null, '180', '50', '3', '0', '15');
INSERT INTO `bcnm_info` VALUES ('79', '144', 'up_in_arms', null, null, '900', '60', '3', '79', '15');
INSERT INTO `bcnm_info` VALUES ('80', '144', 'copycat', null, null, '1800', '0', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('81', '144', 'operation_desert_swarm', null, null, '1800', '0', '6', '81', '15');
INSERT INTO `bcnm_info` VALUES ('82', '144', 'prehistoric_pigeons', null, null, '1800', '0', '6', '82', '15');
INSERT INTO `bcnm_info` VALUES ('83', '144', 'palborough_project', null, null, '900', '0', '3', '0', '15');
INSERT INTO `bcnm_info` VALUES ('84', '144', 'shell_shocked', null, null, '1800', '0', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('85', '144', 'beyond_infinity', null, null, '600', '0', '6', '0', '6');
INSERT INTO `bcnm_info` VALUES ('96', '146', 'rank_2_mission', null, null, '1800', '25', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('97', '146', 'steamed_sprouts', null, null, '1800', '40', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('98', '146', 'divine_punishers', null, null, '1800', '60', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('99', '146', 'saintly_invitation', null, null, '1800', '99', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('100', '146', 'treasures_and_tribulations', null, null, '1800', '50', '6', '100', '15');
INSERT INTO `bcnm_info` VALUES ('101', '146', 'shattering_stars', null, null, '600', '99', '1', '0', '22');
INSERT INTO `bcnm_info` VALUES ('102', '146', 'shattering_stars', null, null, '600', '99', '1', '0', '22');
INSERT INTO `bcnm_info` VALUES ('103', '146', 'shattering_stars', null, null, '600', '99', '1', '0', '22');
INSERT INTO `bcnm_info` VALUES ('104', '146', 'creeping_doom', null, null, '900', '30', '3', '0', '15');
INSERT INTO `bcnm_info` VALUES ('105', '146', 'charming_trio', null, null, '900', '20', '3', '105', '15');
INSERT INTO `bcnm_info` VALUES ('106', '146', 'harem_scarem', null, null, '1800', '30', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('107', '146', 'early_bird_catches_the_wyrm', null, null, '1800', '0', '18', '107', '15');
INSERT INTO `bcnm_info` VALUES ('108', '146', 'royal_succession', null, null, '900', '40', '3', '0', '15');
INSERT INTO `bcnm_info` VALUES ('109', '146', 'rapid_raptors', null, null, '900', '50', '3', '0', '15');
INSERT INTO `bcnm_info` VALUES ('110', '146', 'wild_wild_whiskers', null, null, '900', '60', '3', '0', '15');
INSERT INTO `bcnm_info` VALUES ('111', '146', 'seasons_greetings', null, null, '1800', '0', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('112', '146', 'royale_ramble', null, null, '1800', '0', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('113', '146', 'moa_constrictors', null, null, '1800', '0', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('114', '146', 'v_formation', null, null, '900', '0', '3', '0', '15');
INSERT INTO `bcnm_info` VALUES ('115', '146', 'avian_apostates', null, null, '1800', '0', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('116', '146', 'beyond_infinity', null, null, '600', '0', '6', '0', '6');
INSERT INTO `bcnm_info` VALUES ('128', '163', 'temple_of_uggalepih', null, null, '1800', '99', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('129', '163', 'jungle_boogymen', null, null, '1800', '60', '6', '10', '15');
INSERT INTO `bcnm_info` VALUES ('130', '163', 'amphibian_assault', null, null, '1800', '60', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('131', '163', 'project_shantottofication', null, null, '1800', '99', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('132', '163', 'whom_wilt_thou_call', null, null, '1800', '0', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('160', '165', 'shadow_lord_battle', null, null, '1800', '90', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('161', '165', 'where_two_paths_converge', null, null, '1800', '90', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('162', '165', 'kindred_spirits', null, null, '1800', '90', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('163', '165', 'survival_of_the_wisest', null, null, '600', '90', '1', '0', '6');
INSERT INTO `bcnm_info` VALUES ('164', '165', 'smash_a_malevolent_menace', null, null, '1800', '90', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('192', '168', 'through_the_quicksand_caves', null, null, '1800', '99', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('193', '168', 'legion_xi_comitatensis', null, null, '1800', '60', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('194', '168', 'shattering_stars', null, null, '600', '99', '1', '0', '22');
INSERT INTO `bcnm_info` VALUES ('195', '168', 'shattering_stars', null, null, '600', '99', '1', '0', '22');
INSERT INTO `bcnm_info` VALUES ('196', '168', 'shattering_stars', null, null, '600', '99', '1', '0', '22');
INSERT INTO `bcnm_info` VALUES ('197', '168', 'cactuar_suave', null, null, '1800', '0', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('198', '168', 'eye_of_the_storm', null, null, '1800', '0', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('199', '168', 'scarlet_king', null, null, '1800', '0', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('200', '168', 'cat_burglar_bares_fangs', null, null, '1800', '99', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('201', '168', 'dragon_scales', null, null, '600', '99', '1', '0', '6');
INSERT INTO `bcnm_info` VALUES ('224', '170', 'moonlit_path', null, null, '1800', '80', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('225', '170', 'moon_reading', null, null, '1800', '80', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('226', '170', 'waking_the_beast_fullmoon', null, null, '1800', '0', '18', '0', '5');
INSERT INTO `bcnm_info` VALUES ('227', '170', 'battaru_royale', null, null, '1800', '80', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('256', '179', 'return_to_delkfutts_tower', null, null, '1800', '75', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('257', '179', 'indomitable_triumvirate_vs3', null, null, '900', '60', '6', '0', '4');
INSERT INTO `bcnm_info` VALUES ('258', '179', 'dauntless_duo_vs2', null, null, '900', '60', '6', '0', '4');
INSERT INTO `bcnm_info` VALUES ('259', '179', 'solitary_demolisher_vs1', null, null, '900', '60', '6', '0', '4');
INSERT INTO `bcnm_info` VALUES ('260', '179', 'heroines_combat', null, null, '900', '60', '6', '0', '4');
INSERT INTO `bcnm_info` VALUES ('261', '179', 'mercenary_camp', null, null, '900', '60', '6', '0', '4');
INSERT INTO `bcnm_info` VALUES ('262', '179', 'ode_of_life_bestowing', null, null, '1800', '75', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('288', '180', 'ark_angels_1', null, null, '1800', '99', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('289', '180', 'ark_angels_2', null, null, '1800', '99', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('290', '180', 'ark_angels_3', null, null, '1800', '99', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('291', '180', 'ark_angels_4', null, null, '1800', '99', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('292', '180', 'ark_angels_5', null, null, '1800', '99', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('293', '180', 'divine_might', null, null, '1800', '0', '18', '0', '5');
INSERT INTO `bcnm_info` VALUES ('320', '181', 'celestial_nexus', null, null, '1800', '75', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('352', '156', 'fiat_lux', null, null, '1800', '0', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('353', '156', 'darkness_descends', null, null, '1800', '99', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('354', '156', 'bonds_of_mythril', null, null, '1800', '0', '18', '0', '5');
INSERT INTO `bcnm_info` VALUES ('385', '182', 'maiden_of_the_dusk', null, null, '1800', '99', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('416', '201', 'trial_by_wind', null, null, '1800', '0', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('417', '201', 'carbuncle_debacle', null, null, '1800', '99', '18', '0', '5');
INSERT INTO `bcnm_info` VALUES ('418', '201', 'trial-size_trial_by_wind', null, null, '900', '20', '1', '0', '5');
INSERT INTO `bcnm_info` VALUES ('419', '201', 'waking_the_beast', null, null, '1800', '0', '18', '0', '5');
INSERT INTO `bcnm_info` VALUES ('420', '201', 'sugar-coated_directive', null, null, '1800', '80', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('448', '202', 'trial_by_lightning', null, null, '1800', '0', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('449', '202', 'carbuncle_debacle', null, null, '1800', '99', '18', '0', '5');
INSERT INTO `bcnm_info` VALUES ('450', '202', 'trial-size_trial_by_lightning', null, null, '900', '20', '1', '0', '5');
INSERT INTO `bcnm_info` VALUES ('451', '202', 'waking_the_beast', null, null, '1800', '0', '18', '0', '5');
INSERT INTO `bcnm_info` VALUES ('452', '202', 'sugar-coated_directive', null, null, '1800', '80', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('480', '203', 'trial_by_ice', null, null, '1800', '0', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('481', '203', 'class_reunion', null, null, '1800', '99', '18', '0', '5');
INSERT INTO `bcnm_info` VALUES ('482', '203', 'trial-size_trial_by_ice', null, null, '900', '20', '1', '0', '5');
INSERT INTO `bcnm_info` VALUES ('483', '203', 'waking_the_beast', null, null, '1800', '0', '18', '0', '5');
INSERT INTO `bcnm_info` VALUES ('484', '203', 'sugar-coated_directive', null, null, '1800', '80', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('512', '206', 'rank_5_mission', null, null, '900', '50', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('513', '206', 'come_into_my_parlor', null, null, '1800', '0', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('514', '206', 'e-vase-ive_action', null, null, '1800', '0', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('515', '206', 'infernal_swarm', null, null, '1800', '0', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('516', '206', 'heir_to_the_light', null, null, '1800', '99', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('517', '206', 'shattering_stars', null, null, '600', '99', '1', '0', '22');
INSERT INTO `bcnm_info` VALUES ('518', '206', 'shattering_stars', null, null, '600', '99', '1', '0', '22');
INSERT INTO `bcnm_info` VALUES ('519', '206', 'shattering_stars', null, null, '600', '99', '1', '0', '22');
INSERT INTO `bcnm_info` VALUES ('520', '206', 'demolition_squad', null, null, '1800', '60', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('521', '206', 'die_by_the_sword', null, null, '900', '30', '3', '0', '15');
INSERT INTO `bcnm_info` VALUES ('522', '206', 'let_sleeping_dogs_die', null, null, '1800', '30', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('523', '206', 'brothers_d_aurphe', null, null, '1800', '60', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('524', '206', 'undying_promise', null, null, '900', '40', '3', '0', '15');
INSERT INTO `bcnm_info` VALUES ('525', '206', 'factory_rejects', null, null, '1800', '40', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('526', '206', 'idol_thoughts', null, null, '1800', '50', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('527', '206', 'awful_autopsy', null, null, '900', '50', '3', '0', '15');
INSERT INTO `bcnm_info` VALUES ('528', '206', 'celery', null, null, '900', '60', '3', '0', '15');
INSERT INTO `bcnm_info` VALUES ('529', '206', 'mirror_images', null, null, '900', '50', '1', '0', '7');
INSERT INTO `bcnm_info` VALUES ('530', '206', 'furious_finale', null, null, '600', '99', '1', '0', '6');
INSERT INTO `bcnm_info` VALUES ('531', '206', 'clash_of_the_comrades', null, null, '600', '0', '1', '0', '7');
INSERT INTO `bcnm_info` VALUES ('532', '206', 'those_who_lurk_in_shadows', null, null, '1800', '99', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('533', '206', 'beyond_infinity', null, null, '600', '0', '6', '0', '6');
INSERT INTO `bcnm_info` VALUES ('544', '207', 'trial_by_fire', null, null, '1800', '0', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('545', '207', 'trial-size_trial_by_fire', null, null, '900', '20', '1', '0', '5');
INSERT INTO `bcnm_info` VALUES ('546', '207', 'waking_the_beast', null, null, '1800', '0', '18', '0', '5');
INSERT INTO `bcnm_info` VALUES ('547', '207', 'sugar-coated_directive', null, null, '1800', '80', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('576', '209', 'trial_by_earth', null, null, '1800', '0', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('577', '209', 'puppet_master', null, null, '1800', '99', '18', '0', '5');
INSERT INTO `bcnm_info` VALUES ('578', '209', 'trial-size_trial_by_earth', null, null, '900', '20', '1', '0', '5');
INSERT INTO `bcnm_info` VALUES ('579', '209', 'waking_the_beast', null, null, '1800', '0', '18', '0', '5');
INSERT INTO `bcnm_info` VALUES ('580', '209', 'sugar-coated_directive', null, null, '1800', '80', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('608', '211', 'trial_by_water', null, null, '1800', '0', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('609', '211', 'trial-size_trial_by_water', null, null, '900', '20', '1', '0', '5');
INSERT INTO `bcnm_info` VALUES ('610', '211', 'waking_the_beast', null, null, '1800', '0', '18', '0', '5');
INSERT INTO `bcnm_info` VALUES ('611', '211', 'sugar-coated_directive', null, null, '1800', '80', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('640', '6', 'flames_for_the_dead', null, null, '1800', '60', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('641', '6', 'follow_the_white_rabbit', null, null, '1800', '75', '18', '0', '15');
INSERT INTO `bcnm_info` VALUES ('642', '6', 'when_hell_freezes_over', null, null, '900', '75', '18', '0', '15');
INSERT INTO `bcnm_info` VALUES ('643', '6', 'brothers', null, null, '1800', '75', '18', '0', '15');
INSERT INTO `bcnm_info` VALUES ('644', '6', 'holy_cow', null, null, '1800', '75', '18', '0', '15');
INSERT INTO `bcnm_info` VALUES ('672', '8', 'head_wind', null, null, '1800', '50', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('673', '8', 'like_the_wind', null, null, '900', '75', '18', '179', '15');
INSERT INTO `bcnm_info` VALUES ('674', '8', 'sheep_in_antlions_clothing', null, null, '1800', '75', '18', '0', '15');
INSERT INTO `bcnm_info` VALUES ('675', '8', 'shell_we_dance', null, null, '1800', '75', '18', '0', '15');
INSERT INTO `bcnm_info` VALUES ('676', '8', 'totentanz', null, null, '1800', '75', '18', '0', '15');
INSERT INTO `bcnm_info` VALUES ('677', '8', 'tango_with_a_tracker', null, null, '1800', '0', '6', '0', '7');
INSERT INTO `bcnm_info` VALUES ('678', '8', 'requiem_of_a_sin', null, null, '1800', '0', '6', '0', '7');
INSERT INTO `bcnm_info` VALUES ('679', '8', 'antagonistic_ambuscade', null, null, '900', '0', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('704', '10', 'darkness_named', null, null, '1800', '40', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('705', '10', 'test_your_mite', null, null, '1800', '40', '18', '0', '15');
INSERT INTO `bcnm_info` VALUES ('706', '10', 'waking_dreams', null, null, '1800', '0', '18', '0', '5');
INSERT INTO `bcnm_info` VALUES ('736', '13', 'century_of_hardship', null, null, '1800', '60', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('737', '13', 'return_to_the_depths', null, null, '1800', '90', '6', '0', '7');
INSERT INTO `bcnm_info` VALUES ('738', '13', 'bionic_bug', null, null, '1800', '0', '18', '0', '15');
INSERT INTO `bcnm_info` VALUES ('739', '13', 'pulling_the_strings', null, null, '900', '0', '1', '0', '15');
INSERT INTO `bcnm_info` VALUES ('740', '13', 'automaton_assault', null, null, '900', '60', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('741', '13', 'mobline_comedy', null, null, '900', '0', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('768', '17', 'ancient_flames_beckon', null, null, '1800', '30', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('769', '17', 'simulant', null, null, '1800', '30', '18', '0', '15');
INSERT INTO `bcnm_info` VALUES ('770', '17', 'empty_hopes', null, null, '900', '0', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('800', '19', 'ancient_flames_beckon', null, null, '1800', '30', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('801', '19', 'you_are_what_you_eat', null, null, '1800', '30', '18', '0', '15');
INSERT INTO `bcnm_info` VALUES ('802', '19', 'empty_dreams', null, null, '900', '0', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('832', '21', 'ancient_flames_backon', null, null, '1800', '30', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('833', '21', 'playing_host', null, null, '1800', '30', '18', '0', '15');
INSERT INTO `bcnm_info` VALUES ('834', '21', 'empty_desires', null, null, '900', '0', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('864', '23', 'desires_of_emptiness', null, null, '1800', '50', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('865', '23', 'pulling_the_plug', null, null, '1800', '50', '18', '0', '15');
INSERT INTO `bcnm_info` VALUES ('866', '23', 'empty_aspirations', null, null, '900', '0', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('896', '29', 'storms_of_fate', null, null, '1800', '0', '18', '0', '7');
INSERT INTO `bcnm_info` VALUES ('897', '29', 'wyrmking_descends', null, null, '3600', '0', '18', '0', '15');
INSERT INTO `bcnm_info` VALUES ('928', '30', 'ouryu_cometh', null, null, '3600', '0', '18', '0', '15');
INSERT INTO `bcnm_info` VALUES ('960', '31', 'ancient_vows', null, null, '1800', '40', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('961', '31', 'savage', null, null, '1800', '50', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('962', '31', 'fire_in_the_sky', null, null, '900', '40', '18', '0', '15');
INSERT INTO `bcnm_info` VALUES ('963', '31', 'bad_seed', null, null, '1800', '40', '18', '0', '15');
INSERT INTO `bcnm_info` VALUES ('964', '31', 'bugard_in_the_clouds', null, null, '900', '50', '18', '0', '15');
INSERT INTO `bcnm_info` VALUES ('965', '31', 'beloved_of_the_atlantes', null, null, '1800', '50', '18', '0', '15');
INSERT INTO `bcnm_info` VALUES ('966', '31', 'uninvited_guests', null, null, '1800', '0', '18', '0', '7');
INSERT INTO `bcnm_info` VALUES ('967', '31', 'nest_of_nightmares', null, null, '900', '0', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('992', '32', 'one_to_be_feared', null, null, '2700', '60', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('993', '32', 'warriors_path', null, null, '1800', '99', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('1024', '35', 'when_angels_fall', null, null, '1800', '0', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('1056', '36', 'dawn', null, null, '1800', '85', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('1057', '36', 'apocalypse_nigh', null, null, '1800', '75', '6', '0', '7');
INSERT INTO `bcnm_info` VALUES ('1088', '57', 'call_to_arms', null, null, '1800', '60', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('1089', '57', 'compliments_to_the_chef', null, null, '1800', '75', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('1090', '57', 'puppetmaster_blues', null, null, '1800', '75', '6', '0', '7');
INSERT INTO `bcnm_info` VALUES ('1091', '57', 'breaking_the_bonds_of_fate', null, null, '600', '75', '1', '0', '6');
INSERT INTO `bcnm_info` VALUES ('1092', '57', 'legacy_of_the_lost', null, null, '1800', '75', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('1120', '64', 'tough_nut_to_crack', null, null, '1800', '60', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('1121', '64', 'happy_caster', null, null, '1800', '75', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('1122', '64', 'omens', null, null, '1800', '75', '18', '0', '7');
INSERT INTO `bcnm_info` VALUES ('1123', '64', 'achieving_true_power', null, null, '600', '75', '1', '0', '6');
INSERT INTO `bcnm_info` VALUES ('1124', '64', 'shield_of_diplomacy', null, null, '1800', '75', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('1152', '67', 'making_a_mockery', null, null, '1800', '60', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('1153', '67', 'shadows_of_the_mind', null, null, '1800', '90', '6', '0', '15');
INSERT INTO `bcnm_info` VALUES ('1154', '67', 'beast_within', null, null, '600', '90', '1', '0', '6');
INSERT INTO `bcnm_info` VALUES ('1155', '67', 'moment_of_truth', null, null, '1800', '0', '6', '0', '7');
INSERT INTO `bcnm_info` VALUES ('1156', '67', 'puppet_in_peril', null, null, '1800', '90', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('1184', '78', 'rider_cometh', null, null, '900', '0', '6', '0', '5');
INSERT INTO `bcnm_info` VALUES ('1280', '186', 'dynamis_bastok', null, null, '3600', '0', '64', '0', '7');
INSERT INTO `bcnm_info` VALUES ('1281', '185', 'dynamis_sandoria', null, null, '3600', '0', '64', '0', '7');
INSERT INTO `bcnm_info` VALUES ('1282', '187', 'dynamis_windurst', null, null, '3600', '0', '64', '0', '7');
INSERT INTO `bcnm_info` VALUES ('1283', '188', 'dynamis_jeuno', null, null, '3600', '0', '64', '0', '7');
INSERT INTO `bcnm_info` VALUES ('1284', '134', 'dynamis_beaucedine', null, null, '3600', '0', '64', '0', '7');
INSERT INTO `bcnm_info` VALUES ('1285', '135', 'dynamis_xarcabard', null, null, '3600', '0', '64', '0', '7');
INSERT INTO `bcnm_info` VALUES ('1286', '39', 'dynamis_Valkurm', null, null, '3600', '0', '36', '0', '7');
INSERT INTO `bcnm_info` VALUES ('1287', '40', 'dynamis_Buburimu', null, null, '3600', '0', '36', '0', '7');
INSERT INTO `bcnm_info` VALUES ('1288', '41', 'dynamis_Qufim', null, null, '3600', '0', '36', '0', '7');
INSERT INTO `bcnm_info` VALUES ('1289', '42', 'dynamis_Tavnazia', null, null, '3600', '0', '18', '0', '7');

INSERT INTO `bcnm_info` VALUES ('1290', '38', 'NW_Apollyon', null, null, '1800', '0', '18', '0', '7');
INSERT INTO `bcnm_info` VALUES ('1291', '38', 'SW_Apollyon', null, null, '1800', '0', '18', '0', '7');

INSERT INTO `bcnm_info` VALUES ('1292', '38', 'NE_Apollyon', null, null, '1800', '0', '18', '0', '7');
INSERT INTO `bcnm_info` VALUES ('1293', '38', 'SE_Apollyon', null, null, '1800', '0', '18', '0', '7');
INSERT INTO `bcnm_info` VALUES ('1294', '38', 'CS_Apollyon' , null, null, '1200', '0', '18', '0', '7');
INSERT INTO `bcnm_info` VALUES ('1295', '38', 'CS_Apollyon_II', null, null, '1200', '0', '18', '0', '7');
INSERT INTO `bcnm_info` VALUES ('1296', '38', 'Central_Apollyon', null, null, '1800', '0', '18', '0', '7');
INSERT INTO `bcnm_info` VALUES ('1297', '38', 'Central_Apollyon_II', null, null, '1800', '0', '18', '0', '7');

INSERT INTO `bcnm_info` VALUES ('1298', '37', 'Temenos_Western_Tower', null, null,  '1800', '0', '18', '0', '7');
INSERT INTO `bcnm_info` VALUES ('1299', '37', 'Temenos_Northern_Tower', null, null,  '1800', '0', '18', '0', '7');
INSERT INTO `bcnm_info` VALUES ('1300', '37', 'Temenos_Eastern_Tower', null, null,  '1800', '0', '18', '0', '7');
INSERT INTO `bcnm_info` VALUES ('1301', '37', 'Central_Temenos_Basement', null, null,	 '900', '0', '18', '0', '7');
INSERT INTO `bcnm_info` VALUES ('1302', '37', 'Central_Temenos_Basement_II', null, null,  '900', '0', '18', '0', '7');
INSERT INTO `bcnm_info` VALUES ('1303', '37', 'Central_Temenos_1st_Floor', null, null,	 '2700', '0', '18', '0', '7');
INSERT INTO `bcnm_info` VALUES ('1304', '37', 'Central_Temenos_2nd_Floor', null, null, 	 '2700', '0', '18', '0', '7');
INSERT INTO `bcnm_info` VALUES ('1305', '37', 'Central_Temenos_3rd_Floor', null, null,	 '2700', '0', '18', '0', '7');
INSERT INTO `bcnm_info` VALUES ('1306', '37', 'Central_Temenos_4th_Floor', null, null, '3600', '0', '18', '0', '7');
INSERT INTO `bcnm_info` VALUES ('1307', '37', 'Central_Temenos_4th_Floor_II', null, null, '3600', '0', '18', '0', '7');
