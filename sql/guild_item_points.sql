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

-- Fishing / Amateur
INSERT INTO `guild_item_points` VALUES (0, 4360, 0, 0, 0, 0); -- Bastore Sardine
INSERT INTO `guild_item_points` VALUES (0, 4472, 0, 0, 0, 1); -- Crayfish
INSERT INTO `guild_item_points` VALUES (0, 4360, 0, 0, 0, 2); -- Bastore Sardine
INSERT INTO `guild_item_points` VALUES (0, 4401, 0, 0, 0, 3); -- Moat Carp
INSERT INTO `guild_item_points` VALUES (0, 4472, 0, 0, 0, 4); -- Crayfish
INSERT INTO `guild_item_points` VALUES (0, 4314, 0, 0, 0, 5); -- Bibikibo
INSERT INTO `guild_item_points` VALUES (0, 4401, 0, 0, 0, 6); -- Moat Carp
INSERT INTO `guild_item_points` VALUES (0, 4443, 0, 0, 0, 7); -- Cobalt Jellyfish

-- Fishing / Recruit
INSERT INTO `guild_item_points` VALUES (0, 4515, 1, 0, 0, 0); -- Copper Frog
INSERT INTO `guild_item_points` VALUES (0, 4289, 1, 0, 0, 1); -- Forest Carp
INSERT INTO `guild_item_points` VALUES (0, 4514, 1, 0, 0, 2); -- Quus
INSERT INTO `guild_item_points` VALUES (0, 4379, 1, 0, 0, 3); -- Cheval Salmon
INSERT INTO `guild_item_points` VALUES (0, 4500, 1, 0, 0, 4); -- Greedie
INSERT INTO `guild_item_points` VALUES (0, 5473, 1, 0, 0, 5); -- Bastore Sweeper
INSERT INTO `guild_item_points` VALUES (0, 4313, 1, 0, 0, 6); -- Blindfish
INSERT INTO `guild_item_points` VALUES (0, 4403, 1, 0, 0, 7); -- Yellow Globe

-- Fishing / Initiate
INSERT INTO `guild_item_points` VALUES (0, 4464, 2, 0, 0, 0); -- Pipira
INSERT INTO `guild_item_points` VALUES (0, 4469, 2, 0, 0, 1); -- Giant Catfish
INSERT INTO `guild_item_points` VALUES (0, 4361, 2, 0, 0, 2); -- Nebimonite
INSERT INTO `guild_item_points` VALUES (0, 4426, 2, 0, 0, 3); -- Tricolored Carp
INSERT INTO `guild_item_points` VALUES (0, 4315, 2, 0, 0, 4); -- Lungfish
INSERT INTO `guild_item_points` VALUES (0, 5121, 2, 0, 0, 5); -- Moorish Idol
INSERT INTO `guild_item_points` VALUES (0, 4290, 2, 0, 0, 6); -- Elshimo Frog
INSERT INTO `guild_item_points` VALUES (0, 4483, 2, 0, 0, 7); -- Tiger Cod

-- Fishing / Novice
INSERT INTO `guild_item_points` VALUES (0, 5791, 3, 0, 0, 0); -- Shining Trout
INSERT INTO `guild_item_points` VALUES (0, 4528, 3, 0, 0, 1); -- Crystal Bass
INSERT INTO `guild_item_points` VALUES (0, 5796, 3, 0, 0, 2); -- Nosteau Herring
INSERT INTO `guild_item_points` VALUES (0, 5804, 3, 0, 0, 3); -- Veydal Wrasse
INSERT INTO `guild_item_points` VALUES (0, 5805, 3, 0, 0, 4); -- Gugru Tuna
INSERT INTO `guild_item_points` VALUES (0, 4580, 3, 0, 0, 5); -- Coral Butterfly
INSERT INTO `guild_item_points` VALUES (0, 5791, 3, 0, 0, 6); -- Shining Trout
INSERT INTO `guild_item_points` VALUES (0, 5795, 3, 0, 0, 7); -- Ogre Eel

-- Fishing / Apprentice
INSERT INTO `guild_item_points` VALUES (0, 5801, 4, 0, 0, 0); -- Monke-Onke
INSERT INTO `guild_item_points` VALUES (0, 5800, 4, 0, 0, 1); -- Giant Donko
INSERT INTO `guild_item_points` VALUES (0, 4383, 4, 0, 0, 2); -- Gold Lobster
INSERT INTO `guild_item_points` VALUES (0, 4470, 4, 0, 0, 3); -- Icefish
INSERT INTO `guild_item_points` VALUES (0, 4385, 4, 0, 0, 4); -- Zafmlug Bass
INSERT INTO `guild_item_points` VALUES (0, 4383, 4, 0, 0, 5); -- Gold Lobster
INSERT INTO `guild_item_points` VALUES (0, 4429, 4, 0, 0, 6); -- Black Eel
INSERT INTO `guild_item_points` VALUES (0, 4385, 4, 0, 0, 7); -- Zafmlug Bass

-- Fishing / Journeyman
INSERT INTO `guild_item_points` VALUES (0, 4427, 5, 0, 0, 0); -- Gold Carp
INSERT INTO `guild_item_points` VALUES (0, 4579, 5, 0, 0, 1); -- Elshimo Newt
INSERT INTO `guild_item_points` VALUES (0, 5806, 5, 0, 0, 2); -- Bhefhel Marlin
INSERT INTO `guild_item_points` VALUES (0, 4402, 5, 0, 0, 3); -- Red Terrapin
INSERT INTO `guild_item_points` VALUES (0, 5798, 5, 0, 0, 4); -- Bluetail
INSERT INTO `guild_item_points` VALUES (0, 5806, 5, 0, 0, 5); -- Bhefhel Marlin
INSERT INTO `guild_item_points` VALUES (0, 4317, 5, 0, 0, 6); -- Trilobite
INSERT INTO `guild_item_points` VALUES (0, 5798, 5, 0, 0, 7); -- Bluetail

-- Fishing / Craftsman
INSERT INTO `guild_item_points` VALUES (0, 4473, 6, 0, 0, 0); -- Crescent Fish
INSERT INTO `guild_item_points` VALUES (0, 4473, 6, 0, 0, 1); -- Crescent Fish
INSERT INTO `guild_item_points` VALUES (0, 4288, 6, 0, 0, 2); -- Zebra Eel
INSERT INTO `guild_item_points` VALUES (0, 4288, 6, 0, 0, 3); -- Zebra Eel
INSERT INTO `guild_item_points` VALUES (0, 4471, 6, 0, 0, 4); -- Bladefish
INSERT INTO `guild_item_points` VALUES (0, 4288, 6, 0, 0, 5); -- Zebra Eel
INSERT INTO `guild_item_points` VALUES (0, 4473, 6, 0, 0, 6); -- Crescent Fish
INSERT INTO `guild_item_points` VALUES (0, 4485, 6, 0, 0, 7); -- Noble Lady

-- Fishing / Artisan
INSERT INTO `guild_item_points` VALUES (0, 4477, 7, 0, 0, 0); -- Gavial Fish
INSERT INTO `guild_item_points` VALUES (0, 4307, 7, 0, 0, 1); -- Jungle Catfish
INSERT INTO `guild_item_points` VALUES (0, 4478, 7, 0, 0, 2); -- Three-eyed Fish
INSERT INTO `guild_item_points` VALUES (0, 4307, 7, 0, 0, 3); -- Jungle Catfish
INSERT INTO `guild_item_points` VALUES (0, 4451, 7, 0, 0, 4); -- Silver Shark
INSERT INTO `guild_item_points` VALUES (0, 4478, 7, 0, 0, 5); -- Three-eyed Fish
INSERT INTO `guild_item_points` VALUES (0, 4477, 7, 0, 0, 6); -- Gavial Fish
INSERT INTO `guild_item_points` VALUES (0, 4451, 7, 0, 0, 7); -- Silver Shark

-- Fishing / Adept
INSERT INTO `guild_item_points` VALUES (0, 4454, 8, 0, 0, 0); -- Emperor Fish
INSERT INTO `guild_item_points` VALUES (0, 4454, 8, 0, 0, 1); -- Emperor Fish
INSERT INTO `guild_item_points` VALUES (0, 4461, 8, 0, 0, 2); -- Bastore Bream
INSERT INTO `guild_item_points` VALUES (0, 4304, 8, 0, 0, 3); -- Grimmonite
INSERT INTO `guild_item_points` VALUES (0, 4474, 8, 0, 0, 4); -- Gigant Squid
INSERT INTO `guild_item_points` VALUES (0, 4304, 8, 0, 0, 5); -- Grimmonite
INSERT INTO `guild_item_points` VALUES (0, 4474, 8, 0, 0, 6); -- Gigant Squid
INSERT INTO `guild_item_points` VALUES (0, 4304, 8, 0, 0, 7); -- Grimmonite

-- Fishing / Veteran
INSERT INTO `guild_item_points` VALUES (0, 4475, 9, 0, 0, 0); -- Sea Zombie
INSERT INTO `guild_item_points` VALUES (0, 4476, 9, 0, 0, 1); -- Titanictus
INSERT INTO `guild_item_points` VALUES (0, 4475, 9, 0, 0, 2); -- Sea Zombie
INSERT INTO `guild_item_points` VALUES (0, 4316, 9, 0, 0, 3); -- Armored Pisces
INSERT INTO `guild_item_points` VALUES (0, 4476, 9, 0, 0, 4); -- Titanictus
INSERT INTO `guild_item_points` VALUES (0, 4463, 9, 0, 0, 5); -- Takitaro
INSERT INTO `guild_item_points` VALUES (0, 4463, 9, 0, 0, 6); -- Takitaro
INSERT INTO `guild_item_points` VALUES (0, 4384, 9, 0, 0, 7); -- Black Sole

-- Woodworking / Amateur
INSERT INTO `guild_item_points` VALUES (1, 17095, 0, 0, 0, 0); -- Ash Pole
INSERT INTO `guild_item_points` VALUES (1, 17122, 0, 0, 0, 0); -- Ash Pole +1
INSERT INTO `guild_item_points` VALUES (1, 17049, 0, 0, 0, 1); -- Maple Wand
INSERT INTO `guild_item_points` VALUES (1, 17087, 0, 0, 0, 1); -- Maple Wand +1
INSERT INTO `guild_item_points` VALUES (1, 22, 0, 0, 0, 2); -- Workbench
INSERT INTO `guild_item_points` VALUES (1, 17088, 0, 0, 0, 3); -- Ash Staff
INSERT INTO `guild_item_points` VALUES (1, 17123, 0, 0, 0, 3); -- Ash Staff +1
INSERT INTO `guild_item_points` VALUES (1, 17024, 0, 0, 0, 4); -- Ash Club
INSERT INTO `guild_item_points` VALUES (1, 17137, 0, 0, 0, 4); -- Ash Club +1
INSERT INTO `guild_item_points` VALUES (1, 16832, 0, 0, 0, 5); -- Harpoon
INSERT INTO `guild_item_points` VALUES (1, 16862, 0, 0, 0, 5); -- Harpoon +1
INSERT INTO `guild_item_points` VALUES (1, 12289, 0, 0, 0, 6); -- Lauan Shield
INSERT INTO `guild_item_points` VALUES (1, 12333, 0, 0, 0, 6); -- Lauan Shield +1
INSERT INTO `guild_item_points` VALUES (1, 17345, 0, 0, 0, 7); -- Flute
INSERT INTO `guild_item_points` VALUES (1, 17372, 0, 0, 0, 7); -- Flute +1

-- Woodworking / Recruit
INSERT INTO `guild_item_points` VALUES (1, 17153, 1, 0, 0, 0); -- Self Bow
INSERT INTO `guild_item_points` VALUES (1, 17176, 1, 0, 0, 0); -- Self Bow +1
INSERT INTO `guild_item_points` VALUES (1, 12985, 1, 0, 0, 1); -- Holly Clogs
INSERT INTO `guild_item_points` VALUES (1, 12991, 1, 0, 0, 1); -- Holly Clogs +1
INSERT INTO `guild_item_points` VALUES (1, 12984, 1, 0, 0, 2); -- Ash Clogs
INSERT INTO `guild_item_points` VALUES (1, 12983, 1, 0, 0, 2); -- Ash Clogs +1
INSERT INTO `guild_item_points` VALUES (1, 23, 1, 0, 0, 3); -- Maple Table
INSERT INTO `guild_item_points` VALUES (1, 17050, 1, 0, 0, 4); -- Willow Wand
INSERT INTO `guild_item_points` VALUES (1, 17138, 1, 0, 0, 4); -- Willow Wand +1
INSERT INTO `guild_item_points` VALUES (1, 17216, 1, 0, 0, 5); -- Light Crossbow
INSERT INTO `guild_item_points` VALUES (1, 17228, 1, 0, 0, 5); -- Light Crossbow +1
INSERT INTO `guild_item_points` VALUES (1, 17096, 1, 0, 0, 6); -- Holly Pole
INSERT INTO `guild_item_points` VALUES (1, 17124, 1, 0, 0, 6); -- Holly Pole +1
INSERT INTO `guild_item_points` VALUES (1, 12290, 1, 0, 0, 7); -- Maple Shield
INSERT INTO `guild_item_points` VALUES (1, 12330, 1, 0, 0, 7); -- Maple Shield +1

-- Woodworking / Initiate
INSERT INTO `guild_item_points` VALUES (1, 17051, 2, 0, 0, 0); -- Yew Wand
INSERT INTO `guild_item_points` VALUES (1, 17140, 2, 0, 0, 0); -- Yew Wand +1
INSERT INTO `guild_item_points` VALUES (1, 17353, 2, 0, 0, 1); -- Maple Harp
INSERT INTO `guild_item_points` VALUES (1, 17373, 2, 0, 0, 1); -- Maple Harp +1
INSERT INTO `guild_item_points` VALUES (1, 92, 2, 0, 0, 2); -- Tarutaru Stool
INSERT INTO `guild_item_points` VALUES (1, 17354, 2, 0, 0, 3); -- Harp
INSERT INTO `guild_item_points` VALUES (1, 17374, 2, 0, 0, 3); -- Harp +1
INSERT INTO `guild_item_points` VALUES (1, 16834, 2, 0, 0, 4); -- Brass Spear
INSERT INTO `guild_item_points` VALUES (1, 16864, 2, 0, 0, 4); -- Brass Spear +1
INSERT INTO `guild_item_points` VALUES (1, 12291, 2, 0, 0, 5); -- Elm Shield
INSERT INTO `guild_item_points` VALUES (1, 12291, 2, 0, 0, 5); -- Elm Shield +1
INSERT INTO `guild_item_points` VALUES (1, 12319, 2, 0, 0, 6); -- Elm Staff
INSERT INTO `guild_item_points` VALUES (1, 17025, 2, 0, 0, 7); -- Chestnut Club (290 / 8640)
INSERT INTO `guild_item_points` VALUES (1, 17139, 2, 0, 0, 7); -- Solid Club (447 / 8640)

-- Woodworking / Novice
INSERT INTO `guild_item_points` VALUES (1, 17217, 3, 0, 0, 0); -- Crossbow
INSERT INTO `guild_item_points` VALUES (1, 17225, 3, 0, 0, 0); -- Crossbow +1
INSERT INTO `guild_item_points` VALUES (1, 17155, 3, 0, 0, 1); -- Composite Bow
INSERT INTO `guild_item_points` VALUES (1, 17179, 3, 0, 0, 1); -- Composite Bow +1
INSERT INTO `guild_item_points` VALUES (1, 17162, 3, 0, 0, 2); -- Great Bow
INSERT INTO `guild_item_points` VALUES (1, 17180, 3, 0, 0, 2); -- Great Bow  +1
INSERT INTO `guild_item_points` VALUES (1, 17424, 3, 0, 0, 3); -- Spiked Club (300 / 9120)
INSERT INTO `guild_item_points` VALUES (1, 17425, 3, 0, 0, 3); -- Spiked Club +1
INSERT INTO `guild_item_points` VALUES (1, 12986, 3, 0, 0, 4); -- Chestnut Sabots
INSERT INTO `guild_item_points` VALUES (1, 13022, 3, 0, 0, 4); -- Chestnut Sabots +1
INSERT INTO `guild_item_points` VALUES (1, 17052, 3, 0, 0, 5); -- Chestnut Wand
INSERT INTO `guild_item_points` VALUES (1, 17141, 3, 0, 0, 5); -- Solid Wand
INSERT INTO `guild_item_points` VALUES (1, 12292, 3, 0, 0, 6); -- Mahogany Shield (830 / 12960)
INSERT INTO `guild_item_points` VALUES (1, 12334, 3, 0, 0, 6); -- Strong Shield (1043 / 12960)
INSERT INTO `guild_item_points` VALUES (1, 16835, 3, 0, 0, 7); -- Spear
INSERT INTO `guild_item_points` VALUES (1, 16865, 3, 0, 0, 7); -- Spear +1

-- Woodworking / Apprentice
INSERT INTO `guild_item_points` VALUES (1, 12987, 4, 0, 0, 0); -- Ebony Sabots
INSERT INTO `guild_item_points` VALUES (1, 13023, 4, 0, 0, 0); -- Ebony Sabots +1
INSERT INTO `guild_item_points` VALUES (1, 17091, 4, 0, 0, 1); -- Oak Staff
INSERT INTO `guild_item_points` VALUES (1, 17127, 4, 0, 0, 1); -- Oak Staff +1
INSERT INTO `guild_item_points` VALUES (1, 16845, 4, 0, 0, 2); -- Lance
INSERT INTO `guild_item_points` VALUES (1, 16876, 4, 0, 0, 2); -- Lance +1
INSERT INTO `guild_item_points` VALUES (1, 17218, 4, 0, 0, 3); -- Zamburak
INSERT INTO `guild_item_points` VALUES (1, 17229, 4, 0, 0, 3); -- Zamburak +1
INSERT INTO `guild_item_points` VALUES (1, 17027, 4, 0, 0, 4); -- Oak Cudgel
INSERT INTO `guild_item_points` VALUES (1, 17142, 4, 0, 0, 4); -- Oak Cudgel +1
INSERT INTO `guild_item_points` VALUES (1, 16836, 4, 0, 0, 5); -- Halberd
INSERT INTO `guild_item_points` VALUES (1, 16866, 4, 0, 0, 5); -- Halberd +1
INSERT INTO `guild_item_points` VALUES (1, 17053, 4, 0, 0, 6); -- Rose Wand
INSERT INTO `guild_item_points` VALUES (1, 17143, 4, 0, 0, 6); -- Rose Wand +1
INSERT INTO `guild_item_points` VALUES (1, 12293, 4, 0, 0, 7); -- Oak Shield
INSERT INTO `guild_item_points` VALUES (1, 12331, 4, 0, 0, 7); -- Oak Shield +1

-- Woodworking / Journeyman
INSERT INTO `guild_item_points` VALUES (1, 17355, 5, 0, 0, 0); -- Rose Harp
INSERT INTO `guild_item_points` VALUES (1, 17376, 5, 0, 0, 0); -- Rose Harp +1
INSERT INTO `guild_item_points` VALUES (1, 17030, 5, 0, 0, 1); -- Great Club
INSERT INTO `guild_item_points` VALUES (1, 17408, 5, 0, 0, 1); -- Great Club +1
INSERT INTO `guild_item_points` VALUES (1, 16847, 5, 0, 0, 2); -- Mythril Lance
INSERT INTO `guild_item_points` VALUES (1, 16877, 5, 0, 0, 2); -- Mythril Lance +1
INSERT INTO `guild_item_points` VALUES (1, 17219, 5, 0, 0, 3); -- Arbalest
INSERT INTO `guild_item_points` VALUES (1, 17226, 5, 0, 0, 3); -- Arbalest +1
INSERT INTO `guild_item_points` VALUES (1, 16871, 5, 0, 0, 4); -- Kamayari
INSERT INTO `guild_item_points` VALUES (1, 16872, 5, 0, 0, 4); -- Kamayari +1
INSERT INTO `guild_item_points` VALUES (1, 17164, 5, 0, 0, 5); -- War Bow
INSERT INTO `guild_item_points` VALUES (1, 17173, 5, 0, 0, 5); -- War Bow +1
INSERT INTO `guild_item_points` VALUES (1, 17098, 5, 0, 0, 6); -- Oak Pole
INSERT INTO `guild_item_points` VALUES (1, 17120, 5, 0, 0, 6); -- Oak Pole +1
INSERT INTO `guild_item_points` VALUES (1, 21, 5, 0, 0, 7); -- Desk

-- Woodworking / Craftsman
INSERT INTO `guild_item_points` VALUES (1, 49, 6, 0, 0, 0); -- Coffer
INSERT INTO `guild_item_points` VALUES (1, 17157, 6, 0, 0, 1); -- Rapid Bow
INSERT INTO `guild_item_points` VALUES (1, 17189, 6, 0, 0, 1); -- Rapid Bow +1
INSERT INTO `guild_item_points` VALUES (1, 17054, 6, 0, 0, 2); -- Ebony Wand
INSERT INTO `guild_item_points` VALUES (1, 17427, 6, 0, 0, 2); -- Ebony Wand +1
INSERT INTO `guild_item_points` VALUES (1, 17561, 6, 0, 0, 3); -- Revenging Staff
INSERT INTO `guild_item_points` VALUES (1, 17562, 6, 0, 0, 3); -- Revenging Staff +1
INSERT INTO `guild_item_points` VALUES (1, 51, 6, 0, 0, 4); -- Chest
INSERT INTO `guild_item_points` VALUES (1, 17092, 6, 0, 0, 5); -- Mahogany Staff (2310 / 17760)
INSERT INTO `guild_item_points` VALUES (1, 17520, 6, 0, 0, 5); -- Heavy Staff (2310 / 17760)
INSERT INTO `guild_item_points` VALUES (1, 17350, 6, 0, 0, 6); -- Angel's Flute (1200 / 15120)
INSERT INTO `guild_item_points` VALUES (1, 17378, 6, 0, 0, 6); -- Angel's Flute (1280 / 15120)
INSERT INTO `guild_item_points` VALUES (1, 17240, 6, 0, 0, 7); -- Lightning Bow
INSERT INTO `guild_item_points` VALUES (1, 17241, 6, 0, 0, 7); -- Lightning Bow +1

-- Woodworking / Artisan
INSERT INTO `guild_item_points` VALUES (1, 56, 7, 0, 0, 0); -- Commode
INSERT INTO `guild_item_points` VALUES (1, 12295, 7, 0, 0, 1); -- Round Shield
INSERT INTO `guild_item_points` VALUES (1, 12352, 7, 0, 0, 1); -- Round Shield +1
INSERT INTO `guild_item_points` VALUES (1, 95, 7, 0, 0, 2); -- Water Barrel
INSERT INTO `guild_item_points` VALUES (1, 59, 7, 0, 0, 3); -- Chiffonier
INSERT INTO `guild_item_points` VALUES (1, 30, 7, 0, 0, 4); -- Bureau
INSERT INTO `guild_item_points` VALUES (1, 104, 7, 0, 0, 5); -- Tarutaru Folding Screen
INSERT INTO `guild_item_points` VALUES (1, 17100, 7, 0, 0, 6); -- Ebony Pole
INSERT INTO `guild_item_points` VALUES (1, 17525, 7, 0, 0, 6); -- Ebony Pole +1
INSERT INTO `guild_item_points` VALUES (1, 17357, 7, 0, 0, 7); -- Ebony Harp (2587 / 18240)
INSERT INTO `guild_item_points` VALUES (1, 17833, 7, 0, 0, 7); -- Ebony Harp +1 (2700 / 18240)

-- Woodworking / Adept
INSERT INTO `guild_item_points` VALUES (1, 16849, 8, 0, 0, 0); -- Cermet Lance
INSERT INTO `guild_item_points` VALUES (1, 16879, 8, 0, 0, 0); -- Cermet Lance +1
INSERT INTO `guild_item_points` VALUES (1, 17441, 8, 0, 0, 1); -- Eremite's Wand
INSERT INTO `guild_item_points` VALUES (1, 17442, 8, 0, 0, 1); -- Eremite's Wand +1
INSERT INTO `guild_item_points` VALUES (1, 17101, 8, 0, 0, 2); -- Mythic Pole
INSERT INTO `guild_item_points` VALUES (1, 17526, 8, 0, 0, 2); -- Mythic Pole +1
INSERT INTO `guild_item_points` VALUES (1, 17236, 8, 0, 0, 3); -- Leo Crossbow
INSERT INTO `guild_item_points` VALUES (1, 17237, 8, 0, 0, 3); -- Leo Crossbow +1
INSERT INTO `guild_item_points` VALUES (1, 17221, 8, 0, 0, 4); -- Repeating Crossbow (5425 / 20640)
INSERT INTO `guild_item_points` VALUES (1, 17233, 8, 0, 0, 4); -- Machine Crossbow (6200 / 20640)
INSERT INTO `guild_item_points` VALUES (1, 12364, 8, 0, 0, 5); -- Nymph Shield
INSERT INTO `guild_item_points` VALUES (1, 12365, 8, 0, 0, 5); -- Nymph Shield +1
INSERT INTO `guild_item_points` VALUES (1, 16890, 8, 0, 0, 6); -- Obelisk Lance
INSERT INTO `guild_item_points` VALUES (1, 16891, 8, 0, 0, 6); -- Obelisk Lance +1
INSERT INTO `guild_item_points` VALUES (1, 55, 8, 0, 0, 7); -- Cabinet

-- Woodworking / Veteran
INSERT INTO `guild_item_points` VALUES (1, 16840, 9, 0, 0, 0); -- Ox Tongue
INSERT INTO `guild_item_points` VALUES (1, 16894, 9, 0, 0, 0); -- Ox Tongue +1
INSERT INTO `guild_item_points` VALUES (1, 17205, 9, 0, 0, 1); -- Gendawa
INSERT INTO `guild_item_points` VALUES (1, 17206, 9, 0, 0, 1); -- Gendawa +1
INSERT INTO `guild_item_points` VALUES (1, 18142, 9, 0, 0, 2); -- Shigeto Bow
INSERT INTO `guild_item_points` VALUES (1, 18143, 9, 0, 0, 2); -- Shigeto Bow +1
INSERT INTO `guild_item_points` VALUES (1, 17102, 9, 0, 0, 3); -- Eight-Sided Pole
INSERT INTO `guild_item_points` VALUES (1, 17568, 9, 0, 0, 3); -- Eight-Sided Pole +1
INSERT INTO `guild_item_points` VALUES (1, 139, 9, 0, 0, 4); -- Star Globe
INSERT INTO `guild_item_points` VALUES (1, 17364, 9, 0, 0, 5); -- Cythara Anglica
INSERT INTO `guild_item_points` VALUES (1, 17837, 9, 0, 0, 5); -- Cythara Anglica +1
INSERT INTO `guild_item_points` VALUES (1, 76, 9, 0, 0, 6); -- Royal Bookshelf
INSERT INTO `guild_item_points` VALUES (1, 77, 9, 0, 0, 7); -- Bookshelf

-- Blacksmithing/ Amateur
INSERT INTO `guild_item_points` VALUES (2, 0, 0, 0, 0, 0); -- Bronze Knuckles
INSERT INTO `guild_item_points` VALUES (2, 0, 0, 0, 0, 1); -- Bronze Sword
INSERT INTO `guild_item_points` VALUES (2, 0, 0, 0, 0, 2); -- Xiphos
INSERT INTO `guild_item_points` VALUES (2, 0, 0, 0, 0, 3); -- Bronze Dagger
INSERT INTO `guild_item_points` VALUES (2, 0, 0, 0, 0, 4); -- Bronze Zaghnal
INSERT INTO `guild_item_points` VALUES (2, 0, 0, 0, 0, 5); -- Bronze Knife
INSERT INTO `guild_item_points` VALUES (2, 0, 0, 0, 0, 6); -- Bronze Mace
INSERT INTO `guild_item_points` VALUES (2, 0, 0, 0, 0, 7); -- Bronze Axe

-- Blacksmithing/ Recruit
INSERT INTO `guild_item_points` VALUES (2, 0, 1, 0, 0, 0); -- Scale Cuisses
INSERT INTO `guild_item_points` VALUES (2, 0, 1, 0, 0, 1); -- Scale Greaves
INSERT INTO `guild_item_points` VALUES (2, 0, 1, 0, 0, 2); -- Aspis
INSERT INTO `guild_item_points` VALUES (2, 0, 1, 0, 0, 3); -- Bronze Hammer
INSERT INTO `guild_item_points` VALUES (2, 0, 1, 0, 0, 4); -- Bronze Rod
INSERT INTO `guild_item_points` VALUES (2, 0, 1, 0, 0, 5); -- Scale Mail
INSERT INTO `guild_item_points` VALUES (2, 0, 1, 0, 0, 6); -- Scale Finger Gauntlets
INSERT INTO `guild_item_points` VALUES (2, 0, 1, 0, 0, 7); -- Bronze Harness

-- Blacksmithing/ Initiate
INSERT INTO `guild_item_points` VALUES (2, 0, 2, 0, 0, 0); -- Mace
INSERT INTO `guild_item_points` VALUES (2, 0, 2, 0, 0, 1); -- Iron Visor
INSERT INTO `guild_item_points` VALUES (2, 0, 2, 0, 0, 2); -- Knife
INSERT INTO `guild_item_points` VALUES (2, 0, 2, 0, 0, 3); -- Scimitar
INSERT INTO `guild_item_points` VALUES (2, 0, 2, 0, 0, 4); -- Baghnakhs
INSERT INTO `guild_item_points` VALUES (2, 0, 2, 0, 0, 5); -- Longsword
INSERT INTO `guild_item_points` VALUES (2, 0, 2, 0, 0, 6); -- Butterfly Axe
INSERT INTO `guild_item_points` VALUES (2, 0, 2, 0, 0, 7); -- Metal Knuckles

-- Blacksmithing/ Novice
INSERT INTO `guild_item_points` VALUES (2, 0, 3, 0, 0, 0); -- Targe
INSERT INTO `guild_item_points` VALUES (2, 0, 3, 0, 0, 1); -- Fleuret
INSERT INTO `guild_item_points` VALUES (2, 0, 3, 0, 0, 2); -- Tuck
INSERT INTO `guild_item_points` VALUES (2, 0, 3, 0, 0, 3); -- Wakizashi
INSERT INTO `guild_item_points` VALUES (2, 0, 3, 0, 0, 4); -- Rod
INSERT INTO `guild_item_points` VALUES (2, 0, 3, 0, 0, 5); -- Iron Scale Mail
INSERT INTO `guild_item_points` VALUES (2, 0, 3, 0, 0, 6); -- Mythril Mace
INSERT INTO `guild_item_points` VALUES (2, 0, 3, 0, 0, 7); -- Greataxe

-- Blacksmithing/ Apprentice
INSERT INTO `guild_item_points` VALUES (2, 0, 4, 0, 0, 0); -- Shinobi-Gatana
INSERT INTO `guild_item_points` VALUES (2, 0, 4, 0, 0, 1); -- Mythril Scythe
INSERT INTO `guild_item_points` VALUES (2, 0, 4, 0, 0, 2); -- Tulwar
INSERT INTO `guild_item_points` VALUES (2, 0, 4, 0, 0, 3); -- Mythril Kukri
INSERT INTO `guild_item_points` VALUES (2, 0, 4, 0, 0, 4); -- Heavy Axe
INSERT INTO `guild_item_points` VALUES (2, 0, 4, 0, 0, 5); -- Mythril Axe
INSERT INTO `guild_item_points` VALUES (2, 0, 4, 0, 0, 6); -- Knight's Sword
INSERT INTO `guild_item_points` VALUES (2, 0, 4, 0, 0, 7); -- Mythril Claymore

-- Blacksmithing/ Journeyman
INSERT INTO `guild_item_points` VALUES (2, 0, 5, 0, 0, 0); -- Darksteel Claws
INSERT INTO `guild_item_points` VALUES (2, 0, 5, 0, 0, 1); -- Breastplate
INSERT INTO `guild_item_points` VALUES (2, 0, 5, 0, 0, 2); -- Greatsword
INSERT INTO `guild_item_points` VALUES (2, 0, 5, 0, 0, 3); -- Sallet
INSERT INTO `guild_item_points` VALUES (2, 0, 5, 0, 0, 4); -- Uchigatana
INSERT INTO `guild_item_points` VALUES (2, 0, 5, 0, 0, 5); -- Tanegashima
INSERT INTO `guild_item_points` VALUES (2, 0, 5, 0, 0, 6); -- Schlaeger
INSERT INTO `guild_item_points` VALUES (2, 0, 5, 0, 0, 7); -- Broadsword

-- Blacksmithing/ Craftsman
INSERT INTO `guild_item_points` VALUES (2, 0, 6, 0, 0, 0); -- Kote
INSERT INTO `guild_item_points` VALUES (2, 0, 6, 0, 0, 1); -- Zunari Kabuto
INSERT INTO `guild_item_points` VALUES (2, 0, 6, 0, 0, 2); -- Sakurafubuki
INSERT INTO `guild_item_points` VALUES (2, 0, 6, 0, 0, 3); -- Nodowa
INSERT INTO `guild_item_points` VALUES (2, 0, 6, 0, 0, 4); -- Darksteel Mufflers
INSERT INTO `guild_item_points` VALUES (2, 0, 6, 0, 0, 5); -- Darksteel Kukri
INSERT INTO `guild_item_points` VALUES (2, 0, 6, 0, 0, 6); -- Hien
INSERT INTO `guild_item_points` VALUES (2, 0, 6, 0, 0, 7); -- Mythril Zaghnal

-- Blacksmithing/ Artisan
INSERT INTO `guild_item_points` VALUES (2, 0, 7, 0, 0, 0); -- Bastard Sword
INSERT INTO `guild_item_points` VALUES (2, 0, 7, 0, 0, 1); -- Darksteel Scythe
INSERT INTO `guild_item_points` VALUES (2, 0, 7, 0, 0, 2); -- Darksteel Kris
INSERT INTO `guild_item_points` VALUES (2, 0, 7, 0, 0, 3); -- Mikazuki
INSERT INTO `guild_item_points` VALUES (2, 0, 7, 0, 0, 4); -- Darksteel Cap
INSERT INTO `guild_item_points` VALUES (2, 0, 7, 0, 0, 5); -- Darksteel Subligar
INSERT INTO `guild_item_points` VALUES (2, 0, 7, 0, 0, 6); -- Holy Breastplate
INSERT INTO `guild_item_points` VALUES (2, 0, 7, 0, 0, 7); -- Schwert

-- Blacksmithing/ Adept
INSERT INTO `guild_item_points` VALUES (2, 0, 8, 0, 0, 0); -- Thick Mufflers
INSERT INTO `guild_item_points` VALUES (2, 0, 8, 0, 0, 1); -- Darksteel Cuirass
INSERT INTO `guild_item_points` VALUES (2, 0, 8, 0, 0, 2); -- Darksteel Maul
INSERT INTO `guild_item_points` VALUES (2, 0, 8, 0, 0, 3); -- Darksteel Sabatons
INSERT INTO `guild_item_points` VALUES (2, 0, 8, 0, 0, 4); -- Darksteel Tabar
INSERT INTO `guild_item_points` VALUES (2, 0, 8, 0, 0, 5); -- Mythril Heart
INSERT INTO `guild_item_points` VALUES (2, 0, 8, 0, 0, 6); -- Flamberge
INSERT INTO `guild_item_points` VALUES (2, 0, 8, 0, 0, 7); -- Darksteel Cuisses

-- Blacksmithing/ Veteran
INSERT INTO `guild_item_points` VALUES (2, 0, 9, 0, 0, 0); -- Ritter Shield
INSERT INTO `guild_item_points` VALUES (2, 0, 9, 0, 0, 1); -- Buzdygan
INSERT INTO `guild_item_points` VALUES (2, 0, 9, 0, 0, 2); -- Misericorde
INSERT INTO `guild_item_points` VALUES (2, 0, 9, 0, 0, 3); -- Anelace
INSERT INTO `guild_item_points` VALUES (2, 0, 9, 0, 0, 4); -- Culverin
INSERT INTO `guild_item_points` VALUES (2, 0, 9, 0, 0, 5); -- Nadziak
INSERT INTO `guild_item_points` VALUES (2, 0, 9, 0, 0, 6); -- Tabarzin
INSERT INTO `guild_item_points` VALUES (2, 0, 9, 0, 0, 7); -- Gully

-- Goldsmithing / Amateur
INSERT INTO `guild_item_points` VALUES (3, 12449, 0, 327, 7920, 0); -- Brass Cap [327 / 7920]
INSERT INTO `guild_item_points` VALUES (3, 12528, 0, 388, 7920, 0); -- Brass Cap +1 [388 / 7920]
INSERT INTO `guild_item_points` VALUES (3, 16551, 0, 194, 6240, 1); -- Sapara [194 / 6240]
INSERT INTO `guild_item_points` VALUES (3, 16801, 0, 214, 6240, 1); -- Sapara +1 [214 / 6240]
INSERT INTO `guild_item_points` VALUES (3, 12496, 0, 39, 3840, 2); -- Copper Hairpin [39 / 3840]
INSERT INTO `guild_item_points` VALUES (3, 12526, 0, 79, 3840, 2); -- Copper Hairpin +1 [79 / 3840]
INSERT INTO `guild_item_points` VALUES (3, 12496, 0, 39, 3840, 3); -- Copper Hairpin [39 / 3840]
INSERT INTO `guild_item_points` VALUES (3, 12526, 0, 79, 3840, 3); -- Copper Hairpin +1 [79 / 3840]
INSERT INTO `guild_item_points` VALUES (3, 16551, 0, 194, 6240, 4); -- Sapara [194 / 6240]
INSERT INTO `guild_item_points` VALUES (3, 16801, 0, 214, 6240, 4); -- Sapara +1 [214 / 6240]
INSERT INTO `guild_item_points` VALUES (3, 13454, 0, 19, 3600, 5); -- Copper Ring [19 / 3600]
INSERT INTO `guild_item_points` VALUES (3, 13492, 0, 21, 3600, 5); -- Copper Ring +1 [21 / 3600]
INSERT INTO `guild_item_points` VALUES (3, 12449, 0, 327, 7920, 6); -- Brass Cap [327 / 7920]
INSERT INTO `guild_item_points` VALUES (3, 12528, 0, 388, 7920, 6); -- Brass Cap +1 [388 / 7920]
INSERT INTO `guild_item_points` VALUES (3, 13454, 0, 19, 3600, 7); -- Copper Ring [19 / 3600]
INSERT INTO `guild_item_points` VALUES (3, 13492, 0, 21, 3600, 7); -- Copper Ring +1 [21 / 3600]

-- Goldsmithing / Recruit
INSERT INTO `guild_item_points` VALUES (3, 0, 1, 0, 0, 0); -- Brass Hairpin
INSERT INTO `guild_item_points` VALUES (3, 0, 1, 0, 0, 1); -- Brass Baghnakhs
INSERT INTO `guild_item_points` VALUES (3, 0, 1, 0, 0, 2); -- Brass Dagger
INSERT INTO `guild_item_points` VALUES (3, 0, 1, 0, 0, 3); -- Brass Zaghnal
INSERT INTO `guild_item_points` VALUES (3, 0, 1, 0, 0, 4); -- Brass Knuckles
INSERT INTO `guild_item_points` VALUES (3, 0, 1, 0, 0, 5); -- Brass Ring
INSERT INTO `guild_item_points` VALUES (3, 0, 1, 0, 0, 6); -- Brass Harness
INSERT INTO `guild_item_points` VALUES (3, 0, 1, 0, 0, 7); -- Brass Axe

-- Goldsmithing / Initiate
INSERT INTO `guild_item_points` VALUES (3, 0, 2, 0, 0, 0); -- Poet's Circlet
INSERT INTO `guild_item_points` VALUES (3, 0, 2, 0, 0, 1); -- Brass Mask
INSERT INTO `guild_item_points` VALUES (3, 0, 2, 0, 0, 2); -- Brass Rod
INSERT INTO `guild_item_points` VALUES (3, 0, 2, 0, 0, 3); -- Silver Hairpin
INSERT INTO `guild_item_points` VALUES (3, 0, 2, 0, 0, 4); -- Brass Hammer
INSERT INTO `guild_item_points` VALUES (3, 0, 2, 0, 0, 5); -- Silver Belt
INSERT INTO `guild_item_points` VALUES (3, 0, 2, 0, 0, 6); -- Brass Finger Gauntlets
INSERT INTO `guild_item_points` VALUES (3, 0, 2, 0, 0, 7); -- Silver Earring

-- Goldsmithing / Novice
INSERT INTO `guild_item_points` VALUES (3, 0, 3, 0, 0, 0); -- Chain Choker
INSERT INTO `guild_item_points` VALUES (3, 0, 3, 0, 0, 1); -- Brass Cuisses
INSERT INTO `guild_item_points` VALUES (3, 0, 3, 0, 0, 2); -- Chain Belt
INSERT INTO `guild_item_points` VALUES (3, 0, 3, 0, 0, 3); -- Silver Mask
INSERT INTO `guild_item_points` VALUES (3, 0, 3, 0, 0, 4); -- Spark Bilbo
INSERT INTO `guild_item_points` VALUES (3, 0, 3, 0, 0, 5); -- Chain Gorget
INSERT INTO `guild_item_points` VALUES (3, 0, 3, 0, 0, 6); -- Silver Mittens
INSERT INTO `guild_item_points` VALUES (3, 0, 3, 0, 0, 7); -- Spark Spear

-- Goldsmithing / Apprentice
INSERT INTO `guild_item_points` VALUES (3, 0, 4, 0, 0, 0); -- Banded Helm
INSERT INTO `guild_item_points` VALUES (3, 0, 4, 0, 0, 1); -- Buckler
INSERT INTO `guild_item_points` VALUES (3, 0, 4, 0, 0, 2); -- Mythril Baselard
INSERT INTO `guild_item_points` VALUES (3, 0, 4, 0, 0, 3); -- Mythril Ring
INSERT INTO `guild_item_points` VALUES (3, 0, 4, 0, 0, 4); -- Silver Mail
INSERT INTO `guild_item_points` VALUES (3, 0, 4, 0, 0, 5); -- Sollerets
INSERT INTO `guild_item_points` VALUES (3, 0, 4, 0, 0, 6); -- Silver Bangles
INSERT INTO `guild_item_points` VALUES (3, 0, 4, 0, 0, 7); -- Mythril Earring

-- Goldsmithing / Journeyman
INSERT INTO `guild_item_points` VALUES (3, 0, 5, 0, 0, 0); -- Gold Ring
INSERT INTO `guild_item_points` VALUES (3, 0, 5, 0, 0, 1); -- Spark Kris
INSERT INTO `guild_item_points` VALUES (3, 0, 5, 0, 0, 2); -- Mythril Gorget
INSERT INTO `guild_item_points` VALUES (3, 0, 5, 0, 0, 3); -- Melody Earring
INSERT INTO `guild_item_points` VALUES (3, 0, 5, 0, 0, 4); -- Heater Shield
INSERT INTO `guild_item_points` VALUES (3, 0, 5, 0, 0, 5); -- Gold Earring
INSERT INTO `guild_item_points` VALUES (3, 0, 5, 0, 0, 6); -- Mythril Degen
INSERT INTO `guild_item_points` VALUES (3, 0, 5, 0, 0, 7); -- Wingedge

-- Goldsmithing / Craftsman
INSERT INTO `guild_item_points` VALUES (3, 0, 6, 0, 0, 0); -- Mythril Cuisses
INSERT INTO `guild_item_points` VALUES (3, 0, 6, 0, 0, 1); -- Gold Bangles
INSERT INTO `guild_item_points` VALUES (3, 0, 6, 0, 0, 2); -- Mythril Leggings
INSERT INTO `guild_item_points` VALUES (3, 0, 6, 0, 0, 3); -- Platinum Ring
INSERT INTO `guild_item_points` VALUES (3, 0, 6, 0, 0, 4); -- Mythril Gauntlets
INSERT INTO `guild_item_points` VALUES (3, 0, 6, 0, 0, 5); -- Mythril Breastplate
INSERT INTO `guild_item_points` VALUES (3, 0, 6, 0, 0, 6); -- Mailbreaker
INSERT INTO `guild_item_points` VALUES (3, 0, 6, 0, 0, 7); -- Mythril Cuisses

-- Goldsmithing / Artisan
INSERT INTO `guild_item_points` VALUES (3, 0, 7, 0, 0, 0); -- Gold Patas
INSERT INTO `guild_item_points` VALUES (3, 0, 7, 0, 0, 1); -- Diamond Knuckles
INSERT INTO `guild_item_points` VALUES (3, 0, 7, 0, 0, 2); -- Gold Sword
INSERT INTO `guild_item_points` VALUES (3, 0, 7, 0, 0, 3); -- Ashura
INSERT INTO `guild_item_points` VALUES (3, 0, 7, 0, 0, 4); -- Moonring Blade
INSERT INTO `guild_item_points` VALUES (3, 0, 7, 0, 0, 5); -- Gold Sabatons
INSERT INTO `guild_item_points` VALUES (3, 0, 7, 0, 0, 6); -- Gold Buckler
INSERT INTO `guild_item_points` VALUES (3, 0, 7, 0, 0, 7); -- Gold Cuisses

-- Goldsmithing / Adept
INSERT INTO `guild_item_points` VALUES (3, 0, 8, 0, 0, 0); -- Kazaridachi
INSERT INTO `guild_item_points` VALUES (3, 0, 8, 0, 0, 1); -- Diamond Shield
INSERT INTO `guild_item_points` VALUES (3, 0, 8, 0, 0, 2); -- Golden Spear
INSERT INTO `guild_item_points` VALUES (3, 0, 8, 0, 0, 3); -- Platinum Bangles
INSERT INTO `guild_item_points` VALUES (3, 0, 8, 0, 0, 4); -- Platinum Mace
INSERT INTO `guild_item_points` VALUES (3, 0, 8, 0, 0, 5); -- Epee
INSERT INTO `guild_item_points` VALUES (3, 0, 8, 0, 0, 6); -- Jeweled Collar
INSERT INTO `guild_item_points` VALUES (3, 0, 8, 0, 0, 7); -- Jagdplaute

-- Goldsmithing / Veteran
INSERT INTO `guild_item_points` VALUES (3, 0, 9, 0, 0, 0); -- Verdun
INSERT INTO `guild_item_points` VALUES (3, 0, 9, 0, 0, 1); -- Orichalcum Dagger
INSERT INTO `guild_item_points` VALUES (3, 0, 9, 0, 0, 2); -- Muscle Belt
INSERT INTO `guild_item_points` VALUES (3, 0, 9, 0, 0, 3); -- Brisingamen
INSERT INTO `guild_item_points` VALUES (3, 0, 9, 0, 0, 4); -- Orichalcum Ring
INSERT INTO `guild_item_points` VALUES (3, 0, 9, 0, 0, 5); -- Koenig Shield
INSERT INTO `guild_item_points` VALUES (3, 0, 9, 0, 0, 6); -- Millionaire Desk
INSERT INTO `guild_item_points` VALUES (3, 0, 9, 0, 0, 7); -- Orichalcum Earring

-- Clothcraft / Amateur
INSERT INTO `guild_item_points` VALUES (4, 0, 0, 0, 0, 0); -- Gloves
INSERT INTO `guild_item_points` VALUES (4, 0, 0, 0, 0, 1); -- Brais
INSERT INTO `guild_item_points` VALUES (4, 0, 0, 0, 0, 2); -- Cape
INSERT INTO `guild_item_points` VALUES (4, 0, 0, 0, 0, 3); -- Gaiters
INSERT INTO `guild_item_points` VALUES (4, 0, 0, 0, 0, 4); -- Doublet
INSERT INTO `guild_item_points` VALUES (4, 0, 0, 0, 0, 5); -- Cape
INSERT INTO `guild_item_points` VALUES (4, 0, 0, 0, 0, 6); -- Headgear
INSERT INTO `guild_item_points` VALUES (4, 0, 0, 0, 0, 7); -- Vagabond's Hose

-- Clothcraft / Recruit
INSERT INTO `guild_item_points` VALUES (4, 0, 1, 0, 0, 0); -- Tunic
INSERT INTO `guild_item_points` VALUES (4, 0, 1, 0, 0, 1); -- Cotton Doublet
INSERT INTO `guild_item_points` VALUES (4, 0, 1, 0, 0, 2); -- Kenpogi
INSERT INTO `guild_item_points` VALUES (4, 0, 1, 0, 0, 3); -- Robe
INSERT INTO `guild_item_points` VALUES (4, 0, 1, 0, 0, 4); -- Tekko
INSERT INTO `guild_item_points` VALUES (4, 0, 1, 0, 0, 5); -- Cuffs
INSERT INTO `guild_item_points` VALUES (4, 0, 1, 0, 0, 6); -- Cotton Cape
INSERT INTO `guild_item_points` VALUES (4, 0, 1, 0, 0, 7); -- Vagabond's Tunica

-- Clothcraft / Initiate
INSERT INTO `guild_item_points` VALUES (4, 0, 2, 0, 0, 0); -- Cotton Tekko
INSERT INTO `guild_item_points` VALUES (4, 0, 2, 0, 0, 1); -- Cotton Kyahan
INSERT INTO `guild_item_points` VALUES (4, 0, 2, 0, 0, 2); -- Cotton Dogi
INSERT INTO `guild_item_points` VALUES (4, 0, 2, 0, 0, 3); -- Cotton Hachimaki
INSERT INTO `guild_item_points` VALUES (4, 0, 2, 0, 0, 4); -- Gambison
INSERT INTO `guild_item_points` VALUES (4, 0, 2, 0, 0, 5); -- Linen Cuffs
INSERT INTO `guild_item_points` VALUES (4, 0, 2, 0, 0, 6); -- Heko Obi
INSERT INTO `guild_item_points` VALUES (4, 0, 2, 0, 0, 7); -- Linen Robe

-- Clothcraft / Novice
INSERT INTO `guild_item_points` VALUES (4, 0, 3, 0, 0, 0); -- Soil Kyahan
INSERT INTO `guild_item_points` VALUES (4, 0, 3, 0, 0, 1); -- Mist Tunic
INSERT INTO `guild_item_points` VALUES (4, 0, 3, 0, 0, 2); -- Mist Mitts
INSERT INTO `guild_item_points` VALUES (4, 0, 3, 0, 0, 3); -- Cloak
INSERT INTO `guild_item_points` VALUES (4, 0, 3, 0, 0, 4); -- Soil Tekko
INSERT INTO `guild_item_points` VALUES (4, 0, 3, 0, 0, 5); -- Soil Sitabaki
INSERT INTO `guild_item_points` VALUES (4, 0, 3, 0, 0, 6); -- Mist Slacks
INSERT INTO `guild_item_points` VALUES (4, 0, 3, 0, 0, 7); -- Soil Hachimaki

-- Clothcraft / Apprentice
INSERT INTO `guild_item_points` VALUES (4, 0, 4, 0, 0, 0); -- Wool Bracers
INSERT INTO `guild_item_points` VALUES (4, 0, 4, 0, 0, 1); -- Wool Socks
INSERT INTO `guild_item_points` VALUES (4, 0, 4, 0, 0, 2); -- Wool Slops
INSERT INTO `guild_item_points` VALUES (4, 0, 4, 0, 0, 3); -- Wool Cap
INSERT INTO `guild_item_points` VALUES (4, 0, 4, 0, 0, 4); -- Wool Robe
INSERT INTO `guild_item_points` VALUES (4, 0, 4, 0, 0, 5); -- Hemp Gorget
INSERT INTO `guild_item_points` VALUES (4, 0, 4, 0, 0, 6); -- Wool Hose
INSERT INTO `guild_item_points` VALUES (4, 0, 4, 0, 0, 7); -- Wool Cuffs

-- Clothcraft / Journeyman
INSERT INTO `guild_item_points` VALUES (4, 0, 5, 0, 0, 0); -- Black Mitts
INSERT INTO `guild_item_points` VALUES (4, 0, 5, 0, 0, 1); -- Velvet Robe
INSERT INTO `guild_item_points` VALUES (4, 0, 5, 0, 0, 2); -- Scarlet Ribbon
INSERT INTO `guild_item_points` VALUES (4, 0, 5, 0, 0, 3); -- Red Cape
INSERT INTO `guild_item_points` VALUES (4, 0, 5, 0, 0, 4); -- Black Slacks
INSERT INTO `guild_item_points` VALUES (4, 0, 5, 0, 0, 5); -- Black Cape
INSERT INTO `guild_item_points` VALUES (4, 0, 5, 0, 0, 6); -- Linen Doublet
INSERT INTO `guild_item_points` VALUES (4, 0, 5, 0, 0, 7); -- Silver Obi

-- Clothcraft / Craftsman
INSERT INTO `guild_item_points` VALUES (4, 0, 6, 0, 0, 0); -- Silk Coat
INSERT INTO `guild_item_points` VALUES (4, 0, 6, 0, 0, 1); -- Silk Headband
INSERT INTO `guild_item_points` VALUES (4, 0, 6, 0, 0, 2); -- White Slacks
INSERT INTO `guild_item_points` VALUES (4, 0, 6, 0, 0, 3); -- Wool Doublet
INSERT INTO `guild_item_points` VALUES (4, 0, 6, 0, 0, 4); -- Green Ribbon
INSERT INTO `guild_item_points` VALUES (4, 0, 6, 0, 0, 5); -- White Cloak
INSERT INTO `guild_item_points` VALUES (4, 0, 6, 0, 0, 6); -- Silk Slops
INSERT INTO `guild_item_points` VALUES (4, 0, 6, 0, 0, 7); -- Velvet Cuffs

-- Clothcraft / Artisan
INSERT INTO `guild_item_points` VALUES (4, 0, 7, 0, 0, 0); -- Green Beret
INSERT INTO `guild_item_points` VALUES (4, 0, 7, 0, 0, 1); -- Silk Cloak
INSERT INTO `guild_item_points` VALUES (4, 0, 7, 0, 0, 2); -- Shinobi Kyahan
INSERT INTO `guild_item_points` VALUES (4, 0, 7, 0, 0, 3); -- Shinobi Tekko
INSERT INTO `guild_item_points` VALUES (4, 0, 7, 0, 0, 4); -- Jester's Cape
INSERT INTO `guild_item_points` VALUES (4, 0, 7, 0, 0, 5); -- Silk Mitts
INSERT INTO `guild_item_points` VALUES (4, 0, 7, 0, 0, 6); -- Shinobi Hakama
INSERT INTO `guild_item_points` VALUES (4, 0, 7, 0, 0, 7); -- Shinobi Tekko

-- Clothcraft / Adept
INSERT INTO `guild_item_points` VALUES (4, 0, 8, 0, 0, 0); -- Arhat's Tekko
INSERT INTO `guild_item_points` VALUES (4, 0, 8, 0, 0, 1); -- Rainbow Obi
INSERT INTO `guild_item_points` VALUES (4, 0, 8, 0, 0, 2); -- Noble's Slacks
INSERT INTO `guild_item_points` VALUES (4, 0, 8, 0, 0, 3); -- Rainbow Headband
INSERT INTO `guild_item_points` VALUES (4, 0, 8, 0, 0, 4); -- Noble's Mitts
INSERT INTO `guild_item_points` VALUES (4, 0, 8, 0, 0, 5); -- Arhat's Sune-Ate
INSERT INTO `guild_item_points` VALUES (4, 0, 8, 0, 0, 6); -- Arhat's Hakama
INSERT INTO `guild_item_points` VALUES (4, 0, 8, 0, 0, 7); -- Arhat's Jinpachi

-- Clothcraft / Veteran
INSERT INTO `guild_item_points` VALUES (4, 0, 9, 0, 0, 0); -- Rasetsu Tekko
INSERT INTO `guild_item_points` VALUES (4, 0, 9, 0, 0, 1); -- Rasetsu Hakama
INSERT INTO `guild_item_points` VALUES (4, 0, 9, 0, 0, 2); -- Tarutaru Sash
INSERT INTO `guild_item_points` VALUES (4, 0, 9, 0, 0, 3); -- Errant Slops
INSERT INTO `guild_item_points` VALUES (4, 0, 9, 0, 0, 4); -- Errant Hat
INSERT INTO `guild_item_points` VALUES (4, 0, 9, 0, 0, 5); -- Rasetsu Sune-Ate
INSERT INTO `guild_item_points` VALUES (4, 0, 9, 0, 0, 6); -- Errant Cuffs
INSERT INTO `guild_item_points` VALUES (4, 0, 9, 0, 0, 7); -- Rasetsu Jinpachi

-- Leathercraft / Amateur
INSERT INTO `guild_item_points` VALUES (5, 0, 0, 0, 0, 0); -- Leather Vest
INSERT INTO `guild_item_points` VALUES (5, 0, 0, 0, 0, 1); -- Leather Gloves
INSERT INTO `guild_item_points` VALUES (5, 0, 0, 0, 0, 2); -- Vagabond's Gloves
INSERT INTO `guild_item_points` VALUES (5, 0, 0, 0, 0, 3); -- Leather Highboots
INSERT INTO `guild_item_points` VALUES (5, 0, 0, 0, 0, 4); -- Leather Bandana
INSERT INTO `guild_item_points` VALUES (5, 0, 0, 0, 0, 5); -- Rabbit Mantle
INSERT INTO `guild_item_points` VALUES (5, 0, 0, 0, 0, 6); -- Vagabond's Boots
INSERT INTO `guild_item_points` VALUES (5, 0, 0, 0, 0, 7); -- Cesti

-- Leathercraft / Recruit
INSERT INTO `guild_item_points` VALUES (5, 0, 1, 0, 0, 0); -- Solea
INSERT INTO `guild_item_points` VALUES (5, 0, 1, 0, 0, 1); -- Lizard Helm
INSERT INTO `guild_item_points` VALUES (5, 0, 1, 0, 0, 2); -- Leather Belt
INSERT INTO `guild_item_points` VALUES (5, 0, 1, 0, 0, 3); -- Lizard Cesti
INSERT INTO `guild_item_points` VALUES (5, 0, 1, 0, 0, 4); -- Lizard Mantle
INSERT INTO `guild_item_points` VALUES (5, 0, 1, 0, 0, 5); -- Fisherman's Boots
INSERT INTO `guild_item_points` VALUES (5, 0, 1, 0, 0, 6); -- Lizard Jerkin
INSERT INTO `guild_item_points` VALUES (5, 0, 1, 0, 0, 7); -- Fisherman's Gloves

-- Leathercraft / Initiate
INSERT INTO `guild_item_points` VALUES (5, 0, 2, 0, 0, 0); -- Studded Bandana
INSERT INTO `guild_item_points` VALUES (5, 0, 2, 0, 0, 1); -- Studded Gloves
INSERT INTO `guild_item_points` VALUES (5, 0, 2, 0, 0, 2); -- Chocobo Gloves
INSERT INTO `guild_item_points` VALUES (5, 0, 2, 0, 0, 3); -- Dhalmel Mantle
INSERT INTO `guild_item_points` VALUES (5, 0, 2, 0, 0, 4); -- Warrior's Belt
INSERT INTO `guild_item_points` VALUES (5, 0, 2, 0, 0, 5); -- Chocobo Boots
INSERT INTO `guild_item_points` VALUES (5, 0, 2, 0, 0, 6); -- Sandals
INSERT INTO `guild_item_points` VALUES (5, 0, 2, 0, 0, 7); -- Leather Ring

-- Leathercraft / Novice
INSERT INTO `guild_item_points` VALUES (5, 0, 3, 0, 0, 0); -- Mist Pumps
INSERT INTO `guild_item_points` VALUES (5, 0, 3, 0, 0, 1); -- Wolf Gorget
INSERT INTO `guild_item_points` VALUES (5, 0, 3, 0, 0, 2); -- Wolf Mantle
INSERT INTO `guild_item_points` VALUES (5, 0, 3, 0, 0, 3); -- Leather Gorget
INSERT INTO `guild_item_points` VALUES (5, 0, 3, 0, 0, 4); -- Shoes
INSERT INTO `guild_item_points` VALUES (5, 0, 3, 0, 0, 5); -- Magic Belt
INSERT INTO `guild_item_points` VALUES (5, 0, 3, 0, 0, 6); -- Cuir Gloves
INSERT INTO `guild_item_points` VALUES (5, 0, 3, 0, 0, 7); -- Studded Vest

-- Leathercraft / Apprentice
INSERT INTO `guild_item_points` VALUES (5, 0, 4, 0, 0, 0); -- Corsette
INSERT INTO `guild_item_points` VALUES (5, 0, 4, 0, 0, 1); -- Ram Mantle
INSERT INTO `guild_item_points` VALUES (5, 0, 4, 0, 0, 2); -- Cuir Highboots
INSERT INTO `guild_item_points` VALUES (5, 0, 4, 0, 0, 3); -- Cuir Bouilli
INSERT INTO `guild_item_points` VALUES (5, 0, 4, 0, 0, 4); -- Waistbelt
INSERT INTO `guild_item_points` VALUES (5, 0, 4, 0, 0, 5); -- Cuir Trousers
INSERT INTO `guild_item_points` VALUES (5, 0, 4, 0, 0, 6); -- Chocobo Jack Coat
INSERT INTO `guild_item_points` VALUES (5, 0, 4, 0, 0, 7); -- Barbarian's Belt

-- Leathercraft / Journeyman
INSERT INTO `guild_item_points` VALUES (5, 0, 5, 0, 0, 0); -- Raptor Helm
INSERT INTO `guild_item_points` VALUES (5, 0, 5, 0, 0, 1); -- Raptor Gloves
INSERT INTO `guild_item_points` VALUES (5, 0, 5, 0, 0, 2); -- Himantes
INSERT INTO `guild_item_points` VALUES (5, 0, 5, 0, 0, 3); -- Raptor Ledelsens
INSERT INTO `guild_item_points` VALUES (5, 0, 5, 0, 0, 4); -- Raptor Mantle
INSERT INTO `guild_item_points` VALUES (5, 0, 5, 0, 0, 5); -- Raptor Trousers
INSERT INTO `guild_item_points` VALUES (5, 0, 5, 0, 0, 6); -- Desert Boots
INSERT INTO `guild_item_points` VALUES (5, 0, 5, 0, 0, 7); -- Leather Shield

-- Leathercraft / Craftsman
INSERT INTO `guild_item_points` VALUES (5, 0, 6, 0, 0, 0); -- Beak Helm
INSERT INTO `guild_item_points` VALUES (5, 0, 6, 0, 0, 1); -- Beak Gloves
INSERT INTO `guild_item_points` VALUES (5, 0, 6, 0, 0, 2); -- Beak Mantle
INSERT INTO `guild_item_points` VALUES (5, 0, 6, 0, 0, 3); -- Battle Boots
INSERT INTO `guild_item_points` VALUES (5, 0, 6, 0, 0, 4); -- Beak Trousers
INSERT INTO `guild_item_points` VALUES (5, 0, 6, 0, 0, 5); -- Beak Ledelsens
INSERT INTO `guild_item_points` VALUES (5, 0, 6, 0, 0, 6); -- Beak Jerkin
INSERT INTO `guild_item_points` VALUES (5, 0, 6, 0, 0, 7); -- Hard Leather Ring

-- Leathercraft / Artisan
INSERT INTO `guild_item_points` VALUES (5, 0, 7, 0, 0, 0); -- Silk Pumps
INSERT INTO `guild_item_points` VALUES (5, 0, 7, 0, 0, 1); -- Tiger Gloves
INSERT INTO `guild_item_points` VALUES (5, 0, 7, 0, 0, 2); -- Coeurl Cesti
INSERT INTO `guild_item_points` VALUES (5, 0, 7, 0, 0, 3); -- Tiger Mantle
INSERT INTO `guild_item_points` VALUES (5, 0, 7, 0, 0, 4); -- Battle Hose
INSERT INTO `guild_item_points` VALUES (5, 0, 7, 0, 0, 5); -- Tiger Trousers
INSERT INTO `guild_item_points` VALUES (5, 0, 7, 0, 0, 6); -- Black Mantle
INSERT INTO `guild_item_points` VALUES (5, 0, 7, 0, 0, 7); -- Swordbelt

-- Leathercraft / Adept
INSERT INTO `guild_item_points` VALUES (5, 0, 8, 0, 0, 0); -- Ogre Jerkin
INSERT INTO `guild_item_points` VALUES (5, 0, 8, 0, 0, 1); -- Ogre Mask
INSERT INTO `guild_item_points` VALUES (5, 0, 8, 0, 0, 2); -- Coeurl Mantle
INSERT INTO `guild_item_points` VALUES (5, 0, 8, 0, 0, 3); -- Koenigs Belt
INSERT INTO `guild_item_points` VALUES (5, 0, 8, 0, 0, 4); -- Ogre Ledelsens
INSERT INTO `guild_item_points` VALUES (5, 0, 8, 0, 0, 5); -- Coeurl Mask
INSERT INTO `guild_item_points` VALUES (5, 0, 8, 0, 0, 6); -- Ogre Gloves
INSERT INTO `guild_item_points` VALUES (5, 0, 8, 0, 0, 7); -- Ogre Trousers

-- Leathercraft / Veteran
INSERT INTO `guild_item_points` VALUES (5, 0, 9, 0, 0, 0); -- Bison Gamashes
INSERT INTO `guild_item_points` VALUES (5, 0, 9, 0, 0, 1); -- Bison Kecks
INSERT INTO `guild_item_points` VALUES (5, 0, 9, 0, 0, 2); -- Cardinal Vest
INSERT INTO `guild_item_points` VALUES (5, 0, 9, 0, 0, 3); -- Bison Wristbands
INSERT INTO `guild_item_points` VALUES (5, 0, 9, 0, 0, 4); -- Tiger Mask
INSERT INTO `guild_item_points` VALUES (5, 0, 9, 0, 0, 5); -- Barone Cosciales
INSERT INTO `guild_item_points` VALUES (5, 0, 9, 0, 0, 6); -- Tiger Mask
INSERT INTO `guild_item_points` VALUES (5, 0, 9, 0, 0, 7); -- Errant Pigaches

-- Bonecraft / Amateur
INSERT INTO `guild_item_points` VALUES (6, 0, 0, 0, 0, 0); -- Bone Hairpin
INSERT INTO `guild_item_points` VALUES (6, 0, 0, 0, 0, 1); -- Shell Ring
INSERT INTO `guild_item_points` VALUES (6, 0, 0, 0, 0, 2); -- Bone Hairpin
INSERT INTO `guild_item_points` VALUES (6, 0, 0, 0, 0, 3); -- Shell Earring
INSERT INTO `guild_item_points` VALUES (6, 0, 0, 0, 0, 4); -- Shell Ring
INSERT INTO `guild_item_points` VALUES (6, 0, 0, 0, 0, 5); -- Cat Baghnakhs
INSERT INTO `guild_item_points` VALUES (6, 0, 0, 0, 0, 6); -- Cat Baghnakhs
INSERT INTO `guild_item_points` VALUES (6, 0, 0, 0, 0, 7); -- Shell Earring

-- Bonecraft / Recruit
INSERT INTO `guild_item_points` VALUES (6, 0, 1, 0, 0, 0); -- Bone Mittens
INSERT INTO `guild_item_points` VALUES (6, 0, 1, 0, 0, 1); -- Bone Mask
INSERT INTO `guild_item_points` VALUES (6, 0, 1, 0, 0, 2); -- Fang Necklace
INSERT INTO `guild_item_points` VALUES (6, 0, 1, 0, 0, 3); -- Bone Mask
INSERT INTO `guild_item_points` VALUES (6, 0, 1, 0, 0, 4); -- Fang Necklace
INSERT INTO `guild_item_points` VALUES (6, 0, 1, 0, 0, 5); -- Bone Ring
INSERT INTO `guild_item_points` VALUES (6, 0, 1, 0, 0, 6); -- Bone Mittens
INSERT INTO `guild_item_points` VALUES (6, 0, 1, 0, 0, 7); -- Bone Earring

-- Bonecraft / Initiate
INSERT INTO `guild_item_points` VALUES (6, 0, 2, 0, 0, 0); -- Bone Harness
INSERT INTO `guild_item_points` VALUES (6, 0, 2, 0, 0, 1); -- Horn Hairpin
INSERT INTO `guild_item_points` VALUES (6, 0, 2, 0, 0, 2); -- Bone Leggings
INSERT INTO `guild_item_points` VALUES (6, 0, 2, 0, 0, 3); -- Gemshorn
INSERT INTO `guild_item_points` VALUES (6, 0, 2, 0, 0, 4); -- Bone Pick
INSERT INTO `guild_item_points` VALUES (6, 0, 2, 0, 0, 5); -- Bone Subligar
INSERT INTO `guild_item_points` VALUES (6, 0, 2, 0, 0, 6); -- Beetle Mittens
INSERT INTO `guild_item_points` VALUES (6, 0, 2, 0, 0, 7); -- Bone Axe

-- Bonecraft / Novice
INSERT INTO `guild_item_points` VALUES (6, 0, 3, 0, 0, 0); -- Horn Ring
INSERT INTO `guild_item_points` VALUES (6, 0, 3, 0, 0, 1); -- Bone Cudgel
INSERT INTO `guild_item_points` VALUES (6, 0, 3, 0, 0, 2); -- Beetle Leggings
INSERT INTO `guild_item_points` VALUES (6, 0, 3, 0, 0, 3); -- Beetle Harness
INSERT INTO `guild_item_points` VALUES (6, 0, 3, 0, 0, 4); -- Beetle Subligar
INSERT INTO `guild_item_points` VALUES (6, 0, 3, 0, 0, 5); -- Turtle Shield
INSERT INTO `guild_item_points` VALUES (6, 0, 3, 0, 0, 6); -- Shade Leggings
INSERT INTO `guild_item_points` VALUES (6, 0, 3, 0, 0, 7); -- Beetle Gorget

-- Bonecraft / Apprentice
INSERT INTO `guild_item_points` VALUES (6, 0, 4, 0, 0, 0); -- Horn
INSERT INTO `guild_item_points` VALUES (6, 0, 4, 0, 0, 1); -- Carapace Subligar
INSERT INTO `guild_item_points` VALUES (6, 0, 4, 0, 0, 2); -- Carapace Ring
INSERT INTO `guild_item_points` VALUES (6, 0, 4, 0, 0, 3); -- Carapace Leggings
INSERT INTO `guild_item_points` VALUES (6, 0, 4, 0, 0, 4); -- Carapace Mittens
INSERT INTO `guild_item_points` VALUES (6, 0, 4, 0, 0, 5); -- Carapace Mask
INSERT INTO `guild_item_points` VALUES (6, 0, 4, 0, 0, 6); -- Carapace Gorget
INSERT INTO `guild_item_points` VALUES (6, 0, 4, 0, 0, 7); -- Bone Knife

-- Bonecraft / Journeyman
INSERT INTO `guild_item_points` VALUES (6, 0, 5, 0, 0, 0); -- Bone Scythe
INSERT INTO `guild_item_points` VALUES (6, 0, 5, 0, 0, 1); -- Blood Stone
INSERT INTO `guild_item_points` VALUES (6, 0, 5, 0, 0, 2); -- Bandit's Gun
INSERT INTO `guild_item_points` VALUES (6, 0, 5, 0, 0, 3); -- Tortoise Earring
INSERT INTO `guild_item_points` VALUES (6, 0, 5, 0, 0, 4); -- Shell Hairpin
INSERT INTO `guild_item_points` VALUES (6, 0, 5, 0, 0, 5); -- Turtle Bangles
INSERT INTO `guild_item_points` VALUES (6, 0, 5, 0, 0, 6); -- Beetle Knife
INSERT INTO `guild_item_points` VALUES (6, 0, 5, 0, 0, 7); -- Bone Rod

-- Bonecraft / Craftsman
INSERT INTO `guild_item_points` VALUES (6, 0, 6, 0, 0, 0); -- Crumhorn
INSERT INTO `guild_item_points` VALUES (6, 0, 6, 0, 0, 1); -- Scorpion Subligar
INSERT INTO `guild_item_points` VALUES (6, 0, 6, 0, 0, 2); -- Pirate's Gun
INSERT INTO `guild_item_points` VALUES (6, 0, 6, 0, 0, 3); -- Scorpion Leggings
INSERT INTO `guild_item_points` VALUES (6, 0, 6, 0, 0, 4); -- Scorpion Mittens
INSERT INTO `guild_item_points` VALUES (6, 0, 6, 0, 0, 5); -- Scorpion Mask
INSERT INTO `guild_item_points` VALUES (6, 0, 6, 0, 0, 6); -- Bone Patas
INSERT INTO `guild_item_points` VALUES (6, 0, 6, 0, 0, 7); -- Fang Earring

-- Bonecraft / Artisan
INSERT INTO `guild_item_points` VALUES (6, 0, 7, 0, 0, 0); -- Coral Cap
INSERT INTO `guild_item_points` VALUES (6, 0, 7, 0, 0, 1); -- Coral Gorget
INSERT INTO `guild_item_points` VALUES (6, 0, 7, 0, 0, 2); -- Coral Cuisses
INSERT INTO `guild_item_points` VALUES (6, 0, 7, 0, 0, 3); -- Coral Visor
INSERT INTO `guild_item_points` VALUES (6, 0, 7, 0, 0, 4); -- Coral Mittens
INSERT INTO `guild_item_points` VALUES (6, 0, 7, 0, 0, 5); -- Coral Hairpin
INSERT INTO `guild_item_points` VALUES (6, 0, 7, 0, 0, 6); -- Tigerfangs
INSERT INTO `guild_item_points` VALUES (6, 0, 7, 0, 0, 7); -- Hornet Fleuret

-- Bonecraft / Adept
INSERT INTO `guild_item_points` VALUES (6, 0, 8, 0, 0, 0); -- Dragon Mask
INSERT INTO `guild_item_points` VALUES (6, 0, 8, 0, 0, 1); -- Coral Bangles
INSERT INTO `guild_item_points` VALUES (6, 0, 8, 0, 0, 2); -- Dragon Cuisses
INSERT INTO `guild_item_points` VALUES (6, 0, 8, 0, 0, 3); -- Dragon Greaves
INSERT INTO `guild_item_points` VALUES (6, 0, 8, 0, 0, 4); -- Dragon Finger Gauntlets
INSERT INTO `guild_item_points` VALUES (6, 0, 8, 0, 0, 5); -- Coral Earring
INSERT INTO `guild_item_points` VALUES (6, 0, 8, 0, 0, 6); -- Coral Sword
INSERT INTO `guild_item_points` VALUES (6, 0, 8, 0, 0, 7); -- Darksteel Shield

-- Bonecraft / Veteran
INSERT INTO `guild_item_points` VALUES (6, 0, 9, 0, 0, 0); -- Gavial Finger Gauntlets
INSERT INTO `guild_item_points` VALUES (6, 0, 9, 0, 0, 1); -- Scorpion Gauntlets
INSERT INTO `guild_item_points` VALUES (6, 0, 9, 0, 0, 2); -- Carapace Gauntlets
INSERT INTO `guild_item_points` VALUES (6, 0, 9, 0, 0, 3); -- Scorpion Helm
INSERT INTO `guild_item_points` VALUES (6, 0, 9, 0, 0, 4); -- Carapace Helm
INSERT INTO `guild_item_points` VALUES (6, 0, 9, 0, 0, 5); -- Carapace Breastplate
INSERT INTO `guild_item_points` VALUES (6, 0, 9, 0, 0, 6); -- Scorpion Breastplate
INSERT INTO `guild_item_points` VALUES (6, 0, 9, 0, 0, 7); -- Demon Helm

-- Alchemy / Amateur
INSERT INTO `guild_item_points` VALUES (7, 0, 0, 0, 0, 0); -- Deodorizer
INSERT INTO `guild_item_points` VALUES (7, 0, 0, 0, 0, 1); -- Water Tank
INSERT INTO `guild_item_points` VALUES (7, 0, 0, 0, 0, 2); -- Antidote
INSERT INTO `guild_item_points` VALUES (7, 0, 0, 0, 0, 3); -- Wax Sword
INSERT INTO `guild_item_points` VALUES (7, 0, 0, 0, 0, 4); -- Beeswax
INSERT INTO `guild_item_points` VALUES (7, 0, 0, 0, 0, 5); -- Silencing Potion
INSERT INTO `guild_item_points` VALUES (7, 0, 0, 0, 0, 6); -- Deodorizer
INSERT INTO `guild_item_points` VALUES (7, 0, 0, 0, 0, 7); -- Antidote

-- Alchemy / Recruit
INSERT INTO `guild_item_points` VALUES (7, 0, 1, 0, 0, 0); -- Silence Baghnakhs
INSERT INTO `guild_item_points` VALUES (7, 0, 1, 0, 0, 1); -- Poison Potion
INSERT INTO `guild_item_points` VALUES (7, 0, 1, 0, 0, 2); -- Silence Dagger
INSERT INTO `guild_item_points` VALUES (7, 0, 1, 0, 0, 3); -- Mercury
INSERT INTO `guild_item_points` VALUES (7, 0, 1, 0, 0, 4); -- Bee Spatha
INSERT INTO `guild_item_points` VALUES (7, 0, 1, 0, 0, 5); -- Cracker
INSERT INTO `guild_item_points` VALUES (7, 0, 1, 0, 0, 6); -- Echo Drops
INSERT INTO `guild_item_points` VALUES (7, 0, 1, 0, 0, 7); -- Silence Dagger

-- Alchemy / Initiate
INSERT INTO `guild_item_points` VALUES (7, 0, 2, 0, 0, 0); -- Poison Dagger
INSERT INTO `guild_item_points` VALUES (7, 0, 2, 0, 0, 1); -- Mokuto
INSERT INTO `guild_item_points` VALUES (7, 0, 2, 0, 0, 2); -- Poison Knife
INSERT INTO `guild_item_points` VALUES (7, 0, 2, 0, 0, 3); -- Twinkle Shower
INSERT INTO `guild_item_points` VALUES (7, 0, 2, 0, 0, 4); -- Mokuto
INSERT INTO `guild_item_points` VALUES (7, 0, 2, 0, 0, 5); -- Poison Baselard
INSERT INTO `guild_item_points` VALUES (7, 0, 2, 0, 0, 6); -- Eye Drops
INSERT INTO `guild_item_points` VALUES (7, 0, 2, 0, 0, 7); -- Poison Dagger

-- Alchemy / Novice
INSERT INTO `guild_item_points` VALUES (7, 0, 3, 0, 0, 0); -- Poison Baghnakhs
INSERT INTO `guild_item_points` VALUES (7, 0, 3, 0, 0, 1); -- Poison Claws
INSERT INTO `guild_item_points` VALUES (7, 0, 3, 0, 0, 2); -- Blind Dagger
INSERT INTO `guild_item_points` VALUES (7, 0, 3, 0, 0, 3); -- Blind Knife
INSERT INTO `guild_item_points` VALUES (7, 0, 3, 0, 0, 4); -- Busuto
INSERT INTO `guild_item_points` VALUES (7, 0, 3, 0, 0, 5); -- Poison Cesti
INSERT INTO `guild_item_points` VALUES (7, 0, 3, 0, 0, 6); -- Inferno Sword
INSERT INTO `guild_item_points` VALUES (7, 0, 3, 0, 0, 7); -- Poison Kukri

-- Alchemy / Apprentice
INSERT INTO `guild_item_points` VALUES (7, 0, 4, 0, 0, 0); -- Fire Sword
INSERT INTO `guild_item_points` VALUES (7, 0, 4, 0, 0, 1); -- Acid Knife
INSERT INTO `guild_item_points` VALUES (7, 0, 4, 0, 0, 2); -- Bokuto
INSERT INTO `guild_item_points` VALUES (7, 0, 4, 0, 0, 3); -- Acid Dagger
INSERT INTO `guild_item_points` VALUES (7, 0, 4, 0, 0, 4); -- Poison Katars
INSERT INTO `guild_item_points` VALUES (7, 0, 4, 0, 0, 5); -- Flame Claymore
INSERT INTO `guild_item_points` VALUES (7, 0, 4, 0, 0, 6); -- Potion Tank
INSERT INTO `guild_item_points` VALUES (7, 0, 4, 0, 0, 7); -- Inferno Axe

-- Alchemy / Journeyman
INSERT INTO `guild_item_points` VALUES (7, 0, 5, 0, 0, 0); -- Yoto
INSERT INTO `guild_item_points` VALUES (7, 0, 5, 0, 0, 1); -- Holy Degen
INSERT INTO `guild_item_points` VALUES (7, 0, 5, 0, 0, 2); -- Acid Claws
INSERT INTO `guild_item_points` VALUES (7, 0, 5, 0, 0, 3); -- Holy Mace
INSERT INTO `guild_item_points` VALUES (7, 0, 5, 0, 0, 4); -- Holy Sword
INSERT INTO `guild_item_points` VALUES (7, 0, 5, 0, 0, 5); -- Homura
INSERT INTO `guild_item_points` VALUES (7, 0, 5, 0, 0, 6); -- Homura
INSERT INTO `guild_item_points` VALUES (7, 0, 5, 0, 0, 7); -- Ether Tank

-- Alchemy / Craftsman
INSERT INTO `guild_item_points` VALUES (7, 0, 6, 0, 0, 0); -- Acid Kukri
INSERT INTO `guild_item_points` VALUES (7, 0, 6, 0, 0, 1); -- Cermet Sword
INSERT INTO `guild_item_points` VALUES (7, 0, 6, 0, 0, 2); -- Cermet Claws
INSERT INTO `guild_item_points` VALUES (7, 0, 6, 0, 0, 3); -- Hanger
INSERT INTO `guild_item_points` VALUES (7, 0, 6, 0, 0, 4); -- Divine Sword
INSERT INTO `guild_item_points` VALUES (7, 0, 6, 0, 0, 5); -- Acid Baselard
INSERT INTO `guild_item_points` VALUES (7, 0, 6, 0, 0, 6); -- Saber
INSERT INTO `guild_item_points` VALUES (7, 0, 6, 0, 0, 7); -- Cermet Knife

-- Alchemy / Artisan
INSERT INTO `guild_item_points` VALUES (7, 0, 7, 0, 0, 0); -- Cermet Kukri
INSERT INTO `guild_item_points` VALUES (7, 0, 7, 0, 0, 1); -- Jamadhars
INSERT INTO `guild_item_points` VALUES (7, 0, 7, 0, 0, 2); -- Venom Claws
INSERT INTO `guild_item_points` VALUES (7, 0, 7, 0, 0, 3); -- Venom Kukri
INSERT INTO `guild_item_points` VALUES (7, 0, 7, 0, 0, 4); -- Cutlass
INSERT INTO `guild_item_points` VALUES (7, 0, 7, 0, 0, 5); -- Venom Baselard
INSERT INTO `guild_item_points` VALUES (7, 0, 7, 0, 0, 6); -- Holy Shield
INSERT INTO `guild_item_points` VALUES (7, 0, 7, 0, 0, 7); -- Holy Maul

-- Alchemy / Adept
INSERT INTO `guild_item_points` VALUES (7, 0, 8, 0, 0, 0); -- Venom Kris
INSERT INTO `guild_item_points` VALUES (7, 0, 8, 0, 0, 1); -- Bloody Sword
INSERT INTO `guild_item_points` VALUES (7, 0, 8, 0, 0, 2); -- Stun Claws
INSERT INTO `guild_item_points` VALUES (7, 0, 8, 0, 0, 3); -- Stun Kukri
INSERT INTO `guild_item_points` VALUES (7, 0, 8, 0, 0, 4); -- Holy Lance
INSERT INTO `guild_item_points` VALUES (7, 0, 8, 0, 0, 5); -- Bloody Rapier
INSERT INTO `guild_item_points` VALUES (7, 0, 8, 0, 0, 6); -- Stun Jamadhars
INSERT INTO `guild_item_points` VALUES (7, 0, 8, 0, 0, 7); -- Holy Wand

-- Alchemy / Veteran
INSERT INTO `guild_item_points` VALUES (7, 0, 9, 0, 0, 0); -- Mind Potion
INSERT INTO `guild_item_points` VALUES (7, 0, 9, 0, 0, 1); -- Charisma Potion
INSERT INTO `guild_item_points` VALUES (7, 0, 9, 0, 0, 2); -- Dexterity Potion
INSERT INTO `guild_item_points` VALUES (7, 0, 9, 0, 0, 3); -- Intelligence Potion
INSERT INTO `guild_item_points` VALUES (7, 0, 9, 0, 0, 4); -- Vitality Potion
INSERT INTO `guild_item_points` VALUES (7, 0, 9, 0, 0, 5); -- Agility Potion
INSERT INTO `guild_item_points` VALUES (7, 0, 9, 0, 0, 6); -- Ice Shield
INSERT INTO `guild_item_points` VALUES (7, 0, 9, 0, 0, 7); -- Strength Potion

-- Cooking / Amateur
INSERT INTO `guild_item_points` VALUES (8, 0, 0, 0, 0, 0); -- Pet Food Alpha
INSERT INTO `guild_item_points` VALUES (8, 0, 0, 0, 0, 1); -- Roasted Corn
INSERT INTO `guild_item_points` VALUES (8, 0, 0, 0, 0, 2); -- Orange Juice
INSERT INTO `guild_item_points` VALUES (8, 0, 0, 0, 0, 3); -- Boiled Crayfish
INSERT INTO `guild_item_points` VALUES (8, 0, 0, 0, 0, 4); -- Pebble Soup
INSERT INTO `guild_item_points` VALUES (8, 0, 0, 0, 0, 5); -- Salmon Sub
INSERT INTO `guild_item_points` VALUES (8, 0, 0, 0, 0, 6); -- Salmon Sub
INSERT INTO `guild_item_points` VALUES (8, 0, 0, 0, 0, 7); -- Roasted Corn

-- Cooking / Recruit
INSERT INTO `guild_item_points` VALUES (8, 0, 1, 0, 0, 0); -- Roast Mutton
INSERT INTO `guild_item_points` VALUES (8, 0, 1, 0, 0, 1); -- Pea Soup
INSERT INTO `guild_item_points` VALUES (8, 0, 1, 0, 0, 2); -- Roast Mutton
INSERT INTO `guild_item_points` VALUES (8, 0, 1, 0, 0, 3); -- Tortilla
INSERT INTO `guild_item_points` VALUES (8, 0, 1, 0, 0, 4); -- Pea Soup
INSERT INTO `guild_item_points` VALUES (8, 0, 1, 0, 0, 5); -- Roast Carp
INSERT INTO `guild_item_points` VALUES (8, 0, 1, 0, 0, 6); -- Roast Carp
INSERT INTO `guild_item_points` VALUES (8, 0, 1, 0, 0, 7); -- Tortilla

-- Cooking / Initiate
INSERT INTO `guild_item_points` VALUES (8, 0, 2, 0, 0, 0); -- Smoked Salmon
INSERT INTO `guild_item_points` VALUES (8, 0, 2, 0, 0, 1); -- Dhalmel Steak
INSERT INTO `guild_item_points` VALUES (8, 0, 2, 0, 0, 2); -- Puls
INSERT INTO `guild_item_points` VALUES (8, 0, 2, 0, 0, 3); -- Baked Apple
INSERT INTO `guild_item_points` VALUES (8, 0, 2, 0, 0, 4); -- Vegetable Soup
INSERT INTO `guild_item_points` VALUES (8, 0, 2, 0, 0, 5); -- Meat Jerky
INSERT INTO `guild_item_points` VALUES (8, 0, 2, 0, 0, 6); -- Boiled Crab
INSERT INTO `guild_item_points` VALUES (8, 0, 2, 0, 0, 7); -- Baked Popoto

-- Cooking / Novice
INSERT INTO `guild_item_points` VALUES (8, 0, 3, 0, 0, 0); -- Mushroom Soup
INSERT INTO `guild_item_points` VALUES (8, 0, 3, 0, 0, 1); -- Windurst Salad
INSERT INTO `guild_item_points` VALUES (8, 0, 3, 0, 0, 2); -- Acorn Cookie
INSERT INTO `guild_item_points` VALUES (8, 0, 3, 0, 0, 3); -- Iron Bread
INSERT INTO `guild_item_points` VALUES (8, 0, 3, 0, 0, 4); -- Nebimonite Bake
INSERT INTO `guild_item_points` VALUES (8, 0, 3, 0, 0, 5); -- Black Bread
INSERT INTO `guild_item_points` VALUES (8, 0, 3, 0, 0, 6); -- Buffalo Jerky
INSERT INTO `guild_item_points` VALUES (8, 0, 3, 0, 0, 7); -- Roast Trout

-- Cooking / Apprentice
INSERT INTO `guild_item_points` VALUES (8, 0, 4, 0, 0, 0); -- Tomato Soup
INSERT INTO `guild_item_points` VALUES (8, 0, 4, 0, 0, 1); -- Apple Pie
INSERT INTO `guild_item_points` VALUES (8, 0, 4, 0, 0, 2); -- Apple Pie
INSERT INTO `guild_item_points` VALUES (8, 0, 4, 0, 0, 3); -- Fish Mithkabob
INSERT INTO `guild_item_points` VALUES (8, 0, 4, 0, 0, 4); -- Pickled Herring
INSERT INTO `guild_item_points` VALUES (8, 0, 4, 0, 0, 5); -- Pickled Herring
INSERT INTO `guild_item_points` VALUES (8, 0, 4, 0, 0, 6); -- Cinna-cookie
INSERT INTO `guild_item_points` VALUES (8, 0, 4, 0, 0, 7); -- Goulash

-- Cooking / Journeyman
INSERT INTO `guild_item_points` VALUES (8, 0, 5, 0, 0, 0); -- Beaugreen Saute
INSERT INTO `guild_item_points` VALUES (8, 0, 5, 0, 0, 1); -- Pamama Tart
INSERT INTO `guild_item_points` VALUES (8, 0, 5, 0, 0, 2); -- Bataquiche
INSERT INTO `guild_item_points` VALUES (8, 0, 5, 0, 0, 3); -- Egg Soup
INSERT INTO `guild_item_points` VALUES (8, 0, 5, 0, 0, 4); -- Sis Kebabi
INSERT INTO `guild_item_points` VALUES (8, 0, 5, 0, 0, 5); -- Eel Kabob
INSERT INTO `guild_item_points` VALUES (8, 0, 5, 0, 0, 6); -- Sis Kebab
INSERT INTO `guild_item_points` VALUES (8, 0, 5, 0, 0, 7); -- Bretzel

-- Cooking / Craftsman
INSERT INTO `guild_item_points` VALUES (8, 0, 6, 0, 0, 0); -- Raisin Bread
INSERT INTO `guild_item_points` VALUES (8, 0, 6, 0, 0, 1); -- Squid Sushi
INSERT INTO `guild_item_points` VALUES (8, 0, 6, 0, 0, 2); -- Irmik Helvasi
INSERT INTO `guild_item_points` VALUES (8, 0, 6, 0, 0, 3); -- Herb Quus
INSERT INTO `guild_item_points` VALUES (8, 0, 6, 0, 0, 4); -- Dhalmel Stew
INSERT INTO `guild_item_points` VALUES (8, 0, 6, 0, 0, 5); -- Colored Egg
INSERT INTO `guild_item_points` VALUES (8, 0, 6, 0, 0, 6); -- Mutton Tortilla
INSERT INTO `guild_item_points` VALUES (8, 0, 6, 0, 0, 7); -- Balik Sis

-- Cooking / Artisan
INSERT INTO `guild_item_points` VALUES (8, 0, 7, 0, 0, 0); -- Boiled Cockatrice
INSERT INTO `guild_item_points` VALUES (8, 0, 7, 0, 0, 1); -- Herb Crawler Eggs
INSERT INTO `guild_item_points` VALUES (8, 0, 7, 0, 0, 2); -- Salmon Meuniere
INSERT INTO `guild_item_points` VALUES (8, 0, 7, 0, 0, 3); -- Navarin
INSERT INTO `guild_item_points` VALUES (8, 0, 7, 0, 0, 4); -- Chocomilk
INSERT INTO `guild_item_points` VALUES (8, 0, 7, 0, 0, 5); -- Rarab Meatball
INSERT INTO `guild_item_points` VALUES (8, 0, 7, 0, 0, 6); -- Shallops Tropicale
INSERT INTO `guild_item_points` VALUES (8, 0, 7, 0, 0, 7); -- Turtle Soup

-- Cooking / Adept
INSERT INTO `guild_item_points` VALUES (8, 0, 8, 0, 0, 0); -- Karni Yarik
INSERT INTO `guild_item_points` VALUES (8, 0, 8, 0, 0, 1); -- Seafood Stew
INSERT INTO `guild_item_points` VALUES (8, 0, 8, 0, 0, 2); -- Pepperoni
INSERT INTO `guild_item_points` VALUES (8, 0, 8, 0, 0, 3); -- Bream Risotto
INSERT INTO `guild_item_points` VALUES (8, 0, 8, 0, 0, 4); -- Bass Meuniere
INSERT INTO `guild_item_points` VALUES (8, 0, 8, 0, 0, 5); -- Steamed Catfish
INSERT INTO `guild_item_points` VALUES (8, 0, 8, 0, 0, 6); -- Coeurl Sautee
INSERT INTO `guild_item_points` VALUES (8, 0, 8, 0, 0, 7); -- Shark Fin Soup

-- Cooking / Veteran
INSERT INTO `guild_item_points` VALUES (8, 0, 9, 0, 0, 0); -- Urchin Sushi
INSERT INTO `guild_item_points` VALUES (8, 0, 9, 0, 0, 1); -- Rice Dumpling
INSERT INTO `guild_item_points` VALUES (8, 0, 9, 0, 0, 2); -- Dorado Sushi
INSERT INTO `guild_item_points` VALUES (8, 0, 9, 0, 0, 3); -- Sea Bass Croute
INSERT INTO `guild_item_points` VALUES (8, 0, 9, 0, 0, 4); -- Flounder Meuniere
INSERT INTO `guild_item_points` VALUES (8, 0, 9, 0, 0, 5); -- Brain Stew
INSERT INTO `guild_item_points` VALUES (8, 0, 9, 0, 0, 6); -- Sweet Rice Cake
INSERT INTO `guild_item_points` VALUES (8, 0, 9, 0, 0, 7); -- Salmon Croute
