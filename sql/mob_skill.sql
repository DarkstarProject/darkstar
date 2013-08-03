-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- GÃ©nÃ©rÃ© le : Ven 03 FÃ©vrier 2012 Ã  22:54
-- Version du serveur: 6.0.0
-- Version de PHP: 5.2.9-2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de donnÃ©es: `dspdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `mob_skill`
--

DROP TABLE IF EXISTS `mob_skill`;
CREATE TABLE IF NOT EXISTS `mob_skill` (
  `mob_skill_id` smallint(4) unsigned NOT NULL,
  `family_id` smallint(3) unsigned NOT NULL,
  `mob_anim_id` smallint(4) unsigned NOT NULL,
  `mob_skill_name` char(25) CHARACTER SET latin1 NOT NULL,
  `mob_skill_aoe` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `mob_skill_distance` float(3,1) NOT NULL DEFAULT '6.0',
  `mob_anim_time` smallint(4) unsigned NOT NULL DEFAULT '2000',
  `mob_prepare_time` smallint(4) unsigned NOT NULL DEFAULT '1000',
  `mob_valid_targets` smallint(4) unsigned NOT NULL DEFAULT '4',
  `mob_skill_flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `mob_skill_param` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mob_skill_id`,`family_id`,`mob_skill_flag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `mob_skill`
--

-- ------------------------------------------
-- Normal Monster
-- ------------------------------------------

-- abilities
INSERT INTO `mob_skill` VALUES (16,0,16,'Ranged_Attack', 0, 25.0, 2000, 0, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (402,0,402,'Catapult', 0, 25.0, 2000, 0, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (402,0,402,'Ranged_Aqua_Ball', 1, 10.0, 2000, 0, 4, 0, 0); -- used in Shooting Fish
-- INSERT INTO `mob_skill` VALUES (1491,0,1298,'Zarraqa', 0, 25.0, 2000, 0, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (808,0,351,'Jump', 0, 9.5, 2000, 0, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (514,0,442,'Jumping_Thrust', 0, 9.5, 2000, 0, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (761,0,505,'Call_Beast', 0, 7.0, 2000, 0, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (1645,0,505,'Activate', 0, 7.0, 2000, 0, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (22,0,812,'Pit_Ambush', 0, 9.0, 2000, 0, 4, 0, 0);

-- two hours
-- make a mob 2 hour by setting mobmod_main_2hour
INSERT INTO `mob_skill` VALUES (432,0,709,'Mighty_Strikes', 0, 7.0, 2000, 0, 1, 2, 0);
INSERT INTO `mob_skill` VALUES (434,0,710,'Hundred_Fists', 0, 7.0, 2000, 0, 1, 2, 0);
INSERT INTO `mob_skill` VALUES (433,0,711,'Benediction', 1, 20.0, 2000, 0, 1, 2, 0);
INSERT INTO `mob_skill` VALUES (435,0,712,'Manafont', 0, 7.0, 2000, 0, 1, 2, 0);
INSERT INTO `mob_skill` VALUES (436,0,713,'Chainspell', 0, 7.0, 2000, 0, 1, 2, 0);
INSERT INTO `mob_skill` VALUES (437,0,714,'Perfect_Dodge', 0, 7.0, 2000, 0, 1, 2, 0);
INSERT INTO `mob_skill` VALUES (438,0,715,'Invincible', 0, 7.0, 2000, 0, 1, 2, 0);
INSERT INTO `mob_skill` VALUES (439,0,716,'Blood_Weapon', 0, 7.0, 2000, 0, 1, 2, 0);
INSERT INTO `mob_skill` VALUES (484,0,717,'Familiar', 0, 7.0, 2000, 0, 1, 2, 0);
INSERT INTO `mob_skill` VALUES (440,0,719,'Soul_Voice', 0, 7.0, 2000, 0, 1, 2, 0);
INSERT INTO `mob_skill` VALUES (479,0,20,'Eagle_Eye_Shot', 0, 25.0, 2000, 0, 4, 2, 0);
INSERT INTO `mob_skill` VALUES (474,0,721,'Meikyo_Shisui', 0, 7.0, 2000, 0, 1, 2, 0);
INSERT INTO `mob_skill` VALUES (475,0,18,'Mijin_Gakure', 1, 20.0, 2000, 0, 4, 2, 0);
INSERT INTO `mob_skill` VALUES (476,0,723,'Call_Wyvern', 0, 7.0, 2000, 0, 1, 2, 0);
-- INSERT INTO `mob_skill` VALUES (478,0,724,'Astral_Flow', 0, 7.0, 2000, 0, 1, 2, 0);

-- Rabbits
-- Base (206)
INSERT INTO `mob_skill` VALUES (1,206,1,'Foot_Kick', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (2,206,2,'Dust_Cloud', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (3,206,3,'Whirl_Claws', 1, 5.0, 2000, 1500, 4, 0, 0);

-- Sheep
INSERT INTO `mob_skill` VALUES (4,226,4,'Lamb_Chop', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (5,226,5,'Rage', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (6,226,6,'Sheep_Charge', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (8,226,8,'Sheep_Song', 1, 15.0, 2000, 1500, 4, 0, 0);

-- Karakul
INSERT INTO `mob_skill` VALUES (1581,167,1275,'Feeble_Bleat', 1, 18.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (4,167,4,'Lamb_Chop', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (5,167,5,'Rage', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (6,167,6,'Sheep_Charge', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (8,167,8,'Sheep_Song', 1, 15.0, 2000, 1500, 4, 0, 0);

-- Ram
INSERT INTO `mob_skill` VALUES (9,208,9,'Rage', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (10,208,10,'Ram_Charge', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (11,208,11,'Rumble', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (12,208,12,'Great_Bleat', 1, 12.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (13,208,13,'Petribreath', 4, 15.0, 2000, 1500, 4, 0, 0);
-- --------------------
-- Tiger
INSERT INTO `mob_skill` VALUES (14,242,14,'Roar', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (15,242,15,'Razor_Fang', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (17,242,17,'Claw_Cyclone', 4, 10.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,242,0,'Crossthrash', 0, 7.0, 2000, 1500, 4, 0, 0); -- NM/Dyna/einherjar
-- INSERT INTO `mob_skill` VALUES (0,242,0,'Predatory_Glare', 4, 16.0, 2000, 1500, 4, 0, 0); -- NM/Dyna/einherjar
-- INSERT INTO `mob_skill` VALUES (0,242,0,'Disorienting_Waul', 1, 18.0, 2000, 1500, 4, 0, 0); -- used by certain NM

-- Dhalmel
INSERT INTO `mob_skill` VALUES (24,80,24,'Sonic_Wave', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (25,80,25,'Stomping', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (28,80,28,'Cold_Stare', 4, 25.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (29,80,29,'Whistle', 1, 20.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (30,80,30,'Berserk', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (31,80,31,'Healing_Breeze', 1, 15.0, 2000, 1500, 1, 0, 0);

-- Opo-opo
INSERT INTO `mob_skill` VALUES (38,188,38,'Eye_Scratch', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (32,188,32,'Vicious_Claw', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (34,188,34,'Spinning_Claw', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (39,188,39,'Magic_Fruit', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES(35, 188, 35, 'Claw_Storm', 0, 7.0, 2000, 1500, 4, 0, 0); -- 7hp/tick
INSERT INTO `mob_skill` VALUES(33, 188, 33, 'Stone_Throw', 0, 25.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES(36, 188, 36, 'Blank_Gaze_Dispel', 0, 16.0, 2000, 1500, 4, 0, 0);

-- Mandragora
INSERT INTO `mob_skill` VALUES (45,178,45,'Dream_Flower', 1, 15.0, 2000, 1500, 4, 0, 0); -- Not used by Lycopodia
INSERT INTO `mob_skill` VALUES (46,178,46,'Wild_Oats', 0, 12.5, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (48,178,48,'Photosynthesis', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (49,178,49,'Leaf_Dagger', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES(44, 178,44, 'Head_Butt', 0, 7.0, 1500, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES(50, 178,50, 'Scream', 1, 15.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES(0, 178, 0, 'Petal_Pirouette', 0, 15.0, 2000, 1500, 4, 0, 0); -- Only used by certain NM
-- INSERT INTO `mob_skill` VALUES(0, 178, 0, 'Demonic_Flower', 0, 7.0, 2000, 1500, 4, 0, 0); -- Only used by certain NM

-- Morbol
INSERT INTO `mob_skill` VALUES (60,186,60,'Impale', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (61,186,61,'Vampiric_Lash', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (63,186,63,'Bad_Breath', 4, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (64,186,64,'Sweet_Breath', 4, 15.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (470,186,1213,'Drain_Whip', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Extremely_Bad_Breath', 4, 7.0, 2000, 1500, 4, 0, 0); -- used only by Evil Oscar, Cirrate Christelle, Lividroot Amooshah, Eccentric Eve and Melancholic Moira.

-- Sabotenders (cactuars)
INSERT INTO `mob_skill` VALUES (65,212,65,'Needleshot', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (66,212,66,'1000_Needles', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (68,212,68,'Photosynthesis', 0, 7.0, 2000, 1500, 1, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'2000_Needles', 1, 10.0, 2000, 1500, 4, 0, 0); -- Only used by Nightmare Sabotender
-- INSERT INTO `mob_skill` VALUES (0,0,0,'4000_Needles', 1, 10.0, 2000, 1500, 4, 0, 0); -- Only used by Nightmare Sabotender

-- Funguar
INSERT INTO `mob_skill` VALUES (52,116,52,'Frogkick', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (53,116,53,'Spore', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (58,116,58,'Silence_Gas', 4, 13.5, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (59,116,59,'Dark_Spore', 4, 13.5, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (54,116,54,'Queasyshroom', 0, 14.7, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (55,116,55,'Numbshroom', 0, 14.7, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (56,116,56,'Shakeshroom', 0, 14.7, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Microspores', 1, 10.0, 2000, 1500, 4, 0, 0); -- Only used by certain Notorious Monsters

-- Treant
INSERT INTO `mob_skill` VALUES (72,245,72,'Drill_Branch', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (73,245,73,'Pinecone_Bomb', 0, 23.5, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (75,245,75,'Leafstorm', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (76,245,76,'Entangle', 0, 7.0, 2000, 1500, 4, 0, 0);

-- Bee
INSERT INTO `mob_skill` VALUES (80,48,80,'Final_Sting', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (79,48,79,'Pollen', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (78,48,78,'Sharp_Sting', 0, 10.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Frenzy_Pollen', 0, 7.0, 2000, 1500, 2, 0, 0); -- Only used by Nightmare Hornets and Chasmic Hornet.

-- Beetle
INSERT INTO `mob_skill` VALUES (82,49,82,'Power_Attack_Beetle', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (83,49,83,'Hi-Freq_Field', 4, 16.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (84,49,84,'Rhino_Attack', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (87,49,87,'Spoil', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (85,49,85,'Rhino_Guard', 0, 7.0, 2000, 1500, 1, 0, 0);



-- Crawler
INSERT INTO `mob_skill` VALUES (90,79,90,'Cocoon', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (89,79,89,'Poison_Breath', 4, 12.0, 2000, 1500, 4, 0, 0); --  Not used by Eruca
INSERT INTO `mob_skill` VALUES (88,79,88,'Sticky_Thread', 4, 12.0, 2000, 1500, 4, 0, 0);

-- Scorpion
INSERT INTO `mob_skill` VALUES (94,217,94,'Mandible_Bite', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (97,217,97,'Death_Scissors', 0, 9.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (98,217,98,'Wild_Rage', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (99,217,99,'Earth_Pounder', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (95,217,95,'Poison_Sting', 0, 10.0, 2000, 1500, 4, 0, 0); -- 1hp/tick
INSERT INTO `mob_skill` VALUES (93,217,93,'Cold_Breath', 4, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (92,217,92,'Numbing_Breath', 4, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (100,217,100,'Sharp_Strike', 0, 9.0, 2000, 1500, 1, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Hell_Scissors', 0, 7.0, 2000, 1500, 4, 0, 0); -- Campaign NM only

-- serket
INSERT INTO `mob_skill` VALUES (463,273,94,'Critical_Bite', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (465,273,97,'Stasis', 0, 9.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (466,273,98,'Venom_Storm', 1, 40.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (467,273,99,'Earthbreaker', 1, 40.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (464,273,95,'Venom_Sting', 0, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (461,273,92,'Venom_Breath', 4, 20.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (468,273,100,'Evasion', 0, 9.0, 2000, 1500, 1, 0, 0);

-- DynamisStatue-Orc
INSERT INTO `mob_skill` VALUES (854,93,761,'Seismostomp', 1, 15.0, 3000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (855,93,762,'Numbing_Glare', 4, 15.0, 2000, 1500, 4, 0, 0);

-- DynamisStatue-Yagudo
INSERT INTO `mob_skill` VALUES (854,95,763,'Seismostomp', 1, 15.0, 3000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (857,95,764,'Tormentful_Glare', 4, 15.0, 2000, 1500, 4, 0, 0);

-- DynamisStatue-Goblin
INSERT INTO `mob_skill` VALUES (854,92,765,'Seismostomp', 1, 15.0, 3000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (859,92,766,'Torpid_Glare', 4, 15.0, 2000, 1500, 4, 0, 0);

-- DynamisStatue-Quadav
INSERT INTO `mob_skill` VALUES (854,94,767,'Seismostomp', 1, 15.0, 3000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (861,94,768,'Lead_Breath', 4, 15.0, 2000, 1500, 4, 0, 0);

-- Dynamis Lord
INSERT INTO `mob_skill` VALUES (871,361,316,'Dynamic_Implosion', 1, 18.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (872,361,817,'Transfusion', 1, 18.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (873,361,318,'Mana_Storm', 1, 18.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (874,361,320,'Dynamic_Assault', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (875,361,324,'Violent_Rupture', 1, 18.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (877,361,322,'Oblivion_Smash', 1, 18.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (878,361,321,'Tera_Slash', 4, 15.0, 2000, 1500, 4, 0, 0);

-- Animated Weapons
INSERT INTO `mob_skill` VALUES (932,15,793,'Final_Heaven', 0, 7.0, 2000, 1500, 4, 0, 0); 		-- Animated_Knuckles
INSERT INTO `mob_skill` VALUES (933,11,797,'Mercy_Stroke', 0, 7.0, 2000, 1500, 4, 0, 0); 		-- Animated_Dagger
INSERT INTO `mob_skill` VALUES (934,24,792,'Knights_of_Round', 0, 7.0, 2000, 1500, 4, 0, 0); 	-- Animated_Longsword
INSERT INTO `mob_skill` VALUES (935,14,799,'Scourge', 0, 7.0, 2000, 1500, 4, 0, 0); 			-- Animated_Claymore
INSERT INTO `mob_skill` VALUES (936,8,795,'Onslaught', 0, 7.0, 2000, 1500, 4, 0, 0); 			-- Animated_Tabar
INSERT INTO `mob_skill` VALUES (937,12,798,'Metatron_Torment', 0, 7.0, 2000, 1500, 4, 0, 0); 	-- Animated_Great_Axe
INSERT INTO `mob_skill` VALUES (938,20,796,'Catastrophe', 0, 7.0, 2000, 1500, 4, 0, 0); 		-- Animated_Scythe
INSERT INTO `mob_skill` VALUES (939,19,800,'Geirskogul', 0, 7.0, 2000, 1500, 4, 0, 0); 		-- Animated_Spear
INSERT INTO `mob_skill` VALUES (940,17,802,'Blade_Metsu', 0, 7.0, 2000, 1500, 4, 0, 0); 		-- Animated_Kunai
INSERT INTO `mob_skill` VALUES (941,13,803,'Tachi_Kaiten', 0, 7.0, 2000, 1500, 4, 0, 0); 		-- Animated_Tachi
INSERT INTO `mob_skill` VALUES (942,9,794,'Randgrith', 0, 7.0, 2000, 1500, 4, 0, 0); 			-- Animated_Hammer
INSERT INTO `mob_skill` VALUES (943,23,801,'Gate_of_Tartarus', 0, 7.0, 2000, 1500, 4, 0, 0); 	-- Animated_Staff
INSERT INTO `mob_skill` VALUES (944,7,804,'Namas_Arrow', 0, 18.0, 2000, 1500, 4, 0, 0); 		-- Animated_Longbow
INSERT INTO `mob_skill` VALUES (945,18,805,'Coronach', 0, 18.0, 2000, 1500, 4, 0, 0); 			-- Animated_Gun
INSERT INTO `mob_skill` VALUES (1175,22,803,'Shield_Bash', 0, 7.0, 2000, 1500, 4, 0, 0); 		-- Animated_Shield

-- Buffalo
INSERT INTO `mob_skill` VALUES (237,57,846,'Rampant_Gnaw', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (238,57,847,'Big_Horn', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (239,57,848,'Snort', 4, 12.5, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (240,57,849,'Rapid_Dance', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (241,57,850,'Lowing', 1, 15.0, 2000, 1500, 4, 0, 0);

-- Diremite
INSERT INTO `mob_skill` VALUES (106,81,830,'Double_Claw', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (107,81,831,'Grapple', 4, 12.5, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (108,81,832,'Filamented_Hold', 4, 12.5, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (109,81,833,'Spinning_Top', 1, 10.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Tarsal_Slam', 4, 10.0, 2000, 1500, 4, 0, 0); -- Only used by certain notorious monsters

-- Memory Receptacle
INSERT INTO `mob_skill` VALUES (286,181,841,'Empty_Seed', 1, 20.0, 2000, 2000, 4, 0, 0);
-- Weeper
INSERT INTO `mob_skill` VALUES (961,256,834,'Empty_Cutter', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (962,256,835,'Vacuous_Osculation', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (963,256,836,'Hexagon_Belt', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (964,256,837,'Auroral_Drape', 1, 13.7, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (965,256,838,'Memory_Of_Fire', 1, 10.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (966,256,839,'Memory_Of_Ice', 1, 10.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (967,256,840,'Memory_Of_Wind', 1, 10.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (968,256,841,'Memory_Of_Light', 1, 10.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (969,256,842,'Memory_Of_Earth', 1, 10.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (970,256,843,'Memory_Of_Lightning', 1, 10.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (971,256,844,'Memory_Of_Water', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (972,256,845,'Memory_Of_Dark', 1, 10.0, 2000, 1500, 4, 0, 0);
-- Wanderer
INSERT INTO `mob_skill` VALUES (132,255,857,'Vanity_Dive', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (133,255,858,'Empty_Beleaguer', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (134,255,859,'Mirage', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (135,255,860,'Aura_Of_Persistence', 0, 7.0, 2000, 1500, 1, 0, 0);
-- Gorger
INSERT INTO `mob_skill` VALUES (485,137,905,'Quadratic_Continuum', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (488,137,906,'Spirit_Absorption', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (491,137,907,'Vanity_Drive', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (494,137,908,'Stygian_Flatus', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (496,137,909,'Promyvion_Barrier', 0, 7.0, 2000, 1500, 1, 0, 0);
-- INSERT INTO `mob_skill` VALUES (499,137,910,'Fission', 0, 7.0, 2000, 1500, 4, 0, 0); -- NM only

INSERT INTO `mob_skill` VALUES (485,138,905,'Quadratic_Continuum', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (488,138,906,'Spirit_Absorption', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (491,138,907,'Vanity_Drive', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (494,138,908,'Stygian_Flatus', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (496,138,909,'Promyvion_Barrier', 0, 7.0, 2000, 1500, 1, 0, 0);
-- INSERT INTO `mob_skill` VALUES (499,138,910,'Fission', 0, 7.0, 2000, 1500, 4, 0, 0); -- NM only

-- Craver
INSERT INTO `mob_skill` VALUES (973,78,919,'Brain_Spike', 0, 9.0, 2000, 1500, 4, 0, 0); -- Regular only
INSERT INTO `mob_skill` VALUES (974,78,920,'Empty_Thrash', 4, 12.0, 2000, 1500, 4, 0, 0); -- Regular only
INSERT INTO `mob_skill` VALUES (975,78,921,'Promyvion_Brume', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (976,78,922,'Murk', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (977,78,923,'Material_Fend', 0, 10.0, 2000, 1500, 1, 0, 0);
-- NM Craver
INSERT INTO `mob_skill` VALUES (978,78,924,'Carousel', 1, 10.0, 2000, 1500, 4, 0, 0); -- NM only
INSERT INTO `mob_skill` VALUES (979,78,919,'Impalement', 1, 10.0, 2000, 1500, 4, 0, 0); -- NM only
-- Thinker
INSERT INTO `mob_skill` VALUES (986,241,933,'Empty_Cutter', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (987,241,934,'Negative_Whirl', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (988,241,935,'Stygian_Vapor', 1, 8.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (989,241,936,'Winds_Of_Promyvion', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (990,241,937,'Spirit_Absorption', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (991,241,938,'Binary_Absorption', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (992,241,939,'Trinary_Absorption', 0, 7.0, 2000, 1500, 4, 0, 0); -- NM only
INSERT INTO `mob_skill` VALUES (993,241,940,'Spirit_Tap', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (994,241,941,'Binary_Tap', 0, 7.0, 2000, 1500, 4, 0, 0);
-- NM Thinker
INSERT INTO `mob_skill` VALUES (995,241,942,'Trinary_Tap', 0, 7.0, 2000, 1500, 4, 0, 0); -- NM only
INSERT INTO `mob_skill` VALUES (996,241,943,'Shadow_Spread', 1, 10.0, 2000, 1500, 4, 0, 0); -- NM only
-- Seether
INSERT INTO `mob_skill` VALUES (997,220,872,'Vanity_Strike', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (998,220,872,'Wanion', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (999,220,873,'Occultation', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1000,220,874,'Empty_Crush', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1002,220,876,'Lamentation', 1, 10.0, 2000, 1500, 4, 0, 0);

-- Lizard
INSERT INTO `mob_skill` VALUES (110,174,110,'Tail_Blow', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (111,174,111,'Fireball', 2, 11.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (112,174,112,'Blockhead', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (113,174,113,'Brain_Crush', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (116,174,116,'Infrasonics', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (117,174,117,'Secretion', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (114,174,114,'Baleful_Gaze', 0, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (365,174,969,'Snowball', 2, 11.0, 2000, 1500, 4, 0, 0); -- only in colder regions
INSERT INTO `mob_skill` VALUES (115,174,115,'Plague_Breath', 4, 10.0, 2000, 1500, 4, 0, 0);

-- Raptor
INSERT INTO `mob_skill` VALUES (123,210,123,'Chomp_Rush', 0, 7.0, 2000, 1500, 4, 0, 0); -- para 25%
INSERT INTO `mob_skill` VALUES (121,210,121,'Frost_Breath', 4, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (124,210,124,'Scythe_Tail', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (120,210,120,'Foul_Breath', 4, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (122,210,122,'Thunderbolt_Breath', 4, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (118,210,118,'Ripper_Fang', 0, 7.0, 2000, 1500, 4, 0, 0);

-- Bugard
INSERT INTO `mob_skill` VALUES (126,58,819,'Tail_Roll', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (127,58,820,'Tusk', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (128,58,821,'Scutum', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (129,58,822,'Bone_Crunch', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (130,58,823,'Awful_Eye', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (131,58,824,'Heavy_Bellow', 4, 10.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (131,58,825,'Hungry_Crunch', 0, 7.0, 2000, 1500, 4, 0, 0); -- Only used by the Boggelmann

-- Giant Bat
INSERT INTO `mob_skill` VALUES (138,46,138,'Blood_Drain', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (136,46,136,'Ultrasonics', 1, 16.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (900,46,338,'Marrow_Drain', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (899,46,339,'Subsonics', 1, 16.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,46,986,'Supersonics', 1, 16.0, 2000, 1500, 4, 0, 0); -- Aht Urhgan only
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Soul_Accretion', 0, 7.0, 2000, 1500, 4, 0, 0); -- Only by Upyri. Used frequently during nighttime hours

-- Bats
INSERT INTO `mob_skill` VALUES (137,47,137,'Sonic_Boom', 1, 12.5, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (139,47,139,'Jet_Stream', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Turbulence', 1, 16.0, 2000, 1500, 4, 0, 0); -- Not used in original zone
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Slipstream', 1, 16.0, 2000, 1500, 4, 0, 0); -- Not used in original zone

-- Rocs
INSERT INTO `mob_skill` VALUES (143,125,143,'Scratch', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (144,125,144,'Triple_Attack', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (145,125,145,'Gliding_Spike', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (146,125,146,'Feather_Barrier', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (147,125,147,'Stormwind', 1, 15.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Dread_Dive', 0, 7.0, 2000, 1500, 4, 0, 0); -- Used instead of Gliding Spike by certain NM
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Blind_Vortex', 0, 7.0, 2000, 1500, 4, 0, 0); -- Used in place of Triple Attack by certain NM
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Giga Scream', 0, 7.0, 2000, 1500, 4, 0, 0); -- Used by some NM in place of Triple Attack

-- Cockatrice
INSERT INTO `mob_skill` VALUES (150,70,150,'Hammer_Beak', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (151,70,151,'Poison_Pick', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (152,70,152,'Sound_Vacuum', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (155,70,155,'Baleful_Gaze', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (154,70,154,'Sound_Blast', 1, 16.0, 2000, 1500, 4, 0, 0);

-- Leech
INSERT INTO `mob_skill` VALUES (158,172,158,'Suction', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (159,172,159,'Acid_Mist', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (160,172,160,'Sand_Breath', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (161,172,161,'Drainkiss', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (167,172,167,'Brain_Drain', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (162,172,162,'Regeneration', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (165,172,165,'MP_Drainkiss', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (164,172,164,'TP_Drainkiss', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Absorbing_Kiss', 0, 7.0, 2000, 1500, 4, 0, 0); -- Only used by certain NM
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Deep_Kiss', 0, 7.0, 2000, 1500, 4, 0, 0); -- Only used by certain NM
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Random_Kiss', 0, 7.0, 2000, 1500, 4, 0, 0); -- Only used by certain NM

-- Worm
INSERT INTO `mob_skill` VALUES (168,258,168,'Full-Force_Blow', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (169,258,169,'Gastric_Bomb', 0, 18.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (170,258,170,'Sandspin', 1, 12.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (171,258,171,'Tremors', 1, 12.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (173,258,173,'Sound_Vacuum', 0, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (172,258,172,'MP_Absorption', 0, 15.0, 2000, 1500, 4, 0, 0);

-- Slime
INSERT INTO `mob_skill` VALUES (175,228,175,'Fluid_Spread', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (176,228,176,'Fluid_Toss', 0, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (177,228,177,'Digest', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'HP Drain', 0, 7.0, 2000, 1500, 4, 0, 0); -- TOAU/WOTG?
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Epoxy Spread', 1, 10.0, 2000, 1500, 4, 0, 0); -- TOAU/WOTG
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Mucus Spread', 1, 10.0, 2000, 1500, 4, 0, 0); -- WOTG
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Dissolve', 4, 10.0, 2000, 1500, 4, 0, 0); -- Only used by certain NM
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Cytokinesis', 0, 7.0, 2000, 1500, 4, 0, 0); -- Only used by certain NM

INSERT INTO `mob_skill` VALUES (175,229,175,'Fluid_Spread', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (176,229,176,'Fluid_Toss', 0, 18.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (177,229,177,'Digest', 0, 7.0, 2000, 1500, 4, 0, 0);

INSERT INTO `mob_skill` VALUES (175,230,175,'Fluid_Spread', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (176,230,176,'Fluid_Toss', 0, 18.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (177,230,177,'Digest', 0, 7.0, 2000, 1500, 4, 0, 0);

-- Hecteyes
INSERT INTO `mob_skill` VALUES (181,139,181,'Death_Ray', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (182,139,182,'Hex_Eye', 4, 10.0, 2000, 500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (184,139,184,'Catharsis', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (183,139,183,'Petro_Gaze', 4, 10.0, 2000, 1500, 4, 0, 0);

-- Crab
INSERT INTO `mob_skill` VALUES (188,75,188,'Big_Scissors', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (187,75,187,'Bubble_Curtain', 0, 7.0, 2000, 1500, 1, 0, 0); -- Shell -50% magic damage taken
INSERT INTO `mob_skill` VALUES (186,75,186,'Bubble_Shower', 1, 12.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (192,75,192,'Metallic_Body', 0, 7.0, 2000, 1500, 1, 0, 0); -- 25HP Stoneskin
INSERT INTO `mob_skill` VALUES (189,75,189,'Scissor_Guard', 0, 7.0, 2000, 1500, 1, 0, 0); -- +100% defense boost
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Mega_Scissors', 4, 10.0, 2000, 1500, 4, 0, 0); -- Only used by certain NM
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Venom_Shower', 1, 20.0, 2000, 1500, 4, 0, 0); -- Only used by certain NM

INSERT INTO `mob_skill` VALUES (188,76,188,'Big_Scissors', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (187,76,187,'Bubble_Curtain', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (186,76,186,'Bubble_Shower', 1, 14.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (192,76,192,'Metallic_Body', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (189,76,189,'Scissor_Guard', 0, 7.0, 2000, 1500, 1, 0, 0); -- +100% defense boost

INSERT INTO `mob_skill` VALUES (188,77,188,'Big_Scissors', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (187,77,187,'Bubble_Curtain', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (186,77,186,'Bubble_Shower', 1, 14.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (192,77,192,'Metallic_Body', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (189,77,189,'Scissor_Guard', 0, 7.0, 2000, 1500, 1, 0, 0); -- +100% defense boost

-- Shadow
INSERT INTO `mob_skill` VALUES (190,221,190,'Dimensional_Death', 0, 7.0, 2000, 0, 4, 1, 0);
INSERT INTO `mob_skill` VALUES (190,222,190,'Dimensional_Death', 0, 7.0, 2000, 0, 4, 1, 0);
INSERT INTO `mob_skill` VALUES (190,223,190,'Dimensional_Death', 0, 7.0, 2000, 0, 4, 1, 0);

-- Pugil
INSERT INTO `mob_skill` VALUES (195,197,195,'Splash_Breath', 4, 12.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (196,197,196,'Screwdriver', 0, 9.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (197,197,197,'Water_Wall', 0, 7.0, 2000, 1500, 1, 0, 0); -- 100% Defense Boost. 1 minute duration
INSERT INTO `mob_skill` VALUES (198,197,198,'Water_Shield', 0, 7.0, 2000, 1500, 1, 0, 0); -- Eva boost
INSERT INTO `mob_skill` VALUES (194,197,194,'Aqua_Ball', 2, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (193,197,193,'Intimidate', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (385,197,973,'Recoil_Dive', 4, 10.0, 2000, 1500, 4, 0, 0); -- Used by Jagils instead of Screwdriver

-- Sea Monks (Kraken)
INSERT INTO `mob_skill` VALUES (202,218,202,'Ink_Jet', 4, 12.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (203,218,203,'Hard_Membrane', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (204,218,204,'Cross_Attack', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (205,218,205,'Regeneration', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (206,218,206,'Maelstrom', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (207,218,207,'Whirlwind', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (200,218,200,'Tentacle', 0, 7.0, 2000, 1500, 4, 0, 0);

INSERT INTO `mob_skill` VALUES (202,219,202,'Ink_Jet', 4, 12.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (203,219,203,'Hard_Membrane', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (204,219,204,'Cross_Attack', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (205,219,205,'Regeneration', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (206,219,206,'Maelstrom', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (207,219,207,'Whirlwind', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (200,219,200,'Tentacle', 0, 7.0, 2000, 1500, 4, 0, 0);

-- Hound 142,143
INSERT INTO `mob_skill` VALUES (209,142,209,'Howling', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (210,142,210,'Poison_Breath', 4, 12.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (211,142,211,'Rot_Gas', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (212,142,212,'Dirty_Claw', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (213,142,213,'Shadow_Claw', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (214,142,214,'Methane_Breath', 4, 12.0, 2000, 1500, 4, 0, 0);

INSERT INTO `mob_skill` VALUES (209,143,209,'Howling', 1, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (210,143,210,'Poison_Breath', 4, 12.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (211,143,211,'Rot_Gas', 1, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (212,143,212,'Dirty_Claw', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (213,143,213,'Shadow_Claw', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (214,143,214,'Methane_Breath', 4, 12.0, 2000, 1500, 4, 0, 0);

-- Ghost
INSERT INTO `mob_skill` VALUES (220,121,220,'Curse', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (218,121,218,'Fear_Touch', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (219,121,219,'Terror_Touch', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (217,121,217,'Ectosmash', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (221,121,221,'Dark_Sphere', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (216,121,216,'Grave_Reel', 1, 10.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Perdition', 0, 7.0, 2000, 1500, 4, 0, 0); -- Bhoot only

-- Skeleton
INSERT INTO `mob_skill` VALUES (222,227,222,'Hell_Slash', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (223,227,223,'Horror_Cloud', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (228,227,228,'Black_Cloud', 1, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (229,227,229,'Blood_Saber', 1, 10.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Marrow Drain', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Malediction', 1, 15.0, 2000, 1500, 4, 0, 0); --  Drain (~300). Only used by draugar
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Dereliction', 1, 20.0, 2000, 1500, 4, 0, 0); -- Only used by draugar NM

-- Coeurls
INSERT INTO `mob_skill` VALUES (396,71,396,'Blaster', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (397,71,397,'Chaotic_Eye', 4, 10.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Petrifactive_Breath', 4, 10.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Frenzied_Rage', 0, 7.0, 2000, 1500, 1, 0, 0); --  Attack Boost (20%)
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Pounce', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Charged_Whisker', 1, 12.5, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Blink_of_Peril', 4, 10.0, 2000, 1500, 4, 0, 0); -- Only used by certain Lynx-type NM

-- Doomed
INSERT INTO `mob_skill` VALUES (233,86,233,'Stinking_Gas', 1, 16.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (234,86,234,'Undead_Mold', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (236,86,236,'Abyss_Blast', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (232,86,232,'Acid_Breath', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (235,86,235,'Call_of_the_Grave', 1, 16.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (230,86,230,'Whip_Tongue', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Infernal_Pestilence', 4, 10.0, 2000, 1500, 4, 0, 0); -- Only used by certain NM

-- Bombs
INSERT INTO `mob_skill` VALUES (253,56,253,'Self-Destruct', 1, 20.0, 2000, 2000, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (254,56,254,'Berserk', 0, 7.0, 2000, 1500, 1, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Heat_Wave', 1, 15.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Vulcanian_Impact', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Hellstorm', 1, 15.0, 2000, 1500, 4, 0, 0);

-- Evil Weapon
INSERT INTO `mob_skill` VALUES (257,110,257,'Smite_of_Rage', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (258,110,258,'Whirl_of_Rage', 1, 10.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Smite_of_Fury', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Furious_Flurry', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Whispers_of_Ire', 1, 10.0, 2000, 1500, 4, 0, 0); -- Only used by certain NM
-- INSERT INTO `mob_skill` VALUES (0,110,259,'Flurry_of_Rage', 0, 7.0, 2000, 1500, 4, 0, 0); -- Only used by certain NM

-- Magic Pot
INSERT INTO `mob_skill` VALUES (269,175,269,'Battery_Charge', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (267,175,267,'Mysterious_Light', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (265,175,265,'Spinning_Attack', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (264,175,264,'Double_Ray', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (266,175,266,'Spectral_Barrier', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (268,175,268,'Mind_Drain', 0, 7.0, 2000, 1500, 4, 0, 0);
-- Doll
INSERT INTO `mob_skill` VALUES (278,83,278,'Kartstrahl', 0, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (279,83,279,'Blitzstrahl', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (280,83,280,'Panzerfaust', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (283,83,283,'Typhoon', 1, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (287,83,287,'Meltdown', 1, 15.0, 2000, 2000, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (285,83,285,'Gravity_Field', 2, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (281,83,281,'Berserk', 0, 7.0, 2000, 1500, 1, 0, 0);

INSERT INTO `mob_skill` VALUES (278,84,278,'Kartstrahl', 0, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (279,84,279,'Blitzstrahl', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (280,84,280,'Panzerfaust', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (283,84,283,'Typhoon', 1, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (287,84,287,'Meltdown', 1, 15.0, 2000, 2000, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (285,84,285,'Gravity_Field', 2, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (281,84,281,'Berserk', 0, 7.0, 2000, 1500, 1, 0, 0);

INSERT INTO `mob_skill` VALUES (278,85,278,'Kartstrahl', 0, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (279,85,279,'Blitzstrahl', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (280,85,280,'Panzerfaust', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (283,85,283,'Typhoon', 1, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (287,85,287,'Meltdown', 1, 15.0, 2000, 2000, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (285,85,285,'Gravity_Field', 2, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (281,85,281,'Berserk', 0, 7.0, 2000, 1500, 1, 0, 0);
-- Ahriman
INSERT INTO `mob_skill` VALUES (292,4,292,'Blindeye', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (293,4,293,'Eyes_On_Me', 0, 13.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (294,4,294,'Hypnosis', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (295,4,295,'Mind_Break', 4, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (296,4,296,'Binding_Wave', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (297,4,297,'Airy_Shield', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (299,4,299,'Magic_Barrier', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (301,4,301,'Level_5_Petrify', 1, 15.0, 2000, 1500, 4, 0, 0);
-- Demon
INSERT INTO `mob_skill` VALUES (303,169,303,'Soul_Drain', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (304,169,304,'Hecatomb_Wave', 4, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (307,169,307,'Demonic_Howl', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (892,169,311,'Condemnation', 4, 10.0, 2000, 1500, 4, 0, 0);
-- Demon dynamis
INSERT INTO `mob_skill` VALUES (303,358,303,'Soul_Drain', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (304,358,304,'Hecatomb_Wave', 4, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (307,358,307,'Demonic_Howl', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (892,358,311,'Condemnation', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (893,358,313,'Quadrastrike', 0, 7.0, 2000, 1500, 4, 0, 0);
-- Goobbue
INSERT INTO `mob_skill` VALUES (325,136,325,'Blow', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (327,136,327,'Beatdown', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (328,136,328,'Uppercut', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (330,136,330,'Blank_Gaze', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (331,136,331,'Antiphase', 1, 15.0, 2000, 1500, 4, 0, 0);
-- Goblin
INSERT INTO `mob_skill` VALUES(334, 133, 334, 'Goblin_Rush', 0, 6.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES(335, 133, 335, 'Bomb_Toss', 2, 13.5, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES(336, 133, 336, 'Bomb_Toss_Suicide', 1, 13.5, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES(0, 0, 0, 'Saucepan', 4, 7.0, 2000, 1500, 4, 0, 0); -- Only by NM
-- Dynamis Goblin
INSERT INTO `mob_skill` VALUES(334, 327, 334, 'Goblin_Rush', 0, 6.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES(335, 327, 335, 'Bomb_Toss', 2, 13.5, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (826,327,744,'Smokebomb', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (828,327,746,'Crispy_Candle', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (830,327,748,'Paralysis_Shower', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (843,327,750,'Dice_Heal', 1, 10.0, 3000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (844,327,751,'Dice_Curse', 1, 10.0, 3000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (845,327,752,'Dice_Damage', 1, 10.0, 3000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (846,327,753,'Dice_Stun', 1, 10.0, 3000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (847,327,754,'Dice_Poison', 1, 10.0, 3000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (848,327,755,'Dice_Disease', 1, 10.0, 3000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (849,327,756,'Dice_Sleep', 1, 10.0, 3000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (850,327,757,'Dice_Slow', 1, 10.0, 3000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (851,327,758,'Dice_TP_Loss', 1, 10.0, 3000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (852,327,759,'Dice_Dispel', 1, 10.0, 3000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (853,327,760,'Dice_Reset', 1, 10.0, 3000, 1500, 4, 0, 0);

-- Orc
INSERT INTO `mob_skill` VALUES (377,189,354,'Howl', 1, 20.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (353,189,353,'Battle_Dance', 1, 12.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (352,189,352,'Arm_Block', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (351,189,351,'Slam_Dunk', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (349,189,349,'Aerial_Wheel', 0, 12.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (350,189,350,'Shoulder_Attack', 0, 7.0, 2000, 1500, 4, 0, 0);

-- Orcish NM
INSERT INTO `mob_skill` VALUES (353,334,353,'Battle_Dance', 1, 12.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (352,334,352,'Arm_Block', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (351,334,351,'Slam_Dunk', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (349,334,349,'Aerial_Wheel', 0, 12.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (350,334,350,'Shoulder_Attack', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (810,334,740,'Fanatic_Dance', 1, 10.0, 2000, 2000, 4, 0, 0);

-- Quadav
INSERT INTO `mob_skill` VALUES (355,200,355,'Ore_Toss', 0, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (377,200,354,'Howl', 1, 20.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (356,200,356,'Head_Butt', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (357,200,357,'Shell_Bash', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (358,200,358,'Shell_Guard', 0, 7.0, 2000, 1500, 1, 0, 0);

INSERT INTO `mob_skill` VALUES (377,201,354,'Howl', 1, 20.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (355,201,355,'Ore_Toss', 0, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (356,201,356,'Head_Butt', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (357,201,357,'Shell_Bash', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (358,201,358,'Shell_Guard', 0, 7.0, 2000, 1500, 1, 0, 0);

INSERT INTO `mob_skill` VALUES (377,202,354,'Howl', 1, 20.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (355,202,355,'Ore_Toss', 0, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (356,202,356,'Head_Butt', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (357,202,357,'Shell_Bash', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (358,202,358,'Shell_Guard', 0, 7.0, 2000, 1500, 1, 0, 0);

-- Quadav NM
INSERT INTO `mob_skill` VALUES (377,337,354,'Howl', 1, 20.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (355,337,355,'Ore_Toss', 0, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (356,337,356,'Head_Butt', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (357,337,357,'Shell_Bash', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (358,337,358,'Shell_Guard', 0, 7.0, 2000, 1500, 1, 0, 0);

-- Yagudo
INSERT INTO `mob_skill` VALUES (361,270,361,'Feather_Storm', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (377,270,354,'Howl', 1, 20.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (362,270,362,'Double_Kick', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (363,270,363,'Parry', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (364,270,364,'Sweep', 1, 7.0, 2000, 1500, 4, 0, 0);
-- Yagudo NM
INSERT INTO `mob_skill` VALUES (361,360,361,'Feather_Storm', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (377,360,354,'Howl', 1, 20.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (362,360,362,'Double_Kick', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (363,360,363,'Parry', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (364,360,364,'Sweep', 1, 7.0, 2000, 1500, 4, 0, 0);
-- Bird
INSERT INTO `mob_skill` VALUES (366,55,366,'Helldive', 0, 9.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (367,55,367,'Wing_Cutter', 4, 10.0, 2000, 1500, 4, 0, 0);
-- Behemoth
INSERT INTO `mob_skill` VALUES (372,51,372,'Wild_Horn', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (373,51,373,'Thunderbolt', 1, 40.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (374,51,374,'Kick_Out', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (375,51,375,'Shock_Wave', 4, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (376,51,376,'Flame_Armor', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (377,51,377,'Howl', 0, 7.0, 2000, 1500, 1, 0, 0);
-- INSERT INTO `mob_skill` VALUES (378,51,378,'Meteor', 2, 30.0, 2000, 1500, 4, 0, 0);
-- Warmachine
INSERT INTO `mob_skill` VALUES (379,190,379,'Burst', 0, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (380,190,380,'Flame_Arrow', 0, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (381,190,381,'Firebomb', 4, 9.5, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (382,190,382,'Blastbomb', 2, 13.5, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (383,190,383,'Fountain', 4, 9.5, 2000, 1500, 4, 0, 0);
-- Dragon - 4 foot kind
INSERT INTO `mob_skill` VALUES (386,87,386,'Flame_Breath', 4, 12.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (387,87,387,'Poison_Breath', 4, 12.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (388,87,388,'Wind_Breath', 4, 12.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (389,87,389,'Body_Slam', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (390,87,390,'Heavy_Stomp', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (391,87,391,'Chaos_Blade', 4, 9.5, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (392,87,392,'Petro_Eyes', 4, 9.5, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (393,87,393,'Voidsong', 1, 20.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (394,87,394,'Thornsong', 0, 15.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (395,87,395,'Lodesong', 1, 20.0, 2000, 1500, 4, 0, 0);
-- Fly
INSERT INTO `mob_skill` VALUES (403,113,403,'Cursed_Sphere', 2, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (404,113,404,'Venom', 0, 10.0, 2000, 1500, 4, 0, 0);
-- Gigas
INSERT INTO `mob_skill` VALUES (406,126,406,'Lightning_Roar', 4, 9.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (407,126,407,'Ice_Roar', 4, 9.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (408,126,408,'Impact_Roar', 4, 9.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (409,126,409,'Grand_Slam', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (410,126,410,'Power_Attack', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (411,126,411,'Power_Attack_Weapon', 0, 7.0, 2000, 1500, 4, 0, 0);

INSERT INTO `mob_skill` VALUES (406,127,406,'Lightning_Roar', 4, 9.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (407,127,407,'Ice_Roar', 4, 9.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (408,127,408,'Impact_Roar', 4, 9.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (409,127,409,'Grand_Slam', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (410,127,410,'Power_Attack', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (411,127,411,'Power_Attack_Weapon', 0, 7.0, 2000, 1500, 4, 0, 0);

INSERT INTO `mob_skill` VALUES (406,128,406,'Lightning_Roar', 4, 9.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (407,128,407,'Ice_Roar', 4, 9.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (408,128,408,'Impact_Roar', 4, 9.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (409,128,409,'Grand_Slam', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (410,128,410,'Power_Attack', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (411,128,411,'Power_Attack_Weapon', 0, 7.0, 2000, 1500, 4, 0, 0);

INSERT INTO `mob_skill` VALUES (406,129,406,'Lightning_Roar', 4, 9.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (407,129,407,'Ice_Roar', 4, 9.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (408,129,408,'Impact_Roar', 4, 9.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (409,129,409,'Grand_Slam', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (410,129,410,'Power_Attack', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (411,129,411,'Power_Attack_Weapon', 0, 7.0, 2000, 1500, 4, 0, 0);

INSERT INTO `mob_skill` VALUES (406,130,406,'Lightning_Roar', 4, 9.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (407,130,407,'Ice_Roar', 4, 9.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (408,130,408,'Impact_Roar', 4, 9.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (409,130,409,'Grand_Slam', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (410,130,410,'Power_Attack', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (411,130,411,'Power_Attack_Weapon', 0, 7.0, 2000, 1500, 4, 0, 0);
-- Shadow Lord
INSERT INTO `mob_skill` VALUES (412,224,412,'Kick_Back', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (415,224,415,'Umbra_Smash', 1, 12.0, 3000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (416,224,416,'Giga_Slash', 1, 12.0, 3000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (417,224,417,'Dark_Nova', 1, 12.0, 3000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (413,225,413,'Implosion', 1, 60, 2000, 0, 4, 0, 0);

-- Golem
INSERT INTO `mob_skill` VALUES (418,135,418,'Crystal_Shield', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (419,135,419,'Heavy_Strike', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (420,135,420,'Ice_Break', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (421,135,421,'Thunder_Break', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (422,135,422,'Crystal_Rain', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (423,135,423,'Crystal_Weapon_Fire', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (424,135,424,'Crystal_Weapon_Stone', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (425,135,425,'Crystal_Weapon_Water', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (426,135,426,'Crystal_Weapon_Wind', 1, 15.0, 2000, 1500, 4, 0, 0);

-- Sapling
INSERT INTO `mob_skill` VALUES (429,216,429,'Sprout_Spin', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (430,216,430,'Slumber_Powder', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (431,216,431,'Sprout_Smack', 0, 7.0, 2000, 1500, 4, 0, 0);
-- Cardian
INSERT INTO `mob_skill` VALUES (427,61,427,'Bludgeon', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (428,61,428,'Deal_Out', 4, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (72,61,72,'Double_Down', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (74,61,74,'Shuffle', 4, 7.0, 2000, 1500, 4, 0, 0);

-- anim 432 = 2h cloud

-- now they dont start matching up....

-- Sahagin (-72 for anim id)
INSERT INTO `mob_skill` VALUES (515,213,443,'Hydro_Ball', 4, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (521,213,449,'Hydro_Shot', 0, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (524,213,452,'Spinning_Fin', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (518,213,446,'Bubble_Armor', 0, 7.0, 2000, 1500, 1, 0, 0);
-- Tonberry
INSERT INTO `mob_skill` VALUES (527,243,455,'Words_of_Bane', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (528,243,456,'Sigh', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (529,243,457,'Light_of_Penance', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (530,243,458,'Lateral_Slash', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (531,243,459,'Vertical_Slash', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (532,243,460,'Throat_Stab', 0, 3.4, 2000, 2000, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (664,243,503,'Everyones_Grudge', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (665,243,504,'Everyones_Rancor', 0, 7.0, 2000, 1500, 4, 0, 0); -- Certain NMs only

-- Golden-Tongued Culberry (Different mag resists)
INSERT INTO `mob_skill` VALUES (527,244,455,'Words_of_Bane', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (528,244,456,'Sigh', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (529,244,457,'Light_of_Penance', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (530,244,458,'Lateral_Slash', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (531,244,459,'Vertical_Slash', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (532,244,460,'Throat_Stab', 0, 3.4, 2000, 2000, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (664,244,503,'Everyones_Grudge', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (665,244,504,'Everyones_Rancor', 0, 7.0, 2000, 1500, 4, 0, 0); -- Certain NMs only

-- Grav'iton
INSERT INTO `mob_skill` VALUES (527,282,455,'Words_of_Bane', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (528,282,456,'Sigh', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (529,282,457,'Light_of_Penance', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (530,282,458,'Lateral_Slash', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (531,282,459,'Vertical_Slash', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (532,282,460,'Throat_Stab', 0, 3.4, 2000, 2000, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (664,282,503,'Everyones_Grudge', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (665,282,504,'Everyones_Rancor', 0, 7.0, 2000, 1500, 4, 0, 0);

-- ZM4 Tonberries
INSERT INTO `mob_skill` VALUES (527,336,455,'Words_of_Bane', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (528,336,456,'Sigh', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (529,336,457,'Light_of_Penance', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (530,336,458,'Lateral_Slash', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (531,336,459,'Vertical_Slash', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (532,336,460,'Throat_Stab', 0, 3.4, 2000, 2000, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (664,336,503,'Everyones_Grudge', 0, 7.0, 2000, 1500, 4, 0, 0);

-- Antica
INSERT INTO `mob_skill` VALUES (535,25,463,'Magnetite_Cloud', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (536,25,464,'Sandstorm', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (540,25,468,'Jamming_Wave', 1, 16.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (537,25,465,'Sand_Veil', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (538,25,466,'Sand_Shield', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (534,25,462,'Shoulder_Slam', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (539,25,467,'Sand_Trap', 1, 12.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (533,25,461,'Spikeball', 0, 13.5, 2000, 1500, 4, 0, 0);
-- Manticore
INSERT INTO `mob_skill` VALUES (541,179,469,'Deadly_Hold', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (542,179,470,'Tail_Swing', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (543,179,471,'Tail_Smash', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (544,179,472,'Heat_Breath', 4, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (545,179,473,'Riddle', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (546,179,474,'Great_Sandstorm', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (547,179,475,'Great_Whirlwind', 4, 10.0, 2000, 1500, 4, 0, 0);
-- Kirin
INSERT INTO `mob_skill` VALUES (541,281,469,'Deadly_Hold', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (542,281,470,'Tail_Swing', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (543,281,471,'Tail_Smash', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (544,281,472,'Heat_Breath', 4, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (545,281,473,'Riddle', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (546,281,474,'Great_Sandstorm', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (547,281,475,'Great_Whirlwind', 4, 10.0, 2000, 1500, 4, 0, 0);
-- Pet Suzaku
INSERT INTO `mob_skill` VALUES (143,333,143,'Scratch', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (144,333,144,'Triple_Attack', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (145,333,145,'Gliding_Spike', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (146,333,146,'Feather_Barrier', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (147,333,147,'Stormwind', 1, 15.0, 2000, 1500, 4, 0, 0);
-- Pet Genbu
INSERT INTO `mob_skill` VALUES (549,330,477,'Head_Butt_Turtle', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (550,330,478,'Tortoise_Stomp', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (551,330,479,'Harden_Shell', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (552,330,480,'Earth_Breath', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (553,330,481,'Aqua_Breath', 4, 10.0, 2000, 1500, 4, 0, 0);
-- Pet Seiryu
INSERT INTO `mob_skill` VALUES (558,331,486,'Deadly_Drive', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (559,331,487,'Wind_Wall', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (560,331,488,'Fang_Rush', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (561,331,489,'Dread_Shriek', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (562,331,490,'Tail_Crush', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (565,331,493,'Radiant_Breath', 4, 15.0, 2000, 1500, 4, 0, 0);
-- Pet Byakko
INSERT INTO `mob_skill` VALUES (14,332,14,'Roar', 1, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (15,332,15,'Razor_Fang', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (17,332,17,'Claw_Cyclone', 4, 15.0, 2000, 1500, 4, 0, 0);
-- Adamantoise
INSERT INTO `mob_skill` VALUES (548,2,476,'Tortoise_Song', 1, 20.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (549,2,477,'Head_Butt_Turtle', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (550,2,478,'Tortoise_Stomp', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (551,2,479,'Harden_Shell', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (552,2,480,'Earth_Breath', 4, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (553,2,481,'Aqua_Breath', 4, 15.0, 2000, 1500, 4, 0, 0);
-- Spider
INSERT INTO `mob_skill` VALUES (554,235,482,'Sickle_Slash', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (555,235,483,'Acid_Spray', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (556,235,484,'Spider_Web', 1, 7.0, 2000, 1500, 4, 0, 0);
-- Wyvern
INSERT INTO `mob_skill` VALUES (557,265,485,'Dispelling_Wind', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (558,265,486,'Deadly_Drive', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (559,265,487,'Wind_Wall', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (560,265,488,'Fang_Rush', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (561,265,489,'Dread_Shriek', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (562,265,490,'Tail_Crush', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (563,265,491,'Blizzard_Breath', 4, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (564,265,492,'Thunder_Breath', 4, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (565,265,493,'Radiant_Breath', 4, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (566,265,494,'Chaos_Breath', 4, 15.0, 2000, 1500, 4, 0, 0);

INSERT INTO `mob_skill` VALUES (557,266,485,'Dispelling_Wind', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (558,266,486,'Deadly_Drive', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (559,266,487,'Wind_Wall', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (560,266,488,'Fang_Rush', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (561,266,489,'Dread_Shriek', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (562,266,490,'Tail_Crush', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (565,266,493,'Radiant_Breath', 4, 15.0, 2000, 1500, 4, 0, 0);

INSERT INTO `mob_skill` VALUES (557,267,485,'Dispelling_Wind', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (558,267,486,'Deadly_Drive', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (559,267,487,'Wind_Wall', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (560,267,488,'Fang_Rush', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (561,267,489,'Dread_Shriek', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (562,267,490,'Tail_Crush', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (565,267,493,'Radiant_Breath', 4, 15.0, 2000, 1500, 4, 0, 0);

-- Suzaku
INSERT INTO `mob_skill` VALUES (143,280,143,'Scratch', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (144,280,144,'Triple_Attack', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (145,280,145,'Gliding_Spike', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (146,280,146,'Feather_Barrier', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (147,280,147,'Stormwind', 1, 15.0, 2000, 1500, 4, 0, 0);

-- Genbu
INSERT INTO `mob_skill` VALUES (549,277,477,'Head_Butt_Turtle', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (550,277,478,'Tortoise_Stomp', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (551,277,479,'Harden_Shell', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (552,277,480,'Earth_Breath', 4, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (553,277,481,'Aqua_Breath', 4, 15.0, 2000, 1500, 4, 0, 0);

-- Seiryu
INSERT INTO `mob_skill` VALUES (558,278,486,'Deadly_Drive', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (559,278,487,'Wind_Wall', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (560,278,488,'Fang_Rush', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (561,278,489,'Dread_Shriek', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (562,278,490,'Tail_Crush', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (565,278,493,'Radiant_Breath', 4, 15.0, 2000, 1500, 4, 0, 0);

-- Byakko
INSERT INTO `mob_skill` VALUES (14,279,14,'Roar', 1, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (15,279,15,'Razor_Fang', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (17,279,17,'Claw_Cyclone', 4, 15.0, 2000, 1500, 4, 0, 0);

-- offsets shift some more.. (tpid - 72 - 89 (-161)

-- mimic
INSERT INTO `mob_skill` VALUES (332,183,107,'Death_Trap', 1, 30.0, 2000, 2000, 4, 0, 0);

-- bugbear
INSERT INTO `mob_skill` VALUES (105,59,828,'Earth_Shock', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (104,59,827,'Flying_Hip_Press', 1, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (103,59,826,'Bionic_Boost', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (102,59,825,'Heavy_Whisk', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (101,59,821,'Heavy_Blow', 0, 7.0, 2000, 1500, 4, 0, 0);
-- Moblin
INSERT INTO `mob_skill` VALUES (832,184,334,'Goblin_Rush', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (825,184,743,'Frypan', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (826,184,744,'Smokebomb', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (827,184,745,'Smokebomb', 0, 10.0, 2000, 1500, 1, 0, 0); -- fail
INSERT INTO `mob_skill` VALUES (828,184,746,'Crispy_Candle', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (829,184,747,'Crispy_Candle', 0, 10.0, 2000, 1500, 1, 0, 0); -- fail
INSERT INTO `mob_skill` VALUES (830,184,748,'Paralysis_Shower', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (831,184,749,'Paralysis_Shower', 0, 10.0, 2000, 1500, 1, 0, 0); -- fail
-- flytrap
INSERT INTO `mob_skill` VALUES (178,114,806,'Soporific', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (179,114,807,'Palsy_Pollen', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (180,114,808,'Gloeosuccus', 0, 7.0, 2000, 1500, 4, 0, 0);
-- Antlion
INSERT INTO `mob_skill` VALUES (19,26,809,'Sand_Blast', 1, 8.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (20,26,810,'Sand_Pit', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (21,26,811,'Venom_Spray', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (23,26,813,'Mandibular_Bite', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (23,26,813,'Gravitic_Horn', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (23,26,813,'Quake_Blast', 0, 7.0, 2000, 1500, 4, 0, 0);
-- eft
INSERT INTO `mob_skill` VALUES (259,98,814,'Toxic_Spit', 0, 9.5, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (260,98,815,'Geist_Wall', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (261,98,816,'Numbing_Noise', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (262,98,817,'Nimble_Snap', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (263,98,818,'Cyclotail', 1, 10.0, 2000, 1500, 4, 0, 0);

-- Fomor
INSERT INTO `mob_skill` VALUES (246,115,246,'Shackled_Fists', 0, 7.0, 2000, 0, 4, 1, 0);
INSERT INTO `mob_skill` VALUES (247,115,247,'Foxfire', 4, 10.0, 2000, 0, 4, 1, 0);
INSERT INTO `mob_skill` VALUES (248,115,248,'Grim_Halo', 1, 10.0, 2000, 0, 4, 1, 0);
INSERT INTO `mob_skill` VALUES (249,115,249,'Netherspikes', 4, 10.0, 2000, 0, 4, 1, 0);
INSERT INTO `mob_skill` VALUES (250,115,250,'Carnal_Nightmare', 1, 10.0, 2000, 0, 4, 1, 0);
INSERT INTO `mob_skill` VALUES (251,115,251,'Dancing_Chains', 1, 10.0, 2000, 0, 4, 1, 0);
INSERT INTO `mob_skill` VALUES (252,115,252,'Aegis_Schism', 0, 7.0, 2000, 0, 4, 1, 0);
INSERT INTO `mob_skill` VALUES (253,115,253,'Barbed_Crescent', 0, 7.0, 2000, 0, 4, 1, 0);

-- Hydra Fomor
INSERT INTO `mob_skill` VALUES (246,359,246,'Shackled_Fists', 0, 7.0, 2000, 0, 4, 1, 0);
INSERT INTO `mob_skill` VALUES (247,359,247,'Foxfire', 4, 10.0, 2000, 0, 4, 1, 0);
INSERT INTO `mob_skill` VALUES (248,359,248,'Grim_Halo', 1, 10.0, 2000, 0, 4, 1, 0);
INSERT INTO `mob_skill` VALUES (249,359,249,'Netherspikes', 4, 10.0, 2000, 0, 4, 1, 0);
INSERT INTO `mob_skill` VALUES (250,359,250,'Carnal_Nightmare', 1, 10.0, 2000, 0, 4, 1, 0);
INSERT INTO `mob_skill` VALUES (251,359,251,'Dancing_Chains', 1, 10.0, 2000, 0, 4, 1, 0);
INSERT INTO `mob_skill` VALUES (252,359,252,'Aegis_Schism', 0, 7.0, 2000, 0, 4, 1, 0);
INSERT INTO `mob_skill` VALUES (253,359,253,'Barbed_Crescent', 0, 7.0, 2000, 0, 4, 1, 0);

-- taurus
INSERT INTO `mob_skill` VALUES (242,240,851,'Triclip', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (243,240,852,'Back_Swish', 4, 13.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (244,240,853,'Mow', 1, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (245,240,854,'Frightful_Roar', 1, 12.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (246,240,855,'Mortal_Ray', 4, 10.0, 2000, 2500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (247,240,856,'Unblessed_Armor', 0, 7.0, 2000, 1500, 1, 0, 0);
-- cluster
INSERT INTO `mob_skill` VALUES (311,68,866,'Sling_Bomb', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (312,68,867,'Formation_Attack', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (313,68,868,'Refueling', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (314,68,869,'Circle_of_Flames', 1, 10.0, 2000, 1500, 4, 0, 0);

INSERT INTO `mob_skill` VALUES (313,69,868,'Refueling', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (311,69,866,'Sling_Bomb', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (312,69,867,'Formation_Attack', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (314,69,869,'Circle_of_Flames', 1, 10.0, 2000, 1500, 4, 0, 0);
-- uragnite
INSERT INTO `mob_skill` VALUES (1315,251,861,'Gas_Shell', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1317,251,863,'Palsynyxis', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1314,251,865,'Suctorial_Tentacle', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1313,251,864,'Painful_Whip', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1316,251,862,'Venom_Shell', 1, 10.0, 2000, 1500, 4, 0, 0);
-- snoll
INSERT INTO `mob_skill` VALUES (1391,232,875,'Berserk', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (1389,232,876,'Freeze_Rush', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1390,232,877,'Cold_Wave', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1388,232,878,'Hypothermal_Combustion', 1, 20.0, 2000, 2000, 4, 0, 0);
-- corse
INSERT INTO `mob_skill` VALUES (274,74,900,'Memento_Mori', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (275,74,901,'Silence_Seal', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (276,74,902,'Envoutement', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (277,74,903,'Danse_Macabre', 0, 10.0, 2000, 2000, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (1073,74,903,'Gala_Macabre', 1, 10.0, 2000, 2000, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (274,74,1070,'Final_Retribution', 1, 10.0, 2000, 1500, 4, 0, 0);
-- Spheroids
INSERT INTO `mob_skill` VALUES (728,234,685,'Electrocharge', 0, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (305,234,971,'Electromagnetic_Field', 1, 10.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (1657,234,0,'Stunbolt', 0, 10.0, 2000, 1500, 4, 0, 0); -- Animation?
-- INSERT INTO `mob_skill` VALUES (1775,234,972,'Reactive_Shield', 0, 7.0, 2000, 1500, 1, 0, 0); -- CoP zones only.
-- mammet
-- --------------------
-- VALUES POST 1024
-- Take tpid and +256 then -1024 to find the correct param for the packet
-- Take animid and -1024 to find the correct param
-- REMEMBER TO SET BOTH ANIM AND TPID TO THE CORRECT 0X01

-- Mamool Ja
INSERT INTO `mob_skill` VALUES (1475,176,1265,'Forceful_Blow', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1476,176,1266,'Somersault_Kick', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1477,176,1267,'Firespit', 0, 30.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1478,176,1268,'Warm-Up', 0, 7.0, 2000, 1500, 1, 0, 0);
-- INSERT INTO `mob_skill` VALUES (1664,176,1347,'Rushing_Drub', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (1670,176,1353,'Groundburst', 1, 16.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (1545,176,1228,'Vorpal_Wheel', 0, 7.0, 2000, 1500, 4, 0, 0); Gulool Jaja only
-- INSERT INTO `mob_skill` VALUES (1544,176,1227,'Miasma', 1, 16.0, 2000, 1500, 4, 0, 0); Gulool Jaja only
-- INSERT INTO `mob_skill` VALUES (1543,176,1226,'Tyranic_Blare', 1, 16.0, 2000, 1500, 4, 0, 0); Gulool Jaja only
-- INSERT INTO `mob_skill` VALUES (1542,176,1225,'Decussate', 1, 16.0, 2000, 1500, 4, 0, 0); Gulool Jaja only
-- INSERT INTO `mob_skill` VALUES (1542,176,1155,'Vorpal_Blade', 1, 16.0, 2000, 1500, 4, 0, 0); Gulool Jaja only

-- Apkallu
INSERT INTO `mob_skill` VALUES (1457,27,1159,'Yawn', 1, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1458,27,1160,'Wing_Slap', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1459,27,1161,'Beak_Lunge', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1460,27,1162,'Frigid_Shuffle', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1461,27,1163,'Wing_Whirl', 1, 10.0, 2000, 1500, 4, 0, 0);

-- Marid
INSERT INTO `mob_skill` VALUES (1447,180,1170,'Barrier_Tusk', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (1448,180,1171,'Onrush', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1449,180,1172,'Stampede', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1450,180,1173,'Flailing_Trunk', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1451,180,1174,'Voracious_Trunk', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (1452,180,1175,'Proboscis_Shower', 0, 7.0, 2000, 1500, 4, 0, 0); -- NM only
-- Colibri
INSERT INTO `mob_skill` VALUES (1443,72,1176,'Pecking_Flurry', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1444,72,1177,'Snatch_Morsel', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1445,72,1178,'Feather_Tickle', 0, 7.0, 2000, 1500, 4, 0, 0);
-- Imp
INSERT INTO `mob_skill` VALUES (1455,165,1180,'Frenetic_Rip', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1453,165,1181,'Abrasive_Tantara', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1454,165,1182,'Deafening_Tantara', 1, 10.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Grating_Tantara', 1, 10.0, 2000, 1500, 4, 0, 0); -- Used by NM
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Stifling_Tantara', 1, 10.0, 2000, 1500, 4, 0, 0); -- Used by NM

INSERT INTO `mob_skill` VALUES (1455,166,1180,'Frenetic_Rip', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1453,166,1181,'Abrasive_Tantara', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1454,166,1182,'Deafening_Tantara', 1, 10.0, 2000, 1500, 4, 0, 0);

-- Puk
INSERT INTO `mob_skill` VALUES (1468,198,1199,'White_Wind', 1, 10.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (1467,198,1198,'Ill_Wind', 1, 16.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1466,198,1197,'Zephyr_Mantle', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (1465,198,1196,'Obfuscate', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1464,198,1195,'Wind_Shear', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1462,198,1194,'Crosswind', 4, 18.0, 2000, 1500, 4, 0, 0);
-- Qutrub
INSERT INTO `mob_skill` VALUES (1522,203,1205,'Spinal_Cleave', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1523,203,1206,'Mangle', 4, 16.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1524,203,1207,'Leaping_Cleave', 0, 7.0, 2000, 1500, 4, 0, 0);

INSERT INTO `mob_skill` VALUES (1522,204,1205,'Spinal_Cleave', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1523,204,1206,'Mangle', 4, 16.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1524,204,1207,'Leaping_Cleave', 0, 7.0, 2000, 1500, 4, 0, 0);

INSERT INTO `mob_skill` VALUES (1522,205,1205,'Spinal_Cleave', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1523,205,1206,'Mangle', 4, 16.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1524,205,1207,'Leaping_Cleave', 0, 7.0, 2000, 1500, 4, 0, 0);

-- Eruca
INSERT INTO `mob_skill` VALUES (90,107,90,'Cocoon', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (88,107,88,'Sticky_Thread', 4, 10.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,107,0,'Incinerate', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (90,108,90,'Cocoon', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (88,108,88,'Sticky_Thread', 4, 10.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,108,0,'Incinerate', 4, 10.0, 2000, 1500, 4, 0, 0);

-- Flan
-- INSERT INTO `mob_skill` VALUES (0,108,0,'Incinerate', 4, 10.0, 2000, 1500, 4, 0, 0);

-- Wamouracampa

-- Wamoura

-- Wivre
-- INSERT INTO `mob_skill` VALUES (0,257,0,'Batterhorn', 4, 16.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,257,0,'Clobber', 4, 16.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,257,1226,'Demoralizing_Roar', 1, 16.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,257,0,'Boiling_Blood', 0, 7.0, 2000, 1500, 1, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,257,1227,'Granite_Skin', 0, 7.0, 2000, 1500, 1, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,257,0,'Crippling_Slam', 4, 16.0, 2000, 1500, 4, 0, 0);

-- Ladybug
INSERT INTO `mob_skill` VALUES (1925,170,1579,'Spiral_Spin', 0, 7.0, 2000, 1500, 4, 0, 0);
-- Pixie
INSERT INTO `mob_skill` VALUES (1937,195,1581,'Zephyr_Arrow', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1938,195,1582,'Lethe_Arrows', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (1939,195,1583,'Spring_Breeze',1,10.0,2000,1500,4,0, 0);
-- INSERT INTO `mob_skill` VALUES (1940,195,1584,'Summer_Breeze',1,10.0,2000,1500,4,0, 0);
-- INSERT INTO `mob_skill` VALUES (1941,195,1585,'Autumn_Breeze',1,10.0,2000,1500,4,0, 0);
-- INSERT INTO `mob_skill` VALUES (1942,195,1586,'Winter_Breeze',1,10.0,2000,1500,4,0, 0);
INSERT INTO `mob_skill` VALUES (1943,195,1587,'Cyclonic_Turmoil', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1944,195,1588,'Cyclonic_Torrent', 0, 7.0, 2000, 1500, 4, 0, 0);

-- Gnole
INSERT INTO `mob_skill` VALUES (1913,132,1593,'Plenilune_Embrace', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1914,132,1594,'Fevered_Pitch', 0, 7.0, 2000, 1500, 4, 0, 0);
-- Djinn
INSERT INTO `mob_skill` VALUES (1960,82,1597,'Nocturnal_Combustion', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1962,82,1599,'Penumbral_Impact', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1963,82,1600,'Dark_Wave', 0, 7.0, 2000, 1500, 4, 0, 0);
-- Ghrah
INSERT INTO `mob_skill` VALUES (1187,122,1061,'Hexidiscs', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1185,122,1065,'Actinic_Burst', 0, 7.0, 2000, 1500, 4, 0, 0);

INSERT INTO `mob_skill` VALUES (1187,123,1061,'Hexidiscs', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1185,123,1065,'Actinic_Burst', 0, 7.0, 2000, 1500, 4, 0, 0);

INSERT INTO `mob_skill` VALUES (1187,124,1061,'Hexidiscs', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1185,124,1065,'Actinic_Burst', 0, 7.0, 2000, 1500, 4, 0, 0);
-- Euvhi
INSERT INTO `mob_skill` VALUES (1194,109,1067,'Viscid_Nectar', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1196,109,1068,'Axial_Bloom', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1191,109,1070,'Vertical_Cleave', 0, 7.0, 2000, 1500, 4, 0, 0);
-- Zdei
INSERT INTO `mob_skill` VALUES (1209,272,1076,'Optic_Induration', 0, 7.0, 2000, 1500, 4, 0, 0);
-- Yovra
INSERT INTO `mob_skill` VALUES (1119,271,1027,'Asthenic_Fog', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1117,271,1025,'Ion_Shower', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1116,271,1024,'Concussive_Oscillation', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1115,271,1023,'Primal_Drill', 0, 7.0, 2000, 1500, 4, 0, 0);
-- Aern
INSERT INTO `mob_skill` VALUES (1128,3,1019,'Disseverment', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1127,3,1018,'Glacier_Splitter', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (1126,3,1014,'Crystaline_Cocoon',0,7.0,2000,1000,1,0, 0);
-- INSERT INTO `mob_skill` VALUES (1125,3,1013,'Depuration',0,7.0,2000,1000,1,0, 0);
-- INSERT INTO `mob_skill` VALUES (1129,3,1012,'Biotic_Boomerang',1,10.0,2000,1000,4,0, 0);
-- INSERT INTO `mob_skill` VALUES (1130,3,1021,'Medusa_Javelin',0,7.0,2000,1000,1,0, 0);
-- INSERT INTO `mob_skill` VALUES (1131,3,1017,'Sideswipe',0,7.0,2000,1000,1,0, 0);
-- INSERT INTO `mob_skill` VALUES (1124,3,1016,'Impact_Stream',1,10.0,2000,1000,4,0, 0);
-- INSERT INTO `mob_skill` VALUES (1123,3,1011,'Auroral_Wind',1,10.0,2000,1000,4,0, 0);
-- INSERT INTO `mob_skill` VALUES (1122,3,1020,'Wing_Thrust',1,10.0,2000,1000,4,0, 0);
-- INSERT INTO `mob_skill` VALUES (1121,0,0,'Fluorescence',0,7.0,2000,1000,4,0, 0);
-- Phuabo
INSERT INTO `mob_skill` VALUES (1101,194,1008,'Tidal_Dive', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1098,194,1005,'Vapor_Spray', 0, 7.0, 2000, 1500, 4, 0, 0);
-- Xzomit
INSERT INTO `mob_skill` VALUES (1096,269,1003,'Saline_Coat', 0, 7.0, 2000, 1500, 4, 0, 0); -- not included since buffs dont work yet
INSERT INTO `mob_skill` VALUES (1094,269,1001,'Ink_Cloud', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1093,269,1004,'Mantle_Pierce', 0, 7.0, 2000, 1500, 4, 0, 0);
-- Troll
INSERT INTO `mob_skill` VALUES (1487,246,1232,'Rock_Smash', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1488,246,1233,'Diamondhide', 1, 16.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (1489,246,1234,'Enervation', 1, 18.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1490,246,1235,'Quake_Stomp', 0, 7.0, 2000, 1500, 1, 0, 0);
-- INSERT INTO `mob_skill` VALUES (1493,246,1247,'Healing_Stomp', 1, 16.0, 2000, 1500, 1, 0, 0); -- NM only
-- Automaton
INSERT INTO `mob_skill` VALUES (1684,31,1304,'Chimera_Ripper', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1685,31,1305,'String_Clipper', 0, 7.0, 2000, 1500, 4, 0, 0);

-- INSERT INTO `mob_skill` VALUES (1688,0,1307,'Shield_Bash', 0, 7.0, 2000, 1500, 4, 0, 0);

INSERT INTO `mob_skill` VALUES (1687,28,1306,'Slap_Stick', 0, 7.0, 2000, 1500, 4, 0, 0);

INSERT INTO `mob_skill` VALUES (1686,29,1303,'Arcuballista', 0, 15.0, 2000, 1500, 4, 0, 0);

-- Lamia = 171 Merrow = 182
INSERT INTO `mob_skill` VALUES (1510,171,1253,'Hysteric_Barrage', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1515,182,1258,'Tail_Slap', 4, 16.0, 2000, 1500, 4, 0, 0);
-- Poroggo
INSERT INTO `mob_skill` VALUES (1704,196,1362,'Frog_Cheer', 0, 7.0, 2000, 1500, 2, 0, 0);
INSERT INTO `mob_skill` VALUES (1703,196,1361,'Water_Bomb', 1, 16.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1702,196,1360,'Magic_Hammer', 0, 16.0, 2000, 1500, 4, 0, 0);
-- Vampyr
INSERT INTO `mob_skill` VALUES (1850,252,1450,'Bloodrake', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1854,252,1454,'Wings_of_Gehenna', 1, 18.0, 2000, 1500, 4, 0, 0);
-- Dvergr
INSERT INTO `mob_skill` VALUES (1862,90,1458,'Bilgestorm', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1863,90,1459,'Thundris_Shriek', 0, 7.0, 2000, 1500, 4, 0, 0);
-- Peiste
INSERT INTO `mob_skill` VALUES (1897,192,1544,'Regurgitation', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1898,192,1545,'Delta_Thrust', 0, 7.0, 2000, 1500, 4, 0, 0);
-- Gnat
INSERT INTO `mob_skill` VALUES (1902,131,1567,'Insipid_Nip', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1903,131,1568,'Pandemic_Nip', 0, 7.0, 2000, 1500, 4, 0, 0);
-- Limule
INSERT INTO `mob_skill` VALUES (2308,173,1796,'Blazing_Bound', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (2309,173,1797,'Molting_Burst', 0, 7.0, 2000, 1500, 4, 0, 0);
-- Clionid
INSERT INTO `mob_skill` VALUES (2307,65,1795,'Rime_Spray', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (2306,65,1794,'Acrid_Stream', 0, 7.0, 2000, 1500, 4, 0, 0);
-- Murex
INSERT INTO `mob_skill` VALUES (2373,187,1829,'Benthic_Typhoon', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (2374,187,1830,'Pelagic_Tempest', 0, 7.0, 2000, 1500, 4, 0, 0);
-- Amoeban
INSERT INTO `mob_skill` VALUES (2375,5,1831,'Osmosis', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (2376,5,1832,'Vacuole_Discharge', 0, 7.0, 2000, 1500, 4, 0, 0);
-- pet wyvern
-- mob wyverns use custom skill list
INSERT INTO `mob_skill` VALUES (638,193,621,'healing_breath_i', 0, 10.0, 2000, 2000, 2, 0, 0);
INSERT INTO `mob_skill` VALUES (639,193,622,'healing_breath_ii', 0, 10.0, 2000, 2000, 2, 0, 0);
INSERT INTO `mob_skill` VALUES (640,193,623,'healing_breath_iii', 0, 10.0, 2000, 2000, 2, 0, 0);
INSERT INTO `mob_skill` VALUES (641,193,624,'remove_poison', 0, 10.0, 2000, 1500, 2, 0, 0);
INSERT INTO `mob_skill` VALUES (642,193,625,'remove_blindness', 0, 10.0, 2000, 1500, 2, 0, 0);
INSERT INTO `mob_skill` VALUES (643,193,626,'remove_paralysis', 0, 10.0, 2000, 1500, 2, 0, 0);
INSERT INTO `mob_skill` VALUES (644,193,627,'flame_breath', 0, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (645,193,628,'frost_breath', 0, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (646,193,629,'gust_breath', 0, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (647,193,630,'sand_breath', 0, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (648,193,631,'lightning_breath', 0, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (649,193,632,'hydro_breath', 0, 10.0, 2000, 1500, 4, 0, 0);

-- --------------------------------------
-- NM / HNM
-- --------------------------------------

-- Kam'lanaut
-- TODO: Script these when mob additional effects work.
-- INSERT INTO `mob_skill` VALUES (567,351,495,'Fire_Blade',0,7,2000,0,1,0, 0);
-- INSERT INTO `mob_skill` VALUES (568,351,496,'Frost_Blade',0,7,2000,0,1,0, 0);
-- INSERT INTO `mob_skill` VALUES (569,351,497,'Wind_Blade',0,7,2000,0,1,0, 0);
-- INSERT INTO `mob_skill` VALUES (570,351,498,'Earth_Blade',0,7,2000,0,1,0, 0);
-- INSERT INTO `mob_skill` VALUES (571,351,499,'Lightning_Blade',0,7,2000,0,1,0, 0);
-- INSERT INTO `mob_skill` VALUES (572,351,500,'Water_Blade',0,7,2000,0,1,0, 0);
INSERT INTO `mob_skill` VALUES (573,351,501,'Great_Wheel', 1,7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (574,351,502,'Light_Blade', 0, 30.0, 2000, 1500, 4, 0, 0);

-- Ark Angel EV
INSERT INTO `mob_skill` VALUES (677,352,635,'Dominion_Slash',2,10,2000,0,4,0, 0);
INSERT INTO `mob_skill` VALUES (678,352,638,'Shield_Strike',4,7,2000,0,4,0, 0);
INSERT INTO `mob_skill` VALUES (686,352,642,'Spirits_Within',0,7,2000,0,4,0, 0);
INSERT INTO `mob_skill` VALUES (687,352,643,'Vorpal_Blade',0,7,2000,0,4,0, 0);
-- Ark Angel GK
INSERT INTO `mob_skill` VALUES (681,353,637,'Dragonfall',1,7,2000,0,4,0, 0);
INSERT INTO `mob_skill` VALUES (690,353,648,'Tachi_Yukikaze',0,7,2000,0,4,0, 0);
INSERT INTO `mob_skill` VALUES (691,353,649,'Tachi_Gekko',0,7,2000,0,4,0, 0);
INSERT INTO `mob_skill` VALUES (692,353,650,'Tachi_Kasha',0,7,2000,0,4,0, 0);
-- Ark Angel HM
INSERT INTO `mob_skill` VALUES (675,354,633,'Cross_Reaver',4,7,2000,0,4,0, 0);
INSERT INTO `mob_skill` VALUES (682,354,640,'Circle_Blade',1,7,2000,0,4,0, 0);
INSERT INTO `mob_skill` VALUES (683,354,641,'Swift_Blade',0,7,2000,0,4,0, 0);
-- Ark Angel MR
INSERT INTO `mob_skill` VALUES (676,355,634,'Havoc_Spiral',1,7,2000,0,4,0, 0);
INSERT INTO `mob_skill` VALUES (684,355,644,'Rampage',0,7,2000,0,4,0, 0);
INSERT INTO `mob_skill` VALUES (685,355,645,'Calamity',0,7,2000,0,4,0, 0);
-- Ark Angel TT
INSERT INTO `mob_skill` VALUES (679,356,636,'Amon_Drive',2,10,2000,0,4,0, 0);
INSERT INTO `mob_skill` VALUES (688,356,646,'Spinning_Scythe',1,7,2000,0,4,0, 0);
INSERT INTO `mob_skill` VALUES (689,356,647,'Guillotine',0,7,2000,0,4,0, 0);

-- Cerberus
INSERT INTO `mob_skill` VALUES (1529,62,1223,'Lava_Spit', 1, 10.0, 2000, 1500, 4, 0, 0); -- ~400 dmg
INSERT INTO `mob_skill` VALUES (1530,62,1224,'Sulfurous_Breath', 0, 7.0, 2000, 1500, 4, 0, 0); -- ~500 dmg
INSERT INTO `mob_skill` VALUES (1531,62,1225,'Scorching_Lash', 1, 20.0, 2000, 1500, 4, 0, 0); -- ~900 dmg
INSERT INTO `mob_skill` VALUES (1532,62,1226,'Ululation', 1, 20.0, 2000, 1500, 4, 0, 0); -- Paralyze
INSERT INTO `mob_skill` VALUES (1533,62,1227,'Magma_Hoplon', 0, 7.0, 2000, 1500, 1, 0, 0); -- Stoneskin + Blaze Spike
INSERT INTO `mob_skill` VALUES (1534,62,1228,'Gates_of_Hades', 1, 20.0, 2000, 1500, 4, 0, 0); -- ~950 dmg + 20hp/tick

-- Hydra
INSERT INTO `mob_skill` VALUES (1572,164,1308,'Pyric_Blast', 4, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1573,164,1319,'Polar_Bulwark', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (1574,164,1309,'Polar_Blast', 4, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1575,164,1318,'Pyric_Bulwark', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (1576,164,1313,'Barofield', 4, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1578,164,1310,'Trembling', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1579,164,1311,'Serpentine_Tail', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1580,164,1312,'Nerve_Gas', 1, 10.0, 2000, 1500, 4, 0, 0);

-- Khimaira
INSERT INTO `mob_skill` VALUES (1769,168,1369,'Dreadstorm', 1, 18.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1770,168,1381,'Fossilizing_Breath', 4, 16.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1772,168,1386,'Fulmination', 1, 32.0, 2000, 1500, 4, 0, 0); -- only at < 37% strong paralyze
INSERT INTO `mob_skill` VALUES (1771,168,1382,'Plague_Swipe', 4, 16.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1766,168,1367,'Tenebrous_Mist', 1, 18.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1767,168,1368,'Thunderstrike', 1, 18.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (1768,168,1371,'Tourbillion', 1, 18.0, 2000, 1500, 4, 0, 0); -- Need a system to lower wings with crits.  Commented out for now.

-- King Vinegaroon
INSERT INTO `mob_skill` VALUES (463,274,94,'Critical_Bite', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (466,274,98,'Venom_Storm', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (467,274,99,'Earthbreaker', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (464,274,95,'Venom_Sting', 0, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (97,274,97,'Death_Scissors', 0, 9.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (98,274,98,'Wild_Rage', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (99,274,99,'Earth_Pounder', 1, 15.0, 2000, 1500, 4, 0, 0);

-- Ouryu
-- INSERT INTO `mob_skill` VALUES (384,259,656,'Touchdown',0,6.0,2000,1500,4,0, 0);
INSERT INTO `mob_skill` VALUES (695,259,653,'Hurricane_Wing', 1, 30.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (696,259,654,'Spike_Flail', 4, 23.0, 2000, 2000, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (701,259,651,'Absolute_Terror', 0, 18.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (702,259,652,'Horrid_Roar', 0, 18.0, 2000, 1500, 4, 0, 0);

-- Fafnir
-- INSERT INTO `mob_skill` VALUES (384,260,656,'Touchdown',0,6.0,2000,1500,4,0, 0);
INSERT INTO `mob_skill` VALUES (695,260,653,'Hurricane_Wing', 1, 30.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (696,260,654,'Spike_Flail', 4, 23.0, 2000, 2000, 4, 0, 0); -- only if a player is behind fafnir
INSERT INTO `mob_skill` VALUES (697,260,655,'Dragon_Breath', 4, 18.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (701,260,651,'Absolute_Terror', 0, 18.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (702,260,652,'Horrid_Roar', 0, 18.0, 2000, 1500, 4, 0, 0);

-- Cynoprosopi
-- INSERT INTO `mob_skill` VALUES (384,261,656,'Touchdown',0,6.0,2000,1500,4,0, 0);
INSERT INTO `mob_skill` VALUES (695,261,653,'Hurricane_Wing', 1, 30.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (696,261,654,'Spike_Flail', 4, 23.0, 2000, 2000, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (697,261,655,'Dragon_Breath', 4, 18.0, 2000, 1500, 4, 0, 0);

-- Wyrm
-- INSERT INTO `mob_skill` VALUES (384,262,656,'Touchdown',0,6.0,2000,1500,4,0, 0);
INSERT INTO `mob_skill` VALUES (695,262,653,'Hurricane_Wing', 1, 30.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (696,262,654,'Spike_Flail', 4, 23.0, 2000, 2000, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (697,262,655,'Dragon_Breath', 4, 18.0, 2000, 1500, 4, 0, 0);

-- Nidhogg
-- INSERT INTO `mob_skill` VALUES (384,262,656,'Touchdown',0,6.0,2000,1500,4,0, 0);
INSERT INTO `mob_skill` VALUES (695,263,653,'Hurricane_Wing', 1, 30.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (696,263,654,'Spike_Flail', 4, 23.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (697,263,655,'Dragon_Breath', 4, 18.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (701,263,651,'Absolute_Terror', 0, 18.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (702,263,651,'Horrid_Roar', 0, 18.0, 2000, 1500, 4, 0, 0);

-- INSERT INTO `mob_skill` VALUES (698,193,656,'Touchdown', 0, 7.0, 2000, 1500, 4, 0, 0);
-- anim 657 for fire breath attack (in air)

-- --------------------------------------
-- MAAT
-- --------------------------------------

INSERT INTO `mob_skill` VALUES (772,335,729,'Tackle', 0, 7.0, 2000, 0, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (777,335,734,'Dragon_Kick', 0, 10.0, 2000, 0, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (778,335,735,'Asuran_Fists', 0, 7.0, 2000, 0, 4, 0, 0);

-- --------------------------------------
-- AVATAR
-- --------------------------------------

-- Fenrir
INSERT INTO `mob_skill` VALUES (575,36,513,'moonlit_charge', 0, 10.0, 512, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (576,36,514,'crescent_fang', 0, 10.0, 513, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (577,36,515,'lunar_cry', 0, 10.0, 514, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (578,36,516,'ecliptic_growl', 1, 10.0, 516, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (579,36,517,'lunar_roar', 1, 10.0, 515, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (580,36,518,'eclipse_bite', 0, 10.0, 518, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (581,36,519,'ecliptic_howl', 1, 10.0, 517, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (582,36,550,'lunar_bay', 0, 10.0, 519, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (583,36,521,'howling_moon', 1, 10.0, 520, 1500, 4, 0, 0);

INSERT INTO `mob_skill` VALUES (577,325,515,'Lunar_Cry', 0, 10.0, 514, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (579,325,517,'Lunar_Roar', 1, 30.0, 515, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (580,325,518,'Eclipse_Bite', 0, 10.0, 518, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (583,325,521,'Howling_Moon', 1, 30.0, 520, 1500, 4, 0, 0);

-- Ifrit
INSERT INTO `mob_skill` VALUES (584,38,526,'punch', 0, 10.0, 528, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (585,38,527,'fire_ii', 0, 10.0, 529, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (586,38,528,'burning_strike', 0, 10.0, 530, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (587,38,529,'double_punch', 0, 10.0, 531, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (588,38,530,'crimson_howl', 1, 10.0, 532, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (589,38,531,'fire_iv', 0, 10.0, 533, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (590,38,532,'flaming_crush', 0, 10.0, 534, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (591,38,533,'meteor_strike', 0, 10.0, 535, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (592,38,534,'inferno', 1, 10.0, 536, 1500, 4, 0, 0);

INSERT INTO `mob_skill` VALUES (589,322,531,'Fire_IV', 0, 10.0, 533, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (590,322,532,'Flaming_Crush', 0, 10.0, 534, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (591,322,533,'Meteor_Strike', 0, 10.0, 535, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (592,322,534,'Inferno', 1, 10.0, 536, 1500, 4, 0, 0);

-- Titan
INSERT INTO `mob_skill` VALUES (593,45,539,'rock_throw', 0, 12.0, 544, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (594,45,540,'stone_ii', 0, 10.0, 545, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (595,45,541,'rock_buster', 0, 10.0, 546, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (596,45,542,'megalith_throw', 0, 17.0, 547, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (597,45,543,'earthen_ward', 1, 10.0, 548, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (598,45,544,'stone_iv', 0, 10.0, 549, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (599,45,545,'mountain_buster', 0, 10.0, 550, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (600,45,546,'geocrush', 0, 10.0, 551, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (601,45,547,'earthen_fury', 1, 10.0, 552, 1500, 4, 0, 0);

INSERT INTO `mob_skill` VALUES (597,321,543,'Earthen_Ward', 1, 10.0, 548, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (598,321,544,'Stone_IV', 0, 10.0, 549, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (599,321,545,'Mountain_Buster', 0, 10.0, 550, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (600,321,546,'Geocrush', 0, 10.0, 551, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (601,321,547,'Earthen_Fury', 1, 10.0, 552, 1500, 4, 0, 0);

-- Leviathan
INSERT INTO `mob_skill` VALUES (602,40,552,'barracuda_dive', 0, 10.0, 560, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (603,40,553,'water_ii', 0, 10.0, 561, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (604,40,554,'tail_whip', 0, 10.0, 562, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (605,40,555,'spring_water', 1, 10.0, 563, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (606,40,556,'slowga', 1, 10.0, 564, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (607,40,557,'water_iv', 0, 20.0, 565, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (608,40,558,'spinning_dive', 0, 10.0, 566, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (609,40,559,'grand_fall', 0, 10.0, 567, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (610,40,560,'tidal_wave', 1, 20.0, 568, 1500, 4, 0, 0);

INSERT INTO `mob_skill` VALUES (605,323,555,'Spring_Water', 1, 10.0, 563, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (607,323,557,'Water_IV', 0, 20.0, 565, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (608,323,558,'Spinning_Dive', 0, 10.0, 566, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (609,323,559,'Grand_Fall', 0, 10.0, 567, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (610,323,560,'Tidal_Wave', 1, 20.0, 568, 1500, 4, 0, 0);

-- Garuda
INSERT INTO `mob_skill` VALUES (611,37,565,'claw', 0, 10.0, 576, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (612,37,566,'aero_ii', 0, 10.0, 577, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (613,37,569,'whispering_wind', 1, 10.0, 578, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (614,37,568,'hastega', 1, 10.0, 579, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (615,37,567,'aerial_armor', 1, 10.0, 580, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (616,37,570,'aero_iv', 0, 10.0, 581, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (617,37,571,'predator_claws', 0, 10.0, 582, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (618,37,572,'wind_blade', 0, 10.0, 583, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (619,37,573,'aerial_blast', 1, 10.0, 584, 1500, 4, 0, 0);

INSERT INTO `mob_skill` VALUES (616,324,570,'Aero_IV', 0, 10.0, 581, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (617,324,571,'Predator_Claws', 0, 10.0, 582, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (618,324,572,'Wind_Blade', 0, 10.0, 583, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (619,324,573,'Aerial_Blast', 1, 10.0, 584, 1500, 4, 0, 0);

-- Shiva
INSERT INTO `mob_skill` VALUES (620,44,578,'axe_kick', 0, 10.0, 592, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (621,44,579,'blizzard_ii', 0, 10.0, 593, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (622,44,580,'frost_armor', 1, 10.0, 594, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (623,44,581,'sleepga', 1, 10.0, 595, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (624,44,582,'double_slap', 0, 10.0, 596, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (625,44,583,'blizzard_iv', 0, 10.0, 597, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (626,44,584,'rush', 0, 10.0, 598, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (627,44,585,'heavenly_strike', 0, 10.0, 599, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (628,44,586,'diamond_dust', 1, 10.0, 600, 1500, 4, 0, 0);

INSERT INTO `mob_skill` VALUES (625,319,583,'Blizzard_IV', 0, 10.0, 597, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (626,319,584,'Rush', 0, 10.0, 598, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (627,319,585,'Heavenly_Strike', 0, 10.0, 599, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (628,319,586,'Diamond_Dust', 1, 10.0, 600, 1500, 4, 0, 0);

-- Ramuh
INSERT INTO `mob_skill` VALUES (629,43,591,'shock_strike', 0, 10.0, 608, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (630,43,592,'thunder_ii', 0, 10.0, 609, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (631,43,593,'rolling_thunder', 1, 10.0, 610, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (632,43,594,'thunderspark', 1, 10.0, 611, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (633,43,595,'lightning_armor', 1, 10.0, 612, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (634,43,596,'thunder_iv', 0, 10.0, 613, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (635,43,597,'chaotic_strike', 0, 10.0, 614, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (636,43,598,'thunderstorm', 0, 10.0, 615, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (637,43,599,'judgment_bolt', 1, 10.0, 616, 1500, 4, 0, 0);

INSERT INTO `mob_skill` VALUES (634,320,596,'Thunder_IV', 0, 10.0, 613, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (635,320,597,'Chaotic_Strike', 0, 10.0, 614, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (636,320,598,'Thunderstorm', 0, 10.0, 615, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (637,320,599,'Judgment_Bolt', 1, 10.0, 616, 1500, 4, 0, 0);

-- Carbuncle
INSERT INTO `mob_skill` VALUES (650,34,605,'healing_ruby', 0, 10.0, 496, 1500, 2, 0, 0);
INSERT INTO `mob_skill` VALUES (651,34,606,'poison_nails', 0, 10.0, 497, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (652,34,607,'shining_ruby', 1, 10.0, 498, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (653,34,608,'glittering_ruby', 1, 10.0, 499, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (654,34,609,'meteorite', 0, 10.0, 500, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (655,34,610,'healing_ruby_ii', 1, 10.0, 501, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (656,34,611,'searing_light', 1, 10.0, 502, 1500, 4, 0, 0);

-- --------------------------------------
-- ZNM
-- --------------------------------------

-- Vulpangue (286)
-- INSERT INTO `mob_skill` VALUES (1468,286,0,'White_Wind', 0, 20.0, 2000, 1500, 2, 0, 0);
-- INSERT INTO `mob_skill` VALUES (1467,286,0,'Ill_Wind', 1, 18.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1466,286,1197,'Zephyr_Mantle', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (1465,286,1196,'Obfuscate', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1464,286,1195,'Wind_Shear', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1462,286,1194,'Crosswind', 4, 18.0, 2000, 1500, 4, 0, 0);

-- Chamrosh (287)
INSERT INTO `mob_skill` VALUES (1445,287,1178,'Feather_Tickle', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1444,287,1177,'Snatch_Morsel', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1443,287,1176,'Pecking_Flurry', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,287,0,'Wisecrack', 1, 10.0, 2000, 1500, 4, 0, 0);

-- Cheese Hoarder Gigiroon (288)
-- INSERT INTO `mob_skill` VALUES (1472,288,0,'Faze', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,288,0,'Kibosh', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (1471,288,0,'Sandspray', 4, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,288,0,'Strap_Cutter', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (1474,288,0,'Deadeye', 1, 18.0, 2000, 1500, 4, 0, 0);

-- Brass Borer (289)
-- INSERT INTO `mob_skill` VALUES (0,289,0,'Cannonball', 0, 24.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,289,0,'Heat_Barrier', 0, 7.0, 2000, 1500, 1, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,289,0,'Amber_Scutum', 0, 7.0, 2000, 1500, 1, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,289,0,'Thermal_Pulse', 1, 12.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,289,0,'Vitriolic_Spray', 4, 18.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,289,0,'Vitriolic_Shower', 4, 18.0, 2000, 1500, 4, 0, 0); no info

-- Claret (290)
INSERT INTO `mob_skill` VALUES (176,290,176,'Fluid_Toss', 0, 18.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (175,290,175,'Fluid_Spread', 1, 10.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,290,0,'Digest', 0, 10.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,290,0,'Mucus_Spread', 1, 10.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,290,0,'Epoxy_Spread', 1, 10.0, 2000, 1500, 4, 0, 0);

-- Ob (291)
-- Velionis (292)
INSERT INTO `mob_skill` VALUES (222,292,222,'Hell_Slash', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (223,292,223,'Horror_Cloud', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (228,292,228,'Black_Cloud', 1, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (229,292,229,'Blood_Saber', 1, 15.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Malediction', 1, 15.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Marrow Drain', 0, 7.0, 2000, 1500, 4, 0, 0); -- Yes?  No?
-- INSERT INTO `mob_skill` VALUES (0,0,0,'Dereliction', 1, 20.0, 2000, 1500, 4, 0, 0); -- Yes?  No?

-- Lil'Apkallu (294)
-- INSERT INTO `mob_skill` VALUES (1460,294,1162,'Frigid_Shuffle', 1, 18.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1459,294,1161,'Beak_Lunge', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1457,294,1159,'Yawn', 1, 18.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1458,294,1160,'Wing_Slap', 0, 7.0, 2000, 1500, 4, 0, 0);

-- Iriz Ima (295)
INSERT INTO `mob_skill` VALUES (1447,295,1170,'Barrier_Tusk', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (1451,295,1174,'Voracious_Trunk', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1450,295,1173,'Flailing_Trunk', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1449,295,1172,'Stampede', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1448,295,1171,'Onrush', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (1452,295,1175,'Proboscis_Shower', 0, 7.0, 2000, 1500, 2, 0, 0);

-- Lividroot Amooshah (296)
INSERT INTO `mob_skill` VALUES (60,296,60,'Impale', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (61,296,61,'Vampiric_Lash', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (63,296,63,'Bad_Breath', 4, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (64,296,64,'Sweet_Breath', 4, 15.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,296,0,'Vampiric_Root', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,296,0,'Extremely_Bad_Breath', 4, 7.0, 2000, 1500, 4, 0, 0);

-- Iriri Samariri (297)
INSERT INTO `mob_skill` VALUES (1703,297,1361,'Water_Bomb', 1, 16.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1702,297,1360,'Magic_Hammer', 0, 16.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,297,0,'Frog_Cheer', 0, 7.0, 2000, 1500, 1, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,295,0,'Frog_Chorus', 1, 16.0, 2000, 1500, 4, 0, 0);

-- Anantaboga (298)
INSERT INTO `mob_skill` VALUES (388,298,388,'Wind_Breath', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (389,298,389,'Body_Slam', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (390,298,390,'Heavy_Stomp', 1, 10.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,298,0,'Chaos_Blade', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,298,0,'Petro_Eyes', 0, 7.0, 2000, 1500, 4, 0, 0);

-- Dextrose (299)
-- INSERT INTO `mob_skill` VALUES (0,299,0,'Amplification', 0, 7.0, 2000, 1500, 1, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,299,0,'Boiling_Point', 4, 16.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,299,0,'Synergism', 1, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,299,0,'Xenoglossia', 0, 7.0, 2000, 1500, 1, 0, 0);

-- Reacton (300)
INSERT INTO `mob_skill` VALUES (253,300,253,'Self-Destruct', 1, 20.0, 2000, 2000, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (254,300,254,'Berserk', 0, 7.0, 2000, 1500, 1, 0, 0);

-- Verdelet (301)
INSERT INTO `mob_skill` VALUES (1455,301,1180,'Frenetic_Rip', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1453,301,1181,'Abrasive_Tantara', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1454,301,1182,'Deafening_Tantara', 1, 10.0, 2000, 1500, 4, 0, 0);

-- Wulgaru (302)
-- INSERT INTO `mob_skill` VALUES (0,302,0,'Dire_Straight', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,302,0,'Detonating_Grip', 1, 16.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,302,0,'Sinker_Drill', 0, 7.0, 2000, 1500, 4, 0, 0);

-- Zareehkl the Jubilant (303)
INSERT INTO `mob_skill` VALUES (1522,303,1205,'Spinal_Cleave', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1523,303,1206,'Mangle', 4, 16.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1524,303,1207,'Leaping_Cleave', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,303,0,'Hex_Palm', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,303,0,'Animating_Wail', 0, 7.0, 2000, 1500, 1, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,303,0,'Fortifying_Wail', 0, 7.0, 2000, 1500, 1, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,303,0,'Unblest_Jambiya', 1, 15.0, 2000, 1500, 4, 0, 0);

-- Armed Gears (304)
-- INSERT INTO `mob_skill` VALUES (1791,304,1388,'Antigravity', 1, 15.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (1787,304,1390,'Artificial_Gravity', 1, 15.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (1789,304,1373,'Rail_Cannon', 1, 15.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (1785,304,1376,'Restoral', 0, 7.0, 2000, 1500, 2, 0, 0);
-- INSERT INTO `mob_skill` VALUES (1808,304,1372,'Heavy_Armature', 0, 7.0, 2000, 1500, 1, 0, 0);

-- Gotoh Zha the Redolent (305)
INSERT INTO `mob_skill` VALUES (1475,305,1265,'Forceful_Blow', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1476,305,1266,'Somersault_Kick', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1477,305,1267,'Firespit', 0, 30.0, 2000, 1500, 4, 0, 0); -- 1000 dmg
INSERT INTO `mob_skill` VALUES (1478,305,1268,'Warm-Up', 0, 7.0, 2000, 1500, 1, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,305,0,'Rushing Drub', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,305,0,'Groundburst', 1, 16.0, 2000, 1500, 4, 0, 0);

-- Dea (306)
-- Achamoth (307)
-- Khromasoul Bhurborlor (308)
INSERT INTO `mob_skill` VALUES (1487,308,1232,'Rock_Smash', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1488,308,1233,'Diamondhide', 1, 16.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (1489,308,1234,'Enervation', 1, 18.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1490,308,1235,'Quake_Stomp', 0, 7.0, 2000, 1500, 1, 0, 0);

-- Nosferatu (309)
INSERT INTO `mob_skill` VALUES (1850,309,1450,'Bloodrake',0,6.0,2000,1000,4,0, 0);
-- INSERT INTO `mob_skill` VALUES (1851,309,1451,'Decollation',0,6.0,2000,1000,4,0, 0);
-- INSERT INTO `mob_skill` VALUES (1852,309,1452,'Nosferatus_Kiss',0,6.0,2000,1000,4,0, 0);
-- INSERT INTO `mob_skill` VALUES (1853,309,1453,'Heliovoid',0,6.0,2000,1000,4,0, 0);
INSERT INTO `mob_skill` VALUES (1854,309,1454, 'Wings_of_Gehenna',0,6.0,2000,1000,4,0, 0);
-- INSERT INTO `mob_skill` VALUES (1855,309,1455,'Eternal_Damnation',0,6.0,2000,1000,4,0, 0);
-- INSERT INTO `mob_skill` VALUES (1856,309,0,'Nocturnal_Servitude',0,6.0,2000,1000,4,0, 0);

-- Experimental Lamia (310)
INSERT INTO `mob_skill` VALUES (1510,310,1253,'Hysteric_Barrage', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1515,310,1258,'Tail_Slap', 4, 16.0, 2000, 1500, 4, 0, 0);

-- Mahjlaef the Paintorn (311)
-- INSERT INTO `mob_skill` VALUES (0,311,0,'Mind_Blast', 4, 16.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,311,0,'Mind_Purge', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,311,0,'Immortal_Shield', 0, 7.0, 2000, 1500, 1, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,311,0,'Immortal_Mind', 0, 7.0, 2000, 1500, 1, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,311,0,'Immortal_Anathema', 1, 18.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,311,0,'Tribulation', 1, 18.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,311,0,'Reprobation', 1, 18.0, 2000, 1500, 4, 0, 0); -- Only by NM

-- Nuhn (312)
-- INSERT INTO `mob_skill` VALUES (0,312,0,'Hypnic_Lamp', 1, 16.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,312,0,'Vile_Belch', 1, 16.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,312,0,'Seaspray', 4, 16.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,312,0,'Seismic_Tail', 1, 18.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,312,0,'Gnash', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,312,0,'Leeching_Current', 1, 18.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,312,0,'Deathgnash', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (0,312,0,'Abominable_Belch', 1, 18.0, 2000, 1500, 4, 0, 0);

-- Tinnin (313)
INSERT INTO `mob_skill` VALUES (1572,313,1308,'Pyric_Blast', 4, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1573,313,1319,'Polar_Bulwark', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (1574,313,1309,'Polar_Blast', 4, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1575,313,1318,'Pyric_Bulwark', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (1576,313,1313,'Barofield', 4, 15.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1578,313,1310,'Trembling', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1579,313,1311,'Serpentine_Tail', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1580,313,1312,'Nerve_Gas', 1, 10.0, 2000, 1500, 4, 0, 0);

-- Sarameya (314)
INSERT INTO `mob_skill` VALUES (1529,314,1223,'Lava_Spit', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1530,314,1224,'Sulfurous_Breath', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1531,314,1225,'Scorching_Lash', 1, 20.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1532,314,1226,'Ululation', 1, 20.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1533,314,1227,'Magma_Hoplon', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (1534,314,1228,'Gates_of_Hades', 1, 20.0, 2000, 1500, 4, 0, 0);

-- Tyger (315)
INSERT INTO `mob_skill` VALUES (1769,315,1369,'Dreadstorm', 1, 18.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1770,315,1381,'Fossilizing_Breath', 4, 16.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1772,315,1386,'Fulmination', 1, 32.0, 2000, 1500, 4, 0, 0); -- only at < 50% strong paralyze
INSERT INTO `mob_skill` VALUES (1771,315,1382,'Plague_Swipe', 4, 16.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1766,315,1367,'Tenebrous_Mist', 1, 18.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1767,315,1368,'Thunderstrike', 1, 18.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (1768,315,1371,'Tourbillion', 1, 18.0, 2000, 1500, 4, 0, 0);

-- Pandemonium Warden  (316)
-- INSERT INTO `mob_skill` VALUES (2415,316,3932,'Supernova',1,25.0,5000,3500,4,0, 0);
-- INSERT INTO `mob_skill` VALUES (2413,316,3931,'Darkmatter',1,20.0,4000,1500,4,0, 0);
-- INSERT INTO `mob_skill` VALUES (2408,316,3928,'Cosmic_Breath',4,15.0,4000,1500,4,0, 0);
-- INSERT INTO `mob_skill` VALUES (2411,316,3918,'Mighty_Guard',0,6.0,3000,2000,1,0, 0);
-- INSERT INTO `mob_skill` VALUES (2410,316,3930,'Gyre_Charge',1,10.0,4000,2000,4,0, 0);
-- INSERT INTO `mob_skill` VALUES (2409,316,3929,'Cataclysmic_Vortex',1,15.0,4000,5000,4,0, 0);

-- Absoulute Virtue   (329)
INSERT INTO `mob_skill` VALUES (1128,329,1019,'Disseverment', 0, 7.0, 2000, 1500, 4, 0, 0); -- Should not have it.  Leaving in for variety, for now.
INSERT INTO `mob_skill` VALUES (1127,329,1018,'Glacier_Splitter', 0, 7.0, 2000, 1500, 4, 0, 0);
-- INSERT INTO `mob_skill` VALUES (1126,329,1014,'Crystaline_Cocoon',0,6.0,2000,1500,1,0, 0);
-- INSERT INTO `mob_skill` VALUES (1125,329,1013,'Depuration',0,6.0,2000,1500,1,0, 0);
-- INSERT INTO `mob_skill` VALUES (1130,329,1021,'Medusa_Javelin',0,6.0,2000,1500,1,0, 0);
-- INSERT INTO `mob_skill` VALUES (1124,329,1016,'Impact_Stream',1,10.0,2000,1500,12,0, 0);
-- INSERT INTO `mob_skill` VALUES (1123,329,1011,'Auroral_Wind',1,10.0,2000,1500,12,0, 0);
-- INSERT INTO `mob_skill` VALUES (1122,329,1020,'Wing_Thrust',1,10.0,2000,1500,12,0, 0);
-- INSERT INTO `mob_skill` VALUES (1121,329,0,'Fluorescence',0,6.0,2000,1500,4,0, 0);

-- Avatar Ixon
-- INSERT INTO `mob_skill` VALUES (2078,39,1612,'Wrath_of_Zeus',1,10.0,2000,1500,12,0, 0);

-- -------------------------------------------------------------------------------
-- NOTE: all skills below are special skill lists given to NMs / special families
-- -------------------------------------------------------------------------------

-- Demonic_Tiphia
INSERT INTO `mob_skill` VALUES (80,700,80,'Final_Sting', 0, 7.0, 2000, 1500, 4, 0, 35);
INSERT INTO `mob_skill` VALUES (79,700,79,'Pollen', 0, 7.0, 2000, 1500, 1, 0, 40);
INSERT INTO `mob_skill` VALUES (78,700,78,'Sharp_Sting', 0, 10.0, 2000, 1500, 4, 0, 0);

-- rabbit With Cure
INSERT INTO `mob_skill` VALUES (1,701,1,'Foot_Kick', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (2,701,2,'Dust_Cloud', 4, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (3,701,3,'Whirl_Claws', 1, 5.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES(67, 701, 37, 'Wild_Carrot', 0, 20.0, 2000, 1500, 1, 0, 0);

-- rabbit Snowy Area
INSERT INTO `mob_skill` VALUES (3,702, 3,'Whirl_Claws', 1, 5.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES(67, 702, 37, 'Wild_Carrot', 0, 20.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES(405, 702, 970, 'Snow_Cloud', 4, 10.0, 2000, 1500, 4, 0, 0);

-- Cactrot_Rapido
INSERT INTO `mob_skill` VALUES (68,703,68,'Photosynthesis', 0, 7.0, 2000, 1500, 1, 0, 0);
INSERT INTO `mob_skill` VALUES (66,703,66,'1000_Needles', 1, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (65,703,65,'Needleshot', 0, 7.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (864,703,66,'10000_Needles', 1, 10.0, 2000, 1500, 4, 0, 0);

-- mob wyvern
INSERT INTO `mob_skill` VALUES (644,704,627,'Wyvern_Flame_Breath', 0, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (645,704,628,'Wyvern_Frost_Breath', 0, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (646,704,629,'Wyvern_Gust_Breath', 0, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (647,704,630,'Wyvern_Sand_Breath', 0, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (648,704,631,'Wyvern_Lightning_Breath', 0, 10.0, 2000, 1500, 4, 0, 0);
INSERT INTO `mob_skill` VALUES (649,704,632,'Wyvern_Hydro_Breath', 0, 10.0, 2000, 1500, 4, 0, 0);
