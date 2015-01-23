/*
MySQL Data Transfer
Source Host: 192.168.0.140
Source Database: dspdb
Target Host: 192.168.0.140
Target Database: dspdb
Date: 1/21/2015 1:06:39 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for char_recast
-- ----------------------------
CREATE TABLE `char_recast` (
  `charid` int(10) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `id` smallint(5) NOT NULL DEFAULT '0',
  `time` int(10) NOT NULL DEFAULT '0',
  `recast` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`charid`,`type`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
