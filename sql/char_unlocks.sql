
DROP TABLE IF EXISTS `char_unlocks`;
CREATE TABLE `char_unlocks` (
  `charid` int(10) unsigned NOT NULL,
  `outpost_sandy` int(10) unsigned NOT NULL DEFAULT 0,
  `outpost_bastok` int(10) unsigned NOT NULL DEFAULT 0,
  `outpost_windy` int(10) unsigned NOT NULL DEFAULT 0,
  `mog_locker` int(10) unsigned NOT NULL DEFAULT 0,
  `runic_portal` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `maw` int(10) unsigned NOT NULL DEFAULT 0,
  `campaign_sandy` int(10) unsigned NOT NULL DEFAULT 0,
  `campaign_bastok` int(10) unsigned NOT NULL DEFAULT 0,
  `campaign_windy` int(10) unsigned NOT NULL DEFAULT 0,
  `homepoints` blob DEFAULT NULL,
  `survivals` blob DEFAULT NULL,
  PRIMARY KEY (`charid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

