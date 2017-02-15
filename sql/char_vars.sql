-- MySQL dump 10.13  Distrib 5.6.35, for Win64 (x86_64)
--
-- Host: localhost    Database: dspdb
-- ------------------------------------------------------
-- Server version	5.6.35-log

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
-- Table structure for table `char_vars`
--

DROP TABLE IF EXISTS `char_vars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_vars` (
  `charid` int(10) unsigned NOT NULL,
  `varname` varchar(30) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`charid`,`varname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `char_vars`
--

LOCK TABLES `char_vars` WRITE;
/*!40000 ALTER TABLE `char_vars` DISABLE KEYS */;
INSERT INTO `char_vars` VALUES (21828,'supplyQuest_started',456130),(21828,'Dynamis_Status',128),(21828,'supplyQuest_fresh',1483887600),(21828,'dynaWaitxDay',1483887600),(21828,'GodMode',1),(21829,'HpTeleportMask1b',2080),(21830,'MoghouseExplication',1),(21829,'HpTeleportMask1a',385),(21829,'HpTeleportMask3a',1024),(21829,'bcnm_instanceid',1),(21829,'saveMySisterVar',1),(21829,'GodMode',1),(21829,'Cosmo_Cleanse_TIME',1484113503),(21829,'HpTeleportMask4b',136),(21831,'MoghouseExplication',1),(21831,'PlayerMainJob',3),(21829,'[205]Treasure_Coffer',1484189529),(21829,'[151]Treasure_Coffer',1484189961),(21829,'OptionalCSforOMW',1),(21829,'[B7-2]Werei',1),(21829,'OptionalcsCornelia',1),(21829,'BASTOK92',1),(21832,'HpTeleportMask1b',133),(21837,'fov_numkilled1',4),(21834,'MoghouseExplication',1),(21829,'HpTeleportMask2a',64),(21832,'HpTeleportMask3a',1024),(21832,'trade_itemid',1130),(21832,'HpTeleportMask4b',6),(21835,'HpTeleportMask2b',2522),(21837,'fov_numneeded1',7),(21829,'1stTimeAyssea',1),(21835,'HpTeleportMask1b',32692),(21835,'fov_numneeded1',4),(21835,'HpTeleportMask1a',27017),(21842,'bcnm_instanceid',1),(21836,'fov_repeat',1),(21836,'fov_numneeded1',4),(21837,'fov_LastReward',456844),(21837,'CONQUEST_RING_TIMER',1484578800),(21836,'HpTeleportMask1b',12084),(21836,'HpTeleportMask2b',2514),(21836,'fov_LastReward',456646),(21835,'fov_LastReward',456824),(21835,'HpTeleportMask4b',4176),(21837,'HpTeleportMask1b',11798),(21835,'CONQUEST_RING_TIMER',1485183600),(21836,'CONQUEST_RING_TIMER',1484578800),(21832,'dynaWaitxDay',1486306800),(21832,'HpTeleportMask2b',64),(21838,'HpTeleportMask1b',136),(21832,'trade_bcnmid',79),(21832,'bcnm_instanceid',1),(21837,'HpTeleportMask2b',2167),(21839,'MoghouseExplication',1),(21841,'Guild_Member',192),(21841,'CONQUEST_RING_TIMER',1485183600),(21829,'dynaWaitxDay',1484492400),(21829,'Abyssea_Time',7200),(21832,'HpTeleportMask1a',16384),(21832,'GodMode',1),(21839,'HpTeleportMask1b',352),(21829,'option',2),(21837,'HpTeleportMask1a',43393),(21835,'MissionStatus',1),(21840,'MoghouseExplication',1),(21835,'MetGreenMagianMog',1),(21835,'ChocoboOnTheLoose',1),(21841,'fov_repeat',1),(21836,'ChocoboOnTheLoose',1),(21837,'PlayerMainJob',2),(21841,'fov_numneeded1',11),(21837,'fov_numkilled2',1),(21835,'COP1',1),(21844,'HpTeleportMask4b',4),(21841,'fov_LastReward',456492),(21844,'COP1',1),(21835,'PromathiaStatus',3),(21836,'CONQUEST_RING_RECHARGE',1485183600),(21837,'CONQUEST_RING_RECHARGE',1485183600),(21836,'HpTeleportMask1a',8193),(21837,'COP1',1),(21837,'HpTeleportMask4b',4210),(21836,'COP1',1),(21841,'HpTeleportMask1b',4097),(21835,'CONQUEST_RING_RECHARGE',1486393200),(21845,'MoghouseExplication',1),(21835,'HpTeleportMask4a',896),(21835,'[213]Treasure_Chest',1485045889),(21841,'HpTeleportMask2b',2082),(21832,'SSG_SilverDoor',1),(21829,'miniQuestForORB_CS',99),(21835,'bcnm_instanceid',1),(21836,'HpTeleportMask4b',4224),(21835,'maatsCap',32),(21845,'fov_repeat',1),(21841,'fov_regimeid',144),(21841,'HpTeleportMask1a',8192),(21845,'HpTeleportMask1a',41016),(21835,'fov_numneeded2',3),(21842,'MoghouseExplication',1),(21842,'HpTeleportMask1b',11263),(21842,'THE_ROAD_TO_AHT_URHGAN_Year',1268),(21842,'fov_repeat',1),(21842,'fov_numneeded1',3),(21842,'CONQUEST_RING_TIMER',1486393200),(21842,'fov_LastReward',456852),(21842,'Telmoda_Madaline_Event',1),(21842,'HpTeleportMask1a',60847),(21842,'I_CAN_HEAR_A_RAINBOW',127),(21842,'HpTeleportMask2b',4091),(21842,'ChocoboOnTheLoose',1),(21842,'SaveMySon_Event',2),(21842,'HpTeleportMask4a',68),(21842,'ChaosbringerKills',102),(21842,'COP1',1),(21837,'bcnm_instanceid',1),(21836,'bcnm_instanceid',1),(21835,'trade_bcnmid',96),(21836,'maatsCap',4),(21835,'Guild_Member',76),(21837,'maatsCap',2),(21835,'Dynamis_Status',128),(21842,'HpTeleportMask4b',5307),(21836,'HpTeleportMask3b',1),(21842,'deliveringTheGoodsCS',1),(21842,'paintbrushOfSouls_book',2),(21835,'[GUILD]currentGuild',3),(21843,'MoghouseExplication',1),(21842,'PromathiaStatus',1),(21829,'COP1',1),(21835,'HpTeleportMask3b',1027),(21842,'HpTeleportMask3b',1026),(21843,'HpTeleportMask1a',4),(21842,'Guild_Member',16),(21842,'illTakeTheBigBoxCS',4),(21843,'Guild_Member',16),(21843,'HpTeleportMask1b',120),(21844,'HpTeleportMask2b',2175),(21829,'HpTeleportMask4a',256),(21844,'CONQUEST_RING_TIMER',1485702000),(21844,'fov_numneeded2',5),(21844,'HpTeleportMask1b',511),(21844,'fov_repeat',1),(21844,'fov_numneeded1',3),(21842,'THE_ROAD_TO_AHT_URHGAN_Day',147),(21842,'StoneYouNeed',1),(21844,'fov_LastReward',456826),(21842,'THE_ROAD_TO_AHT_URHGAN',4),(21845,'fov_regimeid',679),(21844,'ChocoboOnTheLoose',1),(21836,'fov_numneeded2',3),(21835,'fov_regimeid',720),(21835,'LAST_IMPERIAL_TAG',28),(21835,'AhtUrganStatus',1),(21835,'walahraCoinCount',1),(21836,'walahraCoinCount',78),(21842,'walahraCoinCount',89),(21842,'maatsCap',4096),(21835,'HpTeleportMask2a',32768),(21836,'HpTeleportMask4a',768),(21837,'HpTeleportMask3b',129),(21829,'FOMOR_HATE',38),(21837,'Guild_Member',8),(21844,'fov_regimeid',69),(21836,'FOMOR_HATE',38),(21842,'fov_regimeid',735),(21837,'FOMOR_HATE',38),(21835,'FOMOR_HATE',38),(21837,'HpTeleportMask4a',896),(21845,'fov_numneeded1',6),(21842,'EVERYONES_GRUDGE_KILLS',15),(21836,'MissionStatus',1),(21841,'HpTeleportMask2a',32768),(21844,'[GUILD]currentGuild',2),(21845,'fov_LastReward',456728),(21845,'HpTeleportMask1b',39),(21845,'fov_numkilled1',1),(21845,'HpTeleportMask4b',20),(21842,'fov_numneeded2',3),(21845,'CONQUEST_RING_TIMER',1486393200),(21845,'HpTeleportMask2b',2175),(21842,'HpTeleportMask3a',63488),(21835,'fov_repeat',1),(21845,'ChocoboOnTheLoose',4),(21842,'CONQUEST_RING_RECHARGE',1486393200),(21842,'BCNM_Killed',1),(21844,'Guild_Member',512),(21845,'Guild_Member',80),(21845,'HpTeleportMask4a',64),(21835,'PlayerMainJob',4),(21844,'OptionalCSforSTC',1),(21829,'EVERYONES_GRUDGE_KILLS',4),(21829,'HpTeleportMask3b',1024),(21841,'trade_itemid',1430),(21841,'trade_bcnmid',70),(21844,'bcnm_instanceid',1),(21841,'bcnm_instanceid',1),(21837,'fov_regimeid',43),(21837,'walahraCoinCount',189),(21842,'AnEmptyVesselProgress',4),(21841,'dynaWaitxDay',1486306800),(21841,'maatsCap',16),(21835,'EVERYONES_GRUDGE_KILLS',8),(21837,'fov_repeat',1),(21837,'fov_numneeded2',3),(21829,'MissionStatus',9),(21845,'[GUILD]currentGuild',9),(21836,'PlayerMainJob',3);
/*!40000 ALTER TABLE `char_vars` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-06  2:07:32
