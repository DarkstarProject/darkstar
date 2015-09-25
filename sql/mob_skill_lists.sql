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
-- Structure de la table `mob_skill_lists`
--

DROP TABLE IF EXISTS `mob_skill_lists`;
CREATE TABLE IF NOT EXISTS `mob_skill_lists` (
  `skill_list_name` char(20) DEFAULT NULL,
  `skill_list_id` smallint(5) unsigned NOT NULL,
  `mob_skill_id` smallint(3) unsigned NOT NULL,
  PRIMARY KEY (`skill_list_id`,`mob_skill_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `mob_skill_lists`
--

-- Rabbits
INSERT INTO `mob_skill_lists` VALUES ('',206,1);
INSERT INTO `mob_skill_lists` VALUES ('',206,2);
INSERT INTO `mob_skill_lists` VALUES ('',206,3);

-- Rabbits With Cure
INSERT INTO `mob_skill_lists` VALUES ('',404,1);
INSERT INTO `mob_skill_lists` VALUES ('',404,2);
INSERT INTO `mob_skill_lists` VALUES ('',404,3);
INSERT INTO `mob_skill_lists` VALUES ('',404,67);

-- Rabbits (Snowy)
INSERT INTO `mob_skill_lists` VALUES ('',405,1);
INSERT INTO `mob_skill_lists` VALUES ('',405,3);
INSERT INTO `mob_skill_lists` VALUES ('',405,67);
INSERT INTO `mob_skill_lists` VALUES ('',405,405);

-- Rabbits (nm or abyssea area?)
-- INSERT INTO `mob_skill_lists` VALUES ('',1311,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1312,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1313,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1314,?,?);

-- Sheep
INSERT INTO `mob_skill_lists` VALUES ('',226,4);
INSERT INTO `mob_skill_lists` VALUES ('',226,5);
INSERT INTO `mob_skill_lists` VALUES ('',226,6);
INSERT INTO `mob_skill_lists` VALUES ('',226,8);

-- Sheep (Karakul sub-family)
INSERT INTO `mob_skill_lists` VALUES ('',167,4);
INSERT INTO `mob_skill_lists` VALUES ('',167,5);
INSERT INTO `mob_skill_lists` VALUES ('',167,6);
INSERT INTO `mob_skill_lists` VALUES ('',167,8);
INSERT INTO `mob_skill_lists` VALUES ('',167,1581);

-- Slumbering Samwell
INSERT INTO `mob_skill_lists` VALUES ('',398,8);

-- Ram
INSERT INTO `mob_skill_lists` VALUES ('',208,9);
INSERT INTO `mob_skill_lists` VALUES ('',208,10);
INSERT INTO `mob_skill_lists` VALUES ('',208,11);
INSERT INTO `mob_skill_lists` VALUES ('',208,12);
INSERT INTO `mob_skill_lists` VALUES ('',208,13);

-- Tiger
INSERT INTO `mob_skill_lists` VALUES ('',242,14);
INSERT INTO `mob_skill_lists` VALUES ('',242,15);
INSERT INTO `mob_skill_lists` VALUES ('',242,17);


-- INSERT INTO `mob_skill_lists` VALUES ('',242,1951);

-- Tigers (Dynamis - Nightmare tiger)
-- INSERT INTO `mob_skill_lists` VALUES ('',1421,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1422,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1423,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1425,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1424,?);

-- Dhalmel
INSERT INTO `mob_skill_lists` VALUES ('',80,24);
INSERT INTO `mob_skill_lists` VALUES ('',80,25);
INSERT INTO `mob_skill_lists` VALUES ('',80,28);
INSERT INTO `mob_skill_lists` VALUES ('',80,29);
INSERT INTO `mob_skill_lists` VALUES ('',80,30);
INSERT INTO `mob_skill_lists` VALUES ('',80,31);

-- Opo-opo
INSERT INTO `mob_skill_lists` VALUES ('',188,38);
INSERT INTO `mob_skill_lists` VALUES ('',188,32);
INSERT INTO `mob_skill_lists` VALUES ('',188,34);
INSERT INTO `mob_skill_lists` VALUES ('',188,39);
INSERT INTO `mob_skill_lists` VALUES ('',188,35);
INSERT INTO `mob_skill_lists` VALUES ('',188,33);
INSERT INTO `mob_skill_lists` VALUES ('',188,36);

-- Mandragora
INSERT INTO `mob_skill_lists` VALUES ('',178,44);
INSERT INTO `mob_skill_lists` VALUES ('',178,45);
INSERT INTO `mob_skill_lists` VALUES ('',178,46);
INSERT INTO `mob_skill_lists` VALUES ('',178,48);
INSERT INTO `mob_skill_lists` VALUES ('',178,49);
INSERT INTO `mob_skill_lists` VALUES ('',178,50);

INSERT INTO `mob_skill_lists` VALUES ('',496,1954);

-- INSERT INTO `mob_skill_lists` VALUES ('',2154,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2345,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2343,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2344,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2131,?,?);

-- Morbol
INSERT INTO `mob_skill_lists` VALUES ('',186,60);
INSERT INTO `mob_skill_lists` VALUES ('',186,61);
INSERT INTO `mob_skill_lists` VALUES ('',186,62);
INSERT INTO `mob_skill_lists` VALUES ('',186,63);
INSERT INTO `mob_skill_lists` VALUES ('',186,64);
-- INSERT INTO `mob_skill_lists` VALUES ('',186,470);

-- INSERT INTO `mob_skill_lists` VALUES ('',?,?,?);

-- Cirrate Christelle
-- INSERT INTO `mob_skill_lists` VALUES ('',1351,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1349,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1353,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1355,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1354,?,?);

-- Sabotenders
INSERT INTO `mob_skill_lists` VALUES ('',212,65);
INSERT INTO `mob_skill_lists` VALUES ('',212,66);
INSERT INTO `mob_skill_lists` VALUES ('',212,68);

-- Sabotenders (Dynamis)
-- INSERT INTO `mob_skill_lists` VALUES ('',1369,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1370,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1371,?,?);

-- Funguar
INSERT INTO `mob_skill_lists` VALUES ('',116,52);
INSERT INTO `mob_skill_lists` VALUES ('',116,53);
INSERT INTO `mob_skill_lists` VALUES ('',116,58);
INSERT INTO `mob_skill_lists` VALUES ('',116,59);
INSERT INTO `mob_skill_lists` VALUES ('',116,54);
INSERT INTO `mob_skill_lists` VALUES ('',116,55);
INSERT INTO `mob_skill_lists` VALUES ('',116,56);

-- INSERT INTO `mob_skill_lists` VALUES ('',1952,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2351,?,?);

-- Fairy Ring (Dynamis - Valkurm)
-- Note: M. Spore is his normal attack round move. However no WS use message is displayed.
-- INSERT INTO `mob_skill_lists` VALUES ('',1364,?);

-- Treant
INSERT INTO `mob_skill_lists` VALUES ('',245,72);
INSERT INTO `mob_skill_lists` VALUES ('',245,73);
INSERT INTO `mob_skill_lists` VALUES ('',245,75);
INSERT INTO `mob_skill_lists` VALUES ('',245,76);

-- Bees
INSERT INTO `mob_skill_lists` VALUES ('',48,80);
INSERT INTO `mob_skill_lists` VALUES ('',48,79);
INSERT INTO `mob_skill_lists` VALUES ('',48,78);

-- INSERT INTO `mob_skill_lists` VALUES ('',1591,?,?);

-- Bees (Nightmare Bee Dynamis)
-- INSERT INTO `mob_skill_lists` VALUES ('',1590,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1591,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1592,?,?);

-- Beetle
INSERT INTO `mob_skill_lists` VALUES ('',49,82);
INSERT INTO `mob_skill_lists` VALUES ('',49,83);
INSERT INTO `mob_skill_lists` VALUES ('',49,84);
INSERT INTO `mob_skill_lists` VALUES ('',49,87);
INSERT INTO `mob_skill_lists` VALUES ('',49,85);

-- Crawler
-- TODO: Find out which crawlers have ID entries 1325-27
INSERT INTO `mob_skill_lists` VALUES ('',79,90);
INSERT INTO `mob_skill_lists` VALUES ('',79,89);
INSERT INTO `mob_skill_lists` VALUES ('',79,88);

-- Crawlers (Eruca)
INSERT INTO `mob_skill_lists` VALUES ('',107,90);
INSERT INTO `mob_skill_lists` VALUES ('',107,88);
-- INSERT INTO `mob_skill_lists` VALUES ('',107,386);

INSERT INTO `mob_skill_lists` VALUES ('',108,90);
INSERT INTO `mob_skill_lists` VALUES ('',108,88);
-- INSERT INTO `mob_skill_lists` VALUES ('',?,108,?);

-- Scorpion
INSERT INTO `mob_skill_lists` VALUES ('',217,94);
INSERT INTO `mob_skill_lists` VALUES ('',217,97);
INSERT INTO `mob_skill_lists` VALUES ('',217,98);
INSERT INTO `mob_skill_lists` VALUES ('',217,99);
INSERT INTO `mob_skill_lists` VALUES ('',217,95);
INSERT INTO `mob_skill_lists` VALUES ('',217,93);
INSERT INTO `mob_skill_lists` VALUES ('',217,92);
INSERT INTO `mob_skill_lists` VALUES ('',217,100);

-- INSERT INTO `mob_skill_lists` VALUES ('',1965,?,?);

-- Serket
INSERT INTO `mob_skill_lists` VALUES ('',273,463);
INSERT INTO `mob_skill_lists` VALUES ('',273,465);
INSERT INTO `mob_skill_lists` VALUES ('',273,466);
INSERT INTO `mob_skill_lists` VALUES ('',273,467);
INSERT INTO `mob_skill_lists` VALUES ('',273,464);
INSERT INTO `mob_skill_lists` VALUES ('',273,461);
INSERT INTO `mob_skill_lists` VALUES ('',273,468);

-- Aqrabuamelu
INSERT INTO `mob_skill_lists` VALUES ('',402,93);

-- DynamisStatue-Goblin
INSERT INTO `mob_skill_lists` VALUES ('',92,858);
INSERT INTO `mob_skill_lists` VALUES ('',92,859);

-- DynamisStatue-Orc
INSERT INTO `mob_skill_lists` VALUES ('',93,854);
INSERT INTO `mob_skill_lists` VALUES ('',93,855);

-- DynamisStatue-Quadav
INSERT INTO `mob_skill_lists` VALUES ('',94,860);
INSERT INTO `mob_skill_lists` VALUES ('',94,861);

-- DynamisStatue-Yagudo
INSERT INTO `mob_skill_lists` VALUES ('',95,856);
INSERT INTO `mob_skill_lists` VALUES ('',95,857);

-- Dynamis Lord
INSERT INTO `mob_skill_lists` VALUES ('',361,871);
INSERT INTO `mob_skill_lists` VALUES ('',361,872);
INSERT INTO `mob_skill_lists` VALUES ('',361,873);
INSERT INTO `mob_skill_lists` VALUES ('',361,874);
INSERT INTO `mob_skill_lists` VALUES ('',361,875);
INSERT INTO `mob_skill_lists` VALUES ('',361,877);
INSERT INTO `mob_skill_lists` VALUES ('',361,878);

-- Animated Weapons
INSERT INTO `mob_skill_lists` VALUES ('',15,932);
INSERT INTO `mob_skill_lists` VALUES ('',11,933);
INSERT INTO `mob_skill_lists` VALUES ('',24,934);
INSERT INTO `mob_skill_lists` VALUES ('',14,935);
INSERT INTO `mob_skill_lists` VALUES ('',8,936);
INSERT INTO `mob_skill_lists` VALUES ('',12,937);
INSERT INTO `mob_skill_lists` VALUES ('',20,938);
INSERT INTO `mob_skill_lists` VALUES ('',19,939);
INSERT INTO `mob_skill_lists` VALUES ('',17,940);
INSERT INTO `mob_skill_lists` VALUES ('',13,941);
INSERT INTO `mob_skill_lists` VALUES ('',9,942);
INSERT INTO `mob_skill_lists` VALUES ('',23,943);
INSERT INTO `mob_skill_lists` VALUES ('',7,944);
INSERT INTO `mob_skill_lists` VALUES ('',18,945);
INSERT INTO `mob_skill_lists` VALUES ('',22,1175);

-- Buffalo
INSERT INTO `mob_skill_lists` VALUES ('',57,237);
INSERT INTO `mob_skill_lists` VALUES ('',57,238);
INSERT INTO `mob_skill_lists` VALUES ('',57,239);
INSERT INTO `mob_skill_lists` VALUES ('',57,240);
INSERT INTO `mob_skill_lists` VALUES ('',57,241);
-- INSERT INTO `mob_skill_lists` VALUES ('',1108,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',?,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1219,?,?);

-- Diremite
INSERT INTO `mob_skill_lists` VALUES ('',81,106);
INSERT INTO `mob_skill_lists` VALUES ('',81,107);
INSERT INTO `mob_skill_lists` VALUES ('',81,108);
INSERT INTO `mob_skill_lists` VALUES ('',81,109);

-- INSERT INTO `mob_skill_lists` VALUES ('',2443,?,?);

-- Memory Receptacle
INSERT INTO `mob_skill_lists` VALUES ('',181,286);

-- Weeper
INSERT INTO `mob_skill_lists` VALUES ('',256,961);
INSERT INTO `mob_skill_lists` VALUES ('',256,962);
INSERT INTO `mob_skill_lists` VALUES ('',256,963);
INSERT INTO `mob_skill_lists` VALUES ('',256,964);
-- INSERT INTO `mob_skill_lists` VALUES ('',256,965);
-- INSERT INTO `mob_skill_lists` VALUES ('',256,966);
-- INSERT INTO `mob_skill_lists` VALUES ('',256,967);
-- INSERT INTO `mob_skill_lists` VALUES ('',256,968);
-- INSERT INTO `mob_skill_lists` VALUES ('',256,969);
-- INSERT INTO `mob_skill_lists` VALUES ('',256,970);
-- INSERT INTO `mob_skill_lists` VALUES ('',256,971);
INSERT INTO `mob_skill_lists` VALUES ('',256,972);

-- Wanderer
INSERT INTO `mob_skill_lists` VALUES ('',255,132);
INSERT INTO `mob_skill_lists` VALUES ('',255,133);
INSERT INTO `mob_skill_lists` VALUES ('',255,134);
INSERT INTO `mob_skill_lists` VALUES ('',255,135);

-- Gorger
INSERT INTO `mob_skill_lists` VALUES ('',137,485);
INSERT INTO `mob_skill_lists` VALUES ('',137,488);
INSERT INTO `mob_skill_lists` VALUES ('',137,491);
INSERT INTO `mob_skill_lists` VALUES ('',137,494);
INSERT INTO `mob_skill_lists` VALUES ('',137,496);

-- Gorger NM
INSERT INTO `mob_skill_lists` VALUES ('',708,485);
INSERT INTO `mob_skill_lists` VALUES ('',708,488);
INSERT INTO `mob_skill_lists` VALUES ('',708,491);
INSERT INTO `mob_skill_lists` VALUES ('',708,494);
INSERT INTO `mob_skill_lists` VALUES ('',708,496);
-- INSERT INTO `mob_skill_lists` VALUES ('',708,499);

-- Craver
INSERT INTO `mob_skill_lists` VALUES ('',78,973);
INSERT INTO `mob_skill_lists` VALUES ('',78,974);
INSERT INTO `mob_skill_lists` VALUES ('',78,975);
INSERT INTO `mob_skill_lists` VALUES ('',78,976);
INSERT INTO `mob_skill_lists` VALUES ('',78,977);

-- Craver NM
INSERT INTO `mob_skill_lists` VALUES ('',707,977);
INSERT INTO `mob_skill_lists` VALUES ('',707,975);
INSERT INTO `mob_skill_lists` VALUES ('',707,976);
INSERT INTO `mob_skill_lists` VALUES ('',707,978);
INSERT INTO `mob_skill_lists` VALUES ('',707,1018);

-- Thinker
INSERT INTO `mob_skill_lists` VALUES ('',241,986);
INSERT INTO `mob_skill_lists` VALUES ('',241,987);
INSERT INTO `mob_skill_lists` VALUES ('',241,988);
INSERT INTO `mob_skill_lists` VALUES ('',241,989);
INSERT INTO `mob_skill_lists` VALUES ('',241,990);
INSERT INTO `mob_skill_lists` VALUES ('',241,991);
INSERT INTO `mob_skill_lists` VALUES ('',241,992);
INSERT INTO `mob_skill_lists` VALUES ('',241,993);
INSERT INTO `mob_skill_lists` VALUES ('',241,994);

-- NM Thinker
INSERT INTO `mob_skill_lists` VALUES ('',706,987);
INSERT INTO `mob_skill_lists` VALUES ('',706,988);
INSERT INTO `mob_skill_lists` VALUES ('',706,989);
INSERT INTO `mob_skill_lists` VALUES ('',706,992);
INSERT INTO `mob_skill_lists` VALUES ('',706,995);
INSERT INTO `mob_skill_lists` VALUES ('',706,996);

-- Seether
INSERT INTO `mob_skill_lists` VALUES ('',220,997);
INSERT INTO `mob_skill_lists` VALUES ('',220,998);
INSERT INTO `mob_skill_lists` VALUES ('',220,999);
INSERT INTO `mob_skill_lists` VALUES ('',220,1000);
INSERT INTO `mob_skill_lists` VALUES ('',220,1002);

-- Lizard
INSERT INTO `mob_skill_lists` VALUES ('',174,110);
INSERT INTO `mob_skill_lists` VALUES ('',174,111);
INSERT INTO `mob_skill_lists` VALUES ('',174,112);
INSERT INTO `mob_skill_lists` VALUES ('',174,113);
INSERT INTO `mob_skill_lists` VALUES ('',174,116);
INSERT INTO `mob_skill_lists` VALUES ('',174,117);
INSERT INTO `mob_skill_lists` VALUES ('',174,114);
INSERT INTO `mob_skill_lists` VALUES ('',174,115);

-- Lizards (cold region)
INSERT INTO `mob_skill_lists` VALUES ('',97,110);
INSERT INTO `mob_skill_lists` VALUES ('',97,112);
INSERT INTO `mob_skill_lists` VALUES ('',97,113);
INSERT INTO `mob_skill_lists` VALUES ('',97,116);
INSERT INTO `mob_skill_lists` VALUES ('',97,117);
INSERT INTO `mob_skill_lists` VALUES ('',97,114);
INSERT INTO `mob_skill_lists` VALUES ('',97,115);
INSERT INTO `mob_skill_lists` VALUES ('',97,365);

-- Highlander Lizard
INSERT INTO `mob_skill_lists` VALUES ('',438,115);

-- Raptor (desert areas)
INSERT INTO `mob_skill_lists` VALUES ('',210,118);
INSERT INTO `mob_skill_lists` VALUES ('',210,120);
INSERT INTO `mob_skill_lists` VALUES ('',210,123);
INSERT INTO `mob_skill_lists` VALUES ('',210,124);

-- Raptors (thundery areas)
INSERT INTO `mob_skill_lists` VALUES ('',376,118);
INSERT INTO `mob_skill_lists` VALUES ('',376,122);
INSERT INTO `mob_skill_lists` VALUES ('',376,123);
INSERT INTO `mob_skill_lists` VALUES ('',376,124);

-- Raptors (cold areas)
INSERT INTO `mob_skill_lists` VALUES ('',377,118);
INSERT INTO `mob_skill_lists` VALUES ('',377,121);
INSERT INTO `mob_skill_lists` VALUES ('',377,123);
INSERT INTO `mob_skill_lists` VALUES ('',377,124);

-- Bugard
INSERT INTO `mob_skill_lists` VALUES ('',58,126);
INSERT INTO `mob_skill_lists` VALUES ('',58,127);
INSERT INTO `mob_skill_lists` VALUES ('',58,128);
INSERT INTO `mob_skill_lists` VALUES ('',58,129);
INSERT INTO `mob_skill_lists` VALUES ('',58,130);
INSERT INTO `mob_skill_lists` VALUES ('',58,131);

-- INSERT INTO `mob_skill_lists` VALUES ('',1107,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2387,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2439,?,?);

-- Giant Bats
INSERT INTO `mob_skill_lists` VALUES ('',46,138);
INSERT INTO `mob_skill_lists` VALUES ('',46,136);
INSERT INTO `mob_skill_lists` VALUES ('',46,900);
INSERT INTO `mob_skill_lists` VALUES ('',46,899);
-- INSERT INTO `mob_skill_lists` VALUES ('',46,0);

-- INSERT INTO `mob_skill_lists` VALUES ('',1145,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',46,899);

-- Bat Trio
INSERT INTO `mob_skill_lists` VALUES ('',47,137);
INSERT INTO `mob_skill_lists` VALUES ('',47,139);

-- Bat Trio (CoP,TOAU,WOTG)
-- INSERT INTO `mob_skill_lists` VALUES ('',137,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',139,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',901,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',902,?);

-- Greater Birds (Rocs on Wiki)
-- NOTES: Based on my retial testing,I can assume wiki info has the 2 sets of abilities reversed. I fought 5 different types
-- of normal birds,and they all did blind/giga/dread dive.
INSERT INTO `mob_skill_lists` VALUES ('',125,666);
INSERT INTO `mob_skill_lists` VALUES ('',125,667);
INSERT INTO `mob_skill_lists` VALUES ('',125,668);
INSERT INTO `mob_skill_lists` VALUES ('',125,146);
INSERT INTO `mob_skill_lists` VALUES ('',125,670);

-- INSERT INTO `mob_skill_lists` VALUES ('',143,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',144,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',145,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',146,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',147,?);

-- INSERT INTO `mob_skill_lists` VALUES ('',2447,?,?);

-- Cockatrices
INSERT INTO `mob_skill_lists` VALUES ('',70,150);
INSERT INTO `mob_skill_lists` VALUES ('',70,151);
INSERT INTO `mob_skill_lists` VALUES ('',70,152);
INSERT INTO `mob_skill_lists` VALUES ('',70,155);
INSERT INTO `mob_skill_lists` VALUES ('',70,154);

-- INSERT INTO `mob_skill_lists` VALUES ('',1077,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1079,?,?);

-- Leeches
INSERT INTO `mob_skill_lists` VALUES ('',172,158);
INSERT INTO `mob_skill_lists` VALUES ('',172,159);
INSERT INTO `mob_skill_lists` VALUES ('',172,160);
INSERT INTO `mob_skill_lists` VALUES ('',172,161);
INSERT INTO `mob_skill_lists` VALUES ('',172,167);
INSERT INTO `mob_skill_lists` VALUES ('',172,162);
INSERT INTO `mob_skill_lists` VALUES ('',172,165);
INSERT INTO `mob_skill_lists` VALUES ('',172,164);

-- INSERT INTO `mob_skill_lists` VALUES ('',70,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',71,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',69,?,?);

INSERT INTO `mob_skill_lists` VALUES ('',369,158);
INSERT INTO `mob_skill_lists` VALUES ('',369,159);
INSERT INTO `mob_skill_lists` VALUES ('',369,160);
INSERT INTO `mob_skill_lists` VALUES ('',369,161);
INSERT INTO `mob_skill_lists` VALUES ('',369,167);
INSERT INTO `mob_skill_lists` VALUES ('',369,162);
INSERT INTO `mob_skill_lists` VALUES ('',369,165);
INSERT INTO `mob_skill_lists` VALUES ('',369,164);

-- Worms
INSERT INTO `mob_skill_lists` VALUES ('',258,168);
INSERT INTO `mob_skill_lists` VALUES ('',258,169);
INSERT INTO `mob_skill_lists` VALUES ('',258,170);
INSERT INTO `mob_skill_lists` VALUES ('',258,171);
INSERT INTO `mob_skill_lists` VALUES ('',258,173);
INSERT INTO `mob_skill_lists` VALUES ('',258,172);

-- INSERT INTO `mob_skill_lists` VALUES ('',258,1633);

-- Slimes
INSERT INTO `mob_skill_lists` VALUES ('',228,175);
INSERT INTO `mob_skill_lists` VALUES ('',228,176);
INSERT INTO `mob_skill_lists` VALUES ('',228,177);

-- INSERT INTO `mob_skill_lists` VALUES ('',2294,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2258,?,?);

-- Slimes (ToAU Clots?)
-- INSERT INTO `mob_skill_lists` VALUES ('',175,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',177,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',176,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',?,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2296,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2295,?,?);

-- Clot
INSERT INTO `mob_skill_lists` VALUES ('',66,175);
INSERT INTO `mob_skill_lists` VALUES ('',66,176);
INSERT INTO `mob_skill_lists` VALUES ('',66,177);

INSERT INTO `mob_skill_lists` VALUES ('',229,175);
INSERT INTO `mob_skill_lists` VALUES ('',229,176);
INSERT INTO `mob_skill_lists` VALUES ('',229,177);

INSERT INTO `mob_skill_lists` VALUES ('',230,175);
INSERT INTO `mob_skill_lists` VALUES ('',230,176);
INSERT INTO `mob_skill_lists` VALUES ('',230,177);

-- Hecteyes
INSERT INTO `mob_skill_lists` VALUES ('',139,181);
INSERT INTO `mob_skill_lists` VALUES ('',139,182);
INSERT INTO `mob_skill_lists` VALUES ('',139,184);

-- Hecteyes (CoP + ?)
-- INSERT INTO `mob_skill_lists` VALUES ('',183,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',184,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',139,181);

-- Crab
INSERT INTO `mob_skill_lists` VALUES ('',75,188);
INSERT INTO `mob_skill_lists` VALUES ('',75,187);
INSERT INTO `mob_skill_lists` VALUES ('',75,186);
INSERT INTO `mob_skill_lists` VALUES ('',75,192);
INSERT INTO `mob_skill_lists` VALUES ('',75,189);

-- INSERT INTO `mob_skill_lists` VALUES ('',2257,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2256,?,?);

INSERT INTO `mob_skill_lists` VALUES ('',76,188);
INSERT INTO `mob_skill_lists` VALUES ('',76,187);
INSERT INTO `mob_skill_lists` VALUES ('',76,186);
INSERT INTO `mob_skill_lists` VALUES ('',76,192);
INSERT INTO `mob_skill_lists` VALUES ('',76,189);

INSERT INTO `mob_skill_lists` VALUES ('',77,188);
INSERT INTO `mob_skill_lists` VALUES ('',77,187);
INSERT INTO `mob_skill_lists` VALUES ('',77,186);
INSERT INTO `mob_skill_lists` VALUES ('',77,192);
INSERT INTO `mob_skill_lists` VALUES ('',77,189);

INSERT INTO `mob_skill_lists` VALUES ('',372,188);
INSERT INTO `mob_skill_lists` VALUES ('',372,187);
INSERT INTO `mob_skill_lists` VALUES ('',372,186);
INSERT INTO `mob_skill_lists` VALUES ('',372,192);
INSERT INTO `mob_skill_lists` VALUES ('',372,189);

-- Tegmine
INSERT INTO `mob_skill_lists` VALUES ('',400,187);
INSERT INTO `mob_skill_lists` VALUES ('',400,186);

-- Shadows
INSERT INTO `mob_skill_lists` VALUES ('',221,3839);
INSERT INTO `mob_skill_lists` VALUES ('',222,3839);
INSERT INTO `mob_skill_lists` VALUES ('',223,3839);

-- Pugil
INSERT INTO `mob_skill_lists` VALUES ('',197,195);
INSERT INTO `mob_skill_lists` VALUES ('',197,196);
INSERT INTO `mob_skill_lists` VALUES ('',197,197);
INSERT INTO `mob_skill_lists` VALUES ('',197,198);
INSERT INTO `mob_skill_lists` VALUES ('',197,194);
INSERT INTO `mob_skill_lists` VALUES ('',197,193);

-- Pugils (Jagils Subspecies)
INSERT INTO `mob_skill_lists` VALUES ('',709,193);
INSERT INTO `mob_skill_lists` VALUES ('',709,194);
INSERT INTO `mob_skill_lists` VALUES ('',709,195);
INSERT INTO `mob_skill_lists` VALUES ('',709,197);
INSERT INTO `mob_skill_lists` VALUES ('',709,198);
INSERT INTO `mob_skill_lists` VALUES ('',709,385);

-- Pugils (Dynamis - Nightmare Makara) ?
-- INSERT INTO `mob_skill_lists` VALUES ('',1610,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1612,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1613,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1609,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1608,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1614,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1611,?,?);

-- Sea Monks
INSERT INTO `mob_skill_lists` VALUES ('',218,202);
INSERT INTO `mob_skill_lists` VALUES ('',218,203);
INSERT INTO `mob_skill_lists` VALUES ('',218,204);
INSERT INTO `mob_skill_lists` VALUES ('',218,205);
INSERT INTO `mob_skill_lists` VALUES ('',218,206);
INSERT INTO `mob_skill_lists` VALUES ('',218,207);
INSERT INTO `mob_skill_lists` VALUES ('',218,200);

INSERT INTO `mob_skill_lists` VALUES ('',219,202);
INSERT INTO `mob_skill_lists` VALUES ('',219,203);
INSERT INTO `mob_skill_lists` VALUES ('',219,204);
INSERT INTO `mob_skill_lists` VALUES ('',219,205);
INSERT INTO `mob_skill_lists` VALUES ('',219,206);
INSERT INTO `mob_skill_lists` VALUES ('',219,207);
INSERT INTO `mob_skill_lists` VALUES ('',219,200);

-- Hounds
INSERT INTO `mob_skill_lists` VALUES ('',142,209);
INSERT INTO `mob_skill_lists` VALUES ('',142,210);
INSERT INTO `mob_skill_lists` VALUES ('',142,211);
INSERT INTO `mob_skill_lists` VALUES ('',142,212);
INSERT INTO `mob_skill_lists` VALUES ('',142,213);
INSERT INTO `mob_skill_lists` VALUES ('',142,214);

INSERT INTO `mob_skill_lists` VALUES ('',143,209);
INSERT INTO `mob_skill_lists` VALUES ('',143,210);
INSERT INTO `mob_skill_lists` VALUES ('',143,211);
INSERT INTO `mob_skill_lists` VALUES ('',143,212);
INSERT INTO `mob_skill_lists` VALUES ('',143,213);
INSERT INTO `mob_skill_lists` VALUES ('',143,214);

-- Ghost
INSERT INTO `mob_skill_lists` VALUES ('',121,220);
INSERT INTO `mob_skill_lists` VALUES ('',121,218);
INSERT INTO `mob_skill_lists` VALUES ('',121,219);
INSERT INTO `mob_skill_lists` VALUES ('',121,217);
INSERT INTO `mob_skill_lists` VALUES ('',121,221);
INSERT INTO `mob_skill_lists` VALUES ('',121,216);

-- Ghosts (Bhoot Subspecies)
-- INSERT INTO `mob_skill_lists` VALUES ('',1538,?,?);

-- Skeletons
INSERT INTO `mob_skill_lists` VALUES ('',227,222);
INSERT INTO `mob_skill_lists` VALUES ('',227,223);
INSERT INTO `mob_skill_lists` VALUES ('',227,228);
INSERT INTO `mob_skill_lists` VALUES ('',227,229);
-- INSERT INTO `mob_skill_lists` VALUES ('',?,227,?);

-- Skeletons (Drauger Subspecies)
-- INSERT INTO `mob_skill_lists` VALUES ('',?,?,?);

-- INSERT INTO `mob_skill_lists` VALUES ('',?,?,?);

-- Coeurls
INSERT INTO `mob_skill_lists` VALUES ('',71,396);
INSERT INTO `mob_skill_lists` VALUES ('',71,397);
-- INSERT INTO `mob_skill_lists` VALUES ('',0,224);
-- INSERT INTO `mob_skill_lists` VALUES ('',0,225);
-- INSERT INTO `mob_skill_lists` VALUES ('',0,226);
-- INSERT INTO `mob_skill_lists` VALUES ('',0,227);
-- INSERT INTO `mob_skill_lists` VALUES ('',1953,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',?,?,?);

-- Doomed
INSERT INTO `mob_skill_lists` VALUES ('',86,233);
INSERT INTO `mob_skill_lists` VALUES ('',86,234);
INSERT INTO `mob_skill_lists` VALUES ('',86,236);
INSERT INTO `mob_skill_lists` VALUES ('',86,232);
INSERT INTO `mob_skill_lists` VALUES ('',86,235);
INSERT INTO `mob_skill_lists` VALUES ('',86,230);

-- INSERT INTO `mob_skill_lists` VALUES ('',1082,?,?);

-- Bombs
INSERT INTO `mob_skill_lists` VALUES ('',56,255);
INSERT INTO `mob_skill_lists` VALUES ('',56,254);

-- Bombs (TOAU [Big Bomb PH: Friar's Lantern Version])
-- NOTE: Might be the same for TOAU NMs also
-- INSERT INTO `mob_skill_lists` VALUES ('',337,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',338,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',339,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',340,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',253,?);

-- Evil Weapons
INSERT INTO `mob_skill_lists` VALUES ('',110,257);
INSERT INTO `mob_skill_lists` VALUES ('',110,258);

-- INSERT INTO `mob_skill_lists` VALUES ('',?,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',?,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',?,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',?,?,?);

-- Magic Pot
INSERT INTO `mob_skill_lists` VALUES ('',175,269);
INSERT INTO `mob_skill_lists` VALUES ('',175,267);
INSERT INTO `mob_skill_lists` VALUES ('',175,265);
INSERT INTO `mob_skill_lists` VALUES ('',175,264);
INSERT INTO `mob_skill_lists` VALUES ('',175,266);
INSERT INTO `mob_skill_lists` VALUES ('',175,268);

-- Dolls
INSERT INTO `mob_skill_lists` VALUES ('',83,278);
INSERT INTO `mob_skill_lists` VALUES ('',83,279);
INSERT INTO `mob_skill_lists` VALUES ('',83,280);
INSERT INTO `mob_skill_lists` VALUES ('',83,281);
INSERT INTO `mob_skill_lists` VALUES ('',83,282);
INSERT INTO `mob_skill_lists` VALUES ('',83,283);
INSERT INTO `mob_skill_lists` VALUES ('',83,285);
INSERT INTO `mob_skill_lists` VALUES ('',83,287);

INSERT INTO `mob_skill_lists` VALUES ('',84,278);
INSERT INTO `mob_skill_lists` VALUES ('',84,279);
INSERT INTO `mob_skill_lists` VALUES ('',84,280);
INSERT INTO `mob_skill_lists` VALUES ('',84,281);
INSERT INTO `mob_skill_lists` VALUES ('',84,282);
INSERT INTO `mob_skill_lists` VALUES ('',84,283);
INSERT INTO `mob_skill_lists` VALUES ('',84,285);
INSERT INTO `mob_skill_lists` VALUES ('',84,287);

INSERT INTO `mob_skill_lists` VALUES ('',85,278);
INSERT INTO `mob_skill_lists` VALUES ('',85,279);
INSERT INTO `mob_skill_lists` VALUES ('',85,280);
INSERT INTO `mob_skill_lists` VALUES ('',85,281);
INSERT INTO `mob_skill_lists` VALUES ('',85,282);
INSERT INTO `mob_skill_lists` VALUES ('',85,283);
INSERT INTO `mob_skill_lists` VALUES ('',85,285);
INSERT INTO `mob_skill_lists` VALUES ('',85,287);

-- Calcabrina
INSERT INTO `mob_skill_lists` VALUES ('',395,281);

-- Martinet
INSERT INTO `mob_skill_lists` VALUES ('',401,279);

-- Ahriman
INSERT INTO `mob_skill_lists` VALUES ('',4,292);
INSERT INTO `mob_skill_lists` VALUES ('',4,293);
INSERT INTO `mob_skill_lists` VALUES ('',4,294);
INSERT INTO `mob_skill_lists` VALUES ('',4,295);
INSERT INTO `mob_skill_lists` VALUES ('',4,296);
INSERT INTO `mob_skill_lists` VALUES ('',4,297);
INSERT INTO `mob_skill_lists` VALUES ('',4,299);
INSERT INTO `mob_skill_lists` VALUES ('',4,301);

-- Demons
INSERT INTO `mob_skill_lists` VALUES ('',169,303);
INSERT INTO `mob_skill_lists` VALUES ('',169,304);
INSERT INTO `mob_skill_lists` VALUES ('',169,307);
INSERT INTO `mob_skill_lists` VALUES ('',169,892);

-- INSERT INTO `mob_skill_lists` VALUES ('',2116,?,?);

-- Demons (Dynamis)
-- probably uses WS ID's 889-894
INSERT INTO `mob_skill_lists` VALUES ('',358,303);
INSERT INTO `mob_skill_lists` VALUES ('',358,304);
INSERT INTO `mob_skill_lists` VALUES ('',358,307);
INSERT INTO `mob_skill_lists` VALUES ('',358,892);
INSERT INTO `mob_skill_lists` VALUES ('',358,893);

-- Duke Focalor
INSERT INTO `mob_skill_lists` VALUES ('',399,303);

-- Goobbue
INSERT INTO `mob_skill_lists` VALUES ('',136,325);
INSERT INTO `mob_skill_lists` VALUES ('',136,327);
INSERT INTO `mob_skill_lists` VALUES ('',136,328);
INSERT INTO `mob_skill_lists` VALUES ('',136,330);
INSERT INTO `mob_skill_lists` VALUES ('',136,331);

-- Nant'ina (Dynamis - Valkurm)
-- Note: Uses Blow and Uppercut as normal attack round moves. WS message is displayed.
-- INSERT INTO `mob_skill_lists` VALUES ('',1361,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1362,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1363,?);

-- Goblins
INSERT INTO `mob_skill_lists` VALUES ('',133,334);
INSERT INTO `mob_skill_lists` VALUES ('',133,335);
INSERT INTO `mob_skill_lists` VALUES ('',133,336);

-- Dynamis Goblin (Vanguard Type)
INSERT INTO `mob_skill_lists` VALUES ('',327,334);
INSERT INTO `mob_skill_lists` VALUES ('',327,335);
INSERT INTO `mob_skill_lists` VALUES ('',327,826);
INSERT INTO `mob_skill_lists` VALUES ('',327,828);
INSERT INTO `mob_skill_lists` VALUES ('',327,830);

-- Dynamis Goblin (Vanguard NM Type)
INSERT INTO `mob_skill_lists` VALUES ('',373,334);
INSERT INTO `mob_skill_lists` VALUES ('',373,335);
INSERT INTO `mob_skill_lists` VALUES ('',373,826);
INSERT INTO `mob_skill_lists` VALUES ('',373,828);
INSERT INTO `mob_skill_lists` VALUES ('',373,830);
INSERT INTO `mob_skill_lists` VALUES ('',373,843);
INSERT INTO `mob_skill_lists` VALUES ('',373,844);
INSERT INTO `mob_skill_lists` VALUES ('',373,845);
INSERT INTO `mob_skill_lists` VALUES ('',373,846);
INSERT INTO `mob_skill_lists` VALUES ('',373,847);
INSERT INTO `mob_skill_lists` VALUES ('',373,848);
INSERT INTO `mob_skill_lists` VALUES ('',373,849);
INSERT INTO `mob_skill_lists` VALUES ('',373,850);
INSERT INTO `mob_skill_lists` VALUES ('',373,851);
INSERT INTO `mob_skill_lists` VALUES ('',373,852);
INSERT INTO `mob_skill_lists` VALUES ('',373,853);

-- Orcs
INSERT INTO `mob_skill_lists` VALUES ('',189,377);
INSERT INTO `mob_skill_lists` VALUES ('',189,353);
INSERT INTO `mob_skill_lists` VALUES ('',189,352);
INSERT INTO `mob_skill_lists` VALUES ('',189,351);
INSERT INTO `mob_skill_lists` VALUES ('',189,349);
INSERT INTO `mob_skill_lists` VALUES ('',189,350);
-- warlord Rojgnoj
INSERT INTO `mob_skill_lists` VALUES ('',334,438);
-- left hand
INSERT INTO `mob_skill_lists` VALUES ('',334,435);
-- Yukvok of clan death
INSERT INTO `mob_skill_lists` VALUES ('',334,479);
-- right hand
INSERT INTO `mob_skill_lists` VALUES ('',334,439);

INSERT INTO `mob_skill_lists` VALUES ('Orc DRG',713,808);
INSERT INTO `mob_skill_lists` VALUES ('Orc DRG',713,377);
INSERT INTO `mob_skill_lists` VALUES ('Orc DRG',713,353);
INSERT INTO `mob_skill_lists` VALUES ('Orc DRG',713,352);
INSERT INTO `mob_skill_lists` VALUES ('Orc DRG',713,351);
INSERT INTO `mob_skill_lists` VALUES ('Orc DRG',713,349);
INSERT INTO `mob_skill_lists` VALUES ('Orc DRG',713,350);

-- INSERT INTO `mob_skill_lists` VALUES ('',810,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2155,?,?);

-- Orcs (WOTG only)
-- INSERT INTO `mob_skill_lists` VALUES ('',334,1945);

-- INSERT INTO `mob_skill_lists` VALUES ('',2007,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1946,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2008,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2117,?,?);

-- Orcish NM
INSERT INTO `mob_skill_lists` VALUES ('',334,353);
INSERT INTO `mob_skill_lists` VALUES ('',334,352);
INSERT INTO `mob_skill_lists` VALUES ('',334,351);
INSERT INTO `mob_skill_lists` VALUES ('',334,349);
INSERT INTO `mob_skill_lists` VALUES ('',334,350);
INSERT INTO `mob_skill_lists` VALUES ('',334,810);

-- Quadav
INSERT INTO `mob_skill_lists` VALUES ('',200,355);
INSERT INTO `mob_skill_lists` VALUES ('',200,377);
INSERT INTO `mob_skill_lists` VALUES ('',200,356);
INSERT INTO `mob_skill_lists` VALUES ('',200,357);
INSERT INTO `mob_skill_lists` VALUES ('',200,358);

-- INSERT INTO `mob_skill_lists` VALUES ('',2156,?,?);

INSERT INTO `mob_skill_lists` VALUES ('',201,377);
INSERT INTO `mob_skill_lists` VALUES ('',201,355);
INSERT INTO `mob_skill_lists` VALUES ('',201,356);
INSERT INTO `mob_skill_lists` VALUES ('',201,357);
INSERT INTO `mob_skill_lists` VALUES ('',201,358);

INSERT INTO `mob_skill_lists` VALUES ('',202,377);
INSERT INTO `mob_skill_lists` VALUES ('',202,355);
INSERT INTO `mob_skill_lists` VALUES ('',202,356);
INSERT INTO `mob_skill_lists` VALUES ('',202,357);
INSERT INTO `mob_skill_lists` VALUES ('',202,358);

-- Quadav (Armored Model)
-- INSERT INTO `mob_skill_lists` VALUES ('',1967,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1970,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1969,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1971,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1968,?);

-- INSERT INTO `mob_skill_lists` VALUES ('',2156,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',?,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',?,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2118,?,?);

-- Qu'Vho Deathhurler
INSERT INTO `mob_skill_lists` VALUES ('',397,355);

-- Quadav NM
INSERT INTO `mob_skill_lists` VALUES ('',337,377);
INSERT INTO `mob_skill_lists` VALUES ('',337,355);
INSERT INTO `mob_skill_lists` VALUES ('',337,356);
INSERT INTO `mob_skill_lists` VALUES ('',337,357);
INSERT INTO `mob_skill_lists` VALUES ('',337,358);

-- INSERT INTO `mob_skill_lists` VALUES ('',1977,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1978,?);

-- Yagudo
INSERT INTO `mob_skill_lists` VALUES ('',270,361);
INSERT INTO `mob_skill_lists` VALUES ('',270,377);
INSERT INTO `mob_skill_lists` VALUES ('',270,362);
INSERT INTO `mob_skill_lists` VALUES ('',270,363);
INSERT INTO `mob_skill_lists` VALUES ('',270,364);

-- INSERT INTO `mob_skill_lists` VALUES ('',1742,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1746,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1743,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1744,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1745,?,?);

-- Yagudo NM
INSERT INTO `mob_skill_lists` VALUES ('',360,361);
INSERT INTO `mob_skill_lists` VALUES ('',360,377);
INSERT INTO `mob_skill_lists` VALUES ('',360,362);
INSERT INTO `mob_skill_lists` VALUES ('',360,363);
INSERT INTO `mob_skill_lists` VALUES ('',360,364);

-- Yagudo Dynamis NM
INSERT INTO `mob_skill_lists` VALUES ('',710,361);
INSERT INTO `mob_skill_lists` VALUES ('',710,377);
INSERT INTO `mob_skill_lists` VALUES ('',710,362);
INSERT INTO `mob_skill_lists` VALUES ('',710,363);
INSERT INTO `mob_skill_lists` VALUES ('',710,364);
INSERT INTO `mob_skill_lists` VALUES ('',710,811);

-- Yagudo (WoTG)
-- INSERT INTO `mob_skill_lists` VALUES ('',1949,?);

-- INSERT INTO `mob_skill_lists` VALUES ('',1950,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2014,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1680,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2013,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2119,?,?);

-- Birds
INSERT INTO `mob_skill_lists` VALUES ('',55,366);
INSERT INTO `mob_skill_lists` VALUES ('',55,367);

-- Birds (COP,TOAU)
-- INSERT INTO `mob_skill_lists` VALUES ('',55,366,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',55,367,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1324,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1323,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1322,?);

-- Behemoth
INSERT INTO `mob_skill_lists` VALUES ('',51,372);
INSERT INTO `mob_skill_lists` VALUES ('',51,373);
INSERT INTO `mob_skill_lists` VALUES ('',51,374);
INSERT INTO `mob_skill_lists` VALUES ('',51,375);
INSERT INTO `mob_skill_lists` VALUES ('',51,376);
INSERT INTO `mob_skill_lists` VALUES ('',51,377);
-- INSERT INTO `mob_skill_lists` VALUES ('',51,378);

-- King Behemoth
INSERT INTO `mob_skill_lists` VALUES ('',479,372);
INSERT INTO `mob_skill_lists` VALUES ('',479,373);
INSERT INTO `mob_skill_lists` VALUES ('',479,374);
INSERT INTO `mob_skill_lists` VALUES ('',479,375);
INSERT INTO `mob_skill_lists` VALUES ('',479,376);
INSERT INTO `mob_skill_lists` VALUES ('',479,377);

-- Behemoth (Elasmoth subspecies)
-- INSERT INTO `mob_skill_lists` VALUES ('',2134,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2135,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2330,?,?);

-- Warmachine
INSERT INTO `mob_skill_lists` VALUES ('',190,379);
INSERT INTO `mob_skill_lists` VALUES ('',190,380);
INSERT INTO `mob_skill_lists` VALUES ('',190,381);
INSERT INTO `mob_skill_lists` VALUES ('',190,382);
INSERT INTO `mob_skill_lists` VALUES ('',190,383);

-- Dragons (4 footed variety)
INSERT INTO `mob_skill_lists` VALUES ('',87,386);
INSERT INTO `mob_skill_lists` VALUES ('',87,387);
INSERT INTO `mob_skill_lists` VALUES ('',87,388);
INSERT INTO `mob_skill_lists` VALUES ('',87,389);
INSERT INTO `mob_skill_lists` VALUES ('',87,390);
INSERT INTO `mob_skill_lists` VALUES ('',87,391);
INSERT INTO `mob_skill_lists` VALUES ('',87,392);
INSERT INTO `mob_skill_lists` VALUES ('',87,393);
INSERT INTO `mob_skill_lists` VALUES ('',87,394);
INSERT INTO `mob_skill_lists` VALUES ('',87,395);


-- Dragons (Dahak Subspecies)
-- INSERT INTO `mob_skill_lists` VALUES ('',386,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',387,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',388,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',389,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',390,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',391,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',392,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',394,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',395,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1536,?,?);

-- Flies
INSERT INTO `mob_skill_lists` VALUES ('',113,403);
INSERT INTO `mob_skill_lists` VALUES ('',113,404);

INSERT INTO `mob_skill_lists` VALUES ('',374,404);

-- Flies (CoP+ToAU+Abyssea)
INSERT INTO `mob_skill_lists` VALUES ('',375,62);
INSERT INTO `mob_skill_lists` VALUES ('',375,403);
INSERT INTO `mob_skill_lists` VALUES ('',375,404);
-- INSERT INTO `mob_skill_lists` VALUES ('',?,375,?);

-- Gigas (non-abyssea?)
INSERT INTO `mob_skill_lists` VALUES ('',126,406);
INSERT INTO `mob_skill_lists` VALUES ('',126,407);
INSERT INTO `mob_skill_lists` VALUES ('',126,408);
INSERT INTO `mob_skill_lists` VALUES ('',126,409);
INSERT INTO `mob_skill_lists` VALUES ('',126,410);
INSERT INTO `mob_skill_lists` VALUES ('',126,411);

INSERT INTO `mob_skill_lists` VALUES ('',127,406);
INSERT INTO `mob_skill_lists` VALUES ('',127,407);
INSERT INTO `mob_skill_lists` VALUES ('',127,408);
INSERT INTO `mob_skill_lists` VALUES ('',127,409);
INSERT INTO `mob_skill_lists` VALUES ('',127,410);
INSERT INTO `mob_skill_lists` VALUES ('',127,411);

INSERT INTO `mob_skill_lists` VALUES ('',128,406);
INSERT INTO `mob_skill_lists` VALUES ('',128,407);
INSERT INTO `mob_skill_lists` VALUES ('',128,408);
INSERT INTO `mob_skill_lists` VALUES ('',128,409);
INSERT INTO `mob_skill_lists` VALUES ('',128,410);
INSERT INTO `mob_skill_lists` VALUES ('',128,411);

INSERT INTO `mob_skill_lists` VALUES ('',129,406);
INSERT INTO `mob_skill_lists` VALUES ('',129,407);
INSERT INTO `mob_skill_lists` VALUES ('',129,408);
INSERT INTO `mob_skill_lists` VALUES ('',129,409);
INSERT INTO `mob_skill_lists` VALUES ('',129,410);
INSERT INTO `mob_skill_lists` VALUES ('',129,411);

INSERT INTO `mob_skill_lists` VALUES ('',130,406);
INSERT INTO `mob_skill_lists` VALUES ('',130,407);
INSERT INTO `mob_skill_lists` VALUES ('',130,408);
INSERT INTO `mob_skill_lists` VALUES ('',130,409);
INSERT INTO `mob_skill_lists` VALUES ('',130,410);
INSERT INTO `mob_skill_lists` VALUES ('',130,411);

-- INSERT INTO `mob_skill_lists` VALUES ('',1380,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2093,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',?,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2322,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',?,?,?);

-- Shadow Lord
INSERT INTO `mob_skill_lists` VALUES ('',224,412);
INSERT INTO `mob_skill_lists` VALUES ('',224,415);
INSERT INTO `mob_skill_lists` VALUES ('',224,416);
INSERT INTO `mob_skill_lists` VALUES ('',224,417);
INSERT INTO `mob_skill_lists` VALUES ('',225,413);

-- Golems
INSERT INTO `mob_skill_lists` VALUES ('',135,418);
INSERT INTO `mob_skill_lists` VALUES ('',135,419);
INSERT INTO `mob_skill_lists` VALUES ('',135,420);
INSERT INTO `mob_skill_lists` VALUES ('',135,421);
INSERT INTO `mob_skill_lists` VALUES ('',135,422);
INSERT INTO `mob_skill_lists` VALUES ('',135,423);
INSERT INTO `mob_skill_lists` VALUES ('',135,424);
INSERT INTO `mob_skill_lists` VALUES ('',135,425);
INSERT INTO `mob_skill_lists` VALUES ('',135,426);

-- Sapling
INSERT INTO `mob_skill_lists` VALUES ('',216,429);
INSERT INTO `mob_skill_lists` VALUES ('',216,430);
INSERT INTO `mob_skill_lists` VALUES ('',216,431);

-- Ghillie Dhu
INSERT INTO `mob_skill_lists` VALUES ('',437,429);

-- Cardians
INSERT INTO `mob_skill_lists` VALUES ('',61,427);
INSERT INTO `mob_skill_lists` VALUES ('',61,428);
INSERT INTO `mob_skill_lists` VALUES ('',61,77);
INSERT INTO `mob_skill_lists` VALUES ('',61,74);

-- anim 432 = 2h cloud
-- now they dont start matching up....

-- Sahagin (-72 for anim id)
INSERT INTO `mob_skill_lists` VALUES ('',213,515);
INSERT INTO `mob_skill_lists` VALUES ('',213,521);
INSERT INTO `mob_skill_lists` VALUES ('',213,524);
INSERT INTO `mob_skill_lists` VALUES ('',213,518);

INSERT INTO `mob_skill_lists` VALUES ('Sahagin DRG',712,514);
INSERT INTO `mob_skill_lists` VALUES ('Sahagin DRG',712,515);
INSERT INTO `mob_skill_lists` VALUES ('Sahagin DRG',712,521);
INSERT INTO `mob_skill_lists` VALUES ('Sahagin DRG',712,524);
INSERT INTO `mob_skill_lists` VALUES ('Sahagin DRG',712,518);

-- Tonberries
INSERT INTO `mob_skill_lists` VALUES ('',243,527);
INSERT INTO `mob_skill_lists` VALUES ('',243,528);
INSERT INTO `mob_skill_lists` VALUES ('',243,529);
INSERT INTO `mob_skill_lists` VALUES ('',243,530);
INSERT INTO `mob_skill_lists` VALUES ('',243,531);
INSERT INTO `mob_skill_lists` VALUES ('',243,532);
INSERT INTO `mob_skill_lists` VALUES ('',243,664);
INSERT INTO `mob_skill_lists` VALUES ('',243,665);

-- INSERT INTO `mob_skill_lists` VALUES ('',2137,?,?);

-- Golden-Tongued Culberry (Different mag resists)
INSERT INTO `mob_skill_lists` VALUES ('',244,527);
INSERT INTO `mob_skill_lists` VALUES ('',244,528);
INSERT INTO `mob_skill_lists` VALUES ('',244,529);
INSERT INTO `mob_skill_lists` VALUES ('',244,530);
INSERT INTO `mob_skill_lists` VALUES ('',244,531);
INSERT INTO `mob_skill_lists` VALUES ('',244,532);
INSERT INTO `mob_skill_lists` VALUES ('',244,664);
INSERT INTO `mob_skill_lists` VALUES ('',244,665);

-- Grav'iton
INSERT INTO `mob_skill_lists` VALUES ('',282,527);
INSERT INTO `mob_skill_lists` VALUES ('',282,528);
INSERT INTO `mob_skill_lists` VALUES ('',282,529);
INSERT INTO `mob_skill_lists` VALUES ('',282,530);
INSERT INTO `mob_skill_lists` VALUES ('',282,531);
INSERT INTO `mob_skill_lists` VALUES ('',282,532);
INSERT INTO `mob_skill_lists` VALUES ('',282,664);
INSERT INTO `mob_skill_lists` VALUES ('',282,665);

-- ZM4 Tonberries
INSERT INTO `mob_skill_lists` VALUES ('',336,527);
INSERT INTO `mob_skill_lists` VALUES ('',336,528);
INSERT INTO `mob_skill_lists` VALUES ('',336,529);
INSERT INTO `mob_skill_lists` VALUES ('',336,530);
INSERT INTO `mob_skill_lists` VALUES ('',336,531);
INSERT INTO `mob_skill_lists` VALUES ('',336,532);
INSERT INTO `mob_skill_lists` VALUES ('',336,664);

-- Antica
INSERT INTO `mob_skill_lists` VALUES ('',25,535);
INSERT INTO `mob_skill_lists` VALUES ('',25,536);
INSERT INTO `mob_skill_lists` VALUES ('',25,540);
INSERT INTO `mob_skill_lists` VALUES ('',25,537);
INSERT INTO `mob_skill_lists` VALUES ('',25,538);
INSERT INTO `mob_skill_lists` VALUES ('',25,534);
INSERT INTO `mob_skill_lists` VALUES ('',25,539);
INSERT INTO `mob_skill_lists` VALUES ('',25,533);

-- Manticore
INSERT INTO `mob_skill_lists` VALUES ('',179,541);
INSERT INTO `mob_skill_lists` VALUES ('',179,542);
INSERT INTO `mob_skill_lists` VALUES ('',179,543);
INSERT INTO `mob_skill_lists` VALUES ('',179,544);
INSERT INTO `mob_skill_lists` VALUES ('',179,545);
INSERT INTO `mob_skill_lists` VALUES ('',179,546);
INSERT INTO `mob_skill_lists` VALUES ('',179,547);

-- Kirin
INSERT INTO `mob_skill_lists` VALUES ('',281,541);
INSERT INTO `mob_skill_lists` VALUES ('',281,542);
INSERT INTO `mob_skill_lists` VALUES ('',281,543);
INSERT INTO `mob_skill_lists` VALUES ('',281,544);
INSERT INTO `mob_skill_lists` VALUES ('',281,545);
INSERT INTO `mob_skill_lists` VALUES ('',281,546);
INSERT INTO `mob_skill_lists` VALUES ('',281,547);
INSERT INTO `mob_skill_lists` VALUES ('',281,478);

-- Kirin's Avatar
INSERT INTO `mob_skill_lists` VALUES ('',495,656);
INSERT INTO `mob_skill_lists` VALUES ('',495,583);
INSERT INTO `mob_skill_lists` VALUES ('',495,657);
INSERT INTO `mob_skill_lists` VALUES ('',495,661);
INSERT INTO `mob_skill_lists` VALUES ('',495,659);
INSERT INTO `mob_skill_lists` VALUES ('',495,662);
INSERT INTO `mob_skill_lists` VALUES ('',495,660);
INSERT INTO `mob_skill_lists` VALUES ('',495,658);

-- Pet Suzaku
INSERT INTO `mob_skill_lists` VALUES ('',333,143);
INSERT INTO `mob_skill_lists` VALUES ('',333,144);
INSERT INTO `mob_skill_lists` VALUES ('',333,145);
INSERT INTO `mob_skill_lists` VALUES ('',333,146);
INSERT INTO `mob_skill_lists` VALUES ('',333,147);

-- Pet Genbu
INSERT INTO `mob_skill_lists` VALUES ('',330,549);
INSERT INTO `mob_skill_lists` VALUES ('',330,550);
INSERT INTO `mob_skill_lists` VALUES ('',330,551);
INSERT INTO `mob_skill_lists` VALUES ('',330,552);
INSERT INTO `mob_skill_lists` VALUES ('',330,553);

-- Pet Seiryu
INSERT INTO `mob_skill_lists` VALUES ('',331,558);
INSERT INTO `mob_skill_lists` VALUES ('',331,559);
INSERT INTO `mob_skill_lists` VALUES ('',331,560);
INSERT INTO `mob_skill_lists` VALUES ('',331,561);
INSERT INTO `mob_skill_lists` VALUES ('',331,562);
INSERT INTO `mob_skill_lists` VALUES ('',331,565);

-- Pet Byakko
INSERT INTO `mob_skill_lists` VALUES ('',332,14);
INSERT INTO `mob_skill_lists` VALUES ('',332,15);
INSERT INTO `mob_skill_lists` VALUES ('',332,17);

-- Adamantoises
INSERT INTO `mob_skill_lists` VALUES ('',2,548);
INSERT INTO `mob_skill_lists` VALUES ('',2,549);
INSERT INTO `mob_skill_lists` VALUES ('',2,550);
INSERT INTO `mob_skill_lists` VALUES ('',2,551);
INSERT INTO `mob_skill_lists` VALUES ('',2,552);
INSERT INTO `mob_skill_lists` VALUES ('',2,553);

-- INSERT INTO `mob_skill_lists` VALUES ('',2329,?,?);

-- Spiders
INSERT INTO `mob_skill_lists` VALUES ('',235,554);
INSERT INTO `mob_skill_lists` VALUES ('',235,555);
INSERT INTO `mob_skill_lists` VALUES ('',235,556);

-- Spiders (NM?)
-- INSERT INTO `mob_skill_lists` VALUES ('',703,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',704,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',705,?,?);

-- Wyverns
INSERT INTO `mob_skill_lists` VALUES ('',265,557);
INSERT INTO `mob_skill_lists` VALUES ('',265,558);
INSERT INTO `mob_skill_lists` VALUES ('',265,559);
INSERT INTO `mob_skill_lists` VALUES ('',265,560);
INSERT INTO `mob_skill_lists` VALUES ('',265,561);
INSERT INTO `mob_skill_lists` VALUES ('',265,562);
INSERT INTO `mob_skill_lists` VALUES ('',265,565);

-- INSERT INTO `mob_skill_lists` VALUES ('',566,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',563,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',564,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1966,?,?);

INSERT INTO `mob_skill_lists` VALUES ('',266,557);
INSERT INTO `mob_skill_lists` VALUES ('',266,558);
INSERT INTO `mob_skill_lists` VALUES ('',266,559);
INSERT INTO `mob_skill_lists` VALUES ('',266,560);
INSERT INTO `mob_skill_lists` VALUES ('',266,561);
INSERT INTO `mob_skill_lists` VALUES ('',266,562);
INSERT INTO `mob_skill_lists` VALUES ('',266,565);

INSERT INTO `mob_skill_lists` VALUES ('',267,557);
INSERT INTO `mob_skill_lists` VALUES ('',267,558);
INSERT INTO `mob_skill_lists` VALUES ('',267,559);
INSERT INTO `mob_skill_lists` VALUES ('',267,560);
INSERT INTO `mob_skill_lists` VALUES ('',267,561);
INSERT INTO `mob_skill_lists` VALUES ('',267,562);
INSERT INTO `mob_skill_lists` VALUES ('',267,565);

-- Suzaku
INSERT INTO `mob_skill_lists` VALUES ('',280,143);
INSERT INTO `mob_skill_lists` VALUES ('',280,144);
INSERT INTO `mob_skill_lists` VALUES ('',280,145);
INSERT INTO `mob_skill_lists` VALUES ('',280,146);
INSERT INTO `mob_skill_lists` VALUES ('',280,147);

-- Genbu
INSERT INTO `mob_skill_lists` VALUES ('',277,549);
INSERT INTO `mob_skill_lists` VALUES ('',277,550);
INSERT INTO `mob_skill_lists` VALUES ('',277,551);
INSERT INTO `mob_skill_lists` VALUES ('',277,552);
INSERT INTO `mob_skill_lists` VALUES ('',277,553);

-- Seiryu
INSERT INTO `mob_skill_lists` VALUES ('',278,558);
INSERT INTO `mob_skill_lists` VALUES ('',278,559);
INSERT INTO `mob_skill_lists` VALUES ('',278,560);
INSERT INTO `mob_skill_lists` VALUES ('',278,561);
INSERT INTO `mob_skill_lists` VALUES ('',278,562);
INSERT INTO `mob_skill_lists` VALUES ('',278,565);

-- Byakko
INSERT INTO `mob_skill_lists` VALUES ('',279,14);
INSERT INTO `mob_skill_lists` VALUES ('',279,15);
INSERT INTO `mob_skill_lists` VALUES ('',279,17);

-- offsets shift some more.. (tpid - 72 - 89 (-161)

-- Mimic
INSERT INTO `mob_skill_lists` VALUES ('',183,332);

-- Mimic (Abyssea)
-- INSERT INTO `mob_skill_lists` VALUES ('',2324,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2325,?,?);

-- Bugbear
INSERT INTO `mob_skill_lists` VALUES ('',59,105);
INSERT INTO `mob_skill_lists` VALUES ('',59,104);
-- INSERT INTO `mob_skill_lists` VALUES ('',59,103);
INSERT INTO `mob_skill_lists` VALUES ('',59,102);
INSERT INTO `mob_skill_lists` VALUES ('',59,101);

-- Moblin
INSERT INTO `mob_skill_lists` VALUES ('',184,832);
INSERT INTO `mob_skill_lists` VALUES ('',184,825);
INSERT INTO `mob_skill_lists` VALUES ('',184,826);
INSERT INTO `mob_skill_lists` VALUES ('',184,827);
INSERT INTO `mob_skill_lists` VALUES ('',184,828);
INSERT INTO `mob_skill_lists` VALUES ('',184,829);
INSERT INTO `mob_skill_lists` VALUES ('',184,830);
INSERT INTO `mob_skill_lists` VALUES ('',184,831);

-- Flytrap
INSERT INTO `mob_skill_lists` VALUES ('',114,178);
INSERT INTO `mob_skill_lists` VALUES ('',114,179);
INSERT INTO `mob_skill_lists` VALUES ('',114,180);

-- Antlions
INSERT INTO `mob_skill_lists` VALUES ('',26,19);
INSERT INTO `mob_skill_lists` VALUES ('',26,20);
INSERT INTO `mob_skill_lists` VALUES ('',26,21);
INSERT INTO `mob_skill_lists` VALUES ('',26,23);

-- INSERT INTO `mob_skill_lists` VALUES ('',2261,?,?);

-- Antlions (Formiceros Subspecies)
-- INSERT INTO `mob_skill_lists` VALUES ('',2260,?,?);

-- Eft
INSERT INTO `mob_skill_lists` VALUES ('',98,259);
INSERT INTO `mob_skill_lists` VALUES ('',98,260);
INSERT INTO `mob_skill_lists` VALUES ('',98,261);
INSERT INTO `mob_skill_lists` VALUES ('',98,262);
INSERT INTO `mob_skill_lists` VALUES ('',98,263);

-- Fomor
INSERT INTO `mob_skill_lists` VALUES ('',115,3830);
INSERT INTO `mob_skill_lists` VALUES ('',115,3831);
INSERT INTO `mob_skill_lists` VALUES ('',115,3832);
INSERT INTO `mob_skill_lists` VALUES ('',115,3833);
INSERT INTO `mob_skill_lists` VALUES ('',115,3834);
INSERT INTO `mob_skill_lists` VALUES ('',115,3835);
INSERT INTO `mob_skill_lists` VALUES ('',115,3836);
INSERT INTO `mob_skill_lists` VALUES ('',115,3837);

-- Fomor (Dynamis - Hydra)
INSERT INTO `mob_skill_lists` VALUES ('',359,3830);
INSERT INTO `mob_skill_lists` VALUES ('',359,3831);
INSERT INTO `mob_skill_lists` VALUES ('',359,3832);
INSERT INTO `mob_skill_lists` VALUES ('',359,3833);
INSERT INTO `mob_skill_lists` VALUES ('',359,3834);
INSERT INTO `mob_skill_lists` VALUES ('',359,3835);
INSERT INTO `mob_skill_lists` VALUES ('',359,3836);
INSERT INTO `mob_skill_lists` VALUES ('',359,3837);

-- Tauri
INSERT INTO `mob_skill_lists` VALUES ('',240,242);
INSERT INTO `mob_skill_lists` VALUES ('',240,243);
INSERT INTO `mob_skill_lists` VALUES ('',240,244);
INSERT INTO `mob_skill_lists` VALUES ('',240,245);
INSERT INTO `mob_skill_lists` VALUES ('',240,246);
INSERT INTO `mob_skill_lists` VALUES ('',240,247);

-- INSERT INTO `mob_skill_lists` VALUES ('',1104,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1103,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2133,?,?);

-- Clusters
INSERT INTO `mob_skill_lists` VALUES ('',68,311);
INSERT INTO `mob_skill_lists` VALUES ('',68,312);
INSERT INTO `mob_skill_lists` VALUES ('',68,313);
INSERT INTO `mob_skill_lists` VALUES ('',68,314);
-- INSERT INTO `mob_skill_lists` VALUES ('',68,315,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',68,316,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',68,317,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',68,318,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',68,319,?);

INSERT INTO `mob_skill_lists` VALUES ('',69,313);
INSERT INTO `mob_skill_lists` VALUES ('',69,311);
INSERT INTO `mob_skill_lists` VALUES ('',69,312);
INSERT INTO `mob_skill_lists` VALUES ('',69,314);
-- INSERT INTO `mob_skill_lists` VALUES ('',69,315,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',69,316,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',69,317,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',69,318,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',69,319,?);

-- Uragnites
INSERT INTO `mob_skill_lists` VALUES ('',251,1315);
INSERT INTO `mob_skill_lists` VALUES ('',251,1316);
INSERT INTO `mob_skill_lists` VALUES ('',251,1317);
INSERT INTO `mob_skill_lists` VALUES ('',251,1318);
INSERT INTO `mob_skill_lists` VALUES ('',251,1319);

-- Snolls
INSERT INTO `mob_skill_lists` VALUES ('',232,1391);
INSERT INTO `mob_skill_lists` VALUES ('',232,1389);
INSERT INTO `mob_skill_lists` VALUES ('',232,1390);
INSERT INTO `mob_skill_lists` VALUES ('',232,1388);

-- INSERT INTO `mob_skill_lists` VALUES ('',343,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',344,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',345,?,?);

-- Corse
INSERT INTO `mob_skill_lists` VALUES ('',74,274);
INSERT INTO `mob_skill_lists` VALUES ('',74,275);
INSERT INTO `mob_skill_lists` VALUES ('',74,276);
INSERT INTO `mob_skill_lists` VALUES ('',74,277);

-- INSERT INTO `mob_skill_lists` VALUES ('',1073,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',274,?);

-- Corse (Kumakatok Subspecies - Purple Robes,Gold Hat)
-- INSERT INTO `mob_skill_lists` VALUES ('',2382,?,?);

-- Spheroids
INSERT INTO `mob_skill_lists` VALUES ('',234,728);
INSERT INTO `mob_skill_lists` VALUES ('',234,305);

-- Spheroids (CoP/Abyssea)
-- INSERT INTO `mob_skill_lists` VALUES ('',1657,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1775,?);

-- Mammets
INSERT INTO `mob_skill_lists` VALUES ('',149,91);
INSERT INTO `mob_skill_lists` VALUES ('',149,163);
INSERT INTO `mob_skill_lists` VALUES ('',149,166);
INSERT INTO `mob_skill_lists` VALUES ('',149,185);
INSERT INTO `mob_skill_lists` VALUES ('',149,191);
INSERT INTO `mob_skill_lists` VALUES ('',149,201);
INSERT INTO `mob_skill_lists` VALUES ('',149,208);
INSERT INTO `mob_skill_lists` VALUES ('',149,215);
INSERT INTO `mob_skill_lists` VALUES ('',149,231);
INSERT INTO `mob_skill_lists` VALUES ('',149,284);

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VALUES POST 1024
-- Take tpid and +256 then -1024 to find the correct param for the packet
-- Take animid and -1024 to find the correct param
-- REMEMBER TO SET BOTH ANIM AND TPID TO THE CORRECT 0X01
-- --------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Mamool Ja Warrior
INSERT INTO `mob_skill_lists` VALUES ('',176,1475);
INSERT INTO `mob_skill_lists` VALUES ('',176,1476);
INSERT INTO `mob_skill_lists` VALUES ('',176,1477);
INSERT INTO `mob_skill_lists` VALUES ('',176,1478);
-- INSERT INTO `mob_skill_lists` VALUES ('',176,1479);
-- INSERT INTO `mob_skill_lists` VALUES ('',176,1480);
-- INSERT INTO `mob_skill_lists` VALUES ('',176,1481);
-- INSERT INTO `mob_skill_lists` VALUES ('',176,1482);
-- INSERT INTO `mob_skill_lists` VALUES ('',176,1583);
-- INSERT INTO `mob_skill_lists` VALUES ('',176,1584);

-- Mamool Ja Sage
-- INSERT INTO `mob_skill_lists` VALUES ('',1664,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1665,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1666,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1667,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1668,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1669,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1670,?);

-- Mamool Ja Knight
-- INSERT INTO `mob_skill_lists` VALUES ('',1838,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1839,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1840,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1841,?,?);

-- Mamool Ja Knight (probably Lancelord Gaheel Ja version)
-- INSERT INTO `mob_skill_lists` VALUES ('',1842,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1843,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1844,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1845,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1846,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1847,?,?);

-- Apkallu
INSERT INTO `mob_skill_lists` VALUES ('',27,1457);
INSERT INTO `mob_skill_lists` VALUES ('',27,1458);
INSERT INTO `mob_skill_lists` VALUES ('',27,1459);
INSERT INTO `mob_skill_lists` VALUES ('',27,1460);
INSERT INTO `mob_skill_lists` VALUES ('',27,1461);

-- Marid
INSERT INTO `mob_skill_lists` VALUES ('',180,1447);
INSERT INTO `mob_skill_lists` VALUES ('',180,1448);
INSERT INTO `mob_skill_lists` VALUES ('',180,1449);
INSERT INTO `mob_skill_lists` VALUES ('',180,1450);
INSERT INTO `mob_skill_lists` VALUES ('',180,1451);

-- INSERT INTO `mob_skill_lists` VALUES ('',180,1452,?);

INSERT INTO `mob_skill_lists` VALUES ('',371,1449);

-- Colibri
INSERT INTO `mob_skill_lists` VALUES ('',72,1443);
INSERT INTO `mob_skill_lists` VALUES ('',72,1444);
INSERT INTO `mob_skill_lists` VALUES ('',72,1445);

-- INSERT INTO `mob_skill_lists` VALUES ('',?,?,?);

-- Imps
INSERT INTO `mob_skill_lists` VALUES ('',165,1455);
INSERT INTO `mob_skill_lists` VALUES ('',165,1453);
INSERT INTO `mob_skill_lists` VALUES ('',165,1454);

-- INSERT INTO `mob_skill_lists` VALUES ('',1747,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1748,?,?);

INSERT INTO `mob_skill_lists` VALUES ('',166,1455);
INSERT INTO `mob_skill_lists` VALUES ('',166,1453);
INSERT INTO `mob_skill_lists` VALUES ('',166,1454);

-- Puks
INSERT INTO `mob_skill_lists` VALUES ('',198,1467);
INSERT INTO `mob_skill_lists` VALUES ('',198,1466);
INSERT INTO `mob_skill_lists` VALUES ('',198,1465);
INSERT INTO `mob_skill_lists` VALUES ('',198,1464);
INSERT INTO `mob_skill_lists` VALUES ('',198,1462);

-- INSERT INTO `mob_skill_lists` VALUES ('',1468,?);

-- Qutrub
INSERT INTO `mob_skill_lists` VALUES ('',203,1522);
INSERT INTO `mob_skill_lists` VALUES ('',203,1523);
INSERT INTO `mob_skill_lists` VALUES ('',203,1524);
-- INSERT INTO `mob_skill_lists` VALUES ('',203,1525);
-- INSERT INTO `mob_skill_lists` VALUES ('',203,1526);
-- INSERT INTO `mob_skill_lists` VALUES ('',203,1527);

INSERT INTO `mob_skill_lists` VALUES ('',204,1522);
INSERT INTO `mob_skill_lists` VALUES ('',204,1523);
INSERT INTO `mob_skill_lists` VALUES ('',204,1524);
-- INSERT INTO `mob_skill_lists` VALUES ('',204,1525);
-- INSERT INTO `mob_skill_lists` VALUES ('',204,1526);
-- INSERT INTO `mob_skill_lists` VALUES ('',204,1527);

INSERT INTO `mob_skill_lists` VALUES ('',205,1522);
INSERT INTO `mob_skill_lists` VALUES ('',205,1523);
INSERT INTO `mob_skill_lists` VALUES ('',205,1524);
-- INSERT INTO `mob_skill_lists` VALUES ('',205,1525);
-- INSERT INTO `mob_skill_lists` VALUES ('',205,1526);
-- INSERT INTO `mob_skill_lists` VALUES ('',205,1527);

-- INSERT INTO `mob_skill_lists` VALUES ('',1528,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2634,?);

-- Flan
INSERT INTO `mob_skill_lists` VALUES ('',112,1565);
INSERT INTO `mob_skill_lists` VALUES ('',112,1566);
INSERT INTO `mob_skill_lists` VALUES ('',112,1568);
-- INSERT INTO `mob_skill_lists` VALUES ('',112,1570);
-- INSERT INTO `mob_skill_lists` VALUES ('',112,1571);

-- INSERT INTO `mob_skill_lists` VALUES ('',1567,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1569,?);

-- Flan (Custards)
-- INSERT INTO `mob_skill_lists` VALUES ('',1569,?);

-- Wamouracampa
INSERT INTO `mob_skill_lists` VALUES ('',254,1559);
INSERT INTO `mob_skill_lists` VALUES ('',254,1560);
INSERT INTO `mob_skill_lists` VALUES ('',254,1561);
INSERT INTO `mob_skill_lists` VALUES ('',254,1562);
INSERT INTO `mob_skill_lists` VALUES ('',254,1563);
-- INSERT INTO `mob_skill_lists` VALUES ('',254,1564);

-- Wamoura
INSERT INTO `mob_skill_lists` VALUES ('',253,1695);
INSERT INTO `mob_skill_lists` VALUES ('',253,1696);
INSERT INTO `mob_skill_lists` VALUES ('',253,1697);
INSERT INTO `mob_skill_lists` VALUES ('',253,1698);
INSERT INTO `mob_skill_lists` VALUES ('',253,1699);

-- INSERT INTO `mob_skill_lists` VALUES ('',253,1700);

-- Gears
-- INSERT INTO `mob_skill_lists` VALUES ('',120,1791);
-- INSERT INTO `mob_skill_lists` VALUES ('',120,1787);
-- INSERT INTO `mob_skill_lists` VALUES ('',120,1789);
-- INSERT INTO `mob_skill_lists` VALUES ('',120,1785);

-- Ramparts
-- INSERT INTO `mob_skill_lists` VALUES ('',209,1780,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',209,1778,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',209,1777,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',209,1776,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',209,1779,?);

-- Chariots
INSERT INTO `mob_skill_lists` VALUES ('',63,1798);
INSERT INTO `mob_skill_lists` VALUES ('',63,1799);
INSERT INTO `mob_skill_lists` VALUES ('',63,1800);

-- INSERT INTO `mob_skill_lists` VALUES ('',1801,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1802,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1803,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1804,?);

-- Wivre
INSERT INTO `mob_skill_lists` VALUES ('',257,1843);
INSERT INTO `mob_skill_lists` VALUES ('',257,1844);
INSERT INTO `mob_skill_lists` VALUES ('',257,1845);
INSERT INTO `mob_skill_lists` VALUES ('',257,1846);
INSERT INTO `mob_skill_lists` VALUES ('',257,1847);

-- INSERT INTO `mob_skill_lists` VALUES ('',1848,?,?);

-- Ladybugs
INSERT INTO `mob_skill_lists` VALUES ('',170,1925);
INSERT INTO `mob_skill_lists` VALUES ('',170,1924);
INSERT INTO `mob_skill_lists` VALUES ('',170,1923);
INSERT INTO `mob_skill_lists` VALUES ('',170,1922);

-- Ladybugs (NM)
INSERT INTO `mob_skill_lists` VALUES ('',390,1925);
INSERT INTO `mob_skill_lists` VALUES ('',390,1924);
INSERT INTO `mob_skill_lists` VALUES ('',390,1923);
INSERT INTO `mob_skill_lists` VALUES ('',390,1922);
INSERT INTO `mob_skill_lists` VALUES ('',390,1926);

-- Pixie
INSERT INTO `mob_skill_lists` VALUES ('',195,1937);
INSERT INTO `mob_skill_lists` VALUES ('',195,1938);
INSERT INTO `mob_skill_lists` VALUES ('',195,1939);
INSERT INTO `mob_skill_lists` VALUES ('',195,1940);
INSERT INTO `mob_skill_lists` VALUES ('',195,1941);
INSERT INTO `mob_skill_lists` VALUES ('',195,1942);
INSERT INTO `mob_skill_lists` VALUES ('',195,1943);
INSERT INTO `mob_skill_lists` VALUES ('',195,1944);

-- INSERT INTO `mob_skill_lists` VALUES ('',2262,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2438,?,?);

-- Gnole
INSERT INTO `mob_skill_lists` VALUES ('',132,1914);
INSERT INTO `mob_skill_lists` VALUES ('',132,1915);
INSERT INTO `mob_skill_lists` VALUES ('',132,1916);
INSERT INTO `mob_skill_lists` VALUES ('',132,1917);
INSERT INTO `mob_skill_lists` VALUES ('',132,1918);
INSERT INTO `mob_skill_lists` VALUES ('',132,1919);
INSERT INTO `mob_skill_lists` VALUES ('',132,1920);

-- INSERT INTO `mob_skill_lists` VALUES ('',0,1921);

-- Djinn
INSERT INTO `mob_skill_lists` VALUES ('',82,1960);
INSERT INTO `mob_skill_lists` VALUES ('',82,1962);
INSERT INTO `mob_skill_lists` VALUES ('',82,1961);
INSERT INTO `mob_skill_lists` VALUES ('',82,1963);

-- INSERT INTO `mob_skill_lists` VALUES ('',1964,?);

-- Ghrah
INSERT INTO `mob_skill_lists` VALUES ('',122,1185);
INSERT INTO `mob_skill_lists` VALUES ('',122,1186);
INSERT INTO `mob_skill_lists` VALUES ('',122,1187);
INSERT INTO `mob_skill_lists` VALUES ('',122,1188);
INSERT INTO `mob_skill_lists` VALUES ('',122,1189);
INSERT INTO `mob_skill_lists` VALUES ('',122,1190);

-- Kf'Ghrah
INSERT INTO `mob_skill_lists` VALUES ('',123,1187);
INSERT INTO `mob_skill_lists` VALUES ('',123,1185);
INSERT INTO `mob_skill_lists` VALUES ('',123,1189);
INSERT INTO `mob_skill_lists` VALUES ('',123,1190);

-- Jailer of Fortitude
INSERT INTO `mob_skill_lists` VALUES ('',124,1188);
INSERT INTO `mob_skill_lists` VALUES ('',124,1185);

-- Euvhi
INSERT INTO `mob_skill_lists` VALUES ('',109,1194);
INSERT INTO `mob_skill_lists` VALUES ('',109,1196);
INSERT INTO `mob_skill_lists` VALUES ('',109,1191);
INSERT INTO `mob_skill_lists` VALUES ('',109,1192);
INSERT INTO `mob_skill_lists` VALUES ('',109,1193);
INSERT INTO `mob_skill_lists` VALUES ('',109,1195);
INSERT INTO `mob_skill_lists` VALUES ('',109,1197);

-- Zdei - T-Sight aggro @ 15  yalms.
INSERT INTO `mob_skill_lists` VALUES ('',272,1207);
INSERT INTO `mob_skill_lists` VALUES ('',272,1209);
INSERT INTO `mob_skill_lists` VALUES ('',272,1210);
INSERT INTO `mob_skill_lists` VALUES ('',272,1211);
INSERT INTO `mob_skill_lists` VALUES ('',272,1212);
INSERT INTO `mob_skill_lists` VALUES ('',272,1213);

-- Yovra
INSERT INTO `mob_skill_lists` VALUES ('',271,1114);
INSERT INTO `mob_skill_lists` VALUES ('',271,1115);
INSERT INTO `mob_skill_lists` VALUES ('',271,1116);
INSERT INTO `mob_skill_lists` VALUES ('',271,1117);
-- INSERT INTO `mob_skill_lists` VALUES ('',271,1118);
INSERT INTO `mob_skill_lists` VALUES ('',271,1119);
INSERT INTO `mob_skill_lists` VALUES ('',271,1120);
-- INSERT INTO `mob_skill_lists` VALUES ('',271,1121);

-- Aern H2H fam 3 nin mnk
INSERT INTO `mob_skill_lists` VALUES ('',3,1122);
INSERT INTO `mob_skill_lists` VALUES ('',3,1123);
INSERT INTO `mob_skill_lists` VALUES ('',3,1124);
INSERT INTO `mob_skill_lists` VALUES ('',3,1125);
INSERT INTO `mob_skill_lists` VALUES ('',3,1126);
INSERT INTO `mob_skill_lists` VALUES ('',3,1131);

-- Aern Axe type fam 443 rng war bst
INSERT INTO `mob_skill_lists` VALUES ('',443,1122);
INSERT INTO `mob_skill_lists` VALUES ('',443,1123);
INSERT INTO `mob_skill_lists` VALUES ('',443,1124);
INSERT INTO `mob_skill_lists` VALUES ('',443,1125);
INSERT INTO `mob_skill_lists` VALUES ('',443,1126);
INSERT INTO `mob_skill_lists` VALUES ('',443,1129);


-- Aern dagger type blm thief bard
INSERT INTO `mob_skill_lists` VALUES ('',442,1122);
INSERT INTO `mob_skill_lists` VALUES ('',442,1123);
INSERT INTO `mob_skill_lists` VALUES ('',442,1124);
INSERT INTO `mob_skill_lists` VALUES ('',442,1125);
INSERT INTO `mob_skill_lists` VALUES ('',442,1126);
INSERT INTO `mob_skill_lists` VALUES ('',442,1128);

-- Aern sword type rdm pld drk
INSERT INTO `mob_skill_lists` VALUES ('',441,1122);
INSERT INTO `mob_skill_lists` VALUES ('',441,1123);
INSERT INTO `mob_skill_lists` VALUES ('',441,1124);
INSERT INTO `mob_skill_lists` VALUES ('',441,1125);
INSERT INTO `mob_skill_lists` VALUES ('',441,1126);
INSERT INTO `mob_skill_lists` VALUES ('',441,1127);


-- Aern polearm type sam drg
INSERT INTO `mob_skill_lists` VALUES ('',440,1122);
INSERT INTO `mob_skill_lists` VALUES ('',440,1123);
INSERT INTO `mob_skill_lists` VALUES ('',440,1124);
INSERT INTO `mob_skill_lists` VALUES ('',440,1125);
INSERT INTO `mob_skill_lists` VALUES ('',440,1126);
INSERT INTO `mob_skill_lists` VALUES ('',440,1130);


-- Aern staff type smn whm
INSERT INTO `mob_skill_lists` VALUES ('',439,1122);
INSERT INTO `mob_skill_lists` VALUES ('',439,1123);
INSERT INTO `mob_skill_lists` VALUES ('',439,1124);
INSERT INTO `mob_skill_lists` VALUES ('',439,1125);
INSERT INTO `mob_skill_lists` VALUES ('',439,1126);




-- Phuabo
INSERT INTO `mob_skill_lists` VALUES ('',194,1097);
INSERT INTO `mob_skill_lists` VALUES ('',194,1101);
INSERT INTO `mob_skill_lists` VALUES ('',194,1098);
INSERT INTO `mob_skill_lists` VALUES ('',194,1099);
INSERT INTO `mob_skill_lists` VALUES ('',194,1100);
INSERT INTO `mob_skill_lists` VALUES ('',194,1102);

-- Xzomit
INSERT INTO `mob_skill_lists` VALUES ('',269,1091);
INSERT INTO `mob_skill_lists` VALUES ('',269,1092);
INSERT INTO `mob_skill_lists` VALUES ('',269,1093);
INSERT INTO `mob_skill_lists` VALUES ('',269,1094);
INSERT INTO `mob_skill_lists` VALUES ('',269,1095);
INSERT INTO `mob_skill_lists` VALUES ('',269,1096);

-- Hpemde
INSERT INTO `mob_skill_lists` VALUES ('',144,1109);
INSERT INTO `mob_skill_lists` VALUES ('',144,1110);
INSERT INTO `mob_skill_lists` VALUES ('',144,1111);
INSERT INTO `mob_skill_lists` VALUES ('',144,1112);
INSERT INTO `mob_skill_lists` VALUES ('',144,1113);

-- Trolls (light-armored model)
-- INSERT INTO `mob_skill_lists` VALUES ('',246,1485);
-- INSERT INTO `mob_skill_lists` VALUES ('',246,1486);
INSERT INTO `mob_skill_lists` VALUES ('',246,1487);
INSERT INTO `mob_skill_lists` VALUES ('',246,1488);
INSERT INTO `mob_skill_lists` VALUES ('',246,1489);
INSERT INTO `mob_skill_lists` VALUES ('',246,1490);
-- INSERT INTO `mob_skill_lists` VALUES ('',246,1492);
-- INSERT INTO `mob_skill_lists` VALUES ('',246,1493);

-- Trolls (heavy-armored model)
-- INSERT INTO `mob_skill_lists` VALUES ('',1638,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1639,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1640,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1641,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1642,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1643,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1644,?);

-- Trolls (Destroyers [huge warhammer wielders w/ masks])
-- INSERT INTO `mob_skill_lists` VALUES ('',1819,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1820,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1821,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1822,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1823,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1824,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1825,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1826,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1827,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1828,?);

-- Automatons (PUP ver.)

-- Harlequin Frame
INSERT INTO `mob_skill_lists` VALUES ('',363,1687);
INSERT INTO `mob_skill_lists` VALUES ('',363,1811);
INSERT INTO `mob_skill_lists` VALUES ('',363,2045);
-- INSERT INTO `mob_skill_lists` VALUES ('',363,1689);
-- INSERT INTO `mob_skill_lists` VALUES ('',363,1691);
-- INSERT INTO `mob_skill_lists` VALUES ('',363,1692);
-- INSERT INTO `mob_skill_lists` VALUES ('',363,1765);
-- INSERT INTO `mob_skill_lists` VALUES ('',363,1812);
-- INSERT INTO `mob_skill_lists` VALUES ('',363,2489);
-- INSERT INTO `mob_skill_lists` VALUES ('',363,2491);
-- INSERT INTO `mob_skill_lists` VALUES ('',363,2522);
-- INSERT INTO `mob_skill_lists` VALUES ('',363,2523);
-- INSERT INTO `mob_skill_lists` VALUES ('',363,2524);
-- INSERT INTO `mob_skill_lists` VALUES ('',363,2683);
-- INSERT INTO `mob_skill_lists` VALUES ('',363,2684);
-- INSERT INTO `mob_skill_lists` VALUES ('',363,2685);
-- INSERT INTO `mob_skill_lists` VALUES ('',363,2686);
-- INSERT INTO `mob_skill_lists` VALUES ('',363,2687);
-- INSERT INTO `mob_skill_lists` VALUES ('',363,2688);

-- Valoredge Frame
-- INSERT INTO `mob_skill_lists` VALUES ('',364,1688);
INSERT INTO `mob_skill_lists` VALUES ('',364,1684);
INSERT INTO `mob_skill_lists` VALUES ('',364,1685);
INSERT INTO `mob_skill_lists` VALUES ('',364,1809);
INSERT INTO `mob_skill_lists` VALUES ('',364,2043);
INSERT INTO `mob_skill_lists` VALUES ('',364,2487);
-- INSERT INTO `mob_skill_lists` VALUES ('',364,1689);
-- INSERT INTO `mob_skill_lists` VALUES ('',364,1691);
-- INSERT INTO `mob_skill_lists` VALUES ('',364,1692);
-- INSERT INTO `mob_skill_lists` VALUES ('',364,1765);
-- INSERT INTO `mob_skill_lists` VALUES ('',364,1812);
-- INSERT INTO `mob_skill_lists` VALUES ('',364,2489);
-- INSERT INTO `mob_skill_lists` VALUES ('',364,2491);
-- INSERT INTO `mob_skill_lists` VALUES ('',364,2522);
-- INSERT INTO `mob_skill_lists` VALUES ('',364,2523);
-- INSERT INTO `mob_skill_lists` VALUES ('',364,2524);
-- INSERT INTO `mob_skill_lists` VALUES ('',364,2683);
-- INSERT INTO `mob_skill_lists` VALUES ('',364,2684);
-- INSERT INTO `mob_skill_lists` VALUES ('',364,2685);
-- INSERT INTO `mob_skill_lists` VALUES ('',364,2686);
-- INSERT INTO `mob_skill_lists` VALUES ('',364,2687);
-- INSERT INTO `mob_skill_lists` VALUES ('',364,2688);

-- Sharpshot Frame
INSERT INTO `mob_skill_lists` VALUES ('',365,1686);
INSERT INTO `mob_skill_lists` VALUES ('',365,1810);
INSERT INTO `mob_skill_lists` VALUES ('',365,2044);
INSERT INTO `mob_skill_lists` VALUES ('',365,2488);
-- INSERT INTO `mob_skill_lists` VALUES ('',365,1689);
-- INSERT INTO `mob_skill_lists` VALUES ('',365,1691);
-- INSERT INTO `mob_skill_lists` VALUES ('',365,1692);
-- INSERT INTO `mob_skill_lists` VALUES ('',365,1765);
-- INSERT INTO `mob_skill_lists` VALUES ('',365,1812);
-- INSERT INTO `mob_skill_lists` VALUES ('',365,2489);
-- INSERT INTO `mob_skill_lists` VALUES ('',365,2490);
-- INSERT INTO `mob_skill_lists` VALUES ('',365,2491);
-- INSERT INTO `mob_skill_lists` VALUES ('',365,2522);
-- INSERT INTO `mob_skill_lists` VALUES ('',365,2523);
-- INSERT INTO `mob_skill_lists` VALUES ('',365,2524);
-- INSERT INTO `mob_skill_lists` VALUES ('',365,2683);
-- INSERT INTO `mob_skill_lists` VALUES ('',365,2684);
-- INSERT INTO `mob_skill_lists` VALUES ('',365,2685);
-- INSERT INTO `mob_skill_lists` VALUES ('',365,2686);
-- INSERT INTO `mob_skill_lists` VALUES ('',365,2687);
-- INSERT INTO `mob_skill_lists` VALUES ('',365,2688);

-- Stormwaker Frame
INSERT INTO `mob_skill_lists` VALUES ('',366,1687);
INSERT INTO `mob_skill_lists` VALUES ('',366,1811);
INSERT INTO `mob_skill_lists` VALUES ('',366,2045);
-- INSERT INTO `mob_skill_lists` VALUES ('',366,1689);
-- INSERT INTO `mob_skill_lists` VALUES ('',366,1691);
-- INSERT INTO `mob_skill_lists` VALUES ('',366,1692);
-- INSERT INTO `mob_skill_lists` VALUES ('',366,1765);
-- INSERT INTO `mob_skill_lists` VALUES ('',366,1812);
-- INSERT INTO `mob_skill_lists` VALUES ('',366,2489);
-- INSERT INTO `mob_skill_lists` VALUES ('',366,2491);
-- INSERT INTO `mob_skill_lists` VALUES ('',366,2522);
-- INSERT INTO `mob_skill_lists` VALUES ('',366,2523);
-- INSERT INTO `mob_skill_lists` VALUES ('',366,2524);
-- INSERT INTO `mob_skill_lists` VALUES ('',366,2683);
-- INSERT INTO `mob_skill_lists` VALUES ('',366,2684);
-- INSERT INTO `mob_skill_lists` VALUES ('',366,2685);
-- INSERT INTO `mob_skill_lists` VALUES ('',366,2686);
-- INSERT INTO `mob_skill_lists` VALUES ('',366,2687);
-- INSERT INTO `mob_skill_lists` VALUES ('',366,2688);

-- Lamiae
-- INSERT INTO `mob_skill_lists` VALUES ('',171,1496);
INSERT INTO `mob_skill_lists` VALUES ('',171,1497);
-- INSERT INTO `mob_skill_lists` VALUES ('',171,1673);
-- INSERT INTO `mob_skill_lists` VALUES ('',171,1505);
-- INSERT INTO `mob_skill_lists` VALUES ('',171,1674);
-- INSERT INTO `mob_skill_lists` VALUES ('',171,1498);
-- INSERT INTO `mob_skill_lists` VALUES ('',171,1499,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',171,1500);
-- INSERT INTO `mob_skill_lists` VALUES ('',171,1501,?);
INSERT INTO `mob_skill_lists` VALUES ('',182,1502);
-- INSERT INTO `mob_skill_lists` VALUES ('',171,1503);


-- MEDUSA
-- INSERT INTO `mob_skill_lists` VALUES ('',171,1557);
-- INSERT INTO `mob_skill_lists` VALUES ('',171,1558);
-- INSERT INTO `mob_skill_lists` VALUES ('',171,1556);
-- INSERT INTO `mob_skill_lists` VALUES ('',171,1553);
-- INSERT INTO `mob_skill_lists` VALUES ('',171,1555);
-- or 1338
-- INSERT INTO `mob_skill_lists` VALUES ('',171,1502);
-- 1340 1341 call for help reinforcement by adds or maybe drawn in. 1338 is an


-- INSERT INTO `mob_skill_lists` VALUES ('',?,469);

-- Merrow
INSERT INTO `mob_skill_lists` VALUES ('',182,1515);
-- INSERT INTO `mob_skill_lists` VALUES ('',182,1516);

-- INSERT INTO `mob_skill_lists` VALUES ('',1519,?,?);

-- Poroggos
-- INSERT INTO `mob_skill_lists` VALUES ('',196,1701);
INSERT INTO `mob_skill_lists` VALUES ('',196,1702);
INSERT INTO `mob_skill_lists` VALUES ('',196,1703);
INSERT INTO `mob_skill_lists` VALUES ('',196,1704);
-- INSERT INTO `mob_skill_lists` VALUES ('',196,1705);
-- INSERT INTO `mob_skill_lists` VALUES ('',196,1706);

-- Vampyr
INSERT INTO `mob_skill_lists` VALUES ('',252,1850);
INSERT INTO `mob_skill_lists` VALUES ('',252,1851);
INSERT INTO `mob_skill_lists` VALUES ('',252,1852);
INSERT INTO `mob_skill_lists` VALUES ('',252,1853);
INSERT INTO `mob_skill_lists` VALUES ('',252,1854);
INSERT INTO `mob_skill_lists` VALUES ('',252,1855);
-- INSERT INTO `mob_skill_lists` VALUES ('',252,1856);
-- INSERT INTO `mob_skill_lists` VALUES ('',252,2132);

-- INSERT INTO `mob_skill_lists` VALUES ('',252,2278);

-- Dvergar
INSERT INTO `mob_skill_lists` VALUES ('',90,1857);
INSERT INTO `mob_skill_lists` VALUES ('',90,1858);
INSERT INTO `mob_skill_lists` VALUES ('',90,1859);
INSERT INTO `mob_skill_lists` VALUES ('',90,1860);
INSERT INTO `mob_skill_lists` VALUES ('',90,1861);
INSERT INTO `mob_skill_lists` VALUES ('',90,1862);
INSERT INTO `mob_skill_lists` VALUES ('',90,1863);

-- Pandemonium Lamps (91)
INSERT INTO `mob_skill_lists` VALUES ('',91,1789);
INSERT INTO `mob_skill_lists` VALUES ('',91,1785);
INSERT INTO `mob_skill_lists` VALUES ('',91,1666);
INSERT INTO `mob_skill_lists` VALUES ('',91,1667);
INSERT INTO `mob_skill_lists` VALUES ('',91,1674);
INSERT INTO `mob_skill_lists` VALUES ('',91,1502);
INSERT INTO `mob_skill_lists` VALUES ('',91,1503);
INSERT INTO `mob_skill_lists` VALUES ('',91,1487);
INSERT INTO `mob_skill_lists` VALUES ('',91,1489);
INSERT INTO `mob_skill_lists` VALUES ('',91,1490);
INSERT INTO `mob_skill_lists` VALUES ('',91,915);
INSERT INTO `mob_skill_lists` VALUES ('',91,916);
INSERT INTO `mob_skill_lists` VALUES ('',91,917);
INSERT INTO `mob_skill_lists` VALUES ('',91,918);
INSERT INTO `mob_skill_lists` VALUES ('',91,1467);
INSERT INTO `mob_skill_lists` VALUES ('',91,1464);
INSERT INTO `mob_skill_lists` VALUES ('',91,1462);
INSERT INTO `mob_skill_lists` VALUES ('',91,338);
INSERT INTO `mob_skill_lists` VALUES ('',91,340);
INSERT INTO `mob_skill_lists` VALUES ('',91,1857);
INSERT INTO `mob_skill_lists` VALUES ('',91,1858);
INSERT INTO `mob_skill_lists` VALUES ('',91,1860);
INSERT INTO `mob_skill_lists` VALUES ('',91,1861);
INSERT INTO `mob_skill_lists` VALUES ('',91,1863);

-- Pandemonium Warden (316)
INSERT INTO `mob_skill_lists` VALUES ('',316,1801);
INSERT INTO `mob_skill_lists` VALUES ('',316,1802);
INSERT INTO `mob_skill_lists` VALUES ('',316,1803);
INSERT INTO `mob_skill_lists` VALUES ('',316,1804);
INSERT INTO `mob_skill_lists` VALUES ('',316,1541);
INSERT INTO `mob_skill_lists` VALUES ('',316,1542);
INSERT INTO `mob_skill_lists` VALUES ('',316,1543);
INSERT INTO `mob_skill_lists` VALUES ('',316,1482);
INSERT INTO `mob_skill_lists` VALUES ('',316,1557);
INSERT INTO `mob_skill_lists` VALUES ('',316,1558);
INSERT INTO `mob_skill_lists` VALUES ('',316,1556);
INSERT INTO `mob_skill_lists` VALUES ('',316,1553);
INSERT INTO `mob_skill_lists` VALUES ('',316,1546);
INSERT INTO `mob_skill_lists` VALUES ('',316,1547);
INSERT INTO `mob_skill_lists` VALUES ('',316,1548);
INSERT INTO `mob_skill_lists` VALUES ('',316,1551);
INSERT INTO `mob_skill_lists` VALUES ('',316,1529);
INSERT INTO `mob_skill_lists` VALUES ('',316,1531);
INSERT INTO `mob_skill_lists` VALUES ('',316,1534);
INSERT INTO `mob_skill_lists` VALUES ('',316,1572);
INSERT INTO `mob_skill_lists` VALUES ('',316,1573);
INSERT INTO `mob_skill_lists` VALUES ('',316,1574);
INSERT INTO `mob_skill_lists` VALUES ('',316,1575);
INSERT INTO `mob_skill_lists` VALUES ('',316,1579);
INSERT INTO `mob_skill_lists` VALUES ('',316,1580);
INSERT INTO `mob_skill_lists` VALUES ('',316,1769);
INSERT INTO `mob_skill_lists` VALUES ('',316,1770);
INSERT INTO `mob_skill_lists` VALUES ('',316,1772);
INSERT INTO `mob_skill_lists` VALUES ('',316,1766);
INSERT INTO `mob_skill_lists` VALUES ('',316,1767);
INSERT INTO `mob_skill_lists` VALUES ('',316,1768);
INSERT INTO `mob_skill_lists` VALUES ('',316,1857);
INSERT INTO `mob_skill_lists` VALUES ('',316,1858);
INSERT INTO `mob_skill_lists` VALUES ('',316,1860);
INSERT INTO `mob_skill_lists` VALUES ('',316,1861);
INSERT INTO `mob_skill_lists` VALUES ('',316,1862);
INSERT INTO `mob_skill_lists` VALUES ('',316,1863);

-- Peistes
INSERT INTO `mob_skill_lists` VALUES ('',192,1896);
INSERT INTO `mob_skill_lists` VALUES ('',192,1897);
INSERT INTO `mob_skill_lists` VALUES ('',192,1898);
INSERT INTO `mob_skill_lists` VALUES ('',192,1899);
INSERT INTO `mob_skill_lists` VALUES ('',192,1900);

-- INSERT INTO `mob_skill_lists` VALUES ('',1901,?);

-- Peistes (Sibilus Subspecies)
-- INSERT INTO `mob_skill_lists` VALUES ('',?,?,?);

-- Gnat
INSERT INTO `mob_skill_lists` VALUES ('',131,1902);
INSERT INTO `mob_skill_lists` VALUES ('',131,1903);
INSERT INTO `mob_skill_lists` VALUES ('',131,1904);
INSERT INTO `mob_skill_lists` VALUES ('',131,1905);

INSERT INTO `mob_skill_lists` VALUES ('',436,1906);

-- Limule
INSERT INTO `mob_skill_lists` VALUES ('',173,2308);
INSERT INTO `mob_skill_lists` VALUES ('',173,2309);

-- Clionid
INSERT INTO `mob_skill_lists` VALUES ('',65,2307);
INSERT INTO `mob_skill_lists` VALUES ('',65,2306);

-- Murex
INSERT INTO `mob_skill_lists` VALUES ('',187,2373);
-- INSERT INTO `mob_skill_lists` VALUES ('',187,2374);

-- Amoebans
INSERT INTO `mob_skill_lists` VALUES ('',5,2375);
INSERT INTO `mob_skill_lists` VALUES ('',5,2376);
-- INSERT INTO `mob_skill_lists` VALUES ('',5,2377,?);

-- Hippogryphs -- Need Scripts
-- INSERT INTO `mob_skill_lists` VALUES ('',140,324);
-- INSERT INTO `mob_skill_lists` VALUES ('',140,323);
INSERT INTO `mob_skill_lists` VALUES ('',140,322);
INSERT INTO `mob_skill_lists` VALUES ('',140,320);
INSERT INTO `mob_skill_lists` VALUES ('',140,2572);

-- Hippogryphs (NM) -- Need Scripts
-- INSERT INTO `mob_skill_lists` VALUES ('',141,324);
-- INSERT INTO `mob_skill_lists` VALUES ('',141,323);
INSERT INTO `mob_skill_lists` VALUES ('',141,322);
INSERT INTO `mob_skill_lists` VALUES ('',141,320);
-- INSERT INTO `mob_skill_lists` VALUES ('',141,1074);
INSERT INTO `mob_skill_lists` VALUES ('',141,2572);

-- Qiqirn -- Need Scripts
INSERT INTO `mob_skill_lists` VALUES ('',199,1469);
-- INSERT INTO `mob_skill_lists` VALUES ('',199,1470);
INSERT INTO `mob_skill_lists` VALUES ('',199,1471);
INSERT INTO `mob_skill_lists` VALUES ('',199,1472);

-- Siege Turrets
-- INSERT INTO `mob_skill_lists` VALUES ('',2038,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2039,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2032,?,?);

-- Acroliths
-- INSERT INTO `mob_skill_lists` VALUES ('',1814,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1815,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1816,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1817,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1818,?);


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
-- INSERT INTO `mob_skill_lists` VALUES ('',2479,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2480,?,?);

-- Moogles
-- INSERT INTO `mob_skill_lists` VALUES ('',2207,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2205,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2206,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2211,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2210,?,?);

-- INSERT INTO `mob_skill_lists` VALUES ('',2209,?,?);

-- Rafflesia regular mob
-- INSERT INTO `mob_skill_lists` VALUES ('',1911,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1910,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1909,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1908,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1907,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1912,?);

-- INSERT INTO `mob_skill_lists` VALUES ('',1913,?);

-- Pet Wyvern
-- mob wyverns use custom skill list
INSERT INTO `mob_skill_lists` VALUES ('',193,638);
INSERT INTO `mob_skill_lists` VALUES ('',193,639);
INSERT INTO `mob_skill_lists` VALUES ('',193,640);
INSERT INTO `mob_skill_lists` VALUES ('',193,641);
INSERT INTO `mob_skill_lists` VALUES ('',193,642);
INSERT INTO `mob_skill_lists` VALUES ('',193,643);
INSERT INTO `mob_skill_lists` VALUES ('',193,644);
INSERT INTO `mob_skill_lists` VALUES ('',193,645);
INSERT INTO `mob_skill_lists` VALUES ('',193,646);
INSERT INTO `mob_skill_lists` VALUES ('',193,647);
INSERT INTO `mob_skill_lists` VALUES ('',193,648);
INSERT INTO `mob_skill_lists` VALUES ('',193,649);

-- --------------------------------------
-- ACP specific mobs
-- --------------------------------------

-- Seed Mandragora
INSERT INTO `mob_skill_lists` VALUES ('',406,2154);

-- Seed Orc
INSERT INTO `mob_skill_lists` VALUES ('',407,349);
INSERT INTO `mob_skill_lists` VALUES ('',407,350);
INSERT INTO `mob_skill_lists` VALUES ('',407,351);
INSERT INTO `mob_skill_lists` VALUES ('',407,352);
INSERT INTO `mob_skill_lists` VALUES ('',407,353);
INSERT INTO `mob_skill_lists` VALUES ('',407,377);
INSERT INTO `mob_skill_lists` VALUES ('',407,2155);

-- Seed Quadav
INSERT INTO `mob_skill_lists` VALUES ('',408,355);
INSERT INTO `mob_skill_lists` VALUES ('',408,356);
INSERT INTO `mob_skill_lists` VALUES ('',408,357);
INSERT INTO `mob_skill_lists` VALUES ('',408,358);
INSERT INTO `mob_skill_lists` VALUES ('',408,377);
INSERT INTO `mob_skill_lists` VALUES ('',408,2156);

-- Seed Yagudo
INSERT INTO `mob_skill_lists` VALUES ('',409,361);
INSERT INTO `mob_skill_lists` VALUES ('',409,362);
INSERT INTO `mob_skill_lists` VALUES ('',409,363);
INSERT INTO `mob_skill_lists` VALUES ('',409,364);
INSERT INTO `mob_skill_lists` VALUES ('',409,377);
INSERT INTO `mob_skill_lists` VALUES ('',409,2157);

-- Seed Goblin
INSERT INTO `mob_skill_lists` VALUES ('',410,334);
INSERT INTO `mob_skill_lists` VALUES ('',410,335);
INSERT INTO `mob_skill_lists` VALUES ('',410,2158);

-- Seed Crystal
-- melee move 1494
-- INSERT INTO `mob_skill_lists` VALUES ('',411,2160);
-- INSERT INTO `mob_skill_lists` VALUES ('',411,2161);
-- INSERT INTO `mob_skill_lists` VALUES ('',411,2162);
-- INSERT INTO `mob_skill_lists` VALUES ('',411,2163);

-- Seed Thrall
-- Family ID: 412
-- Uses players model and equipment, uses weaponskills matching cloned weapontype.

-- --------------------------------------
-- NM / HNM
-- --------------------------------------

-- Zeid + shadows
INSERT INTO `mob_skill_lists` VALUES ('',480,723);
INSERT INTO `mob_skill_lists` VALUES ('',480,724);
INSERT INTO `mob_skill_lists` VALUES ('',480,725);
INSERT INTO `mob_skill_lists` VALUES ('',480,726);
INSERT INTO `mob_skill_lists` VALUES ('',480,727);
INSERT INTO `mob_skill_lists` VALUES ('',480,439);

-- zeid 2 phase 2 only
INSERT INTO `mob_skill_lists` VALUES ('',480,746);

-- Volker
INSERT INTO `mob_skill_lists` VALUES ('',482,717);
INSERT INTO `mob_skill_lists` VALUES ('',482,718);
INSERT INTO `mob_skill_lists` VALUES ('',482,719);
INSERT INTO `mob_skill_lists` VALUES ('',482,720);

-- Trion
INSERT INTO `mob_skill_lists` VALUES ('',483,715);
INSERT INTO `mob_skill_lists` VALUES ('',483,716);
INSERT INTO `mob_skill_lists` VALUES ('',483,712);
INSERT INTO `mob_skill_lists` VALUES ('',483,713);
INSERT INTO `mob_skill_lists` VALUES ('',483,714);

-- Ajido Marujido
INSERT INTO `mob_skill_lists` VALUES ('',481,714);
INSERT INTO `mob_skill_lists` VALUES ('',481,715);



-- Kam'lanaut
INSERT INTO `mob_skill_lists` VALUES ('',351,567);
INSERT INTO `mob_skill_lists` VALUES ('',351,568);
INSERT INTO `mob_skill_lists` VALUES ('',351,569);
INSERT INTO `mob_skill_lists` VALUES ('',351,570);
INSERT INTO `mob_skill_lists` VALUES ('',351,571);
INSERT INTO `mob_skill_lists` VALUES ('',351,572);
INSERT INTO `mob_skill_lists` VALUES ('',351,573);
INSERT INTO `mob_skill_lists` VALUES ('',351,574);

-- Ark Angel EV
INSERT INTO `mob_skill_lists` VALUES ('',352,677);
INSERT INTO `mob_skill_lists` VALUES ('',352,678);
INSERT INTO `mob_skill_lists` VALUES ('',352,686);
INSERT INTO `mob_skill_lists` VALUES ('',352,687);

-- Ark Angel GK
INSERT INTO `mob_skill_lists` VALUES ('',353,681);
INSERT INTO `mob_skill_lists` VALUES ('',353,690);
INSERT INTO `mob_skill_lists` VALUES ('',353,691);
INSERT INTO `mob_skill_lists` VALUES ('',353,692);

-- Ark Angel HM
INSERT INTO `mob_skill_lists` VALUES ('',354,675);
INSERT INTO `mob_skill_lists` VALUES ('',354,682);
INSERT INTO `mob_skill_lists` VALUES ('',354,683);

-- Ark Angel MR
INSERT INTO `mob_skill_lists` VALUES ('',355,676);
INSERT INTO `mob_skill_lists` VALUES ('',355,684);
INSERT INTO `mob_skill_lists` VALUES ('',355,685);
INSERT INTO `mob_skill_lists` VALUES ('',355,454);

-- Ark Angel TT
INSERT INTO `mob_skill_lists` VALUES ('',356,679);
INSERT INTO `mob_skill_lists` VALUES ('',394,680);
INSERT INTO `mob_skill_lists` VALUES ('',356,688);
INSERT INTO `mob_skill_lists` VALUES ('',356,689);
INSERT INTO `mob_skill_lists` VALUES ('',394,706);

-- Cerberuses
INSERT INTO `mob_skill_lists` VALUES ('',62,1529);
INSERT INTO `mob_skill_lists` VALUES ('',62,1530);
INSERT INTO `mob_skill_lists` VALUES ('',62,1531);
INSERT INTO `mob_skill_lists` VALUES ('',62,1532);
INSERT INTO `mob_skill_lists` VALUES ('',62,1533);
INSERT INTO `mob_skill_lists` VALUES ('',62,1534);

-- Cerberuses (Orthrus Subspecies)
-- INSERT INTO `mob_skill_lists` VALUES ('',62,1534);

-- Diabolos (Darkness Named)
-- TODO: Need scripts.
-- INSERT INTO `mob_skill_lists` VALUES ('',35,1647);
-- INSERT INTO `mob_skill_lists` VALUES ('',35,1649);
-- INSERT INTO `mob_skill_lists` VALUES ('',35,1650);
-- INSERT INTO `mob_skill_lists` VALUES ('',35,1652);

-- Diabolos (Waking Dreams)
-- TODO: Need scripts.
-- INSERT INTO `mob_skill_lists` VALUES ('',378,1647);
-- INSERT INTO `mob_skill_lists` VALUES ('',378,1648);
-- INSERT INTO `mob_skill_lists` VALUES ('',378,1649);
-- INSERT INTO `mob_skill_lists` VALUES ('',378,1650);
-- INSERT INTO `mob_skill_lists` VALUES ('',378,1651);
-- INSERT INTO `mob_skill_lists` VALUES ('',378,1652);
-- INSERT INTO `mob_skill_lists` VALUES ('',378,1653);
-- INSERT INTO `mob_skill_lists` VALUES ('',378,1654);
-- INSERT INTO `mob_skill_lists` VALUES ('',378,1655);

-- Gurfurlur the Menacing
INSERT INTO `mob_skill_lists` VALUES ('',326,1546);
INSERT INTO `mob_skill_lists` VALUES ('',326,1547);
INSERT INTO `mob_skill_lists` VALUES ('',326,1548);
INSERT INTO `mob_skill_lists` VALUES ('',326,1549);
INSERT INTO `mob_skill_lists` VALUES ('',326,1550);
INSERT INTO `mob_skill_lists` VALUES ('',326,1551);

-- Gulool Ja Ja (Mamool Ja Warrior Type)
-- NOTES: Unsure if his weapon can be broken or not.
-- INSERT INTO `mob_skill_lists` VALUES ('',1541,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1542,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1543,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1544,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1545,?,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1482,?);

-- Hydra
INSERT INTO `mob_skill_lists` VALUES ('',164,1572);
INSERT INTO `mob_skill_lists` VALUES ('',164,1573);
INSERT INTO `mob_skill_lists` VALUES ('',164,1574);
INSERT INTO `mob_skill_lists` VALUES ('',164,1575);
INSERT INTO `mob_skill_lists` VALUES ('',164,1576);
INSERT INTO `mob_skill_lists` VALUES ('',164,1578);
INSERT INTO `mob_skill_lists` VALUES ('',164,1579);
INSERT INTO `mob_skill_lists` VALUES ('',164,1580);

-- Avatar - Odin
-- INSERT INTO `mob_skill_lists` VALUES ('',41,2300);
-- INSERT INTO `mob_skill_lists` VALUES ('',41,2301);
-- INSERT INTO `mob_skill_lists` VALUES ('',41,2302);
-- INSERT INTO `mob_skill_lists` VALUES ('',41,2303);
-- INSERT INTO `mob_skill_lists` VALUES ('',41,2304);
-- INSERT INTO `mob_skill_lists` VALUES ('',41,2305);
-- INSERT INTO `mob_skill_lists` VALUES ('',41,1870);

-- Khimaira
INSERT INTO `mob_skill_lists` VALUES ('',168,1769);
INSERT INTO `mob_skill_lists` VALUES ('',168,1770);
INSERT INTO `mob_skill_lists` VALUES ('',168,1772);
INSERT INTO `mob_skill_lists` VALUES ('',168,1771);
INSERT INTO `mob_skill_lists` VALUES ('',168,1766);
INSERT INTO `mob_skill_lists` VALUES ('',168,1767);
-- INSERT INTO `mob_skill_lists` VALUES ('',168,1768);
-- INSERT INTO `mob_skill_lists` VALUES ('',168,2442,?);

-- King Vinegaroon
INSERT INTO `mob_skill_lists` VALUES ('',274,463);
INSERT INTO `mob_skill_lists` VALUES ('',274,466);
INSERT INTO `mob_skill_lists` VALUES ('',274,467);
INSERT INTO `mob_skill_lists` VALUES ('',274,464);
INSERT INTO `mob_skill_lists` VALUES ('',274,97);
INSERT INTO `mob_skill_lists` VALUES ('',274,98);
INSERT INTO `mob_skill_lists` VALUES ('',274,99);

-- Ouryu
-- Ochre_Blast_alt is maybe aerial auto attack
-- INSERT INTO `mob_skill_lists` VALUES ('',259,1041);
INSERT INTO `mob_skill_lists` VALUES ('',259,1042);
INSERT INTO `mob_skill_lists` VALUES ('',259,1043);
INSERT INTO `mob_skill_lists` VALUES ('',259,1044);
INSERT INTO `mob_skill_lists` VALUES ('',259,1045);
INSERT INTO `mob_skill_lists` VALUES ('',259,1046);
INSERT INTO `mob_skill_lists` VALUES ('',259,1047);
INSERT INTO `mob_skill_lists` VALUES ('',259,1048);
INSERT INTO `mob_skill_lists` VALUES ('',259,1049);
INSERT INTO `mob_skill_lists` VALUES ('',259,1050);
INSERT INTO `mob_skill_lists` VALUES ('',259,1992);

-- Fafnir
INSERT INTO `mob_skill_lists` VALUES ('',260,695);
INSERT INTO `mob_skill_lists` VALUES ('',260,696);
INSERT INTO `mob_skill_lists` VALUES ('',260,697);
INSERT INTO `mob_skill_lists` VALUES ('',260,701);
INSERT INTO `mob_skill_lists` VALUES ('',260,702);

-- Cynoprosopi
INSERT INTO `mob_skill_lists` VALUES ('',261,695);
INSERT INTO `mob_skill_lists` VALUES ('',261,696);
INSERT INTO `mob_skill_lists` VALUES ('',261,697);
INSERT INTO `mob_skill_lists` VALUES ('',261,702);

-- Wyrm
INSERT INTO `mob_skill_lists` VALUES ('',262,695);
INSERT INTO `mob_skill_lists` VALUES ('',262,696);
INSERT INTO `mob_skill_lists` VALUES ('',262,697);

-- Nidhogg
INSERT INTO `mob_skill_lists` VALUES ('',263,695);
INSERT INTO `mob_skill_lists` VALUES ('',263,696);
INSERT INTO `mob_skill_lists` VALUES ('',263,697);
INSERT INTO `mob_skill_lists` VALUES ('',263,701);
INSERT INTO `mob_skill_lists` VALUES ('',263,790);
INSERT INTO `mob_skill_lists` VALUES ('',263,700);

-- Vrtra
INSERT INTO `mob_skill_lists` VALUES ('',391,1053);
INSERT INTO `mob_skill_lists` VALUES ('',391,1054);
INSERT INTO `mob_skill_lists` VALUES ('',391,1055);
INSERT INTO `mob_skill_lists` VALUES ('',391,1059);
INSERT INTO `mob_skill_lists` VALUES ('',391,1060);
INSERT INTO `mob_skill_lists` VALUES ('',391,454);

-- Jormungand
-- INSERT INTO `mob_skill_lists` VALUES ('',392,1031);
INSERT INTO `mob_skill_lists` VALUES ('',392,1032);
INSERT INTO `mob_skill_lists` VALUES ('',392,1033);
INSERT INTO `mob_skill_lists` VALUES ('',392,1034);
INSERT INTO `mob_skill_lists` VALUES ('',392,1035);
INSERT INTO `mob_skill_lists` VALUES ('',392,1036);
INSERT INTO `mob_skill_lists` VALUES ('',392,1037);
INSERT INTO `mob_skill_lists` VALUES ('',392,1038);
INSERT INTO `mob_skill_lists` VALUES ('',392,1039);
INSERT INTO `mob_skill_lists` VALUES ('',392,1040);
INSERT INTO `mob_skill_lists` VALUES ('',392,1993);

-- Tiamat
-- INSERT INTO `mob_skill_lists` VALUES ('',393,1021);
INSERT INTO `mob_skill_lists` VALUES ('',393,1022);
INSERT INTO `mob_skill_lists` VALUES ('',393,1023);
INSERT INTO `mob_skill_lists` VALUES ('',393,1024);
INSERT INTO `mob_skill_lists` VALUES ('',393,1025);
INSERT INTO `mob_skill_lists` VALUES ('',393,1026);
INSERT INTO `mob_skill_lists` VALUES ('',393,1027);
INSERT INTO `mob_skill_lists` VALUES ('',393,1028);
INSERT INTO `mob_skill_lists` VALUES ('',393,1029);
INSERT INTO `mob_skill_lists` VALUES ('',393,1030);
INSERT INTO `mob_skill_lists` VALUES ('',393,1986);

-- Faust
INSERT INTO `mob_skill_lists` VALUES ('',367,283);

-- Despot
INSERT INTO `mob_skill_lists` VALUES ('',368,280);

-- --------------------------------------
-- MAAT
-- --------------------------------------

INSERT INTO `mob_skill_lists` VALUES ('',335,772);
INSERT INTO `mob_skill_lists` VALUES ('',335,777);
INSERT INTO `mob_skill_lists` VALUES ('',335,778);

-- --------------------------------------
-- AVATAR
-- --------------------------------------

-- Fenrir
INSERT INTO `mob_skill_lists` VALUES ('',36,575);
INSERT INTO `mob_skill_lists` VALUES ('',36,576);
INSERT INTO `mob_skill_lists` VALUES ('',36,577);
INSERT INTO `mob_skill_lists` VALUES ('',36,578);
INSERT INTO `mob_skill_lists` VALUES ('',36,579);
INSERT INTO `mob_skill_lists` VALUES ('',36,580);
INSERT INTO `mob_skill_lists` VALUES ('',36,581);
INSERT INTO `mob_skill_lists` VALUES ('',36,582);

INSERT INTO `mob_skill_lists` VALUES ('',325,577);
INSERT INTO `mob_skill_lists` VALUES ('',325,579);
INSERT INTO `mob_skill_lists` VALUES ('',325,580);
INSERT INTO `mob_skill_lists` VALUES ('',325,582);

-- Pet - Fenrir
INSERT INTO `mob_skill_lists` VALUES ('',381,575);
INSERT INTO `mob_skill_lists` VALUES ('',381,576);
INSERT INTO `mob_skill_lists` VALUES ('',381,577);
INSERT INTO `mob_skill_lists` VALUES ('',381,578);
INSERT INTO `mob_skill_lists` VALUES ('',381,579);
INSERT INTO `mob_skill_lists` VALUES ('',381,580);
INSERT INTO `mob_skill_lists` VALUES ('',381,581);
INSERT INTO `mob_skill_lists` VALUES ('',381,582);

-- Ifrit
INSERT INTO `mob_skill_lists` VALUES ('',38,584);
INSERT INTO `mob_skill_lists` VALUES ('',38,585);
INSERT INTO `mob_skill_lists` VALUES ('',38,586);
INSERT INTO `mob_skill_lists` VALUES ('',38,587);
INSERT INTO `mob_skill_lists` VALUES ('',38,588);
INSERT INTO `mob_skill_lists` VALUES ('',38,589);
INSERT INTO `mob_skill_lists` VALUES ('',38,590);
INSERT INTO `mob_skill_lists` VALUES ('',38,591);
INSERT INTO `mob_skill_lists` VALUES ('',38,592);

INSERT INTO `mob_skill_lists` VALUES ('',322,589);
INSERT INTO `mob_skill_lists` VALUES ('',322,590);
INSERT INTO `mob_skill_lists` VALUES ('',322,591);
INSERT INTO `mob_skill_lists` VALUES ('',322,592);

-- Pet - Ifrit
INSERT INTO `mob_skill_lists` VALUES ('',383,584);
INSERT INTO `mob_skill_lists` VALUES ('',383,585);
INSERT INTO `mob_skill_lists` VALUES ('',383,586);
INSERT INTO `mob_skill_lists` VALUES ('',383,587);
INSERT INTO `mob_skill_lists` VALUES ('',383,588);
INSERT INTO `mob_skill_lists` VALUES ('',383,589);
INSERT INTO `mob_skill_lists` VALUES ('',383,590);
INSERT INTO `mob_skill_lists` VALUES ('',383,591);
INSERT INTO `mob_skill_lists` VALUES ('',383,592);

-- Titan
INSERT INTO `mob_skill_lists` VALUES ('',45,593);
INSERT INTO `mob_skill_lists` VALUES ('',45,594);
INSERT INTO `mob_skill_lists` VALUES ('',45,595);
INSERT INTO `mob_skill_lists` VALUES ('',45,596);
INSERT INTO `mob_skill_lists` VALUES ('',45,597);
INSERT INTO `mob_skill_lists` VALUES ('',45,598);
INSERT INTO `mob_skill_lists` VALUES ('',45,599);
INSERT INTO `mob_skill_lists` VALUES ('',45,600);
INSERT INTO `mob_skill_lists` VALUES ('',45,601);

INSERT INTO `mob_skill_lists` VALUES ('',321,597);
INSERT INTO `mob_skill_lists` VALUES ('',321,598);
INSERT INTO `mob_skill_lists` VALUES ('',321,599);
INSERT INTO `mob_skill_lists` VALUES ('',321,600);
INSERT INTO `mob_skill_lists` VALUES ('',321,601);

-- Pet - Titan
INSERT INTO `mob_skill_lists` VALUES ('',388,593);
INSERT INTO `mob_skill_lists` VALUES ('',388,594);
INSERT INTO `mob_skill_lists` VALUES ('',388,595);
INSERT INTO `mob_skill_lists` VALUES ('',388,596);
INSERT INTO `mob_skill_lists` VALUES ('',388,597);
INSERT INTO `mob_skill_lists` VALUES ('',388,598);
INSERT INTO `mob_skill_lists` VALUES ('',388,599);
INSERT INTO `mob_skill_lists` VALUES ('',388,600);
INSERT INTO `mob_skill_lists` VALUES ('',388,601);

-- Leviathan
INSERT INTO `mob_skill_lists` VALUES ('',40,602);
INSERT INTO `mob_skill_lists` VALUES ('',40,603);
INSERT INTO `mob_skill_lists` VALUES ('',40,604);
INSERT INTO `mob_skill_lists` VALUES ('',40,605);
INSERT INTO `mob_skill_lists` VALUES ('',40,606);
INSERT INTO `mob_skill_lists` VALUES ('',40,607);
INSERT INTO `mob_skill_lists` VALUES ('',40,608);
INSERT INTO `mob_skill_lists` VALUES ('',40,609);
INSERT INTO `mob_skill_lists` VALUES ('',40,610);

INSERT INTO `mob_skill_lists` VALUES ('',323,605);
INSERT INTO `mob_skill_lists` VALUES ('',323,607);
INSERT INTO `mob_skill_lists` VALUES ('',323,608);
INSERT INTO `mob_skill_lists` VALUES ('',323,609);
INSERT INTO `mob_skill_lists` VALUES ('',323,610);

-- Pet - Leviathan
INSERT INTO `mob_skill_lists` VALUES ('',384,602);
INSERT INTO `mob_skill_lists` VALUES ('',384,603);
INSERT INTO `mob_skill_lists` VALUES ('',384,604);
INSERT INTO `mob_skill_lists` VALUES ('',384,605);
INSERT INTO `mob_skill_lists` VALUES ('',384,606);
INSERT INTO `mob_skill_lists` VALUES ('',384,607);
INSERT INTO `mob_skill_lists` VALUES ('',384,608);
INSERT INTO `mob_skill_lists` VALUES ('',384,609);
INSERT INTO `mob_skill_lists` VALUES ('',384,610);

-- Garuda
INSERT INTO `mob_skill_lists` VALUES ('',37,611);
INSERT INTO `mob_skill_lists` VALUES ('',37,612);
INSERT INTO `mob_skill_lists` VALUES ('',37,613);
INSERT INTO `mob_skill_lists` VALUES ('',37,614);
INSERT INTO `mob_skill_lists` VALUES ('',37,615);
INSERT INTO `mob_skill_lists` VALUES ('',37,616);
INSERT INTO `mob_skill_lists` VALUES ('',37,617);
INSERT INTO `mob_skill_lists` VALUES ('',37,618);
INSERT INTO `mob_skill_lists` VALUES ('',37,619);

INSERT INTO `mob_skill_lists` VALUES ('',324,616);
INSERT INTO `mob_skill_lists` VALUES ('',324,617);
INSERT INTO `mob_skill_lists` VALUES ('',324,618);
INSERT INTO `mob_skill_lists` VALUES ('',324,619);

-- Pet - Garuda
INSERT INTO `mob_skill_lists` VALUES ('',382,611);
INSERT INTO `mob_skill_lists` VALUES ('',382,612);
INSERT INTO `mob_skill_lists` VALUES ('',382,613);
INSERT INTO `mob_skill_lists` VALUES ('',382,614);
INSERT INTO `mob_skill_lists` VALUES ('',382,615);
INSERT INTO `mob_skill_lists` VALUES ('',382,616);
INSERT INTO `mob_skill_lists` VALUES ('',382,617);
INSERT INTO `mob_skill_lists` VALUES ('',382,618);
INSERT INTO `mob_skill_lists` VALUES ('',382,619);

-- Shiva
INSERT INTO `mob_skill_lists` VALUES ('',44,620);
INSERT INTO `mob_skill_lists` VALUES ('',44,621);
INSERT INTO `mob_skill_lists` VALUES ('',44,622);
INSERT INTO `mob_skill_lists` VALUES ('',44,623);
INSERT INTO `mob_skill_lists` VALUES ('',44,624);
INSERT INTO `mob_skill_lists` VALUES ('',44,625);
INSERT INTO `mob_skill_lists` VALUES ('',44,626);
INSERT INTO `mob_skill_lists` VALUES ('',44,627);
INSERT INTO `mob_skill_lists` VALUES ('',44,628);

INSERT INTO `mob_skill_lists` VALUES ('',319,625);
INSERT INTO `mob_skill_lists` VALUES ('',319,626);
INSERT INTO `mob_skill_lists` VALUES ('',319,627);
INSERT INTO `mob_skill_lists` VALUES ('',319,628);

-- Pet - Shiva
INSERT INTO `mob_skill_lists` VALUES ('',387,620);
INSERT INTO `mob_skill_lists` VALUES ('',387,621);
INSERT INTO `mob_skill_lists` VALUES ('',387,622);
INSERT INTO `mob_skill_lists` VALUES ('',387,623);
INSERT INTO `mob_skill_lists` VALUES ('',387,624);
INSERT INTO `mob_skill_lists` VALUES ('',387,625);
INSERT INTO `mob_skill_lists` VALUES ('',387,626);
INSERT INTO `mob_skill_lists` VALUES ('',387,627);
INSERT INTO `mob_skill_lists` VALUES ('',387,628);

-- Ramuh
INSERT INTO `mob_skill_lists` VALUES ('',43,629);
INSERT INTO `mob_skill_lists` VALUES ('',43,630);
INSERT INTO `mob_skill_lists` VALUES ('',43,631);
INSERT INTO `mob_skill_lists` VALUES ('',43,632);
INSERT INTO `mob_skill_lists` VALUES ('',43,633);
INSERT INTO `mob_skill_lists` VALUES ('',43,634);
INSERT INTO `mob_skill_lists` VALUES ('',43,635);
INSERT INTO `mob_skill_lists` VALUES ('',43,636);
INSERT INTO `mob_skill_lists` VALUES ('',43,637);

INSERT INTO `mob_skill_lists` VALUES ('',320,634);
INSERT INTO `mob_skill_lists` VALUES ('',320,635);
INSERT INTO `mob_skill_lists` VALUES ('',320,636);
INSERT INTO `mob_skill_lists` VALUES ('',320,637);

-- Pet - Ramuh
INSERT INTO `mob_skill_lists` VALUES ('',386,629);
INSERT INTO `mob_skill_lists` VALUES ('',386,630);
INSERT INTO `mob_skill_lists` VALUES ('',386,631);
INSERT INTO `mob_skill_lists` VALUES ('',386,632);
INSERT INTO `mob_skill_lists` VALUES ('',386,633);
INSERT INTO `mob_skill_lists` VALUES ('',386,634);
INSERT INTO `mob_skill_lists` VALUES ('',386,635);
INSERT INTO `mob_skill_lists` VALUES ('',386,636);
INSERT INTO `mob_skill_lists` VALUES ('',386,637);

-- Carbuncle
INSERT INTO `mob_skill_lists` VALUES ('',34,650);
INSERT INTO `mob_skill_lists` VALUES ('',34,651);
-- INSERT INTO `mob_skill_lists` VALUES ('',34,652);
-- INSERT INTO `mob_skill_lists` VALUES ('',34,653);
INSERT INTO `mob_skill_lists` VALUES ('',34,654);
INSERT INTO `mob_skill_lists` VALUES ('',34,655);
INSERT INTO `mob_skill_lists` VALUES ('',34,656);

-- Pet Carbuncle
INSERT INTO `mob_skill_lists` VALUES ('',379,650);
INSERT INTO `mob_skill_lists` VALUES ('',379,651);
INSERT INTO `mob_skill_lists` VALUES ('',379,652);
INSERT INTO `mob_skill_lists` VALUES ('',379,653);
INSERT INTO `mob_skill_lists` VALUES ('',379,654);
INSERT INTO `mob_skill_lists` VALUES ('',379,655);
INSERT INTO `mob_skill_lists` VALUES ('',379,656);
-- INSERT INTO `mob_skill_lists` VALUES ('',379,656);
-- INSERT INTO `mob_skill_lists` VALUES ('',379,656);

-- Pet - Diabolos
INSERT INTO `mob_skill_lists` VALUES ('',380,1647);
INSERT INTO `mob_skill_lists` VALUES ('',380,1648);
INSERT INTO `mob_skill_lists` VALUES ('',380,1649);
INSERT INTO `mob_skill_lists` VALUES ('',380,1650);
INSERT INTO `mob_skill_lists` VALUES ('',380,1651);
INSERT INTO `mob_skill_lists` VALUES ('',380,1652);
INSERT INTO `mob_skill_lists` VALUES ('',380,1654);
INSERT INTO `mob_skill_lists` VALUES ('',380,1655);
-- INSERT INTO `mob_skill_lists` VALUES ('',380,1655);

-- Pet - Odin
INSERT INTO `mob_skill_lists` VALUES ('',385,1870);

-- Pet - Alexander
INSERT INTO `mob_skill_lists` VALUES ('',389,1887);

-- Soulflayers
INSERT INTO `mob_skill_lists` VALUES ('',233,1707);
-- INSERT INTO `mob_skill_lists` VALUES ('',233,1708);
-- INSERT INTO `mob_skill_lists` VALUES ('',233,1709);
INSERT INTO `mob_skill_lists` VALUES ('',233,1710);
INSERT INTO `mob_skill_lists` VALUES ('',233,1711);
INSERT INTO `mob_skill_lists` VALUES ('',233,1712);

-- Orobons
INSERT INTO `mob_skill_lists` VALUES ('',191,1439);
INSERT INTO `mob_skill_lists` VALUES ('',191,1438);
INSERT INTO `mob_skill_lists` VALUES ('',191,1441);
INSERT INTO `mob_skill_lists` VALUES ('',191,1440);
INSERT INTO `mob_skill_lists` VALUES ('',191,1437);

-- INSERT INTO `mob_skill_lists` VALUES ('',1442,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1721,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',1722,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2383,?);

-- --------------------------------------
-- ZNM
-- --------------------------------------

-- Vulpangue (286)
-- INSERT INTO `mob_skill_lists` VALUES ('',286,1468);
-- INSERT INTO `mob_skill_lists` VALUES ('',286,1467);
INSERT INTO `mob_skill_lists` VALUES ('',286,1466);
INSERT INTO `mob_skill_lists` VALUES ('',286,1465);
INSERT INTO `mob_skill_lists` VALUES ('',286,1464);
INSERT INTO `mob_skill_lists` VALUES ('',286,1462);

-- Chamrosh (287)
INSERT INTO `mob_skill_lists` VALUES ('',287,1445);
INSERT INTO `mob_skill_lists` VALUES ('',287,1444);
INSERT INTO `mob_skill_lists` VALUES ('',287,1443);
-- INSERT INTO `mob_skill_lists` VALUES ('',287,1446);

-- Cheese Hoarder Gigiroon (288) - Qiqirn
INSERT INTO `mob_skill_lists` VALUES ('',288,1469);
-- INSERT INTO `mob_skill_lists` VALUES ('',199,1470);
INSERT INTO `mob_skill_lists` VALUES ('',288,1471);
INSERT INTO `mob_skill_lists` VALUES ('',288,1472);
INSERT INTO `mob_skill_lists` VALUES ('',288,1474);
-- INSERT INTO `mob_skill_lists` VALUES ('',288,2103);

-- Brass Borer (289)
INSERT INTO `mob_skill_lists` VALUES ('',289,1559);
INSERT INTO `mob_skill_lists` VALUES ('',289,1560);
INSERT INTO `mob_skill_lists` VALUES ('',289,1561);
INSERT INTO `mob_skill_lists` VALUES ('',289,1562);
INSERT INTO `mob_skill_lists` VALUES ('',289,1563);
-- INSERT INTO `mob_skill_lists` VALUES ('',289,1564);

-- Claret (290)
INSERT INTO `mob_skill_lists` VALUES ('',290,176);
INSERT INTO `mob_skill_lists` VALUES ('',290,175);
INSERT INTO `mob_skill_lists` VALUES ('',290,177);
-- INSERT INTO `mob_skill_lists` VALUES ('',290,1061);
-- INSERT INTO `mob_skill_lists` VALUES ('',290,1063);

-- Ob (291)

-- Velionis (292)
INSERT INTO `mob_skill_lists` VALUES ('',292,222);
INSERT INTO `mob_skill_lists` VALUES ('',292,223);
INSERT INTO `mob_skill_lists` VALUES ('',292,228);
INSERT INTO `mob_skill_lists` VALUES ('',292,229);
-- INSERT INTO `mob_skill_lists` VALUES ('',292,1539);
-- INSERT INTO `mob_skill_lists` VALUES ('',292,900);
-- INSERT INTO `mob_skill_lists` VALUES ('',292,0);

-- Lil'Apkallu (294)
-- INSERT INTO `mob_skill_lists` VALUES ('',294,1460);
INSERT INTO `mob_skill_lists` VALUES ('',294,1459);
INSERT INTO `mob_skill_lists` VALUES ('',294,1457);
INSERT INTO `mob_skill_lists` VALUES ('',294,1458);

-- Iriz Ima (295)
INSERT INTO `mob_skill_lists` VALUES ('',295,1447);
INSERT INTO `mob_skill_lists` VALUES ('',295,1451);
INSERT INTO `mob_skill_lists` VALUES ('',295,1450);
INSERT INTO `mob_skill_lists` VALUES ('',295,1449);
INSERT INTO `mob_skill_lists` VALUES ('',295,1448);
-- INSERT INTO `mob_skill_lists` VALUES ('',295,1452);

-- Lividroot Amooshah (296)
INSERT INTO `mob_skill_lists` VALUES ('',296,60);
INSERT INTO `mob_skill_lists` VALUES ('',296,61);
-- INSERT INTO `mob_skill_lists` VALUES ('',296,62);
INSERT INTO `mob_skill_lists` VALUES ('',296,63);
INSERT INTO `mob_skill_lists` VALUES ('',296,64);
-- INSERT INTO `mob_skill_lists` VALUES ('',296,1076);

-- Iriri Samariri (297)
INSERT INTO `mob_skill_lists` VALUES ('',297,1703);
INSERT INTO `mob_skill_lists` VALUES ('',297,1702);
-- INSERT INTO `mob_skill_lists` VALUES ('',297,1704);
-- INSERT INTO `mob_skill_lists` VALUES ('',295,1706);

-- Anantaboga (298)
INSERT INTO `mob_skill_lists` VALUES ('',298,388);
INSERT INTO `mob_skill_lists` VALUES ('',298,389);
INSERT INTO `mob_skill_lists` VALUES ('',298,390);
-- INSERT INTO `mob_skill_lists` VALUES ('',298,0);
-- INSERT INTO `mob_skill_lists` VALUES ('',298,0);

-- Dextrose (299)
INSERT INTO `mob_skill_lists` VALUES ('',299,1565);
INSERT INTO `mob_skill_lists` VALUES ('',299,1566);
-- INSERT INTO `mob_skill_lists` VALUES ('',299,1568);
-- INSERT INTO `mob_skill_lists` VALUES ('',299,1570);
-- INSERT INTO `mob_skill_lists` VALUES ('',299,1567);

-- Reacton (300)
INSERT INTO `mob_skill_lists` VALUES ('',300,255);
INSERT INTO `mob_skill_lists` VALUES ('',300,254);

-- Verdelet (301)
INSERT INTO `mob_skill_lists` VALUES ('',301,1455);
INSERT INTO `mob_skill_lists` VALUES ('',301,1453);
INSERT INTO `mob_skill_lists` VALUES ('',301,1454);

-- Wulgaru (302)
INSERT INTO `mob_skill_lists` VALUES ('',302,1814);
INSERT INTO `mob_skill_lists` VALUES ('',302,1815);
INSERT INTO `mob_skill_lists` VALUES ('',302,1816);
INSERT INTO `mob_skill_lists` VALUES ('',302,1817);
INSERT INTO `mob_skill_lists` VALUES ('',302,1818);

-- Zareehkl the Jubilant (303)
INSERT INTO `mob_skill_lists` VALUES ('',303,1522);
INSERT INTO `mob_skill_lists` VALUES ('',303,1523);
INSERT INTO `mob_skill_lists` VALUES ('',303,1524);
-- INSERT INTO `mob_skill_lists` VALUES ('',303,1525);
-- INSERT INTO `mob_skill_lists` VALUES ('',303,1526);
-- INSERT INTO `mob_skill_lists` VALUES ('',303,1527);
-- INSERT INTO `mob_skill_lists` VALUES ('',303,1528);

-- Armed Gears (304)
-- INSERT INTO `mob_skill_lists` VALUES ('',304,1791);
-- INSERT INTO `mob_skill_lists` VALUES ('',304,1787);
-- INSERT INTO `mob_skill_lists` VALUES ('',304,1789);
-- INSERT INTO `mob_skill_lists` VALUES ('',304,1785);
-- INSERT INTO `mob_skill_lists` VALUES ('',304,1808);

-- Gotoh Zha the Redolent (305) -- Mamool Ja Sage Type
-- INSERT INTO `mob_skill_lists` VALUES ('',305,1664);
INSERT INTO `mob_skill_lists` VALUES ('',305,1665);
INSERT INTO `mob_skill_lists` VALUES ('',305,1666);
INSERT INTO `mob_skill_lists` VALUES ('',305,1667);
INSERT INTO `mob_skill_lists` VALUES ('',305,1668);
-- INSERT INTO `mob_skill_lists` VALUES ('',305,1669);
-- INSERT INTO `mob_skill_lists` VALUES ('',305,1670);

-- Dea (306)

-- Achamoth (307)

-- Khromasoul Bhurborlor (308)
INSERT INTO `mob_skill_lists` VALUES ('',308,1487);
INSERT INTO `mob_skill_lists` VALUES ('',308,1488);
INSERT INTO `mob_skill_lists` VALUES ('',308,1489);
INSERT INTO `mob_skill_lists` VALUES ('',308,1490);

-- Nosferatu (309)
INSERT INTO `mob_skill_lists` VALUES ('',309,1850);
-- INSERT INTO `mob_skill_lists` VALUES ('',309,1851);
-- INSERT INTO `mob_skill_lists` VALUES ('',309,1852);
-- INSERT INTO `mob_skill_lists` VALUES ('',309,1853);
INSERT INTO `mob_skill_lists` VALUES ('',309,1854);
-- INSERT INTO `mob_skill_lists` VALUES ('',309,1855);
-- INSERT INTO `mob_skill_lists` VALUES ('',309,1856);

-- Experimental Lamia (310)
INSERT INTO `mob_skill_lists` VALUES ('',310,1497);
INSERT INTO `mob_skill_lists` VALUES ('',310,1502);

-- Mahjlaef the Paintorn (311)
INSERT INTO `mob_skill_lists` VALUES ('',311,1707);
-- INSERT INTO `mob_skill_lists` VALUES ('',311,1708);
-- INSERT INTO `mob_skill_lists` VALUES ('',311,1709);
INSERT INTO `mob_skill_lists` VALUES ('',311,1710);
INSERT INTO `mob_skill_lists` VALUES ('',311,1711);
INSERT INTO `mob_skill_lists` VALUES ('',311,1712);
-- INSERT INTO `mob_skill_lists` VALUES ('',311,0);

-- Nuhn (312)
-- INSERT INTO `mob_skill_lists` VALUES ('',312,1439);
-- INSERT INTO `mob_skill_lists` VALUES ('',312,1438);
-- INSERT INTO `mob_skill_lists` VALUES ('',312,1441);
-- INSERT INTO `mob_skill_lists` VALUES ('',312,1440);
-- INSERT INTO `mob_skill_lists` VALUES ('',312,1437);
-- INSERT INTO `mob_skill_lists` VALUES ('',312,1442);
-- INSERT INTO `mob_skill_lists` VALUES ('',312,1721);
-- INSERT INTO `mob_skill_lists` VALUES ('',312,1722);

-- Tinnin (313)
INSERT INTO `mob_skill_lists` VALUES ('',313,1572);
INSERT INTO `mob_skill_lists` VALUES ('',313,1573);
INSERT INTO `mob_skill_lists` VALUES ('',313,1574);
INSERT INTO `mob_skill_lists` VALUES ('',313,1575);
INSERT INTO `mob_skill_lists` VALUES ('',313,1576);
INSERT INTO `mob_skill_lists` VALUES ('',313,1578);
INSERT INTO `mob_skill_lists` VALUES ('',313,1579);
INSERT INTO `mob_skill_lists` VALUES ('',313,1580);

-- Sarameya (314)
INSERT INTO `mob_skill_lists` VALUES ('',314,1529);
INSERT INTO `mob_skill_lists` VALUES ('',314,1530);
INSERT INTO `mob_skill_lists` VALUES ('',314,1531);
INSERT INTO `mob_skill_lists` VALUES ('',314,1532);
INSERT INTO `mob_skill_lists` VALUES ('',314,1533);
INSERT INTO `mob_skill_lists` VALUES ('',314,1534);

-- Tyger (315)
INSERT INTO `mob_skill_lists` VALUES ('',315,1769);
INSERT INTO `mob_skill_lists` VALUES ('',315,1770);
INSERT INTO `mob_skill_lists` VALUES ('',315,1772);
INSERT INTO `mob_skill_lists` VALUES ('',315,1771);
INSERT INTO `mob_skill_lists` VALUES ('',315,1766);
INSERT INTO `mob_skill_lists` VALUES ('',315,1767);
INSERT INTO `mob_skill_lists` VALUES ('',315,1768);
-- INSERT INTO `mob_skill_lists` VALUES ('',315,432);

-- Shinryu (316)
-- Wings out
INSERT INTO `mob_skill_lists` VALUES ('',475,2394);
INSERT INTO `mob_skill_lists` VALUES ('',475,2395);
INSERT INTO `mob_skill_lists` VALUES ('',475,2396);
INSERT INTO `mob_skill_lists` VALUES ('',475,2397);
INSERT INTO `mob_skill_lists` VALUES ('',475,2398);
INSERT INTO `mob_skill_lists` VALUES ('',475,2399);
INSERT INTO `mob_skill_lists` VALUES ('',475,2400);
INSERT INTO `mob_skill_lists` VALUES ('',475,2408);
INSERT INTO `mob_skill_lists` VALUES ('',475,2409);
INSERT INTO `mob_skill_lists` VALUES ('',475,2411);
INSERT INTO `mob_skill_lists` VALUES ('',475,2412);
INSERT INTO `mob_skill_lists` VALUES ('',475,2414);

-- Wings in
INSERT INTO `mob_skill_lists` VALUES ('',475,2401);
INSERT INTO `mob_skill_lists` VALUES ('',475,2402);
INSERT INTO `mob_skill_lists` VALUES ('',475,2403);
INSERT INTO `mob_skill_lists` VALUES ('',475,2404);
INSERT INTO `mob_skill_lists` VALUES ('',475,2405);
INSERT INTO `mob_skill_lists` VALUES ('',475,2406);
INSERT INTO `mob_skill_lists` VALUES ('',475,2407);
INSERT INTO `mob_skill_lists` VALUES ('',475,2452);
INSERT INTO `mob_skill_lists` VALUES ('',475,2453);
INSERT INTO `mob_skill_lists` VALUES ('',475,2410);
INSERT INTO `mob_skill_lists` VALUES ('',475,2413);
INSERT INTO `mob_skill_lists` VALUES ('',475,2415);

-- Absoulute Virtue  (329)
INSERT INTO `mob_skill_lists` VALUES ('',329,1128);
INSERT INTO `mob_skill_lists` VALUES ('',329,1127);
-- INSERT INTO `mob_skill_lists` VALUES ('',329,1126);
-- INSERT INTO `mob_skill_lists` VALUES ('',329,1125);
-- INSERT INTO `mob_skill_lists` VALUES ('',329,1130);
-- INSERT INTO `mob_skill_lists` VALUES ('',329,1124);
-- INSERT INTO `mob_skill_lists` VALUES ('',329,1123);
-- INSERT INTO `mob_skill_lists` VALUES ('',329,1122);
-- INSERT INTO `mob_skill_lists` VALUES ('',329,1121);

-- exoplates
INSERT INTO `mob_skill_lists` VALUES ('',236,734);
INSERT INTO `mob_skill_lists` VALUES ('',236,735);
INSERT INTO `mob_skill_lists` VALUES ('',236,736);
INSERT INTO `mob_skill_lists` VALUES ('',236,737);
INSERT INTO `mob_skill_lists` VALUES ('',236,738);
INSERT INTO `mob_skill_lists` VALUES ('',236,739);
INSERT INTO `mob_skill_lists` VALUES ('',236,740);
INSERT INTO `mob_skill_lists` VALUES ('',236,741);
INSERT INTO `mob_skill_lists` VALUES ('',236,742);
INSERT INTO `mob_skill_lists` VALUES ('',236,743);
INSERT INTO `mob_skill_lists` VALUES ('',236,744);
INSERT INTO `mob_skill_lists` VALUES ('',236,745);

-- eald narche
INSERT INTO `mob_skill_lists` VALUES ('',394,729);
INSERT INTO `mob_skill_lists` VALUES ('',394,730);
INSERT INTO `mob_skill_lists` VALUES ('',394,750);
INSERT INTO `mob_skill_lists` VALUES ('',394,732);
INSERT INTO `mob_skill_lists` VALUES ('',394,733);

-- Avatar Ixon
-- INSERT INTO `mob_skill_lists` VALUES ('',39,2078);

-- -------------------------------------------------------------------------------
-- NOTE: all skills 700+ are special skill lists given to NMs / special families
-- -------------------------------------------------------------------------------

-- Demonic_Tiphia
INSERT INTO `mob_skill_lists` VALUES ('',700,80);
INSERT INTO `mob_skill_lists` VALUES ('',700,79);
INSERT INTO `mob_skill_lists` VALUES ('',700,78);

-- Cactrot_Rapido
INSERT INTO `mob_skill_lists` VALUES ('',703,68);
INSERT INTO `mob_skill_lists` VALUES ('',703,66);
INSERT INTO `mob_skill_lists` VALUES ('',703,65);
INSERT INTO `mob_skill_lists` VALUES ('',703,864);

-- Quadav NM (Dynamis)
INSERT INTO `mob_skill_lists` VALUES ('',705,819);
INSERT INTO `mob_skill_lists` VALUES ('',705,820);
INSERT INTO `mob_skill_lists` VALUES ('',705,821);
INSERT INTO `mob_skill_lists` VALUES ('',705,822);
INSERT INTO `mob_skill_lists` VALUES ('',705,823);
INSERT INTO `mob_skill_lists` VALUES ('',705,824);


-- Biotechnological Weapons
INSERT INTO `mob_skill_lists` VALUES ('',54,1278);
-- INSERT INTO `mob_skill_lists` VALUES ('',54,982);
INSERT INTO `mob_skill_lists` VALUES ('',54,1277);
INSERT INTO `mob_skill_lists` VALUES ('',54,1271);
INSERT INTO `mob_skill_lists` VALUES ('',54,1270);
INSERT INTO `mob_skill_lists` VALUES ('',54,1269);
INSERT INTO `mob_skill_lists` VALUES ('',54,1272);
INSERT INTO `mob_skill_lists` VALUES ('',54,1273);
INSERT INTO `mob_skill_lists` VALUES ('',54,1274);
INSERT INTO `mob_skill_lists` VALUES ('',54,1003);
INSERT INTO `mob_skill_lists` VALUES ('',54,1004);
INSERT INTO `mob_skill_lists` VALUES ('',54,1005);
INSERT INTO `mob_skill_lists` VALUES ('',54,1006);
INSERT INTO `mob_skill_lists` VALUES ('',54,1007);
INSERT INTO `mob_skill_lists` VALUES ('',54,1008);
INSERT INTO `mob_skill_lists` VALUES ('',54,1009);
INSERT INTO `mob_skill_lists` VALUES ('',54,1010);
INSERT INTO `mob_skill_lists` VALUES ('',54,1011);
-- INSERT INTO `mob_skill_lists` VALUES ('',54,1012);
INSERT INTO `mob_skill_lists` VALUES ('',54,1013);
INSERT INTO `mob_skill_lists` VALUES ('',54,1265);
INSERT INTO `mob_skill_lists` VALUES ('',54,1266);
INSERT INTO `mob_skill_lists` VALUES ('',54,1267);
INSERT INTO `mob_skill_lists` VALUES ('',54,1268);
-- INSERT INTO `mob_skill_lists` VALUES ('',?,54,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',?,54,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',?,54,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',54,1281,?);

-- Belladona
INSERT INTO `mob_skill_lists` VALUES ('',453,2624);
INSERT INTO `mob_skill_lists` VALUES ('',453,2625);
INSERT INTO `mob_skill_lists` VALUES ('',453,2626);
INSERT INTO `mob_skill_lists` VALUES ('',453,2627);
INSERT INTO `mob_skill_lists` VALUES ('',453,2628);
INSERT INTO `mob_skill_lists` VALUES ('',453,2629);

-- Bahamut
INSERT INTO `mob_skill_lists` VALUES ('',449,1286);
INSERT INTO `mob_skill_lists` VALUES ('',449,1287);
INSERT INTO `mob_skill_lists` VALUES ('',449,1288);
INSERT INTO `mob_skill_lists` VALUES ('',449,1289);
INSERT INTO `mob_skill_lists` VALUES ('',449,1290);
INSERT INTO `mob_skill_lists` VALUES ('',449,1291);
INSERT INTO `mob_skill_lists` VALUES ('',449,1292);
INSERT INTO `mob_skill_lists` VALUES ('',449,1293);
INSERT INTO `mob_skill_lists` VALUES ('',449,1295);
INSERT INTO `mob_skill_lists` VALUES ('',449,1296);
INSERT INTO `mob_skill_lists` VALUES ('',449,1297);

-- Prishe
INSERT INTO `mob_skill_lists` VALUES ('',476,1229);
INSERT INTO `mob_skill_lists` VALUES ('',476,1230);
INSERT INTO `mob_skill_lists` VALUES ('',476,1231);
INSERT INTO `mob_skill_lists` VALUES ('',476,1232);
INSERT INTO `mob_skill_lists` VALUES ('',476,1233);
INSERT INTO `mob_skill_lists` VALUES ('',476,1234);

-- Promathia phase 1
INSERT INTO `mob_skill_lists` VALUES ('',134,1235);
INSERT INTO `mob_skill_lists` VALUES ('',134,1236);
INSERT INTO `mob_skill_lists` VALUES ('',134,1237);
INSERT INTO `mob_skill_lists` VALUES ('',134,1238);
INSERT INTO `mob_skill_lists` VALUES ('',134,1239);
INSERT INTO `mob_skill_lists` VALUES ('',134,1240);
INSERT INTO `mob_skill_lists` VALUES ('',134,1241);
INSERT INTO `mob_skill_lists` VALUES ('',134,1242);
INSERT INTO `mob_skill_lists` VALUES ('',134,1243);

-- Promathia phase 2
INSERT INTO `mob_skill_lists` VALUES ('',478,1244);
INSERT INTO `mob_skill_lists` VALUES ('',478,1245);
INSERT INTO `mob_skill_lists` VALUES ('',478,1246);
INSERT INTO `mob_skill_lists` VALUES ('',478,1247);
INSERT INTO `mob_skill_lists` VALUES ('',478,1248);
INSERT INTO `mob_skill_lists` VALUES ('',478,1249);
INSERT INTO `mob_skill_lists` VALUES ('',478,1250);
INSERT INTO `mob_skill_lists` VALUES ('',478,1251);

-- Selh'teus
INSERT INTO `mob_skill_lists` VALUES ('',477,1252);
INSERT INTO `mob_skill_lists` VALUES ('',477,1253);
INSERT INTO `mob_skill_lists` VALUES ('',477,1254);

-- Tenzen
-- ranged @ 1033 1034
INSERT INTO `mob_skill_lists` VALUES ('',149,1134);
INSERT INTO `mob_skill_lists` VALUES ('',149,1135);
INSERT INTO `mob_skill_lists` VALUES ('',149,1136);
INSERT INTO `mob_skill_lists` VALUES ('',149,1137);
INSERT INTO `mob_skill_lists` VALUES ('',149,1138);
INSERT INTO `mob_skill_lists` VALUES ('',149,1139);
INSERT INTO `mob_skill_lists` VALUES ('',149,1141);
-- INSERT INTO `mob_skill_lists` VALUES ('',149,1142);
INSERT INTO `mob_skill_lists` VALUES ('',149,1143);

-- Lady Lilith
-- personal special melee 1840 1841 1842
INSERT INTO `mob_skill_lists` VALUES ('',473,2419);
INSERT INTO `mob_skill_lists` VALUES ('',473,2420);
INSERT INTO `mob_skill_lists` VALUES ('',473,2421);
INSERT INTO `mob_skill_lists` VALUES ('',473,2422);
INSERT INTO `mob_skill_lists` VALUES ('',473,2423);
INSERT INTO `mob_skill_lists` VALUES ('',473,2424);

-- Lilith ascendant
-- 1849 special melee?
INSERT INTO `mob_skill_lists` VALUES ('',472,2428);
INSERT INTO `mob_skill_lists` VALUES ('',472,2429);
INSERT INTO `mob_skill_lists` VALUES ('',472,2430);
INSERT INTO `mob_skill_lists` VALUES ('',472,2431);
INSERT INTO `mob_skill_lists` VALUES ('',472,2432);
INSERT INTO `mob_skill_lists` VALUES ('',472,2433);
INSERT INTO `mob_skill_lists` VALUES ('',472,2434);
INSERT INTO `mob_skill_lists` VALUES ('',472,2435);



-- Alexander
-- INSERT INTO `mob_skill_lists` VALUES ('',357,1885);
-- INSERT INTO `mob_skill_lists` VALUES ('',357,1886);
-- INSERT INTO `mob_skill_lists` VALUES ('',357,1887);
-- INSERT INTO `mob_skill_lists` VALUES ('',357,1888);
-- INSERT INTO `mob_skill_lists` VALUES ('',357,1889);
-- INSERT INTO `mob_skill_lists` VALUES ('',357,1890);
-- INSERT INTO `mob_skill_lists` VALUES ('',357,1891);

-- Monoceros
INSERT INTO `mob_skill_lists` VALUES ('',39,2078);
INSERT INTO `mob_skill_lists` VALUES ('',39,2079);
INSERT INTO `mob_skill_lists` VALUES ('',39,2080);
INSERT INTO `mob_skill_lists` VALUES ('',39,2081);
INSERT INTO `mob_skill_lists` VALUES ('',39,2082);
INSERT INTO `mob_skill_lists` VALUES ('',39,2113);
-- INSERT INTO `mob_skill_lists` VALUES ('',39,1286,?);

-- Monoceros (Alicorn Subspecies)
-- INSERT INTO `mob_skill_lists` VALUES ('',2114,?);

-- Slugs
INSERT INTO `mob_skill_lists` VALUES ('',231,1927);
INSERT INTO `mob_skill_lists` VALUES ('',231,1928);
INSERT INTO `mob_skill_lists` VALUES ('',231,1929);
-- INSERT INTO `mob_skill_lists` VALUES ('',1930,???);

-- Sandworms
INSERT INTO `mob_skill_lists` VALUES ('',215,1931);
INSERT INTO `mob_skill_lists` VALUES ('',215,1932);
INSERT INTO `mob_skill_lists` VALUES ('',215,1933);
INSERT INTO `mob_skill_lists` VALUES ('',214,1934);
INSERT INTO `mob_skill_lists` VALUES ('',214,1935);
INSERT INTO `mob_skill_lists` VALUES ('',214,1936);
-- INSERT INTO `mob_skill_lists` VALUES ('',357,2348,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',357,2349,?);

-- Caturae
INSERT INTO `mob_skill_lists` VALUES ('',450,2310);
INSERT INTO `mob_skill_lists` VALUES ('',450,2311);
INSERT INTO `mob_skill_lists` VALUES ('',450,2312);
INSERT INTO `mob_skill_lists` VALUES ('',450,2313);
INSERT INTO `mob_skill_lists` VALUES ('',450,2314);
INSERT INTO `mob_skill_lists` VALUES ('',450,2315);
INSERT INTO `mob_skill_lists` VALUES ('',450,2316);
INSERT INTO `mob_skill_lists` VALUES ('',450,2317);
INSERT INTO `mob_skill_lists` VALUES ('',450,2378);
INSERT INTO `mob_skill_lists` VALUES ('',450,2379);
INSERT INTO `mob_skill_lists` VALUES ('',450,2381);
INSERT INTO `mob_skill_lists` VALUES ('',450,2436);
-- INSERT INTO `mob_skill_lists` VALUES ('',450,2444);
-- INSERT INTO `mob_skill_lists` VALUES ('',450,2380);

-- Amphipteres
INSERT INTO `mob_skill_lists` VALUES ('',6,2171);
INSERT INTO `mob_skill_lists` VALUES ('',6,2172);
INSERT INTO `mob_skill_lists` VALUES ('',6,2173);
INSERT INTO `mob_skill_lists` VALUES ('',6,2175);
INSERT INTO `mob_skill_lists` VALUES ('',6,2176);
INSERT INTO `mob_skill_lists` VALUES ('',6,2177);

-- INSERT INTO `mob_skill_lists` VALUES ('',2174,?);

-- Iron Giants
INSERT INTO `mob_skill_lists` VALUES ('',350,2363);
INSERT INTO `mob_skill_lists` VALUES ('',350,2364);
INSERT INTO `mob_skill_lists` VALUES ('',350,2365);
INSERT INTO `mob_skill_lists` VALUES ('',350,2366);
INSERT INTO `mob_skill_lists` VALUES ('',350,2367);
INSERT INTO `mob_skill_lists` VALUES ('',350,2368);
INSERT INTO `mob_skill_lists` VALUES ('',350,2369);
INSERT INTO `mob_skill_lists` VALUES ('',350,2370);
INSERT INTO `mob_skill_lists` VALUES ('',350,2371);
-- 1814 1815 1816 are melee attacks with additional effect

-- Mantids
INSERT INTO `mob_skill_lists` VALUES ('',340,2495);
INSERT INTO `mob_skill_lists` VALUES ('',340,2496);
INSERT INTO `mob_skill_lists` VALUES ('',340,2497);
INSERT INTO `mob_skill_lists` VALUES ('',340,2498);
INSERT INTO `mob_skill_lists` VALUES ('',340,2499);
INSERT INTO `mob_skill_lists` VALUES ('',340,2500);

-- INSERT INTO `mob_skill_lists` VALUES ('',2630,?);

-- Ruszors
INSERT INTO `mob_skill_lists` VALUES ('',211,2179);
INSERT INTO `mob_skill_lists` VALUES ('',211,2180);
INSERT INTO `mob_skill_lists` VALUES ('',211,2181);
INSERT INTO `mob_skill_lists` VALUES ('',211,2182);
INSERT INTO `mob_skill_lists` VALUES ('',211,2183);

-- INSERT INTO `mob_skill_lists` VALUES ('',2184,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',2185,?);

-- Gargouilles
INSERT INTO `mob_skill_lists` VALUES ('',118,2165);
INSERT INTO `mob_skill_lists` VALUES ('',118,2166);
INSERT INTO `mob_skill_lists` VALUES ('',118,2167);
INSERT INTO `mob_skill_lists` VALUES ('',118,2168);
INSERT INTO `mob_skill_lists` VALUES ('',118,2169);

-- INSERT INTO `mob_skill_lists` VALUES ('',2170,?);

-- Harpeia
INSERT INTO `mob_skill_lists` VALUES ('',471,2469);
INSERT INTO `mob_skill_lists` VALUES ('',471,2470);
INSERT INTO `mob_skill_lists` VALUES ('',471,2471);
INSERT INTO `mob_skill_lists` VALUES ('',471,2472);
INSERT INTO `mob_skill_lists` VALUES ('',471,2473);
INSERT INTO `mob_skill_lists` VALUES ('',471,2474);
-- INSERT INTO `mob_skill_lists` VALUES ('',471,2502);

-- Pteraketos
INSERT INTO `mob_skill_lists` VALUES ('',451,2620);
INSERT INTO `mob_skill_lists` VALUES ('',451,2619);
INSERT INTO `mob_skill_lists` VALUES ('',451,2618);
INSERT INTO `mob_skill_lists` VALUES ('',451,2617);
INSERT INTO `mob_skill_lists` VALUES ('',451,2616);
INSERT INTO `mob_skill_lists` VALUES ('',451,2615);
INSERT INTO `mob_skill_lists` VALUES ('',451,2614);
INSERT INTO `mob_skill_lists` VALUES ('',451,2613);
INSERT INTO `mob_skill_lists` VALUES ('',451,2612);

-- Naraka
INSERT INTO `mob_skill_lists` VALUES ('',472,2465);
INSERT INTO `mob_skill_lists` VALUES ('',472,2464);
INSERT INTO `mob_skill_lists` VALUES ('',472,2463);
INSERT INTO `mob_skill_lists` VALUES ('',472,2462);
INSERT INTO `mob_skill_lists` VALUES ('',472,2461);
INSERT INTO `mob_skill_lists` VALUES ('',472,2460);
INSERT INTO `mob_skill_lists` VALUES ('',472,2459);
INSERT INTO `mob_skill_lists` VALUES ('',472,2458);
-- INSERT INTO `mob_skill_lists` VALUES ('',472,2555,?);
-- INSERT INTO `mob_skill_lists` VALUES ('',472,2501,?);

-- Gallu
INSERT INTO `mob_skill_lists` VALUES ('',467,2528);
INSERT INTO `mob_skill_lists` VALUES ('',467,2529);
INSERT INTO `mob_skill_lists` VALUES ('',467,2530);
INSERT INTO `mob_skill_lists` VALUES ('',467,2531);
INSERT INTO `mob_skill_lists` VALUES ('',467,2532);
INSERT INTO `mob_skill_lists` VALUES ('',467,2533);
INSERT INTO `mob_skill_lists` VALUES ('',467,2534);

-- Shadow Lord (Fiat Lux)
INSERT INTO `mob_skill_lists` VALUES ('',466,2289);
INSERT INTO `mob_skill_lists` VALUES ('',466,2288);
INSERT INTO `mob_skill_lists` VALUES ('',466,2287);
INSERT INTO `mob_skill_lists` VALUES ('',466,2286);
INSERT INTO `mob_skill_lists` VALUES ('',466,2285);
INSERT INTO `mob_skill_lists` VALUES ('',466,2284);
INSERT INTO `mob_skill_lists` VALUES ('',466,2283);
INSERT INTO `mob_skill_lists` VALUES ('',466,2282);
INSERT INTO `mob_skill_lists` VALUES ('',466,2281);
INSERT INTO `mob_skill_lists` VALUES ('',466,2280);

-- Provenance Watcher (100-50% no wings,50-31 2 wings,<31 4 wings)
-- special melee 2049 2050 2051 2052 2053 2054 2055
INSERT INTO `mob_skill_lists` VALUES ('',462,2583);
INSERT INTO `mob_skill_lists` VALUES ('',462,2584);
INSERT INTO `mob_skill_lists` VALUES ('',462,2585);
INSERT INTO `mob_skill_lists` VALUES ('',462,2586);
INSERT INTO `mob_skill_lists` VALUES ('',462,2587);
INSERT INTO `mob_skill_lists` VALUES ('',462,2588);

-- special melee wing out 2062 2063 2064 2065 2066 2067 2068

INSERT INTO `mob_skill_lists` VALUES ('',462,2596);
INSERT INTO `mob_skill_lists` VALUES ('',462,2597);
INSERT INTO `mob_skill_lists` VALUES ('',462,2598);
INSERT INTO `mob_skill_lists` VALUES ('',462,2259);
INSERT INTO `mob_skill_lists` VALUES ('',462,2600);
INSERT INTO `mob_skill_lists` VALUES ('',462,2601);

-- HP <50%
INSERT INTO `mob_skill_lists` VALUES ('',462,2602);
INSERT INTO `mob_skill_lists` VALUES ('',462,2603);
-- HP <30%
INSERT INTO `mob_skill_lists` VALUES ('',462,2604);
INSERT INTO `mob_skill_lists` VALUES ('',462,2605);
-- SOA
-- Chapulli normal & nm

INSERT INTO `mob_skill_lists` VALUES ('',339,2689);
INSERT INTO `mob_skill_lists` VALUES ('',339,2690);
INSERT INTO `mob_skill_lists` VALUES ('',339,2691);
INSERT INTO `mob_skill_lists` VALUES ('',339,2692);
INSERT INTO `mob_skill_lists` VALUES ('',339,2693);

-- Yilbegan
INSERT INTO `mob_skill_lists` VALUES ('',470,2263);
INSERT INTO `mob_skill_lists` VALUES ('',470,2264);
INSERT INTO `mob_skill_lists` VALUES ('',470,2265);
INSERT INTO `mob_skill_lists` VALUES ('',470,2266);
INSERT INTO `mob_skill_lists` VALUES ('',470,2267);
INSERT INTO `mob_skill_lists` VALUES ('',470,2268);
INSERT INTO `mob_skill_lists` VALUES ('',470,2269);
INSERT INTO `mob_skill_lists` VALUES ('',470,2270);
INSERT INTO `mob_skill_lists` VALUES ('',470,2271);
INSERT INTO `mob_skill_lists` VALUES ('',470,2272);
INSERT INTO `mob_skill_lists` VALUES ('',470,2273);
INSERT INTO `mob_skill_lists` VALUES ('',470,2274);


-- CAIT SITH
INSERT INTO `mob_skill_lists` VALUES ('',60,2192);
INSERT INTO `mob_skill_lists` VALUES ('',60,2193);
INSERT INTO `mob_skill_lists` VALUES ('',60,2194);
INSERT INTO `mob_skill_lists` VALUES ('',60,2195);
INSERT INTO `mob_skill_lists` VALUES ('',60,2196);
INSERT INTO `mob_skill_lists` VALUES ('',60,2197);
INSERT INTO `mob_skill_lists` VALUES ('',60,2198);
INSERT INTO `mob_skill_lists` VALUES ('',60,2199);
INSERT INTO `mob_skill_lists` VALUES ('',60,2200);
INSERT INTO `mob_skill_lists` VALUES ('',60,2201);


-- Mumor

-- INSERT INTO `mob_skill_lists` VALUES ('',2643,???);
-- INSERT INTO `mob_skill_lists` VALUES ('',2644,???);
-- INSERT INTO `mob_skill_lists` VALUES ('',2645,???);
-- INSERT INTO `mob_skill_lists` VALUES ('',2646,???);
-- INSERT INTO `mob_skill_lists` VALUES ('',2647,???);
-- INSERT INTO `mob_skill_lists` VALUES ('',2648,???);


-- Riko Kupenreich
-- normal melee 1503 bomb toss
-- INSERT INTO `mob_skill_lists` VALUES ('',2209,???);
-- INSERT INTO `mob_skill_lists` VALUES ('',2210,???);
-- INSERT INTO `mob_skill_lists` VALUES ('',2211,???);

-- Moogle Henchman

-- INSERT INTO `mob_skill_lists` VALUES ('',2207,???);
-- INSERT INTO `mob_skill_lists` VALUES ('',2206,???);
-- INSERT INTO `mob_skill_lists` VALUES ('',2205,???);


-- Lilisette
INSERT INTO `mob_skill_lists` VALUES ('',484,2191);
INSERT INTO `mob_skill_lists` VALUES ('',484,2190);
INSERT INTO `mob_skill_lists` VALUES ('',484,2189);
INSERT INTO `mob_skill_lists` VALUES ('',484,2188);
INSERT INTO `mob_skill_lists` VALUES ('',484,2187);
INSERT INTO `mob_skill_lists` VALUES ('',484,2186);

-- Atomos
-- need right model?
-- INSERT INTO `mob_skill_lists` VALUES ('',2202,???);
-- INSERT INTO `mob_skill_lists` VALUES ('',2003,???);


-- SOA

-- Twitherym
INSERT INTO `mob_skill_lists` VALUES ('',338,2694);
INSERT INTO `mob_skill_lists` VALUES ('',338,2695);
INSERT INTO `mob_skill_lists` VALUES ('',338,2696);

-- Umbrils
INSERT INTO `mob_skill_lists` VALUES ('',468,2714);
INSERT INTO `mob_skill_lists` VALUES ('',468,2715);
INSERT INTO `mob_skill_lists` VALUES ('',468,2716);

-- Acuex
INSERT INTO `mob_skill_lists` VALUES ('',345,2718);
INSERT INTO `mob_skill_lists` VALUES ('',345,2719);
INSERT INTO `mob_skill_lists` VALUES ('',345,2720);

-- Maroliths
INSERT INTO `mob_skill_lists` VALUES ('',347,2671);
INSERT INTO `mob_skill_lists` VALUES ('',347,2672);
INSERT INTO `mob_skill_lists` VALUES ('',347,2673);
INSERT INTO `mob_skill_lists` VALUES ('',347,2674);

-- INSERT INTO `mob_skill_lists` VALUES ('',2675,?);

-- Craklaws
INSERT INTO `mob_skill_lists` VALUES ('',344,2701);
INSERT INTO `mob_skill_lists` VALUES ('',344,2702);
INSERT INTO `mob_skill_lists` VALUES ('',344,2703);
INSERT INTO `mob_skill_lists` VALUES ('',344,2704);
INSERT INTO `mob_skill_lists` VALUES ('',344,2705);

-- Raaz
INSERT INTO `mob_skill_lists` VALUES ('',458,2892);
INSERT INTO `mob_skill_lists` VALUES ('',458,2893);
INSERT INTO `mob_skill_lists` VALUES ('',458,2894);
INSERT INTO `mob_skill_lists` VALUES ('',458,2895);

-- Yztarg

-- melee special 2091 2092 2093

INSERT INTO `mob_skill_lists` VALUES ('',459,2666);
INSERT INTO `mob_skill_lists` VALUES ('',459,2667);
INSERT INTO `mob_skill_lists` VALUES ('',459,2668);
INSERT INTO `mob_skill_lists` VALUES ('',459,2669);
INSERT INTO `mob_skill_lists` VALUES ('',459,2670);

-- Matamata
-- melee special 2121,2122,2123 all aoe
INSERT INTO `mob_skill_lists` VALUES ('',348,2709);
INSERT INTO `mob_skill_lists` VALUES ('',348,2710);
INSERT INTO `mob_skill_lists` VALUES ('',348,2711);
INSERT INTO `mob_skill_lists` VALUES ('',348,2712);
INSERT INTO `mob_skill_lists` VALUES ('',348,2713);

-- Heartwing
INSERT INTO `mob_skill_lists` VALUES ('',343,2727);
INSERT INTO `mob_skill_lists` VALUES ('',343,2728);
INSERT INTO `mob_skill_lists` VALUES ('',343,2729);
INSERT INTO `mob_skill_lists` VALUES ('',343,2730);

-- Leafkin
INSERT INTO `mob_skill_lists` VALUES ('',455,2722);
INSERT INTO `mob_skill_lists` VALUES ('',455,2723);
INSERT INTO `mob_skill_lists` VALUES ('',455,2724);
INSERT INTO `mob_skill_lists` VALUES ('',455,2725);
INSERT INTO `mob_skill_lists` VALUES ('',455,2726);

-- Tulfaires
INSERT INTO `mob_skill_lists` VALUES ('',454,2807);
INSERT INTO `mob_skill_lists` VALUES ('',454,2808);
INSERT INTO `mob_skill_lists` VALUES ('',454,2809);
INSERT INTO `mob_skill_lists` VALUES ('',454,2810);

-- Velkk
INSERT INTO `mob_skill_lists` VALUES ('',342,2732);
INSERT INTO `mob_skill_lists` VALUES ('',342,2733);
INSERT INTO `mob_skill_lists` VALUES ('',342,2734);
INSERT INTO `mob_skill_lists` VALUES ('',342,2735);
INSERT INTO `mob_skill_lists` VALUES ('',342,2736);

-- Panopts
INSERT INTO `mob_skill_lists` VALUES ('',463,2774);
INSERT INTO `mob_skill_lists` VALUES ('',463,2775);
INSERT INTO `mob_skill_lists` VALUES ('',463,2776);
INSERT INTO `mob_skill_lists` VALUES ('',463,2777);

-- Snapweeds
INSERT INTO `mob_skill_lists` VALUES ('',464,2841);
INSERT INTO `mob_skill_lists` VALUES ('',464,2842);
INSERT INTO `mob_skill_lists` VALUES ('',464,2843);
INSERT INTO `mob_skill_lists` VALUES ('',464,2845);
INSERT INTO `mob_skill_lists` VALUES ('',464,2846);



-- Dullahan

INSERT INTO `mob_skill_lists` VALUES ('',447,2962);
INSERT INTO `mob_skill_lists` VALUES ('',447,2963);
INSERT INTO `mob_skill_lists` VALUES ('',447,2964);
INSERT INTO `mob_skill_lists` VALUES ('',447,2965);
-- 2303 probably nm dullahan move

-- Fluturini
INSERT INTO `mob_skill_lists` VALUES ('',448,2896);
INSERT INTO `mob_skill_lists` VALUES ('',448,2897);
INSERT INTO `mob_skill_lists` VALUES ('',448,2898);
INSERT INTO `mob_skill_lists` VALUES ('',448,2899);
INSERT INTO `mob_skill_lists` VALUES ('',448,2900);


-- -----------------------------------------------------------
-- Naakuals
-- -----------------------------------------------------------

-- Rockfins
-- 2193,2194,2195 special melee
INSERT INTO `mob_skill_lists` VALUES ('',452,2755);
INSERT INTO `mob_skill_lists` VALUES ('',452,2756);
INSERT INTO `mob_skill_lists` VALUES ('',452,2757);
INSERT INTO `mob_skill_lists` VALUES ('',452,2758);
INSERT INTO `mob_skill_lists` VALUES ('',452,2759);
INSERT INTO `mob_skill_lists` VALUES ('',452,2760);

-- Kumhau
-- melee special 2258 2259 2260
INSERT INTO `mob_skill_lists` VALUES ('',457,2881);
INSERT INTO `mob_skill_lists` VALUES ('',457,2882);
INSERT INTO `mob_skill_lists` VALUES ('',457,2883);
INSERT INTO `mob_skill_lists` VALUES ('',457,2884);
INSERT INTO `mob_skill_lists` VALUES ('',457,2885);
INSERT INTO `mob_skill_lists` VALUES ('',457,2886);

-- Colkhab
-- melee special 2133 / 2134 / 2135(aoe melee attack)
INSERT INTO `mob_skill_lists` VALUES ('',456,2746);
INSERT INTO `mob_skill_lists` VALUES ('',456,2747);
INSERT INTO `mob_skill_lists` VALUES ('',456,2748);
INSERT INTO `mob_skill_lists` VALUES ('',456,2749);
INSERT INTO `mob_skill_lists` VALUES ('',456,2750);
INSERT INTO `mob_skill_lists` VALUES ('',456,2751);

-- Achuka
-- special melee 2142 2143 2144
INSERT INTO `mob_skill_lists` VALUES ('',461,2764);
INSERT INTO `mob_skill_lists` VALUES ('',461,2765);
INSERT INTO `mob_skill_lists` VALUES ('',461,2766);
INSERT INTO `mob_skill_lists` VALUES ('',461,2767);
INSERT INTO `mob_skill_lists` VALUES ('',461,2768);
INSERT INTO `mob_skill_lists` VALUES ('',461,2769);
INSERT INTO `mob_skill_lists` VALUES ('',461,2770);

-- Hurkan
-- special melee 2214 2215 2216
INSERT INTO `mob_skill_lists` VALUES ('',460,2817);
INSERT INTO `mob_skill_lists` VALUES ('',460,2818);
INSERT INTO `mob_skill_lists` VALUES ('',460,2819);
INSERT INTO `mob_skill_lists` VALUES ('',460,2820);
INSERT INTO `mob_skill_lists` VALUES ('',460,2821);
INSERT INTO `mob_skill_lists` VALUES ('',460,2822);

-- Yumcax
-- special melee anims 2202 2203 2204
INSERT INTO `mob_skill_lists` VALUES ('',465,2801);
INSERT INTO `mob_skill_lists` VALUES ('',465,2802);
INSERT INTO `mob_skill_lists` VALUES ('',465,2803);
INSERT INTO `mob_skill_lists` VALUES ('',465,2804);
INSERT INTO `mob_skill_lists` VALUES ('',465,2805);
INSERT INTO `mob_skill_lists` VALUES ('',465,2806);

-- Arciela

-- INSERT INTO `mob_skill_lists` VALUES ('',486,2825);
-- INSERT INTO `mob_skill_lists` VALUES ('',486,2825);
-- INSERT INTO `mob_skill_lists` VALUES ('',486,2825);
-- INSERT INTO `mob_skill_lists` VALUES ('',486,2825);
-- INSERT INTO `mob_skill_lists` VALUES ('',486,2825);
-- INSERT INTO `mob_skill_lists` VALUES ('',486,2825);
-- INSERT INTO `mob_skill_lists` VALUES ('',486,2825);
-- INSERT INTO `mob_skill_lists` VALUES ('',486,2825);


-- Gramk-Droog Velkk Boss
-- special melee 2223 2224 2225
-- INSERT INTO `mob_skill_lists` VALUES ('',2825,???);
-- INSERT INTO `mob_skill_lists` VALUES ('',2826,???);
-- INSERT INTO `mob_skill_lists` VALUES ('',2827,???);
-- INSERT INTO `mob_skill_lists` VALUES ('',2828,???);
-- INSERT INTO `mob_skill_lists` VALUES ('',2829,???);
-- INSERT INTO `mob_skill_lists` VALUES ('',2831,???);


-- Xol (Balamor boss) -- animated model 0x0000460a not 0x0000ba06
-- melee ranged attack 2343 2344 2345 2346
INSERT INTO `mob_skill_lists` VALUES ('',490,3047);
INSERT INTO `mob_skill_lists` VALUES ('',490,3048);
INSERT INTO `mob_skill_lists` VALUES ('',490,3049);
INSERT INTO `mob_skill_lists` VALUES ('',490,3050);
INSERT INTO `mob_skill_lists` VALUES ('',490,3051);

-- Morimar/Noble Warrior animated model 0x00006f0a not 0x0000ba05
-- special melee 2332 2333 2334
INSERT INTO `mob_skill_lists` VALUES ('',491,2904);
INSERT INTO `mob_skill_lists` VALUES ('',491,2905);
INSERT INTO `mob_skill_lists` VALUES ('',491,2906);
INSERT INTO `mob_skill_lists` VALUES ('',491,2907);
INSERT INTO `mob_skill_lists` VALUES ('',491,2908);

-- Darrcuiln model 0x0000660a not cs one 0x0000b00a
-- special melee 2320 2321 2322
INSERT INTO `mob_skill_lists` VALUES ('',489,2912);
INSERT INTO `mob_skill_lists` VALUES ('',489,2913);
INSERT INTO `mob_skill_lists` VALUES ('',489,2914);
INSERT INTO `mob_skill_lists` VALUES ('',489,2915);
INSERT INTO `mob_skill_lists` VALUES ('',489,2916);

-- Ashrakk
-- melee 2369 2370 2371 2372
INSERT INTO `mob_skill_lists` VALUES ('',493,3107);
INSERT INTO `mob_skill_lists` VALUES ('',493,3108);
INSERT INTO `mob_skill_lists` VALUES ('',493,3109);
INSERT INTO `mob_skill_lists` VALUES ('',493,3110);
INSERT INTO `mob_skill_lists` VALUES ('',493,3111);
INSERT INTO `mob_skill_lists` VALUES ('',493,3112);


-- Xol
-- Dhokmak melee 2379 2380 2381
INSERT INTO `mob_skill_lists` VALUES ('',490,3116);
INSERT INTO `mob_skill_lists` VALUES ('',490,3117);
INSERT INTO `mob_skill_lists` VALUES ('',490,3118);
INSERT INTO `mob_skill_lists` VALUES ('',490,3119);
INSERT INTO `mob_skill_lists` VALUES ('',490,3120);

-- Theodor
-- Melee 2387 2388 2389
INSERT INTO `mob_skill_lists` VALUES ('',488,3124);
INSERT INTO `mob_skill_lists` VALUES ('',488,3125);
INSERT INTO `mob_skill_lists` VALUES ('',488,3126);
INSERT INTO `mob_skill_lists` VALUES ('',488,3127);
INSERT INTO `mob_skill_lists` VALUES ('',488,3128);
INSERT INTO `mob_skill_lists` VALUES ('',488,3129);


-- Hades V1
-- melee 2396 2397 2398
INSERT INTO `mob_skill_lists` VALUES ('',485,3133);
INSERT INTO `mob_skill_lists` VALUES ('',485,3134);
INSERT INTO `mob_skill_lists` VALUES ('',485,3135);
INSERT INTO `mob_skill_lists` VALUES ('',485,3136);
INSERT INTO `mob_skill_lists` VALUES ('',485,3137);
INSERT INTO `mob_skill_lists` VALUES ('',485,3138);

-- Hades V2
-- Melee 2405 2406 2407 2408
INSERT INTO `mob_skill_lists` VALUES ('',487,3143);
INSERT INTO `mob_skill_lists` VALUES ('',487,3144);
INSERT INTO `mob_skill_lists` VALUES ('',487,3145);
INSERT INTO `mob_skill_lists` VALUES ('',487,3146);
INSERT INTO `mob_skill_lists` VALUES ('',487,3147);
INSERT INTO `mob_skill_lists` VALUES ('',487,3148);
INSERT INTO `mob_skill_lists` VALUES ('',487,3149);
INSERT INTO `mob_skill_lists` VALUES ('',487,3150);
INSERT INTO `mob_skill_lists` VALUES ('',487,3151);
INSERT INTO `mob_skill_lists` VALUES ('',487,3152);
INSERT INTO `mob_skill_lists` VALUES ('',487,3153);
INSERT INTO `mob_skill_lists` VALUES ('',487,3154);

-- Static mobs unique attack
INSERT INTO `mob_skill_lists` VALUES ('',349,3000);

-- Alastor Antlion
INSERT INTO `mob_skill_lists` VALUES ('',357,21);
INSERT INTO `mob_skill_lists` VALUES ('',357,20);
INSERT INTO `mob_skill_lists` VALUES ('',357,19);
INSERT INTO `mob_skill_lists` VALUES ('',357,23);

-- Ix'Aern (MNK) and his minions
INSERT INTO `mob_skill_lists` VALUES ('',3,3155);
INSERT INTO `mob_skill_lists` VALUES ('',3,3156);
INSERT INTO `mob_skill_lists` VALUES ('',3,3157);

-- Sekhmet
INSERT INTO `mob_skill_lists` VALUES ('',494,3158);
INSERT INTO `mob_skill_lists` VALUES ('',494,3159);
INSERT INTO `mob_skill_lists` VALUES ('',494,3160);
