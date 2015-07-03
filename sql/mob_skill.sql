-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Ven 03 Février 2012    22:54
-- Version du serveur: 6.0.0
-- Version de PHP: 5.2.9-2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `dspdb`
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
  `knockback` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mob_skill_id`,`family_id`,`mob_skill_flag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `mob_skill`
--

-- ------------------------------------------
-- Normal Monster
-- ------------------------------------------

-- General Abilities
INSERT INTO `mob_skill` VALUES (16,0,16,'Ranged_Attack',0,25.0,2000,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (402,0,402,'Catapult',0,25.0,2000,0,4,0,0,0); -- Gigas RNG's ranged attack.
-- INSERT INTO `mob_skill` VALUES (402,0,402,'Ranged_Aqua_Ball',1,10.0,2000,0,4,0,0,0); -- used in Shooting Fish
-- INSERT INTO `mob_skill` VALUES (1491,0,1236,'Zarraqa',0,25.0,2000,0,4,0,0,0); -- used by troll rangers only.
INSERT INTO `mob_skill` VALUES (808,0,351,'Jump',0,9.5,2000,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (514,0,442,'Jumping_Thrust',0,9.5,2000,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (761,0,505,'Call_Beast',0,7.0,2000,0,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1645,0,505,'Activate',0,7.0,2000,0,1,0,0,0);

-- Burrowed Antlions
INSERT INTO `mob_skill` VALUES (22,357,812,'Pit_Ambush',0,9.0,2000,0,4,0,0,0);

-- Two Hours
-- make a mob 2 hour by setting mobmod_main_2hour
INSERT INTO `mob_skill` VALUES (432,0,432,'Mighty_Strikes',0,7.0,2000,0,1,2,0,0);
INSERT INTO `mob_skill` VALUES (434,0,434,'Hundred_Fists',0,7.0,2000,0,1,2,0,0);
INSERT INTO `mob_skill` VALUES (433,0,433,'Benediction',1,20.0,2000,0,1,2,0,0);
INSERT INTO `mob_skill` VALUES (435,0,435,'Manafont',0,7.0,2000,0,1,2,0,0);
INSERT INTO `mob_skill` VALUES (436,0,436,'Chainspell',0,7.0,2000,0,1,2,0,0);
INSERT INTO `mob_skill` VALUES (437,0,437,'Perfect_Dodge',0,7.0,2000,0,1,2,0,0);
INSERT INTO `mob_skill` VALUES (438,0,438,'Invincible',0,7.0,2000,0,1,2,0,0);
INSERT INTO `mob_skill` VALUES (439,0,439,'Blood_Weapon',0,7.0,2000,0,1,2,0,0);
INSERT INTO `mob_skill` VALUES (484,0,432,'Familiar',0,7.0,2000,0,1,2,0,0);
INSERT INTO `mob_skill` VALUES (440,0,432,'Soul_Voice',0,7.0,2000,0,1,2,0,0);
INSERT INTO `mob_skill` VALUES (479,0,20,'Eagle_Eye_Shot',0,25.0,2000,0,4,2,0,0);
INSERT INTO `mob_skill` VALUES (474,0,432,'Meikyo_Shisui',0,7.0,2000,0,1,2,0,0);
INSERT INTO `mob_skill` VALUES (475,0,18,'Mijin_Gakure',1,20.0,2000,0,4,2,0,0);
INSERT INTO `mob_skill` VALUES (476,0,432,'Call_Wyvern',0,7.0,2000,0,1,2,0,0);
-- INSERT INTO `mob_skill` VALUES (478,0,432,'Astral_Flow',0,7.0,2000,0,1,2,0,0); -- Most NM use this version and animation.
-- INSERT INTO `mob_skill` VALUES (2000,0,724,'Astral_Flow',0,7.0,2000,0,1,2,0,0); -- Only looks alright with small or human-like Mob Models
-- INSERT INTO `mob_skill` VALUES (1933,0,432,'Azure Lore',0,7.0,2000,0,1,2,0,0); -- Mammol Ja
-- INSERT INTO `mob_skill` VALUES (2001,0,???,'Azure Lore',0,7.0,2000,0,1,2,0,0); -- Raubahn
-- INSERT INTO `mob_skill` VALUES (1934,0,432,'Wild Card',0,7.0,2000,0,1,2,0,0); -- Lamia/Merrow
-- INSERT INTO `mob_skill` VALUES (2002,0,???,'Wild Card',0,7.0,2000,0,1,2,0,0); -- Qultada
-- INSERT INTO `mob_skill` VALUES (1935,0,432,'Overdrive',0,7.0,2000,0,1,2,0,0); -- Troll
-- INSERT INTO `mob_skill` VALUES (2003,0,???,'Overdrive',0,7.0,2000,0,1,2,0,0); -- Zonpa-Zippa (S)
-- INSERT INTO `mob_skill` VALUES (2454,0,432,'Trance',0,7.0,2000,0,1,2,0,0); -- Urd
-- INSERT INTO `mob_skill` VALUES (2004,0,???,'Trance',0,7.0,2000,0,1,2,0,0); -- Laila, Lilisette
-- INSERT INTO `mob_skill` VALUES (2005,0,???,'Tabula_Rasa',0,7.0,2000,0,1,2,0,0); -- Gunther, Adelheid
-- INSERT INTO `mob_skill` VALUES (2102,0,432,'Tabula_Rasa',0,7.0,2000,0,1,2,0,0); -- ???
-- INSERT INTO `mob_skill` VALUES (???,0,???,'Bolster',0,7.0,2000,0,1,2,0,0); -- Likely does not yet exist in dats for mob use in retail.
-- INSERT INTO `mob_skill` VALUES (3009,0,432,'Elemental_Sforzo',0,7.0,2000,0,1,2,0,0); -- Nothing yet uses this to my knowledge.

-- Rabbits
INSERT INTO `mob_skill` VALUES (1,206,1,'Foot_Kick',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2,206,2,'Dust_Cloud',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3,206,3,'Whirl_Claws',1,5.0,2000,1500,4,0,0,0);

-- Rabbits With Cure
INSERT INTO `mob_skill` VALUES (1,404,1,'Foot_Kick',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2,404,2,'Dust_Cloud',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3,404,3,'Whirl_Claws',1,5.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (67,404,37,'Wild_Carrot',0,20.0,2000,1500,1,0,0,0);

-- Rabbits (Snowy)
INSERT INTO `mob_skill` VALUES (1,405,1,'Foot_Kick',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3,405,3,'Whirl_Claws',1,5.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (67,405,37,'Wild_Carrot',0,20.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (405,405,970,'Snow_Cloud',4,10.0,2000,1500,4,0,0,0);

-- Rabbits (nm or abyssea area?)
-- INSERT INTO `mob_skill` VALUES (1311,?,?,'Foot_Kick',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1312,?,?,'Dust_Cloud',4,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1313,?,?,'Whirl_Claws',1,5.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1314,?,?,'Wild_Carrot',0,20.0,2000,1500,1,0,0,0);

-- Sheep
INSERT INTO `mob_skill` VALUES (4,226,4,'Lamb_Chop',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (5,226,5,'Rage',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (6,226,6,'Sheep_Charge',0,7.0,2000,1500,4,0,0,1);
INSERT INTO `mob_skill` VALUES (8,226,8,'Sheep_Song',1,15.0,2000,1500,4,0,0,0);

-- Sheep (Karakul sub-family)
INSERT INTO `mob_skill` VALUES (4,167,4,'Lamb_Chop',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (5,167,5,'Rage',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (6,167,6,'Sheep_Charge',0,7.0,2000,1500,4,0,0,1);
INSERT INTO `mob_skill` VALUES (8,167,8,'Sheep_Song',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1581,167,1275,'Feeble_Bleat',1,18.0,2000,1500,4,0,0,0); -- ToAU and Abyssea only

-- Slumbering Samwell
INSERT INTO `mob_skill` VALUES (8,398,8,'Sheep_Song',1,15.0,2000,1500,4,0,0,0);

-- Ram
INSERT INTO `mob_skill` VALUES (9,208,9,'Rage',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (10,208,10,'Ram_Charge',0,7.0,2000,1500,4,0,0,2);
INSERT INTO `mob_skill` VALUES (11,208,11,'Rumble',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (12,208,12,'Great_Bleat',1,12.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (13,208,13,'Petribreath',4,15.0,2000,1500,4,0,0,0);

-- Tiger
INSERT INTO `mob_skill` VALUES (14,242,14,'Roar',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (15,242,15,'Razor_Fang',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (17,242,17,'Claw_Cyclone',4,10.0,2000,1500,4,0,0,0);


-- INSERT INTO `mob_skill` VALUES (1951,242,0,'Disorienting_Waul',1,18.0,2000,1500,4,0,0,0); -- used by certain NM

-- Tigers (Dynamis - Nightmare tiger)
-- INSERT INTO `mob_skill` VALUES (1421,?,?,'Roar',1,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1422,?,?,'Razor_Fang',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1423,?,?,'Claw_Cyclone',4,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1425,?,0,'Crossthrash',0,7.0,2000,1500,4,0,0,0); -- NM/Dyna/einherjar
-- INSERT INTO `mob_skill` VALUES (1424,?,0,'Predatory_Glare',4,16.0,2000,1500,4,0,0,0); -- NM/Dyna/einherjar

-- Dhalmel
INSERT INTO `mob_skill` VALUES (24,80,24,'Sonic_Wave',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (25,80,25,'Stomping',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (28,80,28,'Cold_Stare',4,15.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (29,80,29,'Whistle',1,20.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (30,80,30,'Berserk',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (31,80,31,'Healing_Breeze',1,15.0,2000,1500,1,0,0,0);

-- Opo-opo
INSERT INTO `mob_skill` VALUES (38,188,38,'Eye_Scratch',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (32,188,32,'Vicious_Claw',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (34,188,34,'Spinning_Claw',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (39,188,39,'Magic_Fruit',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (35,188,35,'Claw_Storm',0,7.0,2000,1500,4,0,0,0); -- 7hp/tick
INSERT INTO `mob_skill` VALUES (33,188,33,'Stone_Throw',0,25.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (36,188,36,'Blank_Gaze_Dispel',0,16.0,2000,2000,4,0,0,0);

-- Mandragora
INSERT INTO `mob_skill` VALUES (45,178,45,'Dream_Flower',1,15.0,2000,1500,4,0,0,0); -- Not used by Lycopodia
INSERT INTO `mob_skill` VALUES (46,178,46,'Wild_Oats',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (48,178,48,'Photosynthesis',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (49,178,49,'Leaf_Dagger',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (44,178,44,'Head_Butt',0,7.0,1500,1500,4,0,0,0); -- occasional knockback..
INSERT INTO `mob_skill` VALUES (50,178,50,'Scream',1,15.0,2000,1500,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (1954,?,?,'Petal_Pirouette',1,15.0,2000,1500,4,0,0,0); -- Only used by certain NM
-- INSERT INTO `mob_skill` VALUES (2154,?,?,'Demonic_Flower',0,7.0,2000,1500,4,0,0,0); -- Only used by certain NM
-- INSERT INTO `mob_skill` VALUES (2345,?,?,'Petalback_Spin',1,15.0,2000,1500,4,0,0,0); -- Only used by certain NM
-- INSERT INTO `mob_skill` VALUES (2343,?,?,'Tepal_Twist',1,15.0,2000,1500,4,0,0,0); -- Only used by certain NM
-- INSERT INTO `mob_skill` VALUES (2344,?,?,'Bloom_Fouette',1,15.0,2000,1500,4,0,0,0); -- Only used by certain NM
-- INSERT INTO `mob_skill` VALUES (2131,?,?,'Fatal_Scream',1,15.0,2000,1500,4,0,0,0); -- Adenium only

-- Morbol
INSERT INTO `mob_skill` VALUES (60,186,60,'Impale',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (61,186,61,'Vampiric_Lash',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (62,186,62,'Vampiric_Root',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (63,186,63,'Bad_Breath',4,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (64,186,64,'Sweet_Breath',4,15.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (470,186,1213,'Drain_Whip',0,7.0,2000,1500,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (?,?,?,'Extremely_Bad_Breath',4,7.0,2000,1500,4,0,0,0); -- used only by Evil Oscar,Cirrate Christelle,Lividroot Amooshah,Eccentric Eve and Melancholic Moira.

-- Cirrate Christelle
-- INSERT INTO `mob_skill` VALUES (1351,?,63,'Fragrant Breath',4,30.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1349,?,63,'Miasmic_Breath',4,30.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1353,?,63,'Putrid_Breath',4,30.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1355,?,?,'Vampiric_Lash',4,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1354,?,?,'Extremely_Bad_Breath',4,7.0,2000,1500,4,0,0,0);

-- Sabotenders
INSERT INTO `mob_skill` VALUES (65,212,65,'Needleshot',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (66,212,66,'1000_Needles',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (68,212,68,'Photosynthesis',0,7.0,2000,1500,1,0,0,0); -- daytime only

-- Sabotenders (Dynamis)
-- INSERT INTO `mob_skill` VALUES (1369,?,?,'2000_Needles',1,10.0,2000,1500,4,0,0,0); -- Only used by Nightmare Sabotender
-- INSERT INTO `mob_skill` VALUES (1370,?,?,'4000_Needles',1,10.0,2000,1500,4,0,0,0); -- Only used by Nightmare Sabotender
-- INSERT INTO `mob_skill` VALUES (1371,?,?,'Needleshot',1,10.0,2000,1500,4,0,0,0);

-- Funguar
INSERT INTO `mob_skill` VALUES (52,116,52,'Frogkick',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (53,116,53,'Spore',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (58,116,58,'Silence_Gas',4,13.5,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (59,116,59,'Dark_Spore',4,13.5,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (54,116,54,'Queasyshroom',0,7,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (55,116,55,'Numbshroom',0,7,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (56,116,56,'Shakeshroom',0,7,2000,1500,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (1952,?,?,'Microspores',1,15.0,2000,1500,4,0,0,0); -- Only used by certain Notorious Monsters
-- INSERT INTO `mob_skill` VALUES (2351,?,?,'Agaricus',0,25.0,2000,1500,4,0,0,0); -- Only used by certain Notorious Monsters

-- Fairy Ring (Dynamis - Valkurm)
-- Note: M. Spore is his normal attack round move. However no WS use message is displayed.
-- INSERT INTO `mob_skill` VALUES (1364,?,59,'Mephitic_Spore',0,25.0,2000,1500,4,0,0,0);

-- Treant
INSERT INTO `mob_skill` VALUES (72,245,72,'Drill_Branch',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (73,245,73,'Pinecone_Bomb',0,23.5,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (75,245,75,'Leafstorm',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (76,245,76,'Entangle',0,7.0,2000,1500,4,0,0,0);

-- Bees
INSERT INTO `mob_skill` VALUES (80,48,80,'Final_Sting',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (79,48,79,'Pollen',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (78,48,78,'Sharp_Sting',0,10.0,2000,1500,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (1591,?,?,'Frenzy_Pollen',0,7.0,2000,1500,1,0,0,0); -- Only used by Nightmare Hornets and Chasmic Hornet.

-- Bees (Nightmare Bee Dynamis)
-- INSERT INTO `mob_skill` VALUES (1590,?,?,'Sharp_Sting',0,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1591,?,?,'Frenzy_Pollen',0,7.0,2000,1500,1,0,0,0); -- Only used by Nightmare Hornets and Chasmic Hornet.
-- INSERT INTO `mob_skill` VALUES (1592,?,?,'Final_Sting',0,7.0,2000,1500,4,0,0,0);

-- Beetle
INSERT INTO `mob_skill` VALUES (82,49,82,'Power_Attack_Beetle',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (83,49,83,'Hi-Freq_Field',4,16.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (84,49,84,'Rhino_Attack',0,7.0,2000,1500,4,0,0,1);
INSERT INTO `mob_skill` VALUES (87,49,87,'Spoil',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (85,49,85,'Rhino_Guard',0,7.0,2000,1500,1,0,0,0);

-- Crawler
-- TODO: Find out which crawlers have ID entries 1325-27
INSERT INTO `mob_skill` VALUES (90,79,90,'Cocoon',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (89,79,89,'Poison_Breath',4,12.0,2000,1500,4,0,0,0); --  Not used by Eruca
INSERT INTO `mob_skill` VALUES (88,79,88,'Sticky_Thread',4,12.0,2000,1500,4,0,0,0);

-- Crawlers (Eruca)
INSERT INTO `mob_skill` VALUES (90,107,90,'Cocoon',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (88,107,88,'Sticky_Thread',4,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (386,107,386,'Incinerate',4,10.0,2000,1500,4,0,0,0);

INSERT INTO `mob_skill` VALUES (90,108,90,'Cocoon',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (88,108,88,'Sticky_Thread',4,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (?,108,?,'Incinerate',4,10.0,2000,1500,4,0,0,0);

-- Scorpion
INSERT INTO `mob_skill` VALUES (94,217,94,'Mandible_Bite',0,7.0,2000,1500,4,0,0,2);
INSERT INTO `mob_skill` VALUES (97,217,97,'Death_Scissors',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (98,217,98,'Wild_Rage',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (99,217,99,'Earth_Pounder',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (95,217,95,'Poison_Sting',0,7.0,2000,1500,4,0,0,0); -- 1hp/tick
INSERT INTO `mob_skill` VALUES (93,217,93,'Cold_Breath',4,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (92,217,92,'Numbing_Breath',4,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (100,217,100,'Sharp_Strike',0,7.0,2000,1500,1,0,0,0);

-- INSERT INTO `mob_skill` VALUES (1965,?,?,'Hell_Scissors',0,7.0,2000,3500,4,0,0,0); -- Used only by Khadem Quemquoma,Vaa Oozu's Scolopendrid,Centipedal Centruroides,Hedetet,and Hedjedjet.

-- Serket
INSERT INTO `mob_skill` VALUES (463,273,94,'Critical_Bite',0,7.0,2000,1500,4,0,0,0); -- hnm only
INSERT INTO `mob_skill` VALUES (465,273,97,'Stasis',0,9.0,2000,1500,4,0,0,0); -- hnm only
INSERT INTO `mob_skill` VALUES (466,273,98,'Venom_Storm',1,40.0,2000,1500,4,0,0,0); -- hnm only
INSERT INTO `mob_skill` VALUES (467,273,99,'Earthbreaker',1,40.0,2000,1500,4,0,0,0); -- HNM only
INSERT INTO `mob_skill` VALUES (464,273,95,'Venom_Sting',0,10.0,2000,1500,4,0,0,0); -- hnm only
INSERT INTO `mob_skill` VALUES (461,273,92,'Venom_Breath',4,20.0,2000,1500,4,0,0,0); -- hnm only
INSERT INTO `mob_skill` VALUES (468,273,100,'Evasion',0,9.0,2000,1500,1,0,0,0); -- hnm only

-- Aqrabuamelu
INSERT INTO `mob_skill` VALUES (93,402,93,'Cold_Breath',4,15.0,2000,1500,4,0,0,0);

-- DynamisStatue-Orc
INSERT INTO `mob_skill` VALUES (854,93,761,'Seismostomp',1,15.0,3000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (855,93,762,'Numbing_Glare',4,15.0,2000,1500,4,0,0,0);

-- DynamisStatue-Yagudo
INSERT INTO `mob_skill` VALUES (854,95,763,'Seismostomp',1,15.0,3000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (857,95,764,'Tormentful_Glare',4,15.0,2000,1500,4,0,0,0);

-- DynamisStatue-Goblin
INSERT INTO `mob_skill` VALUES (854,92,765,'Seismostomp',1,15.0,3000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (859,92,766,'Torpid_Glare',4,15.0,2000,1500,4,0,0,0);

-- DynamisStatue-Quadav
INSERT INTO `mob_skill` VALUES (854,94,767,'Seismostomp',1,15.0,3000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (861,94,768,'Lead_Breath',4,15.0,2000,1500,4,0,0,0);

-- Dynamis Lord
INSERT INTO `mob_skill` VALUES (871,361,316,'Dynamic_Implosion',1,18.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (872,361,817,'Transfusion',1,18.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (873,361,318,'Mana_Storm',1,18.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (874,361,320,'Dynamic_Assault',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (875,361,324,'Violent_Rupture',1,18.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (877,361,322,'Oblivion_Smash',1,18.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (878,361,321,'Tera_Slash',4,15.0,2000,1500,4,0,0,0);

-- Animated Weapons
INSERT INTO `mob_skill` VALUES (932,15,793,'Final_Heaven',0,7.0,2000,1500,4,0,0,0);         -- Animated_Knuckles
INSERT INTO `mob_skill` VALUES (933,11,797,'Mercy_Stroke',0,7.0,2000,1500,4,0,0,0);         -- Animated_Dagger
INSERT INTO `mob_skill` VALUES (934,24,792,'Knights_of_Round',0,7.0,2000,1500,4,0,0,0);     -- Animated_Longsword
INSERT INTO `mob_skill` VALUES (935,14,799,'Scourge',0,7.0,2000,1500,4,0,0,0);              -- Animated_Claymore
INSERT INTO `mob_skill` VALUES (936,8,795,'Onslaught',0,7.0,2000,1500,4,0,0,0);             -- Animated_Tabar
INSERT INTO `mob_skill` VALUES (937,12,798,'Metatron_Torment',0,7.0,2000,1500,4,0,0,0);     -- Animated_Great_Axe
INSERT INTO `mob_skill` VALUES (938,20,796,'Catastrophe',0,7.0,2000,1500,4,0,0,0);          -- Animated_Scythe
INSERT INTO `mob_skill` VALUES (939,19,800,'Geirskogul',0,7.0,2000,1500,4,0,0,0);           -- Animated_Spear
INSERT INTO `mob_skill` VALUES (940,17,802,'Blade_Metsu',0,7.0,2000,1500,4,0,0,0);          -- Animated_Kunai
INSERT INTO `mob_skill` VALUES (941,13,803,'Tachi_Kaiten',0,7.0,2000,1500,4,0,0,0);         -- Animated_Tachi
INSERT INTO `mob_skill` VALUES (942,9,794,'Randgrith',0,7.0,2000,1500,4,0,0,0);             -- Animated_Hammer
INSERT INTO `mob_skill` VALUES (943,23,801,'Gate_of_Tartarus',0,7.0,2000,1500,4,0,0,0);     -- Animated_Staff
INSERT INTO `mob_skill` VALUES (944,7,804,'Namas_Arrow',0,18.0,2000,1500,4,0,0,0);          -- Animated_Longbow
INSERT INTO `mob_skill` VALUES (945,18,805,'Coronach',0,18.0,2000,1500,4,0,0,0);            -- Animated_Gun
INSERT INTO `mob_skill` VALUES (1175,22,803,'Shield_Bash',0,7.0,2000,1500,4,0,0,0);         -- Animated_Shield

-- Buffalo
INSERT INTO `mob_skill` VALUES (237,57,846,'Rampant_Gnaw',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (238,57,847,'Big_Horn',0,7.0,2000,1500,4,0,0,1);
INSERT INTO `mob_skill` VALUES (239,57,848,'Snort',4,12.5,2000,1500,4,0,0,3);
INSERT INTO `mob_skill` VALUES (240,57,849,'Rabid_Dance',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (241,57,850,'Lowing',1,15.0,2000,2500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1108,?,?,'Mighty_Snort',4,?,2000,1500,4,0,0,0); -- Certain NM's only
-- INSERT INTO `mob_skill` VALUES (?,?,?,'Cattlepult',0,?,2000,1500,4,0,0,0); -- Special Event Only.
-- INSERT INTO `mob_skill` VALUES (1219,?,?,'Bull_Rush',0,7.0,2000,1500,4,0,0,0); -- Special Event Only.

-- Diremite
INSERT INTO `mob_skill` VALUES (106,81,830,'Double_Claw',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (107,81,831,'Grapple',4,12.5,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (108,81,832,'Filamented_Hold',4,12.5,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (109,81,833,'Spinning_Top',1,15.0,2000,1500,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (2443,?,?,'Tarsal_Slam',4,10.0,2000,1500,4,0,0,0); -- Only used by certain notorious monsters

-- Memory Receptacle
INSERT INTO `mob_skill` VALUES (286,181,899,'Empty_Seed',1,20.0,2000,2000,4,0,0,7);

-- Weeper
INSERT INTO `mob_skill` VALUES (961,256,834,'Empty_Cutter',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (962,256,835,'Vacuous_Osculation',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (963,256,836,'Hexagon_Belt',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (964,256,837,'Auroral_Drape',1,13.7,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (965,256,838,'Memory_Of_Fire',1,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (966,256,839,'Memory_Of_Ice',1,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (967,256,840,'Memory_Of_Wind',1,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (968,256,841,'Memory_Of_Light',1,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (969,256,842,'Memory_Of_Earth',1,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (970,256,843,'Memory_Of_Lightning',1,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (971,256,844,'Memory_Of_Water',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (972,256,845,'Memory_Of_Dark',1,10.0,2000,1500,4,0,0,0);

-- Wanderer
INSERT INTO `mob_skill` VALUES (132,255,857,'Vanity_Dive',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (133,255,858,'Empty_Beleaguer',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (134,255,859,'Mirage',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (135,255,860,'Aura_Of_Persistence',0,7.0,2000,1500,1,0,0,0);

-- Gorger
INSERT INTO `mob_skill` VALUES (485,137,905,'Quadratic_Continuum',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (488,137,906,'Spirit_Absorption',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (491,137,907,'Vanity_Drive',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (494,137,908,'Stygian_Flatus',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (496,137,909,'Promyvion_Barrier',0,7.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (499,137,910,'Fission',0,7.0,2000,1500,4,0,0,0); -- NM only

INSERT INTO `mob_skill` VALUES (485,138,905,'Quadratic_Continuum',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (488,138,906,'Spirit_Absorption',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (491,138,907,'Vanity_Drive',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (494,138,908,'Stygian_Flatus',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (496,138,909,'Promyvion_Barrier',0,7.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (499,138,910,'Fission',0,7.0,2000,1500,4,0,0,0); -- NM only

-- Craver
INSERT INTO `mob_skill` VALUES (973,78,919,'Brain_Spike',0,9.0,2000,1500,4,0,0,0); -- Regular only
INSERT INTO `mob_skill` VALUES (974,78,920,'Empty_Thrash',4,12.0,2000,1500,4,0,0,1); -- Regular only
INSERT INTO `mob_skill` VALUES (975,78,921,'Promyvion_Brume',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (976,78,922,'Murk',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (977,78,923,'Material_Fend',0,10.0,2000,1500,1,0,0,0);

-- Craver NM
INSERT INTO `mob_skill` VALUES (978,78,924,'Carousel',1,10.0,2000,1500,4,0,0,0); -- NM only   (doesn't apply to Coveter,he uses normal Craver moves)
INSERT INTO `mob_skill` VALUES (1018,78,919,'Impalement',0,10.0,2000,1500,4,0,0,0); -- NM only (doesn't apply to Coveter,he uses normal Craver moves)

-- Thinker
INSERT INTO `mob_skill` VALUES (986,241,933,'Empty_Cutter',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (987,241,934,'Negative_Whirl',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (988,241,935,'Stygian_Vapor',1,8.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (989,241,936,'Winds_Of_Promyvion',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (990,241,937,'Spirit_Absorption',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (991,241,938,'Binary_Absorption',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (992,241,939,'Trinary_Absorption',0,7.0,2000,1500,4,0,0,0); -- NM only
INSERT INTO `mob_skill` VALUES (993,241,940,'Spirit_Tap',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (994,241,941,'Binary_Tap',0,7.0,2000,1500,4,0,0,0);

-- NM Thinker
INSERT INTO `mob_skill` VALUES (995,241,942,'Trinary_Tap',0,7.0,2000,1500,4,0,0,0); -- NM only
INSERT INTO `mob_skill` VALUES (996,241,943,'Shadow_Spread',1,10.0,2000,1500,4,0,0,0); -- NM only

-- Seether
INSERT INTO `mob_skill` VALUES (997,220,872,'Vanity_Strike',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (998,220,872,'Wanion',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (999,220,873,'Occultation',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1000,220,874,'Empty_Crush',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1002,220,876,'Lamentation',1,10.0,2000,1500,4,0,0,0);

-- Lizard
INSERT INTO `mob_skill` VALUES (110,174,110,'Tail_Blow',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (111,174,111,'Fireball',1,11.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (112,174,112,'Blockhead',0,7.0,2000,1500,4,0,0,1);
INSERT INTO `mob_skill` VALUES (113,174,113,'Brain_Crush',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (116,174,116,'Infrasonics',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (117,174,117,'Secretion',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (114,174,114,'Baleful_Gaze',0,10.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (115,174,115,'Plague_Breath',4,10.0,2000,1500,4,0,0,0);

-- Lizards (cold region)
-- INSERT INTO `mob_skill` VALUES (110,?,110,'Tail_Blow',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (112,?,112,'Blockhead',0,7.0,2000,1500,4,0,0,1);
-- INSERT INTO `mob_skill` VALUES (113,?,113,'Brain_Crush',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (116,?,116,'Infrasonics',4,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (117,?,117,'Secretion',0,7.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (114,?,114,'Baleful_Gaze',0,10.0,2000,2000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (115,?,115,'Plague_Breath',4,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (365,?,969,'Snowball',1,11.0,2000,1500,4,0,0,0); -- only in colder regions

-- Raptor (desert areas)
INSERT INTO `mob_skill` VALUES (118,210,118,'Ripper_Fang',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (120,210,120,'Foul_Breath',4,15.0,2000,1500,4,0,0,0); -- only used in dry desert/mountainous areas
INSERT INTO `mob_skill` VALUES (123,210,123,'Chomp_Rush',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (124,210,124,'Scythe_Tail',0,7.0,2000,1500,4,0,0,1);

-- Raptors (thundery areas)
INSERT INTO `mob_skill` VALUES (118,376,118,'Ripper_Fang',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (122,376,122,'Thunderbolt_Breath',4,15.0,2000,1500,4,0,0,0); -- only used by raptors in stormy areas (S. Champagn,???)
INSERT INTO `mob_skill` VALUES (123,376,123,'Chomp_Rush',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (124,376,124,'Scythe_Tail',0,7.0,2000,1500,4,0,0,1);

-- Raptors (cold areas)
INSERT INTO `mob_skill` VALUES (118,377,118,'Ripper_Fang',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (121,377,121,'Frost_Breath',4,15.0,2000,1500,4,0,0,0); -- only the raptors in Uleguerand Range will use this move
INSERT INTO `mob_skill` VALUES (123,377,123,'Chomp_Rush',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (124,377,124,'Scythe_Tail',0,7.0,2000,1500,4,0,0,1);

-- Bugard
INSERT INTO `mob_skill` VALUES (126,58,819,'Tail_Roll',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (127,58,820,'Tusk',0,7.0,2000,2000,4,0,0,2);
INSERT INTO `mob_skill` VALUES (128,58,821,'Scutum',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (129,58,822,'Bone_Crunch',0,7.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (130,58,823,'Awful_Eye',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (131,58,824,'Heavy_Bellow',4,10.0,2000,1500,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (1107,?,?,'Hungry_Crunch',0,7.0,2000,1500,4,0,0,0); -- Only used by the Boggelmann
-- INSERT INTO `mob_skill` VALUES (2387,?,?,'Tyrant_Tusk',4,15.0,2000,1500,4,0,0,0); -- Only used by
-- INSERT INTO `mob_skill` VALUES (2439,?,?,'Torment_Tusk',4,15.0,2000,1500,4,0,0,0); -- Only used by

-- Giant Bats
INSERT INTO `mob_skill` VALUES (138,46,138,'Blood_Drain',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (136,46,136,'Ultrasonics',1,16.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (900,46,338,'Marrow_Drain',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (899,46,339,'Subsonics',1,16.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (0,46,986,'Supersonics',1,16.0,2000,1500,4,0,0,0); -- Aht Urhgan only

-- INSERT INTO `mob_skill` VALUES (1145,?,138,'Soul_Accretion',0,7.0,2000,1500,4,0,0,0); -- Only by Upyri. Used frequently during nighttime hours (Tends to use x2 in short delays ~2 or 3 seconds @ night,possibly night-only).
-- INSERT INTO `mob_skill` VALUES (899,46,337,'Subsonics',1,16.0,2000,1500,4,0,0,0); -- Cap from Upyri. Animation ID different??

-- Bat Trio
INSERT INTO `mob_skill` VALUES (137,47,137,'Sonic_Boom',1,12.5,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (139,47,139,'Jet_Stream',0,7.0,2000,1500,4,0,0,0);

-- Bat Trio (CoP,TOAU,WOTG)
-- INSERT INTO `mob_skill` VALUES (137,?,137,'Sonic_Boom',1,12.5,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (139,?,139,'Jet_Stream',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (901,?,339,'Slipstream',1,16.0,2000,1500,4,0,0,0); -- Not used in original zones
-- INSERT INTO `mob_skill` VALUES (902,?,340,'Turbulence',1,16.0,2000,1500,4,0,0,0); -- Not used in original zones

-- Greater Birds (Rocs on Wiki)
-- NOTES: Based on my retial testing,I can assume wiki info has the 2 sets of abilities reversed. I fought 5 different types
-- of normal birds,and they all did blind/giga/dread dive.
INSERT INTO `mob_skill` VALUES (666,125,143,'Blind_Vortex',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (667,125,144,'Giga_Scream',0,7.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (668,125,145,'Dread_Dive',0,7.0,2000,1500,4,0,0,2);
INSERT INTO `mob_skill` VALUES (146,125,146,'Feather_Barrier',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (670,125,147,'Stormwind',1,15.0,6000,1500,4,0,0,0); -- Animation times may very.

-- INSERT INTO `mob_skill` VALUES (143,?,143,'Scratch',0,7.0,2000,1500,4,0,0,0); -- Used in place of Blind Vortex by certain NM.
-- INSERT INTO `mob_skill` VALUES (144,?,144,'Triple_Attack',0,7.0,2000,1500,4,0,0,0); -- Used in place of Giga Scream by certain NM.
-- INSERT INTO `mob_skill` VALUES (145,?,145,'Gliding_Spike',0,7.0,2000,1500,4,0,0,0); -- Used in place of Dread Dive by certain NM.
-- INSERT INTO `mob_skill` VALUES (146,?,146,'Feather_Barrier',0,7.0,2000,1500,1,0,0,0); -- NM Version. Weaponskill ID different.
-- INSERT INTO `mob_skill` VALUES (147,?,147,'Stormwind',1,15.0,2000,1500,4,0,0,0); -- NM version. Weaponskill ID different.

-- INSERT INTO `mob_skill` VALUES (2447,?,?,'Dread_Wind',1,15.0,2000,1500,4,0,0,0); -- Used by Bennu.

-- Cockatrices
INSERT INTO `mob_skill` VALUES (150,70,150,'Hammer_Beak',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (151,70,151,'Poison_Pick',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (152,70,152,'Sound_Vacuum',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (155,70,155,'Baleful_Gaze',0,10.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (154,70,154,'Sound_Blast',1,16.0,2000,1500,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (1077,?,?,'Contagion_Transfer',1,15.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1079,?,?,'Toxic_Pick',0,7.0,2000,1500,4,0,0,0); (MONSTROSITY)

-- Leeches
INSERT INTO `mob_skill` VALUES (158,172,158,'Suction',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (159,172,159,'Acid_Mist',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (160,172,160,'Sand_Breath',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (161,172,161,'Drainkiss',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (167,172,167,'Brain_Drain',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (162,172,162,'Regeneration',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (165,172,165,'MP_Drainkiss',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (164,172,164,'TP_Drainkiss',0,7.0,2000,1500,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (70,?,?,'Absorbing_Kiss',0,7.0,2000,1500,4,0,0,0); -- Only used by certain NM
-- INSERT INTO `mob_skill` VALUES (71,?,?,'Deep_Kiss',0,7.0,2000,1500,4,0,0,0); -- Only used by certain NM
-- INSERT INTO `mob_skill` VALUES (69,?,?,'Random_Kiss',0,7.0,2000,1500,4,0,0,0); -- Only used by certain NM

INSERT INTO `mob_skill` VALUES (158,369,158,'Suction',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (159,369,159,'Acid_Mist',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (160,369,160,'Sand_Breath',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (161,369,161,'Drainkiss',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (167,369,167,'Brain_Drain',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (162,369,162,'Regeneration',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (165,369,165,'MP_Drainkiss',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (164,369,164,'TP_Drainkiss',0,7.0,2000,1500,4,0,0,0);

-- Worms
INSERT INTO `mob_skill` VALUES (168,258,168,'Full-Force_Blow',0,7.0,2000,1500,4,0,0,1);
INSERT INTO `mob_skill` VALUES (169,258,169,'Gastric_Bomb',0,18.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (170,258,170,'Sandspin',1,12.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (171,258,171,'Tremors',1,12.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (173,258,173,'Sound_Vacuum',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (172,258,172,'MP_Absorption',0,15.0,2000,1500,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (1633,258,172,'Spirit_Vacuum',0,7.0,2000,1500,4,0,0,0); -- Only used by Anemic Aloysius

-- Slimes
INSERT INTO `mob_skill` VALUES (175,228,175,'Fluid_Spread',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (176,228,176,'Fluid_Toss',0,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (177,228,177,'Digest',0,7.0,2000,1000,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (2294,?,?,'Dissolve',4,10.0,2000,1500,4,0,0,0); -- Only used by certain NM
-- INSERT INTO `mob_skill` VALUES (2258,?,?,'Cytokinesis',0,7.0,2000,1500,4,0,0,0); -- Only used by certain NM

-- Slimes (ToAU Clots?)
-- INSERT INTO `mob_skill` VALUES (175,?,175,'Fluid_Spread',1,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (177,?,177,'Digest',0,7.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (176,?,176,'Fluid_Toss',0,15.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (?,?,?,'HP_Drain',0,7.0,2000,1500,4,0,0,0); -- TOAU/WOTG?
-- INSERT INTO `mob_skill` VALUES (2296,?,?,'Epoxy_Spread',1,10.0,2000,1500,4,0,0,0); -- Only used by clots in the Near East,Hematic Cyst,and Blobdingnag.
-- INSERT INTO `mob_skill` VALUES (2295,?,?,'Mucus_Spread',1,10.0,2000,1500,4,0,0,0); -- Only used by clots in the Near East and Blobdingnag.

-- Clot
INSERT INTO `mob_skill` VALUES (175,66,175,'Fluid_Spread',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (176,66,176,'Fluid_Toss',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (177,66,177,'Digest',0,7.0,2000,1500,4,0,0,0);

INSERT INTO `mob_skill` VALUES (175,229,175,'Fluid_Spread',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (176,229,176,'Fluid_Toss',0,18.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (177,229,177,'Digest',0,7.0,2000,1500,4,0,0,0);

INSERT INTO `mob_skill` VALUES (175,230,175,'Fluid_Spread',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (176,230,176,'Fluid_Toss',0,18.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (177,230,177,'Digest',0,7.0,2000,1500,4,0,0,0);

-- Hecteyes
INSERT INTO `mob_skill` VALUES (181,139,181,'Death_Ray',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (182,139,182,'Hex_Eye',4,10.0,2000,500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (184,139,184,'Catharsis',0,7.0,2000,1500,1,0,0,0);

-- Hecteyes (CoP + ?)
-- INSERT INTO `mob_skill` VALUES (183,?,183,'Petro_Gaze',4,10.0,2000,3500,4,0,0,0); -- Known users: Hecteyes in Chains of Promathia areas,Sobbing Eyes in the BCNM40 battle Under Observation,Shoggoth (Tier II VNM).
-- INSERT INTO `mob_skill` VALUES (184,?,184,'Catharsis',0,7.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (181,139,181,'Death_Ray',0,7.0,2000,1500,4,0,0,0);

-- Crab
INSERT INTO `mob_skill` VALUES (188,75,188,'Big_Scissors',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (187,75,187,'Bubble_Curtain',0,7.0,2000,1500,1,0,0,0); -- Shell -50% magic damage taken
INSERT INTO `mob_skill` VALUES (186,75,186,'Bubble_Shower',1,12.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (192,75,192,'Metallic_Body',0,7.0,2000,1500,1,0,0,0); -- 25HP Stoneskin
INSERT INTO `mob_skill` VALUES (189,75,189,'Scissor_Guard',0,7.0,2000,1500,1,0,0,0); -- +100% defense boost

-- INSERT INTO `mob_skill` VALUES (2257,?,?,'Mega_Scissors',4,10.0,2000,1500,4,0,0,0); -- Only used by certain NM
-- INSERT INTO `mob_skill` VALUES (2256,?,?,'Venom_Shower',1,20.0,2000,1500,4,0,0,0); -- Only used by certain NM

INSERT INTO `mob_skill` VALUES (188,76,188,'Big_Scissors',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (187,76,187,'Bubble_Curtain',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (186,76,186,'Bubble_Shower',1,14.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (192,76,192,'Metallic_Body',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (189,76,189,'Scissor_Guard',0,7.0,2000,1500,1,0,0,0); -- +100% defense boost

INSERT INTO `mob_skill` VALUES (188,77,188,'Big_Scissors',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (187,77,187,'Bubble_Curtain',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (186,77,186,'Bubble_Shower',1,14.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (192,77,192,'Metallic_Body',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (189,77,189,'Scissor_Guard',0,7.0,2000,1500,1,0,0,0); -- +100% defense boost

INSERT INTO `mob_skill` VALUES (188,372,188,'Big_Scissors',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (187,372,187,'Bubble_Curtain',0,7.0,2000,1500,1,0,0,0); -- Shell -50% magic damage taken
INSERT INTO `mob_skill` VALUES (186,372,186,'Bubble_Shower',1,12.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (192,372,192,'Metallic_Body',0,7.0,2000,1500,1,0,0,0); -- 25HP Stoneskin
INSERT INTO `mob_skill` VALUES (189,372,189,'Scissor_Guard',0,7.0,2000,1500,1,0,0,0); -- +100% defense boost

-- Tegmine
INSERT INTO `mob_skill` VALUES (187,400,187,'Bubble_Curtain',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (186,400,186,'Bubble_Shower',1,12.0,2000,1500,4,0,0,0);

-- Shadows
INSERT INTO `mob_skill` VALUES (190,221,190,'Dimensional_Death',0,7.0,2000,0,4,1,0,0);
INSERT INTO `mob_skill` VALUES (190,222,190,'Dimensional_Death',0,7.0,2000,0,4,1,0,0);
INSERT INTO `mob_skill` VALUES (190,223,190,'Dimensional_Death',0,7.0,2000,0,4,1,0,0);

-- Pugil
INSERT INTO `mob_skill` VALUES (195,197,195,'Splash_Breath',4,12.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (196,197,196,'Screwdriver',0,9.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (197,197,197,'Water_Wall',0,7.0,2000,1500,1,0,0,0); -- 100% Defense Boost. 1 minute duration
INSERT INTO `mob_skill` VALUES (198,197,198,'Water_Shield',0,7.0,2000,1500,1,0,0,0); -- Eva boost
INSERT INTO `mob_skill` VALUES (194,197,194,'Aqua_Ball',2,12.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (193,197,193,'Intimidate',4,10.0,2000,1500,4,0,0,0);

-- Pugils (Jagils Subspecies)
-- INSERT INTO `mob_skill` VALUES (195,?,195,'Splash_Breath',4,12.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (197,?,197,'Water_Wall',0,7.0,2000,1500,1,0,0,0); -- 100% Defense Boost. 1 minute duration
-- INSERT INTO `mob_skill` VALUES (198,?,198,'Water_Shield',0,7.0,2000,1500,1,0,0,0); -- Eva boost
-- INSERT INTO `mob_skill` VALUES (194,?,194,'Aqua_Ball',2,12.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (193,?,193,'Intimidate',4,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (385,?,973,'Recoil_Dive',4,10.0,2000,1500,4,0,0,0); -- Used by Jagils instead of Screwdriver

-- Pugils (Dynamis - Nightmare Makara) ?
-- INSERT INTO `mob_skill` VALUES (1610,?,?,'Splash_Breath',4,12.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1612,?,?,'Water_Wall',0,7.0,2000,1500,1,0,0,0); -- 100% Defense Boost. 1 minute duration
-- INSERT INTO `mob_skill` VALUES (1613,?,?,'Water_Shield',0,7.0,2000,1500,1,0,0,0); -- Eva boost
-- INSERT INTO `mob_skill` VALUES (1609,?,?,'Aqua_Ball',2,12.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1608,?,?,'Intimidate',4,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1614,?,?,'Recoil_Dive',4,10.0,2000,1500,4,0,0,0); -- Used by Jagils instead of Screwdriver
-- INSERT INTO `mob_skill` VALUES (1611,?,?,'Screwdriver',0,9.0,2000,1500,4,0,0,0);

-- Sea Monks
INSERT INTO `mob_skill` VALUES (202,218,202,'Ink_Jet',4,12.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (203,218,203,'Hard_Membrane',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (204,218,204,'Cross_Attack',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (205,218,205,'Regeneration',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (206,218,206,'Maelstrom',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (207,218,207,'Whirlwind',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (200,218,200,'Tentacle',0,7.0,2000,1500,4,0,0,0);

INSERT INTO `mob_skill` VALUES (202,219,202,'Ink_Jet',4,12.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (203,219,203,'Hard_Membrane',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (204,219,204,'Cross_Attack',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (205,219,205,'Regeneration',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (206,219,206,'Maelstrom',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (207,219,207,'Whirlwind',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (200,219,200,'Tentacle',0,7.0,2000,1500,4,0,0,0);

-- Hounds
INSERT INTO `mob_skill` VALUES (209,142,209,'Howling',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (210,142,210,'Poison_Breath',4,12.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (211,142,211,'Rot_Gas',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (212,142,212,'Dirty_Claw',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (213,142,213,'Shadow_Claw',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (214,142,214,'Methane_Breath',4,12.0,2000,1500,4,0,0,0);

INSERT INTO `mob_skill` VALUES (209,143,209,'Howling',1,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (210,143,210,'Poison_Breath',4,12.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (211,143,211,'Rot_Gas',1,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (212,143,212,'Dirty_Claw',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (213,143,213,'Shadow_Claw',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (214,143,214,'Methane_Breath',4,12.0,2000,1500,4,0,0,0);

-- Ghost
INSERT INTO `mob_skill` VALUES (220,121,220,'Curse',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (218,121,218,'Fear_Touch',0,7.0,3000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (219,121,219,'Terror_Touch',0,7.0,3000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (217,121,217,'Ectosmash',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (221,121,221,'Dark_Sphere',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (216,121,216,'Grave_Reel',1,15.0,2000,1500,4,0,0,0);

-- Ghosts (Bhoot Subspecies)
-- INSERT INTO `mob_skill` VALUES (1538,?,?,'Perdition',0,10.0,2000,1500,4,0,0,0); -- Bhoot only

-- Skeletons
INSERT INTO `mob_skill` VALUES (222,227,222,'Hell_Slash',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (223,227,223,'Horror_Cloud',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (228,227,228,'Black_Cloud',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (229,227,229,'Blood_Saber',1,15.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (?,227,?,'Marrow Drain',0,7.0,2000,1500,4,0,0,0);

-- Skeletons (Drauger Subspecies)
-- INSERT INTO `mob_skill` VALUES (?,?,?,'Malediction',1,15.0,2000,1500,4,0,0,0); --  Drain (~300). Only used by draugar

-- INSERT INTO `mob_skill` VALUES (?,?,?,'Dereliction',1,20.0,2000,1500,4,0,0,0); -- Only used by draugar NM

-- Coeurls
INSERT INTO `mob_skill` VALUES (396,71,396,'Blaster',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (397,71,397,'Chaotic_Eye',4,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (224,0,288,'Petrifactive_Breath',4,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (225,0,289,'Frenzied_Rage',0,7.0,2000,1500,1,0,0,0); --  Attack Boost (20%)
-- INSERT INTO `mob_skill` VALUES (226,0,290,'Pounce',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (227,0,291,'Charged_Whisker',1,12.5,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1953,?,?,'Blink_of_Peril',4,10.0,2000,1500,4,0,0,0); -- Only used by certain Lynx-type NM
-- INSERT INTO `mob_skill` VALUES (?,?,?,'Mortal_Gaze',4,10.0,2000,1500,4,0,0,0); -- Only used by certain NMS

-- Doomed
INSERT INTO `mob_skill` VALUES (233,86,233,'Stinking_Gas',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (234,86,234,'Undead_Mold',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (236,86,236,'Abyss_Blast',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (232,86,232,'Acid_Breath',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (235,86,235,'Call_of_the_Grave',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (230,86,230,'Whip_Tongue',0,7.0,2000,1500,4,0,0,1);

-- INSERT INTO `mob_skill` VALUES (1082,?,?,'Infernal_Pestilence',4,10.0,2000,1500,4,0,0,0); -- Only used by certain NM

-- Bombs
INSERT INTO `mob_skill` VALUES (253,56,253,'Self-Destruct',1,20.0,2000,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (254,56,254,'Berserk',0,7.0,2000,1500,1,0,0,0);

-- Bombs (TOAU [Big Bomb PH: Friar's Lantern Version])
-- NOTE: Might be the same for TOAU NMs also
-- INSERT INTO `mob_skill` VALUES (337,?,879,'Berserk',0,7.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (338,?,880,'Vulcanian_Impact',0,7.0,2000,1500,4,0,0,0); -- COP TOAU Only
-- INSERT INTO `mob_skill` VALUES (339,?,881,'Heat_Wave',1,15.0,2000,1500,4,0,0,0); -- COP TOAU Only
-- INSERT INTO `mob_skill` VALUES (340,?,882,'Hellstorm',1,15.0,2000,1500,4,0,0,0); -- TOAU Only
-- INSERT INTO `mob_skill` VALUES (253,?,253,'Self-Destruct',1,20.0,2000,3000,4,0,0,0);

-- Evil Weapons
INSERT INTO `mob_skill` VALUES (257,110,257,'Smite_of_Rage',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (258,110,258,'Whirl_of_Rage',1,10.0,2000,1500,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (?,?,?,'Whispers_of_Ire',1,15.0,2000,1500,4,0,0,0); -- Only used by certain NM
-- INSERT INTO `mob_skill` VALUES (?,?,?,'Flurry_of_Rage',0,7.0,2000,1500,4,0,0,0); -- Only used by certain NM
-- INSERT INTO `mob_skill` VALUES (?,?,?,'Smite_of_Fury',0,7.0,2000,1500,4,0,0,0); -- Only used by certain NM (CoP)
-- INSERT INTO `mob_skill` VALUES (?,?,?,'Furious_Flurry',0,7.0,2000,1500,4,0,0,0); -- Only used by certain NM (CoP)

-- Magic Pot
INSERT INTO `mob_skill` VALUES (269,175,269,'Battery_Charge',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (267,175,267,'Mysterious_Light',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (265,175,265,'Spinning_Attack',4,10.0,2000,1500,4,0,0,1);
INSERT INTO `mob_skill` VALUES (264,175,264,'Double_Ray',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (266,175,266,'Spectral_Barrier',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (268,175,268,'Mind_Drain',0,7.0,2000,1500,4,0,0,0);

-- Dolls
INSERT INTO `mob_skill` VALUES (278,83,278,'Kartstrahl',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (279,83,279,'Blitzstrahl',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (280,83,280,'Panzerfaust',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (281,83,281,'Berserk',0,7.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (282,83,282,'Panzerschreck',0,15.0,2000,1500,1,0,0,0); -- Needs scripts
INSERT INTO `mob_skill` VALUES (283,83,283,'Typhoon',1,10.0,2000,1500,4,0,0,1);
INSERT INTO `mob_skill` VALUES (285,83,285,'Gravity_Field',2,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (287,83,287,'Meltdown',1,15.0,2000,5000,4,0,0,0);

INSERT INTO `mob_skill` VALUES (278,84,278,'Kartstrahl',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (279,84,279,'Blitzstrahl',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (280,84,280,'Panzerfaust',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (281,84,281,'Berserk',0,7.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (282,83,282,'Panzerschreck',0,15.0,2000,1500,1,0,0,0); -- Needs scripts
INSERT INTO `mob_skill` VALUES (283,84,283,'Typhoon',1,10.0,2000,1500,4,0,0,1);
INSERT INTO `mob_skill` VALUES (285,84,285,'Gravity_Field',2,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (287,84,287,'Meltdown',1,15.0,2000,5000,4,0,0,0);

INSERT INTO `mob_skill` VALUES (278,85,278,'Kartstrahl',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (279,85,279,'Blitzstrahl',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (280,85,280,'Panzerfaust',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (281,85,281,'Berserk',0,7.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (282,83,282,'Panzerschreck',0,15.0,2000,1500,1,0,0,0); -- Needs scripts
INSERT INTO `mob_skill` VALUES (283,85,283,'Typhoon',1,10.0,2000,1500,4,0,0,1);
INSERT INTO `mob_skill` VALUES (285,85,285,'Gravity_Field',2,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (287,85,287,'Meltdown',1,15.0,2000,5000,4,0,0,0);

-- Calcabrina
INSERT INTO `mob_skill` VALUES (281,395,281,'Berserk',0,7.0,2000,1500,1,0,0,0);

-- Martinet
INSERT INTO `mob_skill` VALUES (279,401,279,'Blitzstrahl',0,15.0,2000,1500,4,0,0,0);

-- Ahriman
INSERT INTO `mob_skill` VALUES (292,4,292,'Blindeye',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (293,4,293,'Eyes_On_Me',0,13.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (294,4,294,'Hypnosis',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (295,4,295,'Mind_Break',4,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (296,4,296,'Binding_Wave',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (297,4,297,'Airy_Shield',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (299,4,299,'Magic_Barrier',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (301,4,301,'Level_5_Petrify',1,15.0,2000,1500,4,0,0,0);

-- Demons
INSERT INTO `mob_skill` VALUES (303,169,303,'Soul_Drain',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (304,169,304,'Hecatomb_Wave',4,10.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (307,169,307,'Demonic_Howl',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (892,169,311,'Condemnation',4,10.0,2000,1500,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (2116,?,?,'Hellborn_Yawp',4,10.0,2000,1500,4,0,0,0);--  Only used by Shadowsoul,Abununnu and Count Bifrons.

-- Demons (Dynamis)
-- probably uses WS ID's 889-894
INSERT INTO `mob_skill` VALUES (303,358,303,'Soul_Drain',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (304,358,304,'Hecatomb_Wave',4,10.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (307,358,307,'Demonic_Howl',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (892,358,311,'Condemnation',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (893,358,313,'Quadrastrike',0,7.0,2000,1500,4,0,0,0);

-- Duke Focalor
INSERT INTO `mob_skill` VALUES (303,399,303,'Soul_Drain',0,7.0,2000,1500,4,0,0,0);

-- Goobbue
INSERT INTO `mob_skill` VALUES (325,136,325,'Blow',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (327,136,327,'Beatdown',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (328,136,328,'Uppercut',0,7.0,2000,1500,4,0,0,2);
INSERT INTO `mob_skill` VALUES (330,136,330,'Blank_Gaze',0,7.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (331,136,331,'Antiphase',1,15.0,2000,1500,4,0,0,0);

-- Nant'ina (Dynamis - Valkurm)
-- Note: Uses Blow and Uppercut as normal attack round moves. WS message is displayed.
-- INSERT INTO `mob_skill` VALUES (1361,?,325,'Blow',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1362,?,328,'Uppercut',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1363,?,331,'Attractant',1,15.0,2000,1500,4,0,0,0);

-- Goblins
INSERT INTO `mob_skill` VALUES (334,133,334,'Goblin_Rush',0,6.0,2000,1500,4,0,0,1);
INSERT INTO `mob_skill` VALUES (335,133,335,'Bomb_Toss',2,8,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (336,133,336,'Bomb_Toss_Suicide',1,13.5,2000,1500,4,0,0,0);

-- Dynamis Goblin (Vanguard Type)
INSERT INTO `mob_skill` VALUES (334,327,334,'Goblin_Rush',0,6.0,2000,1500,4,0,0,1);
INSERT INTO `mob_skill` VALUES (335,327,335,'Bomb_Toss',2,13.5,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (826,327,744,'Smokebomb',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (828,327,746,'Crispy_Candle',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (830,327,748,'Paralysis_Shower',4,10.0,2000,1500,4,0,0,0);

-- Dynamis Goblin (Vanguard NM Type)
INSERT INTO `mob_skill` VALUES (334,373,334,'Goblin_Rush',0,6.0,2000,1500,4,0,0,1);
INSERT INTO `mob_skill` VALUES (335,373,335,'Bomb_Toss',2,13.5,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (826,373,744,'Smokebomb',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (828,373,746,'Crispy_Candle',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (830,373,748,'Paralysis_Shower',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (843,373,750,'Dice_Heal',1,10.0,3000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (844,373,751,'Dice_Curse',1,10.0,3000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (845,373,752,'Dice_Damage',1,10.0,3000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (846,373,753,'Dice_Stun',1,10.0,3000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (847,373,754,'Dice_Poison',1,10.0,3000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (848,373,755,'Dice_Disease',1,10.0,3000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (849,373,756,'Dice_Sleep',1,10.0,3000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (850,373,757,'Dice_Slow',1,10.0,3000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (851,373,758,'Dice_TP_Loss',1,10.0,3000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (852,373,759,'Dice_Dispel',1,10.0,3000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (853,373,760,'Dice_Reset',1,10.0,3000,1500,4,0,0,0);

-- Orcs
INSERT INTO `mob_skill` VALUES (377,189,354,'Howl',1,20.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (353,189,353,'Battle_Dance',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (352,189,352,'Arm_Block',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (351,189,351,'Slam_Dunk',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (349,189,349,'Aerial_Wheel',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (350,189,350,'Shoulder_Attack',0,7.0,2000,1500,4,0,0,1);
-- warlord Rojgnoj
INSERT INTO `mob_skill` VALUES (438,334,438,'Invincible',0,7.0,2000,0,1,2,0,0);
-- left hand
INSERT INTO `mob_skill` VALUES (435,334,435,'Manafont',0,7.0,2000,0,1,2,0,0);
-- Yukvok of clan death
INSERT INTO `mob_skill` VALUES (479,334,21,'Eagle_Eye_Shot',0,25.0,2000,0,4,2,0,0);
-- right hand
INSERT INTO `mob_skill` VALUES (439,334,439,'Blood_Weapon',0,7.0,2000,0,1,2,0,0);

-- INSERT INTO `mob_skill` VALUES (810,?,740,'Fanatic_Dance',1,10.0,2000,2000,4,0,0,0); -- Only NM's in Dynamis and Falsespinner Bhudbrodd
-- INSERT INTO `mob_skill` VALUES (2155,?,?,'Phantasmal_Dance',1,15.0,2000,2000,4,0,0,0); -- certain NM only

-- Orcs (WOTG only)
-- INSERT INTO `mob_skill` VALUES (1945,334,1555,'Orcish_Counterstance',0,7.0,2000,2000,1,0,0,0);

-- INSERT INTO `mob_skill` VALUES (2007,?,1626,'Tornado_Edge',4,10.0,2000,2000,4,0,0,0); -- certain NM only
-- INSERT INTO `mob_skill` VALUES (1946,?,?,'Berserker_Dance',1,7.0,2000,2000,1,0,0,0); -- certain NM only
-- INSERT INTO `mob_skill` VALUES (2008,?,?,'Shoulder_Charge',4,10.0,2000,2000,4,0,0,0); -- certain NM only
-- INSERT INTO `mob_skill` VALUES (2117,?,?,'Veil_of_Chaos',1,15.0,2000,2000,4,0,0,0); -- certain NM only

-- Orcish NM
INSERT INTO `mob_skill` VALUES (353,334,353,'Battle_Dance',1,12.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (352,334,352,'Arm_Block',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (351,334,351,'Slam_Dunk',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (349,334,349,'Aerial_Wheel',0,12.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (350,334,350,'Shoulder_Attack',0,7.0,2000,1500,4,0,0,1);
INSERT INTO `mob_skill` VALUES (810,334,740,'Fanatic_Dance',1,10.0,2000,2000,4,0,0,0); -- Only NM's in Dynamis and Falsespinner Bhudbrodd

-- Quadav
INSERT INTO `mob_skill` VALUES (355,200,355,'Ore_Toss',0,10.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (377,200,354,'Howl',1,20.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (356,200,356,'Head_Butt',0,7.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (357,200,357,'Shell_Bash',0,7.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (358,200,358,'Shell_Guard',0,7.0,2000,3000,1,0,0,0);

-- INSERT INTO `mob_skill` VALUES (2156,?,?,'Thunderous_Yowl',1,15.0,2000,3000,4,0,0,0);

INSERT INTO `mob_skill` VALUES (377,201,354,'Howl',1,20.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (355,201,355,'Ore_Toss',0,10.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (356,201,356,'Head_Butt',0,7.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (357,201,357,'Shell_Bash',0,7.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (358,201,358,'Shell_Guard',0,7.0,2000,3000,1,0,0,0);

INSERT INTO `mob_skill` VALUES (377,202,354,'Howl',1,20.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (355,202,355,'Ore_Toss',0,10.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (356,202,356,'Head_Butt',0,7.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (357,202,357,'Shell_Bash',0,7.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (358,202,358,'Shell_Guard',0,7.0,2000,3000,1,0,0,0);

-- Quadav (Armored Model)
-- INSERT INTO `mob_skill` VALUES (1967,?,1557,'Ore_Toss',0,7.0,2000,2000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1970,?,1560,'Shell_Guard',0,7.0,2000,3000,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1969,?,1559,'Shell_Bash',0,7.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1971,?,1561,'Howl',1,20.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1968,?,1558,'Head_Butt',0,7.0,2000,2000,4,0,0,1); -- knockback might be level dependant. level 60 quadav were knocking me back

-- INSERT INTO `mob_skill` VALUES (2156,?,?,'Thunderous_Yowl',1,15.0,2000,2000,4,0,0,1);    -- Certain NM only
-- INSERT INTO `mob_skill` VALUES (?,?,?,'Skull_Smash',0,7.0,2000,2000,4,0,0,1);            -- Certain NM only
-- INSERT INTO `mob_skill` VALUES (?,?,?,'Shell_Charge',4,10.0,2000,2000,4,0,0,1);          -- Certain NM only
-- INSERT INTO `mob_skill` VALUES (2118,?,?,'Torment_of_Gu'Dha',1,20.0,2000,2000,4,0,0,1);  -- Certain NM only

-- Quadav (Dynamis)
-- INSERT INTO `mob_skill` VALUES (819,?,?,'Ore_Toss',0,7.0,2000,2000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (820,?,?,'Head_Butt',0,7.0,2000,2000,4,0,0,1);
-- INSERT INTO `mob_skill` VALUES (821,?,?,'Shell_Bash',0,7.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (822,?,?,'Shell_Guard',0,7.0,2000,3000,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (823,?,?,'Howl',1,20.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (824,?,742,'The_Wrath_of_Gu'Dha',1,15.0,2000,2000,4,0,0,1); -- Used only by named Dynamis Quadav NM's and Wings of the Goddess NMs. Possibly exclusive.

-- Qu'Vho Deathhurler
INSERT INTO `mob_skill` VALUES (355,397,355,'Ore_Toss',0,10.0,2000,2000,4,0,0,0);

-- Quadav NM
INSERT INTO `mob_skill` VALUES (377,337,354,'Howl',1,20.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (355,337,355,'Ore_Toss',0,10.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (356,337,356,'Head_Butt',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (357,337,357,'Shell_Bash',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (358,337,358,'Shell_Guard',0,7.0,2000,3000,1,0,0,0);

-- INSERT INTO `mob_skill` VALUES (1977,?,1608,'Diamond_Shell',0,7.0,2000,3000,1,0,0,0); -- Only used by Campaign mobs / ToAU NMs?
-- INSERT INTO `mob_skill` VALUES (1978,?,1609,'Ore_Lob',2,15.0,2000,1500,4,0,0,0); -- Campaign NM's,and some WotG NM's.

-- Yagudo
INSERT INTO `mob_skill` VALUES (361,270,361,'Feather_Storm',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (377,270,354,'Howl',1,20.0,2000,1500,2,0,0,0);
INSERT INTO `mob_skill` VALUES (362,270,362,'Double_Kick',0,7.0,2000,1500,4,0,0,1);
INSERT INTO `mob_skill` VALUES (363,270,363,'Parry',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (364,270,364,'Sweep',1,10.0,2000,1500,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (1742,?,?,'Hane_Fubuki',0,7.0,2000,1500,4,0,0,0); -- Used only by Gessho & Kazan the Peerless instead of Feather Storm
-- INSERT INTO `mob_skill` VALUES (1746,?,?,'Rinpyotosha',1,20.0,2000,1500,2,0,0,0);         -- Used only by Gessho & Kazan the Peerless instead of Howl
-- INSERT INTO `mob_skill` VALUES (1743,?,?,'Hiden_Sokyaku',0,7.0,2000,1500,4,0,0,1);   -- Used only by Gessho & Kazan the Peerless instead of Double Kick.
-- INSERT INTO `mob_skill` VALUES (1744,?,?,'Shiko_no_Mitate',0,7.0,2000,1500,1,0,0,0);  -- Used only by Gessho & Kazan the Peerless instead of Parry.
-- INSERT INTO `mob_skill` VALUES (1745,?,?,'Happobarai',1,10.0,2000,1500,4,0,0,0); -- Used only by Gessho & Kazan the Peerless instead of Sweep.

-- Yagudo NM
INSERT INTO `mob_skill` VALUES (361,360,361,'Feather_Storm',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (377,360,354,'Howl',1,20.0,2000,1500,2,0,0,0);
INSERT INTO `mob_skill` VALUES (362,360,362,'Double_Kick',0,7.0,2000,1500,4,0,0,1);
INSERT INTO `mob_skill` VALUES (363,360,363,'Parry',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (364,360,364,'Sweep',1,10.0,2000,1500,4,0,0,0);

-- Yagudo (Dynamis)
-- INSERT INTO `mob_skill` VALUES (?,?,?,'Doom',0,10.0,2000,1500,4,0,0,0);

-- Yagudo (WoTG)
-- INSERT INTO `mob_skill` VALUES (1949,?,1565,'Feathered_Furore',4,10.0,2000,2000,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (1950,?,?,'Dark_Invocation',0,15.0,2000,1500,4,0,0,0); -- certain Campaign bosses and Aa Xalmo the Savage
-- INSERT INTO `mob_skill` VALUES (2014,?,?,'Shirahadori',0,15.0,2000,1500,4,0,0,0); -- certain nms only
-- INSERT INTO `mob_skill` VALUES (1680,?,?,'Shibaraku',1,10.0,2000,1500,4,0,0,0); -- certain nms only
-- INSERT INTO `mob_skill` VALUES (2013,?,?,'Kamaitachi',1,15.0,2000,1500,4,0,0,0); -- certain nms only
-- INSERT INTO `mob_skill` VALUES (2119,?,?,'Vorticose_Sands',1,15.0,2000,1500,4,0,0,0); -- Tzee Xicu the Manifest WOTG missions only

-- Birds
INSERT INTO `mob_skill` VALUES (366,55,366,'Helldive',0,9.0,2000,1500,4,0,0,1);
INSERT INTO `mob_skill` VALUES (367,55,367,'Wing_Cutter',4,10.0,2000,1500,4,0,0,0);

-- Birds (COP,TOAU)
-- INSERT INTO `mob_skill` VALUES (366,55,?,'Helldive',0,9.0,2000,1500,4,0,0,1);
-- INSERT INTO `mob_skill` VALUES (367,55,?,'Wing_Cutter',4,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1324,?,343,'Damnation_Dive',4,10.0,2000,1500,4,0,0,0);     -- COP/TOAU
-- INSERT INTO `mob_skill` VALUES (1323,?,342,'Blind_Side_Barrage',0,7.0,2000,1500,4,0,0,0);  -- COP/TOAU
-- INSERT INTO `mob_skill` VALUES (1322,?,341,'Broadside_Barrage',0,7.0,2000,1500,4,0,0,0);   -- COP/TOAU

-- Behemoth
INSERT INTO `mob_skill` VALUES (372,51,372,'Wild_Horn',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (373,51,373,'Thunderbolt',1,40.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (374,51,374,'Kick_Out',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (375,51,375,'Shock_Wave',4,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (376,51,376,'Flame_Armor',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (377,51,377,'Howl',0,7.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (378,51,378,'Meteor',2,30.0,2000,1500,4,0,0,0); -- Chlevnik

-- King Behemoth
INSERT INTO `mob_skill` VALUES (372,479,372,'Wild_Horn',4,10.0,2000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (373,479,373,'Thunderbolt',1,40.0,2000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (374,479,374,'Kick_Out',4,10.0,2000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (375,479,375,'Shock_Wave',4,7.0,2000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (376,479,376,'Flame_Armor',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (377,479,377,'Howl',0,7.0,2000,1500,1,0,0,0);

-- Behemoth (Elasmoth subspecies)
-- INSERT INTO `mob_skill` VALUES (2134,?,?,'Accursed_Armor',0,30.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2135,?,?,'Amnesic_Blast',0,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2330,?,?,'Ecliptic_Meteor',1,30.0,2000,?,4,0,0,0);

-- Warmachine
INSERT INTO `mob_skill` VALUES (379,190,379,'Burst',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (380,190,380,'Flame_Arrow',0,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (381,190,381,'Firebomb',4,9.5,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (382,190,382,'Blastbomb',2,13.5,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (383,190,383,'Fountain',4,9.5,2000,1500,4,0,0,0);

-- Dragons (4 footed variety)
INSERT INTO `mob_skill` VALUES (386,87,386,'Flame_Breath',4,12.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (387,87,387,'Poison_Breath',4,12.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (388,87,388,'Wind_Breath',4,12.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (389,87,389,'Body_Slam',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (390,87,390,'Heavy_Stomp',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (391,87,391,'Chaos_Blade',4,9.5,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (392,87,392,'Petro_Eyes',4,9.5,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (393,87,393,'Voidsong',1,20.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (394,87,394,'Thornsong',0,15.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (395,87,395,'Lodesong',1,20.0,2000,1500,4,0,0,0);


-- Dragons (Dahak Subspecies)
-- INSERT INTO `mob_skill` VALUES (386,?,386,'Flame_Breath',4,12.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (387,?,387,'Poison_Breath',4,12.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (388,?,388,'Wind_Breath',4,12.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (389,?,389,'Body_Slam',1,15.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (390,?,390,'Heavy_Stomp',1,15.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (391,?,391,'Chaos_Blade',4,9.5,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (392,?,392,'Petro_Eyes',4,9.5,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (394,?,394,'Thornsong',0,15.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (395,?,395,'Lodesong',1,15.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1536,?,?,'Nullsong',1,15.0,2000,1500,4,0,0,0); -- Dahaks only

-- Flies
INSERT INTO `mob_skill` VALUES (403,113,403,'Cursed_Sphere',2,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (404,113,404,'Venom',4,10.0,2000,1500,4,0,0,0);

INSERT INTO `mob_skill` VALUES (404,374,404,'Venom',0,10.0,2000,1500,4,0,0,0);

-- Flies (CoP+ToAU+Abyssea)
INSERT INTO `mob_skill` VALUES (62,375,401,'Somersault',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (403,375,403,'Cursed_Sphere',2,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (404,375,404,'Venom',0,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (?,375,?,'Debilitating_Drone',0,7.0,2000,1500,4,0,0,0);

-- Gigas (non-abyssea?)
INSERT INTO `mob_skill` VALUES (406,126,406,'Lightning_Roar',4,9.0,2000,1500,4,0,0,0); -- Lighting-Type only.
INSERT INTO `mob_skill` VALUES (407,126,407,'Ice_Roar',4,9.0,2000,1500,4,0,0,0); -- Ice-Type only.
INSERT INTO `mob_skill` VALUES (408,126,408,'Impact_Roar',4,9.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (409,126,409,'Grand_Slam',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (410,126,410,'Power_Attack',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (411,126,411,'Power_Attack_Weapon',0,7.0,2000,1500,4,0,0,0);

INSERT INTO `mob_skill` VALUES (406,127,406,'Lightning_Roar',4,9.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (407,127,407,'Ice_Roar',4,9.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (408,127,408,'Impact_Roar',4,9.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (409,127,409,'Grand_Slam',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (410,127,410,'Power_Attack',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (411,127,411,'Power_Attack_Weapon',0,7.0,2000,1500,4,0,0,0);

INSERT INTO `mob_skill` VALUES (406,128,406,'Lightning_Roar',4,9.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (407,128,407,'Ice_Roar',4,9.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (408,128,408,'Impact_Roar',4,9.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (409,128,409,'Grand_Slam',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (410,128,410,'Power_Attack',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (411,128,411,'Power_Attack_Weapon',0,7.0,2000,1500,4,0,0,0);

INSERT INTO `mob_skill` VALUES (406,129,406,'Lightning_Roar',4,9.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (407,129,407,'Ice_Roar',4,9.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (408,129,408,'Impact_Roar',4,9.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (409,129,409,'Grand_Slam',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (410,129,410,'Power_Attack',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (411,129,411,'Power_Attack_Weapon',0,7.0,2000,1500,4,0,0,0);

INSERT INTO `mob_skill` VALUES (406,130,406,'Lightning_Roar',4,9.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (407,130,407,'Ice_Roar',4,9.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (408,130,408,'Impact_Roar',4,9.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (409,130,409,'Grand_Slam',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (410,130,410,'Power_Attack',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (411,130,411,'Power_Attack_Weapon',0,7.0,2000,1500,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (1380,?,?,'Trebuchet',1,15.0,2000,1500,4,0,0,0);     -- Certain NM only
-- INSERT INTO `mob_skill` VALUES (2093,?,?,'Daunting_Hurl',0,15.0,2000,1500,4,0,0,0); -- Certain NM only
-- INSERT INTO `mob_skill` VALUES (?,?,?,'Moribund_Hack',1,15.0,2000,1500,4,0,0,0);    -- Certain NM only
-- INSERT INTO `mob_skill` VALUES (2322,?,?,'Colossal_Slam',1,15.0,2000,1500,4,0,0,0); -- Certain NM only
-- INSERT INTO `mob_skill` VALUES (?,?,?,'Mercurial_Strike',1,15.0,2000,1500,4,0,0,0); -- Certain NM only

-- Shadow Lord
INSERT INTO `mob_skill` VALUES (412,224,412,'Kick_Back',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (415,224,415,'Umbra_Smash',1,12.0,3000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (416,224,416,'Giga_Slash',1,12.0,3000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (417,224,417,'Dark_Nova',1,12.0,3000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (413,225,413,'Implosion',1,60,2000,0,4,0,0,0);

-- Golems
INSERT INTO `mob_skill` VALUES (418,135,418,'Crystal_Shield',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (419,135,419,'Heavy_Strike',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (420,135,420,'Ice_Break',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (421,135,421,'Thunder_Break',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (422,135,422,'Crystal_Rain',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (423,135,423,'Crystal_Weapon_Fire',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (424,135,424,'Crystal_Weapon_Stone',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (425,135,425,'Crystal_Weapon_Water',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (426,135,426,'Crystal_Weapon_Wind',1,15.0,2000,1500,4,0,0,0);

-- Sapling
INSERT INTO `mob_skill` VALUES (429,216,429,'Sprout_Spin',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (430,216,430,'Slumber_Powder',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (431,216,431,'Sprout_Smack',0,7.0,2000,1500,4,0,0,0);

-- Cardians
INSERT INTO `mob_skill` VALUES (427,61,427,'Bludgeon',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (428,61,428,'Deal_Out',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (77,61,77,'Double_Down',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (74,61,74,'Shuffle',4,10.0,2000,1500,4,0,0,0);

INSERT INTO `mob_skill` VALUES (438,61,438,'Invincible',0,7.0,2000,0,1,2,0,0);
INSERT INTO `mob_skill` VALUES (433,61,433,'Benediction',1,20.0,2000,0,1,2,0,0);
INSERT INTO `mob_skill` VALUES (435,61,435,'Manafont',0,7.0,2000,0,1,2,0,0);
INSERT INTO `mob_skill` VALUES (436,61,436,'Chainspell',0,7.0,2000,0,1,2,0,0);


-- anim 432 = 2h cloud
-- now they dont start matching up....

-- Sahagin (-72 for anim id)
INSERT INTO `mob_skill` VALUES (515,213,443,'Hydro_Ball',4,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (521,213,449,'Hydro_Shot',0,10.0,2000,3000,4,0,0,1);
INSERT INTO `mob_skill` VALUES (524,213,452,'Spinning_Fin',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (518,213,446,'Bubble_Armor',0,7.0,2000,1500,1,0,0,0);

-- Tonberries
INSERT INTO `mob_skill` VALUES (527,243,455,'Words_of_Bane',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (528,243,456,'Sigh',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (529,243,457,'Light_of_Penance',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (530,243,458,'Lateral_Slash',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (531,243,459,'Vertical_Slash',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (532,243,460,'Throat_Stab',0,3.4,2000,3500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (664,243,503,'Everyones_Grudge',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (665,243,504,'Everyones_Rancor',0,7.0,2000,1500,4,0,0,0); -- Certain NMs only,25% or below.

-- INSERT INTO `mob_skill` VALUES (2137,?,?,'Ritual_Bind',1,15.0,2000,1500,4,0,0,0); -- Bloodeye Vileberry only

-- Golden-Tongued Culberry (Different mag resists)
INSERT INTO `mob_skill` VALUES (527,244,455,'Words_of_Bane',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (528,244,456,'Sigh',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (529,244,457,'Light_of_Penance',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (530,244,458,'Lateral_Slash',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (531,244,459,'Vertical_Slash',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (532,244,460,'Throat_Stab',0,3.4,2000,3500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (664,244,503,'Everyones_Grudge',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (665,244,504,'Everyones_Rancor',0,7.0,2000,1500,4,0,0,0); -- Certain NMs only

-- Grav'iton
INSERT INTO `mob_skill` VALUES (527,282,455,'Words_of_Bane',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (528,282,456,'Sigh',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (529,282,457,'Light_of_Penance',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (530,282,458,'Lateral_Slash',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (531,282,459,'Vertical_Slash',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (532,282,460,'Throat_Stab',0,3.4,2000,3500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (664,282,503,'Everyones_Grudge',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (665,282,504,'Everyones_Rancor',0,7.0,2000,1500,4,0,0,0);

-- ZM4 Tonberries
INSERT INTO `mob_skill` VALUES (527,336,455,'Words_of_Bane',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (528,336,456,'Sigh',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (529,336,457,'Light_of_Penance',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (530,336,458,'Lateral_Slash',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (531,336,459,'Vertical_Slash',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (532,336,460,'Throat_Stab',0,3.4,2000,3500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (664,336,503,'Everyones_Grudge',0,7.0,2000,1500,4,0,0,0);

-- Antica
INSERT INTO `mob_skill` VALUES (535,25,463,'Magnetite_Cloud',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (536,25,464,'Sandstorm',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (540,25,468,'Jamming_Wave',1,16.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (537,25,465,'Sand_Veil',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (538,25,466,'Sand_Shield',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (534,25,462,'Shoulder_Slam',0,7.0,2000,1500,4,0,0,1);
INSERT INTO `mob_skill` VALUES (539,25,467,'Sand_Trap',1,12.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (533,25,461,'Spikeball',0,13.5,2000,1500,4,0,0,0);

-- Manticore
INSERT INTO `mob_skill` VALUES (541,179,469,'Deadly_Hold',0,7.0,2000,1800,4,0,0,0);
INSERT INTO `mob_skill` VALUES (542,179,470,'Tail_Swing',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (543,179,471,'Tail_Smash',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (544,179,472,'Heat_Breath',4,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (545,179,473,'Riddle',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (546,179,474,'Great_Sandstorm',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (547,179,475,'Great_Whirlwind',4,10.0,2000,1500,4,0,0,0);

-- Kirin
INSERT INTO `mob_skill` VALUES (541,281,469,'Deadly_Hold',0,7.0,2000,1800,4,0,0,0);
INSERT INTO `mob_skill` VALUES (542,281,470,'Tail_Swing',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (543,281,471,'Tail_Smash',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (544,281,472,'Heat_Breath',4,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (545,281,473,'Riddle',1,15.0,2000,1500,4,0,0,0); -- might not use this move,according to wiki list
INSERT INTO `mob_skill` VALUES (546,281,474,'Great_Sandstorm',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (547,281,475,'Great_Whirlwind',4,12.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (478,281,432,'Astral_Flow',0,7.0,2000,0,1,2,0,0);

-- Kirin's Avatar
INSERT INTO `mob_skill` VALUES (656,495,611,'searing_light',1,30.0,0,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (583,495,521,'Howling_Moon',1,30.0,0,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (592,495,534,'Inferno',1,30.0,0,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (628,495,586,'Diamond_Dust',1,30.0,0,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (610,495,560,'Tidal_Wave',1,30.0,0,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (637,495,599,'judgment_bolt',1,30.0,0,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (619,495,573,'aerial_blast',1,30.0,0,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (601,495,547,'earthen_fury',1,30.0,0,0,4,0,0,0);

-- Pet Suzaku
INSERT INTO `mob_skill` VALUES (143,333,143,'Scratch',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (144,333,144,'Triple_Attack',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (145,333,145,'Gliding_Spike',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (146,333,146,'Feather_Barrier',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (147,333,147,'Stormwind',1,15.0,2000,1500,4,0,0,0);

-- Pet Genbu
INSERT INTO `mob_skill` VALUES (549,330,477,'Head_Butt_Turtle',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (550,330,478,'Tortoise_Stomp',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (551,330,479,'Harden_Shell',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (552,330,480,'Earth_Breath',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (553,330,481,'Aqua_Breath',4,10.0,2000,1500,4,0,0,0);

-- Pet Seiryu
INSERT INTO `mob_skill` VALUES (558,331,486,'Deadly_Drive',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (559,331,487,'Wind_Wall',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (560,331,488,'Fang_Rush',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (561,331,489,'Dread_Shriek',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (562,331,490,'Tail_Crush',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (565,331,493,'Radiant_Breath',4,15.0,2000,1500,4,0,0,0);

-- Pet Byakko
INSERT INTO `mob_skill` VALUES (14,332,14,'Roar',1,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (15,332,15,'Razor_Fang',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (17,332,17,'Claw_Cyclone',4,15.0,2000,1500,4,0,0,0);

-- Adamantoises
INSERT INTO `mob_skill` VALUES (548,2,476,'Tortoise_Song',1,20.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (549,2,477,'Head_Butt_Turtle',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (550,2,478,'Tortoise_Stomp',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (551,2,479,'Harden_Shell',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (552,2,480,'Earth_Breath',4,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (553,2,481,'Aqua_Breath',4,15.0,2000,1500,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (2329,?,?,'Testudo_Tremor',1,15.0,2000,1500,4,0,0,0); -- Ferromantoise only

-- Spiders
INSERT INTO `mob_skill` VALUES (554,235,482,'Sickle_Slash',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (555,235,483,'Acid_Spray',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (556,235,484,'Spider_Web',1,15.0,2000,1500,4,0,0,0);

-- Spiders (NM?)
-- INSERT INTO `mob_skill` VALUES (703,?,?,'Sickle_Slash',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (704,?,?,'Acid_Spray',4,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (705,?,?,'Spider_Web',1,15.0,2000,1500,4,0,0,0);

-- Wyverns
INSERT INTO `mob_skill` VALUES (557,265,485,'Dispelling_Wind',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (558,265,486,'Deadly_Drive',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (559,265,487,'Wind_Wall',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (560,265,488,'Fang_Rush',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (561,265,489,'Dread_Shriek',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (562,265,490,'Tail_Crush',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (565,265,493,'Radiant_Breath',4,15.0,2000,1500,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (566,?,494,'Chaos_Breath',4,15.0,2000,1500,4,0,0,0); -- Certain NM Only
-- INSERT INTO `mob_skill` VALUES (563,?,491,'Blizzard_Breath',4,15.0,2000,1500,4,0,0,0); -- Certain NM Only
-- INSERT INTO `mob_skill` VALUES (564,?,492,'Thunder_Breath',4,15.0,2000,1500,4,0,0,0); -- Certain NM Only
-- INSERT INTO `mob_skill` VALUES (1966,?,?,'Hurricane_Breath',4,15.0,2000,1500,4,0,0,0); -- Certain NM Only

INSERT INTO `mob_skill` VALUES (557,266,485,'Dispelling_Wind',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (558,266,486,'Deadly_Drive',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (559,266,487,'Wind_Wall',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (560,266,488,'Fang_Rush',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (561,266,489,'Dread_Shriek',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (562,266,490,'Tail_Crush',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (565,266,493,'Radiant_Breath',4,15.0,2000,1500,4,0,0,0);

INSERT INTO `mob_skill` VALUES (557,267,485,'Dispelling_Wind',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (558,267,486,'Deadly_Drive',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (559,267,487,'Wind_Wall',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (560,267,488,'Fang_Rush',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (561,267,489,'Dread_Shriek',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (562,267,490,'Tail_Crush',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (565,267,493,'Radiant_Breath',4,15.0,2000,1500,4,0,0,0);

-- Suzaku
INSERT INTO `mob_skill` VALUES (143,280,143,'Scratch',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (144,280,144,'Triple_Attack',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (145,280,145,'Gliding_Spike',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (146,280,146,'Feather_Barrier',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (147,280,147,'Stormwind',1,15.0,2000,1500,4,0,0,0);

-- Genbu
INSERT INTO `mob_skill` VALUES (549,277,477,'Head_Butt_Turtle',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (550,277,478,'Tortoise_Stomp',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (551,277,479,'Harden_Shell',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (552,277,480,'Earth_Breath',4,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (553,277,481,'Aqua_Breath',4,15.0,2000,1500,4,0,0,0);

-- Seiryu
INSERT INTO `mob_skill` VALUES (558,278,486,'Deadly_Drive',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (559,278,487,'Wind_Wall',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (560,278,488,'Fang_Rush',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (561,278,489,'Dread_Shriek',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (562,278,490,'Tail_Crush',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (565,278,493,'Radiant_Breath',4,15.0,2000,1500,4,0,0,0);

-- Byakko
INSERT INTO `mob_skill` VALUES (14,279,14,'Roar',1,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (15,279,15,'Razor_Fang',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (17,279,17,'Claw_Cyclone',4,15.0,2000,1500,4,0,0,0);

-- offsets shift some more.. (tpid - 72 - 89 (-161)

-- Mimic
INSERT INTO `mob_skill` VALUES (332,183,107,'Death_Trap',1,30.0,2000,2000,4,0,0,0);

-- Mimic (Abyssea)
-- INSERT INTO `mob_skill` VALUES (2324,?,?,'Pandora's_Curse',0,7.0,2000,2000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2325,?,?,'Pandora's_Gift',0,7.0,2000,2000,4,0,0,0); -- Unknown who uses this

-- Bugbear
INSERT INTO `mob_skill` VALUES (105,59,829,'Earth_Shock',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (104,59,828,'Flying_Hip_Press',1,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (103,59,827,'Bionic_Boost',0,7.0,2000,1500,1,0,0,0); -- *Needs Script*
INSERT INTO `mob_skill` VALUES (102,59,826,'Heavy_Whisk',0,7.0,2000,1500,4,0,0,2);
INSERT INTO `mob_skill` VALUES (101,59,825,'Heavy_Blow',0,7.0,2000,1500,4,0,0,0);

-- Moblin
INSERT INTO `mob_skill` VALUES (832,184,334,'Goblin_Rush',0,7.0,2000,1500,4,0,0,1);
INSERT INTO `mob_skill` VALUES (825,184,743,'Frypan',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (826,184,744,'Smokebomb',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (827,184,745,'Smokebomb',0,10.0,2000,1500,1,0,0,0); -- fail
INSERT INTO `mob_skill` VALUES (828,184,746,'Crispy_Candle',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (829,184,747,'Crispy_Candle',0,10.0,2000,1500,1,0,0,0); -- fail
INSERT INTO `mob_skill` VALUES (830,184,748,'Paralysis_Shower',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (831,184,749,'Paralysis_Shower',0,10.0,2000,1500,1,0,0,0); -- fail

-- Flytrap
INSERT INTO `mob_skill` VALUES (178,114,806,'Soporific',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (179,114,807,'Palsy_Pollen',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (180,114,808,'Gloeosuccus',0,7.0,2000,1500,4,0,0,0);

-- Antlions
INSERT INTO `mob_skill` VALUES (19,26,809,'Sand_Blast',1,8.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (20,26,810,'Sand_Pit',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (21,26,811,'Venom_Spray',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (23,26,813,'Mandibular_Bite',0,7.0,2000,1500,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (2261,?,?,'Quake_Blast',1,15.0,2000,1500,4,0,0,0); -- only used by certain nms

-- Antlions (Formiceros Subspecies)
-- INSERT INTO `mob_skill` VALUES (2260,?,?,'Gravitic_Horn',4,10.0,2000,1500,4,0,0,0); -- Formiceros subspecies only

-- Eft
INSERT INTO `mob_skill` VALUES (259,98,814,'Toxic_Spit',0,9.5,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (260,98,815,'Geist_Wall',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (261,98,816,'Numbing_Noise',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (262,98,817,'Nimble_Snap',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (263,98,818,'Cyclotail',1,10.0,2000,1500,4,0,0,0);

-- Fomor
INSERT INTO `mob_skill` VALUES (246,115,246,'Shackled_Fists',0,7.0,2000,0,4,1,0,0); -- Fomor Monks Only.
INSERT INTO `mob_skill` VALUES (247,115,247,'Foxfire',4,10.0,2000,0,4,1,0,0); -- 1-Handed Weapon Wielders Only
INSERT INTO `mob_skill` VALUES (248,115,248,'Grim_Halo',1,10.0,2000,0,4,1,0,0); -- 2-Handed Weapon Wielders Only
INSERT INTO `mob_skill` VALUES (249,115,239,'Netherspikes',4,10.0,2000,0,4,1,0,0);
INSERT INTO `mob_skill` VALUES (250,115,241,'Carnal_Nightmare',1,10.0,2000,0,4,1,0,0);
INSERT INTO `mob_skill` VALUES (251,115,243,'Dancing_Chains',1,10.0,2000,0,4,1,0,0);
INSERT INTO `mob_skill` VALUES (252,115,242,'Aegis_Schism',0,7.0,2000,0,4,1,0,0);
INSERT INTO `mob_skill` VALUES (253,115,244,'Barbed_Crescent',0,7.0,2000,0,4,1,0,0);

-- Fomor (Dynamis - Hydra)
INSERT INTO `mob_skill` VALUES (246,359,246,'Shackled_Fists',0,7.0,2000,0,4,1,0,0);    -- WS IDs are prob different.
INSERT INTO `mob_skill` VALUES (247,359,247,'Foxfire',4,10.0,2000,0,4,1,0,0);          -- WS IDs are prob different.
INSERT INTO `mob_skill` VALUES (248,359,248,'Grim_Halo',1,10.0,2000,0,4,1,0,0);        -- WS IDs are prob different.
INSERT INTO `mob_skill` VALUES (249,359,239,'Netherspikes',4,10.0,2000,0,4,1,0,0);     -- WS IDs are prob different.
INSERT INTO `mob_skill` VALUES (250,359,241,'Carnal_Nightmare',1,10.0,2000,0,4,1,0,0); -- WS IDs are prob different.
INSERT INTO `mob_skill` VALUES (251,359,243,'Dancing_Chains',1,10.0,2000,0,4,1,0,0);   -- WS IDs are prob different.
INSERT INTO `mob_skill` VALUES (252,359,242,'Aegis_Schism',0,7.0,2000,0,4,1,0,0);      -- WS IDs are prob different.
INSERT INTO `mob_skill` VALUES (253,359,244,'Barbed_Crescent',0,7.0,2000,0,4,1,0,0);   -- WS IDs are prob different.

-- Tauri
INSERT INTO `mob_skill` VALUES (242,240,851,'Triclip',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (243,240,852,'Back_Swish',4,10.0,2000,1500,4,0,0,1);
INSERT INTO `mob_skill` VALUES (244,240,853,'Mow',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (245,240,854,'Frightful_Roar',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (246,240,855,'Mortal_Ray',0,10.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (247,240,856,'Unblessed_Armor',0,7.0,2000,1500,1,0,0,0);

-- INSERT INTO `mob_skill` VALUES (1104,?,?,'Apocalyptic_Ray',4,10.0,2000,1500,1,0,0,0); -- Eldertaur only
-- INSERT INTO `mob_skill` VALUES (1103,?,?,'Chthonian_Ray',4,10.0,2000,1500,1,0,0,0); -- Mindertaur only
-- INSERT INTO `mob_skill` VALUES (2133,?,?,'Lethal_Triclip',1,15.0,2000,1500,1,0,0,0); -- Certain NM only

-- Clusters
INSERT INTO `mob_skill` VALUES (311,68,866,'Sling_Bomb',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (312,68,867,'Formation_Attack',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (313,68,868,'Refueling',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (314,68,869,'Circle_of_Flames',1,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (315,68,?,'Self-Destruct',1,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (316,68,?,'Self-Destruct',1,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (317,68,?,'Self-Destruct',1,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (318,68,?,'Self-Destruct',1,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (319,68,?,'Self-Destruct',1,10.0,2000,1500,4,0,0,0);

INSERT INTO `mob_skill` VALUES (313,69,868,'Refueling',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (311,69,866,'Sling_Bomb',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (312,69,867,'Formation_Attack',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (314,69,869,'Circle_of_Flames',1,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (315,69,?,'Self-Destruct',1,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (316,69,?,'Self-Destruct',1,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (317,69,?,'Self-Destruct',1,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (318,69,?,'Self-Destruct',1,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (319,69,?,'Self-Destruct',1,10.0,2000,1500,4,0,0,0);

-- Uragnites
INSERT INTO `mob_skill` VALUES (1315,251,861,'Gas_Shell',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1316,251,862,'Venom_Shell',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1317,251,863,'Palsynyxis',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1318,251,864,'Painful_Whip',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1319,251,865,'Suctorial_Tentacle',0,7.0,2000,1500,4,0,0,0);

-- Snolls
INSERT INTO `mob_skill` VALUES (1391,232,875,'Berserk',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1389,232,876,'Freeze_Rush',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1390,232,877,'Cold_Wave',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1388,232,878,'Hypothermal_Combustion',1,20.0,2000,2000,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (343,?,?,'Arctic_Impact',1,18.0,2000,2000,4,0,0,0); -- Certain NM Only
-- INSERT INTO `mob_skill` VALUES (344,?,?,'Cold_Wave',4,10.0,2000,2000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (345,?,?,'Hypothermal_Combustion',4,12.0,2000,2000,4,0,0,0); -- Certain NM Only

-- Corse
INSERT INTO `mob_skill` VALUES (274,74,900,'Memento_Mori',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (275,74,901,'Silence_Seal',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (276,74,902,'Envoutement',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (277,74,903,'Danse_Macabre',0,10.0,2000,2000,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (1073,?,903,'Gala_Macabre',1,10.0,2000,2000,4,0,0,0); -- Certain NM only
-- INSERT INTO `mob_skill` VALUES (274,?,1070,'Final_Retribution',1,10.0,2000,1500,4,0,0,0); -- Only used by some notorious monsters like Xolotl. Dragon skull headed staff types?

-- Corse (Kumakatok Subspecies - Purple Robes,Gold Hat)
-- INSERT INTO `mob_skill` VALUES (2382,?,?,'Hadal_Summons',1,15.0,2000,1500,4,0,0,0); -- Kumakatok subspecies

-- Spheroids
INSERT INTO `mob_skill` VALUES (728,234,685,'Electrocharge',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (305,234,971,'Electromagnetic_Field',1,10.0,2000,1500,4,0,0,0);

-- Spheroids (CoP/Abyssea)
-- INSERT INTO `mob_skill` VALUES (1657,?,?,'Stunbolt',0,10.0,2000,1500,4,0,0,0); -- CoP / Abyssea only.
-- INSERT INTO `mob_skill` VALUES (1775,?,972,'Reactive_Shield',0,7.0,2000,1500,1,0,0,0); -- CoP / Abyssea only.

-- Mammets
INSERT INTO `mob_skill` VALUES (91,149,889,'Velocious_Blade',0,3.0,2000,1500,4,0,0,0); -- Sword Form Only
INSERT INTO `mob_skill` VALUES (163,149,890,'Scission_Thrust',4,7.0,2000,1500,4,0,0,0); -- Sword Form Only
INSERT INTO `mob_skill` VALUES (166,149,891,'Sonic_Blade',1,5.0,2000,1500,4,0,0,0); -- Sword Form Only
INSERT INTO `mob_skill` VALUES (185,149,892,'Microquake',0,3.0,2000,1500,4,0,0,0); -- Polearm Form Only
INSERT INTO `mob_skill` VALUES (191,149,893,'Percussive_Foin',4,10.0,2000,1500,4,0,0,0); -- Polearm Form Only
INSERT INTO `mob_skill` VALUES (201,149,894,'Gravity_Wheel',1,7.0,2000,1500,4,0,0,0); -- Polearm Form Only
INSERT INTO `mob_skill` VALUES (208,149,895,'Psychomancy',1,15.0,2000,1500,4,0,0,0); -- Staff Form Only
INSERT INTO `mob_skill` VALUES (215,149,896,'Mind_Wall',0,7.0,2000,1500,1,0,0,0); -- Staff Form Only
INSERT INTO `mob_skill` VALUES (231,149,897,'Transmogrification',0,7.0,2000,1500,1,0,0,0); -- Hand Form Only
INSERT INTO `mob_skill` VALUES (284,149,898,'Tremorous_Tread',1,5.0,2000,1500,4,0,0,0);

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VALUES POST 1024
-- Take tpid and +256 then -1024 to find the correct param for the packet
-- Take animid and -1024 to find the correct param
-- REMEMBER TO SET BOTH ANIM AND TPID TO THE CORRECT 0X01
-- --------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Mamool Ja Warrior
INSERT INTO `mob_skill` VALUES (1475,176,1149,'Forceful_Blow',0,7.0,2000,1000,4,0,0,0); -- Hand to Hand Only / After Weapon Break
INSERT INTO `mob_skill` VALUES (1476,176,1150,'Somersault_Kick',0,7.0,2000,1000,4,0,0,4);
INSERT INTO `mob_skill` VALUES (1477,176,1151,'Firespit',0,25.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1478,176,1152,'Warm-Up',0,7.0,2000,1000,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1479,176,1153,'Javelin_Throw',0,7.0,2000,1500,4,0,0,0); -- Weapon is lost after use. Linked with Piercing Type.
-- INSERT INTO `mob_skill` VALUES (1480,176,1154,'Axe_Throw',0,7.0,2000,1500,4,0,0,0); -- Weapon is lost after use. Linked with Slashing Type.
-- INSERT INTO `mob_skill` VALUES (1481,176,1155,'Vorpal_Blade',0,7.0,2000,1500,4,0,0,0); -- Only used by BLU's. Requires weapon out.
-- INSERT INTO `mob_skill` VALUES (1482,176,1156,'Groundburst',1,16.0,2000,1500,4,0,0,0); -- Only used by NMs.
-- INSERT INTO `mob_skill` VALUES (1583,176,1147,'Rushing_Slash',0,7.0,2000,1500,4,0,0,0); -- Slashing Type Wielders Only.
-- INSERT INTO `mob_skill` VALUES (1584,176,1148,'Rushing_Stab',0,7.0,2000,1500,4,0,0,0); -- Piercing Type Wielders Only.

-- Mamool Ja Sage
-- INSERT INTO `mob_skill` VALUES (1664,?,1264,'Rushing_Drub',0,7.0,2000,1500,4,0,0,0); -- Staff Wielders Only.
-- INSERT INTO `mob_skill` VALUES (1665,?,1265,'Forceful_Blow',0,7.0,2000,1000,4,0,0,0); -- Hand to Hand Only.
-- INSERT INTO `mob_skill` VALUES (1666,?,1266,'Somersault_Kick',0,7.0,2000,1000,4,0,0,4);
-- INSERT INTO `mob_skill` VALUES (1667,?,1267,'Firespit',0,25.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1668,?,1268,'Warm-Up',0,7.0,2000,1000,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1669,?,1269,'Stave_Toss',0,7.0,2000,1000,1,0,0,0); -- Linked with Staff
-- INSERT INTO `mob_skill` VALUES (1670,?,1270,'Groundburst',0,7.0,2000,1000,1,0,0,0); -- Only used by NMs.

-- Mamool Ja Knight
-- INSERT INTO `mob_skill` VALUES (1838,?,?,'Fire_Angon',4,16.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1839,?,?,'Batterhorn',4,16.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1840,?,?,'Clobber',4,16.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1841,?,?,'Granite_Skin',4,16.0,2000,1000,4,0,0,0);

-- Mamool Ja Knight (probably Lancelord Gaheel Ja version)
-- INSERT INTO `mob_skill` VALUES (1842,?,?,'Blazing Angon',4,16.0,2000,1000,4,0,0,0); -- Used only by Lancelord Gaheel Ja when his health is below 25%,and by Searing Vogaal Ja during Besieged.
-- INSERT INTO `mob_skill` VALUES (1843,?,?,'Batterhorn',4,16.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1844,?,?,'Clobber',4,16.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1845,?,?,'Demoralizing_Roar',4,16.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1846,?,?,'Boiling Blood',4,16.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1847,?,?,'Granite_Skin',4,16.0,2000,1000,4,0,0,0);

-- Apkallu
INSERT INTO `mob_skill` VALUES (1457,27,1159,'Yawn',1,10.0,2000,1500,4,0,0,0); -- retail confirmed range.
INSERT INTO `mob_skill` VALUES (1458,27,1160,'Wing_Slap',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1459,27,1161,'Beak_Lunge',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1460,27,1162,'Frigid_Shuffle',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1461,27,1163,'Wing_Whirl',1,10.0,2000,1500,4,0,0,0);

-- Marid
INSERT INTO `mob_skill` VALUES (1447,180,1170,'Barrier_Tusk',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1448,180,1171,'Onrush',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1449,180,1172,'Stampede',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1450,180,1173,'Flailing_Trunk',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1451,180,1174,'Voracious_Trunk',0,7.0,2000,1500,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (1452,180,?,'Proboscis_Shower',0,7.0,2000,1500,4,0,0,0); -- NM only

INSERT INTO `mob_skill` VALUES (1449,371,1172,'Stampede',0,7.0,2000,1500,4,0,0,0);

-- Colibri
INSERT INTO `mob_skill` VALUES (1443,72,1176,'Pecking_Flurry',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1444,72,1177,'Snatch_Morsel',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1445,72,1178,'Feather_Tickle',0,7.0,2000,1500,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (?,?,?,'Wisecrack',1,15.0,2000,1500,4,0,0,0); -- Certain NM only

-- Imps
INSERT INTO `mob_skill` VALUES (1455,165,1180,'Frenetic_Rip',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1453,165,1181,'Abrasive_Tantara',1,10.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1454,165,1182,'Deafening_Tantara',1,10.0,2000,1500,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (1747,?,?,'Grating_Tantara',1,10.0,2000,1500,4,0,0,0); -- Used by NM
-- INSERT INTO `mob_skill` VALUES (1748,?,?,'Stifling_Tantara',1,10.0,2000,1500,4,0,0,0); -- Used by NM

INSERT INTO `mob_skill` VALUES (1455,166,1180,'Frenetic_Rip',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1453,166,1181,'Abrasive_Tantara',1,10.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1454,166,1182,'Deafening_Tantara',1,10.0,2000,1500,4,0,0,0);

-- Puks
INSERT INTO `mob_skill` VALUES (1467,198,1198,'Ill_Wind',1,15.0,2000,1500,4,0,0,0); -- Only used by Puks in Mamook,Besieged,and NMs: Vulpangue,Nis Puk,Nguruvilu,Seps ,Phantom Puk,Waugyl
INSERT INTO `mob_skill` VALUES (1466,198,1197,'Zephyr_Mantle',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1465,198,1196,'Obfuscate',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1464,198,1195,'Wind_Shear',1,10.0,2000,1500,4,0,0,7);
INSERT INTO `mob_skill` VALUES (1462,198,1194,'Crosswind',4,10.0,2000,1500,4,0,0,3);

-- INSERT INTO `mob_skill` VALUES (1468,?,1199,'White_Wind',1,10.0,2000,1500,1,0,0,0); -- Certain NM only

-- Qutrub
INSERT INTO `mob_skill` VALUES (1522,203,1205,'Spinal_Cleave',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1523,203,1206,'Mangle',4,16.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1524,203,1207,'Leaping_Cleave',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1525,203,1208,'Hex_Palm',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1526,203,1209,'Animating_Wail',0,7.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1527,203,1210,'Fortifying_Wail',0,7.0,2000,1500,1,0,0,0);

INSERT INTO `mob_skill` VALUES (1522,204,1205,'Spinal_Cleave',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1523,204,1206,'Mangle',4,16.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1524,204,1207,'Leaping_Cleave',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1525,204,1208,'Hex_Palm',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1526,204,1209,'Animating_Wail',0,7.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1527,204,1210,'Fortifying_Wail',0,7.0,2000,1500,1,0,0,0);

INSERT INTO `mob_skill` VALUES (1522,205,1205,'Spinal_Cleave',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1523,205,1206,'Mangle',4,16.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1524,205,1207,'Leaping_Cleave',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1525,205,1208,'Hex_Palm',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1526,205,1209,'Animating_Wail',0,7.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1527,205,1210,'Fortifying_Wail',0,7.0,2000,1500,1,0,0,0);

-- INSERT INTO `mob_skill` VALUES (1528,?,1211,'Unblest_Jambiya',1,15.0,2000,1500,4,0,0,0); -- Certain NM only
-- INSERT INTO `mob_skill` VALUES (2634,?,2025,'Gen'ei_Ryodan',1,15,2000,2000,4,0,0,0); -- Unique to Dimgruzub only @ certain % HP or below

-- Flan
INSERT INTO `mob_skill` VALUES (1565,112,1283,'Amplification',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1566,112,1284,'Boiling_point',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1568,112,1286,'Amorphic_spikes',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1570,112,1288,'Synergism',4,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1571,112,1289,'Metastasis',4,10.0,2000,1500,4,0,0,0); -- lack of info online as to who uses this move.

-- INSERT INTO `mob_skill` VALUES (1567,?,1285,'Xenoglossia',0,7.0,2000,1500,1,0,0,0); -- Certain NMs only
-- INSERT INTO `mob_skill` VALUES (1569,?,1287,'Amorphic_scythe',4,10.0,2000,1500,4,0,0,0); -- Custards and Immortal Flan only

-- Flan (Custards)
-- INSERT INTO `mob_skill` VALUES (1569,?,1287,'Amorphic_scythe',4,10.0,2000,1500,4,0,0,0); -- Custards and Immortal Flan only

-- Wamouracampa
INSERT INTO `mob_skill` VALUES (1559,254,1290,'Amber_scutum',0,10.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1560,254,1291,'Vitriolic_spray',4,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1561,254,1292,'Thermal_Pulse',1,15.0,2000,1000,4,0,0,0); -- Open form only
INSERT INTO `mob_skill` VALUES (1562,254,1293,'Cannonball',0,7.0,2000,1000,4,0,0,0); -- Curled form only
INSERT INTO `mob_skill` VALUES (1563,254,1294,'Heat_barrier',0,7.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1564,254,1295,'Vitriolic_shower',4,10.0,2000,1000,4,0,0,0);

-- Wamoura
INSERT INTO `mob_skill` VALUES (1695,253,1345,'Magma_fan',4,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1696,253,1346,'Erratic_flutter',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1697,253,1347,'Proboscis',4,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1698,253,1348,'Erosion_dust',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1699,253,1349,'Exuviation',0,7.0,2000,1000,1,0,0,0);

-- INSERT INTO `mob_skill` VALUES (1700,253,1350,'Fire_break',0,7.0,2000,1000,4,0,0,0); -- NM only

-- Gears
-- INSERT INTO `mob_skill` VALUES (1791,120,1388,'Antigravity',1,15.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1787,120,1390,'Artificial_Gravity',1,15.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1789,120,1378,'Rail_Cannon',1,15.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1785,120,1376,'Restoral',0,7.0,2000,1500,2,0,0,0);

-- Ramparts
-- INSERT INTO `mob_skill` VALUES (1780,209,?,'Astral_Gate',4,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1778,209,?,'Reinforcements',0,7.0,2000,4000,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1777,209,?,'Choke_Chain',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1776,209,?,'Roller_Chain',1,15.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1779,209,?,'Biomagnet',0,30.0,2000,1500,4,0,0,0);

-- Chariots
INSERT INTO `mob_skill` VALUES (1798,63,1407,'Diffusion_ray',4,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1799,63,1408,'Intertia_stream',1,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1800,63,1399,'Discharge',1,10.0,2000,1000,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (1801,?,1401,'Mortal_revolution',1,15.0,2000,1000,4,0,0,0); -- Certain NMs only
-- INSERT INTO `mob_skill` VALUES (1802,?,1400,'Homing_missile',2,20.0,2000,1000,4,0,0,0); -- Certain NMs only
-- INSERT INTO `mob_skill` VALUES (1803,?,1402,'Discoid',4,10.0,2000,1000,4,0,0,0); -- Certain NMs only
-- INSERT INTO `mob_skill` VALUES (1804,?,1403,'Brainjack',0,10.0,2000,1000,4,0,0,0); -- Only used by Long-Armed Chariot and Long-Horned Chariot.

-- Wivre
INSERT INTO `mob_skill` VALUES (1843,257,1437,'Batterhorn',4,16.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1844,257,1436,'Clobber',4,16.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1845,257,1434,'Demoralizing_Roar',1,16.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1846,257,1435,'Boiling_Blood',0,7.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1847,257,1439,'Granite_Skin',0,7.0,2000,1000,1,0,0,0);

-- INSERT INTO `mob_skill` VALUES (1848,?,?,'Crippling_Slam',4,16.0,2000,1000,4,0,0,0); -- Certain NM only

-- Ladybugs
INSERT INTO `mob_skill` VALUES (1925,170,1579,'Spiral_Spin',4,10.0,2000,1000,4,0,0,0); -- Daytime only
INSERT INTO `mob_skill` VALUES (1924,170,1578,'Nepenthean_Hum',1,10.0,2000,1000,4,0,0,0); -- Daytime only
INSERT INTO `mob_skill` VALUES (1923,170,1577,'Noisome_Powder',1,10.0,2000,1000,4,0,0,0); -- Daytime only
INSERT INTO `mob_skill` VALUES (1922,170,1576,'Sudden_Lunge',0,7.0,2000,1000,4,0,0,3);

-- Ladybugs (NM)
INSERT INTO `mob_skill` VALUES (1925,390,1579,'Spiral_Spin',4,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1924,390,1578,'Nepenthean_Hum',1,10.0,2000,1000,4,0,0,0); -- Daytime only
INSERT INTO `mob_skill` VALUES (1923,390,1577,'Noisome_Powder',1,10.0,2000,1000,4,0,0,0); -- Daytime only
INSERT INTO `mob_skill` VALUES (1922,390,1576,'Sudden_Lunge',0,7.0,2000,1000,4,0,0,3);
INSERT INTO `mob_skill` VALUES (1926,390,1580,'Spiral_burst',0,7.0,2000,1000,4,0,0,0); -- Daytime only | Skogs Fru / Vadleany only?

-- Pixie
INSERT INTO `mob_skill` VALUES (1937,195,1581,'Zephyr_Arrow',0,15.0,2000,1500,4,0,0,3);
INSERT INTO `mob_skill` VALUES (1938,195,1582,'Lethe_Arrows',0,15.0,2000,1500,4,0,0,3);
INSERT INTO `mob_skill` VALUES (1939,195,1583,'Spring_Breeze',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1940,195,1584,'Summer_Breeze',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1941,195,1585,'Autumn_Breeze',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1942,195,1586,'Winter_Breeze',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1943,195,1587,'Cyclonic_Turmoil',1,15.0,2000,1500,4,0,0,5);
INSERT INTO `mob_skill` VALUES (1944,195,1588,'Cyclonic_Torrent',1,15.0,2000,1500,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (2262,?,?,'Norn_Arrows',0,15.0,2000,1500,4,0,0,0); -- Certain NM Only
-- INSERT INTO `mob_skill` VALUES (2438,?,?,'Cyclonic_Blight',1,15.0,2000,1500,4,0,0,0); -- Certain NM Only

-- Gnole
INSERT INTO `mob_skill` VALUES (1914,132,1589,'Fevered_Pitch',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1915,132,1590,'Call_of_the_Moon_up',1,25.0,2000,1500,4,0,0,0); -- standing up
INSERT INTO `mob_skill` VALUES (1916,132,1591,'Call_of_the_Moon_down',1,25.0,2000,1500,4,0,0,0); -- on 4 legs
INSERT INTO `mob_skill` VALUES (1917,132,1592,'Plenilune_Embrace_up',0,15.0,2000,1500,1,0,0,0); -- standing up
INSERT INTO `mob_skill` VALUES (1918,132,1593,'Plenilune_Embrace_down',0,15.0,2000,1500,1,0,0,0); -- 4 legs
INSERT INTO `mob_skill` VALUES (1919,132,1594,'Nox_blast',0,7.0,2000,1000,4,0,0,3); -- standing only
INSERT INTO `mob_skill` VALUES (1920,132,1595,'Asuran_claws',0,7.0,2000,1000,4,0,0,0); -- standing only

-- INSERT INTO `mob_skill` VALUES (1921,0,1596,'Cacophony',0,7.0,2000,1000,1,0,0,0); -- standing up - NMs only

-- Djinn
INSERT INTO `mob_skill` VALUES (1960,82,1597,'Nocturnal_Combustion',1,20.0,2000,500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1962,82,1599,'Penumbral_Impact',0,7.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1961,82,1598,'Berserk',0,7.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1963,82,1600,'Dark_Wave',1,10.0,2000,1000,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (1964,?,1601,'Tartarean_storm',1,20.0,2000,1000,4,0,0,0); -- only Chhir Batti nm

-- Ghrah
INSERT INTO `mob_skill` VALUES (1185,122,1065,'Actinic_Burst',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1186,122,1066,'Core_Meltdown',1,15.0,2000,4000,4,0,0,0); -- occurs very rarely. lets say a 5% chance.
INSERT INTO `mob_skill` VALUES (1187,122,1061,'Hexidiscs',4,10.0,2000,1500,4,0,0,0); -- only used in ball form
INSERT INTO `mob_skill` VALUES (1188,122,1062,'Vorpal_Blade',0,7.0,2000,1500,4,0,0,0); -- only used in human form
INSERT INTO `mob_skill` VALUES (1189,122,1063,'Damnation_Dive',4,10.0,2000,1500,4,0,0,0); -- only used in bird form.  Logged on Eo'ghrah. theres a version that supposedly has knockback?
INSERT INTO `mob_skill` VALUES (1190,122,1064,'Sickle_Slash',0,7.0,2000,1500,4,0,0,0); -- only used in spider form.

INSERT INTO `mob_skill` VALUES (1187,123,1061,'Hexidiscs',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1185,123,1065,'Actinic_Burst',1,10.0,2000,1500,4,0,0,0);

INSERT INTO `mob_skill` VALUES (1187,124,1061,'Hexidiscs',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1185,124,1065,'Actinic_Burst',1,10.0,2000,1500,4,0,0,0);

-- Euvhi
INSERT INTO `mob_skill` VALUES (1194,109,1067,'Viscid_Nectar',4,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1196,109,1068,'Axial_Bloom',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1191,109,1070,'Vertical_Cleave',0,7.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1192,109,1071,'Efflorescent_Foetor',4,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1193,109,1072,'Stupor_Spores',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1195,109,1073,'Morning_Glory',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1197,109,1069,'Nutrient_Aborption',0,7.0,2000,1000,4,0,0,0);

-- Zdei - T-Sight aggro @ 15  yalms.
INSERT INTO `mob_skill` VALUES (1207,272,1074,'Reactor_Cool',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1209,272,1076,'Optic_Induration',4,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1210,272,1077,'Static_Filament',4,10.0,2000,1000,4,0,0,0); -- bar form only
INSERT INTO `mob_skill` VALUES (1211,272,1078,'Decayed_Filament',4,8.0,2000,1000,4,0,0,0); -- bar form only
INSERT INTO `mob_skill` VALUES (1212,272,1079,'Reactor_Overheat',4,10.0,2000,1000,4,0,0,0); -- ring form only
INSERT INTO `mob_skill` VALUES (1213,272,1080,'Reactor_Overload',1,8.0,2000,1000,4,0,0,0); -- ring form only

-- Yovra
INSERT INTO `mob_skill` VALUES (1114,271,1022,'Vitriolic_Barrage',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1115,271,1023,'Primal_Drill',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1116,271,1024,'Concussive_Oscillation',1,15.0,2000,1500,4,0,0,7);
INSERT INTO `mob_skill` VALUES (1117,271,1025,'Ion_Shower',1,15.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1118,271,1026,'Torrential_Torment',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1119,271,1027,'Asthenic_Fog',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1120,271,1028,'Luminous_Drape',1,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1121,271,1029,'Fluorescence',0,7.0,2000,1500,1,0,0,0);

-- Aern H2H fam 3 nin mnk
INSERT INTO `mob_skill` VALUES (1122,3,1010,'Wing_Thrust',0,7.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1123,3,1011,'Auroral_Wind',4,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1124,3,1012,'Impact_Stream',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1125,3,1013,'Depuration',0,7.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1126,3,1014,'Crystaline_Cocoon',0,7.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1131,3,1017,'Sideswipe',0,7.0,2000,2000,4,0,0,0);

-- Aern Axe type fam 443 rng war bst
INSERT INTO `mob_skill` VALUES (1122,443,1010,'Wing_Thrust',0,7.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1123,443,1011,'Auroral_Wind',4,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1124,443,1012,'Impact_Stream',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1125,443,1013,'Depuration',0,7.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1126,443,1014,'Crystaline_Cocoon',0,7.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1129,443,1020,'Biotic_Boomerang',1,15.0,2000,2000,4,0,0,0);


-- Aern dagger type blm thief bard
INSERT INTO `mob_skill` VALUES (1122,442,1010,'Wing_Thrust',0,7.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1123,442,1011,'Auroral_Wind',4,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1124,442,1012,'Impact_Stream',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1125,442,1013,'Depuration',0,7.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1126,442,1014,'Crystaline_Cocoon',0,7.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1128,442,1019,'Disseverment',0,7.0,2000,2000,4,0,0,0);

-- Aern sword type rdm pld drk
INSERT INTO `mob_skill` VALUES (1122,441,1010,'Wing_Thrust',0,7.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1123,441,1011,'Auroral_Wind',4,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1124,441,1012,'Impact_Stream',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1125,441,1013,'Depuration',0,7.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1126,441,1014,'Crystaline_Cocoon',0,7.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1127,441,1018,'Glacier_Splitter',0,7.0,2000,2000,4,0,0,0);


-- Aern polearm type sam drg
INSERT INTO `mob_skill` VALUES (1122,440,1010,'Wing_Thrust',0,7.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1123,440,1011,'Auroral_Wind',4,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1124,440,1012,'Impact_Stream',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1125,440,1013,'Depuration',0,7.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1126,440,1014,'Crystaline_Cocoon',0,7.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1130,440,1021,'Medusa_Javelin',0,7.0,2000,1000,4,0,0,0);


-- Aern staff type smn whm
INSERT INTO `mob_skill` VALUES (1122,439,1010,'Wing_Thrust',0,7.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1123,439,1011,'Auroral_Wind',4,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1124,439,1012,'Impact_Stream',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1125,439,1013,'Depuration',0,7.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1126,439,1014,'Crystaline_Cocoon',0,7.0,2000,1000,1,0,0,0);




-- Phuabo
INSERT INTO `mob_skill` VALUES (1097,194,1004,'Aerial_Collision',4,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1101,194,1008,'Tidal_Dive',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1098,194,1005,'Vapor_Spray',4,12.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1099,194,1006,'Spine_Lash',4,12.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1100,194,1007,'Voiceless_Storm',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1102,194,1009,'Plasma_Charge',0,7.0,2000,1000,1,0,0,0);

-- Xzomit
INSERT INTO `mob_skill` VALUES (1091,269,998,'Dual_Strike',0,7.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1092,269,999,'Syphon_Discharge',1,15.0,2000,1000,4,0,0,1);
INSERT INTO `mob_skill` VALUES (1093,269,1000,'Mantle_Pierce',0,7.0,2000,1000,4,0,0,3);
INSERT INTO `mob_skill` VALUES (1094,269,1001,'Ink_Cloud',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1095,269,1002,'Molluscous_Mutation',0,7.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1096,269,1003,'Saline_Coat',4,10.0,2000,1000,4,0,0,0);

-- Hpemde
INSERT INTO `mob_skill` VALUES (1113,144,1027,'Ichor_stream',4,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1112,144,1028,'Rapid_molt',0,7.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1111,144,1031,'Temporal_Shift',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1110,144,1030,'Sinuate_rush',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1109,144,1029,'Tail_thrust',0,7.0,2000,1000,4,0,0,0);

-- Trolls (light-armored model)
-- INSERT INTO `mob_skill` VALUES (1485,246,1230,'Potent_Lunge',0,7.0,2000,1500,4,0,0,3);
-- INSERT INTO `mob_skill` VALUES (1486,246,1231,'Overthrow',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1487,246,1232,'Rock_Smash',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1488,246,1233,'Diamondhide',1,16.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1489,246,1234,'Enervation',1,18.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1490,246,1235,'Quake_Stomp',0,7.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1492,246,1237,'Zarbzan',2,15.0,2000,1500,4,0,0,0); -- Troll ranger only. Gun attack WS.
-- INSERT INTO `mob_skill` VALUES (1493,246,1238,'Healing_Stomp',1,16.0,2000,1500,1,0,0,0); -- NM only

-- Trolls (heavy-armored model)
-- INSERT INTO `mob_skill` VALUES (1638,?,1241,'Potent Lunge',0,7.0,2000,1500,4,0,0,3);
-- INSERT INTO `mob_skill` VALUES (1639,?,1242,'Overthrow',0,7.0,2000,1500,4,0,0,5);
-- INSERT INTO `mob_skill` VALUES (1640,?,1243,'Rock_Smash',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1641,?,1244,'Diamondhide',1,16.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1642,?,1245,'Enervation',1,18.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1643,?,1246,'Quake_Stomp',0,7.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1644,?,1247,'Healing_Stomp',1,16.0,2000,1500,1,0,0,0); -- NM only

-- Trolls (Destroyers [huge warhammer wielders w/ masks])
-- INSERT INTO `mob_skill` VALUES (1819,?,1416,'Overthrow',0,7.0,2000,1500,4,0,0,5);
-- INSERT INTO `mob_skill` VALUES (1820,?,1417,'Rock_Smash',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1821,?,1418,'Diamondhide',1,16.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1822,?,1419,'Enervation',1,18.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1823,?,1420,'Potent Lunge',0,7.0,2000,1500,4,0,0,3);
-- INSERT INTO `mob_skill` VALUES (1824,?,1421,'Quake_Stomp',0,7.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1825,?,1422,'Hammer-Go-Round',1,15.0,2000,1500,4,0,0,5);
-- INSERT INTO `mob_skill` VALUES (1826,?,1423,'Hammerblow',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1827,?,1424,'Drop_Hammer',1,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1828,?,1425,'Seismohammer',0,7.0,2000,1500,4,0,0,0);

-- Automatons (PUP ver.)

-- Harlequin Frame
INSERT INTO `mob_skill` VALUES (1687,363,1306,'Slapstick',0,7.0,2000,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1811,363,1406,'Knockout',0,7.0,2000,0,4,0,145,0);
INSERT INTO `mob_skill` VALUES (2045,363,1488,'Magic_Mortar',0,10.0,2000,0,4,0,225,0);
-- INSERT INTO `mob_skill` VALUES (1689,363,1219,'Provoke',0,7.0,2000,1500,4,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (1691,363,438,'Flashbulb',0,7.0,2000,1500,4,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (1692,363,439,'Mana_Converter',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (1765,363,438,'Eraser',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (1812,363,439,'Economizer',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2489,363,432,'Heat_Capacitor',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2491,363,439,'Disruptor',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2522,363,432,'Reactive_Shield',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2523,363,435,'Shock_Absorber',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2524,363,434,'Replicator',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2683,363,2111,'Mighty_Strikes',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2684,363,2112,'Invincible',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2685,363,2113,'Eagle_Eye_Shot',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2686,363,2114,'Chainspell',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2687,363,2115,'Benediction',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2688,363,2116,'Manafont',0,7.0,2000,1500,1,0,-1,0);

-- Valoredge Frame
-- INSERT INTO `mob_skill` VALUES (1688,364,1307,'Shield_Bash',0,7.0,2000,1500,4,0,-1,0);
INSERT INTO `mob_skill` VALUES (1684,364,1304,'Chimera_Ripper',0,7.0,2000,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1685,364,1305,'String_Clipper',0,7.0,2000,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1809,364,1404,'Cannibal_Blade',0,15.0,2000,0,4,0,150,0);
INSERT INTO `mob_skill` VALUES (2043,364,1486,'Bone_Crusher',0,7.0,2000,0,4,0,245,0);
INSERT INTO `mob_skill` VALUES (2487,364,1509,'String_Shredder',0,7.0,2000,0,4,0,324,0);
-- INSERT INTO `mob_skill` VALUES (1689,364,1219,'Provoke',0,7.0,2000,1500,4,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (1691,364,438,'Flashbulb',0,7.0,2000,1500,4,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (1692,364,439,'Mana_Converter',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (1765,364,438,'Eraser',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (1812,364,439,'Economizer',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2489,364,432,'Heat_Capacitor',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2491,364,439,'Disruptor',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2522,364,432,'Reactive_Shield',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2523,364,435,'Shock_Absorber',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2524,364,434,'Replicator',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2683,364,2111,'Mighty_Strikes',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2684,364,2112,'Invincible',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2685,364,2113,'Eagle_Eye_Shot',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2686,364,2114,'Chainspell',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2687,364,2115,'Benediction',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2688,364,2116,'Manafont',0,7.0,2000,1500,1,0,-1,0);

-- Sharpshot Frame
INSERT INTO `mob_skill` VALUES (1686,365,1303,'Arcuballista',0,15.0,2000,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1810,365,1405,'Daze',0,15.0,2000,0,4,0,150,0);
INSERT INTO `mob_skill` VALUES (2044,365,1487,'Armor_Piercer',0,15.0,2000,0,4,0,245,0);
INSERT INTO `mob_skill` VALUES (2488,365,1510,'Armor_Shatterer',0,7.0,2000,0,4,0,324,0);
-- INSERT INTO `mob_skill` VALUES (1689,365,1219,'Provoke',0,7.0,2000,1500,4,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (1691,365,438,'Flashbulb',0,7.0,2000,1500,4,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (1692,365,439,'Mana_Converter',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (1765,365,438,'Eraser',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (1812,365,439,'Economizer',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2489,365,432,'Heat_Capacitor',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2490,365,16,'Barrage_Turbine',0,25.0,2000,0,4,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2491,365,439,'Disruptor',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2522,365,432,'Reactive_Shield',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2523,365,435,'Shock_Absorber',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2524,365,434,'Replicator',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2683,365,2111,'Mighty_Strikes',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2684,365,2112,'Invincible',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2685,365,2113,'Eagle_Eye_Shot',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2686,365,2114,'Chainspell',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2687,365,2115,'Benediction',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2688,365,2116,'Manafont',0,7.0,2000,1500,1,0,-1,0);

-- Stormwaker Frame
INSERT INTO `mob_skill` VALUES (1687,366,1306,'Slapstick',0,7.0,2000,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1811,366,1406,'Knockout',0,7.0,2000,0,4,0,145,0);
INSERT INTO `mob_skill` VALUES (2045,366,1488,'Magic_Mortar',0,10.0,2000,0,4,0,225,0);
-- INSERT INTO `mob_skill` VALUES (1689,366,1219,'Provoke',0,7.0,2000,1500,4,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (1691,366,438,'Flashbulb',0,7.0,2000,1500,4,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (1692,366,439,'Mana_Converter',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (1765,366,438,'Eraser',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (1812,366,439,'Economizer',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2489,366,432,'Heat_Capacitor',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2491,366,439,'Disruptor',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2522,366,432,'Reactive_Shield',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2523,366,435,'Shock_Absorber',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2524,366,434,'Replicator',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2683,366,2111,'Mighty_Strikes',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2684,366,2112,'Invincible',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2685,366,2113,'Eagle_Eye_Shot',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2686,366,2114,'Chainspell',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2687,366,2115,'Benediction',0,7.0,2000,1500,1,0,-1,0);
-- INSERT INTO `mob_skill` VALUES (2688,366,2116,'Manafont',0,7.0,2000,1500,1,0,-1,0);

-- Lamiae
-- INSERT INTO `mob_skill` VALUES (1496,171,1184,'Gusting_Gouge',0,7.0,2000,1500,4,0,0,0); -- One Hand Weapon Wielding Only. *Needs Script*
INSERT INTO `mob_skill` VALUES (1497,171,1185,'Hysteric_Barrage',0,7.0,2000,1500,4,0,0,0); -- Hand to Hand / Weapon Broken Only.
-- INSERT INTO `mob_skill` VALUES (1673,171,1278,'Pole_Swing',0,7,2000,1500,4,0,0,0); -- Staff Wielding Only. *Needs Script*
-- INSERT INTO `mob_skill` VALUES (1505,171,1192,'Arrow_Deluge',1,15,2000,1500,4,0,0,0); -- Bow Wielding Only. *Needs Script*
-- INSERT INTO `mob_skill` VALUES (1674,171,1279,'Tidal_Slash',4,10,2000,1500,4,0,0,0); -- Polearm Wielding Only. *Needs Script*
-- INSERT INTO `mob_skill` VALUES (1498,171,1188,'Dukkeripen',1,15,2000,2000,4,0,0,0); -- COR Only. AOE Paralyze Version. *Needs Script*
-- INSERT INTO `mob_skill` VALUES (1499,171,?,'Dukkeripen',1,15,2000,2000,4,0,0,0); -- COR Only. ? Version.  *Needs Script*
-- INSERT INTO `mob_skill` VALUES (1500,171,1186,'Dukkeripen',0,7.0,2000,2000,1,0,0,0); -- COR Only. Self-Healing Version.  *Needs Script*
-- INSERT INTO `mob_skill` VALUES (1501,171,?,'Dukkeripen',1,15,2000,2000,4,0,0,0); -- COR Only. ? Version.  *Needs Script*
INSERT INTO `mob_skill` VALUES (1502,182,1190,'Tail_Slap',4,10.0,2000,1500,4,0,0,3);
-- INSERT INTO `mob_skill` VALUES (1503,171,1191,'Hypnotic_Sway',0,10,2000,2000,4,0,0,0);


-- MEDUSA
-- INSERT INTO `mob_skill` VALUES (1557,171,1334,'Calcifying_Deluge',2,15,2000,2000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1558,171,1339,'Gorgon_Dance',1,15,2000,2000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1556,171,1337,'Pinning_Shot',2,15,2000,2000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1553,171,1335,'Shadow_Thrust',0,10,2000,2000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1555,171,1340,'reinforcement',1,15,2000,2000,4,0,0,0);
-- or 1338
-- INSERT INTO `mob_skill` VALUES (1502,171,1336,'Tail_Slap',4,10.0,2000,1500,4,0,0,3);
-- 1340 1341 call for help reinforcement by adds or maybe drawn in. 1338 is an


-- INSERT INTO `mob_skill` VALUES (?,469,1330,'Belly_Dance',0,10,2000,2000,4,0,0,0);  -- Lamia NM only

-- Merrow
INSERT INTO `mob_skill` VALUES (1515,182,1258,'Tail_Slap',4,10.0,2000,1500,4,0,0,3);
-- INSERT INTO `mob_skill` VALUES (1516,182,1259,'Torrent',0,10,2000,2000,4,0,0,0); -- *Needs Script*

-- INSERT INTO `mob_skill` VALUES (1519,?,?,'Rising_Swell',0,10,2000,2000,4,0,0,0);  -- Merrow NM only

-- Poroggos
-- INSERT INTO `mob_skill` VALUES (1701,196,1359,'Frog_Song',0,16.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1702,196,1360,'Magic_Hammer',0,16.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1703,196,1361,'Water_Bomb',1,16.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1704,196,1362,'Frog_Cheer',0,7.0,2000,1500,2,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1705,196,1363,'Providence',0,7.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1706,196,1364,'Frog_Chorus',1,20.0,2000,2000,4,0,0,0); -- NMs only

-- Vampyr
INSERT INTO `mob_skill` VALUES (1850,252,1449,'Bloodrake',0,7.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1851,252,1450,'Decollation',0,7.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1852,252,1451,'Nosferatus_kiss',1,20.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1853,252,1452,'Heliovoid',1,20.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1854,252,1454,'Wings_of_Gehenna',1,20.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1855,252,1454,'Eternal_damnation',4,15.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1856,252,1452,'Nocturnal_Servitude',4,15.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2132,252,1451,'Dirty_breath',4,15.0,2000,1000,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (2278,252,1450,'Minax_glare',4,15.0,2000,1000,4,0,0,0); -- Lord Ruthven,Soaring Strigoi and Shadowbreath only.

-- Dvergar
INSERT INTO `mob_skill` VALUES (1857,90,1456,'Hellsnap',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1858,90,1460,'Hellclap',4,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1859,90,1457,'Cackle',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1860,90,1462,'Necrobane',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1861,90,1461,'Necropurge',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1862,90,1458,'Bilgestorm',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1863,90,1459,'Thundris_shriek',1,15.0,2000,1000,4,0,0,0);

-- Pandemonium Lamps (91)
INSERT INTO `mob_skill` VALUES (1789,91,1373,'PL_Rail_Cannon',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1785,91,1376,'PL_Restoral',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1666,91,1266,'PL_Somersault_Kick',0,7.0,2000,1000,4,0,0,4);
INSERT INTO `mob_skill` VALUES (1667,91,1267,'PL_Firespit',0,30.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1674,91,1279,'PL_Tidal_Slash',4,10,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1502,91,1190,'PL_Tail_Slap',4,10.0,2000,1500,4,0,0,3);
INSERT INTO `mob_skill` VALUES (1503,91,1191,'PL_Hypnotic_Sway',0,10,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1487,91,1232,'PL_Rock_Smash',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1489,91,1234,'PL_Enervation',1,18.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1490,91,1235,'PL_Quake_Stomp',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (389,91,389,'PL_Body_Slam',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (390,91,390,'PL_Heavy_Stomp',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (391,91,391,'PL_Chaos_Blade',4,9.5,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (392,91,392,'PL_Petro_Eyes',4,9.5,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1467,91,1198,'PL_Ill_Wind',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1464,91,1195,'PL_Wind_Shear',1,10.0,2000,1500,4,0,0,7);
INSERT INTO `mob_skill` VALUES (1462,91,1194,'PL_Crosswind',4,10.0,2000,1500,4,0,0,3);
INSERT INTO `mob_skill` VALUES (338,91,880,'PL_Vulcanian_Impact',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (340,91,882,'PL_Hellstorm',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1857,91,1456,'PL_Hellsnap',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1858,91,1460,'PL_Hellclap',4,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1860,91,1462,'PL_Necrobane',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1861,91,1461,'PL_Necropurge',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1863,91,1459,'PL_Thundris_shriek',1,15.0,2000,1000,4,0,0,0);

-- Pandemonium Warden (316)
INSERT INTO `mob_skill` VALUES (1801,316,1401,'PW_Mortal_revolution',1,15.0,2000,1000,4,0,0,1);
INSERT INTO `mob_skill` VALUES (1802,316,1400,'PW_Homing_missile',2,20.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1803,316,1402,'PW_Discoid',4,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1804,316,1403,'PW_Brainjack',0,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1541,316,1147,'PW_Rushing_Slash',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1542,316,1147,'PW_Decussate',1,16.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1543,316,1156,'PW_Tyranic_Blare',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1482,316,1156,'PW_Groundburst',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1557,316,1334,'PW_Calcifying_Deluge',2,15,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1558,316,1339,'PW_Gorgon_Dance',1,15,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1556,316,1337,'PW_Pinning_Shot',2,15,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1553,316,1335,'PW_Shadow_Thrust',0,10,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1546,316,1351,'PW_Sledgehammer',4,12,2000,0,4,0,0,3);
INSERT INTO `mob_skill` VALUES (1547,316,1352,'PW_Head_Snatch',0,7,2000,0,4,0,0,3);
INSERT INTO `mob_skill` VALUES (1548,316,1353,'PW_Haymaker',4,12,2000,0,4,0,0,3);
INSERT INTO `mob_skill` VALUES (1551,316,1356,'PW_Pleiades_Ray',1,10,2000,0,4,0,0,3);
INSERT INTO `mob_skill` VALUES (1529,316,1223,'PW_Lava_Spit',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1531,316,1225,'PW_Scorching_Lash',1,20.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1534,316,1228,'PW_Gates_of_Hades',1,20.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1572,316,1308,'PW_Pyric_Blast',4,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1573,316,1319,'PW_Polar_Bulwark',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1574,316,1309,'PW_Polar_Blast',4,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1575,316,1318,'PW_Pyric_Bulwark',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1579,316,1311,'PW_Serpentine_Tail',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1125,316,1312,'PW_Nerve_Gas',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1769,316,1369,'PW_Dreadstorm',1,13.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1770,316,1381,'PW_Fossilizing_Breath',4,12.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1772,316,1386,'PW_Fulmination',1,40.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1766,316,1367,'PW_Tenebrous_Mist',1,13.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1767,316,1368,'PW_Thunderstrike',1,13.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1768,316,1371,'PW_Tourbillion',1,13.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1857,316,1456,'PW_Hellsnap',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1858,316,1460,'PW_Hellclap',4,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1860,316,1462,'PW_Necrobane',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1861,316,1461,'PW_Necropurge',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1862,316,1458,'PW_Bilgestorm',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1863,316,1459,'PW_Thundris_shriek',1,15.0,2000,1000,4,0,0,0);

-- Peistes
INSERT INTO `mob_skill` VALUES (1896,192,1543,'Aqua_Fortis',1,15,2000,2000,4,0,0,3);
INSERT INTO `mob_skill` VALUES (1897,192,1544,'Regurgitation',0,7.0,2000,1000,4,0,0,3);
INSERT INTO `mob_skill` VALUES (1898,192,1545,'Delta_Thrust',0,7.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1899,192,1546,'Torpefying_Charge',1,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1900,192,1547,'Grim_Glower',4,10.0,2000,1500,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (1901,?,1547,'Calcifiying_Mist',1,15.0,2000,1500,4,0,0,0); -- Only used by certain NMs.

-- Peistes (Sibilus Subspecies)
-- INSERT INTO `mob_skill` VALUES (?,?,?,'Oppressive_Gaze',1,15.0,2000,1500,4,0,0,0); -- Sibilus subspecies only.

-- Gnat
INSERT INTO `mob_skill` VALUES (1902,131,1567,'Insipid_Nip',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1903,131,1568,'Pandemic_Nip',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1904,131,1569,'Bombilation',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1905,131,1570,'Cimicine_Discharge',0,10.0,2000,1000,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (1906,131,1571,'Emetic_Discharge',0,7.0,2000,1000,4,0,0,0); -- Only used by Bloodlapper and Brummbar.

-- Limule
INSERT INTO `mob_skill` VALUES (2308,173,1796,'Blazing_Bound',1,21.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2309,173,1797,'Molting_Burst',0,7.0,2000,1500,4,0,0,0); -- Only used by light-element Ephemeral Limules and Vetehinen

-- Clionid
INSERT INTO `mob_skill` VALUES (2307,65,1795,'Rime_Spray',4,15.0,2000,1500,4,0,0,0); -- ice element only
INSERT INTO `mob_skill` VALUES (2306,65,1794,'Acrid_Stream',4,8.0,2000,1500,4,0,0,0);

-- Murex
INSERT INTO `mob_skill` VALUES (2373,187,1829,'Benthic_Typhoon',4,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2374,187,1830,'Pelagic_Tempest',4,10.0,2000,1500,4,0,0,0); -- used instead of Benthic Typhoon for Thunder-based Ephemeral Murex.

-- Amoebans
INSERT INTO `mob_skill` VALUES (2375,5,1831,'Osmosis',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2376,5,1832,'Vacuole_Discharge',1,15.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2377,5,?,'Nucleic_Implosion',1,15.0,2000,1500,4,0,0,0); -- Only used by earth-element Ephemeral Amoebans.)

-- Hippogryphs -- Need Scripts
-- INSERT INTO `mob_skill` VALUES (324,140,914,'Fantod',0,7,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (323,140,913,'Choke_Breath',4,10,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (322,140,912,'Nihility_Song',1,15,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (320,140,910,'Back_Heel',0,7,2000,1500,4,0,0,2);
-- INSERT INTO `mob_skill` VALUES (2572,140,911,'Jettatura',4,10,2000,3000,4,0,0,0);

-- Hippogryphs (NM) -- Need Scripts
-- INSERT INTO `mob_skill` VALUES (324,141,914,'Fantod',0,7,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (323,141,913,'Choke_Breath',4,10,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (322,141,912,'Nihility_Song',1,15,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (320,141,910,'Back_Heel',0,7,2000,1500,4,0,0,2);
-- INSERT INTO `mob_skill` VALUES (1074,141,910,'Hoof_Volley',0,7,2000,1500,4,0,0,6); -- Only used by NM's and Grauberg S hippos
-- INSERT INTO `mob_skill` VALUES (2572,141,911,'Jettatura',4,10,2000,3000,4,0,0,0);

-- Qiqirn -- Need Scripts
-- INSERT INTO `mob_skill` VALUES (1469,199,1200,'Kibosh',0,7,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1470,199,1201,'Cutpurse',4,10,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1471,199,1202,'Sandspray',4,7,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1472,199,1203,'Faze',0,7,2000,1500,4,0,0,0);

-- Siege Turrets
-- INSERT INTO `mob_skill` VALUES (2038,?,1616,'Basilisk_Cannon',1,?,2000,?,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2039,?,?,'Beaked_Bomber',1,?,2000,?,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2032,?,?,'Heavy_Artillery',1,?,2000,?,4,0,0,0);

-- Acroliths
-- INSERT INTO `mob_skill` VALUES (1814,?,1411,'Dismemberment',0,7.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1815,?,1412,'Dire_straight',0,7.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1816,?,1413,'Earth_shatter',1,15.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1817,?,1414,'Sinker_drill',0,7.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1818,?,1415,'Detonating_grip',0,7.0,2000,1000,4,0,0,0);


-- Gabbrath (check nakual achuka)


-- Apian Beasts


-- Bztavians (check colkhab)



-- Yggdreants (check yumcax)



-- Botuli (check botulus rex)


-- Waktza (check nakual achuka)


-- Corpselights


-- Zilant (check yilbegan)


-- Tubes


-- Elementals
-- INSERT INTO `mob_skill` VALUES (2479,?,?,'Searing_Tempest',1,15.0,2000,1500,4,0,0,0); -- Baelfyr NMs only
-- INSERT INTO `mob_skill` VALUES (2480,?,?,'Blinding_Fulgor',1,15.0,2000,1500,4,0,0,0); -- Baelfyr NMs only

-- Moogles
-- INSERT INTO `mob_skill` VALUES (2207,?,?,'Flowerpot',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2205,?,?,'Mog_Bomb',1,15.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2206,?,?,'Mog_Shrapnel',4,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2211,?,?,'Crystalline_Flare',1,15.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2210,?,?,'Washtub',1,15.0,2000,1500,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (2209,?,?,'Bill_Toss',4,10.0,2000,1500,4,0,0,0); -- Riko Kupenreich only

-- Rafflesia regular mob
-- INSERT INTO `mob_skill` VALUES (1911,?,1553,'Bloody_Caress',0,7.0,2000,1500,4,0,0,0); -- noncharmed vers.?
-- INSERT INTO `mob_skill` VALUES (1910,?,1552,'Floral_Bouquet',1,15.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1909,?,1551,'Rotten_Stench',1,15.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1908,?,1550,'Viscid_Emission',4,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1907,?,1549,'Seedspray',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1912,?,1554,'Bloody_Caress',0,7.0,2000,1500,4,0,0,0); -- charmed vers.?

-- INSERT INTO `mob_skill` VALUES (1913,?,1555,'Soothing_Aroma',0,7.0,2000,1500,4,0,0,0); -- certain nm only

-- Pet Wyvern
-- mob wyverns use custom skill list
INSERT INTO `mob_skill` VALUES (638,193,128,'healing_breath_i',0,10.0,2000,2000,2,0,0,0);
INSERT INTO `mob_skill` VALUES (639,193,129,'healing_breath_ii',0,10.0,2000,2000,2,0,0,0);
INSERT INTO `mob_skill` VALUES (640,193,130,'healing_breath_iii',0,10.0,2000,2000,2,0,0,0);
INSERT INTO `mob_skill` VALUES (641,193,134,'remove_poison',0,10.0,2000,1500,2,0,0,0);
INSERT INTO `mob_skill` VALUES (642,193,132,'remove_blindness',0,10.0,2000,1500,2,0,0,0);
INSERT INTO `mob_skill` VALUES (643,193,133,'remove_paralysis',0,10.0,2000,1500,2,0,0,0);
INSERT INTO `mob_skill` VALUES (644,193,134,'flame_breath',0,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (645,193,135,'frost_breath',0,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (646,193,136,'gust_breath',0,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (647,193,137,'sand_breath',0,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (648,193,138,'lightning_breath',0,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (649,193,139,'hydro_breath',0,10.0,2000,1500,4,0,0,0);

-- --------------------------------------
-- ACP specific mobs
-- --------------------------------------

-- Seed Mandragora
INSERT INTO `mob_skill` VALUES (2154,406,2410,'Demonic_Flower',1,15.0,2000,1500,4,0,0,0);

-- Seed Orc
INSERT INTO `mob_skill` VALUES (349,407,349,'Aerial_Wheel',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (350,407,350,'Shoulder_Attack',0,7.0,2000,1500,4,0,0,1);
INSERT INTO `mob_skill` VALUES (351,407,351,'Slam_Dunk',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (352,407,352,'Arm_Block',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (353,407,353,'Battle_Dance',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (377,407,354,'Howl',1,20.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2155,407,2411,'Phantasmal_Dance',1,15.0,2000,1500,4,0,0,16); -- Wiki says knockback is larger than the skill range.

-- Seed Quadav
INSERT INTO `mob_skill` VALUES (355,408,355,'Ore_Toss',0,10.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (356,408,356,'Head_Butt',0,7.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (357,408,357,'Shell_Bash',0,7.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (358,408,358,'Shell_Guard',0,7.0,2000,3000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (377,408,354,'Howl',1,20.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2156,408,2412,'Thunderous_Yowl',1,20.0,2000,1500,4,0,0,0);

-- Seed Yagudo
INSERT INTO `mob_skill` VALUES (361,409,361,'Feather_Storm',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (362,409,362,'Double_Kick',0,7.0,2000,1500,4,0,0,1);
INSERT INTO `mob_skill` VALUES (363,409,363,'Parry',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (364,409,364,'Sweep',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (377,409,354,'Howl',1,20.0,2000,1500,2,0,0,0);
INSERT INTO `mob_skill` VALUES (2157,409,2413,'Feather_Maelstrom',0,7.0,2000,1500,4,0,0,0);

-- Seed Goblin
INSERT INTO `mob_skill` VALUES (334,410,334,'Goblin_Rush',0,6.0,2000,1500,4,0,0,1);
INSERT INTO `mob_skill` VALUES (335,410,335,'Bomb_Toss',2,8,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2158,410,2414,'Saucepan',4,7.0,2000,1500,4,0,0,0);

-- Seed Crystal
-- melee move 1494
-- INSERT INTO `mob_skill` VALUES (2160,411,1495,'Seed of Deception',0,0.0,0000,0000,0,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2161,411,1496,'Seed of Deference',0,0.0,0000,0000,0,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2162,411,1497,'Seed of Nihility',0,0.0,0000,0000,0,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2163,411,1498,'Seed of Judgment',0,0.0,0000,0000,0,0,0,0);

-- Seed Thrall
-- Family ID: 412
-- Uses players model and equipment, uses weaponskills matching cloned weapontype.

-- --------------------------------------
-- NM / HNM
-- --------------------------------------

-- Zeid + shadows
INSERT INTO `mob_skill` VALUES (723,480,682,'Power_Slash',0,10,2000,500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (724,480,683,'Freeze_Bite',0,10,2000,500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (725,480,684,'GroundStrike',0,10,2000,500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (726,480,671,'Abyssal_Drain',0,10,2000,500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (727,480,672,'Abyssal_strike',0,10,2000,500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (439,480,439,'Blood_Weapon',0,7.0,2000,0,1,2,0,0);

-- zeid 2 phase 2 only
INSERT INTO `mob_skill` VALUES (728,480,708,'Summonshadows',0,10,3000,0,4,0,0,0);

-- Volker
INSERT INTO `mob_skill` VALUES (717,482,679,'red_lotus_blade',0,7,2500,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (718,482,680,'Spirits_Within',0,7,2500,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (719,482,681,'Vorpal_Blade',0,7,2500,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (720,482,673,'Berserk-Ruf',1,15,2000,200,1,0,0,0);

-- Trion
INSERT INTO `mob_skill` VALUES (715,483,669,'Royal_Bash',2,10,2000,500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (716,483,670,'Royal_savior-protect',1,15,2000,200,1,0,0,0);
INSERT INTO `mob_skill` VALUES (712,483,676,'red_lotus_blade',0,7,2500,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (713,483,677,'Flat_blade',0,7,2500,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (714,483,678,'Savage_blade',0,7,2500,1500,4,0,0,0);

-- Ajido Marujido
INSERT INTO `mob_skill` VALUES (714,481,674,'Warp_in',0,7,900,0,1,0,0,0);
INSERT INTO `mob_skill` VALUES (715,481,675,'Warp_out',0,7,900,0,1,0,0,0);



-- Kam'lanaut
INSERT INTO `mob_skill` VALUES (567,351,495,'Fire_Blade',0,7,2000,0,1,0,0,0);
INSERT INTO `mob_skill` VALUES (568,351,496,'Frost_Blade',0,7,2000,0,1,0,0,0);
INSERT INTO `mob_skill` VALUES (569,351,497,'Wind_Blade2',0,7,2000,0,1,0,0,0);
INSERT INTO `mob_skill` VALUES (570,351,498,'Earth_Blade',0,7,2000,0,1,0,0,0);
INSERT INTO `mob_skill` VALUES (571,351,499,'Lightning_Blade',0,7,2000,0,1,0,0,0);
INSERT INTO `mob_skill` VALUES (572,351,500,'Water_Blade',0,7,2000,0,1,0,0,0);
INSERT INTO `mob_skill` VALUES (573,351,501,'Great_Wheel',1,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (574,351,502,'Light_Blade',0,30.0,2000,1500,4,0,0,0);

-- Ark Angel EV
INSERT INTO `mob_skill` VALUES (677,352,635,'Dominion_Slash',2,10,2000,500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (678,352,638,'Shield_Strike',4,7,2000,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (686,352,642,'Spirits_Within',0,7,2000,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (687,352,643,'Vorpal_Blade',0,7,2000,0,4,0,0,0);

-- Ark Angel GK
INSERT INTO `mob_skill` VALUES (681,353,637,'Dragonfall',1,7,2000,500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (690,353,648,'Tachi_Yukikaze',0,7,2000,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (691,353,649,'Tachi_Gekko',0,7,2000,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (692,353,650,'Tachi_Kasha',0,7,2000,0,4,0,0,0);

-- Ark Angel HM
INSERT INTO `mob_skill` VALUES (675,354,633,'Cross_Reaver',4,7,2000,500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (682,354,640,'Circle_Blade',1,7,2000,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (683,354,641,'Swift_Blade',0,7,2000,0,4,0,0,0);

-- Ark Angel MR
INSERT INTO `mob_skill` VALUES (676,355,634,'Havoc_Spiral',1,7,2000,500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (684,355,644,'Rampage',0,7,2000,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (685,355,645,'Calamity',0,7,2000,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (454,355,438,'Charm',0,18.0,2000,0,4,0,0,0);

-- Ark Angel TT
INSERT INTO `mob_skill` VALUES (679,356,636,'Amon_Drive',2,15.0,2000,500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (680,394,639,'Ark_Guardian_Tarutaru',0,22.0,500,0,1,0,0,0);
INSERT INTO `mob_skill` VALUES (688,356,646,'Spinning_Scythe',1,7,2000,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (689,356,647,'Guillotine',0,7,2000,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (706,394,663,'Tarutaru_Warp_II',0,22.0,500,0,1,0,0,0);

-- Cerberuses
INSERT INTO `mob_skill` VALUES (1529,62,1223,'Lava_Spit',1,10.0,2000,1500,4,0,0,0); -- ~400 dmg
INSERT INTO `mob_skill` VALUES (1530,62,1224,'Sulfurous_Breath',0,7.0,2000,1500,4,0,0,0); -- ~500 dmg
INSERT INTO `mob_skill` VALUES (1531,62,1225,'Scorching_Lash',1,20.0,2000,1500,4,0,0,0); -- ~900 dmg
INSERT INTO `mob_skill` VALUES (1532,62,1226,'Ululation',1,20.0,2000,1500,4,0,0,0); -- Paralyze
INSERT INTO `mob_skill` VALUES (1533,62,1227,'Magma_Hoplon',0,7.0,2000,1500,1,0,0,0); -- Stoneskin + Blaze Spike
INSERT INTO `mob_skill` VALUES (1534,62,1228,'Gates_of_Hades',1,20.0,2000,1500,4,0,0,0); -- ~950 dmg + 20hp/tick

-- Cerberuses (Orthrus Subspecies)
-- INSERT INTO `mob_skill` VALUES (1534,62,1228,'Acheron_Flame',1,20.0,2000,1500,4,0,0,0); -- Stronger version of Gates of Hades.

-- Diabolos (Darkness Named)
-- TODO: Need scripts.
-- INSERT INTO `mob_skill` VALUES (1647,35,915,'Camisado',0,7,2000,0,4,0,0,3);
-- INSERT INTO `mob_skill` VALUES (1649,35,916,'Noctoshield',1,7,2000,0,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1650,35,917,'Ultimate_Terror',1,7,2000,0,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1652,35,918,'Nightmare',1,30,2000,0,4,0,0,0);

-- Diabolos (Waking Dreams)
-- TODO: Need scripts.
-- INSERT INTO `mob_skill` VALUES (1647,378,915,'Camisado',0,7,2000,0,4,0,0,3);
-- INSERT INTO `mob_skill` VALUES (1648,378,1126,'Somnolence',0,25,2000,0,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1649,378,916,'Noctoshield',1,7,2000,0,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1650,378,917,'Ultimate_Terror',1,7,2000,0,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1651,378,1127,'Dream_Shroud',1,7,2000,0,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1652,378,918,'Nightmare',1,30,2000,0,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1653,378,1128,'Cacodemonia',1,7,2000,0,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1654,378,1129,'Nether_Blast',0,25,2000,0,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1655,378,1125,'Ruinous_Omen',1,30,2000,0,4,0,0,0);

-- Gurfurlur the Menacing
INSERT INTO `mob_skill` VALUES (1546,326,1351,'Sledgehammer',4,12,2000,0,4,0,0,3);
INSERT INTO `mob_skill` VALUES (1547,326,1352,'Head_Snatch',0,7,2000,0,4,0,0,3);
INSERT INTO `mob_skill` VALUES (1548,326,1353,'Haymaker',4,12,2000,0,4,0,0,3);
INSERT INTO `mob_skill` VALUES (1549,326,1354,'Incessant_Fists',0,7,2000,0,4,0,0,3);
INSERT INTO `mob_skill` VALUES (1550,326,1355,'Arcane_Stomp',1,25,2000,0,1,0,0,3); -- corected ? to 1
INSERT INTO `mob_skill` VALUES (1551,326,1356,'Pleiades_Ray',1,10,2000,0,4,0,0,3);

-- Gulool Ja Ja (Mamool Ja Warrior Type)
-- NOTES: Unsure if his weapon can be broken or not.
-- INSERT INTO `mob_skill` VALUES (1541,?,1147,'Rushing_Slash',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1542,?,?,'Decussate',1,16.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1543,?,?,'Tyranic_Blare',1,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1544,?,?,'Miasma',1,16.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1545,?,?,'Vorpal_Wheel',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1482,?,1156,'Groundburst',0,7.0,2000,1500,4,0,0,0);

-- Hydra
INSERT INTO `mob_skill` VALUES (1572,164,1308,'Pyric_Blast',4,15.0,2000,1500,4,0,0,0); -- Only used when the third head (right) is alive
INSERT INTO `mob_skill` VALUES (1573,164,1319,'Polar_Bulwark',0,7.0,2000,1500,1,0,0,0); -- Only used when the second head (left) is alive
INSERT INTO `mob_skill` VALUES (1574,164,1309,'Polar_Blast',4,15.0,2000,1500,4,0,0,0); -- Only used when the second head (left) is alive
INSERT INTO `mob_skill` VALUES (1575,164,1318,'Pyric_Bulwark',0,7.0,2000,1500,1,0,0,0); -- Only used when the third head (right) is alive
INSERT INTO `mob_skill` VALUES (1576,164,1313,'Barofield',4,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1578,164,1310,'Trembling',1,5.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1579,164,1311,'Serpentine_Tail',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1580,164,1312,'Nerve_Gas',1,10.0,2000,1500,4,0,0,0);

-- Avatar - Odin
-- INSERT INTO `mob_skill` VALUES (2300,41,1444,'Ofnir',1,10.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2301,41,1446,'Valfodr',1,10.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2302,41,1441,'Yggr',1,10.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2303,41,1442,'Gagnrath',1,10.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2304,41,1445,'Sangetall',1,10.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2305,41,1443,'Geirrothr',1,10.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1870,41,1447,'Zantetsuken',1,10.0,2000,1000,4,0,0,0);

-- Khimaira
INSERT INTO `mob_skill` VALUES (1769,168,1369,'Dreadstorm',1,13.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1770,168,1381,'Fossilizing_Breath',4,12.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1772,168,1386,'Fulmination',1,40.0,2000,1500,4,0,0,0); -- only at < 37% strong paralyze
INSERT INTO `mob_skill` VALUES (1771,168,1382,'Plague_Swipe',4,12.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1766,168,1367,'Tenebrous_Mist',1,13.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1767,168,1368,'Thunderstrike',1,13.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1768,168,1371,'Tourbillion',1,13.0,2000,1500,4,0,0,0); -- Need a system to lower wings with crits.  Commented out for now.
-- INSERT INTO `mob_skill` VALUES (2442,168,?,'Lithic_Breath',1,13.0,2000,1500,4,0,0,0);

-- King Vinegaroon
INSERT INTO `mob_skill` VALUES (463,274,94,'Critical_Bite',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (466,274,98,'Venom_Storm',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (467,274,99,'Earthbreaker',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (464,274,95,'Venom_Sting',0,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (97,274,97,'Death_Scissors',0,9.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (98,274,98,'Wild_Rage',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (99,274,99,'Earth_Pounder',1,15.0,2000,1500,4,0,0,0);

-- Ouryu
-- Ochre_Blast_alt is maybe aerial auto attack
-- INSERT INTO `mob_skill` VALUES (1041,259,966,'Ochre_Blast_alt',0,23.0,2000,0,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1042,259,966,'Ochre_Blast_alt',0,18.0,2000,0,4,16,0,0);
INSERT INTO `mob_skill` VALUES (1043,259,653,'Typhoon_Wing',1,30.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1044,259,654,'Spike_Flail',1,23.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1045,259,965,'Geotic_Breath',4,18.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1046,259,656,'Touchdown',1,6.0,2000,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1047,259,967,'Ochre_Blast',1,23.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1048,259,658,'Bai_Wing',1,30.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1049,259,659,'Absolute_Terror',1,18.0,4000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1050,259,660,'Horrid_Roar_3',0,18.0,4000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (438,259,432,'Invincible',0,18.0,2000,0,1,0,30,0);

-- Fafnir
INSERT INTO `mob_skill` VALUES (695,260,653,'Hurricane_Wing',1,30.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (696,260,654,'Spike_Flail',1,23.0,2000,2000,4,0,0,0); -- only if a player is behind fafnir
INSERT INTO `mob_skill` VALUES (697,260,655,'Dragon_Breath',4,18.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (701,260,659,'Absolute_Terror',0,18.0,4000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (702,260,660,'Horrid_Roar_1',0,18.0,4000,1500,4,0,0,0);

-- Cynoprosopi
INSERT INTO `mob_skill` VALUES (695,261,653,'Hurricane_Wing',1,30.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (696,261,654,'Spike_Flail',1,23.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (697,261,655,'Dragon_Breath',4,18.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (702,261,660,'Horrid_Roar_1',0,18.0,4000,1500,4,0,0,0);

-- Wyrm
INSERT INTO `mob_skill` VALUES (695,262,653,'Hurricane_Wing',1,30.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (696,262,654,'Spike_Flail',1,23.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (697,262,655,'Dragon_Breath',4,18.0,2000,1500,4,0,0,0);

-- Nidhogg
INSERT INTO `mob_skill` VALUES (695,263,653,'Hurricane_Wing',1,30.0,2000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (696,263,654,'Spike_Flail',1,23.0,2000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (697,263,655,'Dragon_Breath',4,18.0,2000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (701,263,659,'Absolute_Terror',0,18.0,4000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (702,263,660,'Horrid_Roar_2',0,18.0,4000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (700,263,432,'Super_Buff',0,18.0,2000,0,1,0,0,0);

-- Vrtra
INSERT INTO `mob_skill` VALUES (1053,391,653,'Cyclone_Wing',1,30.0,2000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (1054,391,654,'Spike_Flail',1,23.0,2000,2000,4,8,0,0);
INSERT INTO `mob_skill` VALUES (1055,391,968,'Sable_Breath',4,18.0,2000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (1059,391,659,'Absolute_Terror',0,18.0,4000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (1060,391,660,'Horrid_Roar_3',0,18.0,4000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (454,391,438,'Charm',0,18.0,2000,0,4,0,0,0);

-- Jormungand
-- INSERT INTO `mob_skill` VALUES (1031,392,963,'Sleet_Blast_alt',0,23.0,2000,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1032,392,963,'Sleet_Blast_alt',0,18.0,2000,0,4,16,0,0);
INSERT INTO `mob_skill` VALUES (1033,392,653,'Gregale_Wing',1,30.0,2000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (1034,392,654,'Spike_Flail',1,23.0,2000,2000,4,8,0,0);
INSERT INTO `mob_skill` VALUES (1035,392,962,'Glacial_Breath',4,18.0,2000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (1036,392,656,'Touchdown',1,6.0,2000,0,4,8,0,0);
INSERT INTO `mob_skill` VALUES (1037,392,964,'Sleet_Blast',1,23.0,2000,2000,4,8,0,0);
INSERT INTO `mob_skill` VALUES (1038,392,653,'Gregale_Wing_Air',1,30.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1039,392,659,'Absolute_Terror',0,18.0,4000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (1040,392,660,'Horrid_Roar_3',0,18.0,4000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (439,392,432,'Blood_Weapon',0,18.0,2000,0,1,0,30,0);

-- Tiamat
-- INSERT INTO `mob_skill` VALUES (1021,393,651,'Inferno_Blast_alt',0,23.0,2000,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1022,393,652,'Inferno_Blast_alt',0,18.0,2000,0,4,16,0,0);
INSERT INTO `mob_skill` VALUES (1023,393,653,'Tebbad_Wing',1,30.0,2000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (1024,393,654,'Spike_Flail',1,23.0,2000,2000,4,8,0,0);
INSERT INTO `mob_skill` VALUES (1025,393,655,'Fiery_Breath',4,18.0,2000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (1026,393,656,'Touchdown',1,6.0,2000,0,4,8,0,0);
INSERT INTO `mob_skill` VALUES (1027,393,657,'Inferno_Blast',1,23.0,2000,2000,4,8,0,0);
INSERT INTO `mob_skill` VALUES (1028,393,658,'Tebbad_Wing_Air',1,30.0,2000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (1029,393,659,'Absolute_Terror',0,18.0,2000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (1030,393,660,'Horrid_Roar_3',0,18.0,2000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (432,393,432,'Mighty_Strikes',0,18.0,2000,0,1,0,30,0);

-- Faust
INSERT INTO `mob_skill` VALUES (283,367,283,'Typhoon',1,7.0,2000,1500,4,0,0,1);

-- Despot
INSERT INTO `mob_skill` VALUES (280,368,280,'Panzerfaust',0,7.0,2000,1500,4,0,0,0);

-- --------------------------------------
-- MAAT
-- --------------------------------------

INSERT INTO `mob_skill` VALUES (772,335,729,'Tackle',0,7.0,2000,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (777,335,734,'Dragon_Kick',0,10.0,2000,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (778,335,735,'Asuran_Fists',0,7.0,2000,0,4,0,0,0);

-- --------------------------------------
-- AVATAR
-- --------------------------------------

-- Fenrir
INSERT INTO `mob_skill` VALUES (575,36,513,'moonlit_charge',0,10.0,512,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (576,36,514,'crescent_fang',0,10.0,513,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (577,36,515,'lunar_cry',0,10.0,514,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (578,36,516,'ecliptic_growl',1,10.0,516,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (579,36,517,'lunar_roar',1,10.0,515,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (580,36,518,'eclipse_bite',0,10.0,518,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (581,36,519,'ecliptic_howl',1,10.0,517,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (582,36,550,'lunar_bay',0,10.0,519,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (583,36,521,'howling_moon',1,10.0,520,1500,4,0,0,0);

INSERT INTO `mob_skill` VALUES (577,325,515,'Lunar_Cry',0,10.0,514,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (579,325,517,'Lunar_Roar',1,30.0,515,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (580,325,518,'Eclipse_Bite',0,10.0,518,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (583,325,521,'Howling_Moon',1,30.0,520,1500,4,0,0,0);

-- Pet - Fenrir
INSERT INTO `mob_skill` VALUES (575,381,16,'moonlit_charge',0,10.0,512,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (576,381,17,'crescent_fang',0,10.0,513,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (577,381,18,'lunar_cry',0,10.0,514,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (578,381,19,'ecliptic_growl',1,10.0,516,3000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (579,381,20,'lunar_roar',1,10.0,515,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (580,381,21,'eclipse_bite',0,10.0,518,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (581,381,22,'ecliptic_howl',1,10.0,517,3000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (583,381,24,'howling_moon',1,10.0,520,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (582,381,25,'lunar_bay',0,10.0,519,3000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (582,381,25,'heavenward_howl',0,10.0,519,3000,4,0,0,0);

-- Ifrit
INSERT INTO `mob_skill` VALUES (584,38,526,'punch',0,10.0,528,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (585,38,527,'fire_ii',0,10.0,529,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (586,38,528,'burning_strike',0,10.0,530,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (587,38,529,'double_punch',0,10.0,531,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (588,38,530,'crimson_howl',1,10.0,532,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (589,38,531,'fire_iv',0,10.0,533,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (590,38,532,'flaming_crush',0,10.0,534,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (591,38,533,'meteor_strike',0,10.0,535,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (592,38,534,'inferno',1,10.0,536,1500,4,0,0,0);

INSERT INTO `mob_skill` VALUES (589,322,531,'Fire_IV',0,10.0,533,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (590,322,532,'Flaming_Crush',0,10.0,534,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (591,322,533,'Meteor_Strike',0,10.0,535,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (592,322,534,'Inferno',1,10.0,536,1500,4,0,0,0);

-- Pet - Ifrit
INSERT INTO `mob_skill` VALUES (584,383,32,'punch',0,10.0,528,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (585,383,33,'fire_ii',0,10.0,529,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (586,383,34,'burning_strike',0,10.0,530,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (587,383,35,'double_punch',0,10.0,531,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (588,383,36,'crimson_howl',1,10.0,532,3000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (589,383,37,'fire_iv',0,10.0,533,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (590,383,38,'flaming_crush',0,10.0,534,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (591,383,39,'meteor_strike',0,10.0,535,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (592,383,40,'inferno',1,10.0,536,3000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (592,383,41,'inferno_howl',1,10.0,536,3000,4,0,0,0);

-- Titan
INSERT INTO `mob_skill` VALUES (593,45,539,'rock_throw',0,12.0,544,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (594,45,540,'stone_ii',0,10.0,545,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (595,45,541,'rock_buster',0,10.0,546,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (596,45,542,'megalith_throw',0,17.0,547,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (597,45,543,'earthen_ward',1,10.0,548,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (598,45,544,'stone_iv',0,10.0,549,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (599,45,545,'mountain_buster',0,10.0,550,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (600,45,546,'geocrush',0,10.0,551,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (601,45,547,'earthen_fury',1,10.0,552,1500,4,0,0,0);

INSERT INTO `mob_skill` VALUES (597,321,543,'Earthen_Ward',1,10.0,548,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (598,321,544,'Stone_IV',0,10.0,549,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (599,321,545,'Mountain_Buster',0,10.0,550,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (600,321,546,'Geocrush',0,10.0,551,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (601,321,547,'Earthen_Fury',1,10.0,552,1500,4,0,0,0);

-- Pet - Titan
INSERT INTO `mob_skill` VALUES (593,388,48,'rock_throw',0,12.0,544,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (594,388,49,'stone_ii',0,10.0,545,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (595,388,50,'rock_buster',0,10.0,546,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (596,388,51,'megalith_throw',0,17.0,547,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (597,388,52,'earthen_ward',1,10.0,548,3000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (598,388,53,'stone_iv',0,10.0,549,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (599,388,54,'mountain_buster',0,10.0,550,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (600,388,55,'geocrush',0,10.0,551,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (601,388,56,'earthen_fury',1,10.0,552,3000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (601,388,57,'earthen_armor',1,10.0,552,3000,4,0,0,0);

-- Leviathan
INSERT INTO `mob_skill` VALUES (602,40,552,'barracuda_dive',0,10.0,560,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (603,40,553,'water_ii',0,10.0,561,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (604,40,554,'tail_whip',0,10.0,562,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (605,40,555,'spring_water',1,10.0,563,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (606,40,556,'slowga',1,10.0,564,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (607,40,557,'water_iv',0,20.0,565,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (608,40,558,'spinning_dive',0,10.0,566,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (609,40,559,'grand_fall',0,10.0,567,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (610,40,560,'tidal_wave',1,20.0,568,1500,4,0,0,0);

INSERT INTO `mob_skill` VALUES (605,323,555,'Spring_Water',1,10.0,563,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (607,323,557,'Water_IV',0,20.0,565,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (608,323,558,'Spinning_Dive',0,10.0,566,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (609,323,559,'Grand_Fall',0,10.0,567,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (610,323,560,'Tidal_Wave',1,20.0,568,1500,4,0,0,0);

-- Pet - Leviathan
INSERT INTO `mob_skill` VALUES (602,384,64,'barracuda_dive',0,10.0,560,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (603,384,65,'water_ii',0,10.0,561,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (604,384,66,'tail_whip',0,10.0,562,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (605,384,67,'spring_water',1,10.0,563,3000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (606,384,68,'slowga',1,10.0,564,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (607,384,69,'water_iv',0,20.0,565,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (608,384,70,'spinning_dive',0,10.0,566,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (609,384,71,'grand_fall',0,10.0,567,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (610,384,72,'tidal_wave',1,20.0,568,3000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (610,384,73,'tidal_roar',1,20.0,568,3000,4,0,0,0);

-- Garuda
INSERT INTO `mob_skill` VALUES (611,37,565,'claw',0,10.0,576,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (612,37,566,'aero_ii',0,10.0,577,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (613,37,569,'whispering_wind',1,10.0,578,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (614,37,568,'hastega',1,10.0,579,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (615,37,567,'aerial_armor',1,10.0,580,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (616,37,570,'aero_iv',0,10.0,581,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (617,37,571,'predator_claws',0,10.0,582,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (618,37,572,'wind_blade',0,10.0,583,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (619,37,573,'aerial_blast',1,10.0,584,1500,4,0,0,0);

INSERT INTO `mob_skill` VALUES (616,324,570,'Aero_IV',0,10.0,581,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (617,324,571,'Predator_Claws',0,10.0,582,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (618,324,572,'Wind_Blade',0,10.0,583,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (619,324,573,'Aerial_Blast',1,10.0,584,1500,4,0,0,0);

-- Pet - Garuda
INSERT INTO `mob_skill` VALUES (611,382,80,'claw',0,10.0,576,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (612,382,81,'aero_ii',0,10.0,577,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (613,382,82,'whispering_wind',1,10.0,578,3000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (614,382,83,'hastega',1,10.0,579,3000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (615,382,84,'aerial_armor',1,10.0,580,3000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (616,382,85,'aero_iv',0,10.0,581,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (617,382,86,'predator_claws',0,10.0,582,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (618,382,87,'wind_blade',0,10.0,583,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (619,382,88,'aerial_blast',1,10.0,584,3000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (619,382,89,'fleet_wind',1,10.0,584,3000,4,0,0,0);

-- Shiva
INSERT INTO `mob_skill` VALUES (620,44,578,'axe_kick',0,10.0,592,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (621,44,579,'blizzard_ii',0,10.0,593,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (622,44,580,'frost_armor',1,10.0,594,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (623,44,581,'sleepga',1,10.0,595,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (624,44,582,'double_slap',0,10.0,596,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (625,44,583,'blizzard_iv',0,10.0,597,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (626,44,584,'rush',0,10.0,598,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (627,44,585,'heavenly_strike',0,10.0,599,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (628,44,586,'diamond_dust',1,10.0,600,1500,4,0,0,0);

INSERT INTO `mob_skill` VALUES (625,319,583,'Blizzard_IV',0,10.0,597,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (626,319,584,'Rush',0,10.0,598,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (627,319,585,'Heavenly_Strike',0,10.0,599,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (628,319,586,'Diamond_Dust',1,10.0,600,1500,4,0,0,0);

-- Pet - Shiva
INSERT INTO `mob_skill` VALUES (620,387,96,'axe_kick',0,10.0,592,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (621,387,97,'blizzard_ii',0,10.0,593,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (622,387,98,'frost_armor',1,10.0,594,3000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (623,387,99,'sleepga',1,10.0,595,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (624,387,100,'double_slap',0,10.0,596,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (625,387,101,'blizzard_iv',0,10.0,597,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (626,387,102,'rush',0,10.0,598,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (627,387,103,'heavenly_strike',0,10.0,599,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (628,387,104,'diamond_dust',1,10.0,600,3000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (628,387,105,'diamond_storm',1,10.0,600,3000,4,0,0,0);

-- Ramuh
INSERT INTO `mob_skill` VALUES (629,43,591,'shock_strike',0,10.0,608,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (630,43,592,'thunder_ii',0,10.0,609,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (631,43,593,'rolling_thunder',1,10.0,610,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (632,43,594,'thunderspark',1,10.0,611,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (633,43,595,'lightning_armor',1,10.0,612,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (634,43,596,'thunder_iv',0,10.0,613,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (635,43,597,'chaotic_strike',0,10.0,614,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (636,43,598,'thunderstorm',0,10.0,615,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (637,43,599,'judgment_bolt',1,10.0,616,1500,4,0,0,0);

INSERT INTO `mob_skill` VALUES (634,320,596,'Thunder_IV',0,10.0,613,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (635,320,597,'Chaotic_Strike',0,10.0,614,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (636,320,598,'Thunderstorm',0,10.0,615,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (637,320,599,'Judgment_Bolt',1,10.0,616,1500,4,0,0,0);

-- Pet - Ramuh
INSERT INTO `mob_skill` VALUES (629,386,112,'shock_strike',0,10.0,608,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (630,386,113,'thunder_ii',0,10.0,609,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (631,386,114,'rolling_thunder',1,10.0,610,3000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (632,386,115,'thunderspark',1,10.0,611,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (633,386,116,'lightning_armor',1,10.0,612,3000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (634,386,117,'thunder_iv',0,10.0,613,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (635,386,118,'chaotic_strike',0,10.0,614,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (636,386,119,'thunderstorm',0,10.0,615,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (637,386,120,'judgment_bolt',1,10.0,616,3000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (637,386,121,'shock_squall',1,10.0,616,500,4,0,0,0);

-- Carbuncle
INSERT INTO `mob_skill` VALUES (650,34,605,'healing_ruby',0,10.0,496,1500,2,0,0,0);
INSERT INTO `mob_skill` VALUES (651,34,606,'poison_nails',0,10.0,497,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (652,34,607,'shining_ruby',1,10.0,498,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (653,34,608,'glittering_ruby',1,10.0,499,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (654,34,609,'meteorite',0,10.0,500,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (655,34,610,'healing_ruby_ii',1,10.0,501,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (656,34,611,'searing_light',1,10.0,502,1500,4,0,0,0);

-- Pet Carbuncle
INSERT INTO `mob_skill` VALUES (650,379,0,'healing_ruby',0,10.0,496,3000,2,0,0,0);
INSERT INTO `mob_skill` VALUES (651,379,1,'poison_nails',0,10.0,497,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (652,379,2,'shining_ruby',1,10.0,498,3000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (653,379,3,'glittering_ruby',1,10.0,499,3000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (654,379,4,'meteorite',0,10.0,500,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (655,379,5,'healing_ruby_ii',1,10.0,501,3000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (656,379,6,'searing_light',1,10.0,502,3000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (656,379,7,'holy_mist',1,10.0,503,3000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (656,379,8,'soothing_ruby',1,10.0,504,3000,4,0,0,0);

-- Pet - Diabolos
INSERT INTO `mob_skill` VALUES (1647,380,141,'Camisado',0,7,2000,3000,4,0,0,3);
INSERT INTO `mob_skill` VALUES (1648,380,142,'Somnolence',0,25,2000,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1649,380,143,'Noctoshield',1,7,2000,3000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1650,380,144,'Ultimate_Terror',1,7,2000,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1651,380,145,'Dream_Shroud',1,7,2000,3000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1652,380,146,'Nightmare',1,30,2000,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1654,380,148,'Nether_Blast',0,25,2000,3000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1655,380,149,'Ruinous_Omen',1,30,2000,3000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1655,380,324,'Pavor_Nocturnus',0,30,2000,3000,4,0,0,0);

-- Pet - Odin
INSERT INTO `mob_skill` VALUES (1870,385,151,'Zantetsuken',4,10.0,2000,1000,4,0,0,0);

-- Pet - Alexander
INSERT INTO `mob_skill` VALUES (1887,389,152,'Perfect_defense',1,18.0,2000,1000,1,0,0,0);

-- Soulflayers
INSERT INTO `mob_skill` VALUES (1707,233,1327,'Mind_Blast',4,10.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1708,233,1328,'Immortal_Mind',0,7.0,2000,1000,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1709,233,1329,'Immortal_Shield',0,7.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1710,233,1330,'Mind_Purge',0,7.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1711,233,1331,'Tribulation',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1712,233,1332,'Immortal_Anathema',1,15.0,2000,1000,4,0,0,0);

-- Orobons
INSERT INTO `mob_skill` VALUES (1439,191,1166,'Hypnic_Lamp',1,16.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1438,191,1165,'Vile_Belch',1,16.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1441,191,1168,'Seaspray',4,12.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1440,191,1167,'Seismic_Tail',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1437,191,1164,'Gnash',0,7.0,2000,1000,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (1442,?,1169,'Leeching_Current',1,15.0,2000,1000,4,0,0,0); -- Certain NM only
-- INSERT INTO `mob_skill` VALUES (1721,?,0,'Deathgnash',0,7.0,2000,1000,4,0,0,0); -- Certain NM only
-- INSERT INTO `mob_skill` VALUES (1722,?,0,'Abominable_Belch',1,18.0,2000,1000,4,0,0,0); -- Certain NM only
-- INSERT INTO `mob_skill` VALUES (2383,?,0,'Mayhem_Lantern',1,18.0,2000,1000,4,0,0,0); -- Certain NM only

-- --------------------------------------
-- ZNM
-- --------------------------------------

-- Vulpangue (286)
-- INSERT INTO `mob_skill` VALUES (1468,286,0,'White_Wind',0,20.0,2000,1500,2,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1467,286,0,'Ill_Wind',1,18.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1466,286,1197,'Zephyr_Mantle',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1465,286,1196,'Obfuscate',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1464,286,1195,'Wind_Shear',1,10.0,2000,1500,4,0,0,7);
INSERT INTO `mob_skill` VALUES (1462,286,1194,'Crosswind',4,18.0,2000,1500,4,0,0,3);

-- Chamrosh (287)
INSERT INTO `mob_skill` VALUES (1445,287,1178,'Feather_Tickle',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1444,287,1177,'Snatch_Morsel',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1443,287,1176,'Pecking_Flurry',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1446,287,1177,'Wisecrack',1,10.0,2000,1500,4,0,0,0);

-- Cheese Hoarder Gigiroon (288) - Qiqirn
-- INSERT INTO `mob_skill` VALUES (1469,288,1200,'Kibosh',0,7,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1470,199,1201,'Cutpurse',4,10,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1471,288,1202,'Sandspray',4,7,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1472,288,1203,'Faze',0,7,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1474,288,1203,'Deadeye',1,18,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2103,288,1200,'Strap_Cutter',0,7,2000,1500,4,0,0,0);

-- Brass Borer (289)
-- INSERT INTO `mob_skill` VALUES (1559,289,1290,'Amber_scutum',0,10.0,2000,1000,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1560,289,1291,'Vitriolic_spray',4,10.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1561,289,1292,'Thermal_Pulse',1,15.0,2000,1000,4,0,0,0); -- Open form only
-- INSERT INTO `mob_skill` VALUES (1562,289,1293,'Cannonball',0,7.0,2000,1000,4,0,0,0); -- Curled form only
-- INSERT INTO `mob_skill` VALUES (1563,289,1294,'Heat_barrier',0,7.0,2000,1000,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1564,289,1295,'Vitriolic_shower',4,10.0,2000,1000,4,0,0,0);

-- Claret (290)
INSERT INTO `mob_skill` VALUES (176,290,176,'Fluid_Toss',0,18.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (175,290,175,'Fluid_Spread',1,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (177,290,176,'Digest',0,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1061,290,175,'Mucus_Spread',1,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1063,290,175,'Epoxy_Spread',1,10.0,2000,1500,4,0,0,0);

-- Ob (291)

-- Velionis (292)
INSERT INTO `mob_skill` VALUES (222,292,222,'Hell_Slash',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (223,292,223,'Horror_Cloud',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (228,292,228,'Black_Cloud',1,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (229,292,229,'Blood_Saber',1,15.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1539,292,222,'Malediction',1,15.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (900,292,229,'Marrow Drain',0,7.0,2000,1500,4,0,0,0); -- Yes?  No?
-- INSERT INTO `mob_skill` VALUES (0,292,228,'Dereliction',1,20.0,2000,1500,4,0,0,0); -- Yes?  No?

-- Lil'Apkallu (294)
-- INSERT INTO `mob_skill` VALUES (1460,294,1162,'Frigid_Shuffle',1,18.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1459,294,1161,'Beak_Lunge',0,7.0,2000,1500,4,0,0,5);
INSERT INTO `mob_skill` VALUES (1457,294,1159,'Yawn',1,18.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1458,294,1160,'Wing_Slap',0,7.0,2000,1500,4,0,0,0);

-- Iriz Ima (295)
INSERT INTO `mob_skill` VALUES (1447,295,1170,'Barrier_Tusk',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1451,295,1174,'Voracious_Trunk',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1450,295,1173,'Flailing_Trunk',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1449,295,1172,'Stampede',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1448,295,1171,'Onrush',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1452,295,1175,'Proboscis_Shower',0,7.0,2000,1500,2,0,0,0);

-- Lividroot Amooshah (296)
INSERT INTO `mob_skill` VALUES (60,296,60,'Impale',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (61,296,61,'Vampiric_Lash',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (62,296,62,'Vampiric_Root',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (63,296,63,'Bad_Breath',4,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (64,296,64,'Sweet_Breath',4,15.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1076,296,63,'Extremely_Bad_Breath',4,7.0,2000,1500,4,0,0,0);

-- Iriri Samariri (297)
INSERT INTO `mob_skill` VALUES (1703,297,1361,'Water_Bomb',1,16.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1702,297,1360,'Magic_Hammer',0,16.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1704,297,1361,'Frog_Cheer',0,7.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1706,295,1361,'Frog_Chorus',1,16.0,2000,1500,4,0,0,0);

-- Anantaboga (298)
INSERT INTO `mob_skill` VALUES (388,298,388,'Wind_Breath',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (389,298,389,'Body_Slam',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (390,298,390,'Heavy_Stomp',1,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (0,298,0,'Chaos_Blade',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (0,298,0,'Petro_Eyes',0,7.0,2000,1500,4,0,0,0);

-- Dextrose (299)
-- INSERT INTO `mob_skill` VALUES (1565,299,1283,'Amplification',0,7.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1566,299,1284,'Boiling_Point',4,16.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1570,299,1288,'Synergism',1,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1567,299,1285,'Xenoglossia',0,7.0,2000,1500,1,0,0,0);

-- Reacton (300)
INSERT INTO `mob_skill` VALUES (253,300,253,'Self-Destruct',1,20.0,2000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (254,300,254,'Berserk',0,7.0,2000,1500,1,0,0,0);

-- Verdelet (301)
INSERT INTO `mob_skill` VALUES (1455,301,1180,'Frenetic_Rip',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1453,301,1181,'Abrasive_Tantara',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1454,301,1182,'Deafening_Tantara',1,10.0,2000,1500,4,0,0,0);

-- Wulgaru (302)
INSERT INTO `mob_skill` VALUES (1814,302,1411,'Dismemberment',0,7.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1815,302,1412,'Dire_straight',0,7.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1816,302,1413,'Earth_shatter',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1817,302,1414,'Sinker_drill',0,7.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1818,302,1415,'Detonating_grip',0,7.0,2000,1000,4,0,0,0);

-- Zareehkl the Jubilant (303)
INSERT INTO `mob_skill` VALUES (1522,303,1205,'Spinal_Cleave',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1523,303,1206,'Mangle',4,16.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1524,303,1207,'Leaping_Cleave',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1525,303,1208,'Hex_Palm',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1526,303,1209,'Animating_Wail',0,7.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1527,303,1210,'Fortifying_Wail',0,7.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1528,303,1211,'Unblest_Jambiya',1,15.0,2000,1500,4,0,0,0);

-- Armed Gears (304)
-- INSERT INTO `mob_skill` VALUES (1791,304,1388,'Antigravity',1,15.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1787,304,1390,'Artificial_Gravity',1,15.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1789,304,1373,'Rail_Cannon',1,15.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1785,304,1376,'Restoral',0,7.0,2000,1500,2,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1808,304,1372,'Heavy_Armature',0,7.0,2000,1500,1,0,0,0); -- Armed Gears only

-- Gotoh Zha the Redolent (305) -- Mamool Ja Sage Type
-- INSERT INTO `mob_skill` VALUES (1664,305,1264,'Rushing_Drub',0,7.0,2000,1500,4,0,0,0); -- Staff Wielders Only.
INSERT INTO `mob_skill` VALUES (1665,305,1265,'Forceful_Blow',0,7.0,2000,1000,4,0,0,0); -- Hand to Hand Only.
INSERT INTO `mob_skill` VALUES (1666,305,1266,'Somersault_Kick',0,7.0,2000,1000,4,0,0,4);
INSERT INTO `mob_skill` VALUES (1667,305,1267,'Firespit',0,30.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1668,305,1268,'Warm-Up',0,7.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1669,305,1269,'Stave_Toss',0,7.0,2000,1000,1,0,0,0); -- Linked with Staff
-- INSERT INTO `mob_skill` VALUES (1670,305,1270,'Groundburst',1,16.0,2000,1500,4,0,0,0);

-- Dea (306)

-- Achamoth (307)

-- Khromasoul Bhurborlor (308)
INSERT INTO `mob_skill` VALUES (1487,308,1232,'Rock_Smash',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1488,308,1233,'Diamondhide',1,16.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1489,308,1234,'Enervation',1,18.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1490,308,1235,'Quake_Stomp',0,7.0,2000,1500,1,0,0,0);

-- Nosferatu (309)
INSERT INTO `mob_skill` VALUES (1850,309,1450,'Bloodrake',0,6.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1851,309,1451,'Decollation',0,6.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1852,309,1452,'Nosferatus_Kiss',0,6.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1853,309,1453,'Heliovoid',0,6.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1854,309,1454,'Wings_of_Gehenna',0,6.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1855,309,1455,'Eternal_Damnation',0,6.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1856,309,0,'Nocturnal_Servitude',0,6.0,2000,1000,4,0,0,0);

-- Experimental Lamia (310)
INSERT INTO `mob_skill` VALUES (1497,310,1185,'Hysteric_Barrage',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1502,310,1190,'Tail_Slap',4,10.0,2000,1500,4,0,0,3);

-- Mahjlaef the Paintorn (311)
INSERT INTO `mob_skill` VALUES (1707,311,1327,'Mind_Blast',4,10.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1708,311,1328,'Immortal_Mind',0,7.0,2000,1000,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1709,311,1329,'Immortal_Shield',0,7.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1710,311,1330,'Mind_Purge',0,7.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1711,311,1331,'Tribulation',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1712,311,1332,'Immortal_Anathema',1,15.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (0,311,0,'Reprobation',1,18.0,2000,1500,4,0,0,0); -- Only by NM

-- Nuhn (312)
-- INSERT INTO `mob_skill` VALUES (1439,312,1166,'Hypnic_Lamp',1,16.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1438,312,1165,'Vile_Belch',1,16.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1441,312,1168,'Seaspray',4,16.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1440,312,1167,'Seismic_Tail',1,18.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1437,312,1164,'Gnash',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1442,312,1166,'Leeching_Current',1,18.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1721,312,1164,'Deathgnash',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1722,312,1165,'Abominable_Belch',1,18.0,2000,1500,4,0,0,0);

-- Tinnin (313)
INSERT INTO `mob_skill` VALUES (1572,313,1308,'Pyric_Blast',4,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1573,313,1319,'Polar_Bulwark',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1574,313,1309,'Polar_Blast',4,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1575,313,1318,'Pyric_Bulwark',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1576,313,1313,'Barofield',4,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1578,313,1310,'Trembling',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1579,313,1311,'Serpentine_Tail',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1580,313,1312,'Nerve_Gas',1,10.0,2000,1500,4,0,0,0);

-- Sarameya (314)
INSERT INTO `mob_skill` VALUES (1529,314,1223,'Lava_Spit',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1530,314,1224,'Sulfurous_Breath',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1531,314,1225,'Scorching_Lash',1,20.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1532,314,1226,'Ululation',1,20.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1533,314,1227,'Magma_Hoplon',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1534,314,1228,'Gates_of_Hades',1,20.0,2000,1500,4,0,0,0);

-- Tyger (315)
INSERT INTO `mob_skill` VALUES (1769,315,1369,'Dreadstorm',1,18.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1770,315,1381,'Fossilizing_Breath',4,16.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1772,315,1386,'Fulmination',1,32.0,2000,1500,4,0,0,0); -- only at < 50% strong paralyze
INSERT INTO `mob_skill` VALUES (1771,315,1382,'Plague_Swipe',4,16.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1766,315,1367,'Tenebrous_Mist',1,18.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1767,315,1368,'Thunderstrike',1,18.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1768,315,1371,'Tourbillion',1,18.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (432,315,432,'Mighty_Strikes',0,7.0,2000,0,1,2,0,0);

-- Shinryu (316)
-- Wings out
INSERT INTO `mob_skill` VALUES (2394,475,1861,'Shinryu_Attack_Right',0,7.0,3000,2000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2395,475,1862,'Shinryu_Attack_Left',0,7.0,3000,2000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2396,475,1863,'Shinryu_Attack_Right_2',0,7.0,3000,2000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2397,475,1864,'Shinryu_Attack_Left_2',0,7.0,3000,2000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2398,475,1865,'Shinryu_Attack_Tail_1',0,7.0,3000,2000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2399,475,1866,'Shinryu_Attack_Tail_2',0,7.0,3000,2000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2400,475,1867,'Shinryu_Attack_Tail_Stun',0,7.0,3000,2000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2408,475,1868,'Cosmic_Breath',4,15.0,4000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2409,475,1869,'Cataclysmic_Vortex',1,15.0,4000,5000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2411,475,1870,'Mighty_Guard',0,7.0,3000,2000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2412,475,1871,'Atomic_ray',1,20.0,4000,1500,4,0,0,0); -- 66% and below
INSERT INTO `mob_skill` VALUES (2414,475,1872,'Protostar',1,20.0,5000,3500,4,0,0,0); -- 33% and below

-- Wings in
INSERT INTO `mob_skill` VALUES (2401,475,1873,'Shinryu_Attack_Right',0,7.0,3000,2000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2402,475,1874,'Shinryu_Attack_Left',0,7.0,3000,2000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2403,475,1875,'Shinryu_Attack_Right_2',0,7.0,3000,2000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2404,475,1876,'Shinryu_Attack_Left_2',0,7.0,3000,2000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2405,475,1877,'Shinryu_Attack_Tail_1',0,7.0,3000,2000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2406,475,1878,'Shinryu_Attack_Tail_2',0,7.0,3000,2000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2407,475,1879,'Shinryu_Attack_Tail_Stun',0,7.0,3000,2000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2452,475,1880,'Cosmic_Breath',4,15.0,4000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2453,475,1881,'Cataclysmic_Vortex',1,15.0,4000,5000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2410,475,1882,'Gyre_Charge',1,15.0,4000,2000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2413,475,1883,'Darkmatter',1,20.0,4000,1500,4,0,0,0); -- 66% and below
INSERT INTO `mob_skill` VALUES (2415,475,1884,'Supernova',1,20.0,5000,3500,4,0,0,0); -- 33% and below

-- Absoulute Virtue  (329)
INSERT INTO `mob_skill` VALUES (1128,329,1019,'Disseverment',0,7.0,2000,1500,4,0,0,0); -- Should not have it.  Leaving in for variety,for now.
INSERT INTO `mob_skill` VALUES (1127,329,1018,'Glacier_Splitter',0,7.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1126,329,1014,'Crystaline_Cocoon',0,6.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1125,329,1013,'Depuration',0,6.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1130,329,1021,'Medusa_Javelin',0,6.0,2000,1500,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1124,329,1016,'Impact_Stream',1,10.0,2000,1500,12,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1123,329,1011,'Auroral_Wind',1,10.0,2000,1500,12,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1122,329,1020,'Wing_Thrust',1,10.0,2000,1500,12,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1121,329,0,'Fluorescence',0,6.0,2000,1500,4,0,0,0);

-- exoplates
INSERT INTO `mob_skill` VALUES (734,236,691,'Gaea_Stream_Eta',0,15.0,4000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (735,236,692,'Uranos_Cascade_Eta',2,15.0,4000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (736,236,693,'Cronos_Sling_Eta',4,15.0,4000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (737,236,694,'Phase_Shift_1',1,30.0,5000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (738,236,695,'Gaea_Stream_Theta',0,15.0,4000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (739,236,696,'Uranos_Cascade_Theta',2,15.0,4000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (740,236,697,'Cronos_Sling_Theta',4,15.0,4000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (741,236,698,'Phase_Shift_2',1,30.0,5000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (742,236,699,'Gaea_Stream_Lambda',0,15.0,4000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (743,236,700,'Uranos_Cascade_Lambda',2,15.0,4000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (744,236,701,'Cronos_Sling_Lambda',4,15.0,4000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (745,236,702,'Phase_Shift_3',1,30.0,5000,1500,4,0,0,0);

-- eald narche
INSERT INTO `mob_skill` VALUES (729,394,686,'Stellar_burst',2,7.0,5000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (730,394,687,'Vortex',2,20.0,5000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (750,394,707,'Omega_javelin',0,15.0,4000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (732,394,689,'Eald2_Warp_In',0,22.0,500,0,1,0,0,0);
INSERT INTO `mob_skill` VALUES (733,394,690,'Eald2_Warp_Out',0,22.0,500,0,1,0,0,0);

-- Avatar Ixon
-- INSERT INTO `mob_skill` VALUES (2078,39,1612,'Wrath_of_Zeus',1,10.0,2000,1500,12,0,0,0);

-- -------------------------------------------------------------------------------
-- NOTE: all skills below are special skill lists given to NMs / special families
-- -------------------------------------------------------------------------------

-- Demonic_Tiphia
INSERT INTO `mob_skill` VALUES (80,700,80,'Final_Sting',0,7.0,2000,1500,4,0,35,0);
INSERT INTO `mob_skill` VALUES (79,700,79,'Pollen',0,7.0,2000,1500,1,0,40,0);
INSERT INTO `mob_skill` VALUES (78,700,78,'Sharp_Sting',0,10.0,2000,1500,4,0,0,0);

-- Cactrot_Rapido
INSERT INTO `mob_skill` VALUES (68,703,68,'Photosynthesis',0,7.0,2000,1500,1,0,0,0); -- daytime only
INSERT INTO `mob_skill` VALUES (66,703,66,'1000_Needles',1,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (65,703,65,'Needleshot',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (864,703,66,'10000_Needles',1,10.0,2000,1500,4,0,0,0);

-- mob wyvern
INSERT INTO `mob_skill` VALUES (644,704,627,'Wyvern_Flame_Breath',0,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (645,704,628,'Wyvern_Frost_Breath',0,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (646,704,629,'Wyvern_Gust_Breath',0,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (647,704,630,'Wyvern_Sand_Breath',0,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (648,704,631,'Wyvern_Lightning_Breath',0,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (649,704,632,'Wyvern_Hydro_Breath',0,10.0,2000,1500,4,0,0,0);

-- Biotechnological Weapons
INSERT INTO `mob_skill` VALUES (1278,54,1090,'Guided_Missile',2,5.0,2000,1500,4,0,0,0); --
-- INSERT INTO `mob_skill` VALUES (982,54,928,'Target_Analysis',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1277,54,1089,'Pile_Pitch',0,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1271,54,1086,'Laser_Shower',2,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1270,54,1085,'Colossal_Blow',0,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1269,54,1090,'Guided_Missile_II',2,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1272,54,1087,'Floodlight',2,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1273,54,1088,'Hyper_Pulse',4,20.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1274,54,1089,'Stun_Cannon',2,20.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1003,54,944,'Wire_Cutter',0,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1004,54,945,'Antimatter',0,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1005,54,946,'Equalizer',2,10.0,2000,1500,4,1,0,0);
INSERT INTO `mob_skill` VALUES (1006,54,947,'Flame_Thrower',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1007,54,948,'Cryo_Jet',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1008,54,949,'Turbofan',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1009,54,950,'Smoke_Discharger',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1010,54,951,'High-Tension_Discharger',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1011,54,952,'Hydro_Canon',4,10.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1012,54,953,'Nuclear_Waste',2,15.0,2000,1500,4,0,0,0); -- : 15' AoE lower all resistances,followed by one of:
INSERT INTO `mob_skill` VALUES (1013,54,954,'Chemical_Bomb',0,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1265,54,1081,'Armor_Buster',2,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1266,54,1082,'Energy_Screen',0,10,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1267,54,1083,'Mana_Screen',0,10,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1268,54,1084,'Dissipation',2,20.0,2000,1500,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (?,54,?,'Citadel_Buster',1,20.0,2000,30000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (?,54,?,'Ion_Efflux',4,10.0,2000,2000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (?,54,?,'Rear_Lasers',1,20.0,2000,2000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1281,54,?,'Discharger',0,7.0,2000,2000,1,0,0,0);

-- Belladona
INSERT INTO `mob_skill` VALUES (2624,453,2016,'Night_stalker',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2625,453,2017,'Atropine_spore',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2626,453,2018,'Frond_fatale',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2627,453,2019,'Full_bloom',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2628,453,2020,'Deracinator',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2629,453,2021,'Beautiful_death',1,18.0,2000,1000,4,0,0,0);

-- Bahamut
INSERT INTO `mob_skill` VALUES (1286,449,1133,'Trample',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1287,449,1134,'Tempest_wing',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1288,449,1139,'Touchdown',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1289,449,1135,'Sweeping_ Flail',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1290,449,1140,'Prodigious_spike',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1291,449,1141,'Impulsion',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1292,449,1143,'Absolute_terror',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1293,449,1142,'Horrible_roar',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1295,449,1136,'Megaflare',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1296,449,1137,'Gigaflare',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1297,449,1138,'Teraflare',0,15.0,2000,1500,4,0,0,0);

-- Prishe
INSERT INTO `mob_skill` VALUES (1229,476,1091,'Hundred_Fists',0,7.0,2000,0,1,0,1,0);
INSERT INTO `mob_skill` VALUES (1230,476,1092,'Benediction',1,7.0,2000,0,1,0,1,0);
INSERT INTO `mob_skill` VALUES (1231,476,1093,'Prishe_Item_1',0,7.0,2000,0,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1232,476,1094,'Prishe_Item_2',0,7.0,2000,0,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1233,476,1095,'Nullifying_Dropkick',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1234,476,1096,'Auroral_Uppercut',0,7.0,2000,1500,4,0,0,0);

-- Promathia phase 1
INSERT INTO `mob_skill` VALUES (1235,134,1100,'Chains_of_Apathy',1,30.0,2000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (1236,134,1101,'Chains_of_Arrogance',1,30.0,2000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (1237,134,1102,'Chains_of_Cowardice',1,30.0,2000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (1238,134,1103,'Chains_of_Rage',1,30.0,2000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (1239,134,1104,'Chains_of_Envy',1,30.0,2000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (1240,134,1105,'Malevolent_blessing',4,10.0,2000,1500,4,8,0,7);
INSERT INTO `mob_skill` VALUES (1241,134,1106,'Pestilent_penance',4,10.0,2000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (1242,134,1107,'Empty_salvation',1,25.0,2000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (1243,134,1108,'Infernal_deliverance',1,15.0,2000,1500,4,8,0,0);

-- Promathia phase 2
INSERT INTO `mob_skill` VALUES (1244,478,1109,'Malevolent_blessing',4,10.0,2000,1500,4,8,0,7);
INSERT INTO `mob_skill` VALUES (1245,478,1110,'Pestilent_penance',4,10.0,2000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (1246,478,1111,'Empty_salvation',1,25.0,2000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (1247,478,1112,'Infernal_deliverance',1,15.0,2000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (1248,478,1113,'Wheel_of_Impregnability',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1249,478,1114,'Bastion_of_Twilight',0,7.0,2000,1500,1,0,0,0);
INSERT INTO `mob_skill` VALUES (1250,478,1115,'Winds_of_oblivion',1,15.0,2000,1500,4,8,0,0);
INSERT INTO `mob_skill` VALUES (1251,478,1116,'Seal_of_quiescence',1,15.0,2000,1500,4,8,0,0);

-- Selh'teus
INSERT INTO `mob_skill` VALUES (1252,477,1099,'Luminous_Lance',0,20.0,2000,0,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1253,477,1097,'Rejuvenation',1,10.0,2000,0,1,8,0,0);
INSERT INTO `mob_skill` VALUES (1254,477,1098,'Revelation',0,20.0,2000,0,4,0,0,0);

-- Tenzen
-- ranged @ 1033 1034
INSERT INTO `mob_skill` VALUES (1134,149,1036,'Amatsu_torimai',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1135,149,1037,'Amatsu_kazakiri',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1136,149,1038,'Amatsu_yukiarashi',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1137,149,1039,'Amatsu_tsukioboro',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1138,149,1040,'Amatsu_anaikusa',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1139,149,1041,'Amatsu_tsukikage',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1141,149,1042,'Oisoya',0,15.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1142,149,1032,'noname',0,15.0,2000,1500,1,0,0,0); -- riceball eating
INSERT INTO `mob_skill` VALUES (1143,149,1035,'noname2',0,15.0,2000,1500,4,0,0,0); -- cosmic elucidation

-- Lady Lilith
-- personal special melee 1840 1841 1842
INSERT INTO `mob_skill` VALUES (2419,473,1843,'Dark_thorn',1,18.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2420,473,1844,'Petaline_tempest',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2421,473,1845,'Durance_whip',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2422,473,1846,'Subjugating_slash',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2423,473,1847,'Fatal_allure',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2424,473,1848,'Moonlight_Veil',1,18.0,2000,1000,4,0,0,0);

-- Lilith ascendant
-- 1849 special melee?
INSERT INTO `mob_skill` VALUES (2428,472,1850,'Dark_Flare',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2429,472,1851,'Dark_Freeze',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2430,472,1852,'Dark_Tornado',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2431,472,1853,'Dark_Quake',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2432,472,1854,'Dark_Burst',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2433,472,1855,'Dark_Flood',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2434,472,1856,'Dark_Moon',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2435,472,1857,'Dark_Sun',1,18.0,2000,1000,4,0,0,0);



-- Alexander
-- INSERT INTO `mob_skill` VALUES (1885,357,1465,'Radiant_sacrament',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1886,357,1471,'Mega_holy',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1887,357,1467,'Perfect_defense',1,18.0,2000,1000,1,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1888,357,1470,'Divine_spear',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1889,357,1466,'Gospel_of_the_lost',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1890,357,1469,'Void_of repentance',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1891,357,1468,'Divine_jugement',1,18.0,2000,1000,4,0,0,0);

-- Monoceros
INSERT INTO `mob_skill` VALUES (2078,39,1640,'Wrath_of_zeus',4,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2079,39,1639,'Lightning_spear',4,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2080,39,1642,'Acheron_kick',4,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2081,39,1653,'Damsel_memento',0,7.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2082,39,1641,'Rampant_stance',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2113,39,1652,'Scintillant_lance',4,10.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (1286,39,?,'Trample',1,15.0,2000,1000,4,0,0,0);

-- Monoceros (Alicorn Subspecies)
-- INSERT INTO `mob_skill` VALUES (2114,?,1650,'Grace_of_Hera',0,7.0,2000,1000,1,0,0,0); -- Alicorn Subspecies only

-- Slugs
INSERT INTO `mob_skill` VALUES (1927,231,1572,'Fuscous_ooze',4,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1928,231,1573,'Purulent_ooze',4,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1929,0,1574,'Mucilaginous_ooze',1,15.0,2000,1000,4,0,0,0); -- Certain NM only
INSERT INTO `mob_skill` VALUES (1930,231,1575,'Corrosive_ooze',1,15.0,2000,1000,4,0,0,0);

-- Sandworms
INSERT INTO `mob_skill` VALUES (1931,215,1537,'Dustvoid',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1932,215,1538,'Slaverous_gale',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1933,215,1539,'Aeolian_Void',4,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1934,214,1540,'Extreme_Purgation',1,20.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1935,214,1541,'Desiccation',0,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (1936,214,1542,'Doomvoid',1,30.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2348,357,?,'Gorge',1,20.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2349,357,?,'Disgorge',4,15.0,2000,1000,4,0,0,0);

-- Caturae
INSERT INTO `mob_skill` VALUES (2310,450,1786,'Diabolic_claw',0,7.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2311,450,1787,'Stygian_cyclone',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2312,450,1788,'Deathly_diminuendo',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2313,450,1789,'Hellish_crescendo',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2314,450,1790,'Afflicting_gaze',4,12.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2315,450,1791,'Stygian_sphere',0,9.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2316,450,1792,'Malign_invocation',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2317,450,1793,'Shadow_wreck',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2378,450,1810,'Interference',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2379,450,1811,'Dark_arrivisme',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2381,450,1813,'Besiegers_bane',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2436,450,1812,'Royal_decree',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2444,450,1982,'Enthrall',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2380,450,1983,'Banneret_charge',1,30.0,2000,1000,4,0,0,0);

-- Amphipteres
INSERT INTO `mob_skill` VALUES (2171,6,1705,'Tail_lash',4,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2172,6,1706,'Bloody_beak',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2173,6,1707,'Feral_peck',0,9.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2175,6,1709,'Reaving_wind',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2176,6,1710,'Storm_wing',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2177,6,1711,'Calamitous_wind',1,15.0,2000,1000,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (2174,?,1708,'Warped_wail',1,15.0,2000,1000,4,0,0,0); -- Certain NM only

-- Iron Giants
INSERT INTO `mob_skill` VALUES (2363,350,1817,'Turbine_cyclone',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2364,350,1818,'Seismic_impact',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2365,350,1819,'Incinerator',4,12.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2366,350,1820,'Arm_canon',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2367,350,1821,'Ballistic_kick',4,12.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2368,350,1822,'Scapula_beam',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2369,350,1823,'Eradicator',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2370,350,1824,'Auger_Smash',0,9.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2371,350,1825,'Area_Bombardment',4,12.0,2000,1000,4,0,0,0);
-- 1814 1815 1816 are melee attacks with additional effect

-- Mantids
INSERT INTO `mob_skill` VALUES (2595,340,1923,'Slicing_Sickle',4,12.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2596,340,1926,'Raptorial_Claw',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2597,340,1927,'Phlegm_Expulsion',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2598,340,1928,'Macerating_Bile',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2599,340,1929,'Preying_Posture',0,7.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2600,340,1924,'Dead_Prophet ',4,10.0,2000,1000,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (2630,?,1925,'Exorender',4,12.0,2000,1000,4,0,0,0); -- Only used by Tsui Goab

-- Ruszors
INSERT INTO `mob_skill` VALUES (2179,211,1697,'Severing_Fang',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2180,211,1698,'Sub-zero_Smash',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2181,211,1699,'Aqua_Blast',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2182,211,1700,'Frozen_Mist',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2183,211,1701,'Hydro_Wave',1,18.0,2000,1000,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (2184,?,1702,'Ice_Guillotine',1,18.0,2000,1000,4,0,0,0); -- Scylla Only
-- INSERT INTO `mob_skill` VALUES (2185,?,1703,'Aqua_Cannon',1,18.0,2000,1000,4,0,0,0); -- Exclusive to Scylla? Replaces Aqua Blast

-- Gargouilles
INSERT INTO `mob_skill` VALUES (2165,117,1682,'Dark_orb',1,15.0,2000,1000,4,0,0,0); -- Flying only.
INSERT INTO `mob_skill` VALUES (2166,117,1678,'Dark_mist',1,14.0,2000,1000,4,0,0,0); -- Flying Only.
INSERT INTO `mob_skill` VALUES (2167,117,1680,'Triumphant_roar',0,7.0,2000,1000,1,0,0,0); -- Standing Only.
INSERT INTO `mob_skill` VALUES (2168,117,1681,'Terror_eye',4,10.0,2000,1000,4,0,0,0); -- Standing Only.
INSERT INTO `mob_skill` VALUES (2169,117,1679,'Bloody_claw',0,7.0,2000,1000,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (2170,?,1683,'Shadow_burst',1,15.0,2000,1000,4,0,0,0); -- Certain NM only

-- Harpeia
INSERT INTO `mob_skill` VALUES (2469,471,1912,'Rending_talons',0,7.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2470,471,1913,'Shrieking_gale',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2471,471,1914,'Wings_of_woe',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2472,471,1915,'Wings_of_agony',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2473,471,1916,'Typhoean_rage',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2474,471,1917,'Ravenous_wail',1,15.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2502,471,1915,'Kaleidoscopic_Fury',1,15.0,2000,1000,4,0,0,0);

-- Pteraketos
INSERT INTO `mob_skill` VALUES (2620,451,2012,'Thar_she_blows',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2619,451,2010,'Waterspout',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2618,451,2011,'Angry_seas',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2617,451,2009,'Blowhole_blast',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2616,451,2008,'Depht_charge',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2615,451,2007,'Baleen_gurge',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2614,451,2006,'Caudal_capacitor',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2613,451,2005,'Deep_sea_dirge',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2612,451,2004,'Echolocation',1,18.0,2000,1000,4,0,0,0);

-- Naraka
INSERT INTO `mob_skill` VALUES (2465,472,1907,'Raksha_vengeance',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2464,472,1906,'Raksha_illusion',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2463,472,1905,'Raksha_Judgment',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2462,472,1904,'Raksha_stance',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2461,472,1902,'Yaksha_bliss',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2460,472,1903,'Yaksha_oblivion',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2459,472,1901,'Yaksha_damnation',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2458,472,1900,'Yaksha_stance',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2555,472,?,'Yamas_jugement',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2501,472,?,'Sakra_storm',1,18.0,2000,1000,4,0,0,0);

-- Gallu
INSERT INTO `mob_skill` VALUES (2528,467,1956,'Diluvial_wakes',4,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2529,467,1957,'Kurugi_collapse',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2530,467,1958,'Searing_halitus',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2531,467,1959,'Divesting_gale',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2532,467,1960,'Bolt_of_perdition',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2533,467,1961,'Crippling_rime',4,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2534,467,1962,'Oblivions_mantle',1,15.0,2000,1000,4,0,0,0);

-- Shadow Lord (Fiat Lux)
INSERT INTO `mob_skill` VALUES (2289,466,1755,'Doom_arc',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2288,466,1754,'Soma_wall',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2287,466,1753,'Spawn_shadow',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2286,466,1752,'Blighting_blitz',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2285,466,1751,'Cross_smash',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2284,466,1750,'Umbral_orb',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2283,466,1749,'Implosion',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2282,466,1748,'Spell_wall',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2281,466,1747,'Cruel_slash',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2280,466,1746,'Boon_void',1,18.0,2000,1000,4,0,0,0);

-- Provenance Watcher (100-50% no wings,50-31 2 wings,<31 4 wings)
-- special melee 2049 2050 2051 2052 2053 2054 2055
INSERT INTO `mob_skill` VALUES (2583,462,2056,'Prismatic_Breath',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2584,462,2057,'Acicular_Brand',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2585,462,2058,'Orogenesis',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2586,462,2059,'Phason_Beam',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2587,462,2060,'Diffractive_Break',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2588,462,2061,'Euhedral_Swat',1,18.0,2000,1000,4,0,0,0);

-- special melee wing out 2062 2063 2064 2065 2066 2067 2068

INSERT INTO `mob_skill` VALUES (2596,462,2069,'Prismatic_Breath',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2597,462,2070,'Acicular_Brand',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2598,462,2071,'Orogenesis',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2259,462,2072,'Phason_Beam',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2600,462,2073,'Diffractive_Break',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2601,462,2074,'Euhedral_Swat',1,18.0,2000,1000,4,0,0,0);

-- HP <50%
INSERT INTO `mob_skill` VALUES (2602,462,2075,'Crystallite_Shower',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2603,462,2076,'Graviton_Crux',1,18.0,2000,1000,4,0,0,0);
-- HP <30%
INSERT INTO `mob_skill` VALUES (2604,462,2077,'Crystal_Bolide',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2605,462,2078,'Fragor_maximus',1,18.0,2000,1000,4,0,0,0);
-- SOA
-- Chapulli normal & nm

INSERT INTO `mob_skill` VALUES (2689,339,2167,'Natures_meditation',1,18.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2690,339,2168,'Sensilla_blades',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2691,339,2169,'Tegmina_buffet',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2692,339,2170,'Sanguinary_slash',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2693,339,2171,'Sanguinary_slash',1,18.0,2000,1000,4,0,0,0);

-- Yilbegan
INSERT INTO `mob_skill` VALUES (2263,470,1756,'Dexter_Wing',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2264,470,1757,'Sinister_Wing',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2265,470,1758,'Chaos_blast',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2266,470,1759,'Abyssic_buster',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2267,470,1760,'Dancing_tail',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2268,470,1761,'Dancing_tailv2',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2269,470,1762,'Chilling_roar',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2270,470,1763,'Chilling_roarv2',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2271,470,1764,'Soul_douse',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2272,470,1765,'Soul_dousev2',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2273,470,1766,'Dark_star',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2274,470,1767,'Dark_starV2',1,18.0,2000,1000,4,0,0,0);


-- CAIT SITH
INSERT INTO `mob_skill` VALUES (2192,60,1686,'Regal_scratch',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2193,60,1687,'Mewing_lullaby',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2194,60,1688,'Eerie_eye',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2195,60,1689,'Divine_favor',1,18.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2196,60,1690,'Level-1-Holy',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2197,60,1691,'Level-2-Holy',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2198,60,1692,'Level-3-Holy',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2199,60,1693,'Level-4-Holy',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2200,60,1694,'Level-5-Holy',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2201,60,1695,'Level-6-Holy',1,18.0,2000,1000,4,0,0,0);


-- Mumor

-- INSERT INTO `mob_skill` VALUES (2643,???,2037,'Sining_Summer_samba',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2644,???,2038,'Lovely_Miracle_Waltz',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2645,???,2039,'Neo_Crystal_Jig',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2646,???,2040,'Super_Crusher_jig',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2647,???,2041,'Eternal_Vana_Illusion',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2648,???,2042,'Final_Eternal_Heart',1,18.0,2000,1000,4,0,0,0);


-- Riko Kupenreich
-- normal melee 1503 bomb toss
-- INSERT INTO `mob_skill` VALUES (2209,???,1502,'Bill_toss',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2210,???,1504,'Washtub',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2211,???,1505,'Crystalline_flare',1,18.0,2000,1000,4,0,0,0);

-- Moogle Henchman

-- INSERT INTO `mob_skill` VALUES (2207,???,1499,'Flowerpot',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2206,???,1500,'Mog_shrapnel',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2205,???,1501,'Mog_bomb',1,18.0,2000,1000,4,0,0,0);


-- Lilisette
INSERT INTO `mob_skill` VALUES (2191,484,1717,'Vivifying_waltz',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2190,484,1716,'Rousing_samba',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2189,484,1713,'Whirling_edge',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2188,484,1712,'Dancers_fury',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2187,484,1715,'Sensual_dance',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2186,484,1714,'Thorned_dance',1,18.0,2000,1000,4,0,0,0);

-- Atomos
-- need right model?
-- INSERT INTO `mob_skill` VALUES (2202,???,1718,'Soul_Vacuum',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2003,???,1719,'Soul_Infusion',1,18.0,2000,1000,4,0,0,0);


-- SOA

-- Twitherym
INSERT INTO `mob_skill` VALUES (2694,338,2203,'Tempestuous_Upheaval',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2695,338,2204,'Slicendice',0,25.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2696,338,2205,'Blackout',1,18.0,2000,1000,4,0,0,0);

-- Umbrils
INSERT INTO `mob_skill` VALUES (2714,468,2185,'Paralysing_triad',0,7.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2715,468,2186,'Crepuscular_Grasp',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2716,468,2187,'Necrotic_brume',4,15.0,2000,1000,4,0,0,0);

-- Acuex
INSERT INTO `mob_skill` VALUES (2718,345,2189,'Foul_waters',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2719,345,2190,'Pestilent_brume',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2720,345,2191,'Deadening_haze',1,18.0,2000,1000,4,0,0,0);

-- Maroliths
INSERT INTO `mob_skill` VALUES (2671,347,2086,'Metamorphic_Blast',4,12.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2672,347,2087,'Enervating_grasp',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2673,347,2088,'Orogenic_storm',1,14.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2674,347,2089,'Subduction',1,15.0,2000,1000,4,0,0,0);

-- INSERT INTO `mob_skill` VALUES (2675,?,2090,'Tectonic_shift',1,15.0,2000,1000,4,0,0,0); -- Certain NM only

-- Craklaws
INSERT INTO `mob_skill` VALUES (2701,344,2180,'Impenetrable_carapace',1,18.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2702,344,2181,'Rending_Deluge',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2703,344,2182,'Sundering_Snip',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2704,344,2183,'Viscid_Spindrift',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2705,344,2184,'Riptide_Eupnea',1,18.0,2000,1000,4,0,0,0);

-- Raaz
INSERT INTO `mob_skill` VALUES (2892,458,2274,'noname',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2893,458,2275,'Dazing_Discord',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2894,458,2276,'Steaming_Rage',1,18.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2895,458,2277,'noname',1,18.0,2000,1000,4,0,0,0);

-- Yztarg

-- melee special 2091 2092 2093

INSERT INTO `mob_skill` VALUES (2666,459,2094,'Soulshattering_Roar',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2667,459,2095,'Calcifying_Claw',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2668,459,2096,'Divesting_Stampede',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2669,459,2097,'Bonebreaking_Barrage',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2670,459,2098,'Beastruction',1,18.0,2000,1000,4,0,0,0);

-- Matamata
-- melee special 2121,2122,2123 all aoe
INSERT INTO `mob_skill` VALUES (2709,348,2124,'Cranial_Thrust',4,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2710,348,2125,'Tail_Thwack',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2711,348,2126,'Embalming_Earth',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2712,348,2127,'Scalding_Breath',4,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2713,348,2128,'Debilitating_Spout',1,18.0,2000,1000,4,0,0,0);

-- Heartwing
INSERT INTO `mob_skill` VALUES (2727,343,2117,'Ancestral_Banishment',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2728,343,2118,'Heartfelt_Aura',0,7.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2729,343,2119,'Impairing_Glister',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2730,343,2120,'Crippling_Gleam',1,18.0,2000,1000,4,0,0,0);

-- Leafkin
INSERT INTO `mob_skill` VALUES (2722,455,2162,'Consecration',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2723,455,2163,'Sacred_Caper',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2724,455,2164,'Phototrophic_Blessing',0,7.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2725,455,2165,'Phototrophic_Wrath',0,7.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2726,455,2166,'Deific_gambol',1,18.0,2000,1000,4,0,0,0);

-- Tulfaires
INSERT INTO `mob_skill` VALUES (2807,454,2233,'Molting_Plumage',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2808,454,2234,'Pentapeck',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2809,454,2235,'Swooping_Frenzy',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2810,454,2236,'From_the_skies',1,18.0,2000,1000,4,0,0,0);

-- Velkk
INSERT INTO `mob_skill` VALUES (2732,342,2155,'Glutinous_Dart',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2733,342,2156,'Death_Spin',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2734,342,2157,'Velkkan_Pygmachia',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2735,342,2158,'Saurian_Slide',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2736,342,2159,'Jungle_Wallop',1,18.0,2000,1000,4,0,0,0);

-- Panopts
INSERT INTO `mob_skill` VALUES (2774,463,2099,'Retinal_glare',4,10.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2775,463,2100,'Sylvan_Slumber',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2776,463,2101,'Crushing_Gaze',1,15.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2777,463,2102,'Vaskania',1,18.0,2000,1000,4,0,0,0);

-- Snapweeds
INSERT INTO `mob_skill` VALUES (2841,464,2172,'Stink_Bomb',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2842,464,2173,'Stink_Bomb',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2843,464,2174,'Nectarous_Deluge',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2845,464,2175,'Nepenthic_Plunge',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2846,464,2176,'Infaunal_Flop',1,18.0,2000,1000,4,0,0,0);



-- Dullahan

INSERT INTO `mob_skill` VALUES (2962,447,2299,'Villainous_Rebuke',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2963,447,2300,'Stygian_Release',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2964,447,2301,'Infernal_Bulwark',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2965,447,2302,'Atramentous_Libations',1,18.0,2000,1000,4,0,0,0);
-- 2303 probably nm dullahan move

-- Fluturini
INSERT INTO `mob_skill` VALUES (2896,448,2289,'Shining_salvo',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2897,448,2290,'Palling_salvo',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2898,448,2291,'Cathartic_Caper',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2899,448,2292,'Bewailing_wake',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2900,448,2293,'Flight_of_the_Fluttyries',1,18.0,2000,1000,4,0,0,0);


-- -----------------------------------------------------------
-- Naakuals
-- -----------------------------------------------------------

-- Rockfins
-- 2193,2194,2195 special melee
INSERT INTO `mob_skill` VALUES (2755,452,2196,'Protolithic_puncture',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2756,452,2197,'Aquatic_lance',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2757,452,2198,'Pelagic_cleaver',1,18.0,2000,1000,1,0,0,0);
INSERT INTO `mob_skill` VALUES (2758,452,2199,'Carcharian_verve',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2759,452,2200,'Tidal_Guillotine',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2760,452,2201,'Marine_Mayhem',1,18.0,2000,1000,4,0,0,0);

-- Kumhau
-- melee special 2258 2259 2260
INSERT INTO `mob_skill` VALUES (2881,457,2261,'Polar_roar',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2882,457,2262,'Brain_Freeze',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2883,457,2263,'Biting_Abrogation',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2884,457,2264,'Permafrost_Requiem',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2885,457,2265,'Glacial_tomb',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2886,457,2266,'Glassy_nova',1,18.0,2000,1000,4,0,0,0);

-- Colkhab
-- melee special 2133 / 2134 / 2135(aoe melee attack)
INSERT INTO `mob_skill` VALUES (2746,456,2136,'Mandibular_Lashing',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2747,456,2137,'Vespine_Hurricane',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2748,456,2138,'Stinger_volley',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2749,456,2139,'Droning_Whirlwind',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2750,456,2140,'Incisive_Denouement',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2751,456,2141,'Incisive_Apotheosis',1,18.0,2000,1000,4,0,0,0);

-- Achuka
-- special melee 2142 2143 2144
INSERT INTO `mob_skill` VALUES (2764,461,2145,'Blistering_Roar',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2765,461,2146,'Searing_Serration',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2766,461,2147,'Volcanic_Stasis',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2767,461,2148,'Tyrannical_Blow',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2768,461,2149,'Batholithic_Shell',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2769,461,2150,'Pyroclastic_Surge',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2770,461,2151,'Incinerating_Lahar',1,18.0,2000,1000,4,0,0,0);

-- Hurkan
-- special melee 2214 2215 2216
INSERT INTO `mob_skill` VALUES (2817,460,2218,'Crashing_Thunder',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2818,460,2218,'Reverberating_Cry',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2819,460,2219,'Brownout',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2820,460,2220,'Reverse_Current',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2821,460,2221,'Sparkstorm',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2822,460,2222,'Static_Prison',1,18.0,2000,1000,4,0,0,0);

-- Yumcax
-- special melee anims 2202 2203 2204
INSERT INTO `mob_skill` VALUES (2801,465,2205,'Root_of_the_problem',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2802,465,2206,'Potted_Plant',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2803,465,2207,'Uproot',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2804,465,2208,'Canopierce',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2805,465,2209,'Firefly_Fandango',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2806,465,2210,'Tiiimbeeer',1,18.0,2000,1000,4,0,0,0);

-- Arciela

-- INSERT INTO `mob_skill` VALUES (2825,486,2247,'',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2825,486,2248,'',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2825,486,2249,'',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2825,486,2250,'',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2825,486,2251,'',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2825,486,2252,'',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2825,486,2253,'',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2825,486,2254,'',1,18.0,2000,1000,4,0,0,0);


-- Gramk-Droog Velkk Boss
-- special melee 2223 2224 2225
-- INSERT INTO `mob_skill` VALUES (2825,???,2226,'Velkan_Ambush',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2826,???,2227,'Galumph',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2827,???,2228,'Coming_through',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2828,???,2229,'Merciless_mauling',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2829,???,2230,'Croctastrophy',1,18.0,2000,1000,4,0,0,0);
-- INSERT INTO `mob_skill` VALUES (2831,???,2231,'Battle_Trance',1,18.0,2000,1000,1,0,0,0);


-- Xol (Balamor boss) -- animated model 0x0000460a not 0x0000ba06
-- melee ranged attack 2343 2344 2345 2346
INSERT INTO `mob_skill` VALUES (3047,490,2347,'Feast_of_Arrows',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3048,490,2348,'Cruel_Joke',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3049,490,2349,'Regurgitated_Swarm',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3050,490,2350,'Setting_the_Stage',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3051,490,2351,'Last_Laugh',1,18.0,2000,1000,4,0,0,0);

-- Morimar/Noble Warrior animated model 0x00006f0a not 0x0000ba05
-- special melee 2332 2333 2334
INSERT INTO `mob_skill` VALUES (2904,491,2335,'Vehement_Resolution',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2905,491,2336,'Camaraderie_oft_the_crevasse',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2906,491,2337,'Into_the_light',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2907,491,2338,'Arduous_decision',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2908,491,2339,'12_blades_of_remorse',1,18.0,2000,1000,4,0,0,0);

-- Darrcuiln model 0x0000660a not cs one 0x0000b00a
-- special melee 2320 2321 2322
INSERT INTO `mob_skill` VALUES (2912,489,2323,'Aurous_charge',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2913,489,2324,'Howling_gust',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2914,489,2325,'Righteous_Rasp',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2915,489,2326,'Starward_yowl',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (2916,489,2327,'Stalking_prey',1,18.0,2000,1000,4,0,0,0);

-- Ashrakk
-- melee 2369 2370 2371 2372
INSERT INTO `mob_skill` VALUES (3107,493,2373,'Tearing_Gust',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3108,493,2374,'Concussive_Shock',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3109,493,2375,'Chokehold',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3110,493,2376,'Zap',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3111,493,2377,'Shrieking_Gale',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3112,493,2378,'Undulating_Shockwave',1,18.0,2000,1000,4,0,0,0);


-- Xol
-- Dhokmak melee 2379 2380 2381
INSERT INTO `mob_skill` VALUES (3116,490,2382,'Cesspool',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3117,490,2383,'Fetid_Eddies',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3118,490,2384,'Nullifying_rain',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3119,490,2385,'Noyade',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3120,490,2386,'Clobering_wave',1,18.0,2000,1000,4,0,0,0);

-- Theodor
-- Melee 2387 2388 2389
INSERT INTO `mob_skill` VALUES (3124,488,2390,'Start_From_Scratch',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3125,488,2391,'Frenzied_Thrust',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3126,488,2392,'Sinners_Coss',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3127,488,2393,'Open_Coffin',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3128,488,2394,'Ravenous_Assault',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3129,488,2395,'Hemocladis',1,18.0,2000,1000,4,0,0,0);


-- Hades V1
-- melee 2396 2397 2398
INSERT INTO `mob_skill` VALUES (3133,485,2399,'Fulminous_Smash',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3134,485,2400,'Flaming_Kick',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3135,485,2401,'Icy_Grasp',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3136,485,2402,'Flash_Flood',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3137,485,2403,'Eroding_Flesh',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3138,485,2404,'Vivisection',1,18.0,2000,1000,4,0,0,0);

-- Hades V2
-- Melee 2405 2406 2407 2408
INSERT INTO `mob_skill` VALUES (3143,487,2409,'Impudence',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3144,487,2410,'Incessant_Void',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3145,487,2411,'Tenbrous_Grip',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3146,487,2412,'Demon_Fire',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3147,487,2413,'Frozen_Blood',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3148,487,2414,'Blast_Of_Reticence',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3149,487,2415,'Ensepulcher',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3150,487,2416,'Ceaseless_Surge',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3151,487,2417,'Torrential_Pain',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3152,487,2418,'Eternal_Misery',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3153,487,2419,'Crippling_Agony',1,18.0,2000,1000,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3154,487,2420,'Bane_Of_Tartarus',1,18.0,2000,1000,4,0,0,0);

-- Static mobs unique attack
INSERT INTO `mob_skill` VALUES (3000,349,2153,'animationfungus',1,18.0,2000,1000,4,0,0,0);

-- Alastor Antlion
INSERT INTO `mob_skill` VALUES (21, 357, 811, 'Venom_Spray', 4, 10.0, 2000, 1000, 4, 0, 0, 0);
INSERT INTO `mob_skill` VALUES (20, 357, 810, 'Sand_Pit', 0, 7.0, 2000, 1000, 4, 0, 0, 0);
INSERT INTO `mob_skill` VALUES (19, 357, 809, 'Sand_Blast', 1, 8.0, 2000, 1000, 4, 0, 0, 0);
INSERT INTO `mob_skill` VALUES (23, 357, 813, 'Mandibular_Bite', 0, 7.0, 2000, 1500, 4, 0, 0, 0);

-- Ix'Aern (MNK) and his minions
INSERT INTO `mob_skill` VALUES (3155,3,434,'Ix_aern_mnk',0,7.0,2000,0,1,2,0,0);
INSERT INTO `mob_skill` VALUES (3156,3,436,'Qn_aern_rdm',0,7.0,2000,0,1,2,0,0);
INSERT INTO `mob_skill` VALUES (3157,3,433,'Qn_aern_whm',1,20.0,2000,0,1,2,0,0);

-- Sekhmet
INSERT INTO `mob_skill` VALUES (3158,494,396,'Blaster',0,7.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3159,494,397,'Chaotic_Eye',4,10.0,2000,1500,4,0,0,0);
INSERT INTO `mob_skill` VALUES (3160,494,291,'Charged_Whisker',1,12.5,2000,1500,4,0,0,0);
