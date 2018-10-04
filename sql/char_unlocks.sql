
DROP TABLE IF EXISTS `char_unlocks`;
CREATE TABLE `char_unlocks` (
  `charid` int(10) unsigned NOT NULL,
  `sandoria_supply` int(10) unsigned NOT NULL DEFAULT 0,
  `bastok_supply` int(10) unsigned NOT NULL DEFAULT 0,
  `windurst_supply` int(10) unsigned NOT NULL DEFAULT 0,
  `mog_locker` int(10) unsigned NOT NULL DEFAULT 0,
  `runic_portal` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `maw` int(10) unsigned NOT NULL DEFAULT 0,
  `past_sandoria_tp` int(10) unsigned NOT NULL DEFAULT 0,
  `past_bastok_tp` int(10) unsigned NOT NULL DEFAULT 0,
  `past_windurst_tp` int(10) unsigned NOT NULL DEFAULT 0,
  `homepoints` blob DEFAULT NULL,
  PRIMARY KEY (`charid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

