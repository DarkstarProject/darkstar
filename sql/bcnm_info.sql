-- MySQL dump 10.13  Distrib 5.7.18, for Win64 (x86_64)
--
-- Host: localhost    Database: dspdb
-- ------------------------------------------------------
-- Server version   5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bcnm_info`
--

DROP TABLE IF EXISTS `bcnm_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bcnm_info` (
  `bcnmId` smallint(5) unsigned NOT NULL,
  `zoneId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL,
  `fastestName` varchar(15) DEFAULT 'Not Set!',
  `fastestPartySize` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `fastestTime` int(10) unsigned DEFAULT '1',
  `timeLimit` smallint(5) unsigned NOT NULL DEFAULT '1800',
  `levelCap` smallint(5) unsigned NOT NULL DEFAULT '75',
  `partySize` smallint(5) unsigned NOT NULL DEFAULT '6',
  `lootDropId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `rules` smallint(5) unsigned NOT NULL DEFAULT '0',
  `isMission` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`bcnmId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=56;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bcnm_info`
--

LOCK TABLES `bcnm_info` WRITE;
/*!40000 ALTER TABLE `bcnm_info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `bcnm_info` VALUES (0,139,'rank_2_mission','nobody',1,18,1800,25,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (1,139,'tails_of_woe','nobody',1,18,1800,40,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (2,139,'dismemberment_brigade','nobody',1,18,1800,60,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (3,139,'the_secret_weapon','nobody',1,18,1800,99,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (4,139,'hostile_herbivores','nobody',1,18,1800,50,6,14,15,0);
INSERT INTO `bcnm_info` VALUES (5,139,'shattering_stars','nobody',1,18,600,99,1,0,22,0);
INSERT INTO `bcnm_info` VALUES (6,139,'shattering_stars','nobody',1,18,600,99,1,0,22,0);
INSERT INTO `bcnm_info` VALUES (7,139,'shattering_stars','nobody',1,18,600,99,1,0,22,0);
INSERT INTO `bcnm_info` VALUES (8,139,'carapace_combatants','nobody',1,18,900,30,3,0,15,0);
INSERT INTO `bcnm_info` VALUES (9,139,'shooting_fish','nobody',1,18,900,20,3,0,15,0);
INSERT INTO `bcnm_info` VALUES (10,139,'dropping_like_flies','nobody',1,18,1800,30,6,12,15,0);
INSERT INTO `bcnm_info` VALUES (11,139,'horns_of_war','nobody',1,18,1800,0,18,11,15,0);
INSERT INTO `bcnm_info` VALUES (12,139,'under_observation','nobody',1,18,900,40,3,16,15,0);
INSERT INTO `bcnm_info` VALUES (13,139,'eye_of_the_tiger','nobody',1,18,900,50,3,0,15,0);
INSERT INTO `bcnm_info` VALUES (14,139,'shots_in_the_dark','nobody',1,18,900,60,3,0,15,0);
INSERT INTO `bcnm_info` VALUES (15,139,'double_dragonian','nobody',1,18,1800,0,6,15,15,0);
INSERT INTO `bcnm_info` VALUES (16,139,'todays_horoscope','nobody',1,18,1800,0,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (17,139,'contaminated_colosseum','nobody',1,18,1800,0,6,17,15,0);
INSERT INTO `bcnm_info` VALUES (18,139,'kindergarten_cap','nobody',1,18,900,0,3,0,15,0);
INSERT INTO `bcnm_info` VALUES (19,139,'last_orc-shunned_hero','nobody',1,18,1800,0,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (20,139,'beyond_infinity','nobody',1,18,600,0,6,0,6,0);
INSERT INTO `bcnm_info` VALUES (32,140,'save_the_children','nobody',1,18,600,0,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (33,140,'holy_crest','nobody',1,18,600,75,6,0,7,0);
INSERT INTO `bcnm_info` VALUES (34,140,'wings_of_fury','nobody',1,18,900,20,3,34,15,0);
INSERT INTO `bcnm_info` VALUES (35,140,'petrifying_pair','nobody',1,18,900,30,3,35,15,0);
INSERT INTO `bcnm_info` VALUES (36,140,'toadal_recall','nobody',1,18,1800,30,6,36,15,0);
INSERT INTO `bcnm_info` VALUES (37,140,'mirror_mirror','nobody',1,18,900,40,3,0,7,0);
INSERT INTO `bcnm_info` VALUES (64,144,'rank_2_mission','nobody',1,18,1800,25,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (65,144,'worms_turn','nobody',1,18,1800,40,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (66,144,'grimshell_shocktroopers','nobody',1,18,1800,60,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (67,144,'on_my_way','nobody',1,18,1800,99,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (68,144,'thief_in_norg','nobody',1,18,1800,99,6,0,7,0);
INSERT INTO `bcnm_info` VALUES (69,144,'3_2_1','nobody',1,18,1800,50,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (70,144,'shattering_stars','nobody',1,18,600,99,1,0,22,0);
INSERT INTO `bcnm_info` VALUES (71,144,'shattering_stars','nobody',1,18,600,99,1,0,22,0);
INSERT INTO `bcnm_info` VALUES (72,144,'shattering_stars','nobody',1,18,600,99,1,0,22,0);
INSERT INTO `bcnm_info` VALUES (73,144,'birds_of_a_feather','nobody',1,18,900,30,3,73,15,0);
INSERT INTO `bcnm_info` VALUES (74,144,'crustacean_conundrum','nobody',1,18,900,20,3,0,15,0);
INSERT INTO `bcnm_info` VALUES (75,144,'grove_guardians','nobody',1,18,1800,30,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (76,144,'hills_are_alive','nobody',1,18,1800,0,18,76,15,0);
INSERT INTO `bcnm_info` VALUES (77,144,'royal_jelly','nobody',1,18,900,40,3,0,15,0);
INSERT INTO `bcnm_info` VALUES (78,144,'final_bout','nobody',1,18,180,50,3,0,15,0);
INSERT INTO `bcnm_info` VALUES (79,144,'up_in_arms','nobody',1,18,900,60,3,79,15,0);
INSERT INTO `bcnm_info` VALUES (80,144,'copycat','nobody',1,18,1800,0,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (81,144,'operation_desert_swarm','nobody',1,18,1800,0,6,81,15,0);
INSERT INTO `bcnm_info` VALUES (82,144,'prehistoric_pigeons','nobody',1,18,1800,0,6,82,15,0);
INSERT INTO `bcnm_info` VALUES (83,144,'palborough_project','nobody',1,18,900,0,3,0,15,0);
INSERT INTO `bcnm_info` VALUES (84,144,'shell_shocked','nobody',1,18,1800,0,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (85,144,'beyond_infinity','nobody',1,18,600,0,6,0,6,0);
INSERT INTO `bcnm_info` VALUES (96,146,'rank_2_mission','nobody',1,18,1800,25,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (97,146,'steamed_sprouts','nobody',1,18,1800,40,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (98,146,'divine_punishers','nobody',1,18,1800,60,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (99,146,'saintly_invitation','nobody',1,18,1800,99,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (100,146,'treasure_and_tribulations','nobody',1,18,1800,50,6,100,15,0);
INSERT INTO `bcnm_info` VALUES (101,146,'shattering_stars','nobody',1,18,600,99,1,0,22,0);
INSERT INTO `bcnm_info` VALUES (102,146,'shattering_stars','nobody',1,18,600,99,1,0,22,0);
INSERT INTO `bcnm_info` VALUES (103,146,'shattering_stars','nobody',1,18,600,99,1,0,22,0);
INSERT INTO `bcnm_info` VALUES (104,146,'creeping_doom','nobody',1,18,900,30,3,104,15,0);
INSERT INTO `bcnm_info` VALUES (105,146,'charming_trio','nobody',1,18,900,20,3,105,15,0);
INSERT INTO `bcnm_info` VALUES (106,146,'harem_scarem','nobody',1,18,1800,30,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (107,146,'early_bird_catches_the_wyrm','nobody',1,18,1800,0,18,107,15,0);
INSERT INTO `bcnm_info` VALUES (108,146,'royal_succession','nobody',1,18,900,40,3,0,15,0);
INSERT INTO `bcnm_info` VALUES (109,146,'rapid_raptors','nobody',1,18,900,50,3,0,15,0);
INSERT INTO `bcnm_info` VALUES (110,146,'wild_wild_whiskers','nobody',1,18,900,60,3,0,15,0);
INSERT INTO `bcnm_info` VALUES (111,146,'seasons_greetings','nobody',1,18,1800,0,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (112,146,'royale_ramble','nobody',1,18,1800,0,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (113,146,'moa_constrictors','nobody',1,18,1800,0,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (114,146,'v_formation','nobody',1,18,900,0,3,0,15,0);
INSERT INTO `bcnm_info` VALUES (115,146,'avian_apostates','nobody',1,18,1800,0,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (116,146,'beyond_infinity','nobody',1,18,600,0,6,0,6,0);
INSERT INTO `bcnm_info` VALUES (128,163,'temple_of_uggalepih','nobody',1,18,1800,99,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (129,163,'jungle_boogymen','nobody',1,18,1800,60,6,10,15,0);
INSERT INTO `bcnm_info` VALUES (130,163,'amphibian_assault','nobody',1,18,1800,60,6,156,15,0);
INSERT INTO `bcnm_info` VALUES (131,163,'project_shantottofication','nobody',1,18,1800,99,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (132,163,'whom_wilt_thou_call','nobody',1,18,1800,0,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (160,165,'shadow_lord_battle','nobody',1,18,1800,90,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (161,165,'where_two_paths_converge','nobody',1,18,1800,90,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (162,165,'kindred_spirits','nobody',1,18,1800,90,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (163,165,'survival_of_the_wisest','nobody',1,18,600,90,1,0,6,0);
INSERT INTO `bcnm_info` VALUES (164,165,'smash_a_malevolent_menace','nobody',1,18,1800,90,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (192,168,'through_the_quicksand_caves','nobody',1,18,1800,99,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (193,168,'legion_xi_comitatensis','nobody',1,18,1800,60,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (194,168,'shattering_stars','nobody',1,18,600,99,1,0,22,0);
INSERT INTO `bcnm_info` VALUES (195,168,'shattering_stars','nobody',1,18,600,99,1,0,22,0);
INSERT INTO `bcnm_info` VALUES (196,168,'shattering_stars','nobody',1,18,600,99,1,0,22,0);
INSERT INTO `bcnm_info` VALUES (197,168,'cactuar_suave','nobody',1,18,1800,0,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (198,168,'eye_of_the_storm','nobody',1,18,1800,0,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (199,168,'scarlet_king','nobody',1,18,1800,0,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (200,168,'cat_burglar_bares_fangs','nobody',1,18,1800,99,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (201,168,'dragon_scales','nobody',1,18,600,99,1,0,6,0);
INSERT INTO `bcnm_info` VALUES (224,170,'moonlit_path','nobody',1,18,1800,80,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (225,170,'moon_reading','nobody',1,18,1800,80,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (226,170,'waking_the_beast_fullmoon','nobody',1,18,1800,0,18,0,5,0);
INSERT INTO `bcnm_info` VALUES (227,170,'battaru_royale','nobody',1,18,1800,80,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (256,179,'return_to_delkfutts_tower','nobody',1,18,1800,75,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (257,179,'indomitable_triumvirate_vs3','nobody',1,18,900,60,6,0,4,0);
INSERT INTO `bcnm_info` VALUES (258,179,'dauntless_duo_vs2','nobody',1,18,900,60,6,0,4,0);
INSERT INTO `bcnm_info` VALUES (259,179,'solitary_demolisher_vs1','nobody',1,18,900,60,6,0,4,0);
INSERT INTO `bcnm_info` VALUES (260,179,'heroines_combat','nobody',1,18,900,60,6,0,4,0);
INSERT INTO `bcnm_info` VALUES (261,179,'mercenary_camp','nobody',1,18,900,60,6,0,4,0);
INSERT INTO `bcnm_info` VALUES (262,179,'ode_of_life_bestowing','nobody',1,18,1800,75,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (288,180,'ark_angels_1','nobody',1,18,1800,99,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (289,180,'ark_angels_2','nobody',1,18,1800,99,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (290,180,'ark_angels_3','nobody',1,18,1800,99,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (291,180,'ark_angels_4','nobody',1,18,1800,99,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (292,180,'ark_angels_5','nobody',1,18,1800,99,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (293,180,'divine_might','nobody',1,18,1800,0,18,0,5,1);
INSERT INTO `bcnm_info` VALUES (320,181,'celestial_nexus','nobody',1,18,1800,75,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (352,156,'fiat_lux','nobody',1,18,1800,0,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (353,156,'darkness_descends','nobody',1,18,1800,99,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (354,156,'bonds_of_mythril','nobody',1,18,1800,0,18,0,5,0);
INSERT INTO `bcnm_info` VALUES (385,182,'maiden_of_the_dusk','nobody',1,18,1800,99,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (416,201,'trial_by_wind','nobody',1,18,1800,0,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (417,201,'carbuncle_debacle','nobody',1,18,1800,99,18,0,5,0);
INSERT INTO `bcnm_info` VALUES (418,201,'trial-size_trial_by_wind','nobody',1,18,900,20,1,0,5,0);
INSERT INTO `bcnm_info` VALUES (419,201,'waking_the_beast','nobody',1,18,1800,0,18,0,5,0);
INSERT INTO `bcnm_info` VALUES (420,201,'sugar-coated_directive','nobody',1,18,1800,80,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (448,202,'trial_by_lightning','nobody',1,18,1800,0,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (449,202,'carbuncle_debacle','nobody',1,18,1800,99,18,0,5,0);
INSERT INTO `bcnm_info` VALUES (450,202,'trial-size_trial_by_lightning','nobody',1,18,900,20,1,0,5,0);
INSERT INTO `bcnm_info` VALUES (451,202,'waking_the_beast','nobody',1,18,1800,0,18,0,5,0);
INSERT INTO `bcnm_info` VALUES (452,202,'sugar-coated_directive','nobody',1,18,1800,80,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (480,203,'trial_by_ice','nobody',1,18,1800,0,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (481,203,'class_reunion','nobody',1,18,1800,99,18,0,5,0);
INSERT INTO `bcnm_info` VALUES (482,203,'trial-size_trial_by_ice','nobody',1,18,900,20,1,0,5,0);
INSERT INTO `bcnm_info` VALUES (483,203,'waking_the_beast','nobody',1,18,1800,0,18,0,5,0);
INSERT INTO `bcnm_info` VALUES (484,203,'sugar-coated_directive','nobody',1,18,1800,80,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (512,206,'rank_5_mission','nobody',1,18,900,50,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (513,206,'come_into_my_parlor','nobody',1,18,1800,0,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (514,206,'e-vase-ive_action','nobody',1,18,1800,0,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (515,206,'infernal_swarm','nobody',1,18,1800,0,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (516,206,'heir_to_the_light','nobody',1,18,1800,99,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (517,206,'shattering_stars','nobody',1,18,600,99,1,0,22,0);
INSERT INTO `bcnm_info` VALUES (518,206,'shattering_stars','nobody',1,18,600,99,1,0,22,0);
INSERT INTO `bcnm_info` VALUES (519,206,'shattering_stars','nobody',1,18,600,99,1,0,22,0);
INSERT INTO `bcnm_info` VALUES (520,206,'demolition_squad','nobody',1,18,1800,60,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (521,206,'die_by_the_sword','nobody',1,18,900,30,3,0,15,0);
INSERT INTO `bcnm_info` VALUES (522,206,'let_sleeping_dogs_die','nobody',1,18,1800,30,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (523,206,'brothers_d_aurphe','nobody',1,18,1800,60,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (524,206,'undying_promise','nobody',1,18,900,40,3,0,15,0);
INSERT INTO `bcnm_info` VALUES (525,206,'factory_rejects','nobody',1,18,1800,40,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (526,206,'idol_thoughts','nobody',1,18,1800,50,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (527,206,'awful_autopsy','nobody',1,18,900,50,3,0,15,0);
INSERT INTO `bcnm_info` VALUES (528,206,'celery','nobody',1,18,900,60,3,0,15,0);
INSERT INTO `bcnm_info` VALUES (529,206,'mirror_images','nobody',1,18,900,50,1,0,7,0);
INSERT INTO `bcnm_info` VALUES (530,206,'furious_finale','nobody',1,18,600,99,1,0,6,0);
INSERT INTO `bcnm_info` VALUES (531,206,'clash_of_the_comrades','nobody',1,18,600,0,1,0,7,0);
INSERT INTO `bcnm_info` VALUES (532,206,'those_who_lurk_in_shadows','nobody',1,18,1800,99,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (533,206,'beyond_infinity','nobody',1,18,600,0,6,0,6,0);
INSERT INTO `bcnm_info` VALUES (544,207,'trial_by_fire','nobody',1,18,1800,0,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (545,207,'trial-size_trial_by_fire','nobody',1,18,900,20,1,0,5,0);
INSERT INTO `bcnm_info` VALUES (546,207,'waking_the_beast','nobody',1,18,1800,0,18,0,5,0);
INSERT INTO `bcnm_info` VALUES (547,207,'sugar-coated_directive','nobody',1,18,1800,80,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (576,209,'trial_by_earth','nobody',1,18,1800,0,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (577,209,'puppet_master','nobody',1,18,1800,99,18,0,5,0);
INSERT INTO `bcnm_info` VALUES (578,209,'trial-size_trial_by_earth','nobody',1,18,900,20,1,0,5,0);
INSERT INTO `bcnm_info` VALUES (579,209,'waking_the_beast','nobody',1,18,1800,0,18,0,5,0);
INSERT INTO `bcnm_info` VALUES (580,209,'sugar-coated_directive','nobody',1,18,1800,80,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (608,211,'trial_by_water','nobody',1,18,1800,0,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (609,211,'trial-size_trial_by_water','nobody',1,18,900,20,1,0,5,0);
INSERT INTO `bcnm_info` VALUES (610,211,'waking_the_beast','nobody',1,18,1800,0,18,0,5,0);
INSERT INTO `bcnm_info` VALUES (611,211,'sugar-coated_directive','nobody',1,18,1800,80,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (640,6,'flames_for_the_dead','nobody',1,18,1800,60,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (641,6,'follow_the_white_rabbit','nobody',1,18,1800,75,18,0,15,0);
INSERT INTO `bcnm_info` VALUES (642,6,'when_hell_freezes_over','nobody',1,18,900,75,18,0,15,0);
INSERT INTO `bcnm_info` VALUES (643,6,'brothers','nobody',1,18,1800,75,18,180,15,0);
INSERT INTO `bcnm_info` VALUES (644,6,'holy_cow','nobody',1,18,1800,75,18,0,15,0);
INSERT INTO `bcnm_info` VALUES (672,8,'head_wind','nobody',1,18,1800,50,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (673,8,'like_the_wind','nobody',1,18,900,75,18,179,15,0);
INSERT INTO `bcnm_info` VALUES (674,8,'sheep_in_antlions_clothing','nobody',1,18,1800,75,18,0,15,0);
INSERT INTO `bcnm_info` VALUES (675,8,'shell_we_dance','nobody',1,18,1800,75,18,0,15,0);
INSERT INTO `bcnm_info` VALUES (676,8,'totentanz','nobody',1,18,1800,75,18,0,15,0);
INSERT INTO `bcnm_info` VALUES (677,8,'tango_with_a_tracker','nobody',1,18,1800,0,6,0,7,0);
INSERT INTO `bcnm_info` VALUES (678,8,'requiem_of_a_sin','nobody',1,18,1800,0,6,0,7,0);
INSERT INTO `bcnm_info` VALUES (679,8,'antagonistic_ambuscade','nobody',1,18,900,0,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (704,10,'darkness_named','nobody',1,18,1800,40,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (705,10,'test_your_mite','nobody',1,18,1800,40,18,0,15,0);
INSERT INTO `bcnm_info` VALUES (706,10,'waking_dreams','nobody',1,18,1800,0,18,0,5,0);
INSERT INTO `bcnm_info` VALUES (736,13,'century_of_hardship','nobody',1,18,1800,60,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (737,13,'return_to_the_depths','nobody',1,18,1800,90,6,0,7,0);
INSERT INTO `bcnm_info` VALUES (738,13,'bionic_bug','nobody',1,18,1800,0,18,0,15,0);
INSERT INTO `bcnm_info` VALUES (739,13,'pulling_the_strings','nobody',1,18,900,0,1,0,15,0);
INSERT INTO `bcnm_info` VALUES (740,13,'automaton_assault','nobody',1,18,900,60,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (741,13,'mobline_comedy','nobody',1,18,900,0,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (768,17,'ancient_flames_beckon','nobody',1,18,1800,30,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (769,17,'simulant','nobody',1,18,1800,30,18,0,15,0);
INSERT INTO `bcnm_info` VALUES (770,17,'empty_hopes','nobody',1,18,900,0,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (800,19,'ancient_flames_beckon','nobody',1,18,1800,30,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (801,19,'you_are_what_you_eat','nobody',1,18,1800,30,18,0,15,0);
INSERT INTO `bcnm_info` VALUES (802,19,'empty_dreams','nobody',1,18,900,0,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (832,21,'ancient_flames_backon','nobody',1,18,1800,30,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (833,21,'playing_host','nobody',1,18,1800,30,18,0,15,0);
INSERT INTO `bcnm_info` VALUES (834,21,'empty_desires','nobody',1,18,900,0,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (864,23,'desires_of_emptiness','nobody',1,18,1800,50,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (865,23,'pulling_the_plug','nobody',1,18,1800,50,18,0,15,0);
INSERT INTO `bcnm_info` VALUES (866,23,'empty_aspirations','nobody',1,18,900,0,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (896,29,'storms_of_fate','nobody',1,18,1800,0,18,0,7,0);
INSERT INTO `bcnm_info` VALUES (897,29,'wyrmking_descends','nobody',1,18,3600,0,18,0,15,0);
INSERT INTO `bcnm_info` VALUES (928,30,'ouryu_cometh','nobody',1,18,3600,0,18,0,15,0);
INSERT INTO `bcnm_info` VALUES (960,31,'ancient_vows','nobody',1,18,1800,40,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (961,31,'savage','nobody',1,18,1800,50,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (962,31,'fire_in_the_sky','nobody',1,18,900,40,18,0,15,0);
INSERT INTO `bcnm_info` VALUES (963,31,'bad_seed','nobody',1,18,1800,40,18,0,15,0);
INSERT INTO `bcnm_info` VALUES (964,31,'bugard_in_the_clouds','nobody',1,18,900,50,18,0,15,0);
INSERT INTO `bcnm_info` VALUES (965,31,'beloved_of_the_atlantes','nobody',1,18,1800,50,18,0,15,0);
INSERT INTO `bcnm_info` VALUES (966,31,'uninvited_guests','nobody',1,18,1800,0,18,0,7,0);
INSERT INTO `bcnm_info` VALUES (967,31,'nest_of_nightmares','nobody',1,18,900,0,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (992,32,'one_to_be_feared','nobody',1,18,2700,60,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (993,32,'warriors_path','nobody',1,18,1800,99,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (1024,35,'when_angels_fall','nobody',1,18,1800,0,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (1056,36,'dawn','nobody',1,18,1800,85,6,0,5,1);
INSERT INTO `bcnm_info` VALUES (1057,36,'apocalypse_nigh','nobody',1,18,1800,75,6,0,7,0);
INSERT INTO `bcnm_info` VALUES (1088,57,'call_to_arms','nobody',1,18,1800,60,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (1089,57,'compliments_to_the_chef','nobody',1,18,1800,75,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (1090,57,'puppetmaster_blues','nobody',1,18,1800,75,6,0,7,0);
INSERT INTO `bcnm_info` VALUES (1091,57,'breaking_the_bonds_of_fate','nobody',1,18,600,75,1,0,6,0);
INSERT INTO `bcnm_info` VALUES (1092,57,'legacy_of_the_lost','nobody',1,18,1800,99,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (1120,64,'tough_nut_to_crack','nobody',1,18,1800,60,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (1121,64,'happy_caster','nobody',1,18,1800,75,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (1122,64,'omens','nobody',1,18,1800,75,18,0,7,0);
INSERT INTO `bcnm_info` VALUES (1123,64,'achieving_true_power','nobody',1,18,600,75,1,0,6,0);
INSERT INTO `bcnm_info` VALUES (1124,64,'shield_of_diplomacy','nobody',1,18,1800,99,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (1152,67,'making_a_mockery','nobody',1,18,1800,60,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (1153,67,'shadows_of_the_mind','nobody',1,18,1800,90,6,0,15,0);
INSERT INTO `bcnm_info` VALUES (1154,67,'beast_within','nobody',1,18,600,90,1,0,6,0);
INSERT INTO `bcnm_info` VALUES (1155,67,'moment_of_truth','nobody',1,18,1800,0,6,0,7,0);
INSERT INTO `bcnm_info` VALUES (1156,67,'puppet_in_peril','nobody',1,18,1800,99,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (1184,78,'rider_cometh','nobody',1,18,900,0,6,0,5,0);
INSERT INTO `bcnm_info` VALUES (1280,186,'dynamis_bastok','nobody',1,18,3600,0,64,0,7,0);
INSERT INTO `bcnm_info` VALUES (1281,185,'dynamis_sandoria','nobody',1,18,3600,0,64,0,7,0);
INSERT INTO `bcnm_info` VALUES (1282,187,'dynamis_windurst','nobody',1,18,3600,0,64,0,7,0);
INSERT INTO `bcnm_info` VALUES (1283,188,'dynamis_jeuno','nobody',1,18,3600,0,64,0,7,0);
INSERT INTO `bcnm_info` VALUES (1284,134,'dynamis_beaucedine','nobody',1,18,3600,0,64,0,7,0);
INSERT INTO `bcnm_info` VALUES (1285,135,'dynamis_xarcabard','nobody',1,18,3600,0,64,0,7,0);
INSERT INTO `bcnm_info` VALUES (1286,39,'dynamis_valkurm','nobody',1,18,3600,0,36,0,7,0);
INSERT INTO `bcnm_info` VALUES (1287,40,'dynamis_buburimu','nobody',1,18,3600,0,36,0,7,0);
INSERT INTO `bcnm_info` VALUES (1288,41,'dynamis_qufim','nobody',1,18,3600,0,36,0,7,0);
INSERT INTO `bcnm_info` VALUES (1289,42,'dynamis_tavnazia','nobody',1,18,3600,0,18,0,7,0);
INSERT INTO `bcnm_info` VALUES (1290,38,'nw_apollyon','nobody',1,18,1800,0,18,0,7,0);
INSERT INTO `bcnm_info` VALUES (1291,38,'sw_apollyon','nobody',1,18,1800,0,18,0,7,0);
INSERT INTO `bcnm_info` VALUES (1292,38,'ne_apollyon','nobody',1,18,1800,0,18,0,7,0);
INSERT INTO `bcnm_info` VALUES (1293,38,'se_apollyon','nobody',1,18,1800,0,18,0,7,0);
INSERT INTO `bcnm_info` VALUES (1294,38,'cs_apollyon','nobody',1,18,1200,0,18,0,7,0);
INSERT INTO `bcnm_info` VALUES (1295,38,'cs_apollyon_ii','nobody',1,18,1200,0,18,0,7,0);
INSERT INTO `bcnm_info` VALUES (1296,38,'central_apollyon','nobody',1,18,1800,0,18,0,7,0);
INSERT INTO `bcnm_info` VALUES (1297,38,'central_apollyon_ii','nobody',1,18,1800,0,18,0,7,0);
INSERT INTO `bcnm_info` VALUES (1298,37,'temenos_western_tower','nobody',1,18,1800,0,18,0,7,0);
INSERT INTO `bcnm_info` VALUES (1299,37,'temenos_northern_tower','nobody',1,18,1800,0,18,0,7,0);
INSERT INTO `bcnm_info` VALUES (1300,37,'temenos_eastern_tower','nobody',1,18,1800,0,18,0,7,0);
INSERT INTO `bcnm_info` VALUES (1301,37,'central_temenos_basement','nobody',1,18,900,0,18,0,7,0);
INSERT INTO `bcnm_info` VALUES (1302,37,'central_temenos_basement_ii','nobody',1,18,900,0,18,0,7,0);
INSERT INTO `bcnm_info` VALUES (1303,37,'central_temenos_1st_floor','nobody',1,18,2700,0,18,0,7,0);
INSERT INTO `bcnm_info` VALUES (1304,37,'central_temenos_2nd_floor','nobody',1,18,2700,0,18,0,7,0);
INSERT INTO `bcnm_info` VALUES (1305,37,'central_temenos_3rd_floor','nobody',1,18,2700,0,18,0,7,0);
INSERT INTO `bcnm_info` VALUES (1306,37,'central_temenos_4th_floor','nobody',1,18,3600,0,18,0,7,0);
INSERT INTO `bcnm_info` VALUES (1307,37,'central_temenos_4th_floor_ii','nobody',1,18,3600,0,18,0,7,0);
/*!40000 ALTER TABLE `bcnm_info` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-28  7:44:05
