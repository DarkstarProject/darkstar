/*
MySQL Data Transfer
Source Host: localhost
Source Database: dspdb
Target Host: localhost
Target Database: dspdb
Date: 12/9/2012 10:37:16 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for nm_spawn_points
-- ----------------------------
CREATE TABLE `nm_spawn_points` (
  `mobid` int(10) NOT NULL,
  `pos` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pos_x` float(7,3) NOT NULL DEFAULT '0.000',
  `pos_y` float(7,3) NOT NULL DEFAULT '0.000',
  `pos_z` float(7,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`mobid`,`pos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `nm_spawn_points` VALUES ('17215888', '0', '-364.189', '30.000', '-442.720');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '1', '-292.232', '21.428', '-413.230');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '2', '-270.019', '20.612', '-389.970');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '3', '-303.720', '26.918', '-320.710');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '4', '-307.972', '27.455', '-367.421');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '5', '-283.056', '20.000', '-398.952');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '6', '-259.746', '22.722', '-412.237');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '7', '-357.308', '32.336', '-422.769');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '8', '-290.946', '21.210', '-321.456');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '9', '-275.636', '22.476', '-420.625');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '10', '-289.261', '21.320', '-328.841');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '11', '-321.379', '29.821', '-322.494');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '12', '-260.427', '22.593', '-405.967');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '13', '-360.824', '30.114', '-454.615');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '14', '-297.822', '23.327', '-318.877');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '15', '-288.541', '21.439', '-330.873');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '16', '-264.865', '20.765', '-336.617');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '17', '-332.532', '31.063', '-381.882');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '18', '-339.668', '28.619', '-388.642');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '19', '-321.228', '30.000', '-382.849');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '20', '-284.635', '20.810', '-386.643');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '21', '-333.047', '30.800', '-325.419');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '22', '-302.158', '27.208', '-350.053');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '23', '-315.889', '29.358', '-318.021');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '24', '-278.573', '20.138', '-339.390');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '25', '-293.311', '21.933', '-318.758');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '26', '-286.319', '20.645', '-391.222');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '27', '-322.615', '32.348', '-417.432');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '28', '-339.649', '32.626', '-336.988');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '29', '-336.543', '31.582', '-341.736');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '30', '-264.601', '22.994', '-419.366');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '31', '-278.841', '20.000', '-362.440');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '32', '-280.307', '20.035', '-382.155');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '33', '-368.938', '30.712', '-429.955');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '34', '-332.177', '30.313', '-345.107');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '35', '-330.438', '30.000', '-327.495');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '36', '-353.660', '29.043', '-449.413');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '37', '-323.998', '30.032', '-404.350');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '38', '-268.856', '21.258', '-398.745');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '39', '-264.791', '21.973', '-374.422');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '40', '-320.521', '29.886', '-320.865');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '41', '-355.270', '28.576', '-463.004');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '42', '-350.338', '32.823', '-421.285');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '43', '-263.350', '20.661', '-331.257');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '44', '-330.561', '30.093', '-399.022');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '45', '-273.274', '21.144', '-347.048');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '46', '-300.770', '26.288', '-344.735');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '47', '-318.258', '29.993', '-347.883');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '48', '-309.062', '28.860', '-321.399');
INSERT INTO `nm_spawn_points` VALUES ('17215888', '49', '-317.119', '30.000', '-322.596');
