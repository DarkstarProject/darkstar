/*
MySQL Data Transfer
Source Host: localhost
Source Database: dspdb
Target Host: localhost
Target Database: dspdb
Date: 10/3/2015 5:02:39 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for accounts_parties
-- ----------------------------
CREATE TABLE `accounts_parties` (
  `charid` int(10) unsigned NOT NULL DEFAULT '0',
  `partyid` int(10) unsigned NOT NULL DEFAULT '0',
  `partyflag` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allianceid` int(10) unsigned NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`charid`),
  CONSTRAINT `accounts_parties_ibfk_1` FOREIGN KEY (`charid`) REFERENCES `accounts_sessions` (`charid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `accounts_parties` VALUES ('21844', '21844', '4', '0', '2015-10-02 13:12:55');
