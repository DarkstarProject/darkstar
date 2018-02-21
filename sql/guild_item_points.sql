/*
MySQL Data Transfer
Source Host: 192.168.0.140
Source Database: dspdbtest
Target Host: 192.168.0.140
Target Database: dspdbtest
Date: 3/26/2015 10:14:16 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for guild_item_points
-- ----------------------------
DROP TABLE IF EXISTS `guild_item_points`;
CREATE TABLE `guild_item_points` (
  `guildid` tinyint(1) unsigned NOT NULL,
  `itemid` smallint(5) unsigned NOT NULL,
  `rank` smallint(1) unsigned NOT NULL,
  `points` smallint(5) unsigned NOT NULL DEFAULT '0',
  `max_points` smallint(5) unsigned NOT NULL DEFAULT '0',
  `pattern` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`itemid`,`pattern`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------

-- ----------------------------
-- Fishing
-- ----------------------------
-- Amateur
INSERT INTO `guild_item_points` VALUES ('0', '4360', '0', '24', '1200', '0');     -- Bastore Sardine
INSERT INTO `guild_item_points` VALUES ('0', '4472', '0', '30', '1280', '1');     -- Crayfish
INSERT INTO `guild_item_points` VALUES ('0', '4360', '0', '24', '1200', '2');     -- Bastore Sardine
INSERT INTO `guild_item_points` VALUES ('0', '5125', '0', '12', '1120', '3');     -- Phanauet Newt
INSERT INTO `guild_item_points` VALUES ('0', '4472', '0', '30', '1280', '4');     -- Crayfish
INSERT INTO `guild_item_points` VALUES ('0', '4314', '0', '300', '2560', '5');    -- Bibikibo
INSERT INTO `guild_item_points` VALUES ('0', '4401', '0', '30', '1280', '6');     -- Moat Carp
INSERT INTO `guild_item_points` VALUES ('0', '4443', '0', '24', '1200', '7');     -- Cobalt Jellyfish

-- Recruit
INSERT INTO `guild_item_points` VALUES ('0', '4515', '1', '60', '1680', '0');     -- Copper Frog
INSERT INTO `guild_item_points` VALUES ('0', '4289', '1', '45', '1600', '1');     -- Forest Carp
INSERT INTO `guild_item_points` VALUES ('0', '4514', '1', '60', '1680', '2');     -- Quus
INSERT INTO `guild_item_points` VALUES ('0', '4379', '1', '60', '1680', '3');     -- Cheval Salmon
INSERT INTO `guild_item_points` VALUES ('0', '4500', '1', '24', '1520', '4');     -- Greedie
INSERT INTO `guild_item_points` VALUES ('0', '5473', '1', '279', '2640', '5');    -- Bastore Sweeper
INSERT INTO `guild_item_points` VALUES ('0', '4313', '1', '675', '3760', '6');    -- Blindfish
INSERT INTO `guild_item_points` VALUES ('0', '4403', '1', '60', '1680', '7');     -- Yellow Globe

-- Initiate
INSERT INTO `guild_item_points` VALUES ('0', '4464', '2', '138', '2240', '0');    -- Pipira
INSERT INTO `guild_item_points` VALUES ('0', '4469', '2', '300', '2880', '1');    -- Giant Catfish
INSERT INTO `guild_item_points` VALUES ('0', '4361', '2', '156', '2320', '2');    -- Nebimonite
INSERT INTO `guild_item_points` VALUES ('0', '4426', '2', '156', '2320', '3');    -- Tricolored Carp
INSERT INTO `guild_item_points` VALUES ('0', '4315', '2', '720', '4000', '4');    -- Lungfish
INSERT INTO `guild_item_points` VALUES ('0', '5121', '2', '714', '4000', '5');    -- Moorish Idol
INSERT INTO `guild_item_points` VALUES ('0', '4290', '2', '156', '2320', '6');    -- Elshimo Frog
INSERT INTO `guild_item_points` VALUES ('0', '4483', '2', '156', '2320', '7');    -- Tiger Cod

-- Novice
INSERT INTO `guild_item_points` VALUES ('0', '4354', '3', '78', '2240', '0');     -- Shining Trout
INSERT INTO `guild_item_points` VALUES ('0', '4528', '3', '375', '3280', '1');    -- Crystal Bass
INSERT INTO `guild_item_points` VALUES ('0', '4482', '3', '240', '2880', '2');    -- Nosteau Herring
INSERT INTO `guild_item_points` VALUES ('0', '5141', '3', '1350', '5040', '3');   -- Veydal Wrasse
INSERT INTO `guild_item_points` VALUES ('0', '4480', '3', '300', '3040', '4');    -- Gugru Tuna
INSERT INTO `guild_item_points` VALUES ('0', '4580', '3', '375', '3280', '5');    -- Coral Butterfly
INSERT INTO `guild_item_points` VALUES ('0', '4354', '3', '78', '2240', '6');     -- Shining Trout
INSERT INTO `guild_item_points` VALUES ('0', '4481', '3', '96', '2320', '7');     -- Ogre Eel

-- Apprentice
INSERT INTO `guild_item_points` VALUES ('0', '4462', '4', '900', '4480', '0');    -- Monke Onke
INSERT INTO `guild_item_points` VALUES ('0', '4306', '4', '576', '3920', '1');    -- Giant Donko
INSERT INTO `guild_item_points` VALUES ('0', '4383', '4', '576', '3920', '2');    -- Gold Lobster
INSERT INTO `guild_item_points` VALUES ('0', '4470', '4', '459', '3600', '3');    -- Icefish
INSERT INTO `guild_item_points` VALUES ('0', '4385', '4', '93', '2480', '4');     -- Zafmlug Bass
INSERT INTO `guild_item_points` VALUES ('0', '4383', '4', '576', '3920', '5');    -- Gold Lobster
INSERT INTO `guild_item_points` VALUES ('0', '4291', '4', '78', '2400', '6');     -- Sandfish
INSERT INTO `guild_item_points` VALUES ('0', '4385', '4', '93', '2480', '7');     -- Zafmlug Bass

-- Journeyman
INSERT INTO `guild_item_points` VALUES ('0', '4427', '5', '900', '4560', '0');    -- Gold Carp
INSERT INTO `guild_item_points` VALUES ('0', '4579', '5', '525', '3920', '1');    -- Elshimo Newt
INSERT INTO `guild_item_points` VALUES ('0', '4479', '5', '900', '4560', '2');    -- Bhefhel Marlin
INSERT INTO `guild_item_points` VALUES ('0', '4402', '5', '900', '4560', '3');    -- Red Terrapin
INSERT INTO `guild_item_points` VALUES ('0', '4399', '5', '900', '4560', '4');    -- Bluetail
INSERT INTO `guild_item_points` VALUES ('0', '4479', '5', '900', '4560', '5');    -- Bhefhel Marlin
INSERT INTO `guild_item_points` VALUES ('0', '4317', '5', '120', '2800', '6');    -- Trilobite
INSERT INTO `guild_item_points` VALUES ('0', '4399', '5', '900', '4560', '7');    -- Bluetail

-- Craftsman
INSERT INTO `guild_item_points` VALUES ('0', '4473', '6', '1320', '5120', '0');   -- Crescent Fish
INSERT INTO `guild_item_points` VALUES ('0', '4473', '6', '1320', '5120', '1');   -- Crescent Fish
INSERT INTO `guild_item_points` VALUES ('0', '4288', '6', '1200', '5040', '2');   -- Zebra Eel
INSERT INTO `guild_item_points` VALUES ('0', '4288', '6', '1200', '5040', '3');   -- Zebra Eel
INSERT INTO `guild_item_points` VALUES ('0', '4471', '6', '1200', '5040', '4');   -- Bladefish
INSERT INTO `guild_item_points` VALUES ('0', '4288', '6', '1200', '5040', '5');   -- Zebra Eel
INSERT INTO `guild_item_points` VALUES ('0', '4473', '6', '1320', '5120', '6');   -- Crescent Fish
INSERT INTO `guild_item_points` VALUES ('0', '4485', '6', '1200', '5040', '7');   -- Noble Lady

-- Artisan
INSERT INTO `guild_item_points` VALUES ('0', '4477', '7', '1500', '5360', '0');   -- Gavial Fish
INSERT INTO `guild_item_points` VALUES ('0', '4307', '7', '1800', '5600', '1');   -- Jungle Catfish
INSERT INTO `guild_item_points` VALUES ('0', '4478', '7', '1500', '5360', '2');   -- Three Eyed Fish
INSERT INTO `guild_item_points` VALUES ('0', '4307', '7', '1800', '5600', '3');   -- Jungle Catfish
INSERT INTO `guild_item_points` VALUES ('0', '4451', '7', '1500', '5360', '4');   -- Silver Shark
INSERT INTO `guild_item_points` VALUES ('0', '4478', '7', '1500', '5360', '5');   -- Three Eyed Fish
INSERT INTO `guild_item_points` VALUES ('0', '4477', '7', '1500', '5360', '6');   -- Gavial Fish
INSERT INTO `guild_item_points` VALUES ('0', '4451', '7', '1500', '5360', '7');   -- Silver Shark

-- Adept
INSERT INTO `guild_item_points` VALUES ('0', '4454', '8', '1800', '5680', '0');   -- Emperor Fish
INSERT INTO `guild_item_points` VALUES ('0', '4454', '8', '1800', '5680', '1');   -- Emperor Fish
INSERT INTO `guild_item_points` VALUES ('0', '4461', '8', '1800', '5680', '2');   -- Bastore Bream
INSERT INTO `guild_item_points` VALUES ('0', '4304', '8', '2100', '5840', '3');   -- Grimmonite
INSERT INTO `guild_item_points` VALUES ('0', '4474', '8', '1800', '5680', '4');   -- Gigant Squid
INSERT INTO `guild_item_points` VALUES ('0', '4304', '8', '2100', '5840', '5');   -- Grimmonite
INSERT INTO `guild_item_points` VALUES ('0', '4474', '8', '1800', '5680', '6');   -- Gigant Squid
INSERT INTO `guild_item_points` VALUES ('0', '4304', '8', '2100', '5840', '7');   -- Grimmonite

-- Veteran
INSERT INTO `guild_item_points` VALUES ('0', '4475', '9', '2100', '5840', '0');   -- Sea Zombie
INSERT INTO `guild_item_points` VALUES ('0', '4476', '9', '2100', '5840', '1');   -- Titanictus
INSERT INTO `guild_item_points` VALUES ('0', '4475', '9', '2100', '5840', '2');   -- Sea Zombie
INSERT INTO `guild_item_points` VALUES ('0', '4316', '9', '2850', '6240', '3');   -- Armored Pisces
INSERT INTO `guild_item_points` VALUES ('0', '4476', '9', '2100', '5840', '4');   -- Titanictus
INSERT INTO `guild_item_points` VALUES ('0', '4463', '9', '2100', '5840', '5');   -- Takitaro
INSERT INTO `guild_item_points` VALUES ('0', '4463', '9', '2100', '5840', '6');   -- Takitaro
INSERT INTO `guild_item_points` VALUES ('0', '4384', '9', '2100', '5840', '7');   -- Black Sole

-- ----------------------------
-- Woodworking
-- ----------------------------
-- Amateur
INSERT INTO `guild_item_points` VALUES ('1', '17095', '0', '105', '1680', '0');   -- Ash Pole
INSERT INTO `guild_item_points` VALUES ('1', '17122', '0', '120', '1680', '0');   -- Ash Pole +1
INSERT INTO `guild_item_points` VALUES ('1', '17049', '0', '13', '1200', '1');    -- Maple Wand
INSERT INTO `guild_item_points` VALUES ('1', '17087', '0', '13', '1200', '1');    -- Maple Wand +1
INSERT INTO `guild_item_points` VALUES ('1', '22', '0', '94', '1600', '2');       -- Workbench
INSERT INTO `guild_item_points` VALUES ('1', '17088', '0', '16', '1200', '3');    -- Ash Staff
INSERT INTO `guild_item_points` VALUES ('1', '17123', '0', '24', '1200', '3');    -- Ash Staff +1
INSERT INTO `guild_item_points` VALUES ('1', '17024', '0', '18', '1200', '4');    -- Ash Club
INSERT INTO `guild_item_points` VALUES ('1', '17137', '0', '26', '1200', '4');    -- Ash Club +1
INSERT INTO `guild_item_points` VALUES ('1', '16832', '0', '27', '1280', '5');    -- Harpoon
INSERT INTO `guild_item_points` VALUES ('1', '16862', '0', '30', '1280', '5');    -- Harpoon +1
INSERT INTO `guild_item_points` VALUES ('1', '12289', '0', '30', '1280', '6');    -- Lauan Shield
INSERT INTO `guild_item_points` VALUES ('1', '12333', '0', '38', '1280', '6');    -- Lauan Shield +1
INSERT INTO `guild_item_points` VALUES ('1', '17345', '0', '12', '1120', '7');    -- Flute
INSERT INTO `guild_item_points` VALUES ('1', '17372', '0', '15', '1120', '7');    -- Flute +1
INSERT INTO `guild_item_points` VALUES ('1', '17844', '0', '18', '1120', '7');    -- Flute +2

-- Recruit
INSERT INTO `guild_item_points` VALUES ('1', '17153', '1', '134', '2080', '0');   -- Self Bow
INSERT INTO `guild_item_points` VALUES ('1', '17176', '1', '154', '2080', '0');   -- Self Bow +1
INSERT INTO `guild_item_points` VALUES ('1', '12985', '1', '325', '2800', '1');   -- Holly Clogs
INSERT INTO `guild_item_points` VALUES ('1', '12991', '1', '406', '2800', '1');   -- Holly Clogs +1
INSERT INTO `guild_item_points` VALUES ('1', '12984', '1', '31', '1520', '2');    -- Ash Clogs
INSERT INTO `guild_item_points` VALUES ('1', '12983', '1', '39', '1520', '2');    -- Ash Clogs +1
INSERT INTO `guild_item_points` VALUES ('1', '23', '1', '158', '2160', '3');      -- Maple Table
INSERT INTO `guild_item_points` VALUES ('1', '17050', '1', '74', '1760', '4');    -- Willow Wand
INSERT INTO `guild_item_points` VALUES ('1', '17138', '1', '119', '1760', '4');   -- Willow Wand +1
INSERT INTO `guild_item_points` VALUES ('1', '17216', '1', '45', '1600', '5');    -- Light Crossbow
INSERT INTO `guild_item_points` VALUES ('1', '17228', '1', '53', '1600', '5');    -- Light Crossbow +1
INSERT INTO `guild_item_points` VALUES ('1', '17096', '1', '423', '3120', '6');   -- Holly Pole
INSERT INTO `guild_item_points` VALUES ('1', '17124', '1', '435', '3120', '6');   -- Holly Pole +1
INSERT INTO `guild_item_points` VALUES ('1', '12290', '1', '121', '2000', '7');   -- Maple Shield
INSERT INTO `guild_item_points` VALUES ('1', '12330', '1', '152', '2000', '7');   -- Maple Shield +1

-- Initiate
INSERT INTO `guild_item_points` VALUES ('1', '17051', '2', '261', '2720', '0');   -- Yew Wand
INSERT INTO `guild_item_points` VALUES ('1', '17140', '2', '414', '2720', '0');   -- Yew Wand +1
INSERT INTO `guild_item_points` VALUES ('1', '17353', '2', '12', '1680', '1');    -- Maple Harp
INSERT INTO `guild_item_points` VALUES ('1', '17373', '2', '15', '1680', '1');    -- Maple Harp +1
INSERT INTO `guild_item_points` VALUES ('1', '92', '2', '246', '2720', '2');      -- Tarutaru Stool
INSERT INTO `guild_item_points` VALUES ('1', '17354', '2', '500', '3440', '3');   -- Harp
INSERT INTO `guild_item_points` VALUES ('1', '17374', '2', '600', '3440', '3');   -- Harp +1
INSERT INTO `guild_item_points` VALUES ('1', '16834', '2', '400', '3200', '4');   -- Brass Spear
INSERT INTO `guild_item_points` VALUES ('1', '16864', '2', '410', '3200', '4');   -- Brass Spear +1
INSERT INTO `guild_item_points` VALUES ('1', '12291', '2', '363', '3120', '5');   -- Elm Shield
INSERT INTO `guild_item_points` VALUES ('1', '12319', '2', '457', '3120', '5');   -- Elm Shield +1
INSERT INTO `guild_item_points` VALUES ('1', '17090', '2', '601', '3680', '6');   -- Elm Staff
INSERT INTO `guild_item_points` VALUES ('1', '17126', '2', '887', '3680', '6');   -- Elm Staff +1
INSERT INTO `guild_item_points` VALUES ('1', '17025', '2', '290', '2880', '7');   -- Chestnut Club
INSERT INTO `guild_item_points` VALUES ('1', '17139', '2', '447', '2880', '7');   -- Solid Club

-- Novice
INSERT INTO `guild_item_points` VALUES ('1', '17217', '3', '471', '3520', '0');   -- Crossbow
INSERT INTO `guild_item_points` VALUES ('1', '17225', '3', '471', '3520', '0');   -- Crossbow +1
INSERT INTO `guild_item_points` VALUES ('1', '17155', '3', '1250', '4880', '1');  -- Composite Bow
INSERT INTO `guild_item_points` VALUES ('1', '17179', '3', '1300', '4880', '1');  -- Composite Bow +1
INSERT INTO `guild_item_points` VALUES ('1', '17162', '3', '3116', '6240', '2');  -- Great Bow
INSERT INTO `guild_item_points` VALUES ('1', '17180', '3', '3496', '6240', '2');  -- Great Bow +1
INSERT INTO `guild_item_points` VALUES ('1', '17424', '3', '300', '3040', '3');   -- Spiked Club
INSERT INTO `guild_item_points` VALUES ('1', '17425', '3', '330', '3040', '3');   -- Spiked Club +1
INSERT INTO `guild_item_points` VALUES ('1', '12986', '3', '612', '3840', '4');   -- Chestnut Sabots
INSERT INTO `guild_item_points` VALUES ('1', '13022', '3', '646', '3840', '4');   -- Chestnut Sabots +1
INSERT INTO `guild_item_points` VALUES ('1', '17052', '3', '714', '4080', '5');   -- Chestnut Wand
INSERT INTO `guild_item_points` VALUES ('1', '17141', '3', '1134', '4080', '5');  -- Solid Wand
INSERT INTO `guild_item_points` VALUES ('1', '12292', '3', '830', '4320', '6');   -- Mahogany Shield
INSERT INTO `guild_item_points` VALUES ('1', '12334', '3', '1043', '4320', '6');  -- Strong Shield
INSERT INTO `guild_item_points` VALUES ('1', '16835', '3', '840', '4320', '7');   -- Spear
INSERT INTO `guild_item_points` VALUES ('1', '16865', '3', '870', '4320', '7');   -- Spear +1

-- Apprentice
INSERT INTO `guild_item_points` VALUES ('1', '12987', '4', '1344', '5040', '0');  -- Ebony Sabots
INSERT INTO `guild_item_points` VALUES ('1', '13023', '4', '1400', '5040', '0');  -- Ebony Sabots +1
INSERT INTO `guild_item_points` VALUES ('1', '17091', '4', '1218', '4960', '1');  -- Oak Staff 
INSERT INTO `guild_item_points` VALUES ('1', '17127', '4', '1798', '4960', '1');  -- Oak Staff +1
INSERT INTO `guild_item_points` VALUES ('1', '16845', '4', '1535', '5280', '2');  -- Lance
INSERT INTO `guild_item_points` VALUES ('1', '16876', '4', '1561', '5280', '2');  -- Lance +1
INSERT INTO `guild_item_points` VALUES ('1', '17218', '4', '1710', '5440', '3');  -- Zamburak
INSERT INTO `guild_item_points` VALUES ('1', '17229', '4', '1748', '5440', '3');  -- Zamburak +1
INSERT INTO `guild_item_points` VALUES ('1', '17027', '4', '1248', '4960', '4');  -- Oak Cudgel
INSERT INTO `guild_item_points` VALUES ('1', '17142', '4', '1768', '4960', '4');  -- Oak Cudgel +1
INSERT INTO `guild_item_points` VALUES ('1', '16836', '4', '1350', '5040', '5');  -- Halberd
INSERT INTO `guild_item_points` VALUES ('1', '16866', '4', '1400', '5040', '5');  -- Halberd +1
INSERT INTO `guild_item_points` VALUES ('1', '17053', '4', '1360', '5120', '6');  -- Rose Wand
INSERT INTO `guild_item_points` VALUES ('1', '17143', '4', '2160', '5120', '6');  -- Rose Wand +1
INSERT INTO `guild_item_points` VALUES ('1', '12293', '4', '1950', '5600', '7');  -- Oak Shield
INSERT INTO `guild_item_points` VALUES ('1', '12331', '4', '2450', '5600', '7');  -- Oak Shield +1

-- Journeyman
INSERT INTO `guild_item_points` VALUES ('1', '17355', '5', '2500', '6000', '0');  -- Rose Harp
INSERT INTO `guild_item_points` VALUES ('1', '17376', '5', '3000', '6000', '0');  -- Rose Harp +1
INSERT INTO `guild_item_points` VALUES ('1', '17030', '5', '1102', '4880', '1');  -- Great Club
INSERT INTO `guild_item_points` VALUES ('1', '17408', '5', '1160', '4880', '1');  -- Great Club +1
INSERT INTO `guild_item_points` VALUES ('1', '16847', '5', '2580', '6000', '2');  -- Mythril Lance
INSERT INTO `guild_item_points` VALUES ('1', '16877', '5', '2640', '6000', '2');  -- Mythril Lance +1
INSERT INTO `guild_item_points` VALUES ('1', '17219', '5', '2550', '6000', '3');  -- Arbalest
INSERT INTO `guild_item_points` VALUES ('1', '17226', '5', '2625', '6000', '3');  -- Arbalest +1
INSERT INTO `guild_item_points` VALUES ('1', '16871', '5', '4070', '6560', '4');  -- Kamayari
INSERT INTO `guild_item_points` VALUES ('1', '16872', '5', '4162', '6560', '4');  -- Kamayari +1
INSERT INTO `guild_item_points` VALUES ('1', '17164', '5', '4080', '6560', '5');  -- War Bow
INSERT INTO `guild_item_points` VALUES ('1', '17173', '5', '4160', '6560', '5');  -- War Bow +1
INSERT INTO `guild_item_points` VALUES ('1', '17098', '5', '1560', '5360', '6');  -- Oak Pole
INSERT INTO `guild_item_points` VALUES ('1', '17120', '5', '1620', '5360', '6');  -- Oak Pole +1
INSERT INTO `guild_item_points` VALUES ('1', '21', '5', '158', '2880', '7');      -- Desk

-- Craftsman
INSERT INTO `guild_item_points` VALUES ('1', '49', '6', '1278', '5120', '0');     -- Coffer
INSERT INTO `guild_item_points` VALUES ('1', '17157', '6', '3655', '6480', '1');  -- Rapid Bow
INSERT INTO `guild_item_points` VALUES ('1', '17189', '6', '3762', '6480', '1');  -- Rapid Bow +1
INSERT INTO `guild_item_points` VALUES ('1', '17054', '6', '1912', '5680', '2');  -- Ebony Wand
INSERT INTO `guild_item_points` VALUES ('1', '17427', '6', '3037', '5680', '2');  -- Ebony Wand +1
INSERT INTO `guild_item_points` VALUES ('1', '17561', '6', '4375', '6640', '3');  -- Revenging Staff
INSERT INTO `guild_item_points` VALUES ('1', '51', '6', '195', '3200', '4');      -- Chest
INSERT INTO `guild_item_points` VALUES ('1', '17092', '6', '2310', '5920', '5');  -- Mahogany Staff
INSERT INTO `guild_item_points` VALUES ('1', '17520', '6', '2310', '5920', '5');  -- Heavy Staff
INSERT INTO `guild_item_points` VALUES ('1', '17350', '6', '1200', '5040', '6');  -- Angel's Flute
INSERT INTO `guild_item_points` VALUES ('1', '17378', '6', '1280', '5040', '6');  -- Angel's Flute +1
INSERT INTO `guild_item_points` VALUES ('1', '17240', '6', '3300', '6320', '7');  -- Lightning Bow
INSERT INTO `guild_item_points` VALUES ('1', '17241', '6', '4125', '6320', '7');  -- Lightning Bow +1

-- Artisan
INSERT INTO `guild_item_points` VALUES ('1', '56', '7', '4900', '6800', '0');     -- Commode
INSERT INTO `guild_item_points` VALUES ('1', '12295', '7', '2817', '6160', '1');  -- Round Shield 
INSERT INTO `guild_item_points` VALUES ('1', '12352', '7', '2990', '6160', '1');  -- Round Shield +1
INSERT INTO `guild_item_points` VALUES ('1', '95', '7', '2500', '6000', '2');     -- Water Barrel
INSERT INTO `guild_item_points` VALUES ('1', '59', '7', '4594', '6720', '3');     -- Chiffonier
INSERT INTO `guild_item_points` VALUES ('1', '30', '7', '7010', '7120', '4');     -- Bureau
INSERT INTO `guild_item_points` VALUES ('1', '104', '7', '427', '3920', '5');     -- Tarutaru Folding Screen
INSERT INTO `guild_item_points` VALUES ('1', '17100', '7', '4350', '6640', '6');  -- Ebony Pole
INSERT INTO `guild_item_points` VALUES ('1', '17525', '7', '4495', '6640', '6');  -- Ebony Pole +1
INSERT INTO `guild_item_points` VALUES ('1', '17357', '7', '2587', '6080', '7');  -- Ebony Harp
INSERT INTO `guild_item_points` VALUES ('1', '17833', '7', '2700', '6080', '7');  -- Ebony Harp +1
INSERT INTO `guild_item_points` VALUES ('1', '17848', '7', '2700', '6080', '7');  -- Ebony Harp +2

-- Adept
INSERT INTO `guild_item_points` VALUES ('1', '16849', '8', '2650', '6160', '0');  -- Cermet Lance
INSERT INTO `guild_item_points` VALUES ('1', '16879', '8', '3312', '6160', '0');  -- Cermet Lance +1
INSERT INTO `guild_item_points` VALUES ('1', '17441', '8', '600', '4320', '1');   -- Eremite's Wand
INSERT INTO `guild_item_points` VALUES ('1', '17442', '8', '600', '4320', '1');   -- Eremite's Wand +1
INSERT INTO `guild_item_points` VALUES ('1', '17101', '8', '4740', '6800', '2');  -- Mythic Pole
INSERT INTO `guild_item_points` VALUES ('1', '17526', '8', '5727', '6800', '2');  -- Mythic Pole +1
INSERT INTO `guild_item_points` VALUES ('1', '17236', '8', '6235', '7040', '3');  -- Leo Crossbow
INSERT INTO `guild_item_points` VALUES ('1', '17237', '8', '6235', '7040', '3');  -- Leo Crossbow +1
INSERT INTO `guild_item_points` VALUES ('1', '17221', '8', '5425', '6880', '4');  -- Repeating Crossbow
INSERT INTO `guild_item_points` VALUES ('1', '17233', '8', '5425', '6880', '4');  -- Machine Crossbow
INSERT INTO `guild_item_points` VALUES ('1', '12364', '8', '2560', '6080', '5');  -- Nymph Shield
INSERT INTO `guild_item_points` VALUES ('1', '12365', '8', '2760', '6080', '5');  -- Nymph Shield +1
INSERT INTO `guild_item_points` VALUES ('1', '16890', '8', '1200', '5120', '6');  -- Obelisk Lance
INSERT INTO `guild_item_points` VALUES ('1', '16891', '8', '1300', '5120', '6');  -- Obelisk Lance +1
INSERT INTO `guild_item_points` VALUES ('1', '55', '8', '3200', '6320', '7');     -- Cabinet

-- Veteran
INSERT INTO `guild_item_points` VALUES ('1', '16840', '9', '7200', '7200', '0');  -- Ox Tongue
INSERT INTO `guild_item_points` VALUES ('1', '16894', '9', '7200', '7200', '0');  -- Ox Tongue +1
INSERT INTO `guild_item_points` VALUES ('1', '17205', '9', '7440', '7440', '1');  -- Gendawa
INSERT INTO `guild_item_points` VALUES ('1', '17206', '9', '7440', '7440', '1');  -- Gendawa +1
INSERT INTO `guild_item_points` VALUES ('1', '18142', '9', '7680', '7680', '2');  -- Shigeto Bow
INSERT INTO `guild_item_points` VALUES ('1', '18143', '9', '7680', '7680', '2');  -- Shigeto Bow +1
INSERT INTO `guild_item_points` VALUES ('1', '17102', '9', '1200', '5200', '3');  -- Eight Sided Pole
INSERT INTO `guild_item_points` VALUES ('1', '17568', '9', '1800', '5200', '3');  -- Eight Sided Pole +1
INSERT INTO `guild_item_points` VALUES ('1', '139', '9', '7520', '7520', '4');    -- Star Globe
INSERT INTO `guild_item_points` VALUES ('1', '17364', '9', '5697', '6960', '5');  -- Cythara Angelica
INSERT INTO `guild_item_points` VALUES ('1', '17837', '9', '7022', '6960', '5');  -- Cythara Angelica +1
INSERT INTO `guild_item_points` VALUES ('1', '76', '9', '7520', '7520', '6');     -- Royal Bookshelf
INSERT INTO `guild_item_points` VALUES ('1', '77', '9', '7520', '7520', '7');     -- Bookshelf

-- ----------------------------
-- Smithing
-- ----------------------------
-- Amateur
INSERT INTO `guild_item_points` VALUES ('2', '16390', '0', '61', '1440', '0');    -- Bronze Knuckles
INSERT INTO `guild_item_points` VALUES ('2', '16440', '0', '61', '1440', '0');    -- Bronze Knuckles +1
INSERT INTO `guild_item_points` VALUES ('2', '16535', '0', '67', '1440', '1');    -- Bronze Sword
INSERT INTO `guild_item_points` VALUES ('2', '16623', '0', '75', '1440', '1');    -- Bronze Sword +1
INSERT INTO `guild_item_points` VALUES ('2', '16530', '0', '168', '2000', '2');   -- Xiphos
INSERT INTO `guild_item_points` VALUES ('2', '16624', '0', '188', '2000', '2');   -- Xiphos +1
INSERT INTO `guild_item_points` VALUES ('2', '16448', '0', '39', '1280', '3');    -- Bronze Dagger
INSERT INTO `guild_item_points` VALUES ('2', '16492', '0', '47', '1280', '3');    -- Bronze Dagger +1
INSERT INTO `guild_item_points` VALUES ('2', '16768', '0', '86', '1600', '4');    -- Bronze Zaghnal
INSERT INTO `guild_item_points` VALUES ('2', '16778', '0', '86', '1600', '4');    -- Bronze Zaghnal +1
INSERT INTO `guild_item_points` VALUES ('2', '16465', '0', '41', '1360', '5');    -- Bronze Knife
INSERT INTO `guild_item_points` VALUES ('2', '16491', '0', '48', '1360', '5');    -- Bronze Knife +1
INSERT INTO `guild_item_points` VALUES ('2', '17034', '0', '47', '1360', '6');    -- Bronze Mace
INSERT INTO `guild_item_points` VALUES ('2', '17086', '0', '57', '1360', '6');    -- Bronze Mace +1
INSERT INTO `guild_item_points` VALUES ('2', '16640', '0', '79', '1520', '7');    -- Bronze Axe
INSERT INTO `guild_item_points` VALUES ('2', '16646', '0', '86', '1520', '7');    -- Bronze Axe +1

-- Recruit
INSERT INTO `guild_item_points` VALUES ('2', '12816', '1', '358', '2880', '0');   -- Scale Cuisses
INSERT INTO `guild_item_points` VALUES ('2', '12863', '1', '410', '2880', '0');   -- Solid Cuisses
INSERT INTO `guild_item_points` VALUES ('2', '12944', '1', '217', '2400', '1');   -- Scale Greaves
INSERT INTO `guild_item_points` VALUES ('2', '13024', '1', '269', '2400', '1');   -- Solid Greaves
INSERT INTO `guild_item_points` VALUES ('2', '12299', '1', '189', '2320', '2');   -- Aspis
INSERT INTO `guild_item_points` VALUES ('2', '12325', '1', '233', '2320', '2');   -- Aspis +1
INSERT INTO `guild_item_points` VALUES ('2', '17042', '1', '85', '1840', '3');    -- Bronze Hammer
INSERT INTO `guild_item_points` VALUES ('2', '17144', '1', '100', '1840', '3');   -- Bronze Hammer +1
INSERT INTO `guild_item_points` VALUES ('2', '17059', '1', '25', '1520', '4');    -- Bronze Rod
INSERT INTO `guild_item_points` VALUES ('2', '17111', '1', '25', '1520', '4');    -- Bronze Rod +1
INSERT INTO `guild_item_points` VALUES ('2', '12560', '1', '446', '3200', '5');   -- Scale Mail
INSERT INTO `guild_item_points` VALUES ('2', '12661', '1', '498', '3200', '5');   -- Solid Mail
INSERT INTO `guild_item_points` VALUES ('2', '12688', '1', '238', '2480', '6');   -- Scale Finger Gauntlets
INSERT INTO `guild_item_points` VALUES ('2', '12768', '1', '290', '2480', '6');   -- Solid Finger Gauntlets
INSERT INTO `guild_item_points` VALUES ('2', '12576', '1', '64', '1680', '7');    -- Bronze Harness
INSERT INTO `guild_item_points` VALUES ('2', '12607', '1', '64', '1680', '7');    -- Bronze Harness +1

-- Initiate
INSERT INTO `guild_item_points` VALUES ('2', '17035', '2', '808', '4160', '0');   -- Mace
INSERT INTO `guild_item_points` VALUES ('2', '17145', '2', '980', '4160', '0');   -- Mace +1
INSERT INTO `guild_item_points` VALUES ('2', '13871', '2', '3024', '6160', '1');  -- Iron Visor
INSERT INTO `guild_item_points` VALUES ('2', '13872', '2', '3078', '6160', '1');  -- Iron Visor +1
INSERT INTO `guild_item_points` VALUES ('2', '16466', '2', '485', '3440', '2');   -- Knife
INSERT INTO `guild_item_points` VALUES ('2', '16614', '2', '578', '3440', '2');   -- Knife +1
INSERT INTO `guild_item_points` VALUES ('2', '16552', '2', '905', '4320', '3');   -- Scimitar
INSERT INTO `guild_item_points` VALUES ('2', '16625', '2', '998', '4320', '3');   -- Scimitar +1
INSERT INTO `guild_item_points` VALUES ('2', '16406', '2', '1440', '5040', '4');  -- Baghnakhs
INSERT INTO `guild_item_points` VALUES ('2', '16444', '2', '1740', '5040', '4');  -- Baghnakhs +1
INSERT INTO `guild_item_points` VALUES ('2', '16566', '2', '1536', '5200', '5');  -- Longsword
INSERT INTO `guild_item_points` VALUES ('2', '16628', '2', '1689', '5200', '5');  -- Longsword +1
INSERT INTO `guild_item_points` VALUES ('2', '16704', '2', '168', '2400', '6');   -- Butterfly Axe
INSERT INTO `guild_item_points` VALUES ('2', '16716', '2', '183', '2400', '6');   -- Butterfly Axe +1
INSERT INTO `guild_item_points` VALUES ('2', '16392', '2', '873', '4240', '7');   -- Metal Knuckles
INSERT INTO `guild_item_points` VALUES ('2', '16437', '2', '873', '4240', '7');   -- Metal Knuckles +1

-- Novice
INSERT INTO `guild_item_points` VALUES ('2', '12300', '3', '1720', '5360', '0');  -- Targe
INSERT INTO `guild_item_points` VALUES ('2', '12335', '3', '2120', '5360', '0');  -- Targe +1
INSERT INTO `guild_item_points` VALUES ('2', '16524', '3', '2128', '5680', '1');  -- Fleuret
INSERT INTO `guild_item_points` VALUES ('2', '16803', '3', '3648', '5680', '1');  -- Fleuret +1
INSERT INTO `guild_item_points` VALUES ('2', '16513', '3', '2146', '5680', '2');  -- Tuck
INSERT INTO `guild_item_points` VALUES ('2', '16617', '3', '2432', '5680', '2');  -- Tuck +1
INSERT INTO `guild_item_points` VALUES ('2', '16900', '3', '300', '3040', '3');   -- Wakizashi
INSERT INTO `guild_item_points` VALUES ('2', '16918', '3', '300', '3040', '3');   -- Wakizashi +1
INSERT INTO `guild_item_points` VALUES ('2', '17060', '3', '442', '3440', '4');   -- Rod
INSERT INTO `guild_item_points` VALUES ('2', '17146', '3', '702', '3440', '4');   -- Rod +1
INSERT INTO `guild_item_points` VALUES ('2', '13783', '3', '4644', '6720', '5');  -- Iron Scale Mail
INSERT INTO `guild_item_points` VALUES ('2', '13784', '3', '5184', '6720', '5');  -- Iron Scale Mail +1
INSERT INTO `guild_item_points` VALUES ('2', '17036', '3', '2256', '5760', '6');  -- Mythril Mace
INSERT INTO `guild_item_points` VALUES ('2', '17147', '3', '2736', '5760', '6');  -- Mythril Mace +1
INSERT INTO `guild_item_points` VALUES ('2', '16705', '3', '910', '4400', '7');   -- Greataxe
INSERT INTO `guild_item_points` VALUES ('2', '16717', '3', '991', '4400', '7');   -- Greataxe +1

-- Apprentice
INSERT INTO `guild_item_points` VALUES ('2', '16919', '4', '933', '4560', '0');   -- Shinobi Gatana
INSERT INTO `guild_item_points` VALUES ('2', '16920', '4', '902', '4560', '0');   -- Shinobi Gatana +1
INSERT INTO `guild_item_points` VALUES ('2', '16775', '4', '6900', '7040', '1');  -- Mythril Scythe
INSERT INTO `guild_item_points` VALUES ('2', '16782', '4', '6900', '7040', '1');  -- Mythril Scythe +1
INSERT INTO `guild_item_points` VALUES ('2', '16553', '4', '4850', '6720', '2');  -- Tulwar
INSERT INTO `guild_item_points` VALUES ('2', '16636', '4', '5330', '6720', '2');  -- Tulwar +1
INSERT INTO `guild_item_points` VALUES ('2', '16475', '4', '2484', '5920', '3');  -- Mythril Kukri
INSERT INTO `guild_item_points` VALUES ('2', '16750', '4', '2944', '5920', '3');  -- Mythril Kukri +1
INSERT INTO `guild_item_points` VALUES ('2', '16706', '4', '5152', '6800', '4');  -- Heavy Axe
INSERT INTO `guild_item_points` VALUES ('2', '16718', '4', '5612', '6800', '4');  -- Heavy Axe +1
INSERT INTO `guild_item_points` VALUES ('2', '16644', '4', '5400', '6880', '5');  -- Mythril Axe
INSERT INTO `guild_item_points` VALUES ('2', '16665', '4', '5940', '6880', '5');  -- Mythril Axe +1
INSERT INTO `guild_item_points` VALUES ('2', '16567', '4', '7200', '7200', '6');  -- Knight's Sword
INSERT INTO `guild_item_points` VALUES ('2', '16800', '4', '7200', '7200', '6');  -- Knight's Sword +1
INSERT INTO `guild_item_points` VALUES ('2', '16584', '4', '5250', '6800', '7');  -- Mythril Claymore
INSERT INTO `guild_item_points` VALUES ('2', '16639', '4', '5275', '6800', '7');  -- Fine Claymore

-- Journeyman
INSERT INTO `guild_item_points` VALUES ('2', '16413', '5', '4320', '6640', '0');  -- Darksteel Claws
INSERT INTO `guild_item_points` VALUES ('2', '16697', '5', '5220', '6640', '0');  -- Darksteel Claws +1
INSERT INTO `guild_item_points` VALUES ('2', '12544', '5', '5460', '6880', '1');  -- Breastplate
INSERT INTO `guild_item_points` VALUES ('2', '13724', '5', '6060', '6880', '1');  -- Breastplate +1
INSERT INTO `guild_item_points` VALUES ('2', '16590', '5', '6758', '7040', '2');  -- Greatsword
INSERT INTO `guild_item_points` VALUES ('2', '16932', '5', '7040', '7040', '2');  -- Greatsword +1
INSERT INTO `guild_item_points` VALUES ('2', '12416', '5', '3540', '6400', '3');  -- Sallet
INSERT INTO `guild_item_points` VALUES ('2', '13831', '5', '4140', '6400', '3');  -- Sallet +1
INSERT INTO `guild_item_points` VALUES ('2', '16960', '5', '667', '4160', '4');   -- Uchigatana
INSERT INTO `guild_item_points` VALUES ('2', '16978', '5', '667', '4160', '4');   -- Uchigatana +1
INSERT INTO `guild_item_points` VALUES ('2', '17265', '5', '1866', '5600', '5');  -- Tanegashima
INSERT INTO `guild_item_points` VALUES ('2', '17266', '5', '1875', '5600', '5');  -- Tanegashima +1
INSERT INTO `guild_item_points` VALUES ('2', '16519', '5', '7200', '7200', '6');  -- Schlaeger
INSERT INTO `guild_item_points` VALUES ('2', '16813', '5', '7200', '7200', '6');  -- Schlaeger +1
INSERT INTO `guild_item_points` VALUES ('2', '16545', '5', '3344', '6320', '7');  -- Broadsword
INSERT INTO `guild_item_points` VALUES ('2', '16634', '5', '3572', '6320', '7');  -- Broadsword +1

-- Craftsman
INSERT INTO `guild_item_points` VALUES ('2', '12715', '6', '3300', '6320', '0');  -- Kote
INSERT INTO `guild_item_points` VALUES ('2', '13996', '6', '3300', '6320', '0');  -- Kote +1
INSERT INTO `guild_item_points` VALUES ('2', '12459', '6', '3604', '6480', '1');  -- Zunari Kabuto
INSERT INTO `guild_item_points` VALUES ('2', '13865', '6', '3604', '6480', '1');  -- Zunari Kabuto +1
INSERT INTO `guild_item_points` VALUES ('2', '16902', '6', '2310', '5920', '2');  -- Sakurafubuki
INSERT INTO `guild_item_points` VALUES ('2', '16922', '6', '2442', '5920', '2');  -- Sakurafubuki +1
INSERT INTO `guild_item_points` VALUES ('2', '13111', '6', '2722', '6160', '3');  -- Nodowa
INSERT INTO `guild_item_points` VALUES ('2', '13124', '6', '3547', '6160', '3');  -- Nodowa +1
INSERT INTO `guild_item_points` VALUES ('2', '12683', '6', '5170', '6800', '4');  -- Darksteel Mufflers
INSERT INTO `guild_item_points` VALUES ('2', '13976', '6', '6270', '6800', '4');  -- Darksteel Mufflers +1
INSERT INTO `guild_item_points` VALUES ('2', '16476', '6', '5940', '6960', '5');  -- Darksteel Kukri
INSERT INTO `guild_item_points` VALUES ('2', '16763', '6', '6960', '6960', '5');  -- Darksteel Kukri +1
INSERT INTO `guild_item_points` VALUES ('2', '16915', '6', '2325', '5920', '6');  -- Hien
INSERT INTO `guild_item_points` VALUES ('2', '16916', '6', '2402', '5920', '6');  -- Hien +1
INSERT INTO `guild_item_points` VALUES ('2', '16796', '6', '6976', '7120', '7');  -- Mythril Zaghnal
INSERT INTO `guild_item_points` VALUES ('2', '16797', '6', '7120', '7120', '7');  -- Mythril Zaghnal +1

-- Artisan
INSERT INTO `guild_item_points` VALUES ('2', '16577', '7', '7440', '7440', '0');  -- Bastard Sword
INSERT INTO `guild_item_points` VALUES ('2', '16828', '7', '7440', '7440', '0');  -- Bastard Sword +1
INSERT INTO `guild_item_points` VALUES ('2', '16789', '7', '7440', '7440', '1');  -- Darksteel Scythe
INSERT INTO `guild_item_points` VALUES ('2', '16790', '7', '7440', '7440', '1');  -- Darksteel Scythe +1
INSERT INTO `guild_item_points` VALUES ('2', '16759', '7', '5670', '6960', '2');  -- Darksteel Kris
INSERT INTO `guild_item_points` VALUES ('2', '16760', '7', '6720', '6960', '2');  -- Darksteel Kris +1
INSERT INTO `guild_item_points` VALUES ('2', '16967', '7', '3740', '6480', '3');  -- Mikazuki
INSERT INTO `guild_item_points` VALUES ('2', '16989', '7', '3740', '6480', '3');  -- Mikazuki +1
INSERT INTO `guild_item_points` VALUES ('2', '12452', '7', '7020', '7120', '4');  -- Darksteel Cap
INSERT INTO `guild_item_points` VALUES ('2', '13863', '7', '7020', '7120', '4');  -- Darksteel Cap +1
INSERT INTO `guild_item_points` VALUES ('2', '12839', '7', '7280', '7280', '5');  -- Darksteel Subligar
INSERT INTO `guild_item_points` VALUES ('2', '14234', '7', '7280', '7280', '5');  -- Darksteel Subligar +1
INSERT INTO `guild_item_points` VALUES ('2', '13812', '7', '7280', '7280', '6');  -- Holy Breastplate
INSERT INTO `guild_item_points` VALUES ('2', '13813', '7', '7280', '7280', '6');  -- Divine Breastplate
INSERT INTO `guild_item_points` VALUES ('2', '16526', '7', '7280', '7280', '7');  -- Schwert
INSERT INTO `guild_item_points` VALUES ('2', '17635', '7', '7280', '7280', '7');  -- Schwert +1

-- Adept
INSERT INTO `guild_item_points` VALUES ('2', '12684', '8', '6345', '7040', '0');  -- Thick Mufflers
INSERT INTO `guild_item_points` VALUES ('2', '14012', '8', '6480', '7040', '0');  -- Thick Mufflers +1
INSERT INTO `guild_item_points` VALUES ('2', '12547', '8', '7440', '7440', '1');  -- Darksteel Cuirass
INSERT INTO `guild_item_points` VALUES ('2', '13756', '8', '7440', '7440', '1');  -- Darksteel Cuirass +1
INSERT INTO `guild_item_points` VALUES ('2', '17046', '8', '5880', '6960', '2');  -- Darksteel Maul
INSERT INTO `guild_item_points` VALUES ('2', '17432', '8', '6492', '6960', '2');  -- Darksteel Maul +1
INSERT INTO `guild_item_points` VALUES ('2', '12931', '8', '5720', '6960', '3');  -- Darksteel Sabatons
INSERT INTO `guild_item_points` VALUES ('2', '14105', '8', '6435', '6960', '3');  -- Darksteel Sabatons +1
INSERT INTO `guild_item_points` VALUES ('2', '16658', '8', '7200', '7200', '4');  -- Darksteel Tabar
INSERT INTO `guild_item_points` VALUES ('2', '16683', '8', '7200', '7200', '4');  -- Darksteel Tabar +1
INSERT INTO `guild_item_points` VALUES ('2', '16950', '8', '7520', '7520', '5');  -- Mythril Heart
INSERT INTO `guild_item_points` VALUES ('2', '16951', '8', '7520', '7520', '5');  -- Mythril Heart +1
INSERT INTO `guild_item_points` VALUES ('2', '16596', '8', '7520', '7520', '6');  -- Flamberge
INSERT INTO `guild_item_points` VALUES ('2', '16941', '8', '7520', '7520', '6');  -- Flamberge +1
INSERT INTO `guild_item_points` VALUES ('2', '12803', '8', '6500', '7400', '7');  -- Darksteel Cuisses
INSERT INTO `guild_item_points` VALUES ('2', '14229', '8', '7150', '7400', '7');  -- Darksteel Cuisses +1

-- Veteran
INSERT INTO `guild_item_points` VALUES ('2', '12309', '9', '6440', '7040', '0');  -- Ritter Shield
INSERT INTO `guild_item_points` VALUES ('2', '12358', '9', '7040', '7040', '0');  -- Ritter Shield +1
INSERT INTO `guild_item_points` VALUES ('2', '17038', '9', '7440', '7440', '1');  -- Buzdygan
INSERT INTO `guild_item_points` VALUES ('2', '17460', '9', '7440', '7440', '1');  -- Buzdygan +1
INSERT INTO `guild_item_points` VALUES ('2', '16452', '9', '4637', '6720', '2');  -- Misericorde
INSERT INTO `guild_item_points` VALUES ('2', '17620', '9', '4637', '6720', '2');  -- Misericorde +1
INSERT INTO `guild_item_points` VALUES ('2', '16547', '9', '7280', '7280', '3');  -- Anelace
INSERT INTO `guild_item_points` VALUES ('2', '17657', '9', '7280', '7280', '3');  -- Anelace +1
INSERT INTO `guild_item_points` VALUES ('2', '17252', '9', '7200', '7200', '4');  -- Culverin
INSERT INTO `guild_item_points` VALUES ('2', '18147', '9', '7200', '7200', '4');  -- Culverin +1
INSERT INTO `guild_item_points` VALUES ('2', '16653', '9', '5565', '6960', '5');  -- Nadziak
INSERT INTO `guild_item_points` VALUES ('2', '16685', '9', '5565', '6960', '5');  -- Nadziak +1
INSERT INTO `guild_item_points` VALUES ('2', '16659', '9', '7440', '7440', '6');  -- Tabarzin
INSERT INTO `guild_item_points` VALUES ('2', '17935', '9', '7440', '7440', '6');  -- Tabarzin +1
INSERT INTO `guild_item_points` VALUES ('2', '16470', '9', '2890', '6240', '7');  -- Gully
INSERT INTO `guild_item_points` VALUES ('2', '17621', '9', '3000', '6240', '7');  -- Gully +1

-- ----------------------------
-- Goldsmithing
-- ----------------------------
-- Amateur
INSERT INTO `guild_item_points` VALUES ('3', '12449', '0', '327', '2640', '0');   -- Brass Cap
INSERT INTO `guild_item_points` VALUES ('3', '12528', '0', '388', '2640', '0');   -- Brass Cap +1
INSERT INTO `guild_item_points` VALUES ('3', '16551', '0', '194', '2080', '1');   -- Sapara
INSERT INTO `guild_item_points` VALUES ('3', '16801', '0', '214', '2080', '1');   -- Sapara +1
INSERT INTO `guild_item_points` VALUES ('3', '12496', '0', '39', '1280', '2');    -- Copper Hairpin
INSERT INTO `guild_item_points` VALUES ('3', '12526', '0', '79', '1280', '2');    -- Copper Hairpin +1
INSERT INTO `guild_item_points` VALUES ('3', '12496', '0', '39', '1280', '3');    -- Copper Hairpin
INSERT INTO `guild_item_points` VALUES ('3', '12526', '0', '79', '1280', '3');    -- Copper Hairpin +1
INSERT INTO `guild_item_points` VALUES ('3', '16551', '0', '194', '2080', '4');   -- Sapara
INSERT INTO `guild_item_points` VALUES ('3', '16801', '0', '214', '2080', '4');   -- Sapara +1
INSERT INTO `guild_item_points` VALUES ('3', '13454', '0', '19', '1200', '5');    -- Copper Ring
INSERT INTO `guild_item_points` VALUES ('3', '13492', '0', '21', '1200', '5');    -- Copper Ring +1
INSERT INTO `guild_item_points` VALUES ('3', '12449', '0', '327', '2640', '6');   -- Brass Cap
INSERT INTO `guild_item_points` VALUES ('3', '12528', '0', '388', '2640', '6');   -- Brass Cap +1
INSERT INTO `guild_item_points` VALUES ('3', '13454', '0', '19', '1200', '7');    -- Copper Ring
INSERT INTO `guild_item_points` VALUES ('3', '13492', '0', '21', '1200', '7');    -- Copper Ring +1

-- Recruit
INSERT INTO `guild_item_points` VALUES ('3', '12497', '1', '259', '2650', '0');   -- Brass Hairpin
INSERT INTO `guild_item_points` VALUES ('3', '12529', '1', '264', '2650', '0');   -- Brass Hairpin +1
INSERT INTO `guild_item_points` VALUES ('3', '16407', '1', '338', '2800', '1');   -- Brass Baghnakhs
INSERT INTO `guild_item_points` VALUES ('3', '16441', '1', '338', '2800', '1');   -- Brass Baghnakhs +1
INSERT INTO `guild_item_points` VALUES ('3', '16449', '1', '186', '2240', '2');   -- Brass Dagger
INSERT INTO `guild_item_points` VALUES ('3', '16740', '1', '221', '2240', '2');   -- Brass Dagger +1
INSERT INTO `guild_item_points` VALUES ('3', '16769', '1', '140', '2080', '3');   -- Brass Zaghnal
INSERT INTO `guild_item_points` VALUES ('3', '16772', '1', '565', '2080', '3');   -- Brass Zaghnal +1
INSERT INTO `guild_item_points` VALUES ('3', '16391', '1', '180', '2240', '4');   -- Brass Knuckles
INSERT INTO `guild_item_points` VALUES ('3', '16689', '1', '227', '2240', '4');   -- Brass Knuckles +1
INSERT INTO `guild_item_points` VALUES ('3', '13465', '1', '50', '1600', '5');    -- Brass Ring
INSERT INTO `guild_item_points` VALUES ('3', '13493', '1', '70', '1600', '5');    -- Brass Ring +1
INSERT INTO `guild_item_points` VALUES ('3', '12577', '1', '497', '3360', '6');   -- Brass Harness
INSERT INTO `guild_item_points` VALUES ('3', '12664', '1', '558', '3360', '6');   -- Brass Harness +1
INSERT INTO `guild_item_points` VALUES ('3', '16641', '1', '312', '2720', '7');   -- Brass Axe
INSERT INTO `guild_item_points` VALUES ('3', '16661', '1', '343', '2720', '7');   -- Brass Axe +1

-- Initiate
INSERT INTO `guild_item_points` VALUES ('3', '12473', '2', '414', '3200', '0');   -- Poet's Circlet
INSERT INTO `guild_item_points` VALUES ('3', '12530', '2', '495', '3200', '0');   -- Sage's Circlet
INSERT INTO `guild_item_points` VALUES ('3', '12433', '2', '800', '4160', '1');   -- Brass Mask
INSERT INTO `guild_item_points` VALUES ('3', '12532', '2', '832', '4160', '1');   -- Brass Mask +1
INSERT INTO `guild_item_points` VALUES ('3', '17081', '2', '138', '2240', '2');   -- Brass Rod
INSERT INTO `guild_item_points` VALUES ('3', '17148', '2', '219', '2240', '2');   -- Brass Rod +1
INSERT INTO `guild_item_points` VALUES ('3', '12495', '2', '345', '3040', '3');   -- Silver Hairpin
INSERT INTO `guild_item_points` VALUES ('3', '12531', '2', '364', '3040', '3');   -- Silver Hairpin
INSERT INTO `guild_item_points` VALUES ('3', '17043', '2', '469', '3360', '4');   -- Brass Hammer
INSERT INTO `guild_item_points` VALUES ('3', '17149', '2', '544', '3360', '4');   -- Brass Hammer +1
INSERT INTO `guild_item_points` VALUES ('3', '13196', '2', '357', '3040', '5');   -- Silver Belt
INSERT INTO `guild_item_points` VALUES ('3', '13223', '2', '441', '3040', '5');   -- Silver Belt +1
INSERT INTO `guild_item_points` VALUES ('3', '12689', '2', '432', '4000', '6');   -- Brass Finger Gauntlets
INSERT INTO `guild_item_points` VALUES ('3', '12771', '2', '768', '4000', '6');   -- Brass Finger Gauntlets +1
INSERT INTO `guild_item_points` VALUES ('3', '13327', '2', '250', '2720', '7');   -- Silver Earring
INSERT INTO `guild_item_points` VALUES ('3', '13370', '2', '350', '2720', '7');   -- Silver Earring +1

-- Novice
INSERT INTO `guild_item_points` VALUES ('3', '13083', '3', '810', '4240', '0');   -- Chain Choker
INSERT INTO `guild_item_points` VALUES ('3', '13066', '3', '1110', '4240', '0');  -- Red Choker
INSERT INTO `guild_item_points` VALUES ('3', '12817', '3', '768', '4160', '1');   -- Brass Cuisses
INSERT INTO `guild_item_points` VALUES ('3', '12893', '3', '800', '4160', '1');   -- Brass Cuisses +1
INSERT INTO `guild_item_points` VALUES ('3', '13209', '3', '1020', '4560', '2');  -- Chain Belt
INSERT INTO `guild_item_points` VALUES ('3', '13213', '3', '1320', '4560', '2');  -- Chain Belt +1
INSERT INTO `guild_item_points` VALUES ('3', '12425', '3', '2850', '6080', '3');  -- Silver Mask
INSERT INTO `guild_item_points` VALUES ('3', '12533', '3', '3350', '6080', '3');  -- Silver Mask +1
INSERT INTO `guild_item_points` VALUES ('3', '17686', '3', '669', '4000', '4');   -- Spark Bilbo
INSERT INTO `guild_item_points` VALUES ('3', '17687', '3', '706', '4000', '4');   -- Spark Bilbo +1
INSERT INTO `guild_item_points` VALUES ('3', '13082', '3', '1020', '4560', '5');  -- Chain Gorget
INSERT INTO `guild_item_points` VALUES ('3', '13059', '3', '1320', '4560', '5');  -- Fine Gorget
INSERT INTO `guild_item_points` VALUES ('3', '12681', '3', '2350', '5840', '6');  -- Silver Mittens
INSERT INTO `guild_item_points` VALUES ('3', '12772', '3', '2850', '5840', '6');  -- Silver Mittens +1
INSERT INTO `guild_item_points` VALUES ('3', '18076', '3', '240', '2880', '7');   -- Spark Spear
INSERT INTO `guild_item_points` VALUES ('3', '18077', '3', '390', '2880', '7');   -- Spark Spear +1

-- Apprentice
INSERT INTO `guild_item_points` VALUES ('3', '12426', '4', '4275', '6640', '0');  -- Banded Helm
INSERT INTO `guild_item_points` VALUES ('3', '13832', '4', '5025', '6640', '0');  -- Banded Helm +1
INSERT INTO `guild_item_points` VALUES ('3', '12301', '4', '3117', '6240', '1');  -- Buckler
INSERT INTO `guild_item_points` VALUES ('3', '12327', '4', '3842', '6240', '1');  -- Buckler +1
INSERT INTO `guild_item_points` VALUES ('3', '16456', '4', '1976', '5600', '2');  -- Mythril Baselard
INSERT INTO `guild_item_points` VALUES ('3', '16752', '4', '2028', '5600', '2');  -- Fine Baselard
INSERT INTO `guild_item_points` VALUES ('3', '13519', '4', '1050', '4240', '3');  -- Mythril Ring +1
INSERT INTO `guild_item_points` VALUES ('3', '13446', '4', '750', '4240', '3');   -- Mythril Ring
INSERT INTO `guild_item_points` VALUES ('3', '12553', '4', '4400', '6640', '4');  -- Silver Mail
INSERT INTO `guild_item_points` VALUES ('3', '12666', '4', '4900', '6640', '4');  -- Silver Mail +1
INSERT INTO `guild_item_points` VALUES ('3', '12938', '4', '3225', '6320', '5');  -- Sollerets
INSERT INTO `guild_item_points` VALUES ('3', '13047', '4', '3975', '6320', '5');  -- Sollerets +1
INSERT INTO `guild_item_points` VALUES ('3', '13979', '4', '992', '4640', '6');   -- Silver Bangles
INSERT INTO `guild_item_points` VALUES ('3', '13980', '4', '1054', '4640', '6');  -- Silver Bangles +1
INSERT INTO `guild_item_points` VALUES ('3', '13328', '4', '750', '4240', '7');   -- Mythril Earring
INSERT INTO `guild_item_points` VALUES ('3', '13371', '4', '1050', '4240', '7');  -- Mythril Earring +1

-- Journeyman
INSERT INTO `guild_item_points` VALUES ('3', '13445', '5', '1750', '5520', '0');  -- Gold Ring
INSERT INTO `guild_item_points` VALUES ('3', '13520', '5', '2450', '5520', '0');  -- Gold Ring +1
INSERT INTO `guild_item_points` VALUES ('3', '17988', '5', '6037', '6960', '1');  -- Spark Kris
INSERT INTO `guild_item_points` VALUES ('3', '17989', '5', '6912', '6960', '1');  -- Spark Kris +1
INSERT INTO `guild_item_points` VALUES ('3', '13084', '5', '2805', '6160', '2');  -- Mythril Gorget
INSERT INTO `guild_item_points` VALUES ('3', '13067', '5', '3630', '6160', '2');  -- Noble's Gorget
INSERT INTO `guild_item_points` VALUES ('3', '14725', '5', '5250', '6800', '3');  -- Melody Earring
INSERT INTO `guild_item_points` VALUES ('3', '14726', '5', '6000', '6800', '3');  -- Melody Earring +1
INSERT INTO `guild_item_points` VALUES ('3', '12307', '5', '3168', '6320', '4');  -- Heater Shield
INSERT INTO `guild_item_points` VALUES ('3', '12328', '5', '3828', '6320', '4');  -- Heater Shield +1
INSERT INTO `guild_item_points` VALUES ('3', '13315', '5', '1750', '5520', '5');  -- Gold Earring
INSERT INTO `guild_item_points` VALUES ('3', '13372', '5', '2450', '5520', '5');  -- Gold Earring +1
INSERT INTO `guild_item_points` VALUES ('3', '16518', '5', '3100', '6240', '6');  -- Mythril Degen
INSERT INTO `guild_item_points` VALUES ('3', '16815', '5', '3150', '6240', '6');  -- Mythril Degen +1
INSERT INTO `guild_item_points` VALUES ('3', '17281', '5', '1260', '5040', '7');  -- Wingedge
INSERT INTO `guild_item_points` VALUES ('3', '17288', '5', '1560', '5040', '7');  -- Wingedge +1

-- Craftsman
INSERT INTO `guild_item_points` VALUES ('3', '12801', '6', '3547', '6400', '0');  -- Mythril Cuisses
INSERT INTO `guild_item_points` VALUES ('3', '14211', '6', '3630', '6400', '0');  -- Mythril Cuisses +1
INSERT INTO `guild_item_points` VALUES ('3', '13983', '6', '3870', '6560', '1');  -- Gold Bangles
INSERT INTO `guild_item_points` VALUES ('3', '13984', '6', '4470', '6560', '1');  -- Gold Bangles +1
INSERT INTO `guild_item_points` VALUES ('3', '12929', '6', '3630', '6480', '2');  -- Mythril Leggings
INSERT INTO `guild_item_points` VALUES ('3', '14086', '6', '4455', '6480', '2');  -- Mythril Leggings +1
INSERT INTO `guild_item_points` VALUES ('3', '13447', '6', '6200', '6960', '3');  -- Platinum Ring
INSERT INTO `guild_item_points` VALUES ('3', '13498', '6', '6960', '6960', '3');  -- Platinum Ring +1
INSERT INTO `guild_item_points` VALUES ('3', '12673', '6', '3960', '6560', '4');  -- Mythril Gauntlets
INSERT INTO `guild_item_points` VALUES ('3', '13958', '6', '4785', '6560', '4');  -- Mythril Gauntlets +1
INSERT INTO `guild_item_points` VALUES ('3', '12545', '6', '7120', '7120', '5');  -- Mythril Breastplate
INSERT INTO `guild_item_points` VALUES ('3', '13737', '6', '7120', '7120', '5');  -- Mythril Breastplate +1
INSERT INTO `guild_item_points` VALUES ('3', '16514', '6', '3037', '6240', '6');  -- Mailbreaker
INSERT INTO `guild_item_points` VALUES ('3', '16618', '6', '3150', '6240', '6');  -- Mailbreaker +1
INSERT INTO `guild_item_points` VALUES ('3', '12801', '6', '3547', '6400', '7');  -- Mythril Cuisses
INSERT INTO `guild_item_points` VALUES ('3', '14211', '6', '3630', '6560', '7');  -- Mythril Cuisses

-- Artisan
INSERT INTO `guild_item_points` VALUES ('3', '16421', '7', '6370', '7040', '0');  -- Gold Patas
INSERT INTO `guild_item_points` VALUES ('3', '17489', '7', '6492', '7040', '0');  -- Gold Patas +1
INSERT INTO `guild_item_points` VALUES ('3', '16395', '7', '5637', '6880', '1');  -- Diamond Knuckles
INSERT INTO `guild_item_points` VALUES ('3', '17480', '7', '5367', '6880', '1');  -- Diamond Knuckles +1
INSERT INTO `guild_item_points` VALUES ('3', '16569', '7', '7520', '7520', '2');  -- Gold Sword
INSERT INTO `guild_item_points` VALUES ('3', '17641', '7', '7520', '7520', '2');  -- Gold Sword +1
INSERT INTO `guild_item_points` VALUES ('3', '16962', '7', '3020', '6320', '3');  -- Ashura
INSERT INTO `guild_item_points` VALUES ('3', '16979', '7', '3300', '6320', '3');  -- Ashura +1
INSERT INTO `guild_item_points` VALUES ('3', '17285', '7', '3990', '6560', '4');  -- Moonring Blade
INSERT INTO `guild_item_points` VALUES ('3', '17279', '7', '3990', '6560', '4');  -- Moonring Blade
INSERT INTO `guild_item_points` VALUES ('3', '12930', '7', '4950', '6800', '5');  -- Gold Sabatons
INSERT INTO `guild_item_points` VALUES ('3', '14087', '7', '6075', '6800', '5');  -- Gilt Sabatons
INSERT INTO `guild_item_points` VALUES ('3', '12303', '7', '4080', '6640', '6');  -- Gold Buckler
INSERT INTO `guild_item_points` VALUES ('3', '12353', '7', '4207', '6640', '6');  -- Gilt Buckler
INSERT INTO `guild_item_points` VALUES ('3', '12802', '7', '3937', '6560', '7');  -- Gold Cuisses
INSERT INTO `guild_item_points` VALUES ('3', '14212', '7', '4050', '6560', '7');  -- Gilt Cuisses

-- Adept
INSERT INTO `guild_item_points` VALUES ('3', '16972', '8', '7200', '7200', '0');  -- Kazaridachi
INSERT INTO `guild_item_points` VALUES ('3', '17805', '8', '7200', '7200', '0');  -- Kazaridachi +1
INSERT INTO `guild_item_points` VALUES ('3', '12310', '8', '5640', '6960', '1');  -- Diamond Shield
INSERT INTO `guild_item_points` VALUES ('3', '12355', '8', '5640', '6960', '1');  -- Diamond Shield +1
INSERT INTO `guild_item_points` VALUES ('3', '16842', '8', '5460', '6880', '2');  -- Golden Spear
INSERT INTO `guild_item_points` VALUES ('3', '16875', '8', '6435', '6880', '2');  -- Golden Spear +1
INSERT INTO `guild_item_points` VALUES ('3', '13985', '8', '5697', '6960', '3');  -- Platinum Bangles
INSERT INTO `guild_item_points` VALUES ('3', '13986', '8', '7022', '6960', '3');  -- Platinum Bangles +1
INSERT INTO `guild_item_points` VALUES ('3', '17039', '8', '7200', '7200', '4');  -- Platinum Mace
INSERT INTO `guild_item_points` VALUES ('3', '17431', '8', '7200', '7200', '4');  -- Platinum Mace +1
INSERT INTO `guild_item_points` VALUES ('3', '16527', '8', '7360', '7360', '5');  -- Epee
INSERT INTO `guild_item_points` VALUES ('3', '16619', '8', '7360', '7360', '5');  -- Epee +1
INSERT INTO `guild_item_points` VALUES ('3', '13087', '8', '3780', '6560', '6');  -- Jeweled Collar
INSERT INTO `guild_item_points` VALUES ('3', '13130', '8', '3780', '6560', '6');  -- Jeweled Collar +1
INSERT INTO `guild_item_points` VALUES ('3', '16541', '8', '7520', '7520', '7');  -- Jagdplaute
INSERT INTO `guild_item_points` VALUES ('3', '17636', '8', '7520', '7520', '7');  -- Jagdplaute +1

-- Veteran
INSERT INTO `guild_item_points` VALUES ('3', '16520', '9', '7600', '7600', '0');  -- Verdun
INSERT INTO `guild_item_points` VALUES ('3', '17656', '9', '7600', '7600', '0');  -- Verdun +1
INSERT INTO `guild_item_points` VALUES ('3', '16453', '9', '7680', '7680', '1');  -- Orichalcum Dagger
INSERT INTO `guild_item_points` VALUES ('3', '17992', '9', '7680', '7680', '1');  -- Triton's Dagger
INSERT INTO `guild_item_points` VALUES ('3', '13185', '9', '1800', '5680', '2');  -- Muscle Belt
INSERT INTO `guild_item_points` VALUES ('3', '13279', '9', '2925', '5680', '2');  -- Muscle Belt +1
INSERT INTO `guild_item_points` VALUES ('3', '13097', '9', '7680', '7680', '3');  -- Brisingamen
INSERT INTO `guild_item_points` VALUES ('3', '13162', '9', '7680', '7680', '3');  -- Brisingamen +1
INSERT INTO `guild_item_points` VALUES ('3', '13466', '9', '7760', '7760', '4');  -- Orichalcum Ring
INSERT INTO `guild_item_points` VALUES ('3', '14616', '9', '7760', '7760', '4');  -- Triton Ring
INSERT INTO `guild_item_points` VALUES ('3', '12387', '9', '7680', '7680', '5');  -- Koenig Shield
INSERT INTO `guild_item_points` VALUES ('3', '12388', '9', '7680', '7680', '5');  -- Kaiser Shield
INSERT INTO `guild_item_points` VALUES ('3', '33', '9', '7760', '7760', '6');     -- Millionaire Desk
INSERT INTO `guild_item_points` VALUES ('3', '13329', '9', '7760', '7760', '7');  -- Orichalcum Earring
INSERT INTO `guild_item_points` VALUES ('3', '13434', '9', '7760', '7760', '7');  -- Triton Earring

-- ----------------------------
-- Clothcraft
-- ----------------------------
-- Amateur
INSERT INTO `guild_item_points` VALUES ('4', '12720', '0', '303', '2560', '0');   -- Gloves
INSERT INTO `guild_item_points` VALUES ('4', '12773', '0', '373', '2560', '0');   -- Gloves +1
INSERT INTO `guild_item_points` VALUES ('4', '12848', '0', '211', '2160', '1');   -- Brais
INSERT INTO `guild_item_points` VALUES ('4', '12896', '0', '282', '2160', '1');   -- Brais +1
INSERT INTO `guild_item_points` VALUES ('4', '13583', '0', '85', '1600', '2');    -- Cape
INSERT INTO `guild_item_points` VALUES ('4', '13605', '0', '111', '1600', '2');   -- Cape +1
INSERT INTO `guild_item_points` VALUES ('4', '12976', '0', '282', '2480', '3');   -- Gaiters
INSERT INTO `guild_item_points` VALUES ('4', '13030', '0', '352', '2480', '3');   -- Gaiters +1
INSERT INTO `guild_item_points` VALUES ('4', '12592', '0', '119', '3360', '4');   -- Doublet
INSERT INTO `guild_item_points` VALUES ('4', '12591', '0', '549', '3360', '4');   -- Doublet +1
INSERT INTO `guild_item_points` VALUES ('4', '13583', '0', '85', '1600', '5');    -- Cape
INSERT INTO `guild_item_points` VALUES ('4', '13605', '0', '111', '1600', '5');   -- Cape +1
INSERT INTO `guild_item_points` VALUES ('4', '12464', '0', '70', '1520', '6');    -- Headgear
INSERT INTO `guild_item_points` VALUES ('4', '12471', '0', '126', '1520', '6');   -- Headgear +1
INSERT INTO `guild_item_points` VALUES ('4', '14290', '0', '110', '1680', '7');   -- Vagabond's Hose
INSERT INTO `guild_item_points` VALUES ('4', '14291', '0', '118', '1680', '7');   -- Nomad's Hose

-- Recruit
INSERT INTO `guild_item_points` VALUES ('4', '12608', '1', '280', '2640', '0');   -- Tunic
INSERT INTO `guild_item_points` VALUES ('4', '12616', '1', '312', '2640', '0');   -- Tunic +1
INSERT INTO `guild_item_points` VALUES ('4', '12593', '1', '858', '4160', '1');   -- Cotton Doublet
INSERT INTO `guild_item_points` VALUES ('4', '12669', '1', '2518', '4160', '1');  -- Great Doublet
INSERT INTO `guild_item_points` VALUES ('4', '12584', '1', '249', '2480', '2');   -- Kenpogi
INSERT INTO `guild_item_points` VALUES ('4', '12668', '1', '280', '2480', '2');   -- Kenpogi +1
INSERT INTO `guild_item_points` VALUES ('4', '12600', '1', '60', '1680', '3');    -- Robe
INSERT INTO `guild_item_points` VALUES ('4', '12615', '1', '60', '1680', '3');    -- Robe +1
INSERT INTO `guild_item_points` VALUES ('4', '12712', '1', '137', '2080', '4');   -- Tekko
INSERT INTO `guild_item_points` VALUES ('4', '12774', '1', '168', '2080', '4');   -- Tekko +1
INSERT INTO `guild_item_points` VALUES ('4', '12728', '1', '33', '1520', '5');    -- Cuffs
INSERT INTO `guild_item_points` VALUES ('4', '12744', '1', '41', '1520', '5');    -- Cuffs +1
INSERT INTO `guild_item_points` VALUES ('4', '13584', '1', '506', '3360', '6');   -- Cotton Cape
INSERT INTO `guild_item_points` VALUES ('4', '13601', '1', '660', '3360', '6');   -- Cotton Cape +1
INSERT INTO `guild_item_points` VALUES ('4', '13806', '1', '118', '2000', '7');   -- Vagabond's Tunica
INSERT INTO `guild_item_points` VALUES ('4', '13807', '1', '126', '2000', '7');   -- Nomad's Tunica

-- Initiate
INSERT INTO `guild_item_points` VALUES ('4', '12713', '2', '675', '3920', '0');   -- Cotton Tekko
INSERT INTO `guild_item_points` VALUES ('4', '12777', '2', '829', '3920', '0');   -- Cotton Tekko +1
INSERT INTO `guild_item_points` VALUES ('4', '12969', '2', '629', '3760', '1');   -- Cotton Kyahan
INSERT INTO `guild_item_points` VALUES ('4', '13033', '2', '783', '3760', '1');   -- Cotton Kyahan +1
INSERT INTO `guild_item_points` VALUES ('4', '12585', '2', '460', '3360', '2');   -- Cotton Dogi
INSERT INTO `guild_item_points` VALUES ('4', '12624', '2', '476', '3360', '2');   -- Cotton Dogi +1
INSERT INTO `guild_item_points` VALUES ('4', '12457', '2', '814', '4160', '3');   -- Cotton Hachimaki
INSERT INTO `guild_item_points` VALUES ('4', '12537', '2', '967', '4160', '3');   -- Cotton Hachimaki +1
INSERT INTO `guild_item_points` VALUES ('4', '12594', '2', '2500', '5920', '4');  -- Gambison
INSERT INTO `guild_item_points` VALUES ('4', '12625', '2', '2550', '5920', '4');  -- Gambison +1
INSERT INTO `guild_item_points` VALUES ('4', '12729', '2', '349', '3040', '5');   -- Linen Cuffs
INSERT INTO `guild_item_points` VALUES ('4', '12778', '2', '430', '3040', '5');   -- Linen Cuffs +1
INSERT INTO `guild_item_points` VALUES ('4', '13204', '2', '99', '2080', '6');    -- Heko Obi
INSERT INTO `guild_item_points` VALUES ('4', '13190', '2', '131', '2080', '6');   -- Heko Obi +1
INSERT INTO `guild_item_points` VALUES ('4', '12601', '2', '617', '3760', '7');   -- Linen Robe
INSERT INTO `guild_item_points` VALUES ('4', '12626', '2', '617', '3760', '7');   -- Linen Robe +1

-- Novice
INSERT INTO `guild_item_points` VALUES ('4', '12970', '3', '1836', '5520', '0');  -- Soil Kyahan
INSERT INTO `guild_item_points` VALUES ('4', '13035', '3', '1872', '5520', '0');  -- Soil Kyahan +1
INSERT INTO `guild_item_points` VALUES ('4', '14423', '3', '3210', '6240', '1');  -- Mist Tunic
INSERT INTO `guild_item_points` VALUES ('4', '14855', '3', '1395', '5040', '2');  -- Mist Mitts
INSERT INTO `guild_item_points` VALUES ('4', '12610', '3', '1748', '5440', '3');  -- Cloak
INSERT INTO `guild_item_points` VALUES ('4', '12670', '3', '1794', '5440', '3');  -- Cloak +1
INSERT INTO `guild_item_points` VALUES ('4', '12714', '3', '1584', '5280', '4');  -- Soil Tekko
INSERT INTO `guild_item_points` VALUES ('4', '12781', '3', '1944', '5280', '4');  -- Soil Tekko
INSERT INTO `guild_item_points` VALUES ('4', '12842', '3', '2304', '5840', '5');  -- Soil Sitabaki
INSERT INTO `guild_item_points` VALUES ('4', '12905', '3', '2664', '5840', '5');  -- Soil Sitabaki +1
INSERT INTO `guild_item_points` VALUES ('4', '14324', '3', '2460', '5920', '6');  -- Mist Slacks
INSERT INTO `guild_item_points` VALUES ('4', '12458', '3', '1116', '4720', '7');  -- Soil Hachimaki
INSERT INTO `guild_item_points` VALUES ('4', '12539', '3', '1152', '4720', '7');  -- Soil Hachimaki +1

-- Apprentice
INSERT INTO `guild_item_points` VALUES ('4', '12723', '4', '3440', '6400', '0');  -- Wool Bracers
INSERT INTO `guild_item_points` VALUES ('4', '12783', '4', '4240', '6400', '0');  -- Wool Bracers +1
INSERT INTO `guild_item_points` VALUES ('4', '12979', '4', '3200', '6320', '1');  -- Wool Socks
INSERT INTO `guild_item_points` VALUES ('4', '13036', '4', '4000', '6320', '1');  -- Wool Socks +1
INSERT INTO `guild_item_points` VALUES ('4', '12858', '4', '2108', '5760', '2');  -- Wool Slops
INSERT INTO `guild_item_points` VALUES ('4', '12906', '4', '2448', '5760', '2');  -- Wool Slops +1
INSERT INTO `guild_item_points` VALUES ('4', '12467', '4', '4160', '6560', '3');  -- Wool Cap
INSERT INTO `guild_item_points` VALUES ('4', '12541', '4', '4960', '6560', '3');  -- Wool Cap +1
INSERT INTO `guild_item_points` VALUES ('4', '12602', '4', '2584', '6000', '4');  -- Wool Robe
INSERT INTO `guild_item_points` VALUES ('4', '12627', '4', '2584', '6000', '4');  -- Wool Robe +1
INSERT INTO `guild_item_points` VALUES ('4', '13085', '4', '180', '2800', '5');   -- Hemp Gorget
INSERT INTO `guild_item_points` VALUES ('4', '13068', '4', '320', '2800', '5');   -- Hemp Gorget +1
INSERT INTO `guild_item_points` VALUES ('4', '12851', '4', '4800', '6720', '6');  -- Wool Hose
INSERT INTO `guild_item_points` VALUES ('4', '12907', '4', '4880', '6720', '6');  -- Wool Hose +1
INSERT INTO `guild_item_points` VALUES ('4', '12730', '4', '1462', '5200', '7');  -- Wool Cuffs
INSERT INTO `guild_item_points` VALUES ('4', '12782', '4', '1802', '5200', '7');  -- Wool Cuffs +1

-- Journeyman
INSERT INTO `guild_item_points` VALUES ('4', '12739', '5', '2550', '6080', '0');  -- Black Mitts
INSERT INTO `guild_item_points` VALUES ('4', '12794', '5', '2805', '6080', '0');  -- Mage's Mitts
INSERT INTO `guild_item_points` VALUES ('4', '12603', '5', '4256', '6640', '1');  -- Velvet Robe
INSERT INTO `guild_item_points` VALUES ('4', '13726', '5', '4816', '6640', '1');  -- Mage's Robe
INSERT INTO `guild_item_points` VALUES ('4', '13568', '5', '250', '3200', '2');   -- Scarlet Ribbon
INSERT INTO `guild_item_points` VALUES ('4', '13833', '5', '350', '3200', '2');   -- Noble's Ribbon
INSERT INTO `guild_item_points` VALUES ('4', '13586', '5', '2178', '5840', '3');  -- Red Cape
INSERT INTO `guild_item_points` VALUES ('4', '13611', '5', '2838', '5840', '3');  -- Red Cape +1
INSERT INTO `guild_item_points` VALUES ('4', '12865', '5', '1150', '4880', '4');  -- Black Slacks
INSERT INTO `guild_item_points` VALUES ('4', '12917', '5', '1342', '4880', '4');  -- Mage's Slacks
INSERT INTO `guild_item_points` VALUES ('4', '13577', '5', '1386', '5200', '5');  -- Black Cape
INSERT INTO `guild_item_points` VALUES ('4', '13610', '5', '1806', '5200', '5');  -- Black Cape +1
INSERT INTO `guild_item_points` VALUES ('4', '13750', '5', '2508', '6000', '6');  -- Linen Doublet
INSERT INTO `guild_item_points` VALUES ('4', '13751', '5', '2552', '6000', '6');  -- Linen Doublet +1
INSERT INTO `guild_item_points` VALUES ('4', '13205', '5', '613', '4080', '7');   -- Silver Obi
INSERT INTO `guild_item_points` VALUES ('4', '13224', '5', '824', '4080', '7');   -- Silver Obi +1

-- Craftsman
INSERT INTO `guild_item_points` VALUES ('4', '12604', '6', '7030', '7120', '0');  -- Silk Coat
INSERT INTO `guild_item_points` VALUES ('4', '12652', '6', '7030', '7120', '0');  -- Silk Coat +1
INSERT INTO `guild_item_points` VALUES ('4', '12503', '6', '2280', '5920', '1');  -- Silk Headband
INSERT INTO `guild_item_points` VALUES ('4', '13851', '6', '2375', '5920', '1');  -- Silk Headband +1
INSERT INTO `guild_item_points` VALUES ('4', '12867', '6', '5100', '6800', '2');  -- White Slacks
INSERT INTO `guild_item_points` VALUES ('4', '12926', '6', '5950', '6800', '2');  -- White Slacks +1
INSERT INTO `guild_item_points` VALUES ('4', '13752', '6', '4992', '6800', '3');  -- Wool Doublet
INSERT INTO `guild_item_points` VALUES ('4', '13753', '6', '5632', '6800', '3');  -- Wool Doublet +1
INSERT INTO `guild_item_points` VALUES ('4', '13590', '6', '2025', '5760', '4');  -- Green Ribbon
INSERT INTO `guild_item_points` VALUES ('4', '13854', '6', '2137', '5760', '4');  -- Green Ribbon +1
INSERT INTO `guild_item_points` VALUES ('4', '12611', '6', '7200', '7200', '5');  -- White Cloak
INSERT INTO `guild_item_points` VALUES ('4', '12651', '6', '7200', '7200', '5');  -- White Cloak +1
INSERT INTO `guild_item_points` VALUES ('4', '12860', '6', '5735', '6960', '6');  -- Silk Slops
INSERT INTO `guild_item_points` VALUES ('4', '12927', '6', '6660', '6960', '6');  -- Silk Slops +1
INSERT INTO `guild_item_points` VALUES ('4', '12731', '6', '2408', '6000', '7');  -- Velvet Cuffs
INSERT INTO `guild_item_points` VALUES ('4', '12793', '6', '2968', '6000', '7');  -- Mage's Cuffs

-- Artisan
INSERT INTO `guild_item_points` VALUES ('4', '12468', '7', '3055', '6320', '0');  -- Green Beret
INSERT INTO `guild_item_points` VALUES ('4', '13866', '7', '3250', '6320', '0');  -- Green Beret +1
INSERT INTO `guild_item_points` VALUES ('4', '12612', '7', '6375', '7040', '1');  -- Silk Cloak
INSERT INTO `guild_item_points` VALUES ('4', '13777', '7', '6500', '7040', '1');  -- Silk Cloak +1
INSERT INTO `guild_item_points` VALUES ('4', '12972', '7', '3382', '6400', '2');  -- Shinobi Kyahan
INSERT INTO `guild_item_points` VALUES ('4', '14082', '7', '4207', '6400', '2');  -- Shinobi Kyahan +1
INSERT INTO `guild_item_points` VALUES ('4', '12716', '7', '3630', '6480', '3');  -- Shinobi Tekko
INSERT INTO `guild_item_points` VALUES ('4', '13955', '7', '4455', '6480', '3');  -- Shinobi Tekko +1
INSERT INTO `guild_item_points` VALUES ('4', '13579', '7', '3217', '6320', '4');  -- Jester's Cape
INSERT INTO `guild_item_points` VALUES ('4', '13620', '7', '4192', '6320', '4');  -- Jester's Cape +1
INSERT INTO `guild_item_points` VALUES ('4', '12740', '7', '4830', '6800', '5');  -- Silk Mitts
INSERT INTO `guild_item_points` VALUES ('4', '14000', '7', '5980', '6800', '5');  -- Silk Mitts +1
INSERT INTO `guild_item_points` VALUES ('4', '12844', '7', '3465', '6400', '6');  -- Shinobi Hakama
INSERT INTO `guild_item_points` VALUES ('4', '12925', '7', '3541', '6400', '6');  -- Shinobi Hakama +1
INSERT INTO `guild_item_points` VALUES ('4', '12716', '7', '3630', '6480', '7');  -- Shinobi Tekko
INSERT INTO `guild_item_points` VALUES ('4', '13955', '7', '4455', '6480', '7');  -- Shinobi Tekko +1

-- Adept
INSERT INTO `guild_item_points` VALUES ('4', '14023', '8', '3225', '6400', '0');  -- Arhat's Tekko
INSERT INTO `guild_item_points` VALUES ('4', '14028', '8', '3225', '6400', '0');  -- Arhat's Tekko +1
INSERT INTO `guild_item_points` VALUES ('4', '13208', '8', '3840', '6560', '1');  -- Rainbow Obi
INSERT INTO `guild_item_points` VALUES ('4', '13235', '8', '5040', '6560', '1');  -- Prism Obi
INSERT INTO `guild_item_points` VALUES ('4', '12861', '8', '7200', '7200', '2');  -- Noble's Slacks
INSERT INTO `guild_item_points` VALUES ('4', '14239', '8', '7200', '7200', '2');  -- Aristocrat's Slacks
INSERT INTO `guild_item_points` VALUES ('4', '12504', '8', '5300', '6880', '3');  -- Rainbow Headband
INSERT INTO `guild_item_points` VALUES ('4', '13858', '8', '5962', '6880', '3');  -- Prism Headband
INSERT INTO `guild_item_points` VALUES ('4', '12733', '8', '5590', '6880', '4');  -- Noble's Mitts
INSERT INTO `guild_item_points` VALUES ('4', '13999', '8', '6880', '6880', '4');  -- Aristocrat's Mitts
INSERT INTO `guild_item_points` VALUES ('4', '14129', '8', '3762', '6560', '5');  -- Arhat's Sune-Ate
INSERT INTO `guild_item_points` VALUES ('4', '14136', '8', '3762', '6560', '5');  -- Arhat's Sune-Ate +1
INSERT INTO `guild_item_points` VALUES ('4', '14253', '8', '4300', '6640', '6');  -- Arhat's Hakama
INSERT INTO `guild_item_points` VALUES ('4', '14256', '8', '4837', '6640', '6');  -- Arhat's Hakama +1
INSERT INTO `guild_item_points` VALUES ('4', '13881', '8', '3225', '6400', '7');  -- Arhat's Jinpachi
INSERT INTO `guild_item_points` VALUES ('4', '13886', '8', '3225', '6400', '7');  -- Arhat's Jinpachi +1

-- Veteran
INSERT INTO `guild_item_points` VALUES ('4', '14819', '9', '7520', '7520', '0');  -- Rasetsu Tekko
INSERT INTO `guild_item_points` VALUES ('4', '14820', '9', '7520', '7520', '0');  -- Rasetsu Tekko +1
INSERT INTO `guild_item_points` VALUES ('4', '14299', '9', '7440', '7440', '1');  -- Rasetsu Hakama
INSERT INTO `guild_item_points` VALUES ('4', '14300', '9', '7440', '7440', '1');  -- Rasetsu Hakama +1
INSERT INTO `guild_item_points` VALUES ('4', '13212', '9', '3600', '6480', '2');  -- Tarutaru Sash
INSERT INTO `guild_item_points` VALUES ('4', '13188', '9', '3600', '6480', '2');  -- Star Sash
INSERT INTO `guild_item_points` VALUES ('4', '14301', '9', '3750', '6560', '3');  -- Errant Slops
INSERT INTO `guild_item_points` VALUES ('4', '14302', '9', '5000', '6560', '3');  -- Mahatma Slops
INSERT INTO `guild_item_points` VALUES ('4', '13929', '9', '4500', '6720', '4');  -- Errant Hat
INSERT INTO `guild_item_points` VALUES ('4', '13930', '9', '5750', '6720', '4');  -- Mahatma Hat
INSERT INTO `guild_item_points` VALUES ('4', '14178', '9', '7440', '7440', '5');  -- Rasetsu Sune-Ate
INSERT INTO `guild_item_points` VALUES ('4', '14179', '9', '7440', '7440', '5');  -- Rasetsu Sune-Ate +1
INSERT INTO `guild_item_points` VALUES ('4', '14078', '9', '6875', '7120', '6');  -- Errant Cuffs
INSERT INTO `guild_item_points` VALUES ('4', '14079', '9', '6875', '7120', '6');  -- Mahatma Cuffs
INSERT INTO `guild_item_points` VALUES ('4', '13925', '9', '7520', '7520', '7');  -- Rasetsu Jinpachi
INSERT INTO `guild_item_points` VALUES ('4', '13926', '9', '7520', '7520', '7');  -- Rasetsu Jinpachi +1

-- ----------------------------
-- Leathercraft
-- ----------------------------
-- Amateur
INSERT INTO `guild_item_points` VALUES ('5', '12568', '0', '92', '1600', '0');    -- Leather Vest
INSERT INTO `guild_item_points` VALUES ('5', '12599', '0', '244', '1600', '0');   -- Leather Vest +1
INSERT INTO `guild_item_points` VALUES ('5', '12696', '0', '90', '1600', '1');    -- Leather Gloves
INSERT INTO `guild_item_points` VALUES ('5', '12784', '0', '90', '1600', '1');    -- Leather Gloves +1
INSERT INTO `guild_item_points` VALUES ('5', '14068', '0', '63', '1440', '2');    -- Vagabond's Gloves
INSERT INTO `guild_item_points` VALUES ('5', '14069', '0', '71', '1440', '2');    -- Nomad's Gloves
INSERT INTO `guild_item_points` VALUES ('5', '12952', '0', '84', '1520', '3');    -- Leather Highboots
INSERT INTO `guild_item_points` VALUES ('5', '12971', '0', '104', '1520', '3');   -- Leather Highboots +1
INSERT INTO `guild_item_points` VALUES ('5', '12440', '0', '52', '1360', '4');    -- Leather Bandana
INSERT INTO `guild_item_points` VALUES ('5', '12542', '0', '130', '1360', '4');   -- Leather Bandana +1
INSERT INTO `guild_item_points` VALUES ('5', '13594', '0', '44', '1360', '5');    -- Rabbit Mantle
INSERT INTO `guild_item_points` VALUES ('5', '13599', '0', '56', '1360', '5');    -- Rabbit Mantle +1
INSERT INTO `guild_item_points` VALUES ('5', '14169', '0', '63', '1440', '6');    -- Vagabond's Boots
INSERT INTO `guild_item_points` VALUES ('5', '14170', '0', '71', '1440', '6');    -- Nomad's Boots
INSERT INTO `guild_item_points` VALUES ('5', '16385', '0', '24', '1200', '7');    -- Cesti
INSERT INTO `guild_item_points` VALUES ('5', '16690', '0', '24', '1200', '7');    -- Cesti +1

-- Recruit
INSERT INTO `guild_item_points` VALUES ('5', '12992', '1', '121', '2000', '0');   -- Solea
INSERT INTO `guild_item_points` VALUES ('5', '13037', '1', '152', '2000', '0');   -- Solea +1
INSERT INTO `guild_item_points` VALUES ('5', '12441', '1', '177', '2240', '1');   -- Lizard Helm
INSERT INTO `guild_item_points` VALUES ('5', '12480', '1', '177', '2240', '1');   -- Lizard Helm +1
INSERT INTO `guild_item_points` VALUES ('5', '13192', '1', '85', '1840', '2');    -- Leather Belt
INSERT INTO `guild_item_points` VALUES ('5', '13210', '1', '85', '1840', '2');    -- Leather Belt +1
INSERT INTO `guild_item_points` VALUES ('5', '16386', '1', '252', '2560', '3');   -- Lizard Cesti
INSERT INTO `guild_item_points` VALUES ('5', '16398', '1', '333', '2560', '3');   -- Burning Cesti
INSERT INTO `guild_item_points` VALUES ('5', '13592', '1', '81', '1760', '4');    -- Lizard Mantle
INSERT INTO `guild_item_points` VALUES ('5', '13608', '1', '95', '1760', '4');    -- Lizard Mantle +1
INSERT INTO `guild_item_points` VALUES ('5', '14171', '1', '180', '2240', '5');   -- Fisherman's Boots
INSERT INTO `guild_item_points` VALUES ('5', '14172', '1', '519', '2240', '5');   -- Angler's Boots
INSERT INTO `guild_item_points` VALUES ('5', '12569', '1', '245', '2480', '6');   -- Lizard Jerkin
INSERT INTO `guild_item_points` VALUES ('5', '13697', '1', '259', '2480', '6');   -- Fine Jerkin
INSERT INTO `guild_item_points` VALUES ('5', '14070', '1', '360', '2880', '7');   -- Fisherman's Gloves
INSERT INTO `guild_item_points` VALUES ('5', '14071', '1', '986', '2880', '7');   -- Angler's Gloves

-- Initiate
INSERT INTO `guild_item_points` VALUES ('5', '12442', '2', '1102', '4640', '0');  -- Studded Bandana
INSERT INTO `guild_item_points` VALUES ('5', '13824', '2', '1140', '4640', '0');  -- Strong Bandana
INSERT INTO `guild_item_points` VALUES ('5', '12698', '2', '1710', '5360', '1');  -- Studded Gloves
INSERT INTO `guild_item_points` VALUES ('5', '12786', '2', '2090', '5360', '1');  -- Strong Gloves
INSERT INTO `guild_item_points` VALUES ('5', '14072', '2', '519', '3520', '2');   -- Chocobo Gloves
INSERT INTO `guild_item_points` VALUES ('5', '14073', '2', '570', '3520', '2');   -- Rider's Gloves
INSERT INTO `guild_item_points` VALUES ('5', '13588', '2', '552', '3600', '3');   -- Dhalmel Mantle
INSERT INTO `guild_item_points` VALUES ('5', '13600', '2', '706', '3600', '3');   -- Dhalmel Mantle +1
INSERT INTO `guild_item_points` VALUES ('5', '13194', '2', '330', '2960', '4');   -- Warrior's Belt
INSERT INTO `guild_item_points` VALUES ('5', '13240', '2', '400', '2960', '4');   -- Warrior's Belt +1
INSERT INTO `guild_item_points` VALUES ('5', '14173', '2', '519', '3520', '5');   -- Chocobo Boots
INSERT INTO `guild_item_points` VALUES ('5', '14174', '2', '579', '3520', '5');   -- Rider's Boots
INSERT INTO `guild_item_points` VALUES ('5', '12993', '2', '748', '4000', '6');   -- Sandals
INSERT INTO `guild_item_points` VALUES ('5', '13048', '2', '939', '4000', '6');   -- Mage's Sandals
INSERT INTO `guild_item_points` VALUES ('5', '13469', '2', '250', '2720', '7');   -- Leather Ring
INSERT INTO `guild_item_points` VALUES ('5', '13499', '2', '350', '2720', '7');   -- Leather Ring +1

-- Novice
INSERT INTO `guild_item_points` VALUES ('5', '15312', '3', '1305', '4960', '0');  -- Mist Pumps
INSERT INTO `guild_item_points` VALUES ('5', '13089', '3', '608', '3840', '1');   -- Wolf Gorget
INSERT INTO `guild_item_points` VALUES ('5', '13070', '3', '684', '3840', '1');   -- Wolf Gorget +1
INSERT INTO `guild_item_points` VALUES ('5', '13571', '3', '1224', '4880', '2');  -- Wolf Mantle
INSERT INTO `guild_item_points` VALUES ('5', '13609', '3', '1564', '4880', '2');  -- Wolf Mantle +1
INSERT INTO `guild_item_points` VALUES ('5', '13069', '3', '86', '2160', '3');    -- Leather Gorget +1
INSERT INTO `guild_item_points` VALUES ('5', '13081', '3', '66', '2160', '3');    -- Leather Gorget
INSERT INTO `guild_item_points` VALUES ('5', '12994', '3', '1104', '4720', '4');  -- Shoes
INSERT INTO `guild_item_points` VALUES ('5', '13040', '3', '1196', '4720', '4');  -- Shoes +1
INSERT INTO `guild_item_points` VALUES ('5', '13195', '3', '506', '3600', '5');   -- Magic Belt
INSERT INTO `guild_item_points` VALUES ('5', '13219', '3', '660', '3600', '5');   -- Magic Belt +1
INSERT INTO `guild_item_points` VALUES ('5', '12699', '3', '1624', '5280', '6');  -- Cuir Gloves
INSERT INTO `guild_item_points` VALUES ('5', '12787', '3', '1680', '5280', '6');  -- Cuir Gloves +1
INSERT INTO `guild_item_points` VALUES ('5', '12570', '3', '2280', '5840', '7');  -- Studded Vest
INSERT INTO `guild_item_points` VALUES ('5', '13707', '3', '2318', '5840', '7');  -- Strong Vest

-- Apprentice
INSERT INTO `guild_item_points` VALUES ('5', '13271', '4', '3250', '6320', '0');  -- Corsette
INSERT INTO `guild_item_points` VALUES ('5', '13272', '4', '3750', '6320', '0');  -- Corsette +1
INSERT INTO `guild_item_points` VALUES ('5', '13570', '4', '900', '4480', '1');   -- Ram Mantle
INSERT INTO `guild_item_points` VALUES ('5', '13575', '4', '1000', '4480', '1');  -- Ram Mantle +1
INSERT INTO `guild_item_points` VALUES ('5', '12955', '4', '1736', '5440', '2');  -- Cuir Highboots
INSERT INTO `guild_item_points` VALUES ('5', '13041', '4', '1792', '5440', '2');  -- Cuir Highboots +1
INSERT INTO `guild_item_points` VALUES ('5', '12571', '4', '1960', '5600', '3');  -- Cuir Bouilli
INSERT INTO `guild_item_points` VALUES ('5', '13709', '4', '2072', '5600', '3');  -- Cuir Bouilli +1
INSERT INTO `guild_item_points` VALUES ('5', '13200', '4', '1680', '5360', '4');  -- Waistbelt
INSERT INTO `guild_item_points` VALUES ('5', '13214', '4', '1740', '5360', '4');  -- Waistbelt +1
INSERT INTO `guild_item_points` VALUES ('5', '12827', '4', '1008', '4640', '5');  -- Cuir Trousers
INSERT INTO `guild_item_points` VALUES ('5', '12911', '4', '1232', '4640', '5');  -- Cuir Trousers +1
INSERT INTO `guild_item_points` VALUES ('5', '13810', '4', '1297', '5040', '6');  -- Chocobo Jack Coat
INSERT INTO `guild_item_points` VALUES ('5', '13811', '4', '1349', '5040', '6');  -- Rider's Jack Coat
INSERT INTO `guild_item_points` VALUES ('5', '13203', '4', '262', '3760', '7');   -- Barbarian's Belt
INSERT INTO `guild_item_points` VALUES ('5', '13225', '4', '660', '3760', '7');   -- Brave Belt

-- Journeyman
INSERT INTO `guild_item_points` VALUES ('5', '12444', '5', '2240', '5840', '0');  -- Raptor Helm
INSERT INTO `guild_item_points` VALUES ('5', '13835', '5', '2400', '5840', '0');  -- Dino Helm
INSERT INTO `guild_item_points` VALUES ('5', '12700', '5', '3600', '6400', '1');  -- Raptor Gloves
INSERT INTO `guild_item_points` VALUES ('5', '12795', '5', '360', '6400', '1');   -- Dino Gloves
INSERT INTO `guild_item_points` VALUES ('5', '16388', '5', '1140', '4880', '2');  -- Himantes
INSERT INTO `guild_item_points` VALUES ('5', '16699', '5', '1200', '4880', '2');  -- Himantes +1
INSERT INTO `guild_item_points` VALUES ('5', '12956', '5', '3360', '6320', '3');  -- Raptor Ledelsens
INSERT INTO `guild_item_points` VALUES ('5', '13049', '5', '4160', '6320', '3');  -- Dino Ledelsens
INSERT INTO `guild_item_points` VALUES ('5', '13593', '5', '1280', '5040', '4');  -- Raptor Mantle
INSERT INTO `guild_item_points` VALUES ('5', '13612', '5', '1440', '5040', '4');  -- Dino Mantle
INSERT INTO `guild_item_points` VALUES ('5', '12828', '5', '5200', '6800', '5');  -- Raptor Trousers
INSERT INTO `guild_item_points` VALUES ('5', '12919', '5', '5360', '6800', '5');  -- Dino Trousers
INSERT INTO `guild_item_points` VALUES ('5', '14166', '5', '1000', '4720', '6');  -- Desert Boots
INSERT INTO `guild_item_points` VALUES ('5', '14167', '5', '2000', '4720', '6');  -- Desert Boots +1
INSERT INTO `guild_item_points` VALUES ('5', '12294', '5', '1280', '5040', '7');  -- Leather Shield
INSERT INTO `guild_item_points` VALUES ('5', '12329', '5', '1360', '5040', '7');  -- Leather Shield +1

-- Craftsman
INSERT INTO `guild_item_points` VALUES ('5', '13698', '6', '2687', '6080', '0');  -- Beak Helm
INSERT INTO `guild_item_points` VALUES ('5', '13701', '6', '2795', '6080', '0');  -- Beak Helm +1
INSERT INTO `guild_item_points` VALUES ('5', '13700', '6', '3440', '6400', '1');  -- Beak Gloves
INSERT INTO `guild_item_points` VALUES ('5', '13960', '6', '3547', '6400', '1');  -- Beak Gloves +1
INSERT INTO `guild_item_points` VALUES ('5', '13597', '6', '1612', '5440', '2');  -- Beak Mantle
INSERT INTO `guild_item_points` VALUES ('5', '13621', '6', '1720', '5440', '2');  -- Beak Mantle +1
INSERT INTO `guild_item_points` VALUES ('5', '12980', '6', '3300', '6320', '3');  -- Battle Boots
INSERT INTO `guild_item_points` VALUES ('5', '14104', '6', '3410', '6320', '3');  -- Battle Boots +1
INSERT INTO `guild_item_points` VALUES ('5', '12829', '6', '3225', '6320', '4');  -- Beak Trousers
INSERT INTO `guild_item_points` VALUES ('5', '14213', '6', '3332', '6320', '4');  -- Beak Trousers +1
INSERT INTO `guild_item_points` VALUES ('5', '13702', '6', '4515', '6720', '5');  -- Beak Ledelsens
INSERT INTO `guild_item_points` VALUES ('5', '14088', '6', '4622', '6720', '5');  -- Beak Ledelsens +1
INSERT INTO `guild_item_points` VALUES ('5', '13699', '6', '2150', '5840', '6');  -- Beak Jerkin
INSERT INTO `guild_item_points` VALUES ('5', '13739', '6', '2257', '5840', '6');  -- Beak Jerkin +1
INSERT INTO `guild_item_points` VALUES ('5', '13546', '6', '770', '4400', '7');   -- Hard Leather Ring
INSERT INTO `guild_item_points` VALUES ('5', '13547', '6', '8800', '4400', '7');  -- Tiger Ring

-- Artisan
INSERT INTO `guild_item_points` VALUES ('5', '12996', '7', '4485', '6720', '0');  -- Silk Pumps
INSERT INTO `guild_item_points` VALUES ('5', '14115', '7', '4485', '6270', '0');  -- Silk Pumps +1
INSERT INTO `guild_item_points` VALUES ('5', '12702', '7', '1912', '5680', '1');  -- Tiger Gloves
INSERT INTO `guild_item_points` VALUES ('5', '13992', '7', '1912', '5680', '1');  -- Feral Gloves
INSERT INTO `guild_item_points` VALUES ('5', '16389', '7', '1980', '5760', '2');  -- Coeurl Cesti
INSERT INTO `guild_item_points` VALUES ('5', '17473', '7', '2070', '5760', '2');  -- Torama Cesti
INSERT INTO `guild_item_points` VALUES ('5', '13589', '7', '1250', '5120', '3');  -- Tiger Mantle
INSERT INTO `guild_item_points` VALUES ('5', '13602', '7', '1375', '5120', '3');  -- Feral Mantle
INSERT INTO `guild_item_points` VALUES ('5', '12852', '7', '3680', '6480', '4');  -- Battle Hose
INSERT INTO `guild_item_points` VALUES ('5', '14237', '7', '3680', '6480', '4');  -- Battle Hose +1
INSERT INTO `guild_item_points` VALUES ('5', '12830', '7', '2040', '5760', '5');  -- Tiger Trousers
INSERT INTO `guild_item_points` VALUES ('5', '14232', '7', '2160', '5760', '5');  -- Feral Trousers
INSERT INTO `guild_item_points` VALUES ('5', '13641', '7', '2200', '5840', '6');  -- Black Mantle
INSERT INTO `guild_item_points` VALUES ('5', '13642', '7', '3300', '5840', '6');  -- Black Mantle +1
INSERT INTO `guild_item_points` VALUES ('5', '13198', '7', '2178', '5840', '7');  -- Swordbelt
INSERT INTO `guild_item_points` VALUES ('5', '13232', '7', '2838', '5840', '7');  -- Swordbelt +1

-- Adept
INSERT INTO `guild_item_points` VALUES ('5', '13705', '8', '4560', '6720', '0');  -- Ogre Jerkin
INSERT INTO `guild_item_points` VALUES ('5', '14366', '8', '5760', '6720', '0');  -- Ogre Jerkin +1
INSERT INTO `guild_item_points` VALUES ('5', '13704', '8', '4200', '6640', '1');  -- Ogre Mask
INSERT INTO `guild_item_points` VALUES ('5', '13907', '8', '5400', '6640', '1');  -- Ogre Mask +1
INSERT INTO `guild_item_points` VALUES ('5', '13595', '8', '2100', '5840', '2');  -- Coeurl Mantle
INSERT INTO `guild_item_points` VALUES ('5', '13603', '8', '2800', '5840', '2');  -- Torama Mantle
INSERT INTO `guild_item_points` VALUES ('5', '13197', '8', '4785', '6800', '3');  -- Koenigs Belt
INSERT INTO `guild_item_points` VALUES ('5', '13239', '8', '6235', '6800', '3');  -- Kaiser Belt
INSERT INTO `guild_item_points` VALUES ('5', '13708', '8', '5040', '6800', '4');  -- Ogre Ledelsens
INSERT INTO `guild_item_points` VALUES ('5', '14159', '8', '5040', '6800', '4');  -- Ogre Ledelsens +1
INSERT INTO `guild_item_points` VALUES ('5', '12447', '8', '3500', '6480', '5');  -- Coeurl Mask
INSERT INTO `guild_item_points` VALUES ('5', '13862', '8', '4200', '6480', '5');  -- Torama Mask
INSERT INTO `guild_item_points` VALUES ('5', '13706', '8', '3600', '6480', '6');  -- Ogre Gloves
INSERT INTO `guild_item_points` VALUES ('5', '14057', '8', '3600', '6480', '6');  -- Ogre Gloves +1
INSERT INTO `guild_item_points` VALUES ('5', '12880', '8', '4800', '6800', '7');  -- Ogre Trousers
INSERT INTO `guild_item_points` VALUES ('5', '14279', '8', '6000', '6800', '7');  -- Ogre Trousers +1

-- Veteran
INSERT INTO `guild_item_points` VALUES ('5', '15307', '9', '6492', '7040', '0');  -- Bison Gamashes
INSERT INTO `guild_item_points` VALUES ('5', '15308', '9', '7040', '7040', '0');  -- Brave's Gamashes
INSERT INTO `guild_item_points` VALUES ('5', '14319', '9', '6247', '7040', '1');  -- Bison Kecks
INSERT INTO `guild_item_points` VALUES ('5', '14320', '9', '6247', '7040', '1');  -- Brave's Kecks
INSERT INTO `guild_item_points` VALUES ('5', '14372', '9', '4800', '6800', '2');  -- Cardinal Vest
INSERT INTO `guild_item_points` VALUES ('5', '14373', '9', '6000', '6800', '2');  -- Bachelor Vest
INSERT INTO `guild_item_points` VALUES ('5', '14850', '9', '4042', '6640', '3');  -- Bison Wristbands
INSERT INTO `guild_item_points` VALUES ('5', '14851', '9', '4042', '6640', '3');  -- Brave's Wristbands
INSERT INTO `guild_item_points` VALUES ('5', '13918', '9', '1080', '5040', '4');  -- Tiger Mask
INSERT INTO `guild_item_points` VALUES ('5', '13919', '9', '1080', '5040', '4');  -- Feral Mask
INSERT INTO `guild_item_points` VALUES ('5', '14317', '9', '6737', '7120', '5');  -- Barone Cosciales
INSERT INTO `guild_item_points` VALUES ('5', '14318', '9', '6737', '7120', '5');  -- Conte Cosciales
INSERT INTO `guild_item_points` VALUES ('5', '13918', '9', '1080', '5040', '6');  -- Tiger Mask
INSERT INTO `guild_item_points` VALUES ('5', '13919', '9', '1080', '5040', '6');  -- Feral Mask
INSERT INTO `guild_item_points` VALUES ('5', '14182', '9', '2500', '6080', '7');  -- Errant Pigaches
INSERT INTO `guild_item_points` VALUES ('5', '14183', '9', '2500', '6080', '7');  -- Mahatma Pigaches

-- ----------------------------
-- Bonecraft
-- ----------------------------
-- Amateur
INSERT INTO `guild_item_points` VALUES ('6', '12505', '0', '112', '1680', '0');   -- Bone Hairpin
INSERT INTO `guild_item_points` VALUES ('6', '13825', '0', '187', '1680', '0');   -- Bone Hairpin +1
INSERT INTO `guild_item_points` VALUES ('6', '13442', '0', '151', '1920', '1');   -- Shell Ring
INSERT INTO `guild_item_points` VALUES ('6', '13494', '0', '212', '1920', '1');   -- Shell Ring +1
INSERT INTO `guild_item_points` VALUES ('6', '12505', '0', '112', '1680', '2');   -- Bone Hairpin
INSERT INTO `guild_item_points` VALUES ('6', '13825', '0', '187', '1680', '2');   -- Bone Hairpin +1
INSERT INTO `guild_item_points` VALUES ('6', '13313', '0', '151', '1920', '3');   -- Shell Earring
INSERT INTO `guild_item_points` VALUES ('6', '13314', '0', '212', '1920', '3');   -- Shell Earring +1
INSERT INTO `guild_item_points` VALUES ('6', '13442', '0', '151', '1920', '4');   -- Shell Ring
INSERT INTO `guild_item_points` VALUES ('6', '13494', '0', '212', '1920', '4');   -- Shell Ring +1
INSERT INTO `guild_item_points` VALUES ('6', '16405', '0', '29', '1280', '5');    -- Cat Baghnakhs
INSERT INTO `guild_item_points` VALUES ('6', '17476', '0', '35', '1280', '5');    -- Cat Baghnakhs +1
INSERT INTO `guild_item_points` VALUES ('6', '16405', '0', '29', '1280', '6');    -- Cat Baghnakhs
INSERT INTO `guild_item_points` VALUES ('6', '17476', '0', '35', '1280', '6');    -- Cat Baghnakhs +1
INSERT INTO `guild_item_points` VALUES ('6', '13313', '0', '151', '1920', '7');   -- Shell Earring
INSERT INTO `guild_item_points` VALUES ('6', '13314', '0', '212', '1920', '7');   -- Shell Earring +1

-- Recruit
INSERT INTO `guild_item_points` VALUES ('6', '12710', '1', '544', '3440', '0');   -- Bone Mittens
INSERT INTO `guild_item_points` VALUES ('6', '12788', '1', '664', '3440', '0');   -- Bone Mittens +1
INSERT INTO `guild_item_points` VALUES ('6', '12454', '1', '652', '3760', '1');   -- Bone Mask
INSERT INTO `guild_item_points` VALUES ('6', '13826', '1', '773', '3760', '1');   -- Bone Mask +1
INSERT INTO `guild_item_points` VALUES ('6', '13076', '1', '141', '2080', '2');   -- Fang Necklace
INSERT INTO `guild_item_points` VALUES ('6', '13061', '1', '235', '2080', '2');   -- Spike Necklace
INSERT INTO `guild_item_points` VALUES ('6', '12454', '1', '652', '3760', '3');   -- Bone Mask
INSERT INTO `guild_item_points` VALUES ('6', '13826', '1', '773', '3760', '3');   -- Bone Mask +1
INSERT INTO `guild_item_points` VALUES ('6', '13076', '1', '141', '2080', '4');   -- Fang Necklace
INSERT INTO `guild_item_points` VALUES ('6', '13061', '1', '235', '2080', '4');   -- Spike Necklace
INSERT INTO `guild_item_points` VALUES ('6', '13441', '1', '302', '2720', '5');   -- Bone Ring
INSERT INTO `guild_item_points` VALUES ('6', '13500', '1', '423', '2720', '5');   -- Bone Ring +1
INSERT INTO `guild_item_points` VALUES ('6', '12710', '1', '544', '3440', '6');   -- Bone Mittens
INSERT INTO `guild_item_points` VALUES ('6', '12788', '1', '664', '3440', '6');   -- Bone Mittens +1
INSERT INTO `guild_item_points` VALUES ('6', '13321', '1', '302', '2720', '7');   -- Bone Earring
INSERT INTO `guild_item_points` VALUES ('6', '13362', '1', '423', '2720', '7');   -- Bone Earring +1

-- Initiate
INSERT INTO `guild_item_points` VALUES ('6', '12582', '2', '362', '3040', '0');   -- Bone Harness
INSERT INTO `guild_item_points` VALUES ('6', '13716', '2', '374', '3040', '0');   -- Bone Harness +1
INSERT INTO `guild_item_points` VALUES ('6', '12507', '2', '950', '4400', '1');   -- Horn Hairpin
INSERT INTO `guild_item_points` VALUES ('6', '13828', '2', '988', '4400', '1');   -- Horn Hairpin +1
INSERT INTO `guild_item_points` VALUES ('6', '12966', '2', '495', '3440', '2');   -- Bone Leggings
INSERT INTO `guild_item_points` VALUES ('6', '13042', '2', '616', '3440', '2');   -- Bone Leggings +1
INSERT INTO `guild_item_points` VALUES ('6', '17351', '2', '860', '4240', '3');   -- Gemshorn
INSERT INTO `guild_item_points` VALUES ('6', '17370', '2', '1032', '4240', '3');  -- Gemshorn +1
INSERT INTO `guild_item_points` VALUES ('6', '16649', '2', '362', '3040', '4');   -- Bone Pick
INSERT INTO `guild_item_points` VALUES ('6', '16668', '2', '374', '3040', '4');   -- Bone Pick +1
INSERT INTO `guild_item_points` VALUES ('6', '12834', '2', '362', '3040', '5');   -- Bone Subligar
INSERT INTO `guild_item_points` VALUES ('6', '12912', '2', '374', '3040', '5');   -- Bone Subligar +1
INSERT INTO `guild_item_points` VALUES ('6', '12711', '2', '282', '2800', '6');   -- Beetle Mittens
INSERT INTO `guild_item_points` VALUES ('6', '12789', '2', '306', '2800', '6');   -- Beetle Mittens +1
INSERT INTO `guild_item_points` VALUES ('6', '16642', '2', '205', '2560', '7');   -- Bone Axe
INSERT INTO `guild_item_points` VALUES ('6', '16666', '2', '1026', '2560', '7');  -- Bone Axe +1

-- Novice
INSERT INTO `guild_item_points` VALUES ('6', '13459', '3', '1200', '4800', '0');  -- Horn Ring
INSERT INTO `guild_item_points` VALUES ('6', '13502', '3', '1680', '4800', '0');  -- Horn Ring +1
INSERT INTO `guild_item_points` VALUES ('6', '17026', '3', '768', '4160', '1');   -- Bone Cudgel
INSERT INTO `guild_item_points` VALUES ('6', '17033', '3', '768', '4160', '1');   -- Bone Cudgel +1
INSERT INTO `guild_item_points` VALUES ('6', '12967', '3', '966', '4480', '2');   -- Beetle Leggings
INSERT INTO `guild_item_points` VALUES ('6', '13043', '3', '1202', '4480', '2');  -- Beetle Leggings +1
INSERT INTO `guild_item_points` VALUES ('6', '12583', '3', '471', '3520', '3');   -- Beetle Harness
INSERT INTO `guild_item_points` VALUES ('6', '13717', '3', '495', '3520', '3');   -- Beetle Harness +1
INSERT INTO `guild_item_points` VALUES ('6', '12835', '3', '471', '3520', '4');   -- Beetle Subligar
INSERT INTO `guild_item_points` VALUES ('6', '12913', '3', '495', '3520', '4');   -- Beetle Subligar +1
INSERT INTO `guild_item_points` VALUES ('6', '12413', '3', '1590', '3840', '5');  -- Turtle Shield +1
INSERT INTO `guild_item_points` VALUES ('6', '12414', '3', '615', '3840', '5');   -- Turtle Shield
INSERT INTO `guild_item_points` VALUES ('6', '15315', '3', '3797', '6480', '6');  -- Shade Leggings
INSERT INTO `guild_item_points` VALUES ('6', '15319', '3', '3989', '6480', '6');  -- Shade Leggings +1
INSERT INTO `guild_item_points` VALUES ('6', '13090', '3', '448', '4160', '7');   -- Beetle Gorget
INSERT INTO `guild_item_points` VALUES ('6', '13062', '3', '542', '4160', '7');   -- Green Gorget

-- Apprentice
INSERT INTO `guild_item_points` VALUES ('6', '17352', '4', '780', '4320', '0');   -- Horn
INSERT INTO `guild_item_points` VALUES ('6', '17371', '4', '840', '4320', '0');   -- Horn +1
INSERT INTO `guild_item_points` VALUES ('6', '12837', '4', '1540', '5280', '1');  -- Carapace Subligar
INSERT INTO `guild_item_points` VALUES ('6', '12914', '4', '1610', '5280', '1');  -- Carapace Subligar +1
INSERT INTO `guild_item_points` VALUES ('6', '13461', '4', '1812', '5520', '2');  -- Carapace Ring
INSERT INTO `guild_item_points` VALUES ('6', '13503', '4', '2537', '5520', '2');  -- Carapace Ring +1
INSERT INTO `guild_item_points` VALUES ('6', '13715', '4', '1470', '5200', '3');  -- Carapace Leggings
INSERT INTO `guild_item_points` VALUES ('6', '13044', '4', '1540', '5200', '3');  -- Carapace Leggings +1
INSERT INTO `guild_item_points` VALUES ('6', '13713', '4', '1050', '4720', '4');  -- Carapace Mittens
INSERT INTO `guild_item_points` VALUES ('6', '12790', '4', '1120', '4720', '4');  -- Carapace Mittens +1
INSERT INTO `guild_item_points` VALUES ('6', '13711', '4', '1050', '4720', '5');  -- Carapace Mask
INSERT INTO `guild_item_points` VALUES ('6', '13829', '4', '1120', '4720', '5');  -- Carapace Mask +1
INSERT INTO `guild_item_points` VALUES ('6', '13091', '4', '2310', '5840', '6');  -- Carapace Gorget
INSERT INTO `guild_item_points` VALUES ('6', '13063', '4', '3010', '5840', '6');  -- Blue Gorget
INSERT INTO `guild_item_points` VALUES ('6', '17610', '4', '750', '4240', '7');   -- Bone Knife
INSERT INTO `guild_item_points` VALUES ('6', '17611', '4', '825', '4240', '7');   -- Bone Knife +1

-- Journeyman
INSERT INTO `guild_item_points` VALUES ('6', '16794', '5', '825', '4480', '0');   -- Bone Scythe
INSERT INTO `guild_item_points` VALUES ('6', '16795', '5', '907', '4480', '0');   -- Bone Scythe +1
INSERT INTO `guild_item_points` VALUES ('6', '13199', '5', '26', '2400', '1');    -- Blood Stone
INSERT INTO `guild_item_points` VALUES ('6', '13226', '5', '26', '2400', '1');    -- Blood Stone +1
INSERT INTO `guild_item_points` VALUES ('6', '17257', '5', '2000', '5680', '2');  -- Bandit's Gun
INSERT INTO `guild_item_points` VALUES ('6', '17258', '5', '2100', '5680', '2');  -- Bandit's Gun +1
INSERT INTO `guild_item_points` VALUES ('6', '13324', '5', '1750', '5520', '3');  -- Tortoise Earring
INSERT INTO `guild_item_points` VALUES ('6', '13363', '5', '2450', '5520', '3');  -- Tortoise Earring +1
INSERT INTO `guild_item_points` VALUES ('6', '12506', '5', '750', '4320', '4');   -- Shell Hairpin
INSERT INTO `guild_item_points` VALUES ('6', '13836', '5', '850', '4320', '4');   -- Shell Hairpin +1
INSERT INTO `guild_item_points` VALUES ('6', '13981', '5', '3332', '6320', '5');  -- Turtle Bangles
INSERT INTO `guild_item_points` VALUES ('6', '13982', '5', '4107', '6320', '5');  -- Turtle Bangles +1
INSERT INTO `guild_item_points` VALUES ('6', '17612', '5', '1025', '4720', '6');  -- Beetle Knife
INSERT INTO `guild_item_points` VALUES ('6', '17613', '5', '1127', '4720', '6');  -- Beetle Knife +1
INSERT INTO `guild_item_points` VALUES ('6', '17062', '5', '1122', '4880', '7');  -- Bone Rod
INSERT INTO `guild_item_points` VALUES ('6', '17410', '5', '1782', '4880', '7');  -- Bone Rod +1

-- Craftsman
INSERT INTO `guild_item_points` VALUES ('6', '17361', '6', '1845', '5600', '0');  -- Crumhorn
INSERT INTO `guild_item_points` VALUES ('6', '17377', '6', '1947', '5600', '0');  -- Crumhorn +1
INSERT INTO `guild_item_points` VALUES ('6', '12838', '6', '1575', '5360', '1');  -- Scorpion Subligar
INSERT INTO `guild_item_points` VALUES ('6', '14208', '6', '1680', '5360', '1');  -- Scorpion Subligar +1
INSERT INTO `guild_item_points` VALUES ('6', '17259', '6', '4320', '6640', '2');  -- Pirate's Gun
INSERT INTO `guild_item_points` VALUES ('6', '17260', '6', '4352', '6640', '2');  -- Pirate's Gun +1
INSERT INTO `guild_item_points` VALUES ('6', '12963', '6', '1575', '5360', '3');  -- Scorpion Leggings
INSERT INTO `guild_item_points` VALUES ('6', '14083', '6', '1680', '5360', '3');  -- Scorpion Leggings +1
INSERT INTO `guild_item_points` VALUES ('6', '12707', '6', '1050', '4800', '4');  -- Scorpion Mittens
INSERT INTO `guild_item_points` VALUES ('6', '13956', '6', '1155', '4800', '4');  -- Scorpion Mittens +1
INSERT INTO `guild_item_points` VALUES ('6', '12451', '6', '1050', '4800', '5');  -- Scorpion Mask
INSERT INTO `guild_item_points` VALUES ('6', '12482', '6', '1155', '4800', '5');  -- Scorpion Mask +1
INSERT INTO `guild_item_points` VALUES ('6', '16420', '6', '1230', '5040', '6');  -- Bone Patas
INSERT INTO `guild_item_points` VALUES ('6', '17477', '6', '1332', '5040', '6');  -- Bone Patas +1
INSERT INTO `guild_item_points` VALUES ('6', '13325', '6', '2500', '6000', '7');  -- Fang Earring
INSERT INTO `guild_item_points` VALUES ('6', '13369', '6', '3500', '6000', '7');  -- Spike Earring

-- Artisan
INSERT INTO `guild_item_points` VALUES ('6', '12453', '7', '2992', '6240', '0');  -- Coral Cap
INSERT INTO `guild_item_points` VALUES ('6', '13864', '7', '3150', '6240', '0');  -- Merman's Cap
INSERT INTO `guild_item_points` VALUES ('6', '13108', '7', '1560', '5440', '1');  -- Coral Gorget
INSERT INTO `guild_item_points` VALUES ('6', '13123', '7', '1690', '5440', '1');  -- Merman's Gorget
INSERT INTO `guild_item_points` VALUES ('6', '12819', '7', '4375', '6640', '2');  -- Coral Cuisses
INSERT INTO `guild_item_points` VALUES ('6', '14230', '7', '4500', '6640', '2');  -- Coral Cuisses +1
INSERT INTO `guild_item_points` VALUES ('6', '12435', '7', '3000', '6240', '3');  -- Coral Visor
INSERT INTO `guild_item_points` VALUES ('6', '13859', '7', '3120', '6240', '3');  -- Coral Visor +1
INSERT INTO `guild_item_points` VALUES ('6', '12709', '7', '6412', '7040', '4');  -- Coral Mittens
INSERT INTO `guild_item_points` VALUES ('6', '13995', '7', '7040', '7040', '4');  -- Merman's Mittens
INSERT INTO `guild_item_points` VALUES ('6', '12508', '7', '3262', '6400', '5');  -- Coral Hairpin
INSERT INTO `guild_item_points` VALUES ('6', '13850', '7', '3375', '6400', '5');  -- Merman's Hairpin
INSERT INTO `guild_item_points` VALUES ('6', '16422', '7', '3625', '6480', '6');  -- Tigerfangs
INSERT INTO `guild_item_points` VALUES ('6', '17490', '7', '3770', '6480', '6');  -- Feral Fangs
INSERT INTO `guild_item_points` VALUES ('6', '16525', '7', '3840', '6560', '7');  -- Hornet Fleuret
INSERT INTO `guild_item_points` VALUES ('6', '17634', '7', '3840', '6560', '7');  -- Wasp Fleuret

-- Adept
INSERT INTO `guild_item_points` VALUES ('6', '12436', '8', '7200', '7200', '0');  -- Dragon Mask
INSERT INTO `guild_item_points` VALUES ('6', '13860', '8', '7200', '7200', '0');  -- Dragon Mask +1
INSERT INTO `guild_item_points` VALUES ('6', '13987', '8', '3600', '6480', '1');  -- Coral Bangles
INSERT INTO `guild_item_points` VALUES ('6', '13988', '8', '4162', '6480', '1');  -- Merman's Bangles
INSERT INTO `guild_item_points` VALUES ('6', '12820', '8', '7280', '7280', '2');  -- Dragon Cuisses
INSERT INTO `guild_item_points` VALUES ('6', '14231', '8', '7280', '7280', '2');  -- Dragon Cuisses +1
INSERT INTO `guild_item_points` VALUES ('6', '12948', '8', '6090', '6960', '3');  -- Dragon Greaves
INSERT INTO `guild_item_points` VALUES ('6', '14107', '8', '6380', '6960', '3');  -- Dragon Greaves +1
INSERT INTO `guild_item_points` VALUES ('6', '12692', '8', '6900', '7120', '4');  -- Dragon Finger Gauntlets
INSERT INTO `guild_item_points` VALUES ('6', '13991', '8', '7120', '7120', '4');  -- Dragon Finger Gauntlets +1
INSERT INTO `guild_item_points` VALUES ('6', '13312', '8', '3750', '6560', '5');  -- Coral Earring
INSERT INTO `guild_item_points` VALUES ('6', '13406', '8', '3750', '6560', '5');  -- Merman's Earring
INSERT INTO `guild_item_points` VALUES ('6', '16548', '8', '7600', '7600', '6');  -- Coral Sword
INSERT INTO `guild_item_points` VALUES ('6', '16620', '8', '7600', '7600', '6');  -- Merman's Sword
INSERT INTO `guild_item_points` VALUES ('6', '12308', '8', '5400', '6880', '7');  -- Darksteel Shield
INSERT INTO `guild_item_points` VALUES ('6', '12346', '8', '6525', '6880', '7');  -- Darksteel Shield +1

-- Veteran
INSERT INTO `guild_item_points` VALUES ('6', '12693', '9', '2000', '5840', '0');  -- Gavial Finger Gauntlets
INSERT INTO `guild_item_points` VALUES ('6', '14829', '9', '2000', '5840', '0');  -- Gavial Finger Gauntlets +1
INSERT INTO `guild_item_points` VALUES ('6', '12751', '9', '5940', '6960', '1');  -- Scorpion Gauntlets
INSERT INTO `guild_item_points` VALUES ('6', '12717', '9', '5940', '6960', '1');  -- Scorpion Gauntlets +1
INSERT INTO `guild_item_points` VALUES ('6', '14008', '9', '5850', '6960', '2');  -- Carapace Gauntlets
INSERT INTO `guild_item_points` VALUES ('6', '14009', '9', '6825', '6960', '2');  -- Carapace Gauntlets +1
INSERT INTO `guild_item_points` VALUES ('6', '13846', '9', '6049', '7040', '3');  -- Scorpion Helm
INSERT INTO `guild_item_points` VALUES ('6', '12461', '9', '6049', '7040', '3');  -- Scorpion Helm +1
INSERT INTO `guild_item_points` VALUES ('6', '13878', '9', '6337', '7040', '4');  -- Carapace Helm
INSERT INTO `guild_item_points` VALUES ('6', '13879', '9', '7040', '7040', '4');  -- Carapace Helm +1
INSERT INTO `guild_item_points` VALUES ('6', '13789', '9', '7520', '7520', '5');  -- Carapace Breastplate
INSERT INTO `guild_item_points` VALUES ('6', '13790', '9', '7520', '7520', '5');  -- Carapace Brstplate +1
INSERT INTO `guild_item_points` VALUES ('6', '12621', '9', '7520', '7520', '6');  -- Scorpion Breastplate
INSERT INTO `guild_item_points` VALUES ('6', '12589', '9', '7520', '7520', '6');  -- Scorpion Breastplate +1
INSERT INTO `guild_item_points` VALUES ('6', '13922', '9', '3570', '6480', '7');  -- Demon Helm
INSERT INTO `guild_item_points` VALUES ('6', '13923', '9', '4845', '6480', '7');  -- Demon Helm +1

-- ----------------------------
-- Alchemy
-- ----------------------------
-- Amateur
INSERT INTO `guild_item_points` VALUES ('7', '4166', '0', '80', '1520', '0');     -- Deodorizer
INSERT INTO `guild_item_points` VALUES ('7', '13683', '0', '210', '2160', '1');   -- Water Tank
INSERT INTO `guild_item_points` VALUES ('7', '4148', '0', '79', '1520', '2');     -- Antidote
INSERT INTO `guild_item_points` VALUES ('7', '16600', '0', '67', '1440', '3');    -- Wax Sword
INSERT INTO `guild_item_points` VALUES ('7', '16610', '0', '75', '1440', '3');    -- Wax Sword +1
INSERT INTO `guild_item_points` VALUES ('7', '913', '0', '30', '1280', '4');      -- Beeswax
INSERT INTO `guild_item_points` VALUES ('7', '4162', '0', '150', '1920', '5');    -- Silencing Potion
INSERT INTO `guild_item_points` VALUES ('7', '4166', '0', '80', '1520', '6');     -- Deodorizer
INSERT INTO `guild_item_points` VALUES ('7', '4148', '0', '79', '1520', '7');     -- Antidote

-- Recruit
INSERT INTO `guild_item_points` VALUES ('7', '16429', '1', '825', '4080', '0');   -- Silence Baghnakhs
INSERT INTO `guild_item_points` VALUES ('7', '16438', '1', '825', '4080', '0');   -- Silence Baghnakhs +1
INSERT INTO `guild_item_points` VALUES ('7', '4157', '1', '100', '1920', '1');    -- Poison Potion
INSERT INTO `guild_item_points` VALUES ('7', '16495', '1', '406', '3040', '2');   -- Silence Dagger
INSERT INTO `guild_item_points` VALUES ('7', '16508', '1', '406', '3040', '2');   -- Silence Dagger +1
INSERT INTO `guild_item_points` VALUES ('7', '914', '1', '300', '2720', '3');     -- Mercury
INSERT INTO `guild_item_points` VALUES ('7', '16572', '1', '705', '3840', '4');   -- Bee Spatha
INSERT INTO `guild_item_points` VALUES ('7', '16611', '1', '775', '3840', '4');   -- Bee Spatha +1
INSERT INTO `guild_item_points` VALUES ('7', '4167', '1', '21', '1520', '5');     -- Cracker
INSERT INTO `guild_item_points` VALUES ('7', '4151', '1', '200', '2320', '6');    -- Echo Drops
INSERT INTO `guild_item_points` VALUES ('7', '16495', '1', '406', '3040', '7');   -- Silence Dagger
INSERT INTO `guild_item_points` VALUES ('7', '16508', '1', '406', '3040', '7');   -- Silence Dagger +1

-- Initiate
INSERT INTO `guild_item_points` VALUES ('7', '16496', '2', '959', '4400', '0');   -- Poison Dagger
INSERT INTO `guild_item_points` VALUES ('7', '16741', '2', '1142', '4400', '0');  -- Poison Dagger +1
INSERT INTO `guild_item_points` VALUES ('7', '16906', '2', '894', '4320', '1');   -- Mokuto
INSERT INTO `guild_item_points` VALUES ('7', '16925', '2', '902', '4320', '1');   -- Mokuto +1
INSERT INTO `guild_item_points` VALUES ('7', '16472', '2', '1226', '4800', '2');  -- Poison Knife
INSERT INTO `guild_item_points` VALUES ('7', '16742', '2', '1453', '4800', '2');  -- Poison Knife +1
INSERT INTO `guild_item_points` VALUES ('7', '4168', '2', '5', '1680', '3');      -- Twinkle Shower
INSERT INTO `guild_item_points` VALUES ('7', '16906', '2', '894', '4320', '4');   -- Mokuto
INSERT INTO `guild_item_points` VALUES ('7', '16925', '2', '902', '4320', '4');   -- Mokuto +1
INSERT INTO `guild_item_points` VALUES ('7', '16458', '2', '330', '2960', '5');   -- Poison Baselard
INSERT INTO `guild_item_points` VALUES ('7', '4150', '2', '519', '3520', '6');    -- Eye Drops
INSERT INTO `guild_item_points` VALUES ('7', '16496', '2', '959', '4400', '7');   -- Poison Dagger
INSERT INTO `guild_item_points` VALUES ('7', '16741', '2', '1142', '4400', '7');  -- Poison Dagger +1

-- Novice
INSERT INTO `guild_item_points` VALUES ('7', '16410', '3', '638', '3920', '0');   -- Poison Baghnakhs
INSERT INTO `guild_item_points` VALUES ('7', '16692', '3', '748', '3920', '0');   -- Poison Baghnakhs +1
INSERT INTO `guild_item_points` VALUES ('7', '16417', '3', '2400', '5840', '1');  -- Poison Claws
INSERT INTO `guild_item_points` VALUES ('7', '16439', '3', '2400', '5840', '1');  -- Poison Claws +1
INSERT INTO `guild_item_points` VALUES ('7', '16454', '3', '100', '2320', '2');   -- Blind Dagger
INSERT INTO `guild_item_points` VALUES ('7', '16493', '3', '120', '2320', '2');   -- Blind Dagger +1
INSERT INTO `guild_item_points` VALUES ('7', '16471', '3', '135', '2480', '3');   -- Blind Knife
INSERT INTO `guild_item_points` VALUES ('7', '16490', '3', '161', '2480', '3');   -- Blind Knife +1
INSERT INTO `guild_item_points` VALUES ('7', '16907', '3', '1200', '4800', '4');  -- Busuto
INSERT INTO `guild_item_points` VALUES ('7', '16927', '3', '1230', '4800', '4');  -- Busuto +1
INSERT INTO `guild_item_points` VALUES ('7', '16387', '3', '992', '4560', '5');   -- Poison Cesti
INSERT INTO `guild_item_points` VALUES ('7', '16700', '3', '1312', '4560', '5');  -- Poison Cesti +1
INSERT INTO `guild_item_points` VALUES ('7', '16594', '3', '3488', '6400', '6');  -- Inferno Sword
INSERT INTO `guild_item_points` VALUES ('7', '16928', '3', '3488', '6400', '6');  -- Hellfire Sword
INSERT INTO `guild_item_points` VALUES ('7', '16478', '3', '1620', '5280', '7');  -- Poison Kukri
INSERT INTO `guild_item_points` VALUES ('7', '16489', '3', '1620', '5280', '7');  -- Poison Kukri +1

-- Apprentice
INSERT INTO `guild_item_points` VALUES ('7', '16543', '4', '1320', '5040', '0');  -- Fire Sword
INSERT INTO `guild_item_points` VALUES ('7', '16621', '4', '1320', '5040', '0');  -- Flame Sword
INSERT INTO `guild_item_points` VALUES ('7', '16501', '4', '2480', '5920', '1');  -- Acid Knife
INSERT INTO `guild_item_points` VALUES ('7', '17608', '4', '2880', '5920', '1');  -- Corrosive Knife
INSERT INTO `guild_item_points` VALUES ('7', '16905', '4', '1240', '4960', '2');  -- Bokuto
INSERT INTO `guild_item_points` VALUES ('7', '16926', '4', '1426', '4950', '2');  -- Bokuto +1
INSERT INTO `guild_item_points` VALUES ('7', '17605', '4', '1717', '5440', '3');  -- Acid Dagger
INSERT INTO `guild_item_points` VALUES ('7', '17606', '4', '2003', '5440', '3');  -- Corrosive Dagger
INSERT INTO `guild_item_points` VALUES ('7', '16403', '4', '2464', '5920', '4');  -- Poison Katars
INSERT INTO `guild_item_points` VALUES ('7', '16693', '4', '3024', '5920', '4');  -- Poison Katars +1
INSERT INTO `guild_item_points` VALUES ('7', '16588', '4', '979', '4640', '5');   -- Flame Claymore
INSERT INTO `guild_item_points` VALUES ('7', '16929', '4', '979', '4640', '5');   -- Burning Claymore
INSERT INTO `guild_item_points` VALUES ('7', '13684', '4', '210', '2880', '6');   -- Potion Tank
INSERT INTO `guild_item_points` VALUES ('7', '16709', '4', '349', '3360', '7');   -- Inferno Axe
INSERT INTO `guild_item_points` VALUES ('7', '16713', '4', '380', '3360', '7');   -- Hellfire Axe

-- Journeyman
INSERT INTO `guild_item_points` VALUES ('7', '16908', '5', '1200', '4960', '0');  -- Yoto
INSERT INTO `guild_item_points` VALUES ('7', '17768', '5', '1350', '4960', '0');  -- Yoto +1
INSERT INTO `guild_item_points` VALUES ('7', '16523', '5', '5600', '6880', '1');  -- Holy Degen
INSERT INTO `guild_item_points` VALUES ('7', '16817', '5', '6300', '6880', '1');  -- Holy Degen +1
INSERT INTO `guild_item_points` VALUES ('7', '16430', '5', '2976', '6240', '2');  -- Acid Claws
INSERT INTO `guild_item_points` VALUES ('7', '17487', '5', '3596', '6240', '2');  -- Corrosive Claws
INSERT INTO `guild_item_points` VALUES ('7', '17041', '5', '3102', '6240', '3');  -- Holy Mace
INSERT INTO `guild_item_points` VALUES ('7', '17411', '5', '3762', '6240', '3');  -- Holy Mace +1
INSERT INTO `guild_item_points` VALUES ('7', '16581', '5', '4300', '6640', '4');  -- Holy Sword
INSERT INTO `guild_item_points` VALUES ('7', '16816', '5', '4800', '6640', '4');  -- Holy Sword +1
INSERT INTO `guild_item_points` VALUES ('7', '16973', '5', '2300', '5840', '5');  -- Homura
INSERT INTO `guild_item_points` VALUES ('7', '16986', '5', '2392', '5840', '5');  -- Homura +1
INSERT INTO `guild_item_points` VALUES ('7', '16973', '5', '2300', '5840', '6');  -- Homura
INSERT INTO `guild_item_points` VALUES ('7', '16986', '5', '2392', '5840', '6');  -- Homura +1
INSERT INTO `guild_item_points` VALUES ('7', '13682', '5', '210', '3040', '7');   -- Ether Tank

-- Craftsman
INSERT INTO `guild_item_points` VALUES ('7', '16479', '6', '2944', '6240', '0');  -- Acid Kukri
INSERT INTO `guild_item_points` VALUES ('7', '16494', '6', '3404', '6240', '0');  -- Corrosive Kukri
INSERT INTO `guild_item_points` VALUES ('7', '16539', '6', '7280', '7280', '1');  -- Cermet Sword
INSERT INTO `guild_item_points` VALUES ('7', '16825', '6', '7280', '7280', '1');  -- Cermet Sword +1
INSERT INTO `guild_item_points` VALUES ('7', '16414', '6', '5280', '6880', '2');  -- Cermet Claws
INSERT INTO `guild_item_points` VALUES ('7', '17488', '6', '6380', '6880', '2');  -- Cermet Claws +1
INSERT INTO `guild_item_points` VALUES ('7', '16554', '6', '7360', '7360', '3');  -- Hanger
INSERT INTO `guild_item_points` VALUES ('7', '17642', '6', '7360', '7360', '3');  -- Hanger +1
INSERT INTO `guild_item_points` VALUES ('7', '16549', '6', '4928', '6800', '4');  -- Divine Sword
INSERT INTO `guild_item_points` VALUES ('7', '16826', '6', '5488', '6800', '4');  -- Divine Sword +1
INSERT INTO `guild_item_points` VALUES ('7', '16459', '6', '3720', '6480', '5');  -- Acid Baselard
INSERT INTO `guild_item_points` VALUES ('7', '17607', '6', '4320', '6780', '5');  -- Corrosive Baselard
INSERT INTO `guild_item_points` VALUES ('7', '16568', '6', '7360', '7360', '6');  -- Saber
INSERT INTO `guild_item_points` VALUES ('7', '16612', '6', '7360', '7360', '6');  -- Saber +1
INSERT INTO `guild_item_points` VALUES ('7', '16469', '6', '5850', '6960', '7');  -- Cermet Knife
INSERT INTO `guild_item_points` VALUES ('7', '17609', '6', '6960', '6960', '7');  -- Cermet Knife +1

-- Artisan
INSERT INTO `guild_item_points` VALUES ('7', '16477', '7', '7280', '7280', '0');  -- Cermet Kukri
INSERT INTO `guild_item_points` VALUES ('7', '17603', '7', '7280', '7280', '0');  -- Cermet Kukri +1
INSERT INTO `guild_item_points` VALUES ('7', '16401', '7', '6710', '7040', '1');  -- Jamadhars
INSERT INTO `guild_item_points` VALUES ('7', '17482', '7', '6862', '7040', '1');  -- Jamadhars +1
INSERT INTO `guild_item_points` VALUES ('7', '16418', '7', '5040', '6800', '2');  -- Venom Claws
INSERT INTO `guild_item_points` VALUES ('7', '16425', '7', '5040', '6800', '2');  -- Venom Claws +1
INSERT INTO `guild_item_points` VALUES ('7', '16505', '7', '7120', '7290', '3');  -- Venom Kukri
INSERT INTO `guild_item_points` VALUES ('7', '17604', '7', '7290', '7290', '3');  -- Venom Kukri +1
INSERT INTO `guild_item_points` VALUES ('7', '16560', '7', '7440', '7440', '4');  -- Cutlass
INSERT INTO `guild_item_points` VALUES ('7', '17639', '7', '7440', '7440', '4');  -- Cutlass +1
INSERT INTO `guild_item_points` VALUES ('7', '16507', '7', '6370', '7040', '5');  -- Venom Baselard
INSERT INTO `guild_item_points` VALUES ('7', '16510', '7', '6370', '7040', '5');  -- Venom Baselard +1
INSERT INTO `guild_item_points` VALUES ('7', '12379', '7', '700', '4400', '6');   -- Holy Shield
INSERT INTO `guild_item_points` VALUES ('7', '12380', '7', '700', '4400', '6');   -- Divine Shield
INSERT INTO `guild_item_points` VALUES ('7', '17080', '7', '3192', '6320', '7');  -- Holy Maul
INSERT INTO `guild_item_points` VALUES ('7', '17114', '7', '3752', '6320', '7');  -- Holy Maul +1

-- Adept
INSERT INTO `guild_item_points` VALUES ('7', '16499', '8', '5670', '6960', '0');  -- Venom Kris
INSERT INTO `guild_item_points` VALUES ('7', '16761', '8', '6195', '6960', '0');  -- Venom Kris +1
INSERT INTO `guild_item_points` VALUES ('7', '16609', '8', '7440', '7440', '1');  -- Bloody Sword
INSERT INTO `guild_item_points` VALUES ('7', '17646', '8', '7440', '7440', '1');  -- Carnage Sword
INSERT INTO `guild_item_points` VALUES ('7', '16431', '8', '6480', '7040', '2');  -- Stun Claws
INSERT INTO `guild_item_points` VALUES ('7', '17486', '8', '6615', '7040', '2');  -- Stun Claws +1
INSERT INTO `guild_item_points` VALUES ('7', '16506', '8', '7360', '7360', '3');  -- Stun Kukri
INSERT INTO `guild_item_points` VALUES ('7', '17614', '8', '7360', '7360', '3');  -- Stun Kukri +1
INSERT INTO `guild_item_points` VALUES ('7', '16860', '8', '3150', '6320', '4');  -- Holy Lance
INSERT INTO `guild_item_points` VALUES ('7', '16880', '8', '4275', '6320', '4');  -- Holy Lance +1
INSERT INTO `guild_item_points` VALUES ('7', '16528', '8', '7200', '7200', '5');  -- Bloody Rapier
INSERT INTO `guild_item_points` VALUES ('7', '16824', '8', '7200', '7200', '5');  -- Carnage Rapier
INSERT INTO `guild_item_points` VALUES ('7', '16432', '8', '7120', '7120', '6');  -- Stun Jamadhars
INSERT INTO `guild_item_points` VALUES ('7', '17484', '8', '7120', '7120', '6');  -- Stun Jamadhars +1
INSERT INTO `guild_item_points` VALUES ('7', '17085', '8', '3060', '6320', '7');  -- Holy Wand
INSERT INTO `guild_item_points` VALUES ('7', '17434', '8', '3240', '6320', '7');  -- Holy Wand +1

-- Veteran
INSERT INTO `guild_item_points` VALUES ('7', '4209', '9', '900', '4800', '0');    -- Mind Potion
INSERT INTO `guild_item_points` VALUES ('7', '4211', '9', '750', '4640', '1');    -- Charisma Potion
INSERT INTO `guild_item_points` VALUES ('7', '4201', '9', '900', '4800', '2');    -- Dexterity Potion
INSERT INTO `guild_item_points` VALUES ('7', '4207', '9', '840', '4800', '3');    -- Intelligence Potion
INSERT INTO `guild_item_points` VALUES ('7', '4203', '9', '750', '4640', '4');    -- Vitality Potion
INSERT INTO `guild_item_points` VALUES ('7', '4205', '9', '810', '4720', '5');    -- Agility Potion
INSERT INTO `guild_item_points` VALUES ('7', '12305', '9', '5565', '6960', '6');  -- Ice Shield
INSERT INTO `guild_item_points` VALUES ('7', '12357', '9', '5565', '6960', '6');  -- Ice Shield +1
INSERT INTO `guild_item_points` VALUES ('7', '4199', '9', '900', '4800', '7');    -- Strength Potion

-- ----------------------------
-- Cooking
-- ----------------------------
-- Amateur
INSERT INTO `guild_item_points` VALUES ('8', '17016', '0', '4', '1120', '0');     -- Pet Food Alpha
INSERT INTO `guild_item_points` VALUES ('8', '4415', '0', '55', '1360', '1');     -- Roasted Corn
INSERT INTO `guild_item_points` VALUES ('8', '4334', '0', '46', '1360', '1');     -- Grilled Corn
INSERT INTO `guild_item_points` VALUES ('8', '4455', '0', '50', '1360', '2');     -- Pebble Soup
INSERT INTO `guild_item_points` VALUES ('8', '4592', '0', '55', '1360', '2');     -- Wisdom Soup
INSERT INTO `guild_item_points` VALUES ('8', '4535', '0', '150', '1920', '3');    -- Boiled Crayfish
INSERT INTO `guild_item_points` VALUES ('8', '4338', '0', '180', '1920', '3');    -- Steamed Crayfish
INSERT INTO `guild_item_points` VALUES ('8', '4455', '0', '50', '1360', '4');     -- Pebble Soup
INSERT INTO `guild_item_points` VALUES ('8', '4592', '0', '55', '1360', '4');     -- Wisdom Soup
INSERT INTO `guild_item_points` VALUES ('8', '4355', '0', '417', '2960', '5');    -- Salmon Sub
INSERT INTO `guild_item_points` VALUES ('8', '4266', '0', '432', '2960', '5');    -- Fulm-long Sub
INSERT INTO `guild_item_points` VALUES ('8', '4355', '0', '417', '2960', '6');    -- Salmon Sub
INSERT INTO `guild_item_points` VALUES ('8', '4266', '0', '432', '2960', '6');    -- Fulm-long Sub
INSERT INTO `guild_item_points` VALUES ('8', '4415', '0', '55', '1360', '7');     -- Roasted Corn
INSERT INTO `guild_item_points` VALUES ('8', '4334', '0', '46', '1360', '7');     -- Grilled Corn

-- Recruit
INSERT INTO `guild_item_points` VALUES ('8', '4437', '1', '270', '2560', '0');    -- Roast Mutton
INSERT INTO `guild_item_points` VALUES ('8', '4335', '1', '300', '2560', '0');    -- Juicy Mutton
INSERT INTO `guild_item_points` VALUES ('8', '4416', '1', '420', '3120', '1');    -- Pea Soup
INSERT INTO `guild_item_points` VALUES ('8', '4327', '1', '541', '3120', '1');    -- Emerald Soup
INSERT INTO `guild_item_points` VALUES ('8', '4437', '1', '270', '2560', '2');    -- Roast Mutton
INSERT INTO `guild_item_points` VALUES ('8', '4335', '1', '300', '2560', '2');    -- Juicy Mutton
INSERT INTO `guild_item_points` VALUES ('8', '4408', '1', '52', '1680', '3');     -- Tortilla
INSERT INTO `guild_item_points` VALUES ('8', '5181', '1', '78', '1680', '3');     -- Tortilla Buena
INSERT INTO `guild_item_points` VALUES ('8', '4416', '1', '420', '3120', '4');    -- Pea Soup
INSERT INTO `guild_item_points` VALUES ('8', '4327', '1', '541', '3120', '4');    -- Emerald Soup
INSERT INTO `guild_item_points` VALUES ('8', '4537', '1', '195', '2320', '5');    -- Roast Carp
INSERT INTO `guild_item_points` VALUES ('8', '4586', '1', '240', '2320', '5');    -- Broiled Carp
INSERT INTO `guild_item_points` VALUES ('8', '4537', '1', '195', '2320', '6');    -- Roast Carp
INSERT INTO `guild_item_points` VALUES ('8', '4586', '1', '240', '2320', '6');    -- Broiled Carp
INSERT INTO `guild_item_points` VALUES ('8', '4408', '1', '52', '1680', '7');     -- Tortilla
INSERT INTO `guild_item_points` VALUES ('8', '5181', '1', '78', '1680', '7');     -- Tortilla Buena

-- Initiate
INSERT INTO `guild_item_points` VALUES ('8', '4380', '2', '82', '2000', '0');     -- Smoked Salmon
INSERT INTO `guild_item_points` VALUES ('8', '4438', '2', '540', '3600', '1');    -- Dhalmel Steak
INSERT INTO `guild_item_points` VALUES ('8', '4519', '2', '585', '3600', '1');    -- Wild Steak
INSERT INTO `guild_item_points` VALUES ('8', '4492', '2', '225', '2640', '2');    -- Puls
INSERT INTO `guild_item_points` VALUES ('8', '4533', '2', '450', '2640', '2');    -- Delicious Puls
INSERT INTO `guild_item_points` VALUES ('8', '4406', '2', '165', '2400', '3');    -- Baked Apple
INSERT INTO `guild_item_points` VALUES ('8', '4336', '2', '195', '2400', '3');    -- Sweet Baked Apple
INSERT INTO `guild_item_points` VALUES ('8', '4560', '2', '376', '3120', '4');    -- Vegetable Soup
INSERT INTO `guild_item_points` VALUES ('8', '4323', '2', '664', '3120', '4');    -- Vegetable Broth
INSERT INTO `guild_item_points` VALUES ('8', '4376', '2', '45', '1840', '5');     -- Meat Jerky
INSERT INTO `guild_item_points` VALUES ('8', '4518', '2', '63', '1840', '5');     -- Sheep Jerky
INSERT INTO `guild_item_points` VALUES ('8', '4456', '2', '675', '3920', '6');    -- Boiled Crab
INSERT INTO `guild_item_points` VALUES ('8', '4342', '2', '825', '3920', '6');    -- Steamed Crab
INSERT INTO `guild_item_points` VALUES ('8', '4436', '2', '120', '2240', '7');    -- Baked Popoto
INSERT INTO `guild_item_points` VALUES ('8', '4282', '2', '127', '2240', '7');    -- Pipin' Popoto

-- Novice
INSERT INTO `guild_item_points` VALUES ('8', '4419', '3', '1500', '5200', '0');   -- Mushroom Soup
INSERT INTO `guild_item_points` VALUES ('8', '4333', '3', '1740', '5200', '0');   -- Witch Soup
INSERT INTO `guild_item_points` VALUES ('8', '4555', '3', '558', '3760', '1');    -- Windurst Salad
INSERT INTO `guild_item_points` VALUES ('8', '4321', '3', '613', '3760', '1');    -- Timbre Timbers Salad
INSERT INTO `guild_item_points` VALUES ('8', '4510', '3', '9', '1920', '2');      -- Acorn Cookie
INSERT INTO `guild_item_points` VALUES ('8', '4577', '3', '10', '1920', '2');     -- Wild Cookie
INSERT INTO `guild_item_points` VALUES ('8', '4499', '3', '37', '2080', '3');     -- Iron Bread
INSERT INTO `guild_item_points` VALUES ('8', '4573', '3', '114', '2080', '3');    -- Steel Bread
INSERT INTO `guild_item_points` VALUES ('8', '4459', '3', '450', '3440', '4');    -- Nebimonite Bake
INSERT INTO `guild_item_points` VALUES ('8', '4267', '3', '675', '3440', '4');    -- Buttered Nebimonite
INSERT INTO `guild_item_points` VALUES ('8', '4364', '3', '45', '2080', '5');     -- Black Bread
INSERT INTO `guild_item_points` VALUES ('8', '4591', '3', '60', '2080', '5');     -- Pumpernickel
INSERT INTO `guild_item_points` VALUES ('8', '5196', '3', '252', '2880', '6');    -- Buffalo Jerky
INSERT INTO `guild_item_points` VALUES ('8', '5207', '3', '567', '2880', '6');    -- Bison Jerky
INSERT INTO `guild_item_points` VALUES ('8', '4404', '3', '225', '2800', '7');    -- Roast Trout
INSERT INTO `guild_item_points` VALUES ('8', '4587', '3', '247', '2800', '7');    -- Broiled Trout

-- Apprentice
INSERT INTO `guild_item_points` VALUES ('8', '4420', '4', '441', '3600', '0');    -- Tomato Soup
INSERT INTO `guild_item_points` VALUES ('8', '4341', '4', '1341', '3600', '0');   -- Sunset Soup
INSERT INTO `guild_item_points` VALUES ('8', '4413', '4', '120', '2560', '1');    -- Apple Pie
INSERT INTO `guild_item_points` VALUES ('8', '4320', '4', '132', '2560', '1');    -- Apple Pie +1
INSERT INTO `guild_item_points` VALUES ('8', '4413', '4', '120', '2560', '2');    -- Apple Pie
INSERT INTO `guild_item_points` VALUES ('8', '4320', '4', '132', '2560', '2');    -- Apple Pie +1
INSERT INTO `guild_item_points` VALUES ('8', '4398', '4', '270', '3120', '3');    -- Fish Mithkabob
INSERT INTO `guild_item_points` VALUES ('8', '4575', '4', '306', '3120', '3');    -- Fish Chiefkabob
INSERT INTO `guild_item_points` VALUES ('8', '4490', '4', '180', '2800', '4');    -- Pickled Herring
INSERT INTO `guild_item_points` VALUES ('8', '5183', '4', '270', '2800', '4');    -- Viking Herring
INSERT INTO `guild_item_points` VALUES ('8', '4490', '4', '180', '2800', '5');    -- Pickled Herring
INSERT INTO `guild_item_points` VALUES ('8', '5183', '4', '270', '2800', '5');    -- Viking Herring
INSERT INTO `guild_item_points` VALUES ('8', '4397', '4', '6', '2160', '6');      -- Cinna-cookie
INSERT INTO `guild_item_points` VALUES ('8', '4520', '4', '7', '2160', '6');      -- Coin Cookie
INSERT INTO `guild_item_points` VALUES ('8', '4420', '4', '441', '3600', '7');    -- Tomato Soup
INSERT INTO `guild_item_points` VALUES ('8', '4341', '4', '1341', '3600', '7');   -- Sunset Soup

-- Journeyman
INSERT INTO `guild_item_points` VALUES ('8', '4572', '5', '247', '3200', '0');    -- Beaugreen Saute
INSERT INTO `guild_item_points` VALUES ('8', '4293', '5', '865', '3200', '0');    -- Monastic Saute
INSERT INTO `guild_item_points` VALUES ('8', '4563', '5', '384', '3520', '1');    -- Pamama Tart
INSERT INTO `guild_item_points` VALUES ('8', '4287', '5', '918', '3520', '1');    -- Opo-opo Tart
INSERT INTO `guild_item_points` VALUES ('8', '5168', '5', '184', '2960', '2');    -- Bataquiche
INSERT INTO `guild_item_points` VALUES ('8', '5169', '5', '276', '2960', '2');    -- Bataquiche +1
INSERT INTO `guild_item_points` VALUES ('8', '4417', '5', '450', '3680', '3');    -- Egg Soup
INSERT INTO `guild_item_points` VALUES ('8', '4521', '5', '525', '3680', '3');    -- Humpty Soup
INSERT INTO `guild_item_points` VALUES ('8', '5598', '5', '600', '4000', '4');    -- Sis Kebabi
INSERT INTO `guild_item_points` VALUES ('8', '5599', '5', '750', '4000', '4');    -- Sis Kebabi +1
INSERT INTO `guild_item_points` VALUES ('8', '4457', '5', '750', '4320', '5');    -- Eel Kabob
INSERT INTO `guild_item_points` VALUES ('8', '4588', '5', '825', '4320', '5');    -- Broiled Eel
INSERT INTO `guild_item_points` VALUES ('8', '5598', '5', '600', '4000', '6');    -- Sis Kebabi
INSERT INTO `guild_item_points` VALUES ('8', '5599', '5', '750', '4000', '6');    -- Sis Kebabi +1
INSERT INTO `guild_item_points` VALUES ('8', '4391', '5', '9', '2400', '7');      -- Bretzel
INSERT INTO `guild_item_points` VALUES ('8', '5182', '5', '13', '2400', '7');     -- Salty Bretzel

-- Craftsman
INSERT INTO `guild_item_points` VALUES ('8', '4546', '6', '525', '4000', '0');    -- Raisin Bread
INSERT INTO `guild_item_points` VALUES ('8', '4494', '6', '198', '3200', '1');    -- San D'Orian Tea
INSERT INTO `guild_item_points` VALUES ('8', '4524', '6', '240', '3200', '1');    -- Royal Tea
INSERT INTO `guild_item_points` VALUES ('8', '5572', '6', '622', '4160', '2');    -- Irmik Helvasi
INSERT INTO `guild_item_points` VALUES ('8', '5573', '6', '661', '4160', '2');    -- Irmik Helvasi +1
INSERT INTO `guild_item_points` VALUES ('8', '4559', '6', '534', '4000', '3');    -- Herb Quus
INSERT INTO `guild_item_points` VALUES ('8', '4294', '6', '879', '4000', '3');    -- Medicinal Quus
INSERT INTO `guild_item_points` VALUES ('8', '4433', '6', '778', '4480', '4');    -- Dhalmel Stew
INSERT INTO `guild_item_points` VALUES ('8', '4589', '6', '855', '4480', '4');    -- Wild Stew
INSERT INTO `guild_item_points` VALUES ('8', '4487', '6', '156', '3040', '5');    -- Colored Egg
INSERT INTO `guild_item_points` VALUES ('8', '4595', '6', '345', '3040', '5');    -- Party Egg
INSERT INTO `guild_item_points` VALUES ('8', '4506', '6', '607', '4160', '6');    -- Mutton Tortilla
INSERT INTO `guild_item_points` VALUES ('8', '4348', '6', '880', '4160', '6');    -- Mutton Enchilada
INSERT INTO `guild_item_points` VALUES ('8', '5600', '6', '900', '4640', '7');    -- Balik Sis
INSERT INTO `guild_item_points` VALUES ('8', '5601', '6', '950', '4640', '7');    -- Balik Sis +1

-- Artisan
INSERT INTO `guild_item_points` VALUES ('8', '4547', '7', '693', '4400', '0');    -- Boiled Cockatrice
INSERT INTO `guild_item_points` VALUES ('8', '4552', '7', '637', '4320', '1');    -- Herb Crawler Eggs
INSERT INTO `guild_item_points` VALUES ('8', '4583', '7', '382', '3760', '2');    -- Salmon Meuniere
INSERT INTO `guild_item_points` VALUES ('8', '4347', '7', '765', '3760', '2');    -- Salmon Meuniere +1
INSERT INTO `guild_item_points` VALUES ('8', '4439', '7', '175', '3280', '3');    -- Navarin
INSERT INTO `guild_item_points` VALUES ('8', '4284', '7', '525', '3280', '3');    -- Tender Navarin
INSERT INTO `guild_item_points` VALUES ('8', '4411', '7', '120', '3120', '4');    -- Dhalmel Pie
INSERT INTO `guild_item_points` VALUES ('8', '4322', '7', '160', '3120', '4');    -- Dhalmel Pie +1
INSERT INTO `guild_item_points` VALUES ('8', '4507', '7', '480', '4000', '5');    -- Rarab Meatball
INSERT INTO `guild_item_points` VALUES ('8', '4349', '7', '810', '4000', '5');    -- Bunny Ball
INSERT INTO `guild_item_points` VALUES ('8', '4554', '7', '2106', '5840', '6');   -- Shallops Tropicale
INSERT INTO `guild_item_points` VALUES ('8', '4418', '7', '1800', '5600', '7');   -- Turtle Soup
INSERT INTO `guild_item_points` VALUES ('8', '4337', '7', '2100', '5600', '7');   -- Stamina Soup

-- Adept
INSERT INTO `guild_item_points` VALUES ('8', '4544', '8', '1120', '5040', '0');   -- Mushroom Stew
INSERT INTO `guild_item_points` VALUES ('8', '4344', '8', '1680', '5040', '0');   -- Witch Stew
INSERT INTO `guild_item_points` VALUES ('8', '4561', '8', '1980', '5760', '1');   -- Seafood Stew
INSERT INTO `guild_item_points` VALUES ('8', '4564', '8', '1836', '5680', '2');   -- Royal Omelette
INSERT INTO `guild_item_points` VALUES ('8', '4331', '8', '2516', '5680', '2');   -- Imperial Omelette
INSERT INTO `guild_item_points` VALUES ('8', '4550', '8', '2208', '5920', '3');   -- Bream Risotto
INSERT INTO `guild_item_points` VALUES ('8', '4268', '8', '2688', '5920', '3');   -- Sea Spray Risotto
INSERT INTO `guild_item_points` VALUES ('8', '4582', '8', '457', '4080', '4');    -- Bass Meuniere
INSERT INTO `guild_item_points` VALUES ('8', '4346', '8', '915', '4080', '4');    -- Bass Meuniere +1
INSERT INTO `guild_item_points` VALUES ('8', '4557', '8', '783', '4640', '5');    -- Steamed Catfish
INSERT INTO `guild_item_points` VALUES ('8', '4548', '8', '924', '4800', '6');    -- Coeurl Saute
INSERT INTO `guild_item_points` VALUES ('8', '4295', '8', '1449', '4800', '6');   -- Royal Saute
INSERT INTO `guild_item_points` VALUES ('8', '4452', '8', '1725', '5040', '7');   -- Shark Fin Soup
INSERT INTO `guild_item_points` VALUES ('8', '4285', '8', '2100', '5040', '7');   -- Ocean Soup

-- Veteran
INSERT INTO `guild_item_points` VALUES ('8', '4297', '9', '730', '4640', '0');    -- Black Curry
INSERT INTO `guild_item_points` VALUES ('8', '4271', '9', '210', '3600', '1');    -- Rice Dumpling
INSERT INTO `guild_item_points` VALUES ('8', '4279', '9', '4375', '6720', '2');   -- Tavnazian Salad
INSERT INTO `guild_item_points` VALUES ('8', '5185', '9', '6475', '6720', '2');   -- Leremieu Salad
INSERT INTO `guild_item_points` VALUES ('8', '4353', '9', '2727', '6160', '3');   -- Sea Bass Croute
INSERT INTO `guild_item_points` VALUES ('8', '4584', '9', '2395', '6000', '4');   -- Flounder Meuniere
INSERT INTO `guild_item_points` VALUES ('8', '4345', '9', '3195', '6000', '4');   -- Flounder Meuniere +1
INSERT INTO `guild_item_points` VALUES ('8', '4542', '9', '3330', '6400', '5');   -- Brain Stew
INSERT INTO `guild_item_points` VALUES ('8', '5180', '9', '4995', '6400', '5');   -- Sophic Stew
INSERT INTO `guild_item_points` VALUES ('8', '4270', '9', '147', '3440', '6');    -- Sweet Rice Cake
INSERT INTO `guild_item_points` VALUES ('8', '4551', '9', '1350', '5360', '7');   -- Salmon Croute
