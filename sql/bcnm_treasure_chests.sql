/*
Navicat MySQL Data Transfer

Source Server         : DarkStar
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : dspdb

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2011-10-28 20:17:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bcnm_treasure_chests`
-- ----------------------------
DROP TABLE IF EXISTS `bcnm_treasure_chests`;
CREATE TABLE `bcnm_treasure_chests` (
  `bcnmId` smallint(5) unsigned NOT NULL,
  `battlefieldNumber` tinyint(3),
  `npcId` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=56;

-- ----------------------------
-- Records of instance
-- ----------------------------

-- ----------------------------
-- Horlais Peak
-- ----------------------------

INSERT INTO bcnm_treasure_chests VALUES (1,1,17346653); -- tails_of_woe
INSERT INTO bcnm_treasure_chests VALUES (1,2,17346662);
INSERT INTO bcnm_treasure_chests VALUES (1,3,17346671);
INSERT INTO bcnm_treasure_chests VALUES (2,1,17346702); -- dismemberment_brigade
INSERT INTO bcnm_treasure_chests VALUES (2,2,17346709);
INSERT INTO bcnm_treasure_chests VALUES (2,3,17346716);
INSERT INTO bcnm_treasure_chests VALUES (4,1,17346687); -- hostile_herbivores
INSERT INTO bcnm_treasure_chests VALUES (4,2,17346691);
INSERT INTO bcnm_treasure_chests VALUES (4,3,17346695);
INSERT INTO bcnm_treasure_chests VALUES (8,1,17346608); -- carapace_combatants
INSERT INTO bcnm_treasure_chests VALUES (8,2,17346611);
INSERT INTO bcnm_treasure_chests VALUES (8,3,17346614);
INSERT INTO bcnm_treasure_chests VALUES (9,1,17346597); -- shooting_fish
INSERT INTO bcnm_treasure_chests VALUES (9,2,17346601);
INSERT INTO bcnm_treasure_chests VALUES (9,3,17346605);
INSERT INTO bcnm_treasure_chests VALUES (10,1,17346624); -- dropping_like_flies
INSERT INTO bcnm_treasure_chests VALUES (10,2,17346634);
INSERT INTO bcnm_treasure_chests VALUES (10,3,17346644);
INSERT INTO bcnm_treasure_chests VALUES (11,1,17346718); -- horns_of_war
INSERT INTO bcnm_treasure_chests VALUES (11,2,17346720);
INSERT INTO bcnm_treasure_chests VALUES (11,3,17346722);
INSERT INTO bcnm_treasure_chests VALUES (12,1,17346675); -- under_observation
INSERT INTO bcnm_treasure_chests VALUES (12,2,17346679);
INSERT INTO bcnm_treasure_chests VALUES (12,3,17346683);
INSERT INTO bcnm_treasure_chests VALUES (13,1,17346724); -- eye_of_the_tiger
INSERT INTO bcnm_treasure_chests VALUES (13,2,17346726);
INSERT INTO bcnm_treasure_chests VALUES (13,3,17346728);
INSERT INTO bcnm_treasure_chests VALUES (14,1,17346730); -- shots_in_the_dark
INSERT INTO bcnm_treasure_chests VALUES (14,2,17346732);
INSERT INTO bcnm_treasure_chests VALUES (14,3,17346734);
INSERT INTO bcnm_treasure_chests VALUES (15,1,17346737); -- double_dragonian
INSERT INTO bcnm_treasure_chests VALUES (15,2,17346740);
INSERT INTO bcnm_treasure_chests VALUES (15,3,17346743);
INSERT INTO bcnm_treasure_chests VALUES (16,1,17346745); -- todays_horoscope
INSERT INTO bcnm_treasure_chests VALUES (16,2,17346747);
INSERT INTO bcnm_treasure_chests VALUES (16,3,17346749);
INSERT INTO bcnm_treasure_chests VALUES (17,1,17346751); -- contaminated_colosseum
INSERT INTO bcnm_treasure_chests VALUES (17,2,17346753);
INSERT INTO bcnm_treasure_chests VALUES (17,3,17346755);

-- ----------------------------
-- Ghelsba Outpost
-- ----------------------------

INSERT INTO bcnm_treasure_chests VALUES (34,1,17350932); -- wings_of_fury
INSERT INTO bcnm_treasure_chests VALUES (35,1,17350935); -- petrifying_pair
INSERT INTO bcnm_treasure_chests VALUES (36,1,17350940); -- toadal recall

-- ----------------------------
-- Waughroon Shrine
-- ----------------------------

INSERT INTO bcnm_treasure_chests VALUES (65,1,17367138); -- worms_turn
INSERT INTO bcnm_treasure_chests VALUES (65,2,17367155);
INSERT INTO bcnm_treasure_chests VALUES (65,3,17367172);
INSERT INTO bcnm_treasure_chests VALUES (66,1,17367215); -- grimshell_shocktroopers
INSERT INTO bcnm_treasure_chests VALUES (66,2,17367222);
INSERT INTO bcnm_treasure_chests VALUES (66,3,17367229);
INSERT INTO bcnm_treasure_chests VALUES (69,1,17367204); -- 3_2_1
INSERT INTO bcnm_treasure_chests VALUES (69,2,17367206);
INSERT INTO bcnm_treasure_chests VALUES (69,3,17367208);
INSERT INTO bcnm_treasure_chests VALUES (73,1,17367101); -- birds_of_a_feather
INSERT INTO bcnm_treasure_chests VALUES (73,2,17367105);
INSERT INTO bcnm_treasure_chests VALUES (73,3,17367109);
INSERT INTO bcnm_treasure_chests VALUES (74,1,17367089); -- crustacean_conundrum
INSERT INTO bcnm_treasure_chests VALUES (74,2,17367093);
INSERT INTO bcnm_treasure_chests VALUES (74,3,17367097);
INSERT INTO bcnm_treasure_chests VALUES (75,1,17367113); -- grove_guardians
INSERT INTO bcnm_treasure_chests VALUES (75,2,17367117);
INSERT INTO bcnm_treasure_chests VALUES (75,3,17367121);
INSERT INTO bcnm_treasure_chests VALUES (76,1,17367231); -- hills_are_alive
INSERT INTO bcnm_treasure_chests VALUES (76,2,17367233);
INSERT INTO bcnm_treasure_chests VALUES (76,3,17367235);
INSERT INTO bcnm_treasure_chests VALUES (77,1,17367182); -- royal_jelly
INSERT INTO bcnm_treasure_chests VALUES (77,2,17367192);
INSERT INTO bcnm_treasure_chests VALUES (77,3,17367202);
INSERT INTO bcnm_treasure_chests VALUES (78,1,17367237); -- final_bout
INSERT INTO bcnm_treasure_chests VALUES (78,2,17367239);
INSERT INTO bcnm_treasure_chests VALUES (78,3,17367241);
INSERT INTO bcnm_treasure_chests VALUES (79,1,17367243); -- up_in_arms
INSERT INTO bcnm_treasure_chests VALUES (79,2,17367245);
INSERT INTO bcnm_treasure_chests VALUES (79,3,17367247);
INSERT INTO bcnm_treasure_chests VALUES (80,1,17367249); -- copycat
INSERT INTO bcnm_treasure_chests VALUES (80,2,17367255);
INSERT INTO bcnm_treasure_chests VALUES (80,3,17367261);
INSERT INTO bcnm_treasure_chests VALUES (81,1,17367272); -- operation_desert_swarm
INSERT INTO bcnm_treasure_chests VALUES (81,2,17367279);
INSERT INTO bcnm_treasure_chests VALUES (81,3,17367286);
INSERT INTO bcnm_treasure_chests VALUES (82,1,17367291); -- prehistoric_pigeons
INSERT INTO bcnm_treasure_chests VALUES (82,2,17367296);
INSERT INTO bcnm_treasure_chests VALUES (82,3,17367301);

-- ----------------------------
-- Balgas Dais
-- ----------------------------

INSERT INTO bcnm_treasure_chests VALUES (97,1,17375316); -- steamed_sprouts
INSERT INTO bcnm_treasure_chests VALUES (97,2,17375325);
INSERT INTO bcnm_treasure_chests VALUES (97,3,17375334);
INSERT INTO bcnm_treasure_chests VALUES (98,1,17375371); -- divine_punishers
INSERT INTO bcnm_treasure_chests VALUES (98,2,17375378);
INSERT INTO bcnm_treasure_chests VALUES (98,3,17375385);
INSERT INTO bcnm_treasure_chests VALUES (100,1,17375356); -- treasure_and_tribulations
INSERT INTO bcnm_treasure_chests VALUES (100,2,17375360);
INSERT INTO bcnm_treasure_chests VALUES (100,3,17375364);
INSERT INTO bcnm_treasure_chests VALUES (104,1,17375282); -- creeping_doom
INSERT INTO bcnm_treasure_chests VALUES (104,2,17375284);
INSERT INTO bcnm_treasure_chests VALUES (104,3,17375286);
INSERT INTO bcnm_treasure_chests VALUES (105,1,17375272); -- charming_trio
INSERT INTO bcnm_treasure_chests VALUES (105,2,17375276);
INSERT INTO bcnm_treasure_chests VALUES (105,3,17375280);
INSERT INTO bcnm_treasure_chests VALUES (106,1,17375293); -- harem_scarem
INSERT INTO bcnm_treasure_chests VALUES (106,2,17375300);
INSERT INTO bcnm_treasure_chests VALUES (106,3,17375307);
INSERT INTO bcnm_treasure_chests VALUES (107,1,17375387); -- early_bird_catches_the_wyrm
INSERT INTO bcnm_treasure_chests VALUES (107,2,17375389);
INSERT INTO bcnm_treasure_chests VALUES (107,3,17375391);
INSERT INTO bcnm_treasure_chests VALUES (108,1,17375340); -- royal_succession
INSERT INTO bcnm_treasure_chests VALUES (108,2,17375346);
INSERT INTO bcnm_treasure_chests VALUES (108,3,17375352);
INSERT INTO bcnm_treasure_chests VALUES (109,1,17375394); -- rapid_raptors
INSERT INTO bcnm_treasure_chests VALUES (109,2,17375397);
INSERT INTO bcnm_treasure_chests VALUES (109,3,17375400);
INSERT INTO bcnm_treasure_chests VALUES (110,1,17375402); -- wild_wild_whiskers
INSERT INTO bcnm_treasure_chests VALUES (110,2,17375404);
INSERT INTO bcnm_treasure_chests VALUES (110,3,17375406);
INSERT INTO bcnm_treasure_chests VALUES (111,1,17375411); -- seasons_greetings
INSERT INTO bcnm_treasure_chests VALUES (111,2,17375416);
INSERT INTO bcnm_treasure_chests VALUES (111,3,17375421);
INSERT INTO bcnm_treasure_chests VALUES (112,1,17375428); -- royale_ramble
INSERT INTO bcnm_treasure_chests VALUES (112,2,17375435);
INSERT INTO bcnm_treasure_chests VALUES (112,3,17375442);
INSERT INTO bcnm_treasure_chests VALUES (113,1,17375445); -- moa_constrictors
INSERT INTO bcnm_treasure_chests VALUES (113,2,17375448);
INSERT INTO bcnm_treasure_chests VALUES (113,3,17375451);

-- ----------------------------
-- Sacrificial Chamber
-- ----------------------------

INSERT INTO bcnm_treasure_chests VALUES (129,1,17444884); -- jungle_boogymen
INSERT INTO bcnm_treasure_chests VALUES (129,2,17444891);
INSERT INTO bcnm_treasure_chests VALUES (129,3,17444898);
INSERT INTO bcnm_treasure_chests VALUES (130,1,17444905); -- amphibian_assault
INSERT INTO bcnm_treasure_chests VALUES (130,2,17444911);
INSERT INTO bcnm_treasure_chests VALUES (130,3,17444917);

-- ----------------------------
-- Chamber of Oracles
-- ----------------------------

INSERT INTO bcnm_treasure_chests VALUES (193,1,17465370); -- legion xi comitatensis
INSERT INTO bcnm_treasure_chests VALUES (193,2,17465375);
INSERT INTO bcnm_treasure_chests VALUES (193,3,17465380);

-- ----------------------------
-- Qu'Bia Arena
-- ----------------------------

INSERT INTO bcnm_treasure_chests VALUES (520,1,17621141); -- demolition_squad
INSERT INTO bcnm_treasure_chests VALUES (520,2,17621146);
INSERT INTO bcnm_treasure_chests VALUES (520,3,17621151);
INSERT INTO bcnm_treasure_chests VALUES (521,1,17621068); -- die_by_the_sword
INSERT INTO bcnm_treasure_chests VALUES (521,2,17621072);
INSERT INTO bcnm_treasure_chests VALUES (521,3,17621076);
INSERT INTO bcnm_treasure_chests VALUES (522,1,17621081); -- let_sleeping_dogs_die
INSERT INTO bcnm_treasure_chests VALUES (522,2,17621086);
INSERT INTO bcnm_treasure_chests VALUES (522,3,17621091);
INSERT INTO bcnm_treasure_chests VALUES (523,1,17621156); -- brothers_d_aurphe
INSERT INTO bcnm_treasure_chests VALUES (523,2,17621161);
INSERT INTO bcnm_treasure_chests VALUES (523,3,17621166);
INSERT INTO bcnm_treasure_chests VALUES (524,1,17621115); -- undying_promise
INSERT INTO bcnm_treasure_chests VALUES (524,2,17621118);
INSERT INTO bcnm_treasure_chests VALUES (524,3,17621121);
INSERT INTO bcnm_treasure_chests VALUES (525,1,17621098); -- factory_rejects
INSERT INTO bcnm_treasure_chests VALUES (525,2,17621105);
INSERT INTO bcnm_treasure_chests VALUES (525,3,17621112);
INSERT INTO bcnm_treasure_chests VALUES (526,1,17621126); -- idol_thoughts
INSERT INTO bcnm_treasure_chests VALUES (526,2,17621131);
INSERT INTO bcnm_treasure_chests VALUES (526,3,17621136);
INSERT INTO bcnm_treasure_chests VALUES (527,1,17621171); -- awful_autopsy
INSERT INTO bcnm_treasure_chests VALUES (527,2,17621176);
INSERT INTO bcnm_treasure_chests VALUES (527,3,17621181);
INSERT INTO bcnm_treasure_chests VALUES (528,1,17621186); -- celery
INSERT INTO bcnm_treasure_chests VALUES (528,2,17621191);
INSERT INTO bcnm_treasure_chests VALUES (528,3,17621196);

-- ----------------------------
-- Bearclaw Pinnacle
-- ----------------------------

INSERT INTO bcnm_treasure_chests VALUES (643,1,16801802); -- brothers

-- ----------------------------
-- Boneyard Gully
-- ----------------------------

INSERT INTO bcnm_treasure_chests VALUES (673,1,16810019); -- like_the_wind
