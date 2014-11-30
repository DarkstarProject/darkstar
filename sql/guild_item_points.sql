/*
MySQL Data Transfer
Source Host: localhost
Source Database: dspdb
Target Host: localhost
Target Database: dspdb
Date: 29/11/2014 22:08:30
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for guild_item_points
-- ----------------------------
DROP TABLE IF EXISTS `guild_item_points`;
CREATE TABLE `guild_item_points` (
  `guildid` smallint(5) unsigned NOT NULL,
  `itemid` smallint(5) unsigned NOT NULL,
  `rank` smallint(1) unsigned NOT NULL,
  `points` int(10) unsigned NOT NULL DEFAULT '0',
  `max_points` int(10) unsigned NOT NULL DEFAULT '0',
  `pattern` smallint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------

-- ----------------
-- Woodworking
-- ----------------

-- Pattern A
INSERT INTO `guild_item_points` VALUES(2, 17095, 1, 105, 1680, 1); -- ash pole
INSERT INTO `guild_item_points` VALUES(2, 17122, 1, 120, 1680, 1); -- ash pole +1
INSERT INTO `guild_item_points` VALUES(2, 17153, 2, 134, 2080, 1); -- self bow
INSERT INTO `guild_item_points` VALUES(2, 17176, 2, 154, 2080, 1); -- self bow +1
INSERT INTO `guild_item_points` VALUES(2, 17051, 3, 266, 2720, 1); -- yew wand
INSERT INTO `guild_item_points` VALUES(2, 17140, 3, 414, 2720, 1); -- yew wand +1
INSERT INTO `guild_item_points` VALUES(2, 17217, 4, 471, 3520, 1); -- crossbow
INSERT INTO `guild_item_points` VALUES(2, 17225, 4, 471, 3520, 1); -- crossbow +1
INSERT INTO `guild_item_points` VALUES(2, 12987, 5, 1344, 5040, 1); -- ebony sabots
INSERT INTO `guild_item_points` VALUES(2, 13023, 5, 1400, 5040, 1); -- ebony sabots +1
INSERT INTO `guild_item_points` VALUES(2, 17355, 6, 1200, 5200, 1); -- rose harp
INSERT INTO `guild_item_points` VALUES(2, 17376, 6, 3000, 5200, 1); -- rose harp +1
INSERT INTO `guild_item_points` VALUES(2, 4, 7, 1278, 5120, 1); -- coffer
INSERT INTO `guild_item_points` VALUES(2, 56, 8, 4900, 6800, 1); -- commode
-- TODO: find retail info for the following:
-- INSERT INTO `guild_item_points` VALUES(2, 16849, 9, 0, 0, 1); -- cermet lance
-- INSERT INTO `guild_item_points` VALUES(2, 16840, 10, 0, 0, 1); -- ox tongue
-- INSERT INTO `guild_item_points` VALUES(2, 16894, 10, 0, 0, 1); -- ox tongue +

-- Pattern B
INSERT INTO `guild_item_points` VALUES(2, 17049, 1, 13, 1200, 2); -- maple wand
INSERT INTO `guild_item_points` VALUES(2, 17087, 1, 13, 1200, 2); -- maple wand +1
INSERT INTO `guild_item_points` VALUES(2, 12985, 2, 325, 2800, 2); -- holly clogs
INSERT INTO `guild_item_points` VALUES(2, 12991, 2, 406, 2800, 2); -- holly clogs +1
INSERT INTO `guild_item_points` VALUES(2, 17353, 3, 12, 1680, 2); -- maple harp
INSERT INTO `guild_item_points` VALUES(2, 17373, 3, 14, 1680, 2); -- maple harp +1
INSERT INTO `guild_item_points` VALUES(2, 17155, 4, 1250, 4880, 2); -- composite bow
INSERT INTO `guild_item_points` VALUES(2, 17179, 4, 1300, 4880, 2); -- composite bow +1
INSERT INTO `guild_item_points` VALUES(2, 17091, 5, 1218, 4960, 2); -- oak staff
INSERT INTO `guild_item_points` VALUES(2, 17127, 5, 1798, 4960, 2); -- oak staff +1
INSERT INTO `guild_item_points` VALUES(2, 17030, 6, 1102, 4880, 2); -- great club
INSERT INTO `guild_item_points` VALUES(2, 17408, 6, 1160, 4880, 2); -- great club +1
INSERT INTO `guild_item_points` VALUES(2, 17157, 7, 3655, 6480, 2); -- rapid bow
INSERT INTO `guild_item_points` VALUES(2, 17189, 7, 3762, 6480, 2); -- rapid bow +1
INSERT INTO `guild_item_points` VALUES(2, 12295, 8, 2817, 6160, 2); -- round shield
INSERT INTO `guild_item_points` VALUES(2, 12352, 8, 2990, 6160, 2); -- round shield +1
-- TODO: find retail info for the following:
-- INSERT INTO `guild_item_points` VALUES(2, 17441, 9, 120, 0, 2); -- eremite's wand
-- INSERT INTO `guild_item_points` VALUES(2, 17442, 9, 120, 0, 2); -- eremite's wand +1
-- INSERT INTO `guild_item_points` VALUES(2, 17205, 10, 120, 0, 2); -- gendawa
-- INSERT INTO `guild_item_points` VALUES(2, 17206, 10, 120, 0, 2); -- gendawa +1

-- Pattern C
INSERT INTO `guild_item_points` VALUES(2, 22, 1, 94, 1600, 3); -- workbench
INSERT INTO `guild_item_points` VALUES(2, 12984, 2, 31, 1520, 3); -- ash clogs
INSERT INTO `guild_item_points` VALUES(2, 12983, 2, 39, 1520, 3); -- ash clogs +1
INSERT INTO `guild_item_points` VALUES(2, 92, 3, 246, 2720, 3); -- tarutaru stool
INSERT INTO `guild_item_points` VALUES(2, 17162, 4, 3116, 6240, 3); -- great bow
INSERT INTO `guild_item_points` VALUES(2, 17180, 4, 3496, 6240, 3); -- great bow +1
INSERT INTO `guild_item_points` VALUES(2, 16845, 5, 1535, 5280, 3); -- lance
INSERT INTO `guild_item_points` VALUES(2, 16876, 5, 1561, 5280, 3); -- lance +1
INSERT INTO `guild_item_points` VALUES(2, 16847, 6, 2580, 6000, 3); -- mythril lance
INSERT INTO `guild_item_points` VALUES(2, 16877, 6, 2640, 6000, 3); -- mythril lance +1
INSERT INTO `guild_item_points` VALUES(2, 17054, 7, 1912, 5680, 3); -- ebony wand
INSERT INTO `guild_item_points` VALUES(2, 17427, 7, 3037, 5680, 3); -- ebony wand +1
INSERT INTO `guild_item_points` VALUES(2, 95, 8, 2500, 6000, 3); -- water barrel
-- TODO: find retail info for the following:
-- INSERT INTO `guild_item_points` VALUES(2, 17101, 9, 0, 0, 3); -- mythic pole
-- INSERT INTO `guild_item_points` VALUES(2, 17526, 9, 0, 0, 3); -- mythic pole +1
-- INSERT INTO `guild_item_points` VALUES(2, 18142, 10, 0, 0, 3); -- shigeto bow
-- INSERT INTO `guild_item_points` VALUES(2, 18143, 10, 0, 0, 3); -- shigeto bow +1

-- Pattern D
INSERT INTO `guild_item_points` VALUES(2, 17088, 1, 16, 1200, 4); -- ash staff
INSERT INTO `guild_item_points` VALUES(2, 17123, 1, 24, 1200, 4); -- ash staff +1
INSERT INTO `guild_item_points` VALUES(2, 23, 2, 158, 2160, 4); -- maple table
INSERT INTO `guild_item_points` VALUES(2, 17354, 3, 500, 3440, 4); -- harp
INSERT INTO `guild_item_points` VALUES(2, 17374, 3, 600, 3440, 4); -- harp +1
INSERT INTO `guild_item_points` VALUES(2, 17424, 4, 300, 3040, 4); -- spiked club
INSERT INTO `guild_item_points` VALUES(2, 17425, 4, 330, 3040, 4); -- spiked club +1
INSERT INTO `guild_item_points` VALUES(2, 17218, 5, 1710, 5440, 4); -- zamburak 
INSERT INTO `guild_item_points` VALUES(2, 17229, 5, 1748, 5440, 4); -- zamburak +1
INSERT INTO `guild_item_points` VALUES(2, 17219, 6, 2550, 6000, 4); -- arbalest
INSERT INTO `guild_item_points` VALUES(2, 17226, 6, 2625, 6000, 4); -- arbalest +1
INSERT INTO `guild_item_points` VALUES(2, 17561, 7, 4375, 6640, 4); -- revenging staff
INSERT INTO `guild_item_points` VALUES(2, 17561, 7, 4500, 6640, 4); -- revenging staff +1 -- TODO: find retail info
INSERT INTO `guild_item_points` VALUES(2, 59, 8, 4594, 6720, 4); -- chiffonier
-- TODO: find retail info for the following:
-- INSERT INTO `guild_item_points` VALUES(2, 17236, 9, 0, 0, 4); -- leo crossbow
-- INSERT INTO `guild_item_points` VALUES(2, 17237, 9, 0, 0, 4); -- leo crossbow +1
-- INSERT INTO `guild_item_points` VALUES(2, 17102, 10, 0, 0, 4); -- eight-sided pole
-- INSERT INTO `guild_item_points` VALUES(2, 17568, 10, 0, 0, 4); -- eight-sided pole +1

-- Pattern E
INSERT INTO `guild_item_points` VALUES(2, 17024, 1, 18, 1200, 5); -- ash club
INSERT INTO `guild_item_points` VALUES(2, 17137, 1, 26, 1200, 5); -- ash club +1
INSERT INTO `guild_item_points` VALUES(2, 17050, 2, 74, 1760, 5); -- willow wand
INSERT INTO `guild_item_points` VALUES(2, 17138, 2, 119, 1760, 5); -- willow wand +1
INSERT INTO `guild_item_points` VALUES(2, 16834, 3, 400, 3200, 5); -- brass spear
INSERT INTO `guild_item_points` VALUES(2, 16864, 3, 410, 3200, 5); -- brass spear +1
INSERT INTO `guild_item_points` VALUES(2, 12986, 4, 612, 3840, 5); -- chestnut sabots
INSERT INTO `guild_item_points` VALUES(2, 13022, 4, 646, 3840, 5); -- chestnut sabots +1
INSERT INTO `guild_item_points` VALUES(2, 17027, 5, 1248, 4960, 5); -- oak cudgel
INSERT INTO `guild_item_points` VALUES(2, 17142, 5, 1768, 4960, 5); -- oak cudgel +1
INSERT INTO `guild_item_points` VALUES(2, 16871, 6, 4070, 6560, 5); -- kamayari
INSERT INTO `guild_item_points` VALUES(2, 16872, 6, 4162, 6560, 5); -- kamayari +1
INSERT INTO `guild_item_points` VALUES(2, 51, 7, 192, 3200, 5); -- chest
INSERT INTO `guild_item_points` VALUES(2, 30, 8, 7010, 7120, 5); -- bureau
-- TODO: find retail info for the following:
-- INSERT INTO `guild_item_points` VALUES(1, 17221, 9, 0, 0, 5); -- repeating crossbow
-- INSERT INTO `guild_item_points` VALUES(1, 139, 10, 0, 0, 5); -- star globe

-- Pattern F
INSERT INTO `guild_item_points` VALUES(2, 16832, 1, 27, 1280, 6); -- harpoon
INSERT INTO `guild_item_points` VALUES(2, 16862, 1, 30, 1280, 6); -- harpoon +1
INSERT INTO `guild_item_points` VALUES(2, 17216, 2, 45, 1600, 6); -- light crossbow
INSERT INTO `guild_item_points` VALUES(2, 17228, 2, 53, 1600, 6); -- light crossbow +1
INSERT INTO `guild_item_points` VALUES(2, 12291, 3, 363, 3120, 6); -- elm shield
INSERT INTO `guild_item_points` VALUES(2, 12319, 3, 457, 3120, 6); -- elm shield +1
INSERT INTO `guild_item_points` VALUES(2, 17052, 4, 714, 4080, 6); -- chestnut wand
INSERT INTO `guild_item_points` VALUES(2, 17141, 4, 1134, 4080, 6); -- solid wand
INSERT INTO `guild_item_points` VALUES(2, 16836, 5, 1350, 5040, 6); -- halberd
INSERT INTO `guild_item_points` VALUES(2, 16866, 5, 1400, 5040, 6); -- halberd +1
INSERT INTO `guild_item_points` VALUES(2, 17164, 6, 4080, 6560, 6); -- war bow
INSERT INTO `guild_item_points` VALUES(2, 17173, 6, 4160, 6560, 6); -- war bow +1
INSERT INTO `guild_item_points` VALUES(2, 17092, 7, 2310, 5920, 6); -- mahogany staff
INSERT INTO `guild_item_points` VALUES(2, 17520, 7, 2310, 5920, 6); -- heavy staff
INSERT INTO `guild_item_points` VALUES(2, 104, 8, 428, 3920, 6); -- tarutaru folding screen
-- TODO: find retail info for the following:
-- INSERT INTO `guild_item_points` VALUES(1, 12364, 9, 0, 0, 6); -- nymph shield
-- INSERT INTO `guild_item_points` VALUES(1, 12365, 9, 0, 0, 6); -- nymph shield +1
-- INSERT INTO `guild_item_points` VALUES(1, 17364, 10, 0, 0, 6); -- cythara anglica
-- INSERT INTO `guild_item_points` VALUES(1, 17837, 10, 0, 0, 6); -- cythara anglica +1

-- Pattern G
INSERT INTO `guild_item_points` VALUES(2, 12289, 1, 30, 1280, 7); -- lauan shield
INSERT INTO `guild_item_points` VALUES(2, 12333, 1, 38, 1280, 7); -- lauan shield +1
INSERT INTO `guild_item_points` VALUES(2, 17096, 2, 423, 3120, 7); -- holly pole
INSERT INTO `guild_item_points` VALUES(2, 17124, 2, 435, 3120, 7); -- holly pole +1
INSERT INTO `guild_item_points` VALUES(2, 17090, 3, 601, 3680, 7); -- elm staff
INSERT INTO `guild_item_points` VALUES(2, 17126, 3, 887, 3680, 7); -- elm staff +1
INSERT INTO `guild_item_points` VALUES(2, 12292, 4, 830, 4320, 7); -- mahogany shield
INSERT INTO `guild_item_points` VALUES(2, 12334, 4, 1043, 4320, 7); -- strong shield
INSERT INTO `guild_item_points` VALUES(2, 17053, 5, 1360, 5120, 7); -- rose wand
INSERT INTO `guild_item_points` VALUES(2, 17143, 5, 2160, 5120, 7); -- rose wand +1
INSERT INTO `guild_item_points` VALUES(2, 17098, 6, 1560, 5360, 7); -- oak pole
INSERT INTO `guild_item_points` VALUES(2, 17120, 6, 1620, 5360, 7); -- oak pole +1
INSERT INTO `guild_item_points` VALUES(2, 17350, 7, 1200, 5040, 7); -- angel's flute
INSERT INTO `guild_item_points` VALUES(2, 17378, 7, 1280, 5040, 7); -- angel flute +1
INSERT INTO `guild_item_points` VALUES(2, 17100, 8, 4350, 1280, 7); -- ebony pole
INSERT INTO `guild_item_points` VALUES(2, 17525, 8, 4495, 1280, 7); -- ebony pole +1
-- TODO: find retail info for the following:
-- INSERT INTO `guild_item_points` VALUES(1, 16890, 9, 0, 0, 7); -- obelisk lance
-- INSERT INTO `guild_item_points` VALUES(1, 16891, 9, 0, 0, 7); -- obelisk lance +1
-- INSERT INTO `guild_item_points` VALUES(1, 76, 10, 0, 0, 7); -- royal bookshelf

-- Pattern H
INSERT INTO `guild_item_points` VALUES(2, 17345, 1, 12, 1120, 8); -- flute
INSERT INTO `guild_item_points` VALUES(2, 12290, 2, 120, 2000, 8); -- maple shield
INSERT INTO `guild_item_points` VALUES(2, 12330, 2, 152, 2000, 8); -- maple shield =1
INSERT INTO `guild_item_points` VALUES(2, 17025, 3, 290, 2880, 8); -- chestnut club
INSERT INTO `guild_item_points` VALUES(2, 17139, 3, 447, 2880, 8); -- solid club
INSERT INTO `guild_item_points` VALUES(2, 16835, 4, 840, 4320, 8); -- spear
INSERT INTO `guild_item_points` VALUES(2, 16865, 4, 870, 4320, 8); -- spear +1
INSERT INTO `guild_item_points` VALUES(2, 12293, 5, 1950, 5600, 8); -- oak shield
INSERT INTO `guild_item_points` VALUES(2, 12331, 5, 2450, 5600, 8); -- oak shield +1
INSERT INTO `guild_item_points` VALUES(2, 21, 6, 158, 2880, 8); -- desk
INSERT INTO `guild_item_points` VALUES(2, 17240, 7, 3300, 6320, 8); -- lightning bow
INSERT INTO `guild_item_points` VALUES(2, 17241, 7, 4125, 6320, 8); -- lightning bow +1
INSERT INTO `guild_item_points` VALUES(2, 17357, 8, 2587, 6080, 8); -- ebony harp
INSERT INTO `guild_item_points` VALUES(2, 17833, 8, 2700, 6080, 8); -- ebony harp +1
INSERT INTO `guild_item_points` VALUES(2, 17848, 8, 2813, 6080, 8); -- ebony harp +2 -- TODO: find retail info
-- TODO: find retail info for the following:
-- INSERT INTO `guild_item_points` VALUES(1, itemid, 9, 0, 0, 8); -- cabinet
-- INSERT INTO `guild_item_points` VALUES(1, itemid, 10, 0, 0, 8); -- bookshelf

-- ----------------
-- Blacksmithing
-- ----------------
-- insufficient information

-- ----------------
-- Goldsmithing
-- ----------------
-- insufficient information


-- ----------------
-- Clothcraft
-- ----------------
-- half the info available

-- ----------------
-- Leathercraft
-- ----------------
-- insufficient info available

-- ----------------
-- Bonecraft
-- ----------------
-- insufficient info available

-- ----------------
-- Alchemy
-- ----------------
-- insufficient info available

-- ----------------
-- Cooking
-- ----------------
-- next on muh list

-- ----------------
-- Fishing
-- ----------------
-- next on muh list