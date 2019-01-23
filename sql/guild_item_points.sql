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
INSERT INTO `guild_item_points` VALUES (0, 4360, 0, 24, 3600, 0); -- Bastore Sardine (24 / 3600)
INSERT INTO `guild_item_points` VALUES (0, 4472, 0, 30, 3840, 1); -- Crayfish (30 / 3840)
INSERT INTO `guild_item_points` VALUES (0, 4360, 0, 24, 3600, 2); -- Bastore Sardine (24 / 3600)
INSERT INTO `guild_item_points` VALUES (0, 4401, 0, 30, 3840, 3); -- Moat Carp (30 / 3840)
INSERT INTO `guild_item_points` VALUES (0, 4472, 0, 30, 3840, 4); -- Crayfish (30 / 3840)
INSERT INTO `guild_item_points` VALUES (0, 4314, 0, 300, 7680, 5); -- Bibikibo (300 / 7680)
INSERT INTO `guild_item_points` VALUES (0, 4401, 0, 30, 3840, 6); -- Moat Carp (30 / 3840)
INSERT INTO `guild_item_points` VALUES (0, 4443, 0, 24, 3600, 7); -- Cobalt Jellyfish (24 / 3600)

-- Fishing / Recruit
INSERT INTO `guild_item_points` VALUES (0, 4515, 1, 60, 5040, 0); -- Copper Frog (60 / 5040)
INSERT INTO `guild_item_points` VALUES (0, 4289, 1, 45, 4800, 1); -- Forest Carp (45 / 4800)
INSERT INTO `guild_item_points` VALUES (0, 4514, 1, 60, 5040, 2); -- Quus (60 / 5040)
INSERT INTO `guild_item_points` VALUES (0, 4379, 1, 60, 5040, 3); -- Cheval Salmon (60 / 5040)
INSERT INTO `guild_item_points` VALUES (0, 5473, 1, 279, 7920, 4); -- Bastore Sweeper (279 / 7920)
INSERT INTO `guild_item_points` VALUES (0, 5473, 1, 279, 7920, 5); -- Bastore Sweeper (279 / 7920)
INSERT INTO `guild_item_points` VALUES (0, 4313, 1, 675, 11280, 6); -- Blindfish (675 / 11280)
INSERT INTO `guild_item_points` VALUES (0, 4403, 1, 60, 5040, 7); -- Yellow Globe (60 / 5040)

-- Fishing / Initiate
INSERT INTO `guild_item_points` VALUES (0, 4464, 2, 138, 6720, 0); -- Pipira (138 / 6720)
INSERT INTO `guild_item_points` VALUES (0, 4469, 2, 300, 8640, 1); -- Giant Catfish (300 / 8640)
INSERT INTO `guild_item_points` VALUES (0, 4361, 2, 156, 6960, 2); -- Nebimonite (156 / 6960)
INSERT INTO `guild_item_points` VALUES (0, 4426, 2, 156, 6960, 3); -- Tricolored Carp (156 / 6960)
INSERT INTO `guild_item_points` VALUES (0, 4315, 2, 720, 12000, 4); -- Lungfish (720 / 12000)
INSERT INTO `guild_item_points` VALUES (0, 5121, 2, 714, 12000, 5); -- Moorish Idol (714 / 12000)
INSERT INTO `guild_item_points` VALUES (0, 4290, 2, 156, 6960, 6); -- Elshimo Frog (156 / 6960)
INSERT INTO `guild_item_points` VALUES (0, 4483, 2, 156, 6960, 7); -- Tiger Cod (156 / 6960)

-- Fishing / Novice
INSERT INTO `guild_item_points` VALUES (0, 5791, 3, 78, 6720, 0); -- Shining Trout (78 / 6720)
INSERT INTO `guild_item_points` VALUES (0, 4528, 3, 375, 9840, 1); -- Crystal Bass (375 / 9840)
INSERT INTO `guild_item_points` VALUES (0, 5796, 3, 240, 8640, 2); -- Nosteau Herring (240 / 8640)
INSERT INTO `guild_item_points` VALUES (0, 5804, 3, 1350, 15120, 3); -- Veydal Wrasse (1350 / 15120)
INSERT INTO `guild_item_points` VALUES (0, 5805, 3, 300, 9120, 4); -- Gugru Tuna (300 / 9120)
INSERT INTO `guild_item_points` VALUES (0, 4580, 3, 375, 9840, 5); -- Coral Butterfly (375 / 9840)
INSERT INTO `guild_item_points` VALUES (0, 5791, 3, 78, 6720, 6); -- Shining Trout (78 / 6720)
INSERT INTO `guild_item_points` VALUES (0, 5795, 3, 96, 6960, 7); -- Ogre Eel (96 / 6960)

-- Fishing / Apprentice
INSERT INTO `guild_item_points` VALUES (0, 5801, 4, 900, 13440, 0); -- Monke-Onke (900 / 13440)
INSERT INTO `guild_item_points` VALUES (0, 5800, 4, 576, 11760, 1); -- Giant Donko (576 / 11760)
INSERT INTO `guild_item_points` VALUES (0, 4383, 4, 576, 11760, 2); -- Gold Lobster (576 / 11760)
INSERT INTO `guild_item_points` VALUES (0, 4470, 4, 459, 10800, 3); -- Icefish (459 / 10800)
INSERT INTO `guild_item_points` VALUES (0, 4385, 4, 93, 7440, 4); -- Zafmlug Bass (93 / 7440)
INSERT INTO `guild_item_points` VALUES (0, 4383, 4, 576, 11760, 5); -- Gold Lobster (576 / 11760)
INSERT INTO `guild_item_points` VALUES (0, 4429, 4, 576, 11760, 6); -- Black Eel (576 / 11760)
INSERT INTO `guild_item_points` VALUES (0, 4385, 4, 93, 7440, 7); -- Zafmlug Bass (93 / 7440)

-- Fishing / Journeyman
INSERT INTO `guild_item_points` VALUES (0, 4427, 5, 900, 13680, 0); -- Gold Carp (900 / 13680)
INSERT INTO `guild_item_points` VALUES (0, 4579, 5, 525, 11760, 1); -- Elshimo Newt (525 / 11760)
INSERT INTO `guild_item_points` VALUES (0, 5806, 5, 900, 13680, 2); -- Bhefhel Marlin (900 / 13680)
INSERT INTO `guild_item_points` VALUES (0, 4402, 5, 900, 13680, 3); -- Red Terrapin (900 / 13680)
INSERT INTO `guild_item_points` VALUES (0, 5798, 5, 900, 13680, 4); -- Bluetail (900 / 13680)
INSERT INTO `guild_item_points` VALUES (0, 5806, 5, 900, 13680, 5); -- Bhefhel Marlin (900 / 13680)
INSERT INTO `guild_item_points` VALUES (0, 4317, 5, 120, 8400, 6); -- Trilobite (120 / 8400)
INSERT INTO `guild_item_points` VALUES (0, 5798, 5, 900, 13680, 7); -- Bluetail (900 / 13680)

-- Fishing / Craftsman
INSERT INTO `guild_item_points` VALUES (0, 4473, 6, 1320, 15360, 0); -- Crescent Fish (1320 / 15360)
INSERT INTO `guild_item_points` VALUES (0, 4473, 6, 1320, 15360, 1); -- Crescent Fish (1320 / 15360)
INSERT INTO `guild_item_points` VALUES (0, 4288, 6, 1200, 15120, 2); -- Zebra Eel (1200 / 15120)
INSERT INTO `guild_item_points` VALUES (0, 4288, 6, 1200, 15120, 3); -- Zebra Eel (1200 / 15120)
INSERT INTO `guild_item_points` VALUES (0, 4471, 6, 1200, 15120, 4); -- Bladefish (1200 / 15120)
INSERT INTO `guild_item_points` VALUES (0, 4288, 6, 1200, 15120, 5); -- Zebra Eel (1200 / 15120)
INSERT INTO `guild_item_points` VALUES (0, 4473, 6, 1320, 15360, 6); -- Crescent Fish (1320 / 15360)
INSERT INTO `guild_item_points` VALUES (0, 4485, 6, 1200, 15120, 7); -- Noble Lady (1200 / 15120)

-- Fishing / Artisan
INSERT INTO `guild_item_points` VALUES (0, 4477, 7, 1500, 16080, 0); -- Gavial Fish (1500 / 16080)
INSERT INTO `guild_item_points` VALUES (0, 4307, 7, 1800, 16800, 1); -- Jungle Catfish (1800 / 16800)
INSERT INTO `guild_item_points` VALUES (0, 4478, 7, 1500, 16080, 2); -- Three-eyed Fish (1500 / 16080)
INSERT INTO `guild_item_points` VALUES (0, 4307, 7, 1800, 16800, 3); -- Jungle Catfish (1800 / 16800)
INSERT INTO `guild_item_points` VALUES (0, 4451, 7, 1500, 16080, 4); -- Silver Shark (1500 / 16080)
INSERT INTO `guild_item_points` VALUES (0, 4478, 7, 1500, 16080, 5); -- Three-eyed Fish (1500 / 16080)
INSERT INTO `guild_item_points` VALUES (0, 4477, 7, 1500, 16080, 6); -- Gavial Fish (1500 / 16080)
INSERT INTO `guild_item_points` VALUES (0, 4451, 7, 1500, 16080, 7); -- Silver Shark (1500 / 16080)

-- Fishing / Adept
INSERT INTO `guild_item_points` VALUES (0, 4454, 8, 1800, 17040, 0); -- Emperor Fish (1800 / 17040)
INSERT INTO `guild_item_points` VALUES (0, 4454, 8, 1800, 17040, 1); -- Emperor Fish (1800 / 17040)
INSERT INTO `guild_item_points` VALUES (0, 4461, 8, 1800, 17040, 2); -- Bastore Bream (1800 / 17040)
INSERT INTO `guild_item_points` VALUES (0, 4304, 8, 2100, 17520, 3); -- Grimmonite (2100 / 17520)
INSERT INTO `guild_item_points` VALUES (0, 4474, 8, 1800, 17040, 4); -- Gigant Squid (1800 / 17040)
INSERT INTO `guild_item_points` VALUES (0, 4304, 8, 2100, 17520, 5); -- Grimmonite (2100 / 17520)
INSERT INTO `guild_item_points` VALUES (0, 4474, 8, 1800, 17040, 6); -- Gigant Squid (1800 / 17040)
INSERT INTO `guild_item_points` VALUES (0, 4304, 8, 2100, 17520, 7); -- Grimmonite (2100 / 17520)

-- Fishing / Veteran
INSERT INTO `guild_item_points` VALUES (0, 4475, 9, 2100, 17520, 0); -- Sea Zombie (2100 / 17520)
INSERT INTO `guild_item_points` VALUES (0, 4476, 9, 2100, 17520, 1); -- Titanictus (2100 / 17520)
INSERT INTO `guild_item_points` VALUES (0, 4475, 9, 2100, 17520, 2); -- Sea Zombie (2100 / 17520)
INSERT INTO `guild_item_points` VALUES (0, 4316, 9, 2850, 18720, 3); -- Armored Pisces (2850 / 18720)
INSERT INTO `guild_item_points` VALUES (0, 4476, 9, 2100, 17520, 4); -- Titanictus (2100 / 17520)
INSERT INTO `guild_item_points` VALUES (0, 4463, 9, 2100, 17520, 5); -- Takitaro (2100 / 17520)
INSERT INTO `guild_item_points` VALUES (0, 4463, 9, 2100, 17520, 6); -- Takitaro (2100 / 17520)
INSERT INTO `guild_item_points` VALUES (0, 4384, 9, 2100, 17520, 7); -- Black Sole (2100 / 17520)

-- Woodworking / Amateur
INSERT INTO `guild_item_points` VALUES (1, 17095, 0, 105, 5040, 0); -- Ash Pole (105 / 5040)
INSERT INTO `guild_item_points` VALUES (1, 17122, 0, 120, 5040, 0); -- Ash Pole +1 (120 / 5040)
INSERT INTO `guild_item_points` VALUES (1, 17868, 0, 52, 4080, 1); -- Humus (52 / 4080)
INSERT INTO `guild_item_points` VALUES (1, 17869, 0, 97, 4080, 1); -- Rich Humus (97 / 4080)
INSERT INTO `guild_item_points` VALUES (1, 22, 0, 94, 4800, 2); -- Workbench (94 / 4800)
INSERT INTO `guild_item_points` VALUES (1, 22, 0, 94, 4800, 3); -- Workbench (94 / 4800)
INSERT INTO `guild_item_points` VALUES (1, 12289, 0, 30, 3840, 4); -- Lauan Shield (30 / 3840)
INSERT INTO `guild_item_points` VALUES (1, 12333, 0, 38, 3840, 4); -- Lauan Shield +1 (38 / 3840)
INSERT INTO `guild_item_points` VALUES (1, 16832, 0, 27, 3840, 5); -- Harpoon (27 / 3840)
INSERT INTO `guild_item_points` VALUES (1, 16862, 0, 30, 3840, 5); -- Harpoon +1 (30 / 3840)
INSERT INTO `guild_item_points` VALUES (1, 12289, 0, 30, 3840, 6); -- Lauan Shield (30 / 3840)
INSERT INTO `guild_item_points` VALUES (1, 12333, 0, 38, 3840, 6); -- Lauan Shield +1 (38 / 3840)
INSERT INTO `guild_item_points` VALUES (1, 17868, 0, 52, 4080, 7); -- Humus (52 / 4080)
INSERT INTO `guild_item_points` VALUES (1, 17869, 0, 97, 4080, 7); -- Rich Humus (97 / 4080)

-- Woodworking / Recruit
INSERT INTO `guild_item_points` VALUES (1, 17153, 1, 134, 6240, 0); -- Self Bow (134 / 6240)
INSERT INTO `guild_item_points` VALUES (1, 17176, 1, 154, 6240, 0); -- Self Bow +1 (154 / 6240)
INSERT INTO `guild_item_points` VALUES (1, 12985, 1, 325, 8400, 1); -- Holly Clogs (325 / 8400)
INSERT INTO `guild_item_points` VALUES (1, 12991, 1, 406, 8400, 1); -- Holly Clogs +1 (406 / 8400)
INSERT INTO `guild_item_points` VALUES (1, 17389, 1, 135, 6240, 2); -- Bamboo Fishing Rod (135 / 6240)
INSERT INTO `guild_item_points` VALUES (1, 23, 1, 158, 6480, 3); -- Maple Table (158 / 6480)
INSERT INTO `guild_item_points` VALUES (1, 17050, 1, 74, 5280, 4); -- Willow Wand (74 / 5280)
INSERT INTO `guild_item_points` VALUES (1, 17138, 1, 119, 5280, 4); -- Willow Wand +1 (119 / 5280)
INSERT INTO `guild_item_points` VALUES (1, 17216, 1, 45, 4800, 5); -- Light Crossbow (45 / 4800)
INSERT INTO `guild_item_points` VALUES (1, 17228, 1, 53, 4800, 5); -- Light Crossbow +1 (53 / 4800)
INSERT INTO `guild_item_points` VALUES (1, 17096, 1, 423, 9360, 6); -- Holly Pole (423 / 9360)
INSERT INTO `guild_item_points` VALUES (1, 17124, 1, 435, 9360, 6); -- Holly Pole +1 (435 / 9360)
INSERT INTO `guild_item_points` VALUES (1, 12290, 1, 121, 6000, 7); -- Maple Shield  (121 / 6000)
INSERT INTO `guild_item_points` VALUES (1, 12330, 1, 152, 6000, 7); -- Maple Shield +1 (152 / 6000)

-- Woodworking / Initiate
INSERT INTO `guild_item_points` VALUES (1, 17051, 2, 261, 8160, 0); -- Yew Wand (261 / 8160)
INSERT INTO `guild_item_points` VALUES (1, 17140, 2, 414, 8160, 0); -- Yew Wand +1 (414 / 8160)
INSERT INTO `guild_item_points` VALUES (1, 1179, 2, 25, 5280, 1); -- Shihei (25 / 5280)
INSERT INTO `guild_item_points` VALUES (1, 92, 2, 246, 8160, 2); -- Tarutaru Stool (246 / 8160)
INSERT INTO `guild_item_points` VALUES (1, 17354, 2, 500, 10320, 3); -- Harp (500 / 10320)
INSERT INTO `guild_item_points` VALUES (1, 17374, 2, 600, 10320, 3); -- Harp +1 (600 / 10320)
INSERT INTO `guild_item_points` VALUES (1, 16834, 2, 400, 9600, 4); -- Brass Spear (400 / 9600)
INSERT INTO `guild_item_points` VALUES (1, 16864, 2, 410, 9600, 4); -- Brass Spear +1 (410 / 9600)
INSERT INTO `guild_item_points` VALUES (1, 12291, 2, 363, 9360, 5); -- Elm Shield (363 / 9360)
INSERT INTO `guild_item_points` VALUES (1, 12319, 2, 457, 9360, 5); -- Elm Shield +1 (457 / 9360)
INSERT INTO `guild_item_points` VALUES (1, 17090, 2, 601, 11040, 6); -- Elm Staff (601 / 11040)
INSERT INTO `guild_item_points` VALUES (1, 17126, 2, 887, 11040, 6); -- Elm Staff +1 (887 / 11040)
INSERT INTO `guild_item_points` VALUES (1, 17025, 2, 290, 8640, 7); -- Chestnut Club (290 / 8640)
INSERT INTO `guild_item_points` VALUES (1, 17139, 2, 447, 8640, 7); -- Solid Club (447 / 8640)

-- Woodworking / Novice
INSERT INTO `guild_item_points` VALUES (1, 17217, 3, 471, 10560, 0); -- Crossbow (471 / 10560)
INSERT INTO `guild_item_points` VALUES (1, 17225, 3, 471, 10560, 0); -- Crossbow +1 (471 / 10560)
INSERT INTO `guild_item_points` VALUES (1, 17155, 3, 1250, 14640, 1); -- Composite Bow (1250 / 14640)
INSERT INTO `guild_item_points` VALUES (1, 17179, 3, 1300, 14640, 1); -- Composite Bow +1 (1300 / 14640)
INSERT INTO `guild_item_points` VALUES (1, 17162, 3, 3116, 18720, 2); -- Great Bow (3116 / 18720)
INSERT INTO `guild_item_points` VALUES (1, 17180, 3, 3496, 18720, 2); -- Great Bow  +1 (3496 / 18720)
INSERT INTO `guild_item_points` VALUES (1, 17424, 3, 300, 9120, 3); -- Spiked Club (300 / 9120)
INSERT INTO `guild_item_points` VALUES (1, 17425, 3, 330, 9120, 3); -- Spiked Club +1 (330 / 9120)
INSERT INTO `guild_item_points` VALUES (1, 12986, 3, 612, 11520, 4); -- Chestnut Sabots (612 / 11520)
INSERT INTO `guild_item_points` VALUES (1, 13022, 3, 646, 11520, 4); -- Chestnut Sabots +1 (646 / 11520)
INSERT INTO `guild_item_points` VALUES (1, 17052, 3, 714, 12240, 5); -- Chestnut Wand (714 / 12240)
INSERT INTO `guild_item_points` VALUES (1, 17141, 3, 1134, 12240, 5); -- Solid Wand (1134 / 12240)
INSERT INTO `guild_item_points` VALUES (1, 12292, 3, 830, 12960, 6); -- Mahogany Shield (830 / 12960)
INSERT INTO `guild_item_points` VALUES (1, 12334, 3, 1043, 12960, 6); -- Strong Shield (1043 / 12960)
INSERT INTO `guild_item_points` VALUES (1, 16835, 3, 840, 12960, 7); -- Spear (840 / 12960)
INSERT INTO `guild_item_points` VALUES (1, 16865, 3, 870, 12960, 7); -- Spear +1 (870 / 12960)

-- Woodworking / Apprentice
INSERT INTO `guild_item_points` VALUES (1, 12987, 4, 1344, 15120, 0); -- Ebony Sabots (1344 / 15120)
INSERT INTO `guild_item_points` VALUES (1, 13023, 4, 1400, 15120, 0); -- Ebony Sabots +1 (1400 / 15120)
INSERT INTO `guild_item_points` VALUES (1, 17091, 4, 1218, 14880, 1); -- Oak Staff (1218 / 14880)
INSERT INTO `guild_item_points` VALUES (1, 17127, 4, 1798, 14880, 1); -- Oak Staff +1 (1798 / 14880)
INSERT INTO `guild_item_points` VALUES (1, 16845, 4, 1535, 15840, 2); -- Lance (1535 / 15840)
INSERT INTO `guild_item_points` VALUES (1, 16876, 4, 1561, 15840, 2); -- Lance +1 (1561 / 15840)
INSERT INTO `guild_item_points` VALUES (1, 17218, 4, 1710, 16320, 3); -- Zamburak (1710 / 16320)
INSERT INTO `guild_item_points` VALUES (1, 17229, 4, 1748, 16320, 3); -- Zamburak +1 (1748 / 16320)
INSERT INTO `guild_item_points` VALUES (1, 17027, 4, 1248, 14880, 4); -- Oak Cudgel (1248 / 14880)
INSERT INTO `guild_item_points` VALUES (1, 17142, 4, 1768, 14880, 4); -- Oak Cudgel +1 (1768 / 14880)
INSERT INTO `guild_item_points` VALUES (1, 16836, 4, 1350, 15120, 5); -- Halberd (1350 / 15120)
INSERT INTO `guild_item_points` VALUES (1, 16866, 4, 1400, 15120, 5); -- Halberd +1 (1400 / 15120)
INSERT INTO `guild_item_points` VALUES (1, 17053, 4, 1360, 15360, 6); -- Rose Wand (1360 / 15360)
INSERT INTO `guild_item_points` VALUES (1, 17143, 4, 2160, 15360, 6); -- Rose Wand +1 (2160 / 15360)
INSERT INTO `guild_item_points` VALUES (1, 12293, 4, 1950, 16800, 7); -- Oak Shield (1950 / 16800)
INSERT INTO `guild_item_points` VALUES (1, 12331, 4, 2450, 16800, 7); -- Oak Shield +1 (2450 / 16800)

-- Woodworking / Journeyman
INSERT INTO `guild_item_points` VALUES (1, 17355, 5, 2500, 18000, 0); -- Rose Harp (2500 / 18000)
INSERT INTO `guild_item_points` VALUES (1, 17376, 5, 3000, 18000, 0); -- Rose Harp +1 (3000 / 18000)
INSERT INTO `guild_item_points` VALUES (1, 17030, 5, 1102, 14640, 1); -- Great Club (1102 / 14640)
INSERT INTO `guild_item_points` VALUES (1, 17408, 5, 1160, 14640, 1); -- Great Club +1 (1160 / 14640)
INSERT INTO `guild_item_points` VALUES (1, 16847, 5, 2580, 18000, 2); -- Mythril Lance (2580 / 18000)
INSERT INTO `guild_item_points` VALUES (1, 16877, 5, 2640, 18000, 2); -- Mythril Lance +1 (2640 / 18000)
INSERT INTO `guild_item_points` VALUES (1, 17219, 5, 2550, 18000, 3); -- Arbalest (2550 / 18000)
INSERT INTO `guild_item_points` VALUES (1, 17226, 5, 2635, 18000, 3); -- Arbalest +1 (2635 / 18000)
INSERT INTO `guild_item_points` VALUES (1, 16871, 5, 4070, 19686, 4); -- Kamayari (4070 / 19686)
INSERT INTO `guild_item_points` VALUES (1, 16872, 5, 4162, 19686, 4); -- Kamayari +1 (4162 / 19686)
INSERT INTO `guild_item_points` VALUES (1, 17164, 5, 4080, 19680, 5); -- War Bow (4080 / 19680)
INSERT INTO `guild_item_points` VALUES (1, 17173, 5, 4160, 19680, 5); -- War Bow +1 (4160 / 19680)
INSERT INTO `guild_item_points` VALUES (1, 17098, 5, 1560, 16080, 6); -- Oak Pole (1560 / 16080)
INSERT INTO `guild_item_points` VALUES (1, 17120, 5, 1620, 16080, 6); -- Oak Pole +1 (1620 / 16080)
INSERT INTO `guild_item_points` VALUES (1, 17156, 5, 2465, 18000, 7); -- Kaman (2465 / 18000)
INSERT INTO `guild_item_points` VALUES (1, 17182, 5, 2550, 18000, 7); -- Kaman +1 (2550 / 18000)

-- Woodworking / Craftsman
INSERT INTO `guild_item_points` VALUES (1, 49, 6, 1278, 15360, 0); -- Coffer (1278 / 15360)
INSERT INTO `guild_item_points` VALUES (1, 17157, 6, 3655, 19440, 1); -- Rapid Bow (3655 / 19440)
INSERT INTO `guild_item_points` VALUES (1, 17189, 6, 3762, 19440, 1); -- Rapid Bow +1 (3762 / 19440)
INSERT INTO `guild_item_points` VALUES (1, 17054, 6, 1912, 17040, 2); -- Ebony Wand (1912 / 17040)
INSERT INTO `guild_item_points` VALUES (1, 17427, 6, 3037, 17040, 2); -- Ebony Wand +1 (3037 / 17040)
INSERT INTO `guild_item_points` VALUES (1, 16839, 6, 2415, 18000, 3); -- Partisan (2415 / 18000)
INSERT INTO `guild_item_points` VALUES (1, 16874, 6, 2520, 18000, 3); -- Partisan +1 (2520 / 18000)
INSERT INTO `guild_item_points` VALUES (1, 51, 6, 195, 9600, 4); -- Chest (195 / 9600)
INSERT INTO `guild_item_points` VALUES (1, 17092, 6, 2310, 17760, 5); -- Mahogany Staff (2310 / 17760)
INSERT INTO `guild_item_points` VALUES (1, 17520, 6, 2310, 17760, 5); -- Heavy Staff (2310 / 17760)
INSERT INTO `guild_item_points` VALUES (1, 17350, 6, 1200, 15120, 6); -- Angel's Flute (1200 / 15120)
INSERT INTO `guild_item_points` VALUES (1, 17378, 6, 1280, 15120, 6); -- Angel's Flute +1 (1280 / 15120)
INSERT INTO `guild_item_points` VALUES (1, 17099, 6, 7200, 21600, 7); -- Mahogany Pole (7200 / 21600)
INSERT INTO `guild_item_points` VALUES (1, 17521, 6, 7700, 21600, 7); -- Mahogany Pole +1 (7700 / 21600)

-- Woodworking / Artisan
INSERT INTO `guild_item_points` VALUES (1, 56, 7, 4900, 20400, 0); -- Commode (4900 / 20400)
INSERT INTO `guild_item_points` VALUES (1, 12295, 7, 2817, 18480, 1); -- Round Shield (2817 / 18480)
INSERT INTO `guild_item_points` VALUES (1, 12352, 7, 2990, 18480, 1); -- Round Shield +1 (2990 / 18480)
INSERT INTO `guild_item_points` VALUES (1, 95, 7, 2500, 18000, 2); -- Water Barrel (2500 / 18000)
INSERT INTO `guild_item_points` VALUES (1, 59, 7, 4594, 20160, 3); -- Chiffonier (4594 / 20160)
INSERT INTO `guild_item_points` VALUES (1, 30, 7, 7010, 21360, 4); -- Bureau (7010 / 21360)
INSERT INTO `guild_item_points` VALUES (1, 104, 7, 427, 11760, 5); -- Tarutaru Folding Screen (427 / 11760)
INSERT INTO `guild_item_points` VALUES (1, 17100, 7, 4350, 19920, 6); -- Ebony Pole (4350 / 19920)
INSERT INTO `guild_item_points` VALUES (1, 17525, 7, 4495, 19920, 6); -- Ebony Pole +1 (4495 / 19920)
INSERT INTO `guild_item_points` VALUES (1, 17357, 7, 2587, 18240, 7); -- Ebony Harp (2587 / 18240)
INSERT INTO `guild_item_points` VALUES (1, 17833, 7, 2700, 18240, 7); -- Ebony Harp +1 (2700 / 18240)

-- Woodworking / Adept
INSERT INTO `guild_item_points` VALUES (1, 16849, 8, 2650, 18480, 0); -- Cermet Lance (2650 / 18480)
INSERT INTO `guild_item_points` VALUES (1, 16879, 8, 3312, 18480, 0); -- Cermet Lance +1 (3312 / 18480)
INSERT INTO `guild_item_points` VALUES (1, 17359, 8, 7000, 21360, 1); -- Mythic Harp (7000 / 21360)
INSERT INTO `guild_item_points` VALUES (1, 17834, 8, 7120, 21360, 1); -- Mythic Harp +1 (7120 / 21360)
INSERT INTO `guild_item_points` VALUES (1, 17101, 8, 4740, 20400, 2); -- Mythic Pole (4740 / 20400)
INSERT INTO `guild_item_points` VALUES (1, 17526, 8, 5727, 20400, 2); -- Mythic Pole +1 (5727 / 20400)
INSERT INTO `guild_item_points` VALUES (1, 358, 8, 7070, 21360, 3); -- Credenza (7070 / 21360)
INSERT INTO `guild_item_points` VALUES (1, 17221, 8, 5425, 20640, 4); -- Repeating Crossbow (5425 / 20640)
INSERT INTO `guild_item_points` VALUES (1, 17233, 8, 6200, 20640, 4); -- Machine Crossbow (6200 / 20640)
INSERT INTO `guild_item_points` VALUES (1, 12364, 8, 2560, 18240, 5); -- Nymph Shield (2560 / 18240)
INSERT INTO `guild_item_points` VALUES (1, 12365, 8, 2760, 18240, 5); -- Nymph Shield +1 (2760 / 18240)
INSERT INTO `guild_item_points` VALUES (1, 16890, 8, 12750, 22560, 6); -- Armoire (12750 / 22560)
INSERT INTO `guild_item_points` VALUES (1, 55, 8, 3200, 18960, 7); -- Cabinet (3200 / 18960)

-- Woodworking / Veteran
INSERT INTO `guild_item_points` VALUES (1, 16840, 9, 7950, 21600, 0); -- Ox Tongue (7950 / 21600)
INSERT INTO `guild_item_points` VALUES (1, 16894, 9, 7200, 21600, 0); -- Ox Tongue +1 (7200 / 21600)
INSERT INTO `guild_item_points` VALUES (1, 17205, 9, 11305, 22320, 1); -- Gendawa (11305 / 22320)
INSERT INTO `guild_item_points` VALUES (1, 17206, 9, 12255, 22320, 1); -- Gendawa +1 (12255 / 22320)
INSERT INTO `guild_item_points` VALUES (1, 18142, 9, 7680, 23040, 2); -- Shigeto Bow (7680 / 23040)
INSERT INTO `guild_item_points` VALUES (1, 17102, 9, 1200, 15600, 3); -- Eight-Sided Pole (1200 / 15600)
INSERT INTO `guild_item_points` VALUES (1, 17568, 9, 1800, 15600, 3); -- Eight-Sided Pole +1 (1800 / 15600)
INSERT INTO `guild_item_points` VALUES (1, 139, 9, 13430, 22560, 4); -- Star Globe (13430 / 22560)
INSERT INTO `guild_item_points` VALUES (1, 17364, 9, 5697, 20880, 5); -- Cythara Anglica (5697 / 20880)
INSERT INTO `guild_item_points` VALUES (1, 17837, 9, 7022, 20880, 5); -- Cythara Anglica +1 (7022 / 20880)
INSERT INTO `guild_item_points` VALUES (1, 76, 9, 7520, 22560, 6); -- Royal Bookshelf (7520 / 22560)
INSERT INTO `guild_item_points` VALUES (1, 77, 9, 14600, 22560, 7); -- Bookshelf (14600 / 22560)

-- Blacksmithing / Amateur
INSERT INTO `guild_item_points` VALUES (2, 0, 0, 61, 4320, 0); -- Bronze Knuckles (61 / 4320)
INSERT INTO `guild_item_points` VALUES (2, 0, 0, 61, 4320, 0); -- Bronze Knuckles +1 (61 / 4320)
INSERT INTO `guild_item_points` VALUES (2, 0, 0, 67, 4320, 1); -- Bronze Sword (67 / 4320)
INSERT INTO `guild_item_points` VALUES (2, 0, 0, 75, 4320, 1); -- Bronze Sword +1 (75 / 4320)
INSERT INTO `guild_item_points` VALUES (2, 0, 0, 168, 6000, 2); -- Xiphos (168 / 6000)
INSERT INTO `guild_item_points` VALUES (2, 0, 0, 188, 6000, 2); -- Xiphos +1 (188 / 6000)
INSERT INTO `guild_item_points` VALUES (2, 0, 0, 39, 3840, 3); -- Bronze Dagger (39 / 3840)
INSERT INTO `guild_item_points` VALUES (2, 0, 0, 47, 3840, 3); -- Bronze Dagger +1 (47 / 3840)
INSERT INTO `guild_item_points` VALUES (2, 0, 0, 86, 4800, 4); -- Bronze Zaghnal (86 / 4800)
INSERT INTO `guild_item_points` VALUES (2, 0, 0, 93, 4800, 4); -- Bronze Zaghnal +1 (93 / 4800)
INSERT INTO `guild_item_points` VALUES (2, 0, 0, 41, 4080, 5); -- Bronze Knife (41 / 4080)
INSERT INTO `guild_item_points` VALUES (2, 0, 0, 48, 4080, 5); -- Bronze Knife +1 (48 / 4080)
INSERT INTO `guild_item_points` VALUES (2, 0, 0, 47, 4080, 6); -- Bronze Mace (47 / 4080)
INSERT INTO `guild_item_points` VALUES (2, 0, 0, 57, 4080, 6); -- Bronze Mace +1 (57 / 4080)
INSERT INTO `guild_item_points` VALUES (2, 0, 0, 79, 4560, 7); -- Bronze Axe (79 / 4560)
INSERT INTO `guild_item_points` VALUES (2, 0, 0, 86, 4560, 7); -- Bronze Axe +1 (86 / 4560)

-- Blacksmithing / Recruit
INSERT INTO `guild_item_points` VALUES (2, 0, 1, 358, 8640, 0); -- Scale Cuisses (358 / 8640)
INSERT INTO `guild_item_points` VALUES (2, 0, 1, 410, 8640, 0); -- Solid Cuisses (410 / 8640)
INSERT INTO `guild_item_points` VALUES (2, 0, 1, 217, 7200, 1); -- Scale Greaves (217 / 7200)
INSERT INTO `guild_item_points` VALUES (2, 0, 1, 269, 7200, 1); -- Solid Greaves (269 / 7200)
INSERT INTO `guild_item_points` VALUES (2, 0, 1, 189, 6960, 2); -- Aspis (189 / 6960)
INSERT INTO `guild_item_points` VALUES (2, 0, 1, 233, 6960, 2); -- Aspis +1 (233 / 6960)
INSERT INTO `guild_item_points` VALUES (2, 0, 1, 85, 5520, 3); -- Bronze Hammer (85 / 5520)
INSERT INTO `guild_item_points` VALUES (2, 0, 1, 100, 5520, 3); -- Bronze Hammer +1 (100 / 5520)
INSERT INTO `guild_item_points` VALUES (2, 0, 1, 406, 9120, 4); -- Dagger (406 / 9120)
INSERT INTO `guild_item_points` VALUES (2, 0, 1, 484, 9120, 4); -- Dagger +1 (484 / 9120)
INSERT INTO `guild_item_points` VALUES (2, 0, 1, 446, 9600, 5); -- Scale Mail (446 / 9600)
INSERT INTO `guild_item_points` VALUES (2, 0, 1, 498, 9600, 5); -- Solid Mail (498 / 9600)
INSERT INTO `guild_item_points` VALUES (2, 0, 1, 238, 7440, 6); -- Scale Finger Gauntlets (238 / 7440)
INSERT INTO `guild_item_points` VALUES (2, 0, 1, 290, 7440, 6); -- Solid Finger Gauntlets (290 / 7440)
INSERT INTO `guild_item_points` VALUES (2, 0, 1, 64, 5040, 7); -- Bronze Harness (64 / 5040)
INSERT INTO `guild_item_points` VALUES (2, 0, 1, 64, 5040, 7); -- Bronze Harness +1 (64 / 5040)

-- Blacksmithing / Initiate
INSERT INTO `guild_item_points` VALUES (2, 0, 2, 808, 12480, 0); -- Mace (808 / 12480)
INSERT INTO `guild_item_points` VALUES (2, 0, 2, 980, 12480, 0); -- Mace +1 (980 / 12480)
INSERT INTO `guild_item_points` VALUES (2, 0, 2, 3024, 18480, 1); -- Iron Visor (3024 / 18480)
INSERT INTO `guild_item_points` VALUES (2, 0, 2, 3078, 18480, 1); -- Iron Visor +1 (3078 / 18480)
INSERT INTO `guild_item_points` VALUES (2, 0, 2, 485, 10320, 2); -- Knife (485 / 10320)
INSERT INTO `guild_item_points` VALUES (2, 0, 2, 578, 10320, 2); -- Knife +1 (578 / 10320)
INSERT INTO `guild_item_points` VALUES (2, 0, 2, 905, 12960, 3); -- Scimitar (905 / 12960)
INSERT INTO `guild_item_points` VALUES (2, 0, 2, 998, 12960, 3); -- Scimitar +1 (998 / 12960)
INSERT INTO `guild_item_points` VALUES (2, 0, 2, 1440, 15120, 4); -- Baghnakhs (1440 / 15120)
INSERT INTO `guild_item_points` VALUES (2, 0, 2, 1740, 15120, 4); -- Baghnakhs +1 (1740 / 15120)
INSERT INTO `guild_item_points` VALUES (2, 0, 2, 1536, 15600, 5); -- Longsword (1536 / 15600)
INSERT INTO `guild_item_points` VALUES (2, 0, 2, 1689, 15600, 5); -- Longsword +1 (1689 / 15600)
INSERT INTO `guild_item_points` VALUES (2, 0, 2, 168, 7200, 6); -- Butterfly Axe (168 / 7200)
INSERT INTO `guild_item_points` VALUES (2, 0, 2, 183, 7200, 6); -- Butterfly Axe +1 (183 / 7200)
INSERT INTO `guild_item_points` VALUES (2, 0, 2, 873, 12720, 7); -- Metal Knuckles (873 / 12720)
INSERT INTO `guild_item_points` VALUES (2, 0, 2, 873, 12720, 7); -- Metal Knuckles +1 (873 / 12720)

-- Blacksmithing / Novice
INSERT INTO `guild_item_points` VALUES (2, 0, 3, 680, 12000, 0); -- Targe (680 / 12000)
INSERT INTO `guild_item_points` VALUES (2, 0, 3, 2120, 12000, 0); -- Targe +1 (2120 / 12000)
INSERT INTO `guild_item_points` VALUES (2, 0, 3, 2128, 17040, 1); -- Fleuret (2128 / 17040)
INSERT INTO `guild_item_points` VALUES (2, 0, 3, 3648, 17040, 1); -- Fleuret +1 (3648 / 17040)
INSERT INTO `guild_item_points` VALUES (2, 0, 3, 2146, 17040, 2); -- Tuck (2146 / 17040)
INSERT INTO `guild_item_points` VALUES (2, 0, 3, 2432, 17040, 2); -- Tuck +1 (2432 / 17040)
INSERT INTO `guild_item_points` VALUES (2, 0, 3, 300, 9120, 3); -- Wakizashi (300 / 9120)
INSERT INTO `guild_item_points` VALUES (2, 0, 3, 302, 9120, 3); -- Wakizashi +1 (302 / 9120)
INSERT INTO `guild_item_points` VALUES (2, 0, 3, 442, 10320, 4); -- Rod (442 / 10320)
INSERT INTO `guild_item_points` VALUES (2, 0, 3, 702, 10320, 4); -- Rod +1 (702 / 10320)
INSERT INTO `guild_item_points` VALUES (2, 0, 3, 4644, 20160, 5); -- Iron Scale Mail (4644 / 20160)
INSERT INTO `guild_item_points` VALUES (2, 0, 3, 5184, 20160, 5); -- Iron Scale Mail +1 (5184 / 20160)
INSERT INTO `guild_item_points` VALUES (2, 0, 3, 2256, 17280, 6); -- Mythril Mace (2256 / 17280)
INSERT INTO `guild_item_points` VALUES (2, 0, 3, 2736, 17280, 6); -- Mythril Mace +1 (2736 / 17280)
INSERT INTO `guild_item_points` VALUES (2, 0, 3, 910, 13200, 7); -- Greataxe (910 / 13200)
INSERT INTO `guild_item_points` VALUES (2, 0, 3, 991, 13200, 7); -- Greataxe +1 (991 / 13200)

-- Blacksmithing / Apprentice
INSERT INTO `guild_item_points` VALUES (2, 0, 4, 933, 13680, 0); -- Shinobi-Gatana (933 / 13680)
INSERT INTO `guild_item_points` VALUES (2, 0, 4, 902, 13680, 0); -- Shinobi-Gatana +1 (902 / 13680)
INSERT INTO `guild_item_points` VALUES (2, 0, 4, 6900, 21120, 1); -- Mythril Scythe (6900 / 21120)
INSERT INTO `guild_item_points` VALUES (2, 0, 4, 6900, 21120, 1); -- Mythril Scythe (6900 / 21120)
INSERT INTO `guild_item_points` VALUES (2, 0, 4, 4850, 20160, 2); -- Tulwar (4850 / 20160)
INSERT INTO `guild_item_points` VALUES (2, 0, 4, 5330, 20160, 2); -- Tulwar +1 (5330 / 20160)
INSERT INTO `guild_item_points` VALUES (2, 0, 4, 2484, 17760, 3); -- Mythril Kukri (2484 / 17760)
INSERT INTO `guild_item_points` VALUES (2, 0, 4, 2944, 17760, 3); -- Mythril Kukri +1 (2944 / 17760)
INSERT INTO `guild_item_points` VALUES (2, 0, 4, 5152, 20400, 4); -- Heavy Axe (5152 / 20400)
INSERT INTO `guild_item_points` VALUES (2, 0, 4, 5612, 20400, 4); -- Heavy Axe +1 (5612 / 20400)
INSERT INTO `guild_item_points` VALUES (2, 0, 4, 5400, 20640, 5); -- Mythril Axe (5400 / 20640)
INSERT INTO `guild_item_points` VALUES (2, 0, 4, 5940, 20640, 5); -- Mythril Axe +1 (5940 / 20640)
INSERT INTO `guild_item_points` VALUES (2, 0, 4, 7750, 21600, 6); -- Knight's Sword (7750 / 21600)
INSERT INTO `guild_item_points` VALUES (2, 0, 4, 7200, 21600, 6); -- Knight's Sword +1 (7200 / 21600)
INSERT INTO `guild_item_points` VALUES (2, 0, 4, 5250, 20400, 7); -- Mythril Claymore (5250 / 20400)
INSERT INTO `guild_item_points` VALUES (2, 0, 4, 5275, 20400, 7); -- Fine Claymore (5275 / 20400)

-- Blacksmithing / Journeyman
INSERT INTO `guild_item_points` VALUES (2, 0, 5, 4320, 19920, 0); -- Darksteel Claws (4320 / 19920)
INSERT INTO `guild_item_points` VALUES (2, 0, 5, 5220, 19920, 0); -- Darksteel Claws +1 (5220 / 19920)
INSERT INTO `guild_item_points` VALUES (2, 0, 5, 5460, 20640, 1); -- Breastplate (5460 / 20640)
INSERT INTO `guild_item_points` VALUES (2, 0, 5, 6060, 20640, 1); -- Breastplate +1 (6060 / 20640)
INSERT INTO `guild_item_points` VALUES (2, 0, 5, 6758, 21120, 2); -- Greatsword (6758 / 21120)
INSERT INTO `guild_item_points` VALUES (2, 0, 5, 7040, 21120, 2); -- Greatsword +1 (7040 / 21120)
INSERT INTO `guild_item_points` VALUES (2, 0, 5, 3540, 19200, 3); -- Sallet (3540 / 19200)
INSERT INTO `guild_item_points` VALUES (2, 0, 5, 4140, 19200, 3); -- Sallet +1 (4140 / 19200)
INSERT INTO `guild_item_points` VALUES (2, 0, 5, 667, 12480, 4); -- Uchigatana (667 / 12480)
INSERT INTO `guild_item_points` VALUES (2, 0, 5, 667, 12480, 4); -- Uchigatana (667 / 12480)
INSERT INTO `guild_item_points` VALUES (2, 0, 5, 1866, 16800, 5); -- Tanegashima (1866 / 16800)
INSERT INTO `guild_item_points` VALUES (2, 0, 5, 1875, 16800, 5); -- Tanegashima +1 (1875 / 16800)
INSERT INTO `guild_item_points` VALUES (2, 0, 5, 8600, 21600, 6); -- Schlaeger (8600 / 21600)
INSERT INTO `guild_item_points` VALUES (2, 0, 5, 9675, 21600, 6); -- Schlaeger +1 (9675 / 21600)
INSERT INTO `guild_item_points` VALUES (2, 0, 5, 3344, 18960, 7); -- Broadsword (3344 / 18960)
INSERT INTO `guild_item_points` VALUES (2, 0, 5, 3572, 18960, 7); -- Broadsword +1 (3572 / 18960)

-- Blacksmithing / Craftsman
INSERT INTO `guild_item_points` VALUES (2, 0, 6, 3300, 18960, 0); -- Kote (3300 / 18960)
INSERT INTO `guild_item_points` VALUES (2, 0, 6, 3300, 18960, 0); -- Kote +1 (3300 / 18960)
INSERT INTO `guild_item_points` VALUES (2, 0, 6, 3604, 19440, 1); -- Zunari Kabuto (3604 / 19440)
INSERT INTO `guild_item_points` VALUES (2, 0, 6, 3604, 19440, 1); -- Zunari Kabuto +1 (3604 / 19440)
INSERT INTO `guild_item_points` VALUES (2, 0, 6, 2310, 17760, 2); -- Sakurafubuki (2310 / 17760)
INSERT INTO `guild_item_points` VALUES (2, 0, 6, 2442, 17760, 2); -- Sakurafubuki +1 (2442 / 17760)
INSERT INTO `guild_item_points` VALUES (2, 0, 6, 2722, 18480, 3); -- Nodowa (2722 / 18480)
INSERT INTO `guild_item_points` VALUES (2, 0, 6, 3547, 18480, 3); -- Nodowa +1 (3547 / 18480)
INSERT INTO `guild_item_points` VALUES (2, 0, 6, 5170, 20400, 4); -- Darksteel Mufflers (5170 / 20400)
INSERT INTO `guild_item_points` VALUES (2, 0, 6, 6270, 20400, 4); -- Darksteel Mufflers +1 (6270 / 20400)
INSERT INTO `guild_item_points` VALUES (2, 0, 6, 5940, 20880, 5); -- Darksteel Kukri (5940 / 20880)
INSERT INTO `guild_item_points` VALUES (2, 0, 6, 7040, 20880, 5); -- Darksteel Kukri +1 (7040 / 20880)
INSERT INTO `guild_item_points` VALUES (2, 0, 6, 2325, 17760, 6); -- Hien (2325 / 17760)
INSERT INTO `guild_item_points` VALUES (2, 0, 6, 2402, 17760, 6); -- Hien +1 (2402 / 17760)
INSERT INTO `guild_item_points` VALUES (2, 0, 6, 6976, 21360, 7); -- Mythril Zaghnal (6976 / 21360)
INSERT INTO `guild_item_points` VALUES (2, 0, 6, 7120, 21360, 7); -- Mythril Zaghnal +1 (7120 / 21360)

-- Blacksmithing / Artisan
INSERT INTO `guild_item_points` VALUES (2, 0, 7, 12150, 22320, 0); -- Bastard Sword (12150 / 22320)
INSERT INTO `guild_item_points` VALUES (2, 0, 7, 7440, 22320, 0); -- Bastard Sword +1 (7440 / 22320)
INSERT INTO `guild_item_points` VALUES (2, 0, 7, 12535, 22320, 1); -- Darksteel Scythe (12535 / 22320)
INSERT INTO `guild_item_points` VALUES (2, 0, 7, 7440, 22320, 1); -- Darksteel Scythe +1 (7440 / 22320)
INSERT INTO `guild_item_points` VALUES (2, 0, 7, 5670, 20880, 2); -- Darksteel Kris (5670 / 20880)
INSERT INTO `guild_item_points` VALUES (2, 0, 7, 6720, 20880, 2); -- Darksteel Kris +1 (6720 / 20880)
INSERT INTO `guild_item_points` VALUES (2, 0, 7, 3740, 19440, 3); -- Mikazuki (3740 / 19440)
INSERT INTO `guild_item_points` VALUES (2, 0, 7, 3808, 19440, 3); -- Mikazuki +1 (3808 / 19440)
INSERT INTO `guild_item_points` VALUES (2, 0, 7, 7020, 21360, 4); -- Darksteel Cap (7020 / 21360)
INSERT INTO `guild_item_points` VALUES (2, 0, 7, 7020, 21360, 4); -- Darksteel Cap +1 (7020 / 21360)
INSERT INTO `guild_item_points` VALUES (2, 0, 7, 7280, 21840, 5); -- Darksteel Subligar (7280 / 21840)
INSERT INTO `guild_item_points` VALUES (2, 0, 7, 9880, 21840, 5); -- Darksteel Subligar +1 (9880 / 21840)
INSERT INTO `guild_item_points` VALUES (2, 0, 7, 7280, 21840, 6); -- Holy Breastplate (7280 / 21840)
INSERT INTO `guild_item_points` VALUES (2, 0, 7, 7280, 21840, 6); -- Divine Breastplate (7280 / 21840)
INSERT INTO `guild_item_points` VALUES (2, 0, 7, 9100, 21840, 7); -- Schwert (9100 / 21840)
INSERT INTO `guild_item_points` VALUES (2, 0, 7, 9100, 21840, 7); -- Schwert +1 (9100 / 21840)

-- Blacksmithing / Adept
INSERT INTO `guild_item_points` VALUES (2, 0, 8, 6345, 21120, 0); -- Thick Mufflers (6345 / 21120)
INSERT INTO `guild_item_points` VALUES (2, 0, 8, 6480, 21120, 0); -- Thick Mufflers +1 (6480 / 21120)
INSERT INTO `guild_item_points` VALUES (2, 0, 8, 11830, 22320, 1); -- Darksteel Cuirass (11830 / 22320)
INSERT INTO `guild_item_points` VALUES (2, 0, 8, 13130, 22320, 1); -- Darksteel Cuirass +1 (13130 / 22320)
INSERT INTO `guild_item_points` VALUES (2, 0, 8, 5880, 20880, 2); -- Darksteel Maul (5880 / 20880)
INSERT INTO `guild_item_points` VALUES (2, 0, 8, 6492, 20880, 2); -- Darksteel Maul +1 (6492 / 20880)
INSERT INTO `guild_item_points` VALUES (2, 0, 8, 5720, 20880, 3); -- Darksteel Sabatons (5720 / 20880)
INSERT INTO `guild_item_points` VALUES (2, 0, 8, 6435, 20880, 3); -- Darksteel Sabatons (6435 / 20880)
INSERT INTO `guild_item_points` VALUES (2, 0, 8, 7200, 21600, 4); -- Darksteel Tabar (7200 / 21600)
INSERT INTO `guild_item_points` VALUES (2, 0, 8, 7200, 21600, 4); -- Darksteel Tabar +1 (7200 / 21600)
INSERT INTO `guild_item_points` VALUES (2, 0, 8, 5075, 20400, 5); -- Flanged Mace (5075 / 20400)
INSERT INTO `guild_item_points` VALUES (2, 0, 8, 5075, 20400, 5); -- Flanged Mace +1 (5075 / 20400)
INSERT INTO `guild_item_points` VALUES (2, 0, 8, 14850, 22560, 6); -- Flamberge (14850 / 22560)
INSERT INTO `guild_item_points` VALUES (2, 0, 8, 14850, 22560, 6); -- Flamberge +1 (14850 / 22560)
INSERT INTO `guild_item_points` VALUES (2, 0, 8, 6500, 21120, 7); -- Darksteel Cuisses (6500 / 21120)
INSERT INTO `guild_item_points` VALUES (2, 0, 8, 7150, 21120, 7); -- Darksteel Cuisses +1 (7150 / 21120)

-- From here on using http://www011.upp.so-net.ne.jp/iris/gtable.html as primary source

-- Blacksmithing / Veteran
INSERT INTO `guild_item_points` VALUES (2, 0, 9, 6440, 21120, 0); -- Ritter Shield (6440 / 21120)
INSERT INTO `guild_item_points` VALUES (2, 0, 9, 7840, 21120, 0); -- Ritter Shield +1 (7840 / 21120)
INSERT INTO `guild_item_points` VALUES (2, 0, 9, 11925, 22320, 1); -- Buzdygan (11925 / 22320)
INSERT INTO `guild_item_points` VALUES (2, 0, 9, 13250, 22320, 1); -- Buzdygan +1 (13250 / 22320)
INSERT INTO `guild_item_points` VALUES (2, 0, 9, 4637, 20160, 2); -- Misericorde (4637 / 20160)
INSERT INTO `guild_item_points` VALUES (2, 0, 9, 5962, 20160, 2); -- Misericorde +1 (5962 / 20160)
INSERT INTO `guild_item_points` VALUES (2, 0, 9, 8820, 21840, 3); -- Anelace (8820 / 21840)
INSERT INTO `guild_item_points` VALUES (2, 0, 9, 10220, 21840, 3); -- Anelace +1 (10220 / 21840)
INSERT INTO `guild_item_points` VALUES (2, 0, 9, 8082, 21840, 4); -- Culverin (8082 / 21840)
INSERT INTO `guild_item_points` VALUES (2, 0, 9, 9407, 21840, 4); -- Culverin +1 (9407 / 21840)
INSERT INTO `guild_item_points` VALUES (2, 0, 9, 5565, 20880, 5); -- Nadziak (5565 / 20880)
INSERT INTO `guild_item_points` VALUES (2, 0, 9, 6890, 20880, 5); -- Nadziak +1 (6890 / 20880)
INSERT INTO `guild_item_points` VALUES (2, 0, 9, 11792, 20880, 6); -- Tabarzin (11792 / 20880)
INSERT INTO `guild_item_points` VALUES (2, 0, 9, 11792, 20880, 6); -- Tabarzin +1 (11792 / 20880)
INSERT INTO `guild_item_points` VALUES (2, 0, 9, 2890, 18720, 7); -- Gully (2890 / 18720)
INSERT INTO `guild_item_points` VALUES (2, 0, 9, 4590, 18720, 7); -- Gully +1 (4590 / 18720)

-- Goldsmithing / Amateur
INSERT INTO `guild_item_points` VALUES (3, 12449, 0, 327, 7920, 0); -- Brass Cap (327 / 7920)
INSERT INTO `guild_item_points` VALUES (3, 12528, 0, 388, 7920, 0); -- Brass Cap +1 (388 / 7920)
INSERT INTO `guild_item_points` VALUES (3, 16551, 0, 194, 6240, 1); -- Sapara (194 / 6240)
INSERT INTO `guild_item_points` VALUES (3, 16801, 0, 214, 6240, 1); -- Sapara +1 (214 / 6240)
INSERT INTO `guild_item_points` VALUES (3, 12496, 0, 39, 3840, 2); -- Copper Hairpin (39 / 3840)
INSERT INTO `guild_item_points` VALUES (3, 12526, 0, 79, 3840, 2); -- Copper Hairpin +1 (79 / 3840)
INSERT INTO `guild_item_points` VALUES (3, 12496, 0, 39, 3840, 3); -- Copper Hairpin (39 / 3840)
INSERT INTO `guild_item_points` VALUES (3, 12526, 0, 79, 3840, 3); -- Copper Hairpin +1 (79 / 3840)
INSERT INTO `guild_item_points` VALUES (3, 16551, 0, 194, 6240, 4); -- Sapara (194 / 6240)
INSERT INTO `guild_item_points` VALUES (3, 16801, 0, 214, 6240, 4); -- Sapara +1 (214 / 6240)
INSERT INTO `guild_item_points` VALUES (3, 13454, 0, 19, 3600, 5); -- Copper Ring (19 / 3600)
INSERT INTO `guild_item_points` VALUES (3, 13492, 0, 27, 3600, 5); -- Copper Ring +1 (27 / 3600)
INSERT INTO `guild_item_points` VALUES (3, 12449, 0, 327, 7920, 6); -- Brass Cap (327 / 7920)
INSERT INTO `guild_item_points` VALUES (3, 12528, 0, 388, 7920, 6); -- Brass Cap +1 (388 / 7920)
INSERT INTO `guild_item_points` VALUES (3, 13454, 0, 19, 3600, 7); -- Copper Ring (19 / 3600)
INSERT INTO `guild_item_points` VALUES (3, 13492, 0, 27, 3600, 7); -- Copper Ring +1 (27 / 3600)

-- Goldsmithing / Recruit
INSERT INTO `guild_item_points` VALUES (3, 0, 1, 259, 7680, 0); -- Brass Hairpin (259 / 7680)
INSERT INTO `guild_item_points` VALUES (3, 0, 1, 264, 7680, 0); -- Brass Hairpin +1 (264 / 7680)
INSERT INTO `guild_item_points` VALUES (3, 0, 1, 338, 8400, 1); -- Brass Baghnakhs (338 / 8400)
INSERT INTO `guild_item_points` VALUES (3, 0, 1, 338, 8400, 1); -- Brass Baghnakhs +1 (338 / 8400)
INSERT INTO `guild_item_points` VALUES (3, 0, 1, 186, 6720, 2); -- Brass Dagger (186 / 6720)
INSERT INTO `guild_item_points` VALUES (3, 0, 1, 221, 6720, 2); -- Brass Dagger +1 (221 / 6720)
INSERT INTO `guild_item_points` VALUES (3, 0, 1, 140, 6240, 3); -- Brass Zaghnal (140 / 6240)
INSERT INTO `guild_item_points` VALUES (3, 0, 1, 181, 6240, 3); -- Brass Zaghnal +1 (181 / 6240)
INSERT INTO `guild_item_points` VALUES (3, 0, 1, 180, 6720, 4); -- Brass Knuckles (180 / 6720)
INSERT INTO `guild_item_points` VALUES (3, 0, 1, 222, 6720, 4); -- Brass Knuckles +1 (222 / 6720)
INSERT INTO `guild_item_points` VALUES (3, 0, 1, 248, 2440, 5); -- Brass Leggings (248 / 2440)
INSERT INTO `guild_item_points` VALUES (3, 0, 1, 309, 2440, 5); -- Brass Leggings +1 (309 / 2440)
INSERT INTO `guild_item_points` VALUES (3, 0, 1, 497, 558, 6); -- Brass Harness (497 / 558)
INSERT INTO `guild_item_points` VALUES (3, 0, 1, 558, 558, 6); -- Brass Harness +1 (558 / 558)
INSERT INTO `guild_item_points` VALUES (3, 0, 1, 312, 8160, 7); -- Brass Axe (312 / 8160)
INSERT INTO `guild_item_points` VALUES (3, 0, 1, 343, 8160, 7); -- Brass Axe +1 (343 / 8160)

-- Goldsmithing / Initiate
INSERT INTO `guild_item_points` VALUES (3, 0, 2, 414, 9600, 0); -- Poet's Circlet (414 / 9600)
INSERT INTO `guild_item_points` VALUES (3, 0, 2, 495, 9600, 0); -- Poet's Circlet +1 (495 / 9600)
INSERT INTO `guild_item_points` VALUES (3, 0, 2, 800, 12480, 1); -- Brass Mask (800 / 12480)
INSERT INTO `guild_item_points` VALUES (3, 0, 2, 832, 12480, 1); -- Brass Mask1 (832 / 12480)
INSERT INTO `guild_item_points` VALUES (3, 0, 2, 138, 6720, 2); -- Brass Rod (138 / 6720)
INSERT INTO `guild_item_points` VALUES (3, 0, 2, 219, 6720, 2); -- Brass Rod +1 (219 / 6720)
INSERT INTO `guild_item_points` VALUES (3, 0, 2, 345, 9120, 3); -- Silver Hairpin (345 / 9120)
INSERT INTO `guild_item_points` VALUES (3, 0, 2, 364, 9120, 3); -- Silver Hairpin +1 (364 / 9120)
INSERT INTO `guild_item_points` VALUES (3, 0, 2, 463, 10080, 4); -- Brass Hammer (463 / 10080)
INSERT INTO `guild_item_points` VALUES (3, 0, 2, 544, 10080, 4); -- Brass Hammer +1 (544 / 10080)
INSERT INTO `guild_item_points` VALUES (3, 0, 2, 357, 9120, 5); -- Silver Belt (357 / 9120)
INSERT INTO `guild_item_points` VALUES (3, 0, 2, 441, 9120, 5); -- Silver Belt +1 (441 / 9120)
INSERT INTO `guild_item_points` VALUES (3, 0, 2, 432, 9840, 6); -- Brass Finger Gauntlets (432 / 9840)
INSERT INTO `guild_item_points` VALUES (3, 0, 2, 544, 9840, 6); -- Brass Finger Gauntlets (544 / 9840)
INSERT INTO `guild_item_points` VALUES (3, 0, 2, 250, 8160, 7); -- Silver Earring (250 / 8160)
INSERT INTO `guild_item_points` VALUES (3, 0, 2, 350, 8160, 7); -- Silver Earring +1 (350 / 8160)

-- Goldsmithing / Novice
INSERT INTO `guild_item_points` VALUES (3, 0, 3, 810, 12720, 0); -- Chain Choker (810 / 12720)
INSERT INTO `guild_item_points` VALUES (3, 0, 3, 1110, 12720, 0); -- Chain Choker +1 (1110 / 12720)
INSERT INTO `guild_item_points` VALUES (3, 0, 3, 672, 12000, 1); -- Brass Cuisses (672 / 12000)
INSERT INTO `guild_item_points` VALUES (3, 0, 3, 752, 12000, 1); -- Brass Cuisses +1 (752 / 12000)
INSERT INTO `guild_item_points` VALUES (3, 0, 3, 1020, 13680, 2); -- Chain Belt (1020 / 13680)
INSERT INTO `guild_item_points` VALUES (3, 0, 3, 1320, 13680, 2); -- Chain Belt +1 (1320 / 13680)
INSERT INTO `guild_item_points` VALUES (3, 0, 3, 2850, 18240, 3); -- Silver Mask (2850 / 18240)
INSERT INTO `guild_item_points` VALUES (3, 0, 3, 3350, 18240, 3); -- Silver Mask +1 (3350 / 18240)
INSERT INTO `guild_item_points` VALUES (3, 0, 3, 669, 12000, 4); -- Spark Bilbo (669 / 12000)
INSERT INTO `guild_item_points` VALUES (3, 0, 3, 706, 12000, 4); -- Spark Bilbo +1 (706 / 12000)
INSERT INTO `guild_item_points` VALUES (3, 0, 3, 1020, 13680, 5); -- Chain Gorget (1020 / 13680)
INSERT INTO `guild_item_points` VALUES (3, 0, 3, 1320, 13680, 5); -- Chain Gorget +1 (1320 / 13680)
INSERT INTO `guild_item_points` VALUES (3, 0, 3, 2350, 17520, 6); -- Silver Mittens (2350 / 17520)
INSERT INTO `guild_item_points` VALUES (3, 0, 3, 2850, 17520, 6); -- Silver Mittens +1 (2850 / 17520)
INSERT INTO `guild_item_points` VALUES (3, 0, 3, 240, 8640, 7); -- Spark Spear (240 / 8640)
INSERT INTO `guild_item_points` VALUES (3, 0, 3, 390, 8640, 7); -- Spark Spear +1 (390 / 8640)

-- Goldsmithing / Apprentice
INSERT INTO `guild_item_points` VALUES (3, 0, 4, 4275, 19920, 0); -- Banded Helm (4275 / 19920)
INSERT INTO `guild_item_points` VALUES (3, 0, 4, 5025, 19920, 0); -- Banded Helm +1 (5025 / 19920)
INSERT INTO `guild_item_points` VALUES (3, 0, 4, 3117, 18270, 1); -- Buckler (3117 / 18270)
INSERT INTO `guild_item_points` VALUES (3, 0, 4, 3842, 18270, 1); -- Buckler +1 (3842 / 18270)
INSERT INTO `guild_item_points` VALUES (3, 0, 4, 1976, 16800, 2); -- Mythril Baselard (1976 / 16800)
INSERT INTO `guild_item_points` VALUES (3, 0, 4, 2028, 16800, 2); -- Mythril Baselard +1 (2028 / 16800)
INSERT INTO `guild_item_points` VALUES (3, 0, 4, 750, 12720, 3); -- Mythril Ring (750 / 12720)
INSERT INTO `guild_item_points` VALUES (3, 0, 4, 1050, 12720, 3); -- Mythril Ring +1 (1050 / 12720)
INSERT INTO `guild_item_points` VALUES (3, 0, 4, 4400, 19920, 4); -- Silver Mail (4400 / 19920)
INSERT INTO `guild_item_points` VALUES (3, 0, 4, 4900, 19920, 4); -- Silver Mail +1 (4900 / 19920)
INSERT INTO `guild_item_points` VALUES (3, 0, 4, 3225, 18960, 5); -- Sollerets (3225 / 18960)
INSERT INTO `guild_item_points` VALUES (3, 0, 4, 3975, 18960, 5); -- Sollerets +1 (3975 / 18960)
INSERT INTO `guild_item_points` VALUES (3, 0, 4, 992, 13920, 6); -- Silver Bangles (992 / 13920)
INSERT INTO `guild_item_points` VALUES (3, 0, 4, 1054, 13920, 6); -- Silver Bangles +1 (1054 / 13920)
INSERT INTO `guild_item_points` VALUES (3, 0, 4, 750, 12720, 7); -- Mythril Earring (750 / 12720)
INSERT INTO `guild_item_points` VALUES (3, 0, 4, 1050, 12720, 7); -- Mythril Earring (1050 / 12720)

-- Goldsmithing / Journeyman
INSERT INTO `guild_item_points` VALUES (3, 0, 5, 1750, 16560, 0); -- Gold Ring (1750 / 16560)
INSERT INTO `guild_item_points` VALUES (3, 0, 5, 2450, 16560, 0); -- Gold Ring +1 (2450 / 16560)
INSERT INTO `guild_item_points` VALUES (3, 0, 5, 6037, 20880, 1); -- Spark Kris (6037 / 20880)
INSERT INTO `guild_item_points` VALUES (3, 0, 5, 6912, 20880, 1); -- Spark Kris +1 (6912 / 20880)
INSERT INTO `guild_item_points` VALUES (3, 0, 5, 2805, 18480, 2); -- Mythril Gorget (2805 / 18480)
INSERT INTO `guild_item_points` VALUES (3, 0, 5, 3630, 18480, 2); -- Mythril Gorget +1 (3630 / 18480)
INSERT INTO `guild_item_points` VALUES (3, 0, 5, 1794, 16560, 3); -- Hydro Baghnakhs (1794 / 16560)
INSERT INTO `guild_item_points` VALUES (3, 0, 5, 1872, 16560, 3); -- Hydro Baghnakhs +1 (1872 / 16560)
INSERT INTO `guild_item_points` VALUES (3, 0, 5, 3168, 18960, 4); -- Heater Shield (3168 / 18960)
INSERT INTO `guild_item_points` VALUES (3, 0, 5, 3828, 18960, 4); -- Heater Shield +1 (3828 / 18960)
INSERT INTO `guild_item_points` VALUES (3, 0, 5, 1750, 16560, 5); -- Gold Earring (1750 / 16560)
INSERT INTO `guild_item_points` VALUES (3, 0, 5, 2450, 16560, 5); -- Gold Earring +1 (2450 / 16560)
INSERT INTO `guild_item_points` VALUES (3, 0, 5, 3100, 18720, 6); -- Mythril Degen (3100 / 18720)
INSERT INTO `guild_item_points` VALUES (3, 0, 5, 3150, 18720, 6); -- Mythril Degen +1 (3150 / 18720)
INSERT INTO `guild_item_points` VALUES (3, 0, 5, 1260, 15120, 7); -- Wingedge (1260 / 15120)
INSERT INTO `guild_item_points` VALUES (3, 0, 5, 1260, 15120, 7); -- Wingedge +1 (1260 / 15120)

-- Goldsmithing / Craftsman
INSERT INTO `guild_item_points` VALUES (3, 0, 6, 3547, 19200, 0); -- Mythril Cuisses (3547 / 19200)
INSERT INTO `guild_item_points` VALUES (3, 0, 6, 3630, 19200, 0); -- Mythril Cuisses +1 (3630 / 19200)
INSERT INTO `guild_item_points` VALUES (3, 0, 6, 3870, 19680, 1); -- Gold Bangles (3870 / 19680)
INSERT INTO `guild_item_points` VALUES (3, 0, 6, 4470, 19680, 1); -- Gold Bangles +1 (4470 / 19680)
INSERT INTO `guild_item_points` VALUES (3, 0, 6, 3630, 19440, 2); -- Mythril Leggings (3630 / 19440)
INSERT INTO `guild_item_points` VALUES (3, 0, 6, 4455, 19440, 2); -- Mythril Leggings +1 (4455 / 19440)
INSERT INTO `guild_item_points` VALUES (3, 0, 6, 6200, 20880, 3); -- Platinum Ring (6200 / 20880)
INSERT INTO `guild_item_points` VALUES (3, 0, 6, 8800, 20880, 3); -- Platinum Ring +1 (8800 / 20880)
INSERT INTO `guild_item_points` VALUES (3, 0, 6, 3960, 19680, 4); -- Mythril Gauntlets (3960 / 19680)
INSERT INTO `guild_item_points` VALUES (3, 0, 6, 4785, 19680, 4); -- Mythril Gauntlets +1 (4785 / 19680)
INSERT INTO `guild_item_points` VALUES (3, 0, 6, 7507, 21360, 5); -- Mythril Breastplate (7507 / 21360)
INSERT INTO `guild_item_points` VALUES (3, 0, 6, 8332, 21360, 5); -- Mythril Breastplate (8332 / 21360)
INSERT INTO `guild_item_points` VALUES (3, 0, 6, 3037, 18720, 6); -- Mailbreaker (3037 / 18720)
INSERT INTO `guild_item_points` VALUES (3, 0, 6, 3150, 18720, 6); -- Mailbreaker +1 (3150 / 18720)
INSERT INTO `guild_item_points` VALUES (3, 0, 6, 3547, 19200, 7); -- Mythril Cuisses (3547 / 19200)
INSERT INTO `guild_item_points` VALUES (3, 0, 6, 3630, 19200, 7); -- Mythril Cuisses (3630 / 19200)

-- Goldsmithing / Artisan
INSERT INTO `guild_item_points` VALUES (3, 0, 7, 6370, 21120, 0); -- Gold Patas (6370 / 21120)
INSERT INTO `guild_item_points` VALUES (3, 0, 7, 6492, 21120, 0); -- Gold Patas +1 (6492 / 21120)
INSERT INTO `guild_item_points` VALUES (3, 0, 7, 5637, 20640, 1); -- Diamond Knuckles (5637 / 20640)
INSERT INTO `guild_item_points` VALUES (3, 0, 7, 5775, 20640, 1); -- Diamond Knuckles +1 (5775 / 20640)
INSERT INTO `guild_item_points` VALUES (3, 0, 7, 14640, 22560, 2); -- Gold Sword (14640 / 22560)
INSERT INTO `guild_item_points` VALUES (3, 0, 7, 14792, 22560, 2); -- Gold Sword (14792 / 22560)
INSERT INTO `guild_item_points` VALUES (3, 0, 7, 3250, 18960, 3); -- Ashura (3250 / 18960)
INSERT INTO `guild_item_points` VALUES (3, 0, 7, 3300, 18960, 3); -- Ashura +1 (3300 / 18960)
INSERT INTO `guild_item_points` VALUES (3, 0, 7, 3990, 19680, 4); -- Moonring Blade (3990 / 19680)
INSERT INTO `guild_item_points` VALUES (3, 0, 7, 4095, 19680, 4); -- Moonring Blade +1 (4095 / 19680)
INSERT INTO `guild_item_points` VALUES (3, 0, 7, 4950, 20400, 5); -- Gold Sabatons (4950 / 20400)
INSERT INTO `guild_item_points` VALUES (3, 0, 7, 6075, 20400, 5); -- Gold Sabatons +1 (6075 / 20400)
INSERT INTO `guild_item_points` VALUES (3, 0, 7, 4080, 19920, 6); -- Gold Buckler (4080 / 19920)
INSERT INTO `guild_item_points` VALUES (3, 0, 7, 4207, 19920, 6); -- Gold Buckler +1 (4207 / 19920)
INSERT INTO `guild_item_points` VALUES (3, 0, 7, 3937, 19680, 7); -- Gold Cuisses (3937 / 19680)
INSERT INTO `guild_item_points` VALUES (3, 0, 7, 4050, 19680, 7); -- Gold Cuisses +1 (4050 / 19680)

-- Goldsmithing / Adept
INSERT INTO `guild_item_points` VALUES (3, 0, 8, 7950, 21600, 0); -- Kazaridachi (7950 / 21600)
INSERT INTO `guild_item_points` VALUES (3, 0, 8, 7950, 21600, 0); -- Kazaridachi +1 (7950 / 21600)
INSERT INTO `guild_item_points` VALUES (3, 0, 8, 5640, 20880, 1); -- Diamond Shield (5640 / 20880)
INSERT INTO `guild_item_points` VALUES (3, 0, 8, 6815, 20880, 1); -- Diamond Shield +1 (6815 / 20880)
INSERT INTO `guild_item_points` VALUES (3, 0, 8, 5460, 20640, 2); -- Golden Spear (5460 / 20640)
INSERT INTO `guild_item_points` VALUES (3, 0, 8, 6435, 20640, 2); -- Golden Spear +1 (6435 / 20640)
INSERT INTO `guild_item_points` VALUES (3, 0, 8, 5697, 20880, 3); -- Platinum Bangles (5697 / 20880)
INSERT INTO `guild_item_points` VALUES (3, 0, 8, 7022, 20880, 3); -- Platinum Bangles +1 (7022 / 20880)
INSERT INTO `guild_item_points` VALUES (3, 0, 8, 8342, 21600, 4); -- Platinum Mace (8342 / 21600)
INSERT INTO `guild_item_points` VALUES (3, 0, 8, 8697, 21600, 4); -- Platinum Mace (8697 / 21600)
INSERT INTO `guild_item_points` VALUES (3, 0, 8, 10920, 22080, 5); -- Epee (10920 / 22080)
INSERT INTO `guild_item_points` VALUES (3, 0, 8, 11895, 22080, 5); -- Epee +1 (11895 / 22080)
INSERT INTO `guild_item_points` VALUES (3, 0, 8, 3780, 19680, 6); -- Jeweled Collar (3780 / 19680)
INSERT INTO `guild_item_points` VALUES (3, 0, 8, 4060, 19680, 6); -- Jeweled Collar +1 (4060 / 19680)
INSERT INTO `guild_item_points` VALUES (3, 0, 8, 13545, 22560, 7); -- Jagdplaute (13545 / 22560)
INSERT INTO `guild_item_points` VALUES (3, 0, 8, 13702, 22560, 7); -- Jagdplaute +1 (13702 / 22560)

-- Goldsmithing / Veteran
INSERT INTO `guild_item_points` VALUES (3, 0, 9, 17340, 22800, 0); -- Verdun (17340 / 22800)
INSERT INTO `guild_item_points` VALUES (3, 0, 9, 17977, 22800, 0); -- Verdun +1 (17977 / 22800)
INSERT INTO `guild_item_points` VALUES (3, 0, 9, 22200, 23040, 1); -- Orichalcum Dagger (22200 / 23040)
INSERT INTO `guild_item_points` VALUES (3, 0, 9, 22800, 23040, 1); -- Orichalcum Dagger +1 (22800 / 23040)
INSERT INTO `guild_item_points` VALUES (3, 0, 9, 1800, 17040, 2); -- Muscle Belt (1800 / 17040)
INSERT INTO `guild_item_points` VALUES (3, 0, 9, 2925, 17040, 2); -- Muscle Belt (2925 / 17040)
INSERT INTO `guild_item_points` VALUES (3, 0, 9, 21105, 23040, 3); -- Brisingamen (21105 / 23040)
INSERT INTO `guild_item_points` VALUES (3, 0, 9, 22680, 23040, 3); -- Brisingamen +1 (22680 / 23040)
INSERT INTO `guild_item_points` VALUES (3, 0, 9, 29750, 23280, 4); -- Orichalcum Ring (29750 / 23280)
INSERT INTO `guild_item_points` VALUES (3, 0, 9, 31450, 23280, 4); -- Triton Ring (31450 / 23280)
INSERT INTO `guild_item_points` VALUES (3, 0, 9, 22312, 23040, 5); -- Koenig Shield (22312 / 23040)
INSERT INTO `guild_item_points` VALUES (3, 0, 9, 23587, 23040, 5); -- Kaiser Shield (23587 / 23040)
INSERT INTO `guild_item_points` VALUES (3, 0, 9, 24500, 23280, 6); -- Millionaire Desk (24500 / 23280)
INSERT INTO `guild_item_points` VALUES (3, 0, 9, 29750, 23280, 7); -- Orichalcum Earring (29750 / 23280)
INSERT INTO `guild_item_points` VALUES (3, 0, 9, 31450, 23280, 7); -- Triton Earring (31450 / 23280)

-- Clothcraft / Amateur
INSERT INTO `guild_item_points` VALUES (4, 0, 0, 303, 7680, 0); -- Gloves (303/7680)
INSERT INTO `guild_item_points` VALUES (4, 0, 0, 373, 7680, 0); -- Gloves +1 (373/7680)
INSERT INTO `guild_item_points` VALUES (4, 0, 0, 211, 6480, 1); -- Brais (211/6480)
INSERT INTO `guild_item_points` VALUES (4, 0, 0, 282, 6480, 1); -- Brais +1 (282/6480)
INSERT INTO `guild_item_points` VALUES (4, 0, 0, 85, 4800, 2); -- Cape (85/4800)
INSERT INTO `guild_item_points` VALUES (4, 0, 0, 111, 4800, 2); -- Cape +1 (111/4800)
INSERT INTO `guild_item_points` VALUES (4, 0, 0, 282, 2440, 3); -- Gaiters (282/2440)
INSERT INTO `guild_item_points` VALUES (4, 0, 0, 352, 2440, 3); -- Gaiters +1 (352/2440)
INSERT INTO `guild_item_points` VALUES (4, 0, 0, 119, 5280, 4); -- Doublet (119/5280)
INSERT INTO `guild_item_points` VALUES (4, 0, 0, 148, 5280, 4); -- Doublet +1 (148/5280)
INSERT INTO `guild_item_points` VALUES (4, 0, 0, 85, 4800, 5); -- Cape (85/4800)
INSERT INTO `guild_item_points` VALUES (4, 0, 0, 111, 4800, 5); -- Cape +1 (111/4800)
INSERT INTO `guild_item_points` VALUES (4, 0, 0, 70, 4560, 6); -- Headgear (70/4560)
INSERT INTO `guild_item_points` VALUES (4, 0, 0, 128, 4560, 6); -- Headgear +1 (128/4560)
INSERT INTO `guild_item_points` VALUES (4, 0, 0, 110, 5040, 7); -- Vagabond's Hose (110/5040)
INSERT INTO `guild_item_points` VALUES (4, 0, 0, 118, 5040, 7); -- Vagabond's Hose +1 (118/5040)

-- Clothcraft / Recruit
INSERT INTO `guild_item_points` VALUES (4, 0, 1, 280, 7920, 0); -- Tunic (280/7920)
INSERT INTO `guild_item_points` VALUES (4, 0, 1, 312, 7920, 0); -- Tunic +1 (312/7920)
INSERT INTO `guild_item_points` VALUES (4, 0, 1, 858, 12480, 1); -- Cotton Doublet (858/12480)
INSERT INTO `guild_item_points` VALUES (4, 0, 1, 2518, 12480, 1); -- Cotton Doublet +1 (2518/12480)
INSERT INTO `guild_item_points` VALUES (4, 0, 1, 249, 7440, 2); -- Kenpogi (249/7440)
INSERT INTO `guild_item_points` VALUES (4, 0, 1, 280, 7440, 2); -- Kenpogi +1 (280/7440)
INSERT INTO `guild_item_points` VALUES (4, 0, 1, 127, 6000, 3); -- Kyahan (127/6000)
INSERT INTO `guild_item_points` VALUES (4, 0, 1, 159, 6000, 3); -- Kyahan +1 (159/6000)
INSERT INTO `guild_item_points` VALUES (4, 0, 1, 137, 6240, 4); -- Tekko (137/6240)
INSERT INTO `guild_item_points` VALUES (4, 0, 1, 168, 6240, 4); -- Tekko +1 (168/6240)
INSERT INTO `guild_item_points` VALUES (4, 0, 1, 187, 6720, 5); -- Slacks (187/6720)
INSERT INTO `guild_item_points` VALUES (4, 0, 1, 218, 6720, 5); -- Slacks +1 (218/6720)
INSERT INTO `guild_item_points` VALUES (4, 0, 1, 506, 10080, 6); -- Cotton Cape (506/10080)
INSERT INTO `guild_item_points` VALUES (4, 0, 1, 660, 10080, 6); -- Cotton Cape +1 (660/10080)
INSERT INTO `guild_item_points` VALUES (4, 0, 1, 118, 6000, 7); -- Vagabond's Tunica (118/6000)
INSERT INTO `guild_item_points` VALUES (4, 0, 1, 126, 6000, 7); -- Vagabond's Tunica +1 (126/6000)

-- Clothcraft / Initiate
INSERT INTO `guild_item_points` VALUES (4, 0, 2, 675, 11760, 0); -- Cotton Tekko (675/11760)
INSERT INTO `guild_item_points` VALUES (4, 0, 2, 829, 11760, 0); -- Cotton Tekko +1 (829/11760)
INSERT INTO `guild_item_points` VALUES (4, 0, 2, 629, 11280, 1); -- Cotton Kyahan (629/11280)
INSERT INTO `guild_item_points` VALUES (4, 0, 2, 629, 11280, 1); -- Cotton Kyahan +1 (629/11280)
INSERT INTO `guild_item_points` VALUES (4, 0, 2, 460, 10080, 2); -- Cotton Dogi (460/10080)
INSERT INTO `guild_item_points` VALUES (4, 0, 2, 476, 10080, 2); -- Cotton Dogi +1 (476/10080)
INSERT INTO `guild_item_points` VALUES (4, 0, 2, 814, 12480, 3); -- Cotton Hachimaki (814/12480)
INSERT INTO `guild_item_points` VALUES (4, 0, 2, 814, 12480, 3); -- Cotton Hachimaki +1 (814/12480)
INSERT INTO `guild_item_points` VALUES (4, 0, 2, 2500, 17760, 4); -- Gambison (2500/17760)
INSERT INTO `guild_item_points` VALUES (4, 0, 2, 2550, 17760, 4); -- Gambison +1 (2550/17760)
INSERT INTO `guild_item_points` VALUES (4, 0, 2, 349, 9120, 5); -- Linen Cuffs (349/9120)
INSERT INTO `guild_item_points` VALUES (4, 0, 2, 430, 9120, 5); -- Linen Cuffs +1 (430/9120)
INSERT INTO `guild_item_points` VALUES (4, 0, 2, 99, 6240, 6); -- Heko Obi (99/6240)
INSERT INTO `guild_item_points` VALUES (4, 0, 2, 131, 6240, 6); -- Heko Obi +1 (131/6240)
INSERT INTO `guild_item_points` VALUES (4, 0, 2, 617, 11280, 7); -- Linen Robe (617/11280)
INSERT INTO `guild_item_points` VALUES (4, 0, 2, 617, 11280, 7); -- Linen Robe (617/11280)

-- Clothcraft / Novice
INSERT INTO `guild_item_points` VALUES (4, 0, 3, 1836, 16560, 0); -- Soil Kyahan (1836/16560)
INSERT INTO `guild_item_points` VALUES (4, 0, 3, 1872, 16560, 0); -- Soil Kyahan +1 (1872/16560)
INSERT INTO `guild_item_points` VALUES (4, 0, 3, 3120, 18720, 1); -- Mist Tunic (3120/18720)
INSERT INTO `guild_item_points` VALUES (4, 0, 3, 1395, 15120, 2); -- Mist Mitts (1395/15120)
INSERT INTO `guild_item_points` VALUES (4, 0, 3, 1748, 16320, 3); -- Cloak (1748/16320)
INSERT INTO `guild_item_points` VALUES (4, 0, 3, 1794, 16320, 3); -- Cloak +1 (1794/16320)
INSERT INTO `guild_item_points` VALUES (4, 0, 3, 1584, 15840, 4); -- Soil Tekko (1584/15840)
INSERT INTO `guild_item_points` VALUES (4, 0, 3, 1944, 15840, 4); -- Soil Tekko +1 (1944/15840)
INSERT INTO `guild_item_points` VALUES (4, 0, 3, 2304, 17520, 5); -- Soil Sitabaki (2304/17520)
INSERT INTO `guild_item_points` VALUES (4, 0, 3, 2664, 17520, 5); -- Soil Sitabaki +1 (2664/17520)
INSERT INTO `guild_item_points` VALUES (4, 0, 3, 2460, 17760, 6); -- Mist Slacks (2460/17760)
INSERT INTO `guild_item_points` VALUES (4, 0, 3, 1116, 14160, 7); -- Soil Hachimaki (1116/14160)
INSERT INTO `guild_item_points` VALUES (4, 0, 3, 1152, 14160, 7); -- Soil Hachimaki +1 (1152/14160)

-- Clothcraft / Apprentice
INSERT INTO `guild_item_points` VALUES (4, 0, 4, 3440, 19200, 0); -- Wool Bracers (3440/19200)
INSERT INTO `guild_item_points` VALUES (4, 0, 4, 4240, 19200, 0); -- Wool Bracers +1 (4240/19200)
INSERT INTO `guild_item_points` VALUES (4, 0, 4, 3200, 18960, 1); -- Wool Socks (3200/18960)
INSERT INTO `guild_item_points` VALUES (4, 0, 4, 4000, 18960, 1); -- Wool Socks +1 (4000/18960)
INSERT INTO `guild_item_points` VALUES (4, 0, 4, 2108, 17280, 2); -- Wool Slops (2108/17280)
INSERT INTO `guild_item_points` VALUES (4, 0, 4, 2448, 17280, 2); -- Wool Slops +1 (2448/17280)
INSERT INTO `guild_item_points` VALUES (4, 0, 4, 1155, 14640, 3); -- Wool Cap (1155/14640)
INSERT INTO `guild_item_points` VALUES (4, 0, 4, 1251, 14640, 3); -- Wool Cap +1 (1251/14640)
INSERT INTO `guild_item_points` VALUES (4, 0, 4, 2584, 18000, 4); -- Wool Robe (2584/18000)
INSERT INTO `guild_item_points` VALUES (4, 0, 4, 2584, 18000, 4); -- Wool Robe +1 (2584/18000)
INSERT INTO `guild_item_points` VALUES (4, 0, 4, 180, 8400, 5); -- Hemp Gorget (180/8400)
INSERT INTO `guild_item_points` VALUES (4, 0, 4, 320, 8400, 5); -- Hemp Gorget +1 (320/8400)
INSERT INTO `guild_item_points` VALUES (4, 0, 4, 4800, 20160, 6); -- Wool Hose (4800/20160)
INSERT INTO `guild_item_points` VALUES (4, 0, 4, 4880, 20160, 6); -- Wool Hose (4880/20160)
INSERT INTO `guild_item_points` VALUES (4, 0, 4, 1462, 15600, 7); -- Wool Cuffs (1462/15600)
INSERT INTO `guild_item_points` VALUES (4, 0, 4, 1802, 15600, 7); -- Wool Cuffs +1 (1802/15600)

-- Clothcraft / Journeyman
INSERT INTO `guild_item_points` VALUES (4, 0, 5, 2550, 18000, 0); -- Black Mitts (2550/18000)
INSERT INTO `guild_item_points` VALUES (4, 0, 5, 2720, 18000, 0); -- Black Mitts +1 (2720/18000)
INSERT INTO `guild_item_points` VALUES (4, 0, 5, 4256, 19920, 1); -- Velvet Robe (4256/19920)
INSERT INTO `guild_item_points` VALUES (4, 0, 5, 4816, 19920, 1); -- Velvet Robe +1 (4816/19920)
INSERT INTO `guild_item_points` VALUES (4, 0, 5, 250, 9600, 2); -- Scarlet Ribbon (250/9600)
INSERT INTO `guild_item_points` VALUES (4, 0, 5, 350, 9600, 2); -- Scarlet Ribbon +1 (350/9600)
INSERT INTO `guild_item_points` VALUES (4, 0, 5, 2178, 17520, 3); -- Red Cape (2178/17520)
INSERT INTO `guild_item_points` VALUES (4, 0, 5, 2838, 17520, 3); -- Red Cape +1 (2838/17520)
INSERT INTO `guild_item_points` VALUES (4, 0, 5, 1150, 14640, 4); -- Black Slacks (1150/14640)
INSERT INTO `guild_item_points` VALUES (4, 0, 5, 1342, 14640, 4); -- Black Slacks +1 (1342/14640)
INSERT INTO `guild_item_points` VALUES (4, 0, 5, 1386, 15600, 5); -- Black Cape (1386/15600)
INSERT INTO `guild_item_points` VALUES (4, 0, 5, 1806, 15600, 5); -- Black Cape +1 (1806/15600)
INSERT INTO `guild_item_points` VALUES (4, 0, 5, 2508, 18000, 6); -- Linen Doublet (2508/18000)
INSERT INTO `guild_item_points` VALUES (4, 0, 5, 2552, 18000, 6); -- Linen Doublet +1 (2552/18000)
INSERT INTO `guild_item_points` VALUES (4, 0, 5, 613, 12240, 7); -- Silver Obi (613/12240)
INSERT INTO `guild_item_points` VALUES (4, 0, 5, 824, 12240, 7); -- Silver Obi +1 (824/12240)

-- Clothcraft / Craftsman
INSERT INTO `guild_item_points` VALUES (4, 0, 6, 7030, 21360, 0); -- Silk Coat (7030/21360)
INSERT INTO `guild_item_points` VALUES (4, 0, 6, 7030, 21360, 0); -- Silk Coat +1 (7030/21360)
INSERT INTO `guild_item_points` VALUES (4, 0, 6, 2280, 17760, 1); -- Silk Headband (2280/17760)
INSERT INTO `guild_item_points` VALUES (4, 0, 6, 2375, 17760, 1); -- Silk Headband +1 (2375/17760)
INSERT INTO `guild_item_points` VALUES (4, 0, 6, 5100, 20400, 2); -- White Slacks (5100/20400)
INSERT INTO `guild_item_points` VALUES (4, 0, 6, 5950, 20400, 2); -- White Slacks (5950/20400)
INSERT INTO `guild_item_points` VALUES (4, 0, 6, 4992, 20400, 3); -- Wool Doublet (4992/20400)
INSERT INTO `guild_item_points` VALUES (4, 0, 6, 5632, 20400, 3); -- Wool Doublet +1 (5632/20400)
INSERT INTO `guild_item_points` VALUES (4, 0, 6, 2025, 17280, 4); -- Green Ribbon (2025/17280)
INSERT INTO `guild_item_points` VALUES (4, 0, 6, 2137, 17280, 4); -- Green Ribbon +1 (2137/17280)
INSERT INTO `guild_item_points` VALUES (4, 0, 6, 7650, 21600, 5); -- White Cloak (7650/21600)
INSERT INTO `guild_item_points` VALUES (4, 0, 6, 7650, 21600, 5); -- White Cloak +1 (7650/21600)
INSERT INTO `guild_item_points` VALUES (4, 0, 6, 5735, 20880, 6); -- Silk Slops (5735/20880)
INSERT INTO `guild_item_points` VALUES (4, 0, 6, 6660, 20880, 6); -- Silk Slops +1 (6660/20880)
INSERT INTO `guild_item_points` VALUES (4, 0, 6, 2408, 18000, 7); -- Velvet Cuffs (2408/18000)
INSERT INTO `guild_item_points` VALUES (4, 0, 6, 2968, 18000, 7); -- Velvet Cuffs (2968/18000)

-- Clothcraft / Artisan
INSERT INTO `guild_item_points` VALUES (4, 0, 7, 3055, 18960, 0); -- Green Beret (3055/18960)
INSERT INTO `guild_item_points` VALUES (4, 0, 7, 3250, 18960, 0); -- Green Beret +1 (3250/18960)
INSERT INTO `guild_item_points` VALUES (4, 0, 7, 6375, 21120, 1); -- Silk Cloak (6375/21120)
INSERT INTO `guild_item_points` VALUES (4, 0, 7, 6500, 21120, 1); -- Silk Cloak +1 (6500/21120)
INSERT INTO `guild_item_points` VALUES (4, 0, 7, 3382, 19200, 2); -- Shinobi Kyahan (3382/19200)
INSERT INTO `guild_item_points` VALUES (4, 0, 7, 4207, 19200, 2); -- Shinobi Kyahan +1 (4207/19200)
INSERT INTO `guild_item_points` VALUES (4, 0, 7, 3630, 19200, 3); -- Shinobi Tekko (3630/19200)
INSERT INTO `guild_item_points` VALUES (4, 0, 7, 4455, 19200, 3); -- Shinobi Tekko (4455/19200)
INSERT INTO `guild_item_points` VALUES (4, 0, 7, 3217, 18960, 4); -- Jester's Cape (3217/18960)
INSERT INTO `guild_item_points` VALUES (4, 0, 7, 4192, 18960, 4); -- Jester's Cape +1 (4192/18960)
INSERT INTO `guild_item_points` VALUES (4, 0, 7, 4830, 20400, 5); -- Silk Mitts (4830/20400)
INSERT INTO `guild_item_points` VALUES (4, 0, 7, 5980, 20400, 5); -- Silk Mitts +1 (5980/20400)
INSERT INTO `guild_item_points` VALUES (4, 0, 7, 3465, 19200, 6); -- Shinobi Hakama (3465/19200)
INSERT INTO `guild_item_points` VALUES (4, 0, 7, 3547, 19200, 6); -- Shinobi Hakama +1 (3547/19200)
INSERT INTO `guild_item_points` VALUES (4, 0, 7, 3630, 19440, 7); -- Shinobi Tekko (3630/19440)
INSERT INTO `guild_item_points` VALUES (4, 0, 7, 4455, 19440, 7); -- Shinobi Tekko +1 (4455/19440)

-- Clothcraft / Adept
INSERT INTO `guild_item_points` VALUES (4, 0, 8, 3225, 19200, 0); -- Arhat's Tekko (3225/19200)
INSERT INTO `guild_item_points` VALUES (4, 0, 8, 3762, 19200, 0); -- Arhat's Tekko +1 (3762/19200)
INSERT INTO `guild_item_points` VALUES (4, 0, 8, 3840, 19680, 1); -- Rainbow Obi (3840/19680)
INSERT INTO `guild_item_points` VALUES (4, 0, 8, 3840, 19680, 1); -- Rainbow Obi +1 (3840/19680)
INSERT INTO `guild_item_points` VALUES (4, 0, 8, 7750, 21600, 2); -- Noble's Slacks (7750/21600)
INSERT INTO `guild_item_points` VALUES (4, 0, 8, 9000, 21600, 2); -- Noble's Slacks +1 (9000/21600)
INSERT INTO `guild_item_points` VALUES (4, 0, 8, 5300, 20640, 3); -- Rainbow Headband (5300/20640)
INSERT INTO `guild_item_points` VALUES (4, 0, 8, 5962, 20640, 3); -- Rainbow Headband +1 (5962/20640)
INSERT INTO `guild_item_points` VALUES (4, 0, 8, 5590, 20640, 4); -- Noble's Mitts (5590/20640)
INSERT INTO `guild_item_points` VALUES (4, 0, 8, 6880, 20640, 4); -- Noble's Mitts +1 (6880/20640)
INSERT INTO `guild_item_points` VALUES (4, 0, 8, 3762, 19680, 5); -- Arhat's Sune-Ate (3762/19680)
INSERT INTO `guild_item_points` VALUES (4, 0, 8, 4300, 19680, 5); -- Arhat's Sune-Ate +1 (4300/19680)
INSERT INTO `guild_item_points` VALUES (4, 0, 8, 4300, 19920, 6); -- Arhat's Hakama (4300/19920)
INSERT INTO `guild_item_points` VALUES (4, 0, 8, 4837, 19920, 6); -- Arhat's Hakama +1 (4837/19920)
INSERT INTO `guild_item_points` VALUES (4, 0, 8, 3225, 19200, 7); -- Arhat's Jinpachi (3225/19200)
INSERT INTO `guild_item_points` VALUES (4, 0, 8, 3762, 19200, 7); -- Arhat's Jinpachi +1 (3762/19200)

-- Clothcraft / Veteran
INSERT INTO `guild_item_points` VALUES (4, 0, 9, 15000, 22560, 0); -- Rasetsu Tekko (15000/22560)
INSERT INTO `guild_item_points` VALUES (4, 0, 9, 16250, 22560, 0); -- Rasetsu Tekko +1 (16250/22560)
INSERT INTO `guild_item_points` VALUES (4, 0, 9, 12375, 22320, 1); -- Rasetsu Hakama (12375/22320)
INSERT INTO `guild_item_points` VALUES (4, 0, 9, 13625, 22320, 1); -- Rasetsu Hakama +1 (13625/22320)
INSERT INTO `guild_item_points` VALUES (4, 0, 9, 3600, 19440, 2); -- Tarutaru Sash (3600/19440)
INSERT INTO `guild_item_points` VALUES (4, 0, 9, 4200, 19440, 2); -- Tarutaru Sash +1 (4200/19440)
INSERT INTO `guild_item_points` VALUES (4, 0, 9, 3750, 19680, 3); -- Errant Slops (3750/19680)
INSERT INTO `guild_item_points` VALUES (4, 0, 9, 5000, 19680, 3); -- Errant Slops +1 (5000/19680)
INSERT INTO `guild_item_points` VALUES (4, 0, 9, 4500, 20160, 4); -- Errant Hat (4500/20160)
INSERT INTO `guild_item_points` VALUES (4, 0, 9, 5750, 20160, 4); -- Errant Hat +1 (5750/20160)
INSERT INTO `guild_item_points` VALUES (4, 0, 9, 12000, 22320, 5); -- Rasetsu Sune-Ate (12000/22320)
INSERT INTO `guild_item_points` VALUES (4, 0, 9, 13250, 22320, 5); -- Rasetsu Sune-Ate +1 (13250/22320)
INSERT INTO `guild_item_points` VALUES (4, 0, 9, 6875, 21360, 6); -- Errant Cuffs (6875/21360)
INSERT INTO `guild_item_points` VALUES (4, 0, 9, 8125, 21360, 6); -- Errant Cuffs (8125/21360)
INSERT INTO `guild_item_points` VALUES (4, 0, 9, 13750, 22560, 7); -- Rasetsu Jinpachi (13750/22560)
INSERT INTO `guild_item_points` VALUES (4, 0, 9, 15000, 22560, 7); -- Rasetsu Jinpachi (15000/22560)

-- Leathercraft / Amateur
INSERT INTO `guild_item_points` VALUES (5, 0, 0, 92, 4800, 0); -- Leather Vest (92/4800)
INSERT INTO `guild_item_points` VALUES (5, 0, 0, 153, 4800, 0); -- Leather Vest +1 (153/4800)
INSERT INTO `guild_item_points` VALUES (5, 0, 0, 90, 4800, 1); -- Leather Gloves (90/4800)
INSERT INTO `guild_item_points` VALUES (5, 0, 0, 110, 4800, 1); -- Leather Gloves (110/4800)
INSERT INTO `guild_item_points` VALUES (5, 0, 0, 63, 4320, 2); -- Vagabond's Gloves (63/4320)
INSERT INTO `guild_item_points` VALUES (5, 0, 0, 71, 4320, 2); -- Vagabond's Gloves +1 (71/4320)
INSERT INTO `guild_item_points` VALUES (5, 0, 0, 84, 4560, 3); -- Leather Highboots (84/4560)
INSERT INTO `guild_item_points` VALUES (5, 0, 0, 104, 4560, 3); -- Leather Highboots +1 (104/4560)
INSERT INTO `guild_item_points` VALUES (5, 0, 0, 52, 4080, 4); -- Leather Bandana (52/4080)
INSERT INTO `guild_item_points` VALUES (5, 0, 0, 120, 4080, 4); -- Leather Bandana +1 (120/4080)
INSERT INTO `guild_item_points` VALUES (5, 0, 0, 134, 5520, 5); -- Leather Trousers (134/5520)
INSERT INTO `guild_item_points` VALUES (5, 0, 0, 154, 5520, 5); -- Leather Trousers +1 (154/5520)
INSERT INTO `guild_item_points` VALUES (5, 0, 0, 63, 4320, 6); -- Vagabond's Boots (63/4320)
INSERT INTO `guild_item_points` VALUES (5, 0, 0, 71, 4320, 6); -- Vagabond's Boots +1 (71/4320)
INSERT INTO `guild_item_points` VALUES (5, 0, 0, 24, 3600, 7); -- Cesti (24/3600)
INSERT INTO `guild_item_points` VALUES (5, 0, 0, 32, 3600, 7); -- Cesti +1 (32/3600)

-- Leathercraft / Recruit
INSERT INTO `guild_item_points` VALUES (5, 0, 1, 121, 6000, 0); -- Solea (121/6000)
INSERT INTO `guild_item_points` VALUES (5, 0, 1, 152, 6000, 0); -- Solea +1 (152/6000)
INSERT INTO `guild_item_points` VALUES (5, 0, 1, 177, 6270, 1); -- Lizard Helm (177/6270)
INSERT INTO `guild_item_points` VALUES (5, 0, 1, 177, 6270, 1); -- Lizard Helm +1 (177/6270)
INSERT INTO `guild_item_points` VALUES (5, 0, 1, 85, 5520, 2); -- Leather Belt (85/5520)
INSERT INTO `guild_item_points` VALUES (5, 0, 1, 111, 5520, 2); -- Leather Belt +1 (111/5520)
INSERT INTO `guild_item_points` VALUES (5, 0, 1, 252, 7680, 3); -- Lizard Cesti (252/7680)
INSERT INTO `guild_item_points` VALUES (5, 0, 1, 333, 7680, 3); -- Lizard Cesti +1 (333/7680)
INSERT INTO `guild_item_points` VALUES (5, 0, 1, 81, 5280, 4); -- Lizard Mantle (81/5280)
INSERT INTO `guild_item_points` VALUES (5, 0, 1, 95, 5280, 4); -- Lizard Mantle +1 (95/5280)
INSERT INTO `guild_item_points` VALUES (5, 0, 1, 180, 6720, 5); -- Fisherman's Boots (180/6720)
INSERT INTO `guild_item_points` VALUES (5, 0, 1, 519, 6720, 5); -- Fisherman's Boots +1 (519/6720)
INSERT INTO `guild_item_points` VALUES (5, 0, 1, 245, 7440, 6); -- Lizard Jerkin (245/7440)
INSERT INTO `guild_item_points` VALUES (5, 0, 1, 259, 7440, 6); -- Lizard Jerkin +1 (259/7440)
INSERT INTO `guild_item_points` VALUES (5, 0, 1, 360, 8640, 7); -- Fisherman's Gloves (360/8640)
INSERT INTO `guild_item_points` VALUES (5, 0, 1, 360, 8640, 7); -- Fisherman's Gloves +1 (360/8640)

-- Leathercraft / Initiate
INSERT INTO `guild_item_points` VALUES (5, 0, 2, 1102, 13920, 0); -- Studded Bandana (1102/13920)
INSERT INTO `guild_item_points` VALUES (5, 0, 2, 1140, 13920, 0); -- Studded Bandana +1 (1140/13920)
INSERT INTO `guild_item_points` VALUES (5, 0, 2, 1710, 16090, 1); -- Studded Gloves (1710/16090)
INSERT INTO `guild_item_points` VALUES (5, 0, 2, 2090, 16090, 1); -- Studded Gloves +1 (2090/16090)
INSERT INTO `guild_item_points` VALUES (5, 0, 2, 519, 10560, 2); -- Chocobo Gloves (519/10560)
INSERT INTO `guild_item_points` VALUES (5, 0, 2, 570, 10560, 2); -- Chocobo Gloves +1 (570/10560)
INSERT INTO `guild_item_points` VALUES (5, 0, 2, 552, 10800, 3); -- Dhalmel Mantle (552/10800)
INSERT INTO `guild_item_points` VALUES (5, 0, 2, 706, 10800, 3); -- Dhalmel Mantle +1 (706/10800)
INSERT INTO `guild_item_points` VALUES (5, 0, 2, 330, 8880, 4); -- Warrior's Belt (330/8880)
INSERT INTO `guild_item_points` VALUES (5, 0, 2, 400, 8880, 4); -- Warrior's Belt +1 (400/8880)
INSERT INTO `guild_item_points` VALUES (5, 0, 2, 519, 10560, 5); -- Chocobo Boots (519/10560)
INSERT INTO `guild_item_points` VALUES (5, 0, 2, 570, 10560, 5); -- Chocobo Boots +1 (570/10560)
INSERT INTO `guild_item_points` VALUES (5, 0, 2, 748, 12000, 6); -- Sandals (748/12000)
INSERT INTO `guild_item_points` VALUES (5, 0, 2, 939, 12000, 6); -- Sandals +1 (939/12000)
INSERT INTO `guild_item_points` VALUES (5, 0, 2, 250, 8160, 7); -- Leather Ring (250/8160)
INSERT INTO `guild_item_points` VALUES (5, 0, 2, 350, 8160, 7); -- Leather Ring (350/8160)

-- Leathercraft / Novice
INSERT INTO `guild_item_points` VALUES (5, 0, 3, 1305, 14880, 0); -- Mist Pumps (1305/14880)
INSERT INTO `guild_item_points` VALUES (5, 0, 3, 608, 11520, 1); -- Wolf Gorget (608/11520)
INSERT INTO `guild_item_points` VALUES (5, 0, 3, 684, 11520, 1); -- Wolf Gorget (684/11520)
INSERT INTO `guild_item_points` VALUES (5, 0, 3, 1224, 14640, 2); -- Wolf Mantle (1224/14640)
INSERT INTO `guild_item_points` VALUES (5, 0, 3, 1564, 14640, 2); -- Wolf Mantle +1 (1564/14640)
INSERT INTO `guild_item_points` VALUES (5, 0, 3, 665, 12000, 3); -- Field Boots (665/12000)
INSERT INTO `guild_item_points` VALUES (5, 0, 3, 1140, 12000, 3); -- Field Boots +1 (1140/12000)
INSERT INTO `guild_item_points` VALUES (5, 0, 3, 1104, 14160, 4); -- Shoes (1104/14160)
INSERT INTO `guild_item_points` VALUES (5, 0, 3, 1196, 14160, 4); -- Shoes +1 (1196/14160)
INSERT INTO `guild_item_points` VALUES (5, 0, 3, 506, 10800, 5); -- Magic Belt (506/10800)
INSERT INTO `guild_item_points` VALUES (5, 0, 3, 660, 10800, 5); -- Magic Belt +1 (660/10800)
INSERT INTO `guild_item_points` VALUES (5, 0, 3, 1624, 15840, 6); -- Cuir Gloves (1624/15840)
INSERT INTO `guild_item_points` VALUES (5, 0, 3, 1680, 15840, 6); -- Cuir Gloves +1 (1680/15840)
INSERT INTO `guild_item_points` VALUES (5, 0, 3, 2280, 17520, 7); -- Studded Vest (2280/17520)
INSERT INTO `guild_item_points` VALUES (5, 0, 3, 2318, 17520, 7); -- Studded Vest +1 (2318/17520)

-- Leathercraft / Apprentice
INSERT INTO `guild_item_points` VALUES (5, 0, 4, 3250, 18960, 0); -- Corsette (3250/18960)
INSERT INTO `guild_item_points` VALUES (5, 0, 4, 3750, 18960, 0); -- Corsette +1 (3750/18960)
INSERT INTO `guild_item_points` VALUES (5, 0, 4, 900, 13440, 1); -- Ram Mantle (900/13440)
INSERT INTO `guild_item_points` VALUES (5, 0, 4, 1000, 13440, 1); -- Ram Mantle +1 (1000/13440)
INSERT INTO `guild_item_points` VALUES (5, 0, 4, 1736, 16320, 2); -- Cuir Highboots (1736/16320)
INSERT INTO `guild_item_points` VALUES (5, 0, 4, 1792, 16320, 2); -- Cuir Highboots +1 (1792/16320)
INSERT INTO `guild_item_points` VALUES (5, 0, 4, 1960, 16800, 3); -- Cuir Bouilli (1960/16800)
INSERT INTO `guild_item_points` VALUES (5, 0, 4, 2072, 16800, 3); -- Cuir Bouilli +1 (2072/16800)
INSERT INTO `guild_item_points` VALUES (5, 0, 4, 1680, 16080, 4); -- Waistbelt (1680/16080)
INSERT INTO `guild_item_points` VALUES (5, 0, 4, 1740, 16080, 4); -- Waistbelt +1 (1740/16080)
INSERT INTO `guild_item_points` VALUES (5, 0, 4, 1008, 13920, 5); -- Cuir Trousers (1008/13920)
INSERT INTO `guild_item_points` VALUES (5, 0, 4, 1232, 13920, 5); -- Cuir Trousers +1 (1232/13920)
INSERT INTO `guild_item_points` VALUES (5, 0, 4, 1297, 15120, 6); -- Chocobo Jack Coat (1297/15120)
INSERT INTO `guild_item_points` VALUES (5, 0, 4, 1349, 15120, 6); -- Chocobo Jack Coat +1 (1349/15120)
INSERT INTO `guild_item_points` VALUES (5, 0, 4, 506, 11280, 7); -- Barbarian's Belt (506/11280)
INSERT INTO `guild_item_points` VALUES (5, 0, 4, 660, 11280, 7); -- Barbarian's Belt (660/11280)

-- Leathercraft / Journeyman
INSERT INTO `guild_item_points` VALUES (5, 0, 5, 2240, 17520, 0); -- Raptor Helm (2240/17520)
INSERT INTO `guild_item_points` VALUES (5, 0, 5, 2400, 17520, 0); -- Raptor Helm +1 (2400/17520)
INSERT INTO `guild_item_points` VALUES (5, 0, 5, 3600, 19200, 1); -- Raptor Gloves (3600/19200)
INSERT INTO `guild_item_points` VALUES (5, 0, 5, 3760, 19200, 1); -- Raptor Gloves +1 (3760/19200)
INSERT INTO `guild_item_points` VALUES (5, 0, 5, 1140, 14640, 2); -- Himantes (1140/14640)
INSERT INTO `guild_item_points` VALUES (5, 0, 5, 1720, 14640, 2); -- Himantes +1 (1720/14640)
INSERT INTO `guild_item_points` VALUES (5, 0, 5, 3360, 18960, 3); -- Raptor Ledelsens (3360/18960)
INSERT INTO `guild_item_points` VALUES (5, 0, 5, 4160, 18960, 3); -- Raptor Ledelsens +1 (4160/18960)
INSERT INTO `guild_item_points` VALUES (5, 0, 5, 1280, 15120, 4); -- Raptor Mantle (1280/15120)
INSERT INTO `guild_item_points` VALUES (5, 0, 5, 1440, 15120, 4); -- Raptor Mantle +1 (1440/15120)
INSERT INTO `guild_item_points` VALUES (5, 0, 5, 2160, 17280, 5); -- Raptor Trousers (2160/17280)
INSERT INTO `guild_item_points` VALUES (5, 0, 5, 2320, 17280, 5); -- Raptor Trousers +1 (2320/17280)
INSERT INTO `guild_item_points` VALUES (5, 0, 5, 1700, 16320, 6); -- Moccasins (1700/16320)
INSERT INTO `guild_item_points` VALUES (5, 0, 5, 1785, 16320, 6); -- Moccasins +1 (1785/16320)
INSERT INTO `guild_item_points` VALUES (5, 0, 5, 1280, 15120, 7); -- Leather Shield (1280/15120)
INSERT INTO `guild_item_points` VALUES (5, 0, 5, 1360, 15120, 7); -- Leather Shield +1 (1360/15120)

-- Leathercraft / Craftsman
INSERT INTO `guild_item_points` VALUES (5, 0, 6, 2687, 18240, 0); -- Beak Helm (2687/18240)
INSERT INTO `guild_item_points` VALUES (5, 0, 6, 2795, 18240, 0); -- Beak Helm +1 (2795/18240)
INSERT INTO `guild_item_points` VALUES (5, 0, 6, 3600, 19200, 1); -- Beak Gloves (3600/19200)
INSERT INTO `guild_item_points` VALUES (5, 0, 6, 3760, 19200, 1); -- Beak Gloves +1 (3760/19200)
INSERT INTO `guild_item_points` VALUES (5, 0, 6, 1612, 16320, 2); -- Beak Mantle (1612/16320)
INSERT INTO `guild_item_points` VALUES (5, 0, 6, 1720, 16320, 2); -- Beak Mantle +1 (1720/16320)
INSERT INTO `guild_item_points` VALUES (5, 0, 6, 2860, 18480, 3); -- Battle Boots (2860/18480)
INSERT INTO `guild_item_points` VALUES (5, 0, 6, 3190, 18480, 3); -- Battle Boots +1 (3190/18480)
INSERT INTO `guild_item_points` VALUES (5, 0, 6, 3225, 18960, 4); -- Beak Trousers (3225/18960)
INSERT INTO `guild_item_points` VALUES (5, 0, 6, 3225, 18960, 4); -- Beak Trousers +1 (3225/18960)
INSERT INTO `guild_item_points` VALUES (5, 0, 6, 4515, 20160, 5); -- Beak Ledelsens (4515/20160)
INSERT INTO `guild_item_points` VALUES (5, 0, 6, 4622, 20160, 5); -- Beak Ledelsens +1 (4622/20160)
INSERT INTO `guild_item_points` VALUES (5, 0, 6, 2150, 17520, 6); -- Beak Jerkin (2150/17520)
INSERT INTO `guild_item_points` VALUES (5, 0, 6, 2150, 17520, 6); -- Beak Jerkin +1 (2150/17520)
INSERT INTO `guild_item_points` VALUES (5, 0, 6, 770, 13200, 7); -- Hard Leather Ring (770/13200)
INSERT INTO `guild_item_points` VALUES (5, 0, 6, 880, 13200, 7); -- Hard Leather Ring +1 (880/13200)

-- Leathercraft / Artisan
INSERT INTO `guild_item_points` VALUES (5, 0, 7, 4485, 20160, 0); -- Silk Pumps (4485/20160)
INSERT INTO `guild_item_points` VALUES (5, 0, 7, 5635, 20160, 0); -- Silk Pumps +1 (5635/20160)
INSERT INTO `guild_item_points` VALUES (5, 0, 7, 1912, 17040, 1); -- Tiger Gloves (1912/17040)
INSERT INTO `guild_item_points` VALUES (5, 0, 7, 2040, 17040, 1); -- Tiger Gloves +1 (2040/17040)
INSERT INTO `guild_item_points` VALUES (5, 0, 7, 1980, 17280, 2); -- Coeurl Cesti (1980/17280)
INSERT INTO `guild_item_points` VALUES (5, 0, 7, 2070, 17280, 2); -- Coeurl Cesti +1 (2070/17280)
INSERT INTO `guild_item_points` VALUES (5, 0, 7, 1250, 15360, 3); -- Tiger Mantle (1250/15360)
INSERT INTO `guild_item_points` VALUES (5, 0, 7, 1375, 15360, 3); -- Tiger Mantle +1 (1375/15360)
INSERT INTO `guild_item_points` VALUES (5, 0, 7, 3680, 19440, 4); -- Battle Hose (3680/19440)
INSERT INTO `guild_item_points` VALUES (5, 0, 7, 3795, 19440, 4); -- Battle Hose (3795/19440)
INSERT INTO `guild_item_points` VALUES (5, 0, 7, 2040, 17280, 5); -- Tiger Trousers (2040/17280)
INSERT INTO `guild_item_points` VALUES (5, 0, 7, 2160, 17280, 5); -- Tiger Trousers +1 (2160/17280)
INSERT INTO `guild_item_points` VALUES (5, 0, 7, 2200, 17520, 6); -- Black Mantle (2200/17520)
INSERT INTO `guild_item_points` VALUES (5, 0, 7, 3300, 17520, 6); -- Black Mantle +1 (3300/17520)
INSERT INTO `guild_item_points` VALUES (5, 0, 7, 2178, 17520, 7); -- Swordbelt (2178/17520)
INSERT INTO `guild_item_points` VALUES (5, 0, 7, 2838, 17520, 7); -- Swordbelt (2838/17520)

-- Leathercraft / Adept
INSERT INTO `guild_item_points` VALUES (5, 0, 8, 4560, 20160, 0); -- Ogre Jerkin (4560/20160)
INSERT INTO `guild_item_points` VALUES (5, 0, 8, 5760, 20160, 0); -- Ogre Jerkin +1 (5760/20160)
INSERT INTO `guild_item_points` VALUES (5, 0, 8, 4200, 19920, 1); -- Ogre Mask (4200/19920)
INSERT INTO `guild_item_points` VALUES (5, 0, 8, 5400, 19920, 1); -- Ogre Mask +1 (5400/19920)
INSERT INTO `guild_item_points` VALUES (5, 0, 8, 2100, 17520, 2); -- Coeurl Mantle (2100/17520)
INSERT INTO `guild_item_points` VALUES (5, 0, 8, 2800, 17520, 2); -- Coeurl Mantle +1 (2800/17520)
INSERT INTO `guild_item_points` VALUES (5, 0, 8, 4785, 20400, 3); -- Koenigs Belt (4785/20400)
INSERT INTO `guild_item_points` VALUES (5, 0, 8, 6235, 20400, 3); -- Koenigs Belt +1 (6235/20400)
INSERT INTO `guild_item_points` VALUES (5, 0, 8, 5040, 20400, 4); -- Ogre Ledelsens (5040/20400)
INSERT INTO `guild_item_points` VALUES (5, 0, 8, 6240, 20400, 4); -- Ogre Ledelsens +1 (6240/20400)
INSERT INTO `guild_item_points` VALUES (5, 0, 8, 3500, 19440, 5); -- Coeurl Mask (3500/19440)
INSERT INTO `guild_item_points` VALUES (5, 0, 8, 4200, 19440, 5); -- Coeurl Mask +1 (4200/19440)
INSERT INTO `guild_item_points` VALUES (5, 0, 8, 3600, 19440, 6); -- Ogre Gloves (3600/19440)
INSERT INTO `guild_item_points` VALUES (5, 0, 8, 4800, 19440, 6); -- Ogre Gloves +1 (4800/19440)
INSERT INTO `guild_item_points` VALUES (5, 0, 8, 4800, 20400, 7); -- Ogre Trousers (4800/20400)
INSERT INTO `guild_item_points` VALUES (5, 0, 8, 6000, 20400, 7); -- Ogre Trousers +1 (6000/20400)

-- Leathercraft / Veteran
INSERT INTO `guild_item_points` VALUES (5, 0, 9, 6492, 21120, 0); -- Bison Gamashes (6492/21120)
INSERT INTO `guild_item_points` VALUES (5, 0, 9, 7717, 21120, 0); -- Bison Gamashes +1 (7717/21120)
INSERT INTO `guild_item_points` VALUES (5, 0, 9, 6247, 21120, 1); -- Bison Kecks (6247/21120)
INSERT INTO `guild_item_points` VALUES (5, 0, 9, 7472, 21120, 1); -- Bison Kecks +1 (7472/21120)
INSERT INTO `guild_item_points` VALUES (5, 0, 9, 4800, 20400, 2); -- Cardinal Vest (4800/20400)
INSERT INTO `guild_item_points` VALUES (5, 0, 9, 6000, 20400, 2); -- Cardinal Vest +1 (6000/20400)
INSERT INTO `guild_item_points` VALUES (5, 0, 9, 4042, 19920, 3); -- Bison Wristbands (4042/19920)
INSERT INTO `guild_item_points` VALUES (5, 0, 9, 5267, 19920, 3); -- Bison Wristbands +1 (5267/19920)
INSERT INTO `guild_item_points` VALUES (5, 0, 9, 1080, 15120, 4); -- Tiger Mask (1080/15120)
INSERT INTO `guild_item_points` VALUES (5, 0, 9, 2280, 15120, 4); -- Tiger Mask +1 (2280/15120)
INSERT INTO `guild_item_points` VALUES (5, 0, 9, 6737, 21360, 5); -- Barone Cosciales (6737/21360)
INSERT INTO `guild_item_points` VALUES (5, 0, 9, 6737, 21360, 5); -- Barone Cosciales +1 (6737/21360)
INSERT INTO `guild_item_points` VALUES (5, 0, 9, 1080, 15120, 6); -- Tiger Mask (1080/15120)
INSERT INTO `guild_item_points` VALUES (5, 0, 9, 2280, 15120, 6); -- Tiger Mask +1 (2280/15120)
INSERT INTO `guild_item_points` VALUES (5, 0, 9, 2500, 18240, 7); -- Errant Pigaches (2500/18240)
INSERT INTO `guild_item_points` VALUES (5, 0, 9, 3750, 18240, 7); -- Errant Pigaches +1 (3750/18240)

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
