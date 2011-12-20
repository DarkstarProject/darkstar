/*
Navicat MySQL Data Transfer

Source Server         : devserver
Source Server Version : 50517
Source Host           : localhost:3306
Source Database       : dspdb

Target Server Type    : MYSQL
Target Server Version : 50517
File Encoding         : 65001

Date: 2011-11-01 23:02:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `zone_settings`
-- ----------------------------
DROP TABLE IF EXISTS `zone_settings`;
CREATE TABLE `zone_settings` (
  `zoneid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `zoneip` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `zoneport` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` tinytext NOT NULL,
  `music` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `battlesolo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `battlemulti` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `restriction` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `tax` float(5,2) unsigned NOT NULL DEFAULT '0.00',
  `misc` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`zoneid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=20 PACK_KEYS=1 CHECKSUM=1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of zone_settings
-- ----------------------------
INSERT INTO `zone_settings` VALUES ('0', '0221762314', '54230', 'Residential_Area', '0', '0', '0', '0', '0.00', '32');
INSERT INTO `zone_settings` VALUES ('1', '0221762314', '54230', 'Phanauet_Channel', '229', '218', '219', '0', '0.00', '152');
INSERT INTO `zone_settings` VALUES ('2', '0221762314', '54230', 'Carpenters_Landing', '0', '218', '219', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('3', '0221762314', '54230', 'Manaclipper', '229', '218', '219', '0', '0.00', '152');
INSERT INTO `zone_settings` VALUES ('4', '0221762314', '54230', 'Bibiki_Bay', '0', '218', '219', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('5', '0221762314', '54230', 'Uleguerand_Range', '0', '218', '219', '0', '0.00', '152');
INSERT INTO `zone_settings` VALUES ('6', '0221762314', '54230', 'Bearclaw_Pinnacle', '220', '220', '220', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('7', '0221762314', '54230', 'Attohwa_Chasm', '0', '218', '219', '0', '0.00', '152');
INSERT INTO `zone_settings` VALUES ('8', '0221762314', '54230', 'Boneyard_Gully', '0', '220', '220', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('9', '0221762314', '54230', 'PsoXja', '225', '218', '219', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('10', '0221762314', '54230', 'The_Shrouded_Maw', '0', '220', '220', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('11', '0221762314', '54230', 'Oldton_Movalpolos', '221', '218', '219', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('12', '0221762314', '54230', 'Newton_Movalpolos', '221', '218', '219', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('13', '0221762314', '54230', 'Mine_Shaft_2716', '0', '220', '220', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('14', '0221762314', '54230', 'Hall_of_Transference', '0', '218', '219', '0', '0.00', '8');
INSERT INTO `zone_settings` VALUES ('15', '0221762314', '54230', 'Abyssea-Konschtat', '51', '52', '52', '0', '0.00', '0');
INSERT INTO `zone_settings` VALUES ('16', '0221762314', '54230', 'Promyvion-Holla', '222', '218', '219', '30', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('17', '0221762314', '54230', 'Spire_of_Holla', '0', '220', '220', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('18', '0221762314', '54230', 'Promyvion-Dem', '222', '218', '219', '30', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('19', '0221762314', '54230', 'Spire_of_Dem', '0', '220', '220', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('20', '0221762314', '54230', 'Promyvion-Mea', '222', '218', '219', '30', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('21', '0221762314', '54230', 'Spire_of_Mea', '0', '220', '220', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('22', '0221762314', '54230', 'Promyvion-Vahzl', '222', '218', '219', '50', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('23', '0221762314', '54230', 'Spire_of_Vahzl', '0', '220', '220', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('24', '0221762314', '54230', 'Lufaise_Meadows', '230', '218', '219', '0', '0.00', '152');
INSERT INTO `zone_settings` VALUES ('25', '0221762314', '54230', 'Misareaux_Coast', '230', '218', '219', '0', '0.00', '152');
INSERT INTO `zone_settings` VALUES ('26', '0221762314', '54230', 'Tavnazian_Safehold', '245', '218', '219', '0', '0.00', '40');
INSERT INTO `zone_settings` VALUES ('27', '0221762314', '54230', 'Phomiuna_Aqueducts', '0', '218', '219', '40', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('28', '0221762314', '54230', 'Sacrarium', '0', '218', '219', '50', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('29', '0221762314', '54230', 'Riverne-Site_B01', '0', '218', '219', '50', '0.00', '153');
INSERT INTO `zone_settings` VALUES ('30', '0221762314', '54230', 'Riverne-Site_A01', '0', '218', '219', '40', '0.00', '153');
INSERT INTO `zone_settings` VALUES ('31', '0221762314', '54230', 'Monarch_Linn', '0', '220', '220', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('32', '0221762314', '54230', 'Sealions_Den', '0', '218', '219', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('33', '0221762314', '54230', 'AlTaieu', '233', '218', '219', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('34', '0221762314', '54230', 'Grand_Palace_of_HuXzoi', '228', '218', '219', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('35', '0221762314', '54230', 'The_Garden_of_RuHmet', '228', '218', '219', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('36', '0221762314', '54230', 'Empyreal_Paradox', '0', '220', '220', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('37', '0221762314', '54230', 'Temenos', '0', '218', '219', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('38', '0221762314', '54230', 'Apollyon', '0', '218', '219', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('39', '0221762314', '54230', 'Dynamis-Valkurm', '121', '218', '219', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('40', '0221762314', '54230', 'Dynamis-Buburimu', '121', '218', '219', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('41', '0221762314', '54230', 'Dynamis-Qufim', '121', '218', '219', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('42', '0221762314', '54230', 'Dynamis-Tavnazia', '121', '218', '219', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('43', '0221762314', '54230', 'Diorama_Abdhaljs-Ghelsba', '0', '218', '219', '0', '0.00', '152');
INSERT INTO `zone_settings` VALUES ('44', '0221762314', '54230', 'Abdhaljs_Isle-Purgonorgo', '0', '218', '219', '0', '0.00', '152');
INSERT INTO `zone_settings` VALUES ('45', '0221762314', '54230', 'Abyssea-Tahrongi', '51', '52', '52', '0', '0.00', '0');
INSERT INTO `zone_settings` VALUES ('46', '0221762314', '54230', 'Open_sea_route_to_Al_Zahbi', '147', '139', '139', '0', '0.00', '152');
INSERT INTO `zone_settings` VALUES ('47', '0221762314', '54230', 'Open_sea_route_to_Mhaura', '147', '139', '139', '0', '0.00', '152');
INSERT INTO `zone_settings` VALUES ('48', '0221762314', '54230', 'Al_Zahbi', '178', '139', '139', '0', '0.00', '24');
INSERT INTO `zone_settings` VALUES ('49', '0221762314', '0', 'noname', '0', '0', '0', '0', '0.00', '0');
INSERT INTO `zone_settings` VALUES ('50', '0221762314', '54230', 'Aht_Urhgan_Whitegate', '178', '139', '139', '0', '0.00', '8');
INSERT INTO `zone_settings` VALUES ('51', '0221762314', '54230', 'Wajaom_Woodlands', '149', '139', '139', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('52', '0221762314', '54230', 'Bhaflau_Thickets', '149', '139', '139', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('53', '0221762314', '54230', 'Nashmau', '175', '139', '139', '0', '0.00', '40');
INSERT INTO `zone_settings` VALUES ('54', '0221762314', '54230', 'Arrapago_Reef', '150', '138', '138', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('55', '0221762314', '54230', 'Ilrusi_Atoll', '0', '138', '138', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('56', '0221762314', '54230', 'Periqia', '0', '138', '138', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('57', '0221762314', '54230', 'Talacca_Cove', '0', '143', '143', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('58', '0221762314', '54230', 'Silver_Sea_route_to_Nashmau', '147', '139', '139', '0', '0.00', '16');
INSERT INTO `zone_settings` VALUES ('59', '0221762314', '54230', 'Silver_Sea_route_to_Al_Zahbi', '147', '139', '139', '0', '0.00', '16');
INSERT INTO `zone_settings` VALUES ('60', '0221762314', '54230', 'The_Ashu_Talif', '172', '143', '143', '0', '0.00', '0');
INSERT INTO `zone_settings` VALUES ('61', '0221762314', '54230', 'Mount_Zhayolm', '0', '139', '139', '0', '0.00', '256');
INSERT INTO `zone_settings` VALUES ('62', '0221762314', '54230', 'Halvung', '0', '138', '138', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('63', '0221762314', '54230', 'Lebros_Cavern', '0', '138', '138', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('64', '0221762314', '54230', 'Navukgo_Execution_Chamber', '0', '143', '143', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('65', '0221762314', '54230', 'Mamook', '0', '138', '138', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('66', '0221762314', '54230', 'Mamool_Ja_Training_Grounds', '0', '138', '138', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('67', '0221762314', '54230', 'Jade_Sepulcher', '0', '143', '143', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('68', '0221762314', '54230', 'Aydeewa_Subterrane', '174', '138', '138', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('69', '0221762314', '54230', 'Leujaoam_Sanctum', '0', '138', '138', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('70', '0221762314', '54230', 'Chocobo_Circuit', '176', '139', '139', '0', '0.00', '4');
INSERT INTO `zone_settings` VALUES ('71', '0221762314', '54230', 'The_Colosseum', '0', '139', '139', '0', '0.00', '152');
INSERT INTO `zone_settings` VALUES ('72', '0221762314', '54230', 'Alzadaal_Undersea_Ruins', '0', '138', '138', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('73', '0221762314', '54230', 'Zhayolm_Remnants', '148', '138', '138', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('74', '0221762314', '54230', 'Arrapago_Remnants', '148', '138', '138', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('75', '0221762314', '54230', 'Bhaflau_Remnants', '148', '138', '138', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('76', '0221762314', '54230', 'Silver_Sea_Remnants', '148', '138', '138', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('77', '0221762314', '54230', 'Nyzul_Isle', '148', '138', '138', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('78', '0221762314', '54230', 'Hazhalm_Testing_Grounds', '0', '143', '143', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('79', '0221762314', '54230', 'Caedarva_Mire', '173', '139', '139', '0', '0.00', '152');
INSERT INTO `zone_settings` VALUES ('80', '0221762314', '54230', 'Southern_San_dOria_[S]', '254', '215', '215', '0', '0.00', '8');
INSERT INTO `zone_settings` VALUES ('81', '0221762314', '54230', 'East_Ronfaure_[S]', '251', '215', '215', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('82', '0221762314', '54230', 'Jugner_Forest_[S]', '0', '215', '215', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('83', '0221762314', '54230', 'Vunkerl_Inlet_[S]', '0', '215', '215', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('84', '0221762314', '54230', 'Batallia_Downs_[S]', '252', '215', '215', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('85', '0221762314', '54230', 'La_Vaule_[S]', '0', '216', '216', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('86', '0221762314', '54230', 'Everbloom_Hollow', '0', '216', '216', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('87', '0221762314', '54230', 'Bastok_Markets_[S]', '180', '215', '215', '0', '0.00', '8');
INSERT INTO `zone_settings` VALUES ('88', '0221762314', '54230', 'North_Gustaberg_[S]', '253', '215', '215', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('89', '0221762314', '54230', 'Grauberg_[S]', '0', '215', '215', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('90', '0221762314', '54230', 'Pashhow_Marshlands_[S]', '0', '215', '215', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('91', '0221762314', '54230', 'Rolanberry_Fields_[S]', '252', '215', '215', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('92', '0221762314', '54230', 'Beadeaux_[S]', '0', '216', '216', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('93', '0221762314', '54230', 'Ruhotz_Silvermines', '0', '216', '216', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('94', '0221762314', '54230', 'Windurst_Waters_[S]', '182', '215', '215', '0', '0.00', '8');
INSERT INTO `zone_settings` VALUES ('95', '0221762314', '54230', 'West_Sarutabaruta_[S]', '141', '215', '215', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('96', '0221762314', '54230', 'Fort_Karugo-Narugo_[S]', '0', '215', '215', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('97', '0221762314', '54230', 'Meriphataud_Mountains_[S]', '0', '215', '215', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('98', '0221762314', '54230', 'Sauromugue_Champaign_[S]', '252', '215', '215', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('99', '0221762314', '54230', 'Castle_Oztroja_[S]', '0', '216', '216', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('100', '0221762314', '54230', 'West_Ronfaure', '109', '101', '103', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('101', '0221762314', '54230', 'East_Ronfaure', '109', '101', '103', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('102', '0221762314', '54230', 'La_Theine_Plateau', '0', '101', '103', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('103', '0221762314', '54230', 'Valkurm_Dunes', '0', '101', '103', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('104', '0221762314', '54230', 'Jugner_Forest', '0', '101', '103', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('105', '0221762314', '54230', 'Batallia_Downs', '114', '101', '103', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('106', '0221762314', '54230', 'North_Gustaberg', '116', '101', '103', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('107', '0221762314', '54230', 'South_Gustaberg', '116', '101', '103', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('108', '0221762314', '54230', 'Konschtat_Highlands', '0', '101', '103', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('109', '0221762314', '54230', 'Pashhow_Marshlands', '0', '101', '103', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('110', '0221762314', '54230', 'Rolanberry_Fields', '118', '101', '103', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('111', '0221762314', '54230', 'Beaucedine_Glacier', '0', '101', '103', '0', '0.00', '152');
INSERT INTO `zone_settings` VALUES ('112', '0221762314', '54230', 'Xarcabard', '164', '101', '103', '0', '0.00', '152');
INSERT INTO `zone_settings` VALUES ('113', '0221762314', '54230', 'Cape_Teriggan', '0', '191', '191', '0', '0.00', '152');
INSERT INTO `zone_settings` VALUES ('114', '0221762314', '54230', 'Eastern_Altepa_Desert', '171', '191', '191', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('115', '0221762314', '54230', 'West_Sarutabaruta', '113', '101', '103', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('116', '0221762314', '54230', 'East_Sarutabaruta', '113', '101', '103', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('117', '0221762314', '54230', 'Tahrongi_Canyon', '0', '101', '103', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('118', '0221762314', '54230', 'Buburimu_Peninsula', '0', '101', '103', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('119', '0221762314', '54230', 'Meriphataud_Mountains', '0', '101', '103', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('120', '0221762314', '54230', 'Sauromugue_Champaign', '158', '101', '103', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('121', '0221762314', '54230', 'The_Sanctuary_of_ZiTah', '190', '191', '191', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('122', '0221762314', '54230', 'RoMaeve', '211', '191', '191', '0', '0.00', '152');
INSERT INTO `zone_settings` VALUES ('123', '0221762314', '54230', 'Yuhtunga_Jungle', '134', '191', '191', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('124', '0221762314', '54230', 'Yhoator_Jungle', '134', '191', '191', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('125', '0221762314', '54230', 'Western_Altepa_Desert', '171', '191', '191', '0', '0.00', '156');
INSERT INTO `zone_settings` VALUES ('126', '0221762314', '54230', 'Qufim_Island', '0', '101', '103', '0', '0.00', '152');
INSERT INTO `zone_settings` VALUES ('127', '0221762314', '54230', 'Behemoths_Dominion', '0', '101', '103', '0', '0.00', '152');
INSERT INTO `zone_settings` VALUES ('128', '0221762314', '54230', 'Valley_of_Sorrows', '0', '191', '191', '0', '0.00', '152');
INSERT INTO `zone_settings` VALUES ('129', '0221762314', '54230', 'Ghoyus_Reverie', '0', '216', '216', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('130', '0221762314', '54230', 'RuAun_Gardens', '210', '191', '191', '0', '0.00', '152');
INSERT INTO `zone_settings` VALUES ('131', '0221762314', '54230', 'Mordion_Gaol', '0', '101', '103', '0', '0.00', '0');
INSERT INTO `zone_settings` VALUES ('132', '0221762314', '54230', 'Abyssea-La_Theine', '51', '52', '52', '0', '0.00', '0');
INSERT INTO `zone_settings` VALUES ('133', '0221762314', '0', 'noname', '0', '0', '0', '0', '0.00', '0');
INSERT INTO `zone_settings` VALUES ('134', '0221762314', '54230', 'Dynamis-Beaucedine', '121', '115', '102', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('135', '0221762314', '54230', 'Dynamis-Xarcabard', '119', '115', '102', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('136', '0221762314', '54230', 'Beaucedine_Glacier_[S]', '0', '215', '215', '0', '0.00', '152');
INSERT INTO `zone_settings` VALUES ('137', '0221762314', '54230', 'Xarcabard_[S]', '0', '215', '215', '0', '0.00', '152');
INSERT INTO `zone_settings` VALUES ('138', '0221762314', '54230', 'Castle_Zvahl_Baileys_[S]', '0', '216', '216', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('139', '0221762314', '54230', 'Horlais_Peak', '0', '125', '125', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('140', '0221762314', '54230', 'Ghelsba_Outpost', '0', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('141', '0221762314', '54230', 'Fort_Ghelsba', '0', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('142', '0221762314', '54230', 'Yughott_Grotto', '0', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('143', '0221762314', '54230', 'Palborough_Mines', '0', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('144', '0221762314', '54230', 'Waughroon_Shrine', '125', '125', '125', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('145', '0221762314', '54230', 'Giddeus', '0', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('146', '0221762314', '54230', 'Balgas_Dais', '0', '125', '125', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('147', '0221762314', '54230', 'Beadeaux', '0', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('148', '0221762314', '54230', 'Qulun_Dome', '0', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('149', '0221762314', '54230', 'Davoi', '0', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('150', '0221762314', '54230', 'Monastic_Cavern', '0', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('151', '0221762314', '54230', 'Castle_Oztroja', '0', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('152', '0221762314', '54230', 'Altar_Room', '0', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('153', '0221762314', '54230', 'The_Boyahda_Tree', '0', '192', '192', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('154', '0221762314', '54230', 'Dragons_Aery', '0', '192', '192', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('155', '0221762314', '54230', 'Castle_Zvahl_Keep_[S]', '0', '216', '216', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('156', '0221762314', '54230', 'Throne_Room_[S]', '0', '217', '217', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('157', '0221762314', '54230', 'Middle_Delkfutts_Tower', '0', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('158', '0221762314', '54230', 'Upper_Delkfutts_Tower', '0', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('159', '0221762314', '54230', 'Temple_of_Uggalepih', '0', '192', '192', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('160', '0221762314', '54230', 'Den_of_Rancor', '0', '192', '192', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('161', '0221762314', '54230', 'Castle_Zvahl_Baileys', '155', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('162', '0221762314', '54230', 'Castle_Zvahl_Keep', '155', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('163', '0221762314', '54230', 'Sacrificial_Chamber', '193', '193', '193', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('164', '0221762314', '54230', 'Garlaige_Citadel_[S]', '0', '216', '216', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('165', '0221762314', '54230', 'Throne_Room', '0', '125', '125', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('166', '0221762314', '54230', 'Ranguemont_Pass', '0', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('167', '0221762314', '54230', 'Bostaunieux_Oubliette', '0', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('168', '0221762314', '54230', 'Chamber_of_Oracles', '193', '193', '193', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('169', '0221762314', '54230', 'Toraimarai_Canal', '0', '192', '192', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('170', '0221762314', '54230', 'Full_Moon_Fountain', '193', '193', '193', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('171', '0221762314', '54230', 'Crawlers_Nest_[S]', '0', '216', '216', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('172', '0221762314', '54230', 'Zeruhn_Mines', '0', '115', '102', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('173', '0221762314', '54230', 'Korroloka_Tunnel', '0', '192', '192', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('174', '0221762314', '54230', 'Kuftal_Tunnel', '0', '192', '192', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('175', '0221762314', '54230', 'The_Eldieme_Necropolis_[S]', '0', '216', '216', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('176', '0221762314', '54230', 'Sea_Serpent_Grotto', '0', '192', '192', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('177', '0221762314', '54230', 'VeLugannon_Palace', '207', '192', '192', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('178', '0221762314', '54230', 'The_Shrine_of_RuAvitau', '0', '192', '192', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('179', '0221762314', '54230', 'Stellar_Fulcrum', '193', '193', '193', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('180', '0221762314', '54230', 'LaLoff_Amphitheater', '0', '193', '193', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('181', '0221762314', '54230', 'The_Celestial_Nexus', '0', '193', '193', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('182', '0221762314', '54230', 'Walk_of_Echoes', '0', '215', '215', '0', '0.00', '0');
INSERT INTO `zone_settings` VALUES ('183', '0221762314', '54230', 'The_Last_Stand', '0', '143', '143', '0', '0.00', '0');
INSERT INTO `zone_settings` VALUES ('184', '0221762314', '54230', 'Lower_Delkfutts_Tower', '0', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('185', '0221762314', '54230', 'Dynamis-San_dOria', '121', '115', '102', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('186', '0221762314', '54230', 'Dynamis-Bastok', '121', '115', '102', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('187', '0221762314', '54230', 'Dynamis-Windurst', '121', '115', '102', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('188', '0221762314', '54230', 'Dynamis-Jeuno', '121', '115', '102', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('189', '0221762314', '0', 'noname', '0', '0', '0', '0', '0.00', '0');
INSERT INTO `zone_settings` VALUES ('190', '0221762314', '54230', 'King_Ranperres_Tomb', '0', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('191', '0221762314', '54230', 'Dangruf_Wadi', '0', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('192', '0221762314', '54230', 'Inner_Horutoto_Ruins', '0', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('193', '0221762314', '54230', 'Ordelles_Caves', '0', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('194', '0221762314', '54230', 'Outer_Horutoto_Ruins', '0', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('195', '0221762314', '54230', 'The_Eldieme_Necropolis', '0', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('196', '0221762314', '54230', 'Gusgen_Mines', '0', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('197', '0221762314', '54230', 'Crawlers_Nest', '0', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('198', '0221762314', '54230', 'Maze_of_Shakhrami', '0', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('199', '0221762314', '0', 'noname', '0', '0', '0', '0', '0.00', '0');
INSERT INTO `zone_settings` VALUES ('200', '0221762314', '54230', 'Garlaige_Citadel', '0', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('201', '0221762314', '54230', 'Cloister_of_Gales', '193', '193', '193', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('202', '0221762314', '54230', 'Cloister_of_Storms', '193', '193', '193', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('203', '0221762314', '54230', 'Cloister_of_Frost', '193', '193', '193', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('204', '0221762314', '54230', 'FeiYin', '0', '115', '102', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('205', '0221762314', '54230', 'Ifrits_Cauldron', '0', '192', '192', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('206', '0221762314', '54230', 'QuBia_Arena', '125', '125', '125', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('207', '0221762314', '54230', 'Cloister_of_Flames', '193', '193', '193', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('208', '0221762314', '54230', 'Quicksand_Caves', '0', '192', '192', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('209', '0221762314', '54230', 'Cloister_of_Tremors', '193', '193', '193', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('210', '0221762314', '0', 'noname', '0', '0', '0', '0', '0.00', '0');
INSERT INTO `zone_settings` VALUES ('211', '0221762314', '54230', 'Cloister_of_Tides', '193', '193', '193', '0', '0.00', '144');
INSERT INTO `zone_settings` VALUES ('212', '0221762314', '54230', 'Gustav_Tunnel', '0', '192', '192', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('213', '0221762314', '54230', 'Labyrinth_of_Onzozo', '0', '192', '192', '0', '0.00', '145');
INSERT INTO `zone_settings` VALUES ('214', '0221762314', '54230', 'Residential_Area', '0', '0', '0', '0', '0.00', '32');
INSERT INTO `zone_settings` VALUES ('215', '0221762314', '54230', 'Abyssea-Attohwa', '51', '52', '52', '0', '0.00', '0');
INSERT INTO `zone_settings` VALUES ('216', '0221762314', '54230', 'Abyssea-Misareaux', '51', '52', '52', '0', '0.00', '0');
INSERT INTO `zone_settings` VALUES ('217', '0221762314', '54230', 'Abyssea-Vunkerl', '51', '52', '52', '0', '0.00', '0');
INSERT INTO `zone_settings` VALUES ('218', '0221762314', '54230', 'Abyssea-Altepa', '51', '52', '52', '0', '0.00', '0');
INSERT INTO `zone_settings` VALUES ('219', '0221762314', '0', 'noname', '0', '0', '0', '0', '0.00', '0');
INSERT INTO `zone_settings` VALUES ('220', '0221762314', '54230', 'Ship_bound_for_Selbina', '106', '101', '103', '0', '0.00', '152');
INSERT INTO `zone_settings` VALUES ('221', '0221762314', '54230', 'Ship_bound_for_Mhaura', '106', '101', '103', '0', '0.00', '152');
INSERT INTO `zone_settings` VALUES ('222', '0221762314', '0', 'noname', '0', '0', '0', '0', '0.00', '0');
INSERT INTO `zone_settings` VALUES ('223', '0221762314', '54230', 'San_dOria-Jeuno_Airship', '128', '101', '103', '0', '0.00', '8');
INSERT INTO `zone_settings` VALUES ('224', '0221762314', '54230', 'Bastok-Jeuno_Airship', '128', '101', '103', '0', '0.00', '8');
INSERT INTO `zone_settings` VALUES ('225', '0221762314', '54230', 'Windurst-Jeuno_Airship', '128', '101', '103', '0', '0.00', '8');
INSERT INTO `zone_settings` VALUES ('226', '0221762314', '54230', 'Kazham-Jeuno_Airship', '128', '191', '191', '0', '0.00', '8');
INSERT INTO `zone_settings` VALUES ('227', '0221762314', '54230', 'Ship_bound_for_Selbina', '106', '101', '103', '0', '0.00', '152');
INSERT INTO `zone_settings` VALUES ('228', '0221762314', '54230', 'Ship_bound_for_Mhaura', '106', '101', '103', '0', '0.00', '152');
INSERT INTO `zone_settings` VALUES ('229', '0221762314', '0', 'noname', '0', '0', '0', '0', '0.00', '0');
INSERT INTO `zone_settings` VALUES ('230', '0221762314', '54230', 'Southern_San_dOria', '107', '101', '103', '0', '0.00', '8');
INSERT INTO `zone_settings` VALUES ('231', '0221762314', '54230', 'Northern_San_dOria', '107', '101', '103', '0', '0.00', '8');
INSERT INTO `zone_settings` VALUES ('232', '0221762314', '54230', 'Port_San_dOria', '107', '101', '103', '0', '0.00', '8');
INSERT INTO `zone_settings` VALUES ('233', '0221762314', '54230', 'Chateau_dOraguille', '156', '101', '103', '0', '0.00', '8');
INSERT INTO `zone_settings` VALUES ('234', '0221762314', '54230', 'Bastok_Mines', '152', '101', '103', '0', '0.00', '8');
INSERT INTO `zone_settings` VALUES ('235', '0221762314', '54230', 'Bastok_Markets', '152', '101', '103', '0', '0.00', '8');
INSERT INTO `zone_settings` VALUES ('236', '0221762314', '54230', 'Port_Bastok', '152', '101', '103', '0', '0.00', '8');
INSERT INTO `zone_settings` VALUES ('237', '0221762314', '54230', 'Metalworks', '154', '101', '103', '0', '0.00', '8');
INSERT INTO `zone_settings` VALUES ('238', '0221762314', '54230', 'Windurst_Waters', '151', '101', '103', '0', '0.00', '8');
INSERT INTO `zone_settings` VALUES ('239', '0221762314', '54230', 'Windurst_Walls', '151', '101', '103', '0', '0.00', '8');
INSERT INTO `zone_settings` VALUES ('240', '0221762314', '54230', 'Port_Windurst', '151', '101', '103', '0', '0.00', '8');
INSERT INTO `zone_settings` VALUES ('241', '0221762314', '54230', 'Windurst_Woods', '151', '101', '103', '0', '0.00', '8');
INSERT INTO `zone_settings` VALUES ('242', '0221762314', '54230', 'Heavens_Tower', '162', '101', '103', '0', '0.00', '8');
INSERT INTO `zone_settings` VALUES ('243', '0221762314', '54230', 'RuLude_Gardens', '117', '101', '103', '0', '0.00', '8');
INSERT INTO `zone_settings` VALUES ('244', '0221762314', '54230', 'Upper_Jeuno', '110', '101', '103', '0', '0.00', '8');
INSERT INTO `zone_settings` VALUES ('245', '0221762314', '54230', 'Lower_Jeuno', '110', '101', '103', '0', '0.00', '8');
INSERT INTO `zone_settings` VALUES ('246', '0221762314', '54230', 'Port_Jeuno', '110', '101', '103', '0', '0.00', '8');
INSERT INTO `zone_settings` VALUES ('247', '0221762314', '54230', 'Rabao', '208', '191', '191', '0', '0.00', '40');
INSERT INTO `zone_settings` VALUES ('248', '0221762314', '54230', 'Selbina', '112', '101', '103', '0', '0.00', '40');
INSERT INTO `zone_settings` VALUES ('249', '0221762314', '54230', 'Mhaura', '105', '101', '103', '0', '0.00', '40');
INSERT INTO `zone_settings` VALUES ('250', '0221762314', '54230', 'Kazham', '135', '191', '191', '0', '0.00', '40');
INSERT INTO `zone_settings` VALUES ('251', '0221762314', '54230', 'Hall_of_the_Gods', '213', '191', '191', '0', '0.00', '8');
INSERT INTO `zone_settings` VALUES ('252', '0221762314', '54230', 'Norg', '209', '191', '191', '0', '0.00', '40');
INSERT INTO `zone_settings` VALUES ('253', '0221762314', '54230', 'Abyssea-Uleguerand', '51', '52', '52', '0', '0.00', '0');
INSERT INTO `zone_settings` VALUES ('254', '0221762314', '54230', 'Abyssea-Grauberg', '51', '52', '52', '0', '0.00', '0');
INSERT INTO `zone_settings` VALUES ('255', '0221762314', '54230', 'Abyssea-Empyreal_Paradox', '51', '52', '52', '0', '0.00', '0');
