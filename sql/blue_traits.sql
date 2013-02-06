/*
MySQL Data Transfer
Source Host: localhost
Source Database: dspdb
Target Host: localhost
Target Database: dspdb
Date: 2/5/2013 6:10:48 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for blue_traits
-- ----------------------------
DROP TABLE IF EXISTS `blue_traits`;
CREATE TABLE `blue_traits` (
  `trait_category` smallint(2) NOT NULL,
  `trait_points_needed` smallint(2) NOT NULL,
  `modifier` smallint(5) NOT NULL,
  `value` smallint(5) NOT NULL,
  PRIMARY KEY (`trait_category`,`trait_points_needed`,`modifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
