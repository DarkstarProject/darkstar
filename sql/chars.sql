
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `chars`
-- ----------------------------
DROP TABLE IF EXISTS `chars`;
CREATE TABLE `chars` (
  `charid` int(10) unsigned NOT NULL,
  `accid` int(10) unsigned NOT NULL,
  `charname` varchar(15) NOT NULL,
  `pos_zone` tinyint(3) unsigned NOT NULL,
  `pos_prevzone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pos_rot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pos_x` float(7,3) NOT NULL DEFAULT '0.000',
  `pos_y` float(7,3) NOT NULL DEFAULT '0.000',
  `pos_z` float(7,3) NOT NULL DEFAULT '0.000',
  `boundary` smallint(5) unsigned NOT NULL DEFAULT '0',
  `home_zone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `home_rot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `home_x` float(7,3) NOT NULL DEFAULT '0.000',
  `home_y` float(7,3) NOT NULL DEFAULT '0.000',
  `home_z` float(7,3) NOT NULL DEFAULT '0.000',
  `nation` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `rankPoints` int(11) DEFAULT '0',
  `rankSandoria` tinyint(1) DEFAULT '1',
  `rankBastok` tinyint(1) DEFAULT '1',
  `rankWindurst` tinyint(1) DEFAULT '1',
  `missions` blob,
  `quests` blob,
  `keyitems` blob,
  `spells` blob,
  `zones` blob,
  `inventory` tinyint(3) DEFAULT NULL,
  `safe` tinyint(3) DEFAULT NULL,
  `storage` tinyint(3) DEFAULT NULL,
  `locker` tinyint(3) DEFAULT NULL,
  `satchel` tinyint(3) DEFAULT NULL,
  `sack` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`charid`),
  FULLTEXT KEY `charname` (`charname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
