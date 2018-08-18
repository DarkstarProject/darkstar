-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- G�n�r� le : Sam 25 Juin 2011 � 10:09
-- Version du serveur: 6.0.0
-- Version de PHP: 5.2.9-2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de donn�es: `dspdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `pet_list`
--

DROP TABLE IF EXISTS `pet_list`;
CREATE TABLE IF NOT EXISTS `pet_list` (
  `petid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(15) NOT NULL,
  `poolid` int(10) unsigned NOT NULL DEFAULT '0',
  `minLevel` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `maxLevel` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `element` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`petid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Contenu de la table `pet_list`
--

INSERT INTO `pet_list` VALUES (0, 'FireSpirit', 5830, 1, 99, 0, 1);
INSERT INTO `pet_list` VALUES (1, 'IceSpirit', 5831, 1, 99, 0, 5);
INSERT INTO `pet_list` VALUES (2, 'AirSpirit', 5832, 1, 99, 0, 4);
INSERT INTO `pet_list` VALUES (3, 'EarthSpirit', 5833, 1, 99, 0, 2);
INSERT INTO `pet_list` VALUES (4, 'ThunderSpirit', 5834, 1, 99, 0, 6);
INSERT INTO `pet_list` VALUES (5, 'WaterSpirit', 5835, 1, 99, 0, 3);
INSERT INTO `pet_list` VALUES (6, 'LightSpirit', 5836, 1, 99, 0, 7);
INSERT INTO `pet_list` VALUES (7, 'DarkSpirit', 5837, 1, 99, 0, 8);
INSERT INTO `pet_list` VALUES (8, 'Carbuncle', 4588, 1, 99, 0, 7);
INSERT INTO `pet_list` VALUES (9, 'Fenrir', 4581, 1, 99, 0, 8);
INSERT INTO `pet_list` VALUES (10, 'Ifrit', 4582, 1, 99, 0, 1);
INSERT INTO `pet_list` VALUES (11, 'Titan', 4583, 1, 99, 0, 2);
INSERT INTO `pet_list` VALUES (12, 'Leviathan', 4584, 1, 99, 0, 3);
INSERT INTO `pet_list` VALUES (13, 'Garuda', 4585, 1, 99, 0, 4);
INSERT INTO `pet_list` VALUES (14, 'Shiva', 4586, 1, 99, 0, 5);
INSERT INTO `pet_list` VALUES (15, 'Ramuh', 4587, 1, 99, 0, 6);
INSERT INTO `pet_list` VALUES (16, 'Diabolos', 4590, 1, 99, 0, 8);
INSERT INTO `pet_list` VALUES (17, 'Alexander', 4589, 1, 99, 0, 7);
INSERT INTO `pet_list` VALUES (18, 'Odin', 4591, 1, 99, 0, 8);
INSERT INTO `pet_list` VALUES (19, 'Atomos', 1, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (20, 'CaitSith', 1, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (21, 'SheepFamiliar', 4598, 23, 35, 3600, 0);
INSERT INTO `pet_list` VALUES (22, 'HareFamiliar', 4641, 23, 35, 5400, 0);
INSERT INTO `pet_list` VALUES (23, 'CrabFamiliar', 4610, 23, 55, 1800, 0);
INSERT INTO `pet_list` VALUES (24, 'CourierCarrie', 4611, 23, 75, 1800, 0);
INSERT INTO `pet_list` VALUES (25, 'Homunculus', 4616, 23, 75, 3600, 0);
INSERT INTO `pet_list` VALUES (26, 'FlytrapFamiliar', 4619, 28, 40, 3600, 0);
INSERT INTO `pet_list` VALUES (27, 'TigerFamiliar', 4604, 28, 40, 3600, 0);
INSERT INTO `pet_list` VALUES (28, 'FlowerpotBill', 4602, 28, 40, 3600, 0);
INSERT INTO `pet_list` VALUES (29, 'EftFamiliar', 4621, 33, 45, 3600, 0);
INSERT INTO `pet_list` VALUES (30, 'LizardFamiliar', 4600, 33, 45, 3600, 0);
INSERT INTO `pet_list` VALUES (31, 'MayflyFamiliar', 4596, 33, 45, 3600, 0);
INSERT INTO `pet_list` VALUES (32, 'FunguarFamiliar', 4614, 33, 65, 3600, 0);
INSERT INTO `pet_list` VALUES (33, 'BeetleFamiliar', 4606, 38, 45, 3600, 0);
INSERT INTO `pet_list` VALUES (34, 'AntlionFamiliar', 4625, 38, 50, 3600, 0);
INSERT INTO `pet_list` VALUES (35, 'MiteFamiliar', 4623, 43, 55, 3600, 0);
INSERT INTO `pet_list` VALUES (36, 'LullabyMelodia', 4599, 43, 55, 3600, 0);
INSERT INTO `pet_list` VALUES (37, 'KeenearedSteffi', 4595, 43, 55, 5400, 0);
INSERT INTO `pet_list` VALUES (38, 'FlowerpotBen', 4603, 51, 63, 3600, 0);
INSERT INTO `pet_list` VALUES (39, 'SaberSiravarde', 4605, 51, 63, 3600, 0);
INSERT INTO `pet_list` VALUES (40, 'ColdbloodComo', 4601, 53, 65, 3600, 0);
INSERT INTO `pet_list` VALUES (41, 'ShellbusterOrob', 4597, 53, 65, 3600, 0);
INSERT INTO `pet_list` VALUES (42, 'VoraciousAudrey', 4620, 53, 75, 3600, 0);
INSERT INTO `pet_list` VALUES (43, 'AmbusherAllie', 4622, 58, 75, 3600, 0);
INSERT INTO `pet_list` VALUES (44, 'LifedrinkerLars', 4624, 63, 75, 3600, 0);
INSERT INTO `pet_list` VALUES (45, 'PanzerGalahad', 4607, 63, 75, 3600, 0);
INSERT INTO `pet_list` VALUES (46, 'ChopsueyChucky', 4626, 63, 85, 1800, 0);
INSERT INTO `pet_list` VALUES (47, 'AmigoSabotender', 4618, 75, 85, 1200, 0);
INSERT INTO `pet_list` VALUES (48, 'Wyvern', 5551, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (49, 'Crafty Clyvonne', 4608, 76, 90, 7200, 0);
INSERT INTO `pet_list` VALUES (50, 'Bloodclaw Shasr', 4609, 90, 99, 7200, 0);
INSERT INTO `pet_list` VALUES (51, 'Lucky Lulush', 4612, 76, 99, 7200, 0);
INSERT INTO `pet_list` VALUES (52, 'Fatso Fargann', 4613, 81, 99, 7200, 0);
INSERT INTO `pet_list` VALUES (53, 'Discreet Louise', 4615, 79, 99, 7200, 0);
INSERT INTO `pet_list` VALUES (54, 'Swift Sieghard', 4617, 86, 94, 7200, 0);
INSERT INTO `pet_list` VALUES (55, 'Dipper Yuly', 4627, 76, 99, 7200, 0);
INSERT INTO `pet_list` VALUES (56, 'Flowerpot Merle', 4628, 76, 99, 10800, 0);
INSERT INTO `pet_list` VALUES (57, 'Nursery Nazuna', 4629, 76, 86, 7200, 0);
INSERT INTO `pet_list` VALUES (58, 'Mailbuster Ceta', 4630, 85, 95, 7200, 0);
INSERT INTO `pet_list` VALUES (59, 'Audacious Anna', 4631, 85, 95, 7200, 0);
INSERT INTO `pet_list` VALUES (60, 'Presto Julio', 4632, 83, 93, 7200, 0);
INSERT INTO `pet_list` VALUES (61, 'Bugeyed Broncha', 4633, 90, 99, 7200, 0);
INSERT INTO `pet_list` VALUES (62, 'Gooey Gerard', 4634, 95, 99, 5400, 0);
INSERT INTO `pet_list` VALUES (63, 'Gorefang Hobs', 4635, 93, 99, 7200, 0);
INSERT INTO `pet_list` VALUES (64, 'Faithful Falcor', 4636, 86, 99, 5400, 0);
INSERT INTO `pet_list` VALUES (65, 'Crude Raphie', 4637, 96, 99, 5400, 0);
INSERT INTO `pet_list` VALUES (66, 'Dapper Mac', 4638, 76, 99, 7200, 0);
INSERT INTO `pet_list` VALUES (67, 'Slippery Silas', 4639, 23, 99, 1800, 0);
INSERT INTO `pet_list` VALUES (68, 'Turbid Toloi', 4640, 23, 99, 3600, 0);
INSERT INTO `pet_list` VALUES (69, 'HarlequinFrame', 5124, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (70, 'ValoredgeFrame', 5125, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (71, 'SharpshotFrame', 5126, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (72, 'StormwakerFrame', 5127, 1, 99, 0, 0);


-- Trusts
INSERT INTO `pet_list` VALUES (896,'shantotto', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (897,'naji', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (898,'kupipi', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (899,'excenmille', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (900,'ayame', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (901,'nanaa_mihgo', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (902,'curilla', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (903,'volker', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (904,'ajido-marujido', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (905,'trion', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (906,'zeid', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (907,'lion', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (908,'tenzen', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (909,'mihli_aliapoh', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (910,'valaineral', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (911,'joachim', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (912,'naja_salaheem', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (913,'prishe', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (914,'ulmia', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (915,'shikaree_z', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (916,'cherukiki', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (917,'iron_eater', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (918,'gessho', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (919,'gadalar', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (920,'rainemard', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (921,'ingrid', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (922,'lehko_habhoka', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (923,'nashmeira', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (924,'zazarg', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (925,'ovjang', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (926,'mnejing', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (927,'sakura', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (928,'luzaf', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (929,'najelith', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (930,'aldo', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (931,'moogle', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (932,'fablinix', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (933,'maat', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (934,'d_shantotto', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (935,'star_sibyl', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (936,'karaha-baruha', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (937,'cid', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (938,'gilgamesh', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (939,'areuhat', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (940,'semih_lafihna', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (941,'elivira', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (942,'noillurie', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (943,'lhu_mhakaracca', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (944,'ferreous_coffin', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (945,'lilisette', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (946,'mumor', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (947,'uka_totlihn', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (948,'klara', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (949,'romaa_mihgo', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (950,'kuyin_hathdenna', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (951,'rahal', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (952,'koru-moru', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (953,'pieuje_uc', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (954,'i_shield_uc', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (955,'apururu_uc', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (956,'jakoh_uc', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (957,'flaviria_uc', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (958,'babban', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (959,'abenzio', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (960,'rughadjeen', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (961,'kukki-chebukki', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (962,'margret', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (963,'chacharoon', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (964,'lhe_lhangavo', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (965,'arciela', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (966,'mayakov', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (967,'qultada', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (968,'adelheid', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (969,'amchuchu', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (970,'brygid', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (971,'mildaurion', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (972,'halver', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (973,'rongelouts', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (974,'leonoyne', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (975,'maximilian', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (976,'kayeel-payeel', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (977,'robel-akbel', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (978,'kupofried', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (979,'selh_teus', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (980,'yoran-oran_uc', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (981,'sylvie_uc', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (982,'abquhbah', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (983,'balamor', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (984,'august', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (985,'rosulatia', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (986,'teodor', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (987,'ullegore', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (988,'makki-chebukki', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (989,'king_of_hearts', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (990,'morimar', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (991,'darrcuiln', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (992,'aahm', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (993,'aaev', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (994,'aamr', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (995,'aatt', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (996,'aagk', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (997,'iroha', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (998,'ygnas', 7821, 1, 99, 0, 0);
-- Trust 999
-- Trust 1000
-- Trust 1001
-- Trust 1002
INSERT INTO `pet_list` VALUES (1003,'cornelia', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (1004,'excenmille_s', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (1005,'ayame_uc', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (1006,'maat_uc', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (1007,'aldo_uc', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (1008,'naja_uc', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (1009,'lion_ii', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (1010,'zeid_ii', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (1011,'prishe_ii', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (1012,'nashmeira_ii', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (1013,'lilisette_ii', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (1014,'tenzen_ii', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (1015,'mumor_ii', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (1016,'ingrid_ii', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (1017,'arciela_ii', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (1018,'iroha_ii', 7821, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (1019,'shantotto_ii', 7821, 1, 99, 0, 0);
-- Trust 1020
-- Trust 1021
-- Trust 1022
-- Trust 1023
