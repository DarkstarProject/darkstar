/*
MySQL Data Transfer
Source Host: localhost
Source Database: dspdb
Target Host: localhost
Target Database: dspdb
Date: 10/3/2015 5:02:26 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for accounts_banned
-- ----------------------------
CREATE TABLE `accounts_banned` (
  `accid` int(10) unsigned NOT NULL DEFAULT '0',
  `timebann` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `timeunbann` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `banncomment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`accid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
