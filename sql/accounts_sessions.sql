/*
MySQL Data Transfer
Source Host: localhost
Source Database: dspdb
Target Host: localhost
Target Database: dspdb
Date: 10/3/2015 5:02:49 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for accounts_sessions
-- ----------------------------
CREATE TABLE `accounts_sessions` (
  `accid` int(10) unsigned NOT NULL DEFAULT '0',
  `charid` int(10) unsigned NOT NULL DEFAULT '0',
  `targid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `linkshellid1` int(10) unsigned NOT NULL DEFAULT '0',
  `linkshellrank1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `linkshellid2` int(10) unsigned NOT NULL DEFAULT '0',
  `linkshellrank2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `session_key` binary(20) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `server_addr` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `server_port` smallint(5) unsigned NOT NULL DEFAULT '0',
  `client_addr` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `client_port` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charid`),
  UNIQUE KEY `accid` (`accid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `accounts_sessions` VALUES ('1012', '21844', '1024', '1', '2', '2', '2', '', '2501763008', '54230', '1651673412', '54090');
INSERT INTO `accounts_sessions` VALUES ('1030', '21876', '1024', '1', '2', '0', '0', '', '2501763008', '54230', '1236232678', '54090');

-- ----------------------------
-- Trigger structure for session_delete
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `session_delete` BEFORE DELETE ON `accounts_sessions` FOR EACH ROW BEGIN
    UPDATE `char_stats` SET zoning = 0 WHERE `charid` = OLD.charid;
END;;
DELIMITER ;
