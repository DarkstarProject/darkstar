-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: dspdb
-- ------------------------------------------------------
-- Server version	5.5.5-10.0.20-MariaDB

--
-- Table structure for table `bcnm_info`
--

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

--
-- Dumping data for table `bcnm_info`
--
-- ORDER BY:  `bcnmId`

INSERT INTO `bcnm_info` VALUES (0,139,'rank_2_mission',NULL,NULL,1800,25,6,0,5);
INSERT INTO `bcnm_info` VALUES (1,139,'tails_of_woe',NULL,NULL,1800,40,6,0,15);
INSERT INTO `bcnm_info` VALUES (2,139,'dismemberment_brigade',NULL,NULL,1800,60,6,0,15);
INSERT INTO `bcnm_info` VALUES (3,139,'the_secret_weapon',NULL,NULL,1800,99,6,0,5);
INSERT INTO `bcnm_info` VALUES (4,139,'hostile_herbivores',NULL,NULL,1800,50,6,14,15);
INSERT INTO `bcnm_info` VALUES (5,139,'shattering_stars',NULL,NULL,600,99,1,0,22);
INSERT INTO `bcnm_info` VALUES (6,139,'shattering_stars',NULL,NULL,600,99,1,0,22);
INSERT INTO `bcnm_info` VALUES (7,139,'shattering_stars',NULL,NULL,600,99,1,0,22);
INSERT INTO `bcnm_info` VALUES (8,139,'carapace_combatants',NULL,NULL,900,30,3,0,15);
INSERT INTO `bcnm_info` VALUES (9,139,'shooting_fish',NULL,NULL,900,20,3,0,15);
INSERT INTO `bcnm_info` VALUES (10,139,'dropping_like_flies',NULL,NULL,1800,30,6,12,15);
INSERT INTO `bcnm_info` VALUES (11,139,'horns_of_war',NULL,NULL,1800,0,18,11,15);
INSERT INTO `bcnm_info` VALUES (12,139,'under_observation',NULL,NULL,900,40,3,16,15);
INSERT INTO `bcnm_info` VALUES (13,139,'eye_of_the_tiger',NULL,NULL,900,50,3,0,15);
INSERT INTO `bcnm_info` VALUES (14,139,'shots_in_the_dark',NULL,NULL,900,60,3,0,15);
INSERT INTO `bcnm_info` VALUES (15,139,'double_dragonian',NULL,NULL,1800,0,6,15,15);
INSERT INTO `bcnm_info` VALUES (16,139,'todays_horoscope',NULL,NULL,1800,0,6,0,15);
INSERT INTO `bcnm_info` VALUES (17,139,'contaminated_colosseum',NULL,NULL,1800,0,6,17,15);
INSERT INTO `bcnm_info` VALUES (18,139,'kindergarten_cap',NULL,NULL,900,0,3,0,15);
INSERT INTO `bcnm_info` VALUES (19,139,'last_orc-shunned_hero',NULL,NULL,1800,0,6,0,15);
INSERT INTO `bcnm_info` VALUES (20,139,'beyond_infinity',NULL,NULL,600,0,6,0,6);
INSERT INTO `bcnm_info` VALUES (32,140,'save_the_children',NULL,NULL,600,0,6,0,5);
INSERT INTO `bcnm_info` VALUES (33,140,'holy_crest',NULL,NULL,600,75,6,0,7);
INSERT INTO `bcnm_info` VALUES (34,140,'wings_of_fury',NULL,NULL,900,20,3,34,15);
INSERT INTO `bcnm_info` VALUES (35,140,'petrifying_pair',NULL,NULL,900,30,3,35,15);
INSERT INTO `bcnm_info` VALUES (36,140,'toadal_recall',NULL,NULL,1800,30,6,36,15);
INSERT INTO `bcnm_info` VALUES (37,140,'mirror_mirror',NULL,NULL,900,40,3,0,7);
INSERT INTO `bcnm_info` VALUES (64,144,'rank_2_mission',NULL,NULL,1800,25,6,0,5);
INSERT INTO `bcnm_info` VALUES (65,144,'worms_turn',NULL,NULL,1800,40,6,0,15);
INSERT INTO `bcnm_info` VALUES (66,144,'grimshell_shocktroopers',NULL,NULL,1800,60,6,0,15);
INSERT INTO `bcnm_info` VALUES (67,144,'on_my_way',NULL,NULL,1800,99,6,0,5);
INSERT INTO `bcnm_info` VALUES (68,144,'thief_in_norg',NULL,NULL,1800,99,6,0,6);
INSERT INTO `bcnm_info` VALUES (69,144,'3_2_1',NULL,NULL,1800,50,6,0,15);
INSERT INTO `bcnm_info` VALUES (70,144,'shattering_stars',NULL,NULL,600,99,1,0,22);
INSERT INTO `bcnm_info` VALUES (71,144,'shattering_stars',NULL,NULL,600,99,1,0,22);
INSERT INTO `bcnm_info` VALUES (72,144,'shattering_stars',NULL,NULL,600,99,1,0,22);
INSERT INTO `bcnm_info` VALUES (73,144,'birds_of_a_feather',NULL,NULL,900,30,3,73,15);
INSERT INTO `bcnm_info` VALUES (74,144,'crustacean_conundrum',NULL,NULL,900,20,3,0,15);
INSERT INTO `bcnm_info` VALUES (75,144,'grove_guardians',NULL,NULL,1800,30,6,0,15);
INSERT INTO `bcnm_info` VALUES (76,144,'hills_are_alive',NULL,NULL,1800,0,18,76,15);
INSERT INTO `bcnm_info` VALUES (77,144,'royal_jelly',NULL,NULL,900,40,3,0,15);
INSERT INTO `bcnm_info` VALUES (78,144,'final_bout',NULL,NULL,180,50,3,0,15);
INSERT INTO `bcnm_info` VALUES (79,144,'up_in_arms',NULL,NULL,900,60,3,79,15);
INSERT INTO `bcnm_info` VALUES (80,144,'copycat',NULL,NULL,1800,0,6,0,15);
INSERT INTO `bcnm_info` VALUES (81,144,'operation_desert_swarm',NULL,NULL,1800,0,6,81,15);
INSERT INTO `bcnm_info` VALUES (82,144,'prehistoric_pigeons',NULL,NULL,1800,0,6,82,15);
INSERT INTO `bcnm_info` VALUES (83,144,'palborough_project',NULL,NULL,900,0,3,0,15);
INSERT INTO `bcnm_info` VALUES (84,144,'shell_shocked',NULL,NULL,1800,0,6,0,15);
INSERT INTO `bcnm_info` VALUES (85,144,'beyond_infinity',NULL,NULL,600,0,6,0,6);
INSERT INTO `bcnm_info` VALUES (96,146,'rank_2_mission',NULL,NULL,1800,25,6,0,5);
INSERT INTO `bcnm_info` VALUES (97,146,'steamed_sprouts',NULL,NULL,1800,40,6,0,15);
INSERT INTO `bcnm_info` VALUES (98,146,'divine_punishers',NULL,NULL,1800,60,6,0,15);
INSERT INTO `bcnm_info` VALUES (99,146,'saintly_invitation',NULL,NULL,1800,99,6,0,5);
INSERT INTO `bcnm_info` VALUES (100,146,'treasures_and_tribulations',NULL,NULL,1800,50,6,100,15);
INSERT INTO `bcnm_info` VALUES (101,146,'shattering_stars',NULL,NULL,600,99,1,0,22);
INSERT INTO `bcnm_info` VALUES (102,146,'shattering_stars',NULL,NULL,600,99,1,0,22);
INSERT INTO `bcnm_info` VALUES (103,146,'shattering_stars',NULL,NULL,600,99,1,0,22);
INSERT INTO `bcnm_info` VALUES (104,146,'creeping_doom',NULL,NULL,900,30,3,0,15);
INSERT INTO `bcnm_info` VALUES (105,146,'charming_trio',NULL,NULL,900,20,3,105,15);
INSERT INTO `bcnm_info` VALUES (106,146,'harem_scarem',NULL,NULL,1800,30,6,0,15);
INSERT INTO `bcnm_info` VALUES (107,146,'early_bird_catches_the_wyrm',NULL,NULL,1800,0,18,107,15);
INSERT INTO `bcnm_info` VALUES (108,146,'royal_succession',NULL,NULL,900,40,3,0,15);
INSERT INTO `bcnm_info` VALUES (109,146,'rapid_raptors',NULL,NULL,900,50,3,0,15);
INSERT INTO `bcnm_info` VALUES (110,146,'wild_wild_whiskers',NULL,NULL,900,60,3,0,15);
INSERT INTO `bcnm_info` VALUES (111,146,'seasons_greetings',NULL,NULL,1800,0,6,0,15);
INSERT INTO `bcnm_info` VALUES (112,146,'royale_ramble',NULL,NULL,1800,0,6,0,15);
INSERT INTO `bcnm_info` VALUES (113,146,'moa_constrictors',NULL,NULL,1800,0,6,0,15);
INSERT INTO `bcnm_info` VALUES (114,146,'v_formation',NULL,NULL,900,0,3,0,15);
INSERT INTO `bcnm_info` VALUES (115,146,'avian_apostates',NULL,NULL,1800,0,6,0,15);
INSERT INTO `bcnm_info` VALUES (116,146,'beyond_infinity',NULL,NULL,600,0,6,0,6);
INSERT INTO `bcnm_info` VALUES (128,163,'temple_of_uggalepih',NULL,NULL,1800,99,6,0,5);
INSERT INTO `bcnm_info` VALUES (129,163,'jungle_boogymen',NULL,NULL,1800,60,6,10,15);
INSERT INTO `bcnm_info` VALUES (130,163,'amphibian_assault',NULL,NULL,1800,60,6,156,15);
INSERT INTO `bcnm_info` VALUES (131,163,'project_shantottofication',NULL,NULL,1800,99,6,0,5);
INSERT INTO `bcnm_info` VALUES (132,163,'whom_wilt_thou_call',NULL,NULL,1800,0,6,0,15);
INSERT INTO `bcnm_info` VALUES (160,165,'shadow_lord_battle',NULL,NULL,1800,90,6,0,5);
INSERT INTO `bcnm_info` VALUES (161,165,'where_two_paths_converge',NULL,NULL,1800,90,6,0,5);
INSERT INTO `bcnm_info` VALUES (162,165,'kindred_spirits',NULL,NULL,1800,90,6,0,15);
INSERT INTO `bcnm_info` VALUES (163,165,'survival_of_the_wisest',NULL,NULL,600,90,1,0,6);
INSERT INTO `bcnm_info` VALUES (164,165,'smash_a_malevolent_menace',NULL,NULL,1800,90,6,0,5);
INSERT INTO `bcnm_info` VALUES (192,168,'through_the_quicksand_caves',NULL,NULL,1800,99,6,0,5);
INSERT INTO `bcnm_info` VALUES (193,168,'legion_xi_comitatensis',NULL,NULL,1800,60,6,0,15);
INSERT INTO `bcnm_info` VALUES (194,168,'shattering_stars',NULL,NULL,600,99,1,0,22);
INSERT INTO `bcnm_info` VALUES (195,168,'shattering_stars',NULL,NULL,600,99,1,0,22);
INSERT INTO `bcnm_info` VALUES (196,168,'shattering_stars',NULL,NULL,600,99,1,0,22);
INSERT INTO `bcnm_info` VALUES (197,168,'cactuar_suave',NULL,NULL,1800,0,6,0,15);
INSERT INTO `bcnm_info` VALUES (198,168,'eye_of_the_storm',NULL,NULL,1800,0,6,0,15);
INSERT INTO `bcnm_info` VALUES (199,168,'scarlet_king',NULL,NULL,1800,0,6,0,15);
INSERT INTO `bcnm_info` VALUES (200,168,'cat_burglar_bares_fangs',NULL,NULL,1800,99,6,0,5);
INSERT INTO `bcnm_info` VALUES (201,168,'dragon_scales',NULL,NULL,600,99,1,0,6);
INSERT INTO `bcnm_info` VALUES (224,170,'moonlit_path',NULL,NULL,1800,80,6,0,5);
INSERT INTO `bcnm_info` VALUES (225,170,'moon_reading',NULL,NULL,1800,80,6,0,5);
INSERT INTO `bcnm_info` VALUES (226,170,'waking_the_beast_fullmoon',NULL,NULL,1800,0,18,0,5);
INSERT INTO `bcnm_info` VALUES (227,170,'battaru_royale',NULL,NULL,1800,80,6,0,5);
INSERT INTO `bcnm_info` VALUES (256,179,'return_to_delkfutts_tower',NULL,NULL,1800,75,6,0,5);
INSERT INTO `bcnm_info` VALUES (257,179,'indomitable_triumvirate_vs3',NULL,NULL,900,60,6,0,4);
INSERT INTO `bcnm_info` VALUES (258,179,'dauntless_duo_vs2',NULL,NULL,900,60,6,0,4);
INSERT INTO `bcnm_info` VALUES (259,179,'solitary_demolisher_vs1',NULL,NULL,900,60,6,0,4);
INSERT INTO `bcnm_info` VALUES (260,179,'heroines_combat',NULL,NULL,900,60,6,0,4);
INSERT INTO `bcnm_info` VALUES (261,179,'mercenary_camp',NULL,NULL,900,60,6,0,4);
INSERT INTO `bcnm_info` VALUES (262,179,'ode_of_life_bestowing',NULL,NULL,1800,75,6,0,5);
INSERT INTO `bcnm_info` VALUES (288,180,'ark_angels_1',NULL,NULL,1800,99,6,0,5);
INSERT INTO `bcnm_info` VALUES (289,180,'ark_angels_2',NULL,NULL,1800,99,6,0,5);
INSERT INTO `bcnm_info` VALUES (290,180,'ark_angels_3',NULL,NULL,1800,99,6,0,5);
INSERT INTO `bcnm_info` VALUES (291,180,'ark_angels_4',NULL,NULL,1800,99,6,0,5);
INSERT INTO `bcnm_info` VALUES (292,180,'ark_angels_5',NULL,NULL,1800,99,6,0,5);
INSERT INTO `bcnm_info` VALUES (293,180,'divine_might',NULL,NULL,1800,0,18,0,5);
INSERT INTO `bcnm_info` VALUES (320,181,'celestial_nexus',NULL,NULL,1800,75,6,0,5);
INSERT INTO `bcnm_info` VALUES (352,156,'fiat_lux',NULL,NULL,1800,0,6,0,15);
INSERT INTO `bcnm_info` VALUES (353,156,'darkness_descends',NULL,NULL,1800,99,6,0,5);
INSERT INTO `bcnm_info` VALUES (354,156,'bonds_of_mythril',NULL,NULL,1800,0,18,0,5);
INSERT INTO `bcnm_info` VALUES (385,182,'maiden_of_the_dusk',NULL,NULL,1800,99,6,0,5);
INSERT INTO `bcnm_info` VALUES (416,201,'trial_by_wind',NULL,NULL,1800,0,6,0,5);
INSERT INTO `bcnm_info` VALUES (417,201,'carbuncle_debacle',NULL,NULL,1800,99,18,0,5);
INSERT INTO `bcnm_info` VALUES (418,201,'trial-size_trial_by_wind',NULL,NULL,900,20,1,0,5);
INSERT INTO `bcnm_info` VALUES (419,201,'waking_the_beast',NULL,NULL,1800,0,18,0,5);
INSERT INTO `bcnm_info` VALUES (420,201,'sugar-coated_directive',NULL,NULL,1800,80,6,0,5);
-- 421 : High-tier Trial by Wind
INSERT INTO `bcnm_info` VALUES (448,202,'trial_by_lightning',NULL,NULL,1800,0,6,0,5);
INSERT INTO `bcnm_info` VALUES (449,202,'carbuncle_debacle',NULL,NULL,1800,99,18,0,5);
INSERT INTO `bcnm_info` VALUES (450,202,'trial-size_trial_by_lightning',NULL,NULL,900,20,1,0,5);
INSERT INTO `bcnm_info` VALUES (451,202,'waking_the_beast',NULL,NULL,1800,0,18,0,5);
INSERT INTO `bcnm_info` VALUES (452,202,'sugar-coated_directive',NULL,NULL,1800,80,6,0,5);
-- 453 : High-tier Trial by Lightning
INSERT INTO `bcnm_info` VALUES (480,203,'trial_by_ice',NULL,NULL,1800,0,6,0,5);
INSERT INTO `bcnm_info` VALUES (481,203,'class_reunion',NULL,NULL,1800,99,18,0,5);
INSERT INTO `bcnm_info` VALUES (482,203,'trial-size_trial_by_ice',NULL,NULL,900,20,1,0,5);
INSERT INTO `bcnm_info` VALUES (483,203,'waking_the_beast',NULL,NULL,1800,0,18,0,5);
INSERT INTO `bcnm_info` VALUES (484,203,'sugar-coated_directive',NULL,NULL,1800,80,6,0,5);
-- 485 : High-tier Trial by Ice
INSERT INTO `bcnm_info` VALUES (512,206,'rank_5_mission',NULL,NULL,900,50,6,0,5);
INSERT INTO `bcnm_info` VALUES (513,206,'come_into_my_parlor',NULL,NULL,1800,0,6,0,15);
INSERT INTO `bcnm_info` VALUES (514,206,'e-vase-ive_action',NULL,NULL,1800,0,6,0,15);
INSERT INTO `bcnm_info` VALUES (515,206,'infernal_swarm',NULL,NULL,1800,0,6,0,15);
INSERT INTO `bcnm_info` VALUES (516,206,'heir_to_the_light',NULL,NULL,1800,99,6,0,5);
INSERT INTO `bcnm_info` VALUES (517,206,'shattering_stars',NULL,NULL,600,99,1,0,22);
INSERT INTO `bcnm_info` VALUES (518,206,'shattering_stars',NULL,NULL,600,99,1,0,22);
INSERT INTO `bcnm_info` VALUES (519,206,'shattering_stars',NULL,NULL,600,99,1,0,22);
INSERT INTO `bcnm_info` VALUES (520,206,'demolition_squad',NULL,NULL,1800,60,6,0,15);
INSERT INTO `bcnm_info` VALUES (521,206,'die_by_the_sword',NULL,NULL,900,30,3,0,15);
INSERT INTO `bcnm_info` VALUES (522,206,'let_sleeping_dogs_die',NULL,NULL,1800,30,6,0,15);
INSERT INTO `bcnm_info` VALUES (523,206,'brothers_d_aurphe',NULL,NULL,1800,60,6,0,15);
INSERT INTO `bcnm_info` VALUES (524,206,'undying_promise',NULL,NULL,900,40,3,0,15);
INSERT INTO `bcnm_info` VALUES (525,206,'factory_rejects',NULL,NULL,1800,40,6,0,15);
INSERT INTO `bcnm_info` VALUES (526,206,'idol_thoughts',NULL,NULL,1800,50,6,0,15);
INSERT INTO `bcnm_info` VALUES (527,206,'awful_autopsy',NULL,NULL,900,50,3,0,15);
INSERT INTO `bcnm_info` VALUES (528,206,'celery',NULL,NULL,900,60,3,0,15);
INSERT INTO `bcnm_info` VALUES (529,206,'mirror_images',NULL,NULL,900,50,1,0,7);
INSERT INTO `bcnm_info` VALUES (530,206,'furious_finale',NULL,NULL,600,99,1,0,6);
INSERT INTO `bcnm_info` VALUES (531,206,'clash_of_the_comrades',NULL,NULL,600,0,1,0,7);
INSERT INTO `bcnm_info` VALUES (532,206,'those_who_lurk_in_shadows',NULL,NULL,1800,99,6,0,5);
INSERT INTO `bcnm_info` VALUES (533,206,'beyond_infinity',NULL,NULL,600,0,6,0,6);
INSERT INTO `bcnm_info` VALUES (544,207,'trial_by_fire',NULL,NULL,1800,0,6,0,5);
INSERT INTO `bcnm_info` VALUES (545,207,'trial-size_trial_by_fire',NULL,NULL,900,20,1,0,5);
INSERT INTO `bcnm_info` VALUES (546,207,'waking_the_beast',NULL,NULL,1800,0,18,0,5);
INSERT INTO `bcnm_info` VALUES (547,207,'sugar-coated_directive',NULL,NULL,1800,80,6,0,5);
-- 548 : High-tier Trial by Fire
INSERT INTO `bcnm_info` VALUES (576,209,'trial_by_earth',NULL,NULL,1800,0,6,0,5);
INSERT INTO `bcnm_info` VALUES (577,209,'puppet_master',NULL,NULL,1800,99,18,0,5);
INSERT INTO `bcnm_info` VALUES (578,209,'trial-size_trial_by_earth',NULL,NULL,900,20,1,0,5);
INSERT INTO `bcnm_info` VALUES (579,209,'waking_the_beast',NULL,NULL,1800,0,18,0,5);
INSERT INTO `bcnm_info` VALUES (580,209,'sugar-coated_directive',NULL,NULL,1800,80,6,0,5);
-- 581 : High-tier Trial by Earth
INSERT INTO `bcnm_info` VALUES (608,211,'trial_by_water',NULL,NULL,1800,0,6,0,5);
INSERT INTO `bcnm_info` VALUES (609,211,'trial-size_trial_by_water',NULL,NULL,900,20,1,0,5);
INSERT INTO `bcnm_info` VALUES (610,211,'waking_the_beast',NULL,NULL,1800,0,18,0,5);
INSERT INTO `bcnm_info` VALUES (611,211,'sugar-coated_directive',NULL,NULL,1800,80,6,0,5);
-- 612 : High-tier Trial by Earth
INSERT INTO `bcnm_info` VALUES (640,6,'flames_for_the_dead',NULL,NULL,1800,60,6,0,5);
INSERT INTO `bcnm_info` VALUES (641,6,'follow_the_white_rabbit',NULL,NULL,1800,75,18,0,15);
INSERT INTO `bcnm_info` VALUES (642,6,'when_hell_freezes_over',NULL,NULL,900,75,18,0,15);
INSERT INTO `bcnm_info` VALUES (643,6,'brothers',NULL,NULL,1800,75,18,180,15);
INSERT INTO `bcnm_info` VALUES (644,6,'holy_cow',NULL,NULL,1800,75,18,0,15);
INSERT INTO `bcnm_info` VALUES (672,8,'head_wind',NULL,NULL,1800,50,6,0,5);
INSERT INTO `bcnm_info` VALUES (673,8,'like_the_wind',NULL,NULL,900,75,18,179,15);
INSERT INTO `bcnm_info` VALUES (674,8,'sheep_in_antlions_clothing',NULL,NULL,1800,75,18,0,15);
INSERT INTO `bcnm_info` VALUES (675,8,'shell_we_dance',NULL,NULL,1800,75,18,0,15);
INSERT INTO `bcnm_info` VALUES (676,8,'totentanz',NULL,NULL,1800,75,18,0,15);
INSERT INTO `bcnm_info` VALUES (677,8,'tango_with_a_tracker',NULL,NULL,1800,0,6,0,7);
INSERT INTO `bcnm_info` VALUES (678,8,'requiem_of_a_sin',NULL,NULL,1800,0,6,0,7);
INSERT INTO `bcnm_info` VALUES (679,8,'antagonistic_ambuscade',NULL,NULL,900,0,6,0,15);
INSERT INTO `bcnm_info` VALUES (704,10,'darkness_named',NULL,NULL,1800,40,6,0,5);
INSERT INTO `bcnm_info` VALUES (705,10,'test_your_mite',NULL,NULL,1800,40,18,0,15);
INSERT INTO `bcnm_info` VALUES (706,10,'waking_dreams',NULL,NULL,1800,0,18,0,5);
INSERT INTO `bcnm_info` VALUES (736,13,'century_of_hardship',NULL,NULL,1800,60,6,0,5);
INSERT INTO `bcnm_info` VALUES (737,13,'return_to_the_depths',NULL,NULL,1800,90,6,0,7);
INSERT INTO `bcnm_info` VALUES (738,13,'bionic_bug',NULL,NULL,1800,0,18,0,15);
INSERT INTO `bcnm_info` VALUES (739,13,'pulling_the_strings',NULL,NULL,900,0,1,0,15);
INSERT INTO `bcnm_info` VALUES (740,13,'automaton_assault',NULL,NULL,900,60,6,0,15);
INSERT INTO `bcnm_info` VALUES (741,13,'mobline_comedy',NULL,NULL,900,0,6,0,15);
INSERT INTO `bcnm_info` VALUES (768,17,'ancient_flames_beckon',NULL,NULL,1800,30,6,0,5);
INSERT INTO `bcnm_info` VALUES (769,17,'simulant',NULL,NULL,1800,30,18,0,15);
INSERT INTO `bcnm_info` VALUES (770,17,'empty_hopes',NULL,NULL,900,0,6,0,5);
INSERT INTO `bcnm_info` VALUES (800,19,'ancient_flames_beckon',NULL,NULL,1800,30,6,0,5);
INSERT INTO `bcnm_info` VALUES (801,19,'you_are_what_you_eat',NULL,NULL,1800,30,18,0,15);
INSERT INTO `bcnm_info` VALUES (802,19,'empty_dreams',NULL,NULL,900,0,6,0,5);
INSERT INTO `bcnm_info` VALUES (832,21,'ancient_flames_backon',NULL,NULL,1800,30,6,0,5);
INSERT INTO `bcnm_info` VALUES (833,21,'playing_host',NULL,NULL,1800,30,18,0,15);
INSERT INTO `bcnm_info` VALUES (834,21,'empty_desires',NULL,NULL,900,0,6,0,5);
INSERT INTO `bcnm_info` VALUES (864,23,'desires_of_emptiness',NULL,NULL,1800,50,6,0,5);
INSERT INTO `bcnm_info` VALUES (865,23,'pulling_the_plug',NULL,NULL,1800,50,18,0,15);
INSERT INTO `bcnm_info` VALUES (866,23,'empty_aspirations',NULL,NULL,900,0,6,0,5);
INSERT INTO `bcnm_info` VALUES (896,29,'storms_of_fate',NULL,NULL,1800,0,18,0,7);
INSERT INTO `bcnm_info` VALUES (897,29,'wyrmking_descends',NULL,NULL,3600,0,18,0,15);
INSERT INTO `bcnm_info` VALUES (928,30,'ouryu_cometh',NULL,NULL,3600,0,18,0,15);
INSERT INTO `bcnm_info` VALUES (960,31,'ancient_vows',NULL,NULL,1800,40,6,0,5);
INSERT INTO `bcnm_info` VALUES (961,31,'savage',NULL,NULL,1800,50,6,0,5);
INSERT INTO `bcnm_info` VALUES (962,31,'fire_in_the_sky',NULL,NULL,900,40,18,0,15);
INSERT INTO `bcnm_info` VALUES (963,31,'bad_seed',NULL,NULL,1800,40,18,0,15);
INSERT INTO `bcnm_info` VALUES (964,31,'bugard_in_the_clouds',NULL,NULL,900,50,18,0,15);
INSERT INTO `bcnm_info` VALUES (965,31,'beloved_of_the_atlantes',NULL,NULL,1800,50,18,0,15);
INSERT INTO `bcnm_info` VALUES (966,31,'uninvited_guests',NULL,NULL,1800,0,18,0,7);
INSERT INTO `bcnm_info` VALUES (967,31,'nest_of_nightmares',NULL,NULL,900,0,6,0,15);
INSERT INTO `bcnm_info` VALUES (992,32,'one_to_be_feared',NULL,NULL,2700,60,6,0,5);
INSERT INTO `bcnm_info` VALUES (993,32,'warriors_path',NULL,NULL,1800,99,6,0,5);
INSERT INTO `bcnm_info` VALUES (1024,35,'when_angels_fall',NULL,NULL,1800,0,6,0,5);
INSERT INTO `bcnm_info` VALUES (1056,36,'dawn',NULL,NULL,1800,85,6,0,5);
INSERT INTO `bcnm_info` VALUES (1057,36,'apocalypse_nigh',NULL,NULL,1800,75,6,0,7);
INSERT INTO `bcnm_info` VALUES (1088,57,'call_to_arms',NULL,NULL,1800,60,6,0,15);
INSERT INTO `bcnm_info` VALUES (1089,57,'compliments_to_the_chef',NULL,NULL,1800,75,6,0,15);
INSERT INTO `bcnm_info` VALUES (1090,57,'puppetmaster_blues',NULL,NULL,1800,75,6,0,7);
INSERT INTO `bcnm_info` VALUES (1091,57,'breaking_the_bonds_of_fate',NULL,NULL,600,75,1,0,6);
INSERT INTO `bcnm_info` VALUES (1092,57,'legacy_of_the_lost',NULL,NULL,1800,99,6,0,5);
INSERT INTO `bcnm_info` VALUES (1120,64,'tough_nut_to_crack',NULL,NULL,1800,60,6,0,15);
INSERT INTO `bcnm_info` VALUES (1121,64,'happy_caster',NULL,NULL,1800,75,6,0,15);
INSERT INTO `bcnm_info` VALUES (1122,64,'omens',NULL,NULL,1800,75,18,0,7);
INSERT INTO `bcnm_info` VALUES (1123,64,'achieving_true_power',NULL,NULL,600,75,1,0,6);
INSERT INTO `bcnm_info` VALUES (1124,64,'shield_of_diplomacy',NULL,NULL,1800,99,6,0,5);
INSERT INTO `bcnm_info` VALUES (1152,67,'making_a_mockery',NULL,NULL,1800,60,6,0,15);
INSERT INTO `bcnm_info` VALUES (1153,67,'shadows_of_the_mind',NULL,NULL,1800,90,6,0,15);
INSERT INTO `bcnm_info` VALUES (1154,67,'beast_within',NULL,NULL,600,90,1,0,6);
INSERT INTO `bcnm_info` VALUES (1155,67,'moment_of_truth',NULL,NULL,1800,0,6,0,7);
INSERT INTO `bcnm_info` VALUES (1156,67,'puppet_in_peril',NULL,NULL,1800,99,6,0,5);
INSERT INTO `bcnm_info` VALUES (1184,78,'rider_cometh',NULL,NULL,900,0,6,0,5);
INSERT INTO `bcnm_info` VALUES (1280,186,'dynamis_bastok',NULL,NULL,3600,0,64,0,7);
INSERT INTO `bcnm_info` VALUES (1281,185,'dynamis_sandoria',NULL,NULL,3600,0,64,0,7);
INSERT INTO `bcnm_info` VALUES (1282,187,'dynamis_windurst',NULL,NULL,3600,0,64,0,7);
INSERT INTO `bcnm_info` VALUES (1283,188,'dynamis_jeuno',NULL,NULL,3600,0,64,0,7);
INSERT INTO `bcnm_info` VALUES (1284,134,'dynamis_beaucedine',NULL,NULL,3600,0,64,0,7);
INSERT INTO `bcnm_info` VALUES (1285,135,'dynamis_xarcabard',NULL,NULL,3600,0,64,0,7);
INSERT INTO `bcnm_info` VALUES (1286,39,'dynamis_Valkurm',NULL,NULL,3600,0,36,0,7);
INSERT INTO `bcnm_info` VALUES (1287,40,'dynamis_Buburimu',NULL,NULL,3600,0,36,0,7);
INSERT INTO `bcnm_info` VALUES (1288,41,'dynamis_Qufim',NULL,NULL,3600,0,36,0,7);
INSERT INTO `bcnm_info` VALUES (1289,42,'dynamis_Tavnazia',NULL,NULL,3600,0,18,0,7);

INSERT INTO `bcnm_info` VALUES (1290,38,'NW_Apollyon',NULL,NULL,1800,0,18,0,7);
INSERT INTO `bcnm_info` VALUES (1291,38,'SW_Apollyon',NULL,NULL,1800,0,18,0,7);

INSERT INTO `bcnm_info` VALUES (1292,38,'NE_Apollyon',NULL,NULL,1800,0,18,0,7);
INSERT INTO `bcnm_info` VALUES (1293,38,'SE_Apollyon',NULL,NULL,1800,0,18,0,7);
INSERT INTO `bcnm_info` VALUES (1294,38,'CS_Apollyon',NULL,NULL,1200,0,18,0,7);
INSERT INTO `bcnm_info` VALUES (1295,38,'CS_Apollyon_II',NULL,NULL,1200,0,18,0,7);
INSERT INTO `bcnm_info` VALUES (1296,38,'Central_Apollyon',NULL,NULL,1800,0,18,0,7);
INSERT INTO `bcnm_info` VALUES (1297,38,'Central_Apollyon_II',NULL,NULL,1800,0,18,0,7);

INSERT INTO `bcnm_info` VALUES (1298,37,'Temenos_Western_Tower',NULL,NULL,1800,0,18,0,7);
INSERT INTO `bcnm_info` VALUES (1299,37,'Temenos_Northern_Tower',NULL,NULL,1800,0,18,0,7);
INSERT INTO `bcnm_info` VALUES (1300,37,'Temenos_Eastern_Tower',NULL,NULL,1800,0,18,0,7);
INSERT INTO `bcnm_info` VALUES (1301,37,'Central_Temenos_Basement',NULL,NULL,900,0,18,0,7);
INSERT INTO `bcnm_info` VALUES (1302,37,'Central_Temenos_Basement_II',NULL,NULL,900,0,18,0,7);
INSERT INTO `bcnm_info` VALUES (1303,37,'Central_Temenos_1st_Floor',NULL,NULL,2700,0,18,0,7);
INSERT INTO `bcnm_info` VALUES (1304,37,'Central_Temenos_2nd_Floor',NULL,NULL,2700,0,18,0,7);
INSERT INTO `bcnm_info` VALUES (1305,37,'Central_Temenos_3rd_Floor',NULL,NULL,2700,0,18,0,7);
INSERT INTO `bcnm_info` VALUES (1306,37,'Central_Temenos_4th_Floor',NULL,NULL,3600,0,18,0,7);
INSERT INTO `bcnm_info` VALUES (1307,37,'Central_Temenos_4th_Floor_II',NULL,NULL,3600,0,18,0,7);

-- INSERT INTO `bcnm_info` VALUES (1308,255,'The_Wyrm_God',null,null,1800,0,18,0,7);

-- Dump completed on 2017-01-31 10:38:18
