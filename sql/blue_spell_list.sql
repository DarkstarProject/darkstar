/*
MySQL Data Transfer
Source Host: localhost
Source Database: dspdb
Target Host: localhost
Target Database: dspdb
Date: 09/07/2014 21:33:45 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for blue_spell_list
-- ----------------------------
DROP TABLE IF EXISTS `blue_spell_list`;
CREATE TABLE `blue_spell_list` (
  `spellid` smallint(3) NOT NULL,
  `mob_skill_id` smallint(4) unsigned NOT NULL,
  `set_points` smallint(2) NOT NULL,
  `trait_category` smallint(2) NOT NULL,
  `trait_category_weight` smallint(2) NOT NULL,
  `primary_sc` smallint(2) NOT NULL,
  `secondary_sc` smallint(2) NOT NULL,
  PRIMARY KEY (`spellid`,`mob_skill_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------

INSERT INTO `blue_spell_list` VALUES ('513','1316','3','4','1','0','0'); -- Venom Shell
INSERT INTO `blue_spell_list` VALUES ('515','206','5','4','1','0','0'); -- Maelstrom
INSERT INTO `blue_spell_list` VALUES ('517','192','1','10','1','0','0'); -- Metallic Body
INSERT INTO `blue_spell_list` VALUES ('519','196','3','18','1','1','4'); -- Screwdriver
INSERT INTO `blue_spell_list` VALUES ('521','165','4','0','1','0','0'); -- MP Drainkiss
INSERT INTO `blue_spell_list` VALUES ('522','181','2','0','1','0','0'); -- Death Ray
INSERT INTO `blue_spell_list` VALUES ('524','170','2','0','1','0','0'); -- Sandspin
INSERT INTO `blue_spell_list` VALUES ('527','257','3','7','1','6','0'); -- Smite of Rage
INSERT INTO `blue_spell_list` VALUES ('529','427','2','7','1','3','0'); -- Bludgeon
INSERT INTO `blue_spell_list` VALUES ('530','313','4','0','1','0','0'); -- Refueling
INSERT INTO `blue_spell_list` VALUES ('531','420','3','13','1','0','0'); -- Ice Break
INSERT INTO `blue_spell_list` VALUES ('532','279','4','0','1','0','0'); -- Blitzstrahl
INSERT INTO `blue_spell_list` VALUES ('533','255','3','14','2','0','0'); -- Self-Destruct
INSERT INTO `blue_spell_list` VALUES ('534','267','4','10','1','0','0'); -- Mysterious Light
INSERT INTO `blue_spell_list` VALUES ('535','1390','1','14','1','0','0'); -- Cold Wave
INSERT INTO `blue_spell_list` VALUES ('536','210','1','4','1','0','0'); -- Poison Breath
INSERT INTO `blue_spell_list` VALUES ('537','233','2','14','1','0','0'); -- Stinking Gas
INSERT INTO `blue_spell_list` VALUES ('538','274','4','6','1','0','0'); -- Memento Mori
INSERT INTO `blue_spell_list` VALUES ('539','219','3','11','1','2','5'); -- Terror Touch
INSERT INTO `blue_spell_list` VALUES ('540','1522','4','8','1','4','6'); -- Spinal Cleave
INSERT INTO `blue_spell_list` VALUES ('541','229','2','0','1','0','0'); -- Blood Saber
INSERT INTO `blue_spell_list` VALUES ('542','177','2','0','1','0','0'); -- Digest
INSERT INTO `blue_spell_list` VALUES ('543','23','2','12','1','7','0'); -- Mandibular Bite
INSERT INTO `blue_spell_list` VALUES ('544','403','2','6','1','0','0'); -- Cursed Sphere
INSERT INTO `blue_spell_list` VALUES ('545','554','4','20','1','2','0'); -- Sickle Slash
INSERT INTO `blue_spell_list` VALUES ('547','90','1','0','1','0','0'); -- Cocoon
INSERT INTO `blue_spell_list` VALUES ('548','108','3','4','1','0','0'); -- Filamented Hold
INSERT INTO `blue_spell_list` VALUES ('549','79','1','5','1','0','0'); -- Pollen
INSERT INTO `blue_spell_list` VALUES ('551','82','1','12','1','5','0'); -- Power Attack
INSERT INTO `blue_spell_list` VALUES ('554','97','5','8','1','2','5'); -- Death Scissors
INSERT INTO `blue_spell_list` VALUES ('555','535','3','13','1','0','0'); -- Magnetite Cloud
INSERT INTO `blue_spell_list` VALUES ('557','293','4','6','1','0','0'); -- Eyes On Me
INSERT INTO `blue_spell_list` VALUES ('560','1455','3','16','1','7','0'); -- Frenetic Rip
INSERT INTO `blue_spell_list` VALUES ('561','245','3','14','2','0','0'); -- Frightful Roar
INSERT INTO `blue_spell_list` VALUES ('563','304','3','10','1','0','0'); -- Hecatomb Wave
INSERT INTO `blue_spell_list` VALUES ('564','389','4','15','1','8','0'); -- Body Slam
INSERT INTO `blue_spell_list` VALUES ('565','565','4','0','1','0','0'); -- Radiant Breath
INSERT INTO `blue_spell_list` VALUES ('567','366','2','0','1','1','0'); -- Helldive
INSERT INTO `blue_spell_list` VALUES ('569','139','4','9','1','8','0'); -- Jet Stream
INSERT INTO `blue_spell_list` VALUES ('570','138','2','0','1','0','0'); -- Blood Drain
INSERT INTO `blue_spell_list` VALUES ('572','154','1','6','1','0','0'); -- Sound Blast
INSERT INTO `blue_spell_list` VALUES ('573','1445','3','4','1','0','0'); -- Feather Tickle
INSERT INTO `blue_spell_list` VALUES ('574','146','2','19','1','0','0'); -- Feather Barrier
INSERT INTO `blue_spell_list` VALUES ('575','2572','4','0','1','0','0'); -- Jettatura
INSERT INTO `blue_spell_list` VALUES ('576','1457','3','5','1','0','0'); -- Yawn
INSERT INTO `blue_spell_list` VALUES ('577','1','2','3','1','6','0'); -- Foot Kick
INSERT INTO `blue_spell_list` VALUES ('578','67','3','5','1','0','0'); -- Wild Carrot
INSERT INTO `blue_spell_list` VALUES ('579','1451','4','14','3','0','0'); -- Voracious Trunk
INSERT INTO `blue_spell_list` VALUES ('581','31','4','2','1','0','0'); -- Healing Breeze
INSERT INTO `blue_spell_list` VALUES ('582','397','2','17','1','0','0'); -- Chaotic Eye
INSERT INTO `blue_spell_list` VALUES ('584','8','2','2','1','0','0'); -- Sheep Song
INSERT INTO `blue_spell_list` VALUES ('585','10','4','3','1','12','0'); -- Ram Charge
INSERT INTO `blue_spell_list` VALUES ('587','17','2','3','1','4','0'); -- Claw Cyclone
INSERT INTO `blue_spell_list` VALUES ('588','241','2','4','1','0','0'); -- Lowing
INSERT INTO `blue_spell_list` VALUES ('589','3839','5','16','1','1','8'); -- Dimensional Death
INSERT INTO `blue_spell_list` VALUES ('591','544','4','6','1','0','0'); -- Heat Breath
INSERT INTO `blue_spell_list` VALUES ('592','36','2','0','1','0','0'); -- Blank Gaze
INSERT INTO `blue_spell_list` VALUES ('593','39','3','5','1','0','0'); -- Magic Fruit
INSERT INTO `blue_spell_list` VALUES ('594','328','3','8','1','3','8'); -- Uppercut
INSERT INTO `blue_spell_list` VALUES ('595','66','5','1','1','0','0'); -- 1000 Needles
INSERT INTO `blue_spell_list` VALUES ('596','73','2','0','1','3','0'); -- Pinecone Bomb
INSERT INTO `blue_spell_list` VALUES ('597','431','2','1','1','5','0'); -- Sprout Smack
INSERT INTO `blue_spell_list` VALUES ('598','178','4','4','1','0','0'); -- Soporific
INSERT INTO `blue_spell_list` VALUES ('599','54','2','0','1','2','0'); -- Queasyshroom
INSERT INTO `blue_spell_list` VALUES ('603','46','3','1','1','1','0'); -- Wild Oats
INSERT INTO `blue_spell_list` VALUES ('604','63','5','22','1','0','0'); -- Bad Breath
INSERT INTO `blue_spell_list` VALUES ('605','260','3','0','1','0','0'); -- Geist Wall
INSERT INTO `blue_spell_list` VALUES ('606','130','2','4','1','0','0'); -- Awful Eye
INSERT INTO `blue_spell_list` VALUES ('608','121','3','17','1','0','0'); -- Frost Breath
INSERT INTO `blue_spell_list` VALUES ('610','116','4','0','1','0','0'); -- Infrasonics
INSERT INTO `blue_spell_list` VALUES ('611','1128','5','16','1','10','0'); -- Disseverment
INSERT INTO `blue_spell_list` VALUES ('612','1185','4','14','4','0','0'); -- Actinic Burst
INSERT INTO `blue_spell_list` VALUES ('613','1207','5','6','1','0','0'); -- Reactor Cool
INSERT INTO `blue_spell_list` VALUES ('614','1096','3','11','1','0','0'); -- Saline Coat
INSERT INTO `blue_spell_list` VALUES ('615','1102','5','14','4','0','0'); -- Plasma Charge
INSERT INTO `blue_spell_list` VALUES ('616','1110','5','8','1','0','0'); -- Temporal Shift
INSERT INTO `blue_spell_list` VALUES ('617','1191','3','11','1','9','0'); -- Vertical Cleave
INSERT INTO `blue_spell_list` VALUES ('618','382','2','0','1','0','0'); -- Blastbomb
INSERT INTO `blue_spell_list` VALUES ('620','353','3','8','1','8','0'); -- Battle Dance
INSERT INTO `blue_spell_list` VALUES ('621','1471','2','4','1','0','0'); -- Sandspray
INSERT INTO `blue_spell_list` VALUES ('622','409','2','11','1','7','0'); -- Grand Slam
INSERT INTO `blue_spell_list` VALUES ('623','356','3','0','1','8','0'); -- Head Butt
INSERT INTO `blue_spell_list` VALUES ('626','335','3','0','1','0','0'); -- Bomb Toss
INSERT INTO `blue_spell_list` VALUES ('628','825','3','15','1','8','0'); -- Frypan
INSERT INTO `blue_spell_list` VALUES ('629','104','3','15','1','0','0'); -- Flying Hip Press
INSERT INTO `blue_spell_list` VALUES ('631','521','3','9','1','5','0'); -- Hydro Shot
INSERT INTO `blue_spell_list` VALUES ('632','1488','3','0','1','0','0'); -- Diamondhide
INSERT INTO `blue_spell_list` VALUES ('633','1489','5','21','1','0','0'); -- Enervation
INSERT INTO `blue_spell_list` VALUES ('634','529','5','14','2','0','0'); -- Light of Penance
INSERT INTO `blue_spell_list` VALUES ('636','1478','4','4','1','0','0'); -- Warm-Up
INSERT INTO `blue_spell_list` VALUES ('637','1477','5','17','1','0','0'); -- Firespit
INSERT INTO `blue_spell_list` VALUES ('638','361','3','9','1','1','0'); -- Feather Storm
INSERT INTO `blue_spell_list` VALUES ('640','1515','4','20','1','5','0'); -- Tail Slap
INSERT INTO `blue_spell_list` VALUES ('641','1497','5','18','1','6','0'); -- Hysteric Barrage
-- INSERT INTO `blue_spell_list` VALUES ('641','1510','5','18','1','6','0'); -- Hysteric Barrage
INSERT INTO `blue_spell_list` VALUES ('642','1565','3','0','1','0','0'); -- Amplification
INSERT INTO `blue_spell_list` VALUES ('643','1562','3','0','1','11','0'); -- Cannonball
INSERT INTO `blue_spell_list` VALUES ('644','1707','4','4','1','0','0'); -- Mind Blast
INSERT INTO `blue_spell_list` VALUES ('645','1699','4','5','1','0','0'); -- Exuviation
INSERT INTO `blue_spell_list` VALUES ('646','1702','4','6','1','0','0'); -- Magic Hammer
INSERT INTO `blue_spell_list` VALUES ('647','1466','2','17','1','0','0'); -- Zephyr Mantle
INSERT INTO `blue_spell_list` VALUES ('648','1897','1','19','1','0','0'); -- Regurgitation
INSERT INTO `blue_spell_list` VALUES ('650','1907','2','1','1','0','0'); -- Seedspray
INSERT INTO `blue_spell_list` VALUES ('651','1929','4','4','1','0','0'); -- Corrosive Ooze
INSERT INTO `blue_spell_list` VALUES ('652','1925','3','12','1','0','0'); -- Spiral Spin
INSERT INTO `blue_spell_list` VALUES ('653','1920','2','21','1','0','0'); -- Asuran Claws
INSERT INTO `blue_spell_list` VALUES ('654','2180','4','22','1','0','0'); -- Sub-Zero Smash
INSERT INTO `blue_spell_list` VALUES ('655','2167','3','0','1','0','0'); -- Triumphant Roar
INSERT INTO `blue_spell_list` VALUES ('656','2306','3','24','1','0','0'); -- Acrid Stream
INSERT INTO `blue_spell_list` VALUES ('657','2308','3','25','1','0','0'); -- Blazing Bound
INSERT INTO `blue_spell_list` VALUES ('658','1917','4','0','1','0','0'); -- Plenilune Embrace
INSERT INTO `blue_spell_list` VALUES ('658','1918','4','0','1','0','0'); -- Plenilune Embrace
INSERT INTO `blue_spell_list` VALUES ('659','1845','4','24','1','0','0'); -- Demoralizing Roar
INSERT INTO `blue_spell_list` VALUES ('660','1905','3','27','1','0','0'); -- Cimicine Discharge
INSERT INTO `blue_spell_list` VALUES ('661','1526','5','25','1','0','0'); -- Animating Wail
INSERT INTO `blue_spell_list` VALUES ('662','269','3','0','1','0','0'); -- Battery Charge
INSERT INTO `blue_spell_list` VALUES ('663','75','4','27','1','0','0'); -- Leafstorm
INSERT INTO `blue_spell_list` VALUES ('664','205','2','0','1','0','0'); -- Regeneration
INSERT INTO `blue_spell_list` VALUES ('665','80','1','26','1','0','0'); -- Final Sting
INSERT INTO `blue_spell_list` VALUES ('666','334','3','23','1','0','0'); -- Goblin Rush
INSERT INTO `blue_spell_list` VALUES ('667','132','2','16','1','0','0'); -- Vanity Dive
INSERT INTO `blue_spell_list` VALUES ('668','299','3','10','1','0','0'); -- Magic Barrier
INSERT INTO `blue_spell_list` VALUES ('669','258','2','26','1','0','0'); -- Whirl of Rage
INSERT INTO `blue_spell_list` VALUES ('670','2373','4','23','1','0','0'); -- Benthic Typhoon
INSERT INTO `blue_spell_list` VALUES ('671','964','4','22','1','0','0'); -- Auroral Drape
INSERT INTO `blue_spell_list` VALUES ('672','2375','5','13','1','0','0'); -- Osmosis
INSERT INTO `blue_spell_list` VALUES ('673','485','4','25','1','10','0'); -- Quadratic Continuum
INSERT INTO `blue_spell_list` VALUES ('674','324','1','20','1','0','0'); -- Fantod
INSERT INTO `blue_spell_list` VALUES ('675','1561','3','8','1','0','0'); -- Thermal Pulse
INSERT INTO `blue_spell_list` VALUES ('677','974','3','24','1','0','0'); -- Empty Thrash
INSERT INTO `blue_spell_list` VALUES ('678','45','3','6','1','0','0'); -- Dream Flower
INSERT INTO `blue_spell_list` VALUES ('679','999','3','18','1','0','0'); -- Occultation
INSERT INTO `blue_spell_list` VALUES ('680','227','4','28','1','0','0'); -- Charged Whisker
INSERT INTO `blue_spell_list` VALUES ('681','989','5','14','4','0','0'); -- Winds of Promyvion
INSERT INTO `blue_spell_list` VALUES ('682','1898','2','25','1','3','6'); -- Delta Thrust
INSERT INTO `blue_spell_list` VALUES ('683','664','4','28','1','0','0'); -- Everyones Grudge
INSERT INTO `blue_spell_list` VALUES ('684','2175','4','27','1','0','0'); -- Reaving Wind
INSERT INTO `blue_spell_list` VALUES ('685','1447','3','15','1','0','0'); -- Barrier Tusk
INSERT INTO `blue_spell_list` VALUES ('686','246','4','25','1','0','0'); -- Mortal Ray
INSERT INTO `blue_spell_list` VALUES ('687','1703','2','17','1','0','0'); -- Water Bomb
INSERT INTO `blue_spell_list` VALUES ('688','419','2','24','1','0','0'); -- Heavy Strike
INSERT INTO `blue_spell_list` VALUES ('689','2165','3','21','1','0','0'); -- Dark Orb
INSERT INTO `blue_spell_list` VALUES ('690','1468','5','2','1','0','0'); -- White Wind
INSERT INTO `blue_spell_list` VALUES ('692','1922','4','20','1','6','0'); -- Sudden Lunge
INSERT INTO `blue_spell_list` VALUES ('693','893','5','23','1','3','0'); -- Quadrastrike
INSERT INTO `blue_spell_list` VALUES ('694','1098','3','10','1','0','0'); -- Vapor Spray
INSERT INTO `blue_spell_list` VALUES ('695','564','4','15','1','0','0'); -- Thunder Breath
INSERT INTO `blue_spell_list` VALUES ('696','1945','5','21','1','0','0'); -- Orcish Counterstance
INSERT INTO `blue_spell_list` VALUES ('697','1568','4','28','1','2','0'); -- Amorphic Spikes
INSERT INTO `blue_spell_list` VALUES ('698','388','2','22','1','0','0'); -- Wind breath
INSERT INTO `blue_spell_list` VALUES ('699','3837','2','25','1','2','0'); -- Barbed Crescent
-- INSERT INTO `blue_spell_list` VALUES ('700','2689','6','16','8','0','0'); -- Nature's Meditation
-- INSERT INTO `blue_spell_list` VALUES ('701','2694','6','18','8','0','0'); -- Tempestuous Upheaval
-- INSERT INTO `blue_spell_list` VALUES ('702','2702','6','13','8','0','0'); -- Rending Deluge
-- INSERT INTO `blue_spell_list` VALUES ('703','2711','6','8','8','0','0'); -- Embalming Earth
-- INSERT INTO `blue_spell_list` VALUES ('704','2714','6','23','8','3','0'); -- Paralyzing Triad
-- INSERT INTO `blue_spell_list` VALUES ('705','2718','4','29','8','0','0'); -- Foul Waters
-- INSERT INTO `blue_spell_list` VALUES ('706','2732','2','15','8','12','0'); -- Glutinous Dart
-- INSERT INTO `blue_spell_list` VALUES ('707','2774','5','17','8','0','0'); -- Retinal Glare
-- INSERT INTO `blue_spell_list` VALUES ('708','2674','6','24','8','0','0'); -- Subduction
-- INSERT INTO `blue_spell_list` VALUES ('709','0','7','24','3','0','0'); -- Thrashing Assault
-- INSERT INTO `blue_spell_list` VALUES ('710','1696','4','17','2','0','0'); -- Erratic Flutter
-- INSERT INTO `blue_spell_list` VALUES ('711','0','0','0','0','0','0'); -- Restoral
-- INSERT INTO `blue_spell_list` VALUES ('712','0','0','0','0','0','0'); -- Rail Cannon
-- INSERT INTO `blue_spell_list` VALUES ('713','1798','0','0','0','0','0'); -- Diffusion Ray
-- INSERT INTO `blue_spell_list` VALUES ('714','1817','0','0','0','0','0'); -- Sinker Drill
INSERT INTO `blue_spell_list` VALUES ('736','373','0','0','0','0','0'); -- Thunderbolt
INSERT INTO `blue_spell_list` VALUES ('737','551','0','0','0','0','0'); -- Harden Shell
INSERT INTO `blue_spell_list` VALUES ('738','1049','0','0','0','0','0'); -- Absolute Terror
INSERT INTO `blue_spell_list` VALUES ('739','1534','0','0','0','0','0'); -- Gates of Hades
INSERT INTO `blue_spell_list` VALUES ('740','1768','0','0','0','11','0'); -- Tourbillion
INSERT INTO `blue_spell_list` VALUES ('741','1575','0','0','0','0','0'); -- Pyric Bulwark
INSERT INTO `blue_spell_list` VALUES ('742','1862','0','0','0','11','0'); -- Bilgestorm
INSERT INTO `blue_spell_list` VALUES ('743','1850','0','0','0','10','0'); -- Bloodrake
INSERT INTO `blue_spell_list` VALUES ('744','2749','0','0','0','0','0'); -- Droning Whirlwind
INSERT INTO `blue_spell_list` VALUES ('745','2758','0','0','0','0','0'); -- Carcharian Verve
INSERT INTO `blue_spell_list` VALUES ('746','2764','0','0','0','0','0'); -- Blistering Roar
