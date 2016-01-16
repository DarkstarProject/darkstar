/*
Navicat MySQL Data Transfer

Source Server         : DarkStar
Source Server Version : 50516
Source Host           : localhost:3306
Source Database       : dspdb

Target Server Type    : MYSQL
Target Server Version : 50516
File Encoding         : 65001

Date: 2012-05-19 17:40:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `server_variables`
-- ----------------------------
DROP TABLE IF EXISTS `server_variables`;
CREATE TABLE `server_variables` (
  `name` varchar(50) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of server_variables
-- ----------------------------
INSERT INTO `server_variables` VALUES ('[BF]Save_The_Children_record', '14');
INSERT INTO `server_variables` VALUES ('[BF]The_Holy_Crest_record', '600');
INSERT INTO `server_variables` VALUES ('[BF]Mission_2-3_Horlais_Peak_record', '600');
INSERT INTO `server_variables` VALUES ('[BF]Mission_2-3_Balgas_Dais_record', '18');
INSERT INTO `server_variables` VALUES ('[BF]Mission_2-3_Waughroon_record', '600');
INSERT INTO `server_variables` VALUES ('[BF]Shattering_Stars_job1_record', '600');
INSERT INTO `server_variables` VALUES ('[BF]Shattering_Stars_job2_record', '600');
INSERT INTO `server_variables` VALUES ('[BF]Shattering_Stars_job3_record', '600');
INSERT INTO `server_variables` VALUES ('[BF]Shattering_Stars_job4_record', '600');
INSERT INTO `server_variables` VALUES ('[BF]Shattering_Stars_job5_record', '600');
INSERT INTO `server_variables` VALUES ('[BF]Shattering_Stars_job6_record', '600');
INSERT INTO `server_variables` VALUES ('[BF]Shattering_Stars_job7_record', '600');
INSERT INTO `server_variables` VALUES ('[BF]Shattering_Stars_job8_record', '600');
INSERT INTO `server_variables` VALUES ('[BF]Shattering_Stars_job9_record', '600');
INSERT INTO `server_variables` VALUES ('[BF]Shattering_Stars_job10_record', '600');
INSERT INTO `server_variables` VALUES ('[BF]Shattering_Stars_job11_record', '600');
INSERT INTO `server_variables` VALUES ('[BF]Shattering_Stars_job12_record', '600');
INSERT INTO `server_variables` VALUES ('[BF]Shattering_Stars_job13_record', '600');
INSERT INTO `server_variables` VALUES ('[BF]Shattering_Stars_job14_record', '600');
INSERT INTO `server_variables` VALUES ('[BF]Shattering_Stars_job15_record', '600');
INSERT INTO `server_variables` VALUES ('[BF]Zilart_Mission_4_record', '600');
INSERT INTO `server_variables` VALUES ('Main-to-Seiryu-BlueTeleport', '0');
INSERT INTO `server_variables` VALUES ('Seiryu-to-Genbu-BlueTeleport', '0');
INSERT INTO `server_variables` VALUES ('Genbu-to-Byakko-BlueTeleport', '0');
INSERT INTO `server_variables` VALUES ('Byakko-to-Suzaku-BlueTeleport', '0');
INSERT INTO `server_variables` VALUES ('Suzaku-to-Main-BlueTeleport', '0');
INSERT INTO `server_variables` VALUES ('Main-to-Suzaku-BlueTeleport', '0');
INSERT INTO `server_variables` VALUES ('Suzaku-to-Byakko-BlueTeleport', '0');
INSERT INTO `server_variables` VALUES ('Byakko-to-Genbu-BlueTeleport', '0');
INSERT INTO `server_variables` VALUES ('Genbu-to-Seiryu-BlueTeleport', '0');
INSERT INTO `server_variables` VALUES ('Seiryu-to-Main-BlueTeleport', '0');
INSERT INTO `server_variables` VALUES ('[TEMP]Respawn_qm1_for_curtana', '0');
INSERT INTO `server_variables` VALUES ('[TEMP]Respawn_qm1_for_rattle', '0');
INSERT INTO `server_variables` VALUES ('[TEMP]Respawn_qm2_for_offering', '0');
INSERT INTO `server_variables` VALUES ('[TEMP]Respawn_qm3_for_whistle', '0');
INSERT INTO `server_variables` VALUES ('[POP]Beryl-footed_Molberry', '0');
INSERT INTO `server_variables` VALUES ('[POP]Crimson-toothed_Pawberry', '0');
INSERT INTO `server_variables` VALUES ('[LANTERN]_rancor_nw_last_lit', '0');
INSERT INTO `server_variables` VALUES ('[LANTERN]_rancor_ne_last_lit', '0');
INSERT INTO `server_variables` VALUES ('[LANTERN]_rancor_sw_last_lit', '0');
INSERT INTO `server_variables` VALUES ('[LANTERN]_rancor_se_last_lit', '0');
INSERT INTO `server_variables` VALUES ('[ZM4]Fire_Headstone_Active', '0');
INSERT INTO `server_variables` VALUES ('[ZM4]Wind_Headstone_Active', '0');
INSERT INTO `server_variables` VALUES ('[ZM4]Lightning_Headstone_Active', '0');
INSERT INTO `server_variables` VALUES ('[ZM4]Light_Headstone_Active', '0');
INSERT INTO `server_variables` VALUES ('[BF]Mission_5-1_Enter', '0');
INSERT INTO `server_variables` VALUES ('[BF]Mission_5-1_QuBia_Arena_record', '15');
