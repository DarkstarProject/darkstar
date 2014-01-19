/*
MySQL Data Transfer
Source Host: localhost
Source Database: dspdb
Target Host: localhost
Target Database: dspdb
Date: 1/28/2013 6:30:40 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for blue_spell_mods
-- ----------------------------
DROP TABLE IF EXISTS `blue_spell_mods`;
CREATE TABLE `blue_spell_mods` (
  `spellId` smallint(3) unsigned NOT NULL,
  `modid` smallint(5) unsigned NOT NULL,
  `value` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`spellId`,`modid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Venom Shell
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('513', '13', '2'); -- MND+2

-- ----------------------------
-- Maelstrom
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('515', '13', '2'); -- MND+2

-- ----------------------------
-- Metallic Body
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('517', '0', '0'); -- No Stats

-- ----------------------------
-- Screwdriver
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('519', '10', '1'); -- VIT+1
INSERT INTO `blue_spell_mods` VALUES ('519', '14', '1'); -- CHR+1
INSERT INTO `blue_spell_mods` VALUES ('519', '2', '10'); -- HP+10

-- ----------------------------
-- MP Drainkiss
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('521', '5', '5'); -- MP+5

-- ----------------------------
-- Death Ray
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('522', '2', '-5'); -- HP-5
INSERT INTO `blue_spell_mods` VALUES ('522', '5', '5'); -- MP+5

-- ----------------------------
-- Sandspin
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('524', '10', '1'); -- VIT+1

-- ----------------------------
-- Smite Of Rage
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('527', '11', '3'); -- AGI+3

-- ----------------------------
-- Bludgeon 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('529', '8', '1'); -- STR+1

-- ----------------------------
-- Refueling 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('530', '11', '2'); -- AGI+2

-- ----------------------------
-- Ice Break
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('531', '12', '1'); -- INT+1

-- ----------------------------
-- Blitzstrahl
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('532', '9', '3'); -- DEX+3

-- ----------------------------
-- Self-Destruct
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('533', '8', '2'); -- STR+2

-- ----------------------------
-- Mysterious Light
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('534', '11', '3'); -- AGI+3

-- ----------------------------
-- Cold Wave
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('535', '12', '-1'); -- INT-1

-- ----------------------------
-- Poison Breath
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('536', '13', '1'); -- MND+1

-- ----------------------------
-- Stinking Gas
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('537', '11', '1'); -- AGI+1

-- ----------------------------
-- Memento Mori
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('538', '12', '1'); -- INT+1

-- ----------------------------
-- Terror Touch
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('539', '2', '-5'); -- HP-5
INSERT INTO `blue_spell_mods` VALUES ('539', '5', '10'); -- MP+10

-- ----------------------------
-- Spinal Cleave
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('540', '10', '2'); -- VIT+2
INSERT INTO `blue_spell_mods` VALUES ('540', '12', '1'); -- INT+1
INSERT INTO `blue_spell_mods` VALUES ('540', '13', '1'); -- MND+1

-- ----------------------------
-- Blood Saber
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('541', '2', '-5'); -- HP-5
INSERT INTO `blue_spell_mods` VALUES ('541', '5', '5'); -- MP+5

-- ----------------------------
-- Digest
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('542', '2', '-5'); -- HP-5
INSERT INTO `blue_spell_mods` VALUES ('542', '5', '5'); -- MP+5

-- ----------------------------
-- Mandibular Bite
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('543', '12', '1'); -- INT+1

-- ----------------------------
-- Cursed Sphere
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('544', '13', '1'); -- MND+1

-- ----------------------------
-- Sickle Slash
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('545', '2', '-5'); -- HP+5
INSERT INTO `blue_spell_mods` VALUES ('545', '5', '15'); -- MP+15

-- ----------------------------
-- Cocoon 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('547', '10', '3'); -- VIT+3

-- ----------------------------
-- Filamented Hold
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('548', '10', '1'); -- VIT+1

-- ----------------------------
-- Pollen
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('549', '2', '5'); -- HP+5
INSERT INTO `blue_spell_mods` VALUES ('549', '14', '1'); -- CHR+1

-- ----------------------------
-- Power Attack
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('551', '13', '1'); -- MND+1

-- ----------------------------
-- Death Scissors
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('554', '13', '2'); -- MND+2
INSERT INTO `blue_spell_mods` VALUES ('554', '14', '2'); -- CHR+2
INSERT INTO `blue_spell_mods` VALUES ('554', '2', '5'); -- HP+5

-- ----------------------------
-- Magnetite Cloud
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('555', '10', '2'); -- VIT+2

-- ----------------------------
-- Eyes On Me
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('557', '2', '-5'); -- HP-5
INSERT INTO `blue_spell_mods` VALUES ('557', '5', '15'); -- MP+15

-- ----------------------------
-- Frenetic Rip
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('560', '12', '1'); -- INT+1

-- ----------------------------
-- Frightful Roar
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('561', '11', '2'); -- AGI+2

-- ----------------------------
-- Hecatomb Wave
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('563', '11', '1'); -- AGI+1

-- ----------------------------
-- Body Slam
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('564', '10', '1'); -- VIT+1
INSERT INTO `blue_spell_mods` VALUES ('564', '5', '5'); -- MP+5

-- ----------------------------
-- Radiant Breath
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('565', '2', '5'); -- HP+5
INSERT INTO `blue_spell_mods` VALUES ('565', '14', '1'); -- CHR+1

-- ----------------------------
-- Helldive
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('567', '14', '1'); -- CHR+1
INSERT INTO `blue_spell_mods` VALUES ('567', '2', '5'); -- HP+5

-- ----------------------------
-- Jet Stream
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('569', '9', '2'); -- DEX+2

-- ----------------------------
-- Blood Drain
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('570', '2', '-5'); -- HP-5
INSERT INTO `blue_spell_mods` VALUES ('570', '5', '5'); -- MP+5

-- ----------------------------
-- Sound Blast
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('572', '0', '0'); -- No Stats

-- ----------------------------
-- Feather Tickle
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('573', '11', '1'); -- AGI+1

-- ----------------------------
-- Feather Barrier
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('574', '0', '0'); -- No Stats

-- ----------------------------
-- Jettatura
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('575', '5', '15'); -- MP+15

-- ----------------------------
-- Yawn
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('576', '2', '5'); -- HP+5
INSERT INTO `blue_spell_mods` VALUES ('576', '14', '1'); -- CHR+1

-- ----------------------------
-- Foot Kick
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('577', '11', '1'); -- AGI+1

-- ----------------------------
-- Wild Carrot
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('578', '2', '5'); -- HP+5

-- ----------------------------
-- Voracious Trunk
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('579', '11', '2'); -- AGI+2

-- ----------------------------
-- Healing Breeze
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('581', '2', '10'); -- HP+10
INSERT INTO `blue_spell_mods` VALUES ('581', '14', '1'); -- CHR+2

-- ----------------------------
-- Chaotic Eye
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('582', '11', '1'); -- AGI+1

-- ----------------------------
-- Sheep Song
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('584', '2', '5'); -- HP+5
INSERT INTO `blue_spell_mods` VALUES ('584', '14', '1'); -- CHR+1

-- ----------------------------
-- Ram Charge
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('585', '2', '5'); -- HP+5

-- ----------------------------
-- Claw Cyclone
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('587', '10', '1'); -- VIT+1

-- ----------------------------
-- Lowing
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('588', '2', '-5'); -- HP-5

-- ----------------------------
-- Dimensional Death
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('589', '9', '1'); -- DEX+1
INSERT INTO `blue_spell_mods` VALUES ('589', '14', '1'); -- CHR+1
INSERT INTO `blue_spell_mods` VALUES ('589', '2', '5'); -- HP+5

-- ----------------------------
-- Heat Breath
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('591', '8', '3'); -- STR+3

-- ----------------------------
-- Blank Gaze
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('592', '0', '0'); -- No Stats

-- ----------------------------
-- Magic Fruit
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('593', '14', '1'); -- CHR+1
INSERT INTO `blue_spell_mods` VALUES ('593', '2', '5'); -- HP+5

-- ----------------------------
-- Uppercut
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('594', '8', '2'); -- STR+2
INSERT INTO `blue_spell_mods` VALUES ('594', '9', '1'); -- DEX+1

-- ----------------------------
-- 1000 Needles
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('595', '10', '3'); -- VIT+3
INSERT INTO `blue_spell_mods` VALUES ('595', '11', '3'); -- AGI+3

-- ----------------------------
-- Pinecone Bomb
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('596', '8', '1'); -- STR+1

-- ----------------------------
-- Sprout Smack
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('597', '13', '1'); -- MND+1

-- ----------------------------
-- Soporific
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('598', '2', '-5'); -- HP-5
INSERT INTO `blue_spell_mods` VALUES ('598', '5', '5'); -- MP+5

-- ----------------------------
-- queasyshroom
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('599', '0', '0');

-- ----------------------------
-- wild_oats
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('603', '14', '1');
INSERT INTO `blue_spell_mods` VALUES ('603', '2', '10');

-- ----------------------------
-- bad_breath
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('604', '12', '2');
INSERT INTO `blue_spell_mods` VALUES ('604', '13', '2');

-- ----------------------------
-- geist_wall 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('605', '2', '-5');
INSERT INTO `blue_spell_mods` VALUES ('605', '5', '10');

-- ----------------------------
-- awful_eye (added) 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('606', '0', '0');

-- ----------------------------
-- frost_breath 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('608', '12', '1');

-- ----------------------------
-- infrasonics 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('610', '12', '1');

-- ----------------------------
-- disseverment 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('611', '12', '1');
INSERT INTO `blue_spell_mods` VALUES ('611', '13', '1');

-- ----------------------------
-- actinic_burst 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('612', '2', '20');
INSERT INTO `blue_spell_mods` VALUES ('612', '14', '2');

-- ----------------------------
-- reactor_cool (added) 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('613', '0', '0');

-- ----------------------------
-- saline_coat 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('614', '5', '10');
INSERT INTO `blue_spell_mods` VALUES ('614', '10', '2');
INSERT INTO `blue_spell_mods` VALUES ('614', '11', '2');

-- ----------------------------
-- plasma_charge (added) 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('615', '0', '0');

-- ----------------------------
-- temporal_shift (added) 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('616', '0', '0');

-- ----------------------------
-- vertical_cleave 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('617', '10', '1');
INSERT INTO `blue_spell_mods` VALUES ('617', '2', '-5');
INSERT INTO `blue_spell_mods` VALUES ('617', '5', '5');

-- ----------------------------
-- blastbomb 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('618', '8', '1');

-- ----------------------------
-- battle_dance 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('620', '9', '2');

-- ----------------------------
-- sandspray 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('621', '0', '0');

-- ----------------------------
-- grand_slam 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('622', '12', '1');

-- ----------------------------
-- head_butt 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('623', '9', '2');

-- ----------------------------
-- bomb_toss 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('626', '8', '2');

-- ----------------------------
-- frypan (added) 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('628', '0', '0');

-- ----------------------------
-- flying_hip_press 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('629', '11', '1');

-- ----------------------------
-- hydro_shot 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('631', '13', '2');

-- ----------------------------
-- diamondhide 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('632', '10', '1');

-- ----------------------------
-- enervation 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('633', '2', '-5');
INSERT INTO `blue_spell_mods` VALUES ('633', '5', '5');

-- ----------------------------
-- light_of_penance 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('634', '2', '15');
INSERT INTO `blue_spell_mods` VALUES ('634', '14', '1');

-- ----------------------------
-- warm-up 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('636', '10', '1');

-- ----------------------------
-- firespit 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('637', '8', '3');

-- ----------------------------
-- feather_storm 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('638', '0', '0');

-- ----------------------------
-- tail_slap 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('640', '13', '2');

-- ----------------------------
-- hysteric_barrage 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('641', '9', '2');
INSERT INTO `blue_spell_mods` VALUES ('641', '11', '1');

-- ----------------------------
-- amplification (added)
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('642', '0', '0');

-- ----------------------------
-- cannonball (added)
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('643', '0', '0');

-- ----------------------------
-- mind_blast (added)
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('644', '0', '0');

-- ----------------------------
-- exuviation (added)
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('645', '0', '0');

-- ----------------------------
-- magic_hammer 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('646', '5', '-5');
INSERT INTO `blue_spell_mods` VALUES ('646', '13', '2');

-- ----------------------------
-- zephyr_mantle 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('647', '0', '0');

-- ----------------------------
-- regurgitation 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('648', '5', '3');
INSERT INTO `blue_spell_mods` VALUES ('648', '12', '1');
INSERT INTO `blue_spell_mods` VALUES ('648', '13', '1');

-- ----------------------------
-- seedspray (added) 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('650', '0', '0');

-- ----------------------------
-- corrosive_ooze (added) 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('651', '0', '0');

-- ----------------------------
-- spiral_spin 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('652', '2', '5');
INSERT INTO `blue_spell_mods` VALUES ('652', '8', '1');

-- ----------------------------
-- asuran_claws (added) 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('653', '0', '0');

-- ----------------------------
-- sub-zero_smash (added) 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('654', '0', '0');

-- ----------------------------
-- triumphant_roar (added)  
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('655', '0', '0');

-- ----------------------------
-- acrid_stream 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('656', '0', '0');

-- ----------------------------
-- blazing_bound 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('657', '0', '0');

-- ----------------------------
-- plenilune_embrace 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('658', '0', '0');

-- ----------------------------
-- demoralizing_roar (added)
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('659', '0', '0');

-- ----------------------------
-- cimicine_discharge (added) 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('660', '0', '0');

-- ----------------------------
-- animating_wail (added) 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('661', '0', '0');

-- ----------------------------
-- battery_charge 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('662', '0', '0');

-- ----------------------------
-- leafstorm 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('663', '0', '0');

-- ----------------------------
-- regeneration 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('664', '0', '0');

-- ----------------------------
-- final_sting 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('665', '0', '0');

-- ----------------------------
-- goblin_rush 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('666', '0', '0');

-- ----------------------------
-- vanity_dive 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('667', '0', '0');

-- ----------------------------
-- magic_barrier 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('668', '0', '0');

-- ----------------------------
-- whirl_of_rage 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('669', '0', '0');

-- ----------------------------
-- benthic_typhoon 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('670', '0', '0');

-- ----------------------------
-- auroral_drape 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('671', '0', '0');

-- ----------------------------
-- osmosis 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('672', '0', '0');

-- ----------------------------
-- quad_continuum 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('673', '0', '0');

-- ----------------------------
-- fantod 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('674', '0', '0');

-- ----------------------------
-- thermal_pulse 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('675', '0', '0');

-- ----------------------------
-- empty_thrash 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('677', '0', '0');

-- ----------------------------
-- dream_flower 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('678', '0', '0');

-- ----------------------------
-- occultation 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('679', '0', '0');

-- ----------------------------
-- charged_whisker 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('680', '0', '0');

-- ----------------------------
-- winds_of_promy 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('681', '0', '0');

-- ----------------------------
-- delta_thrust 
-- ----------------------------
INSERT INTO `blue_spell_mods` VALUES ('682', '0', '0');
