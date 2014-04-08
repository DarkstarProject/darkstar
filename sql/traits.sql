/*
MySQL Data Transfer
Source Host: localhost
Source Database: dspdb
Target Host: localhost
Target Database: dspdb
Date: 1/3/2013 7:06:50 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for traits
-- ----------------------------
DROP TABLE IF EXISTS `traits`;
CREATE TABLE `traits` (
  `traitid` tinyint(3) unsigned NOT NULL,
  `name` text NOT NULL,
  `job` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '99',
  `rank` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `modifier` smallint(5) unsigned NOT NULL DEFAULT '0',
  `value` smallint(5) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records
-- ----------------------------
INSERT INTO `traits` VALUES ('1','accuracy bonus','11','10','1','25','10');
INSERT INTO `traits` VALUES ('1','accuracy bonus','11','10','1','26','10');
INSERT INTO `traits` VALUES ('1','accuracy bonus','11','30','2','25','22');
INSERT INTO `traits` VALUES ('1','accuracy bonus','11','30','2','26','22');
INSERT INTO `traits` VALUES ('1','accuracy bonus','11','50','3','25','35');
INSERT INTO `traits` VALUES ('1','accuracy bonus','11','50','3','26','35');
INSERT INTO `traits` VALUES ('1','accuracy bonus','11','70','4','25','48');
INSERT INTO `traits` VALUES ('1','accuracy bonus','11','70','4','26','48');
INSERT INTO `traits` VALUES ('1','accuracy bonus','14','30','1','25','10');
INSERT INTO `traits` VALUES ('1','accuracy bonus','14','30','1','26','10');
INSERT INTO `traits` VALUES ('1','accuracy bonus','14','50','2','25','22');
INSERT INTO `traits` VALUES ('1','accuracy bonus','14','50','2','26','22');
INSERT INTO `traits` VALUES ('1','accuracy bonus','19','30','1','25','10');
INSERT INTO `traits` VALUES ('1','accuracy bonus','19','30','1','26','10');
INSERT INTO `traits` VALUES ('1','accuracy bonus','19','60','2','25','22');
INSERT INTO `traits` VALUES ('1','accuracy bonus','19','60','2','26','22');
INSERT INTO `traits` VALUES ('2','evasion bonus','6','10','1','69','10');
INSERT INTO `traits` VALUES ('2','evasion bonus','6','30','2','69','22');
INSERT INTO `traits` VALUES ('2','evasion bonus','6','50','3','69','35');
INSERT INTO `traits` VALUES ('2','evasion bonus','6','70','4','69','48');
INSERT INTO `traits` VALUES ('2','evasion bonus','18','20','1','69','10');
INSERT INTO `traits` VALUES ('2','evasion bonus','18','40','1','69','22');
INSERT INTO `traits` VALUES ('2','evasion bonus','18','60','1','69','35');
INSERT INTO `traits` VALUES ('2','evasion bonus','19','15','1','69','10');
INSERT INTO `traits` VALUES ('2','evasion bonus','19','45','2','69','22');
INSERT INTO `traits` VALUES ('2','evasion bonus','19','75','3','69','35');
INSERT INTO `traits` VALUES ('3','attack bonus','1','30','1','23','10');
INSERT INTO `traits` VALUES ('3','attack bonus','1','30','1','24','10');
INSERT INTO `traits` VALUES ('3','attack bonus','8','10','1','23','10');
INSERT INTO `traits` VALUES ('3','attack bonus','8','10','1','24','10');
INSERT INTO `traits` VALUES ('3','attack bonus','8','30','2','23','22');
INSERT INTO `traits` VALUES ('3','attack bonus','8','30','2','24','22');
INSERT INTO `traits` VALUES ('3','attack bonus','8','50','3','23','35');
INSERT INTO `traits` VALUES ('3','attack bonus','8','50','3','24','35');
INSERT INTO `traits` VALUES ('3','attack bonus','8','70','4','23','48');
INSERT INTO `traits` VALUES ('3','attack bonus','8','70','4','24','48');
INSERT INTO `traits` VALUES ('3','attack bonus','14','10','1','23','10');
INSERT INTO `traits` VALUES ('3','attack bonus','14','10','1','24','10');
INSERT INTO `traits` VALUES ('4','defense bonus','1','10','1','1','10');
INSERT INTO `traits` VALUES ('4','defense bonus','7','10','1','1','10');
INSERT INTO `traits` VALUES ('4','defense bonus','7','30','2','1','22');
INSERT INTO `traits` VALUES ('4','defense bonus','7','50','3','1','35');
INSERT INTO `traits` VALUES ('4','defense bonus','7','70','4','1','48');
INSERT INTO `traits` VALUES ('5','magic atk. bonus','4','10','1','28','20');
INSERT INTO `traits` VALUES ('5','magic atk. bonus','4','30','2','28','24');
INSERT INTO `traits` VALUES ('5','magic atk. bonus','4','50','3','28','28');
INSERT INTO `traits` VALUES ('5','magic atk. bonus','4','70','4','28','32');
INSERT INTO `traits` VALUES ('5','magic atk. bonus','5','20','1','28','20');
INSERT INTO `traits` VALUES ('5','magic atk. bonus','5','40','2','28','24');
INSERT INTO `traits` VALUES ('6','magic def. bonus','3','10','1','29','10');
INSERT INTO `traits` VALUES ('6','magic def. bonus','3','30','2','29','12');
INSERT INTO `traits` VALUES ('6','magic def. bonus','3','50','3','29','14');
INSERT INTO `traits` VALUES ('6','magic def. bonus','3','70','4','29','16');
INSERT INTO `traits` VALUES ('6','magic def. bonus','5','25','1','29','10');
INSERT INTO `traits` VALUES ('6','magic def. bonus','5','45','2','29','12');
INSERT INTO `traits` VALUES ('7','max hp boost','2','15','1','2','30');
INSERT INTO `traits` VALUES ('7','max hp boost','2','35','2','2','60');
INSERT INTO `traits` VALUES ('7','max hp boost','2','55','3','2','120');
INSERT INTO `traits` VALUES ('7','max hp boost','2','70','4','2','180');
INSERT INTO `traits` VALUES ('8','max mp boost','15','10','1','5','10');
INSERT INTO `traits` VALUES ('8','max mp boost','15','30','2','5','20');
INSERT INTO `traits` VALUES ('8','max mp boost','15','50','3','5','40');
INSERT INTO `traits` VALUES ('8','max mp boost','15','70','4','5','60');
INSERT INTO `traits` VALUES ('8','max mp boost','20','30','1','5','10');
INSERT INTO `traits` VALUES ('9','auto regen','3','25','1','370','1');
INSERT INTO `traits` VALUES ('10','auto refresh','7','35','1','369','1');
INSERT INTO `traits` VALUES ('10','auto refresh','15','25','1','369','1');
INSERT INTO `traits` VALUES ('10','auto refresh','15','90','1','369','2');
INSERT INTO `traits` VALUES ('11','rapid shot','11','15','1','359','10');
INSERT INTO `traits` VALUES ('11','rapid shot','17','15','1','359','10');
INSERT INTO `traits` VALUES ('12','fast cast','5','15','1','170','10');
INSERT INTO `traits` VALUES ('12','fast cast','5','35','2','170','15');
INSERT INTO `traits` VALUES ('12','fast cast','5','55','3','170','20');
INSERT INTO `traits` VALUES ('13','conserve mp','4','20','1','296','25');
INSERT INTO `traits` VALUES ('13','conserve mp','20','25','1','296','25');
INSERT INTO `traits` VALUES ('14','store tp','12','10','1','73','10');
INSERT INTO `traits` VALUES ('14','store tp','12','30','2','73','15');
INSERT INTO `traits` VALUES ('14','store tp','12','50','3','73','20');
INSERT INTO `traits` VALUES ('14','store tp','12','70','4','73','25');
INSERT INTO `traits` VALUES ('15','double attack','1','25','1','288','10');
INSERT INTO `traits` VALUES ('16','triple attack','6','55','1','302','5');
INSERT INTO `traits` VALUES ('17','counter','2','10','1','291','10');
INSERT INTO `traits` VALUES ('18','dual wield','6','83','1','259','10');
INSERT INTO `traits` VALUES ('18','dual wield','13','10','1','259','10');
INSERT INTO `traits` VALUES ('18','dual wield','13','25','2','259','15');
INSERT INTO `traits` VALUES ('18','dual wield','13','45','3','259','25');
INSERT INTO `traits` VALUES ('18','dual wield','13','65','4','259','30');
INSERT INTO `traits` VALUES ('18','dual wield','13','85','5','259','35');
INSERT INTO `traits` VALUES ('18','dual wield','19','20','1','259','10');
INSERT INTO `traits` VALUES ('18','dual wield','19','40','2','259','15');
INSERT INTO `traits` VALUES ('18','dual wield','19','60','3','259','25');
INSERT INTO `traits` VALUES ('18','dual wield','19','80','4','259','30');
INSERT INTO `traits` VALUES ('19','treasure hunter','6','15','1','303','1');
INSERT INTO `traits` VALUES ('20','gilfinder','6','5','1','0','0');
INSERT INTO `traits` VALUES ('21','alertness','11','5','1','0','0');
INSERT INTO `traits` VALUES ('22','stealth','13','5','1','358','3');
INSERT INTO `traits` VALUES ('23','martial arts','2','1','1','173','80');
INSERT INTO `traits` VALUES ('23','martial arts','2','16','2','173','100');
INSERT INTO `traits` VALUES ('23','martial arts','2','31','3','173','120');
INSERT INTO `traits` VALUES ('23','martial arts','2','46','4','173','140');
INSERT INTO `traits` VALUES ('23','martial arts','2','61','5','173','160');
INSERT INTO `traits` VALUES ('23','martial arts','2','75','6','173','180');
INSERT INTO `traits` VALUES ('23','martial arts','18','25','1','173','80');
INSERT INTO `traits` VALUES ('23','martial arts','18','50','2','173','100');
INSERT INTO `traits` VALUES ('23','martial arts','18','75','3','173','120');
INSERT INTO `traits` VALUES ('24','clear mind','3','20','1','71','3');
INSERT INTO `traits` VALUES ('24','clear mind','3','35','2','71','6');
INSERT INTO `traits` VALUES ('24','clear mind','3','50','3','71','9');
INSERT INTO `traits` VALUES ('24','clear mind','3','50','3','295','1');
INSERT INTO `traits` VALUES ('24','clear mind','3','65','4','71','12');
INSERT INTO `traits` VALUES ('24','clear mind','4','15','1','71','3');
INSERT INTO `traits` VALUES ('24','clear mind','4','30','2','71','6');
INSERT INTO `traits` VALUES ('24','clear mind','4','45','3','71','9');
INSERT INTO `traits` VALUES ('24','clear mind','4','45','3','295','1');
INSERT INTO `traits` VALUES ('24','clear mind','4','60','4','71','12');
INSERT INTO `traits` VALUES ('24','clear mind','4','75','5','71','15');
INSERT INTO `traits` VALUES ('24','clear mind','4','75','5','295','2');
INSERT INTO `traits` VALUES ('24','clear mind','5','31','1','71','3');
INSERT INTO `traits` VALUES ('24','clear mind','5','53','2','71','6');
INSERT INTO `traits` VALUES ('24','clear mind','5','75','3','71','9');
INSERT INTO `traits` VALUES ('24','clear mind','5','75','3','295','1');
INSERT INTO `traits` VALUES ('24','clear mind','15','15','1','71','3');
INSERT INTO `traits` VALUES ('24','clear mind','15','30','2','71','6');
INSERT INTO `traits` VALUES ('24','clear mind','15','45','3','71','9');
INSERT INTO `traits` VALUES ('24','clear mind','15','45','3','295','1');
INSERT INTO `traits` VALUES ('24','clear mind','15','60','4','71','12');
INSERT INTO `traits` VALUES ('24','clear mind','15','70','5','71','15');
INSERT INTO `traits` VALUES ('24','clear mind','15','70','5','295','2');
INSERT INTO `traits` VALUES ('24','clear mind','20','20','1','71','3');
INSERT INTO `traits` VALUES ('24','clear mind','20','35','2','71','6');
INSERT INTO `traits` VALUES ('24','clear mind','20','50','3','71','9');
INSERT INTO `traits` VALUES ('24','clear mind','20','50','3','295','1');
INSERT INTO `traits` VALUES ('24','clear mind','20','65','4','71','12');
INSERT INTO `traits` VALUES ('25','shield mastery','7','25','1','0','0');
INSERT INTO `traits` VALUES ('25','shield mastery','7','50','2','0','0');
INSERT INTO `traits` VALUES ('25','shield mastery','7','75','3','0','0');
INSERT INTO `traits` VALUES ('32','beast killer','9','70','1','230','8');
INSERT INTO `traits` VALUES ('33','plantoid killer','9','60','1','229','8');
INSERT INTO `traits` VALUES ('34','vermin killer','9','10','1','224','8');
INSERT INTO `traits` VALUES ('35','lizard killer','9','40','1','227','8');
INSERT INTO `traits` VALUES ('36','bird killer','9','20','1','225','8');
INSERT INTO `traits` VALUES ('37','amorph killer','9','30','1','226','8');
INSERT INTO `traits` VALUES ('38','aquan killer','9','50','1','228','8');
INSERT INTO `traits` VALUES ('39','undead killer','7','5','1','231','8');
INSERT INTO `traits` VALUES ('41','arcana killer','8','25','1','232','8');
INSERT INTO `traits` VALUES ('42','demon killer','12','40','1','234','8');
INSERT INTO `traits` VALUES ('43','dragon killer','14','25','1','233','8');
INSERT INTO `traits` VALUES ('48','resist sleep','7','20','1','240','2');
INSERT INTO `traits` VALUES ('48','resist sleep','7','40','2','240','3');
INSERT INTO `traits` VALUES ('48','resist sleep','7','60','3','240','5');
INSERT INTO `traits` VALUES ('49','resist poison','11','20','1','241','2');
INSERT INTO `traits` VALUES ('49','resist poison','11','40','2','241','3');
INSERT INTO `traits` VALUES ('49','resist poison','11','60','3','241','5');
INSERT INTO `traits` VALUES ('50','resist paralyze','8','20','1','242','2');
INSERT INTO `traits` VALUES ('50','resist paralyze','8','40','2','242','3');
INSERT INTO `traits` VALUES ('50','resist paralyze','8','60','3','242','5');
INSERT INTO `traits` VALUES ('50','resist paralyze','8','75','4','242','6');
INSERT INTO `traits` VALUES ('50','resist paralyze','17','5','1','242','2');
INSERT INTO `traits` VALUES ('51','resist blind','12','5','1','243','2');
INSERT INTO `traits` VALUES ('51','resist blind','12','25','2','243','3');
INSERT INTO `traits` VALUES ('51','resist blind','12','45','3','243','5');
INSERT INTO `traits` VALUES ('51','resist blind','12','65','4','243','6');
INSERT INTO `traits` VALUES ('52','resist silence','10','5','1','244','2');
INSERT INTO `traits` VALUES ('52','resist silence','10','25','2','244','3');
INSERT INTO `traits` VALUES ('52','resist silence','10','45','3','244','5');
INSERT INTO `traits` VALUES ('52','resist silence','10','65','4','244','6');
INSERT INTO `traits` VALUES ('52','resist silence','20','10','1','244','8');
INSERT INTO `traits` VALUES ('53','resist petrify','5','10','1','246','2');
INSERT INTO `traits` VALUES ('53','resist petrify','5','30','2','246','3');
INSERT INTO `traits` VALUES ('53','resist petrify','5','50','3','246','5');
INSERT INTO `traits` VALUES ('53','resist petrify','5','70','4','246','6');
INSERT INTO `traits` VALUES ('54','resist virus','1','15','1','245','2');
INSERT INTO `traits` VALUES ('54','resist virus','1','35','2','245','3');
INSERT INTO `traits` VALUES ('54','resist virus','1','55','3','245','5');
INSERT INTO `traits` VALUES ('54','resist virus','1','70','4','245','6');
INSERT INTO `traits` VALUES ('55','resist curse','0','0','1','248','2');
INSERT INTO `traits` VALUES ('56','resist stun','0','0','1','251','2');
INSERT INTO `traits` VALUES ('57','resist bind','13','10','1','247','2');
INSERT INTO `traits` VALUES ('57','resist bind','13','30','2','247','3');
INSERT INTO `traits` VALUES ('57','resist bind','13','50','3','247','5');
INSERT INTO `traits` VALUES ('57','resist bind','13','70','4','247','6');
INSERT INTO `traits` VALUES ('58','resist gravity','6','20','1','249','2');
INSERT INTO `traits` VALUES ('58','resist gravity','6','40','2','249','3');
INSERT INTO `traits` VALUES ('58','resist gravity','6','60','3','249','5');
INSERT INTO `traits` VALUES ('58','resist gravity','6','75','4','249','6');
INSERT INTO `traits` VALUES ('59','resist slow','9','15','1','250','2');
INSERT INTO `traits` VALUES ('59','resist slow','9','35','2','250','3');
INSERT INTO `traits` VALUES ('59','resist slow','9','55','3','250','5');
INSERT INTO `traits` VALUES ('59','resist slow','9','75','4','250','6');
INSERT INTO `traits` VALUES ('59','resist slow','15','20','1','250','2');
INSERT INTO `traits` VALUES ('59','resist slow','15','40','2','250','3');
INSERT INTO `traits` VALUES ('59','resist slow','15','60','3','250','5');
INSERT INTO `traits` VALUES ('59','resist slow','15','75','4','250','6');
INSERT INTO `traits` VALUES ('59','resist slow','18','10','1','250','2');
INSERT INTO `traits` VALUES ('59','resist slow','18','50','1','250','3');
INSERT INTO `traits` VALUES ('59','resist slow','18','70','1','250','5');
INSERT INTO `traits` VALUES ('59','resist slow','19','20','1','250','2');
INSERT INTO `traits` VALUES ('59','resist slow','19','55','1','250','3');
INSERT INTO `traits` VALUES ('60','resist charm','0','0','1','252','2');
INSERT INTO `traits` VALUES ('64','treasure hunter ii','6','45','2','303','1');
INSERT INTO `traits` VALUES ('65','gilfinder ii','0','0','1','0','0');
INSERT INTO `traits` VALUES ('66','kick attacks','2','51','1','292','10');
INSERT INTO `traits` VALUES ('66','kick attacks','2','71','2','292','13');
INSERT INTO `traits` VALUES ('66','kick attacks','2','96','2','292','15');
INSERT INTO `traits` VALUES ('67','subtle blow','2','5','1','289','5');
INSERT INTO `traits` VALUES ('67','subtle blow','2','25','2','289','10');
INSERT INTO `traits` VALUES ('67','subtle blow','2','45','3','289','15');
INSERT INTO `traits` VALUES ('67','subtle blow','2','65','4','289','20');
INSERT INTO `traits` VALUES ('67','subtle blow','13','15','1','289','5');
INSERT INTO `traits` VALUES ('67','subtle blow','13','30','1','289','10');
INSERT INTO `traits` VALUES ('67','subtle blow','13','45','1','289','15');
INSERT INTO `traits` VALUES ('67','subtle blow','13','60','1','289','20');
INSERT INTO `traits` VALUES ('67','subtle blow','13','75','1','289','25');
INSERT INTO `traits` VALUES ('67','subtle blow','19','25','1','289','5');
INSERT INTO `traits` VALUES ('67','subtle blow','19','45','2','289','10');
INSERT INTO `traits` VALUES ('67','subtle blow','19','65','3','289','15');
INSERT INTO `traits` VALUES ('68','assassin','6','60','1','0','0');
INSERT INTO `traits` VALUES ('69','divine veil','3','50','1','0','0');
INSERT INTO `traits` VALUES ('70','zanshin','12','20','1','306','15');
INSERT INTO `traits` VALUES ('70','zanshin','12','35','2','306','25');
INSERT INTO `traits` VALUES ('70','zanshin','12','50','3','306','35');
INSERT INTO `traits` VALUES ('70','zanshin','12','75','4','306','45');
INSERT INTO `traits` VALUES ('71','savagery','1','75','1','0','0');
INSERT INTO `traits` VALUES ('72','aggressive aim','1','75','1','0','0');
INSERT INTO `traits` VALUES ('73','invigorate','2','75','1','0','0');
INSERT INTO `traits` VALUES ('74','penance','2','75','1','0','0');
INSERT INTO `traits` VALUES ('75','aura steal','6','75','1','0','0');
INSERT INTO `traits` VALUES ('76','ambush','6','75','1','0','0');
INSERT INTO `traits` VALUES ('77','iron will','7','75','1','0','0');
INSERT INTO `traits` VALUES ('78','guardian','7','75','1','0','0');
INSERT INTO `traits` VALUES ('79','muted soul','8','75','1','0','0');
INSERT INTO `traits` VALUES ('80','desperate blows','8','75','1','0','0');
INSERT INTO `traits` VALUES ('81','beast affinity ','9','75','1','0','0');
INSERT INTO `traits` VALUES ('82','beast healer','9','75','1','0','0');
INSERT INTO `traits` VALUES ('83','snapshot','11','75','1','0','0');
INSERT INTO `traits` VALUES ('84','recycle','11','20','1','305','10');
INSERT INTO `traits` VALUES ('84','recycle','17','35','1','305','10');
INSERT INTO `traits` VALUES ('85','ikishoten','12','75','1','0','0');
INSERT INTO `traits` VALUES ('86','overwhelm','12','75','1','0','0');
INSERT INTO `traits` VALUES ('87','ninja tool expert.','13','75','1','308','0');
INSERT INTO `traits` VALUES ('88','empathy','14','75','1','0','0');
INSERT INTO `traits` VALUES ('89','strafe','14','75','1','0','0');
INSERT INTO `traits` VALUES ('90','enchainment','16','75','1','0','0');
INSERT INTO `traits` VALUES ('91','assimilation','16','75','1','0','0');
INSERT INTO `traits` VALUES ('92','winning streak','17','75','1','0','0');
INSERT INTO `traits` VALUES ('93','loaded deck','17','75','1','0','0');
INSERT INTO `traits` VALUES ('94','fine-tuning','18','75','1','0','0');
INSERT INTO `traits` VALUES ('95','optimization','18','75','1','0','0');
INSERT INTO `traits` VALUES ('96','closed position','19','75','1','0','0');
INSERT INTO `traits` VALUES ('97','stormsurge','20','75','1','0','0');

-- --- RUNE FENCER --- -- (Tenacity needs verifying)
-- Tenacity Tier I
INSERT INTO `traits` VALUES ('117','tenacity','22','5','1','240','5');
INSERT INTO `traits` VALUES ('117','tenacity','22','5','1','241','5');
INSERT INTO `traits` VALUES ('117','tenacity','22','5','1','242','5');
INSERT INTO `traits` VALUES ('117','tenacity','22','5','1','243','5');
INSERT INTO `traits` VALUES ('117','tenacity','22','5','1','244','5');
INSERT INTO `traits` VALUES ('117','tenacity','22','5','1','245','5');
INSERT INTO `traits` VALUES ('117','tenacity','22','5','1','246','5');
INSERT INTO `traits` VALUES ('117','tenacity','22','5','1','247','5');
INSERT INTO `traits` VALUES ('117','tenacity','22','5','1','248','5');
-- Tenacity Tier II
INSERT INTO `traits` VALUES ('117','tenacity','22','25','2','240','7');
INSERT INTO `traits` VALUES ('117','tenacity','22','25','2','241','7');
INSERT INTO `traits` VALUES ('117','tenacity','22','25','2','242','7');
INSERT INTO `traits` VALUES ('117','tenacity','22','25','2','243','7');
INSERT INTO `traits` VALUES ('117','tenacity','22','25','2','244','7');
INSERT INTO `traits` VALUES ('117','tenacity','22','25','2','245','7');
INSERT INTO `traits` VALUES ('117','tenacity','22','25','2','246','7');
INSERT INTO `traits` VALUES ('117','tenacity','22','25','2','247','7');
INSERT INTO `traits` VALUES ('117','tenacity','22','25','2','248','7');
-- Tenacity Tier III
INSERT INTO `traits` VALUES ('117','tenacity','22','45','3','240','9');
INSERT INTO `traits` VALUES ('117','tenacity','22','45','3','241','9');
INSERT INTO `traits` VALUES ('117','tenacity','22','45','3','242','9');
INSERT INTO `traits` VALUES ('117','tenacity','22','45','3','243','9');
INSERT INTO `traits` VALUES ('117','tenacity','22','45','3','244','9');
INSERT INTO `traits` VALUES ('117','tenacity','22','45','3','245','9');
INSERT INTO `traits` VALUES ('117','tenacity','22','45','3','246','9');
INSERT INTO `traits` VALUES ('117','tenacity','22','45','3','247','9');
INSERT INTO `traits` VALUES ('117','tenacity','22','45','3','248','9');
-- Tenacity Tier IV
INSERT INTO `traits` VALUES ('117','tenacity','22','75','4','240','11');
INSERT INTO `traits` VALUES ('117','tenacity','22','75','4','241','11');
INSERT INTO `traits` VALUES ('117','tenacity','22','75','4','242','11');
INSERT INTO `traits` VALUES ('117','tenacity','22','75','4','243','11');
INSERT INTO `traits` VALUES ('117','tenacity','22','75','4','244','11');
INSERT INTO `traits` VALUES ('117','tenacity','22','75','4','245','11');
INSERT INTO `traits` VALUES ('117','tenacity','22','75','4','246','11');
INSERT INTO `traits` VALUES ('117','tenacity','22','75','4','247','11');
INSERT INTO `traits` VALUES ('117','tenacity','22','75','4','248','11');
-- Magic Def Tiers I ~ IV --
INSERT INTO `traits` VALUES ('6','magic def. bonus','22','10','1','29','10');
INSERT INTO `traits` VALUES ('6','magic def. bonus','22','30','2','29','12');
INSERT INTO `traits` VALUES ('6','magic def. bonus','22','50','3','29','14');
INSERT INTO `traits` VALUES ('6','magic def. bonus','22','70','4','29','16');
-- Auto Regen Tiers I ~ II --
INSERT INTO `traits` VALUES ('9','auto regen','22','35','1','370','1');
INSERT INTO `traits` VALUES ('9','auto regen','22','65','2','370','2');

-- --- GEOMANCER --- --
-- Conserve MP Tiers I ~ V --
INSERT INTO `traits` VALUES ('13','conserve mp','21','10','1','296','25');
INSERT INTO `traits` VALUES ('13','conserve mp','21','25','2','296','28');
INSERT INTO `traits` VALUES ('13','conserve mp','21','40','3','296','31');
INSERT INTO `traits` VALUES ('13','conserve mp','21','55','4','296','34');
INSERT INTO `traits` VALUES ('13','conserve mp','21','70','5','296','37');
-- Clear Mind Tiers I ~ III
INSERT INTO `traits` VALUES ('24','clear mind','21','20','1','71','3');
INSERT INTO `traits` VALUES ('24','clear mind','21','40','2','71','6');
INSERT INTO `traits` VALUES ('24','clear mind','21','60','3','71','9');
INSERT INTO `traits` VALUES ('24','clear mind','21','60','3','295','1');
-- Max MP Boost Tiers I ~ II
INSERT INTO `traits` VALUES ('8','max mp boost','21','30','1','5','10');
INSERT INTO `traits` VALUES ('8','max mp boost','21','60','2','5','20');