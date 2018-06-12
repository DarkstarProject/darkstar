-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: dspdb
-- ------------------------------------------------------
-- Server version	5.5.5-10.0.20-MariaDB

--
-- Table structure for table `abilities`
--

DROP TABLE IF EXISTS `abilities`;
CREATE TABLE `abilities` (
  `abilityId` smallint(5) unsigned NOT NULL,
  `name` tinytext,
  `job` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '0',
--
-- `validTarget` values:
--   0   0   0   0   0   0   0
--  NPC DED PLY PAL ENM PAR SLF
--  e.g. 3 is Self and Player Party. 4 is Enemy only. etc. 
--
  `validTarget` smallint(3) unsigned NOT NULL DEFAULT '0', 
  `recastTime` smallint(5) unsigned NOT NULL DEFAULT '0',
  `recastId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `message1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `message2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `animation` smallint(5) unsigned NOT NULL DEFAULT '0',
  `animationTime` smallint(4) unsigned NOT NULL DEFAULT '0',
  `castTime` smallint(4) unsigned NOT NULL DEFAULT '0',
  `actionType` tinyint(2) unsigned NOT NULL DEFAULT '6',
  `range` float(3,1) unsigned NOT NULL DEFAULT '0.0',
  `isAOE` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `CE` smallint(5) NOT NULL DEFAULT '0', -- Cumulative Enmity
  `VE` smallint(5) NOT NULL DEFAULT '0', -- Volatile Enmity
  `meritModID` smallint(4) NOT NULL DEFAULT '0',
  `addType` smallint(2) NOT NULL DEFAULT '0',
  `content_tag` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`abilityId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=56;

--
-- Dumping data for table `abilities`
--
-- ORDER BY:  `abilityId`

INSERT INTO `abilities` VALUES (0,'mighty_strikes',1,0,1,3600,0,0,0,33,2000,0,6,20.0,0,1,300,0,0,NULL);
INSERT INTO `abilities` VALUES (1,'hundred_fists',2,0,1,3600,0,0,0,34,2000,0,6,20.0,0,1,300,0,0,NULL);
INSERT INTO `abilities` VALUES (2,'benediction',3,0,1,3600,0,102,0,35,2000,0,6,20.0,1,0,0,0,0,NULL);
INSERT INTO `abilities` VALUES (3,'manafont',4,0,1,3600,0,0,0,36,2000,0,6,20.0,0,1,0,0,0,NULL);
INSERT INTO `abilities` VALUES (4,'chainspell',5,0,1,3600,0,0,0,37,2000,0,6,20.0,0,1,0,0,0,NULL);
INSERT INTO `abilities` VALUES (5,'perfect_dodge',6,0,1,3600,0,0,0,38,2000,0,6,20.0,0,1,0,0,0,NULL);
INSERT INTO `abilities` VALUES (6,'invincible',7,0,1,3600,0,0,0,18,2000,0,6,20.0,0,1,7200,0,0,NULL);
INSERT INTO `abilities` VALUES (7,'blood_weapon',8,0,1,3600,0,0,0,19,2000,0,6,20.0,0,1,80,0,0,NULL);
INSERT INTO `abilities` VALUES (8,'familiar',9,0,1,3600,0,0,0,39,2000,0,6,20.0,0,0,0,0,0,NULL);
INSERT INTO `abilities` VALUES (9,'soul_voice',10,0,1,3600,0,0,0,40,2000,0,6,20.0,0,1,0,0,0,NULL);
INSERT INTO `abilities` VALUES (10,'eagle_eye_shot',11,0,4,3600,0,110,0,186,2000,0,3,20.0,0,0,0,0,0,NULL);
INSERT INTO `abilities` VALUES (11,'meikyo_shisui',12,0,1,3600,0,0,0,96,2000,0,6,20.0,0,1,300,0,0,NULL);
INSERT INTO `abilities` VALUES (12,'mijin_gakure',13,0,4,3600,0,110,0,93,2000,0,6,20.0,0,0,0,0,0,NULL);
INSERT INTO `abilities` VALUES (13,'spirit_surge',14,0,1,3600,0,0,0,97,2000,0,6,20.0,0,0,0,0,0,'COP');
INSERT INTO `abilities` VALUES (14,'astral_flow',15,0,1,3600,0,0,0,95,2000,0,6,20.0,0,0,0,0,0,NULL);
INSERT INTO `abilities` VALUES (15,'berserk',1,15,1,300,1,115,0,0,2000,0,6,20.0,0,1,80,384,0,NULL);
INSERT INTO `abilities` VALUES (16,'warcry',1,35,1,300,2,0,0,28,2000,0,6,20.0,1,1,300,388,0,NULL);
INSERT INTO `abilities` VALUES (17,'defender',1,25,1,180,3,117,0,1,2000,0,6,20.0,0,1,80,386,0,NULL);
INSERT INTO `abilities` VALUES (18,'aggressor',1,45,1,300,4,118,0,2,2000,0,6,20.0,0,1,80,390,0,NULL);
INSERT INTO `abilities` VALUES (19,'provoke',1,5,4,30,5,0,0,3,2000,0,6,18.0,0,1,1800,0,0,NULL);
INSERT INTO `abilities` VALUES (20,'focus',2,25,1,300,13,120,0,4,2000,0,6,20.0,0,1,300,448,0,NULL);
INSERT INTO `abilities` VALUES (21,'dodge',2,15,1,300,14,121,0,5,2000,0,6,20.0,0,1,300,450,0,NULL);
INSERT INTO `abilities` VALUES (22,'chakra',2,35,1,300,15,102,0,6,2000,0,6,20.0,0,1,300,452,0,NULL);
INSERT INTO `abilities` VALUES (23,'boost',2,5,1,15,16,116,0,7,2000,0,6,20.0,0,1,300,0,0,NULL);
INSERT INTO `abilities` VALUES (24,'counterstance',2,45,1,300,17,0,0,8,2000,0,6,20.0,0,1,900,0,0,NULL);
INSERT INTO `abilities` VALUES (25,'steal',6,5,4,300,60,125,0,181,2000,0,3,4.4,0,1,300,0,0,NULL);
INSERT INTO `abilities` VALUES (26,'flee',6,25,1,300,62,126,0,9,2000,0,6,20.0,0,1,80,704,0,NULL);
INSERT INTO `abilities` VALUES (27,'hide',6,45,1,300,63,0,0,10,2000,0,6,20.0,0,0,0,706,0,NULL);
INSERT INTO `abilities` VALUES (28,'sneak_attack',6,15,1,60,64,0,0,17,2000,0,6,20.0,0,1,0,708,0,NULL);
INSERT INTO `abilities` VALUES (29,'mug',6,35,4,300,65,129,0,183,2000,0,3,4.4,0,1,300,0,0,NULL);
INSERT INTO `abilities` VALUES (30,'shield_bash',7,15,4,180,73,0,0,185,2000,0,3,4.4,0,1,900,768,0,NULL);
INSERT INTO `abilities` VALUES (31,'holy_circle',7,5,1,600,74,0,0,29,2000,0,6,20.0,1,1,20,770,0,NULL);
INSERT INTO `abilities` VALUES (32,'sentinel',7,30,1,300,75,0,0,11,2000,0,6,20.0,0,1,1800,772,0,NULL);
INSERT INTO `abilities` VALUES (33,'souleater',8,30,1,360,85,0,0,20,2000,0,6,20.0,0,1,1300,832,0,NULL);
INSERT INTO `abilities` VALUES (34,'arcane_circle',8,5,1,600,86,0,0,30,2000,0,6,20.0,1,1,20,834,0,NULL);
INSERT INTO `abilities` VALUES (35,'last_resort',8,15,1,300,87,0,0,12,2000,0,6,20.0,0,1,1300,836,0,NULL);
INSERT INTO `abilities` VALUES (36,'charm',9,1,4,15,97,0,0,13,2000,0,6,18.0,0,320,0,0,0,NULL);
INSERT INTO `abilities` VALUES (37,'gauge',9,10,4,30,98,0,0,14,2000,0,6,23.0,0,0,0,0,0,NULL);
INSERT INTO `abilities` VALUES (38,'tame',9,30,4,600,99,0,0,15,2000,0,6,18.0,0,0,0,904,0,NULL);
INSERT INTO `abilities` VALUES (39,'pet_commands',9,1,1,0,0,0,0,0,2000,0,6,18.0,0,0,0,0,0,NULL);
INSERT INTO `abilities` VALUES (40,'scavenge',11,10,1,180,121,0,0,21,2000,0,6,20.0,0,1,80,1024,0,NULL);
INSERT INTO `abilities` VALUES (41,'shadowbind',11,40,4,300,122,0,0,188,2000,0,3,18.0,0,1,800,0,0,NULL);
INSERT INTO `abilities` VALUES (42,'camouflage',11,20,1,300,123,0,0,10,2000,0,6,20.0,0,1,80,1026,0,NULL);
INSERT INTO `abilities` VALUES (43,'sharpshot',11,1,1,300,124,0,0,22,2000,0,6,20.0,0,1,600,1028,0,NULL);
INSERT INTO `abilities` VALUES (44,'barrage',11,30,1,300,125,0,0,23,2000,0,6,20.0,0,1,600,0,0,NULL);
INSERT INTO `abilities` VALUES (45,'call_wyvern',14,1,1,1200,163,0,0,94,2000,0,6,20.0,0,1,300,0,4,NULL);
INSERT INTO `abilities` VALUES (46,'third_eye',12,15,1,60,133,0,0,24,2000,0,6,20.0,0,1,0,1088,0,NULL);
INSERT INTO `abilities` VALUES (47,'meditate',12,30,1,180,134,0,0,25,2000,0,6,20.0,0,320,0,1094,0,NULL);
INSERT INTO `abilities` VALUES (48,'warding_circle',12,5,1,300,135,0,0,31,2000,0,6,20.0,1,1,20,1090,0,NULL);
INSERT INTO `abilities` VALUES (49,'ancient_circle',14,5,1,300,157,0,0,32,2000,0,6,20.0,1,1,20,1216,0,NULL);
INSERT INTO `abilities` VALUES (50,'jump',14,10,4,60,158,110,0,204,2000,0,3,9.5,0,0,0,1218,0,NULL);
INSERT INTO `abilities` VALUES (51,'high_jump',14,35,4,120,159,110,0,209,2000,0,3,11.5,0,0,0,1220,0,NULL);
INSERT INTO `abilities` VALUES (52,'super_jump',14,50,4,180,160,110,0,214,2000,0,3,12.5,0,0,0,1221,0,NULL);
INSERT INTO `abilities` VALUES (53,'fight',9,1,4,10,100,0,0,83,2000,0,6,18.0,0,0,0,0,192,NULL);
INSERT INTO `abilities` VALUES (54,'heel',9,10,1,5,101,0,0,83,2000,0,6,18.0,0,0,0,0,192,NULL);
INSERT INTO `abilities` VALUES (55,'leave',9,35,1,10,101,0,0,83,2000,0,6,18.0,0,0,0,0,192,NULL);
INSERT INTO `abilities` VALUES (56,'sic',9,25,1,120,102,0,0,83,2000,0,6,18.0,0,0,0,902,128,NULL);
INSERT INTO `abilities` VALUES (57,'stay',9,15,1,5,101,0,0,83,2000,0,6,18.0,0,0,0,0,192,NULL);
INSERT INTO `abilities` VALUES (58,'divine_seal',3,15,1,600,26,0,0,81,2000,0,6,20.0,0,1,80,512,0,NULL);
INSERT INTO `abilities` VALUES (59,'elemental_seal',4,15,1,600,38,0,0,80,2000,0,6,20.0,0,1,80,576,0,NULL);
INSERT INTO `abilities` VALUES (60,'trick_attack',6,30,1,60,66,0,0,82,2000,0,6,20.0,0,0,0,710,0,NULL);
INSERT INTO `abilities` VALUES (61,'weapon_bash',8,20,4,180,88,0,0,201,2000,0,3,4.4,0,1,900,0,0,NULL);
INSERT INTO `abilities` VALUES (62,'reward',9,12,257,90,103,102,0,84,2000,0,6,18.0,0,0,0,898,0,NULL);
INSERT INTO `abilities` VALUES (63,'cover',7,35,2,180,76,0,0,86,2000,0,6,20.0,0,0,35,0,0,NULL);
INSERT INTO `abilities` VALUES (64,'spirit_link',14,25,1,90,162,0,0,94,2000,0,6,20.0,0,0,0,1224,4,NULL);
INSERT INTO `abilities` VALUES (66,'chi_blast',2,41,4,180,18,110,0,92,2000,0,6,20.0,0,0,0,0,0,NULL);
INSERT INTO `abilities` VALUES (67,'convert',5,40,1,600,49,0,0,88,2000,0,6,20.0,0,1,80,640,0,NULL);
INSERT INTO `abilities` VALUES (68,'accomplice',6,65,2,300,69,526,0,185,2000,0,6,20.0,0,0,0,0,0,'WOTG');
INSERT INTO `abilities` VALUES (69,'call_beast',9,23,1,300,104,0,0,83,2000,0,6,18.0,0,0,0,900,0,NULL);
INSERT INTO `abilities` VALUES (70,'unlimited_shot',11,51,1,180,126,0,0,90,2000,0,6,20.0,0,1,300,1030,0,NULL);
INSERT INTO `abilities` VALUES (71,'dismiss',14,1,1,300,161,0,0,94,2000,0,6,20.0,0,0,0,0,4,NULL);
INSERT INTO `abilities` VALUES (72,'assault',15,1,4,10,170,0,0,94,2000,0,6,20.0,0,0,0,0,256,NULL);
INSERT INTO `abilities` VALUES (73,'retreat',15,1,1,10,171,0,0,94,2000,0,6,20.0,0,-10,0,0,256,NULL);
INSERT INTO `abilities` VALUES (74,'release',15,1,1,10,172,0,0,94,2000,0,6,20.0,0,-10,0,0,256,NULL);
INSERT INTO `abilities` VALUES (75,'blood_pact_rage',15,1,1,60,173,0,0,0,2000,0,6,20.0,0,0,0,0,256,NULL);
INSERT INTO `abilities` VALUES (76,'rampart',7,62,1,300,77,0,0,91,2000,0,6,20.0,1,1,300,776,0,NULL);
INSERT INTO `abilities` VALUES (77,'azure_lore',16,0,1,3600,0,0,0,142,2000,0,6,20.0,0,1,300,0,0,'TOAU');
INSERT INTO `abilities` VALUES (78,'chain_affinity',16,40,1,120,181,0,0,140,2000,0,6,20.0,0,1,300,1344,0,'TOAU');
INSERT INTO `abilities` VALUES (79,'burst_affinity',16,25,1,120,182,0,0,141,2000,0,6,20.0,0,1,300,1346,0,'TOAU');
INSERT INTO `abilities` VALUES (80,'wild_card',17,0,1,3600,0,0,0,132,2000,0,6,20.0,1,1,300,0,0,'TOAU');
INSERT INTO `abilities` VALUES (81,'phantom_roll',17,5,1,60,193,0,0,0,2000,0,6,18.0,0,1,80,1408,0,'TOAU');
INSERT INTO `abilities` VALUES (82,'fighters_roll',17,49,1,60,193,420,0,98,2000,0,6,8.0,1,1,80,0,8,'TOAU');
INSERT INTO `abilities` VALUES (83,'monks_roll',17,31,1,60,193,420,0,99,2000,0,6,8.0,1,1,80,0,8,'TOAU');
INSERT INTO `abilities` VALUES (84,'healers_roll',17,20,1,60,193,420,0,100,2000,0,6,8.0,1,1,80,0,8,'TOAU');
INSERT INTO `abilities` VALUES (85,'wizards_roll',17,58,1,60,193,420,0,101,2000,0,6,8.0,1,1,80,0,8,'TOAU');
INSERT INTO `abilities` VALUES (86,'warlocks_roll',17,46,1,60,193,420,0,102,2000,0,6,8.0,1,1,80,0,8,'TOAU');
INSERT INTO `abilities` VALUES (87,'rogues_roll',17,43,1,60,193,420,0,103,2000,0,6,8.0,1,1,80,0,8,'TOAU');
INSERT INTO `abilities` VALUES (88,'gallants_roll',17,55,1,60,193,420,0,104,2000,0,6,8.0,1,1,80,0,8,'TOAU');
INSERT INTO `abilities` VALUES (89,'chaos_roll',17,14,1,60,193,420,0,105,2000,0,6,8.0,1,1,80,0,8,'TOAU');
INSERT INTO `abilities` VALUES (90,'beast_roll',17,34,1,60,193,420,0,106,2000,0,6,8.0,1,1,80,0,8,'TOAU');
INSERT INTO `abilities` VALUES (91,'choral_roll',17,26,1,60,193,420,0,107,2000,0,6,8.0,1,1,80,0,8,'TOAU');
INSERT INTO `abilities` VALUES (92,'hunters_roll',17,11,1,60,193,420,0,108,2000,0,6,8.0,1,1,80,0,8,'TOAU');
INSERT INTO `abilities` VALUES (93,'samurai_roll',17,34,1,60,193,420,0,109,2000,0,6,8.0,1,1,80,0,8,'TOAU');
INSERT INTO `abilities` VALUES (94,'ninja_roll',17,8,1,60,193,420,0,110,2000,0,6,8.0,1,1,80,0,8,'TOAU');
INSERT INTO `abilities` VALUES (95,'drachen_roll',17,23,1,60,193,420,0,111,2000,0,6,8.0,1,1,80,0,8,'TOAU');
INSERT INTO `abilities` VALUES (96,'evokers_roll',17,40,1,60,193,420,0,112,2000,0,6,8.0,1,1,80,0,8,'TOAU');
INSERT INTO `abilities` VALUES (97,'maguss_roll',17,17,1,60,193,420,0,113,2000,0,6,8.0,1,1,80,0,8,'TOAU');
INSERT INTO `abilities` VALUES (98,'corsairs_roll',17,5,1,60,193,420,0,114,2000,0,6,8.0,1,1,80,0,8,'TOAU');
INSERT INTO `abilities` VALUES (99,'puppet_roll',17,52,1,60,193,420,0,115,2000,0,6,8.0,1,1,80,0,8,'TOAU');
INSERT INTO `abilities` VALUES (100,'dancers_roll',17,61,1,60,193,420,0,116,2000,0,6,8.0,1,1,80,0,8,'WOTG');
INSERT INTO `abilities` VALUES (101,'scholars_roll',17,64,1,60,193,420,0,117,2000,0,6,8.0,1,1,80,0,8,'WOTG');
INSERT INTO `abilities` VALUES (102,'bolters_roll',17,76,1,60,193,420,0,118,2000,0,6,8.0,1,1,80,0,8,'ABYSSEA');
INSERT INTO `abilities` VALUES (103,'casters_roll',17,79,1,60,193,420,0,119,2000,0,6,8.0,1,1,80,0,8,'ABYSSEA');
INSERT INTO `abilities` VALUES (104,'coursers_roll',17,81,1,60,193,420,0,120,2000,0,6,8.0,1,1,80,0,8,'ABYSSEA');
INSERT INTO `abilities` VALUES (105,'blitzers_roll',17,83,1,60,193,420,0,121,2000,0,6,8.0,1,1,80,0,8,'ABYSSEA');
INSERT INTO `abilities` VALUES (106,'tacticians_roll',17,86,1,60,193,420,0,122,2000,0,6,8.0,1,1,80,0,8,'ABYSSEA');
INSERT INTO `abilities` VALUES (107,'double-up',17,5,1,8,194,424,0,116,2000,0,6,8.0,1,1,80,0,0,'TOAU');
INSERT INTO `abilities` VALUES (108,'quick_draw',17,40,1,1,0,0,0,0,2000,0,6,18.0,0,0,0,1410,0,'TOAU');
INSERT INTO `abilities` VALUES (109,'fire_shot',17,40,4,1,195,110,0,125,2000,0,6,18.0,0,0,0,1410,0,'TOAU');
INSERT INTO `abilities` VALUES (110,'ice_shot',17,40,4,1,195,110,0,126,2000,0,6,18.0,0,0,0,1410,0,'TOAU');
INSERT INTO `abilities` VALUES (111,'wind_shot',17,40,4,1,195,110,0,127,2000,0,6,18.0,0,0,0,1410,0,'TOAU');
INSERT INTO `abilities` VALUES (112,'earth_shot',17,40,4,1,195,110,0,128,2000,0,6,18.0,0,0,0,1410,0,'TOAU');
INSERT INTO `abilities` VALUES (113,'thunder_shot',17,40,4,1,195,110,0,129,2000,0,6,18.0,0,0,0,1410,0,'TOAU');
INSERT INTO `abilities` VALUES (114,'water_shot',17,40,4,1,195,110,0,130,2000,0,6,18.0,0,0,0,1410,0,'TOAU');
INSERT INTO `abilities` VALUES (115,'light_shot',17,40,4,1,195,0,0,123,2000,0,6,18.0,0,0,0,1410,0,'TOAU');
INSERT INTO `abilities` VALUES (116,'dark_shot',17,40,4,1,195,0,0,124,2000,0,6,18.0,0,0,0,1410,0,'TOAU');
INSERT INTO `abilities` VALUES (117,'random_deal',17,50,1,1200,196,0,0,131,2000,0,6,20.0,1,1,300,1414,0,'TOAU');
INSERT INTO `abilities` VALUES (119,'overdrive',18,0,1,3600,0,0,0,143,2000,0,6,20.0,0,0,0,0,0,'TOAU');
INSERT INTO `abilities` VALUES (120,'activate',18,1,1,1200,205,0,0,83,2000,0,6,20.0,0,1,80,1478,0,'TOAU');
INSERT INTO `abilities` VALUES (121,'repair',18,15,257,180,206,102,0,83,2000,0,6,18.0,0,0,0,1480,0,'TOAU'); -- FYI: Retail has this at 90s and its merit at 3s per upgrade due to a 99 cap Automaton HP increase (as well as reworked Auto-repair Kits and oil changes)
INSERT INTO `abilities` VALUES (122,'deploy',18,1,4,10,207,0,0,83,2000,0,6,18.0,0,0,0,0,512,'TOAU');
INSERT INTO `abilities` VALUES (123,'deactivate',18,1,1,60,208,0,0,83,2000,0,6,18.0,0,0,0,0,512,'TOAU');
INSERT INTO `abilities` VALUES (124,'retrieve',18,10,1,10,209,0,0,83,2000,0,6,18.0,0,0,0,0,512,'TOAU');
INSERT INTO `abilities` VALUES (125,'fire_maneuver',18,1,1,10,210,0,0,333,2000,0,6,18.0,0,1,0,0,512,'TOAU');
INSERT INTO `abilities` VALUES (126,'ice_maneuver',18,1,1,10,210,0,0,333,2000,0,6,18.0,0,1,0,0,512,'TOAU');
INSERT INTO `abilities` VALUES (127,'wind_maneuver',18,1,1,10,210,0,0,333,2000,0,6,18.0,0,1,0,0,512,'TOAU');
INSERT INTO `abilities` VALUES (128,'earth_maneuver',18,1,1,10,210,0,0,333,2000,0,6,18.0,0,1,0,0,512,'TOAU');
INSERT INTO `abilities` VALUES (129,'thunder_maneuver',18,1,1,10,210,0,0,333,2000,0,6,18.0,0,1,0,0,512,'TOAU');
INSERT INTO `abilities` VALUES (130,'water_maneuver',18,1,1,10,210,0,0,333,2000,0,6,18.0,0,1,0,0,512,'TOAU');
INSERT INTO `abilities` VALUES (131,'light_maneuver',18,1,1,10,210,0,0,333,2000,0,6,18.0,0,1,0,0,512,'TOAU');
INSERT INTO `abilities` VALUES (132,'dark_maneuver',18,1,1,10,210,0,0,333,2000,0,6,18.0,0,1,0,0,512,'TOAU');
INSERT INTO `abilities` VALUES (133,'warriors_charge',1,75,1,300,6,0,0,154,2000,0,6,20.0,0,1,300,2048,1,'TOAU');
INSERT INTO `abilities` VALUES (134,'tomahawk',1,75,4,180,7,0,0,244,2000,0,3,20.0,0,1,600,2050,1,'TOAU');
INSERT INTO `abilities` VALUES (135,'mantra',2,75,1,600,19,441,0,155,2000,0,6,20.0,1,1,60,2112,1,'TOAU');
INSERT INTO `abilities` VALUES (136,'formless_strikes',2,75,1,600,20,0,0,156,2000,0,6,20.0,0,1,300,2114,1,'TOAU');
INSERT INTO `abilities` VALUES (137,'martyr',3,75,2,600,27,102,0,157,2000,0,6,20.0,0,1,300,2176,1,'TOAU');
INSERT INTO `abilities` VALUES (138,'devotion',3,75,2,600,28,451,0,158,2000,0,6,10.0,0,1,300,2178,1,'TOAU');
INSERT INTO `abilities` VALUES (139,'assassins_charge',6,75,1,300,67,0,0,160,2000,0,6,20.0,0,1,300,2368,1,'TOAU');
INSERT INTO `abilities` VALUES (140,'feint',6,75,1,120,68,0,0,159,2000,0,6,20.0,0,1,300,2370,1,'TOAU');
INSERT INTO `abilities` VALUES (141,'fealty',7,75,1,600,78,0,0,148,2000,0,6,20.0,0,1,300,2432,1,'TOAU');
INSERT INTO `abilities` VALUES (142,'chivalry',7,75,1,600,79,451,0,149,2000,0,6,20.0,0,1,300,2434,1,'TOAU');
INSERT INTO `abilities` VALUES (143,'dark_seal',8,75,1,300,89,0,0,144,2000,0,6,20.0,0,1,300,2496,1,'TOAU');
INSERT INTO `abilities` VALUES (144,'diabolic_eye',8,75,1,300,90,0,0,145,2000,0,6,20.0,0,1,300,2498,1,'TOAU');
INSERT INTO `abilities` VALUES (145,'feral_howl',9,75,4,300,105,0,0,146,2000,0,6,20.0,0,0,0,2560,1,'TOAU');
INSERT INTO `abilities` VALUES (146,'killer_instinct',9,75,1,300,106,0,0,147,2000,0,6,20.0,1,0,0,2562,1,'TOAU');
INSERT INTO `abilities` VALUES (147,'nightingale',10,75,1,600,109,0,0,161,2000,0,6,20.0,0,1,300,2624,1,'TOAU');
INSERT INTO `abilities` VALUES (148,'troubadour',10,75,1,600,110,0,0,162,2000,0,6,20.0,0,1,300,2626,1,'TOAU');
INSERT INTO `abilities` VALUES (149,'stealth_shot',11,75,1,300,127,0,0,150,2000,0,6,20.0,0,1,3000,2688,1,'TOAU');
INSERT INTO `abilities` VALUES (150,'flashy_shot',11,75,1,600,128,0,0,151,2000,0,6,20.0,0,1,300,2690,1,'TOAU');
INSERT INTO `abilities` VALUES (151,'shikikoyo',12,75,2,300,136,452,0,152,2000,0,6,20.0,0,1,80,2752,1,'TOAU');
INSERT INTO `abilities` VALUES (152,'blade_bash',12,75,4,180,137,110,0,202,2000,0,3,4.4,0,0,0,2754,1,'TOAU');
INSERT INTO `abilities` VALUES (153,'deep_breathing',14,75,1,300,164,0,0,153,2000,0,6,20.0,0,0,0,2880,1,'TOAU');
INSERT INTO `abilities` VALUES (154,'angon',14,75,4,180,165,127,0,245,2000,0,3,20.0,0,0,0,2882,1,'TOAU');
INSERT INTO `abilities` VALUES (155,'sange',13,75,1,300,145,0,0,200,2000,0,6,20.0,0,1,0,2816,1,'TOAU');
INSERT INTO `abilities` VALUES (156,'blood_pact_ward',15,1,1,60,174,0,0,0,2000,0,6,20.0,0,0,0,0,256,NULL);
INSERT INTO `abilities` VALUES (157,'hasso',12,25,1,60,138,0,0,163,2000,0,6,20.0,0,1,300,0,0,'TOAU');
INSERT INTO `abilities` VALUES (158,'seigan',12,35,1,60,139,0,0,164,2000,0,6,20.0,0,1,300,0,0,'TOAU');
INSERT INTO `abilities` VALUES (159,'convergence',16,75,1,600,183,0,0,165,2000,0,6,20.0,0,1,300,3008,1,'TOAU');
INSERT INTO `abilities` VALUES (160,'diffusion',16,75,1,600,184,0,0,166,2000,0,6,20.0,1,1,300,3010,1,'TOAU');
INSERT INTO `abilities` VALUES (161,'snake_eye',17,75,1,300,197,0,0,167,2000,0,6,20.0,0,1,300,3072,1,'TOAU');
INSERT INTO `abilities` VALUES (162,'fold',17,75,1,300,198,0,0,220,2000,0,6,20.0,0,1,300,3074,1,'TOAU');
INSERT INTO `abilities` VALUES (163,'role_reversal',18,75,1,120,211,0,0,169,2000,0,6,20.0,0,0,0,3136,1,'TOAU');
INSERT INTO `abilities` VALUES (164,'ventriloquy',18,75,4,60,212,0,0,170,2000,0,6,20.0,0,0,0,3138,1,'TOAU');
INSERT INTO `abilities` VALUES (165,'trance',19,0,1,3600,0,0,0,184,2000,0,6,20.0,0,1,300,0,0,'WOTG');
INSERT INTO `abilities` VALUES (166,'sambas',19,5,1,0,216,0,0,0,2000,0,14,20.0,0,0,0,0,0,'WOTG');
INSERT INTO `abilities` VALUES (167,'waltzes',19,15,1,0,217,0,0,0,2000,0,14,20.0,0,0,0,0,0,'WOTG');
INSERT INTO `abilities` VALUES (168,'drain_samba',19,5,1,60,216,0,0,0,2000,0,14,20.0,0,1,300,0,0,'WOTG');
INSERT INTO `abilities` VALUES (169,'drain_samba_ii',19,35,1,60,216,0,0,1,2000,0,14,20.0,0,1,300,0,0,'WOTG');
INSERT INTO `abilities` VALUES (170,'drain_samba_iii',19,65,1,60,216,0,0,2,2000,0,14,20.0,0,1,300,0,0,'WOTG');
INSERT INTO `abilities` VALUES (171,'aspir_samba',19,25,1,60,216,0,0,3,2000,0,14,20.0,0,1,300,0,0,'WOTG');
INSERT INTO `abilities` VALUES (172,'aspir_samba_ii',19,60,1,60,216,0,0,4,2000,0,14,20.0,0,1,300,0,0,'WOTG');
INSERT INTO `abilities` VALUES (173,'haste_samba',19,45,1,60,216,0,0,5,2000,0,14,20.0,0,1,300,0,0,'WOTG');
INSERT INTO `abilities` VALUES (174,'curing_waltz',19,15,27,6,217,306,0,6,2000,0,14,20.0,0,3,3,0,0,'WOTG');
INSERT INTO `abilities` VALUES (175,'curing_waltz_ii',19,30,27,8,217,306,0,7,2000,0,14,20.0,0,3,3,0,0,'WOTG');
INSERT INTO `abilities` VALUES (176,'curing_waltz_iii',19,45,27,10,217,306,0,8,2000,0,14,20.0,0,3,3,0,0,'WOTG');
INSERT INTO `abilities` VALUES (177,'curing_waltz_iv',19,70,27,12,217,306,0,9,2000,0,14,20.0,0,3,3,0,0,'WOTG');
INSERT INTO `abilities` VALUES (178,'healing_waltz',19,35,27,8,215,0,0,10,2000,0,14,20.0,0,1,300,0,0,'WOTG');
INSERT INTO `abilities` VALUES (179,'divine_waltz',19,25,27,13,225,306,0,11,2000,0,14,20.0,1,3,3,0,0,'WOTG');
INSERT INTO `abilities` VALUES (180,'spectral_jig',19,25,1,30,218,0,0,12,2000,0,14,20.0,0,1,300,0,0,'WOTG');
INSERT INTO `abilities` VALUES (181,'chocobo_jig',19,55,1,60,218,126,0,13,2000,0,14,20.0,0,1,300,0,0,'WOTG');
INSERT INTO `abilities` VALUES (182,'jigs',19,25,1,0,0,0,0,0,2000,0,14,20.0,0,0,0,0,0,'WOTG');
INSERT INTO `abilities` VALUES (183,'steps',19,20,1,0,0,0,0,0,2000,0,14,20.0,0,0,0,0,0,'WOTG');
INSERT INTO `abilities` VALUES (184,'flourishes_i',19,20,1,0,0,0,0,0,2000,0,14,20.0,0,0,0,0,0,'WOTG');
INSERT INTO `abilities` VALUES (185,'quickstep',19,20,4,5,220,519,0,14,2000,0,14,4.5,0,1,0,0,0,'WOTG');
INSERT INTO `abilities` VALUES (186,'box_step',19,30,4,5,220,520,0,14,2000,0,14,4.5,0,1,0,0,0,'WOTG');
INSERT INTO `abilities` VALUES (187,'stutter_step',19,40,4,5,220,521,0,14,2000,0,14,4.5,0,1,0,0,0,'WOTG');
INSERT INTO `abilities` VALUES (188,'animated_flourish',19,20,4,30,221,119,0,181,2000,0,6,17.6,0,1,1000,0,0,'WOTG');
INSERT INTO `abilities` VALUES (189,'desperate_flourish',19,30,4,20,221,127,0,24,2000,0,14,4.4,0,1,0,0,0,'WOTG');
INSERT INTO `abilities` VALUES (190,'reverse_flourish',19,40,1,30,222,452,0,182,2000,0,6,20.0,0,1,0,0,0,'WOTG');
INSERT INTO `abilities` VALUES (191,'violent_flourish',19,45,4,20,221,522,0,24,2000,0,14,4.4,0,1,0,0,0,'WOTG');
INSERT INTO `abilities` VALUES (192,'building_flourish',19,50,1,10,222,0,0,220,2000,0,6,20.0,0,1,0,0,0,'WOTG');
INSERT INTO `abilities` VALUES (193,'wild_flourish',19,60,4,20,222,529,0,24,2000,0,14,4.4,0,1,0,0,0,'WOTG');
INSERT INTO `abilities` VALUES (194,'tabula_rasa',20,0,1,3600,0,0,0,190,2000,0,6,20.0,0,1,300,0,0,'WOTG');
INSERT INTO `abilities` VALUES (195,'light_arts',20,10,1,60,228,0,0,171,2000,0,6,20.0,0,1,80,1600,0,'WOTG');
INSERT INTO `abilities` VALUES (196,'dark_arts',20,10,1,60,232,0,0,176,2000,0,6,20.0,0,1,300,1600,0,'WOTG');
INSERT INTO `abilities` VALUES (197,'flourishes_ii',19,40,1,0,0,0,0,0,2000,0,6,20.0,0,0,0,0,0,'WOTG');
INSERT INTO `abilities` VALUES (198,'modus_veritas',20,65,4,180,230,0,0,188,2000,0,6,20.0,0,1,80,0,0,'WOTG');
INSERT INTO `abilities` VALUES (199,'penury',20,10,1,1,231,0,0,172,2000,0,6,20.0,0,1,80,0,16,'WOTG');
INSERT INTO `abilities` VALUES (200,'celerity',20,25,1,1,231,0,0,173,2000,0,6,20.0,0,1,80,0,16,'WOTG');
INSERT INTO `abilities` VALUES (201,'rapture',20,55,1,1,231,0,0,174,2000,0,6,20.0,0,1,80,0,16,'WOTG');
INSERT INTO `abilities` VALUES (202,'accession',20,40,1,1,231,0,0,175,2000,0,6,20.0,0,1,80,0,16,'WOTG');
INSERT INTO `abilities` VALUES (203,'parsimony',20,10,1,1,231,0,0,177,2000,0,6,20.0,0,1,80,0,32,'WOTG');
INSERT INTO `abilities` VALUES (204,'alacrity',20,25,1,1,231,0,0,178,2000,0,6,20.0,0,1,80,0,32,'WOTG');
INSERT INTO `abilities` VALUES (205,'ebullience',20,55,1,1,231,0,0,179,2000,0,6,20.0,0,1,80,0,32,'WOTG');
INSERT INTO `abilities` VALUES (206,'manifestation',20,40,1,1,231,0,0,180,2000,0,6,20.0,0,1,80,0,32,'WOTG');
INSERT INTO `abilities` VALUES (207,'stratagems',20,10,1,0,233,0,0,0,2000,0,6,20.0,0,1111,1111,0,0,'WOTG');
INSERT INTO `abilities` VALUES (208,'velocity_shot',11,45,1,300,129,0,0,186,2000,0,6,20.0,0,1,300,0,0,'WOTG');
INSERT INTO `abilities` VALUES (209,'snarl',9,45,257,30,107,0,0,87,2000,0,6,20.0,0,0,0,0,192,'WOTG');
INSERT INTO `abilities` VALUES (210,'retaliation',1,60,1,180,8,0,0,185,2000,0,6,20.0,0,1,80,0,0,'WOTG');
INSERT INTO `abilities` VALUES (211,'footwork',2,65,1,300,21,0,0,197,2000,0,6,20.0,0,1,80,0,0,'WOTG');
INSERT INTO `abilities` VALUES (212,'despoil',6,77,4,300,61,125,0,181,2000,0,3,4.4,0,1,300,0,0,'ABYSSEA');
INSERT INTO `abilities` VALUES (213,'pianissimo',10,20,1,15,112,0,0,194,2000,0,6,20.0,0,1,80,0,0,'WOTG');
INSERT INTO `abilities` VALUES (214,'sekkanoki',12,40,1,300,140,0,0,199,2000,0,6,20.0,0,1,80,0,0,'WOTG');
INSERT INTO `abilities` VALUES (216,'elemental_siphon',15,50,1,300,175,451,0,201,2000,0,6,20.0,0,1,0,0,0,'WOTG');
INSERT INTO `abilities` VALUES (217,'sublimation',20,35,1,30,234,0,0,189,2000,0,6,20.0,0,1,80,0,0,'WOTG');
INSERT INTO `abilities` VALUES (218,'addendum_white',20,10,1,1,231,0,0,191,2000,0,6,20.0,0,1,80,0,16,'WOTG');
INSERT INTO `abilities` VALUES (219,'addendum_black',20,30,1,1,231,0,0,192,2000,0,6,20.0,0,1,80,0,32,'WOTG');
INSERT INTO `abilities` VALUES (220,'collaborator',6,65,2,60,69,526,0,185,2000,0,6,20.0,0,0,0,0,0,'WOTG');
INSERT INTO `abilities` VALUES (221,'saber_dance',19,75,1,180,219,0,0,207,2000,0,6,20.0,0,1,80,3200,1,'WOTG');
INSERT INTO `abilities` VALUES (222,'fan_dance',19,75,1,180,224,0,0,208,2000,0,6,20.0,0,1,80,3202,1,'WOTG');
INSERT INTO `abilities` VALUES (223,'no_foot_rise',19,75,1,180,223,560,560,209,2000,0,6,20.0,0,1,80,3204,1,'WOTG');
INSERT INTO `abilities` VALUES (224,'altruism',20,75,1,1,231,0,0,210,2000,0,6,20.0,0,1,80,3264,17,'WOTG');
INSERT INTO `abilities` VALUES (225,'focalization',20,75,1,1,231,0,0,212,2000,0,6,20.0,0,1,80,3266,33,'WOTG');
INSERT INTO `abilities` VALUES (226,'tranquility',20,75,1,1,231,0,0,211,2000,0,6,20.0,0,1,80,3268,17,'WOTG');
INSERT INTO `abilities` VALUES (227,'equanimity',20,75,1,1,231,0,0,213,2000,0,6,20.0,0,1,80,3270,33,'WOTG');
INSERT INTO `abilities` VALUES (228,'enlightenment',20,75,1,300,235,0,0,214,2000,0,6,20.0,0,1,80,3272,1,'WOTG');
INSERT INTO `abilities` VALUES (229,'afflatus_solace',3,40,1,60,29,0,0,216,2000,0,6,20.0,0,1,80,0,4,'WOTG');
INSERT INTO `abilities` VALUES (230,'afflatus_misery',3,40,1,60,30,0,0,217,2000,0,6,20.0,0,1,80,0,4,'WOTG');
INSERT INTO `abilities` VALUES (231,'composure',5,50,1,300,50,0,0,215,2000,0,6,20.0,0,1,80,0,0,'WOTG');
INSERT INTO `abilities` VALUES (232,'yonin',13,40,1,180,146,0,0,218,2000,0,6,20.0,0,1,600,0,4,'WOTG');
INSERT INTO `abilities` VALUES (233,'innin',13,40,1,180,147,0,0,219,2000,0,6,20.0,0,1,60,0,4,'WOTG');
INSERT INTO `abilities` VALUES (235,'ready',9,25,1,0,102,0,0,83,2000,0,6,18.0,0,0,0,902,64,NULL);
INSERT INTO `abilities` VALUES (241,'double_shot',11,79,1,180,126,0,0,225,2000,0,6,20.0,0,1,300,0,0,'ABYSSEA');
INSERT INTO `abilities` VALUES (243,'futae',13,77,1,180,148,0,0,227,2000,0,6,20.0,0,1,0,0,0,'ABYSSEA');
INSERT INTO `abilities` VALUES (257,'manawell',4,95,3,600,35,0,0,257,2000,0,6,20.0,0,1,80,0,0,'ABYSSEA');
INSERT INTO `abilities` VALUES (258,'saboteur',5,83,1,300,36,0,0,258,2000,0,6,20.0,0,1,80,0,0,'ABYSSEA');
INSERT INTO `abilities` VALUES (259,'spontaneity',5,95,3,600,37,0,0,259,2000,0,6,20.0,0,1,80,0,0,'ABYSSEA');
INSERT INTO `abilities` VALUES (267,'tenuto',10,83,1,5,47,0,0,257,2000,0,6,20.0,0,0,0,0,0,'ABYSSEA');
INSERT INTO `abilities` VALUES (268,'marcato',10,95,1,600,48,0,0,251,2000,0,6,20.0,0,0,0,0,0,'ABYSSEA');
INSERT INTO `abilities` VALUES (272,'hagakure',12,95,1,180,54,0,0,249,2000,0,6,20.0,0,1,300,0,0,'ABYSSEA');
INSERT INTO `abilities` VALUES (275,'issekigan',13,95,1,300,57,0,0,246,2000,0,6,20.0,0,1,0,0,0,'ABYSSEA');
INSERT INTO `abilities` VALUES (286,'allies_roll',17,89,1,60,193,420,0,138,2000,0,6,8.0,1,1,80,0,8,'ABYSSEA');
INSERT INTO `abilities` VALUES (287,'misers_roll',17,92,1,60,193,420,0,139,2000,0,6,8.0,1,1,80,0,8,'ABYSSEA');
INSERT INTO `abilities` VALUES (288,'companions_roll',17,95,1,60,193,420,0,265,2000,0,6,8.0,1,1,80,0,8,'ABYSSEA');
INSERT INTO `abilities` VALUES (289,'avengers_roll',17,97,1,60,193,420,0,266,2000,0,6,8.0,1,1,80,0,8,'ABYSSEA');
INSERT INTO `abilities` VALUES (294,'deus_ex_automata',18,5,1,60,115,0,0,83,2000,0,6,20.0,0,1,80,0,0,'TOAU');
INSERT INTO `abilities` VALUES (304,'konzen-ittai',12,65,4,180,132,529,0,36,2000,0,14,4.4,0,1,300,0,0,'ABYSSEA');
INSERT INTO `abilities` VALUES (306,'maintenance',18,30,257,90,214,0,0,83,2000,0,6,18.0,0,0,0,1474,0,'TOAU');
INSERT INTO `abilities` VALUES (311,'stymie',5,96,1,3600,254,0,0,275,2000,0,6,20.0,0,1,0,0,0,'SOA');
INSERT INTO `abilities` VALUES (319,'mikage',13,96,1,3600,254,0,0,283,2000,0,6,20.0,0,1,0,0,0,'SOA');
INSERT INTO `abilities` VALUES (327,'bolster',21,0,1,3600,0,0,0,33,2000,0,6,20.0,0,1,300,0,0,NULL);
INSERT INTO `abilities` VALUES (340,'elemental_sforzo',22,0,1,3600,0,0,0,302,2000,0,6,20.0,0,0,0,0,0,'SOA');
INSERT INTO `abilities` VALUES (341,'Rune_enchantment',22,5,1,0,0,0,0,0,2000,0,6,0.0,0,0,0,0,0,'SOA');
INSERT INTO `abilities` VALUES (342,'Ignis',22,5,1,10,0,0,0,291,2000,0,6,20.0,0,1,300,0,0,'SOA');
INSERT INTO `abilities` VALUES (343,'Gelus',22,5,1,10,0,0,0,292,2000,0,6,20.0,0,1,300,0,0,'SOA');
INSERT INTO `abilities` VALUES (344,'Flabra',22,5,1,10,0,0,0,293,2000,0,6,20.0,0,1,300,0,0,'SOA');
INSERT INTO `abilities` VALUES (345,'Tellus',22,5,1,10,0,0,0,294,2000,0,6,20.0,0,1,300,0,0,'SOA');
INSERT INTO `abilities` VALUES (346,'Sulpor',22,5,1,10,0,0,0,295,2000,0,6,20.0,0,1,300,0,0,'SOA');
INSERT INTO `abilities` VALUES (347,'Unda',22,5,1,10,0,0,0,296,2000,0,6,20.0,0,1,300,0,0,'SOA');
INSERT INTO `abilities` VALUES (348,'Lux',22,5,1,10,0,0,0,297,2000,0,6,20.0,0,1,300,0,0,'SOA');
INSERT INTO `abilities` VALUES (349,'Tenebrae',22,5,1,10,0,0,0,298,2000,0,6,20.0,0,1,300,0,0,'SOA');
-- INSERT INTO `abilities` VALUES (350, 'Vallation',22,20,1,300,0,0,0,???,2000,0,6,20.0,0,1,300,0,0,'SOA');
INSERT INTO `abilities` VALUES (351,'Swordplay',22,20,1,300,0,0,0,299,2000,0,6,20.0,0,1,300,0,0,'SOA');
-- INSERT INTO `abilities` VALUES (352,'Lunge',22,20,1,300,0,0,0,???,2000,0,6,20.0,0,1,300,0,0,'SOA');
-- INSERT INTO `abilities` VALUES (353,'Pflug',22,20,1,300,0,0,0,???,2000,0,6,20.0,0,1,300,0,0,'SOA');
-- INSERT INTO `abilities` VALUES (354,'Embolden',22,60,1,600,0,0,0,300,2000,0,6,20.0,0,1,300,0,0,'SOA');
-- INSERT INTO `abilities` VALUES (355,'Valiance',22,20,1,300,0,0,0,???,2000,0,6,20.0,0,1,300,0,0,'SOA');
-- INSERT INTO `abilities` VALUES (356,'Gambit',22,20,1,300,0,0,0,???,2000,0,6,20.0,0,1,300,0,0,'SOA');
-- INSERT INTO `abilities` VALUES (357,'Liement',22,20,1,300,0,0,0,???,2000,0,6,20.0,0,1,300,0,0,'SOA');
INSERT INTO `abilities` VALUES (358,'One_for_all',22,95,1,300,0,0,0,301,2000,0,6,20.0,1,1,300,0,0,'SOA');
-- INSERT INTO `abilities` VALUES (359,'Rayke',22,20,1,300,0,0,0,???,2000,0,6,20.0,0,1,300,0,0,'SOA');
-- INSERT INTO `abilities` VALUES (360,'Battuta',22,1,1,0,300,0,0,???,2000,0,6,20.0,0,1,300,0,0,'SOA');
INSERT INTO `abilities` VALUES (363,'Ward',22,1,1,0,0,0,0,0,2000,0,6,20.0,0,1,300,0,0,NULL);
INSERT INTO `abilities` VALUES (364,'Effusion',22,1,1,0,0,0,0,0,2000,0,6,20.0,0,1,300,0,0,NULL);
INSERT INTO `abilities` VALUES (367,'Vivacious_pulse',22,1,1,300,0,0,0,327,2000,0,6,20.0,0,1,300,0,0,NULL);
INSERT INTO `abilities` VALUES (369,'apogee',15,70,1,180,108,0,0,333,2000,0,6,20.0,0,1,0,0,0,NULL);
INSERT INTO `abilities` VALUES (374,'naturalists_roll',17,67,1,60,193,420,0,328,2000,0,6,8.0,1,1,80,0,8,'SOA'); -- No Enhancing Magic Duration MOD, Empty PH effect exists
INSERT INTO `abilities` VALUES (375,'runeists_roll',17,70,1,60,193,420,0,329,2000,0,6,8.0,1,1,80,0,8,'SOA');
INSERT INTO `abilities` VALUES (496,'healing_ruby',15,1,3,60,174,0,0,6,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (497,'poison_nails',15,5,4,60,173,0,0,11,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (498,'shining_ruby',15,24,1,60,174,0,0,44,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (499,'glittering_ruby',15,44,1,60,174,0,0,62,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (500,'meteorite',15,55,4,60,173,0,0,108,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (501,'healing_ruby_ii',15,65,1,60,174,0,0,124,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (502,'searing_light',15,1,4,60,173,0,0,0,2000,0,6,18.0,1,1,60,0,2,NULL);
INSERT INTO `abilities` VALUES (512,'moonlit_charge',15,5,4,60,173,0,0,17,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (513,'crescent_fang',15,10,4,60,173,0,0,19,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (514,'lunar_cry',15,21,4,60,174,0,0,41,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (515,'lunar_roar',15,32,4,60,174,0,0,27,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (516,'ecliptic_growl',15,43,1,60,174,0,0,46,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (517,'ecliptic_howl',15,54,1,60,174,0,0,57,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (518,'eclipse_bite',15,65,4,60,173,0,0,109,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (520,'howling_moon',15,1,4,60,173,0,0,0,2000,0,6,18.0,1,1,60,0,2,NULL);
INSERT INTO `abilities` VALUES (528,'punch',15,1,4,60,173,0,0,9,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (529,'fire_ii',15,10,4,60,173,0,0,24,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (530,'burning_strike',15,23,4,60,173,0,0,48,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (531,'double_punch',15,30,4,60,173,0,0,56,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (532,'crimson_howl',15,38,1,60,174,0,0,84,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (533,'fire_iv',15,60,4,60,173,0,0,118,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (534,'flaming_crush',15,70,4,60,173,0,0,164,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (535,'meteor_strike',15,75,4,60,173,0,0,182,2000,0,6,18.0,0,1,60,2944,1,'TOAU');
INSERT INTO `abilities` VALUES (536,'inferno',15,1,4,60,173,0,0,0,2000,0,6,18.0,1,1,60,0,2,NULL);
INSERT INTO `abilities` VALUES (544,'rock_throw',15,1,4,60,173,0,0,10,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (545,'stone_ii',15,10,4,60,173,0,0,24,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (546,'rock_buster',15,21,4,60,173,0,0,39,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (547,'megalith_throw',15,35,4,60,173,0,0,62,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (548,'earthen_ward',15,46,1,60,174,0,0,92,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (549,'stone_iv',15,60,4,60,173,0,0,118,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (550,'mountain_buster',15,70,4,60,173,0,0,164,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (551,'geocrush',15,75,4,60,173,0,0,182,2000,0,6,18.0,0,1,60,2950,1,'TOAU');
INSERT INTO `abilities` VALUES (552,'earthen_fury',15,1,4,60,173,0,0,0,2000,0,6,18.0,1,1,60,0,2,NULL);
INSERT INTO `abilities` VALUES (560,'barracuda_dive',15,1,4,60,173,0,0,8,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (561,'water_ii',15,10,4,60,173,0,0,24,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (562,'tail_whip',15,26,4,60,173,0,0,49,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (563,'spring_water',15,47,1,60,174,0,0,99,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (564,'slowga',15,33,4,60,174,0,0,48,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (565,'water_iv',15,60,4,60,173,0,0,118,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (566,'spinning_dive',15,70,4,60,173,0,0,164,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (567,'grand_fall',15,75,4,60,173,0,0,182,2000,0,6,18.0,0,1,60,2954,1,'TOAU');
INSERT INTO `abilities` VALUES (568,'tidal_wave',15,1,4,60,173,0,0,0,2000,0,6,18.0,1,1,60,0,2,NULL);
INSERT INTO `abilities` VALUES (576,'claw',15,1,4,60,173,0,0,7,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (577,'aero_ii',15,10,4,60,173,0,0,24,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (578,'whispering_wind',15,36,1,60,174,0,0,119,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (579,'hastega',15,48,1,60,174,0,0,112,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (580,'aerial_armor',15,25,1,60,174,0,0,92,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (581,'aero_iv',15,60,4,60,173,0,0,118,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (582,'predator_claws',15,70,4,60,173,0,0,164,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (583,'wind_blade',15,75,4,60,173,0,0,182,2000,0,6,18.0,0,1,60,2948,1,'TOAU');
INSERT INTO `abilities` VALUES (584,'aerial_blast',15,1,4,60,173,0,0,0,2000,0,6,18.0,1,1,60,0,2,NULL);
INSERT INTO `abilities` VALUES (592,'axe_kick',15,1,4,60,173,0,0,10,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (593,'blizzard_ii',15,10,4,60,173,0,0,24,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (594,'frost_armor',15,28,1,60,174,0,0,63,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (595,'sleepga',15,39,4,60,174,0,0,56,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (596,'double_slap',15,50,4,60,173,0,0,96,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (597,'blizzard_iv',15,60,4,60,173,0,0,118,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (598,'rush',15,70,4,60,173,0,0,164,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (599,'heavenly_strike',15,75,4,60,173,0,0,182,2000,0,6,18.0,0,1,60,2946,1,'TOAU');
INSERT INTO `abilities` VALUES (600,'diamond_dust',15,1,4,60,173,0,0,0,2000,0,6,18.0,0,1,60,0,2,NULL);
INSERT INTO `abilities` VALUES (608,'shock_strike',15,1,4,60,173,0,0,6,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (609,'thunder_ii',15,10,4,60,173,0,0,24,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (610,'rolling_thunder',15,31,1,60,174,0,0,52,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (611,'thunderspark',15,19,4,60,173,0,0,38,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (612,'lightning_armor',15,42,1,60,174,0,0,91,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (613,'thunder_iv',15,60,4,60,173,0,0,118,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (614,'chaotic_strike',15,70,4,60,173,0,0,164,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (615,'thunderstorm',15,75,4,60,173,0,0,182,2000,0,6,18.0,0,1,60,2952,1,'TOAU');
INSERT INTO `abilities` VALUES (616,'judgment_bolt',15,1,4,60,173,0,0,0,2000,0,6,18.0,0,1,60,0,2,NULL);
INSERT INTO `abilities` VALUES (623,'healing_breath_iv',0,80,2,0,0,0,0,156,2000,1500,13,13.0,0,0,0,0,0,NULL);
INSERT INTO `abilities` VALUES (624,'healing_breath',0,1,2,0,0,0,0,128,2000,1500,13,13.0,0,0,0,0,0,NULL);
INSERT INTO `abilities` VALUES (625,'healing_breath_ii',0,20,2,0,0,0,0,129,2000,1500,13,13.0,0,0,0,0,0,NULL);
INSERT INTO `abilities` VALUES (626,'healing_breath_iii',0,40,2,0,0,0,0,130,2000,1500,13,13.0,0,0,0,0,0,NULL);
INSERT INTO `abilities` VALUES (627,'remove_poison',0,1,2,0,0,0,0,131,2000,1500,13,13.0,0,0,0,0,0,NULL);
INSERT INTO `abilities` VALUES (628,'remove_blindness',0,20,2,0,0,0,0,132,2000,1500,13,13.0,0,0,0,0,0,NULL);
INSERT INTO `abilities` VALUES (629,'remove_paralysis',0,40,2,0,0,0,0,133,2000,1500,13,13.0,0,0,0,0,0,NULL);
INSERT INTO `abilities` VALUES (630,'flame_breath',0,1,4,0,0,0,0,134,2000,1500,13,13.0,0,0,0,0,0,NULL);
INSERT INTO `abilities` VALUES (631,'frost_breath',0,1,4,0,0,0,0,135,2000,1500,13,13.0,0,0,0,0,0,NULL);
INSERT INTO `abilities` VALUES (632,'gust_breath',0,1,4,0,0,0,0,136,2000,1500,13,13.0,0,0,0,0,0,NULL);
INSERT INTO `abilities` VALUES (633,'sand_breath',0,1,4,0,0,0,0,137,2000,1500,13,13.0,0,0,0,0,0,NULL);
INSERT INTO `abilities` VALUES (634,'lightning_breath',0,1,4,0,0,0,0,138,2000,1500,13,13.0,0,0,0,0,0,NULL);
INSERT INTO `abilities` VALUES (635,'hydro_breath',0,1,4,0,0,0,0,139,2000,1500,13,13.0,0,0,0,0,0,NULL);
INSERT INTO `abilities` VALUES (636,'super_climb',0,50,1,0,0,0,0,140,2000,0,13,18.0,0,0,0,0,0,NULL);
INSERT INTO `abilities` VALUES (637,'remove_curse',0,60,2,0,0,0,0,157,2000,1500,13,13.0,0,0,0,0,0,NULL);
INSERT INTO `abilities` VALUES (638,'remove_disease',0,80,2,0,0,0,0,158,2000,1500,13,13.0,0,0,0,0,0,NULL);
INSERT INTO `abilities` VALUES (640,'camisado',15,1,4,60,173,0,0,20,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (641,'somnolence',15,20,4,60,174,0,0,30,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (642,'nightmare',15,29,4,60,174,0,0,42,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (643,'ultimate_terror',15,37,4,60,174,0,0,27,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (644,'noctoshield',15,49,1,60,174,0,0,92,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (645,'dream_shroud',15,56,1,60,174,0,0,121,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (646,'nether_blast',15,65,4,60,173,0,0,109,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (656,'foot_kick',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (657,'dust_cloud',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (658,'whirl_claws',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (659,'head_butt',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (660,'dream_flower',9,25,257,2,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (661,'wild_oats',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (662,'leaf_dagger',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (663,'scream',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (664,'roar',9,25,257,2,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (665,'razor_fang',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (666,'claw_cyclone',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (667,'tail_blow',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (668,'fireball',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (669,'blockhead',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (670,'brain_crush',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (671,'infrasonics',9,25,257,2,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (672,'secretion',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (673,'lamb_chop',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (674,'rage',9,25,257,2,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (675,'sheep_charge',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (676,'sheep_song',9,25,257,2,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (677,'bubble_shower',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (678,'bubble_curtain',9,25,257,3,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (679,'big_scissors',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (680,'scissor_guard',9,25,257,2,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (681,'metallic_body',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (682,'needleshot',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (683,'???_needles',9,25,257,3,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (684,'frogkick',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (685,'spore',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (686,'queasyshroom',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (687,'numbshroom',9,25,257,2,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (688,'shakeshroom',9,25,257,2,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (689,'silence_gas',9,25,257,3,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (690,'dark_spore',9,25,257,3,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (691,'power_attack',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (692,'hi-freq_field',9,25,257,2,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (693,'rhino_attack',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (694,'rhino_guard',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (695,'spoil',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (696,'cursed_sphere',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (697,'venom',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (698,'sandblast',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (699,'sandpit',9,25,257,2,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (700,'venom_spray',9,25,257,2,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (701,'mandibular_bite',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (702,'soporific',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (703,'gloeosuccus',9,25,257,2,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (704,'palsy_pollen',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (705,'geist_wall',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (706,'numbing_noise',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (707,'nimble_snap',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (708,'cyclotail',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (709,'toxic_spit',9,25,257,2,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (710,'double_claw',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (711,'grapple',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (712,'spinning_top',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (713,'filamented_hold',9,25,257,2,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (714,'chaotic_eye',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (715,'blaster',9,25,257,2,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (716,'suction',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (717,'drainkiss',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (718,'snow_cloud',9,25,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (719,'wild_carrot',9,25,257,2,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (720,'sudden_lunge',9,25,257,2,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (721,'spiral_spin',9,25,257,2,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (722,'noisome_powder',9,25,257,2,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
-- INSERT INTO `abilities` VALUES (723,'.',9,25,257,0,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL); -- ROTZ
INSERT INTO `abilities` VALUES (723,'acid_mist',10,25,257,2,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (724,'tp_drainkiss',10,25,257,3,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
-- INSERT INTO `abilities` VALUES (725,'.',9,25,257,0,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL); -- ROTZ
INSERT INTO `abilities` VALUES (726,'scythe_tail',9,26,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (727,'ripper_fang',9,26,257,1,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (728,'chomp_rush',9,25,257,3,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (729,'charged_whisker',9,26,257,2,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (730,'purulent_ooze',9,25,257,2,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (731,'corrosive_ooze',9,25,257,3,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (732,'back_heel',9,25,257,2,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (733,'jettatura',9,25,257,4,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (734,'choke_breath',9,25,257,2,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (735,'fantod',9,25,257,2,103,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (736,'tortoise_stomp',9,25,257,3,102,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (737,'harden_shell',9,25,257,2,103,0,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (738,'aqua_breath',9,25,257,3,102,1,0,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (739,'wing_slap',9,25,257,2,102,0,1,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (740,'beak_lunge',9,25,257,1,102,0,1,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (741,'intimidate',9,25,257,2,102,0,1,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (742,'recoil_dive',9,25,257,1,102,0,1,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (743,'water_wall',9,25,257,3,102,0,0,1,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (744,'sensilla_blades',9,25,257,2,102,0,1,0,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (745,'tegmina_buffet',9,25,257,2,102,0,0,1,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (746,'molting_plumage',9,25,257,1,102,0,0,1,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (747,'swooping_frenzy',9,25,257,2,102,0,0,1,2000,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (748,'sweeping_gouge',9,25,257,1,102,0,0,0,2001,0,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (749,'zealous_snort',9,25,257,3,102,0,0,0,2000,1,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (750,'pentapeck',9,25,257,3,102,0,0,0,2000,0,7,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (751,'tickling_tendrils',9,25,257,1,102,0,0,0,2000,1,6,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (752,'stink_bomb',9,25,257,2,102,0,0,0,2000,0,6,19.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (753,'nectarous_deluge',9,25,257,2,102,0,0,0,2000,0,7,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (754,'nepenthic_plunge',9,25,257,3,102,0,0,0,2000,0,7,18.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (755,'somersault',9,25,257,1,102,0,0,0,2000,0,6,19.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (757,'foul_waters',9,25,257,255,102,0,0,0,2000,0,6,19.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (758,'pestilent_plume',9,25,257,255,102,0,0,0,2000,0,6,19.0,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (759,'pecking_flurry',9,25,257,255,102,0,0,0,2000,0,6,18.1,0,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (760,'sickle_slash',9,25,257,255,102,0,0,0,2000,0,6,18.0,1,1,60,0,0,NULL);
INSERT INTO `abilities` VALUES (761,'acid_spray',9,25,257,255,102,0,0,0,2000,0,6,18.0,0,2,60,0,0,NULL);
INSERT INTO `abilities` VALUES (762,'spider_web',9,25,257,255,102,0,0,0,2000,0,6,18.0,0,2,60,0,0,NULL);
-- INSERT INTO `abilities` VALUES (764,'infected_leech',9,25,257,rec,102,0,0,0,2000,0,6,18.0,1,1,60,0,0,NULL); -- ROTZ
-- INSERT INTO `abilities` VALUES (765,'gloom_spray',9,25,257,rec,102,0,0,0,2000,0,6,18.0,0,2,60,0,0,NULL); -- ROTZ

-- Dump completed on 2017-01-31 10:57:44
