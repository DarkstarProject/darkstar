
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
  `value` smallint(5) NOT NULL DEFAULT '0',
  `required_expansion` VARCHAR(7) NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records
-- ----------------------------
INSERT INTO `traits` VALUES ('1','accuracy bonus','11','10','1','25','10',null);
INSERT INTO `traits` VALUES ('1','accuracy bonus','11','10','1','26','10',null);
INSERT INTO `traits` VALUES ('1','accuracy bonus','11','30','2','25','22',null);
INSERT INTO `traits` VALUES ('1','accuracy bonus','11','30','2','26','22',null);
INSERT INTO `traits` VALUES ('1','accuracy bonus','11','50','3','25','35',null);
INSERT INTO `traits` VALUES ('1','accuracy bonus','11','50','3','26','35',null);
INSERT INTO `traits` VALUES ('1','accuracy bonus','11','70','4','25','48',null);
INSERT INTO `traits` VALUES ('1','accuracy bonus','11','70','4','26','48',null);
INSERT INTO `traits` VALUES ('1','accuracy bonus','11','86','5','25','60','ABYSSEA');
INSERT INTO `traits` VALUES ('1','accuracy bonus','11','86','5','26','60','ABYSSEA');
INSERT INTO `traits` VALUES ('1','accuracy bonus','14','30','1','25','10',null); -- ROTZ
INSERT INTO `traits` VALUES ('1','accuracy bonus','14','30','1','26','10',null); -- ROTZ
INSERT INTO `traits` VALUES ('1','accuracy bonus','14','50','2','25','22','TOAU');
INSERT INTO `traits` VALUES ('1','accuracy bonus','14','50','2','26','22','TOAU');
INSERT INTO `traits` VALUES ('1','accuracy bonus','14','78','3','25','35','ABYSSEA');
INSERT INTO `traits` VALUES ('1','accuracy bonus','14','78','3','26','35','ABYSSEA');
INSERT INTO `traits` VALUES ('1','accuracy bonus','19','30','1','25','10','WOTG');
INSERT INTO `traits` VALUES ('1','accuracy bonus','19','30','1','26','10','WOTG');
INSERT INTO `traits` VALUES ('1','accuracy bonus','19','60','2','25','22','WOTG');
INSERT INTO `traits` VALUES ('1','accuracy bonus','19','60','2','26','22','WOTG');
INSERT INTO `traits` VALUES ('1','accuracy bonus','19','80','3','25','35','ABYSSEA');
INSERT INTO `traits` VALUES ('1','accuracy bonus','19','80','3','26','35','ABYSSEA');
INSERT INTO `traits` VALUES ('2','evasion bonus','6','10','1','68','10',null);
INSERT INTO `traits` VALUES ('2','evasion bonus','6','30','2','68','22',null);
INSERT INTO `traits` VALUES ('2','evasion bonus','6','50','3','68','35',null);
INSERT INTO `traits` VALUES ('2','evasion bonus','6','70','4','68','48',null);
INSERT INTO `traits` VALUES ('2','evasion bonus','6','76','5','68','60','ABYSSEA');
INSERT INTO `traits` VALUES ('2','evasion bonus','18','20','1','68','10','TOAU');
INSERT INTO `traits` VALUES ('2','evasion bonus','18','40','2','68','22','TOAU');
INSERT INTO `traits` VALUES ('2','evasion bonus','18','60','3','68','35','TOAU');
INSERT INTO `traits` VALUES ('2','evasion bonus','18','80','4','68','48','TOAU');
INSERT INTO `traits` VALUES ('2','evasion bonus','19','15','1','68','10','WOTG');
INSERT INTO `traits` VALUES ('2','evasion bonus','19','45','2','68','22','WOTG');
INSERT INTO `traits` VALUES ('2','evasion bonus','19','75','3','68','35','WOTG');
INSERT INTO `traits` VALUES ('3','attack bonus','1','30','1','23','10',null);
INSERT INTO `traits` VALUES ('3','attack bonus','1','30','1','24','10',null);
INSERT INTO `traits` VALUES ('3','attack bonus','1','91','2','23','22','ABYSSEA');
INSERT INTO `traits` VALUES ('3','attack bonus','1','91','2','24','22','ABYSSEA');
INSERT INTO `traits` VALUES ('3','attack bonus','8','10','1','23','10',null);
INSERT INTO `traits` VALUES ('3','attack bonus','8','10','1','24','10',null);
INSERT INTO `traits` VALUES ('3','attack bonus','8','30','2','23','22',null);
INSERT INTO `traits` VALUES ('3','attack bonus','8','30','2','24','22',null);
INSERT INTO `traits` VALUES ('3','attack bonus','8','50','3','23','35',null);
INSERT INTO `traits` VALUES ('3','attack bonus','8','50','3','24','35',null);
INSERT INTO `traits` VALUES ('3','attack bonus','8','70','4','23','48',null);
INSERT INTO `traits` VALUES ('3','attack bonus','8','70','4','24','48',null);
INSERT INTO `traits` VALUES ('3','attack bonus','8','76','5','23','60','ABYSSEA');
INSERT INTO `traits` VALUES ('3','attack bonus','8','76','5','24','60','ABYSSEA');
INSERT INTO `traits` VALUES ('3','attack bonus','8','91','6','23','72','ABYSSEA');
INSERT INTO `traits` VALUES ('3','attack bonus','8','91','6','24','72','ABYSSEA');
INSERT INTO `traits` VALUES ('3','attack bonus','14','10','1','23','10',null); -- ROTZ
INSERT INTO `traits` VALUES ('3','attack bonus','14','10','1','24','10',null); -- ROTZ
INSERT INTO `traits` VALUES ('3','attack bonus','14','91','2','23','22','ABYSSEA');
INSERT INTO `traits` VALUES ('3','attack bonus','14','91','2','24','22','ABYSSEA');
INSERT INTO `traits` VALUES ('4','defense bonus','1','10','1','1','10',null);
INSERT INTO `traits` VALUES ('4','defense bonus','1','86','2','1','22','ABYSSEA');
INSERT INTO `traits` VALUES ('4','defense bonus','7','10','1','1','10',null);
INSERT INTO `traits` VALUES ('4','defense bonus','7','30','2','1','22',null);
INSERT INTO `traits` VALUES ('4','defense bonus','7','50','3','1','35',null);
INSERT INTO `traits` VALUES ('4','defense bonus','7','70','4','1','48',null);
INSERT INTO `traits` VALUES ('4','defense bonus','7','76','5','1','60','ABYSSEA');
INSERT INTO `traits` VALUES ('4','defense bonus','7','91','6','1','72','ABYSSEA');
INSERT INTO `traits` VALUES ('5','magic atk. bonus','4','10','1','28','20',null);
INSERT INTO `traits` VALUES ('5','magic atk. bonus','4','30','2','28','24',null);
INSERT INTO `traits` VALUES ('5','magic atk. bonus','4','50','3','28','28',null);
INSERT INTO `traits` VALUES ('5','magic atk. bonus','4','70','4','28','32',null);
INSERT INTO `traits` VALUES ('5','magic atk. bonus','4','81','5','28','36','ABYSSEA');
INSERT INTO `traits` VALUES ('5','magic atk. bonus','4','91','6','28','40','ABYSSEA');
INSERT INTO `traits` VALUES ('5','magic atk. bonus','5','20','1','28','20','WOTG');
INSERT INTO `traits` VALUES ('5','magic atk. bonus','5','40','2','28','24','WOTG');
INSERT INTO `traits` VALUES ('5','magic atk. bonus','5','86','3','28','28','ABYSSEA');
INSERT INTO `traits` VALUES ('6','magic def. bonus','3','10','1','29','10',null);
INSERT INTO `traits` VALUES ('6','magic def. bonus','3','30','2','29','12',null);
INSERT INTO `traits` VALUES ('6','magic def. bonus','3','50','3','29','14',null);
INSERT INTO `traits` VALUES ('6','magic def. bonus','3','70','4','29','16',null);
INSERT INTO `traits` VALUES ('6','magic def. bonus','3','81','5','29','18','ABYSSEA');
INSERT INTO `traits` VALUES ('6','magic def. bonus','3','91','6','29','20','ABYSSEA');
INSERT INTO `traits` VALUES ('6','magic def. bonus','5','25','1','29','10',null);
INSERT INTO `traits` VALUES ('6','magic def. bonus','5','45','2','29','12',null);
INSERT INTO `traits` VALUES ('6','magic def. bonus','5','96','3','29','14','ABYSSEA');
INSERT INTO `traits` VALUES ('7','max hp boost','1','30','1','2','30','SOA');
INSERT INTO `traits` VALUES ('7','max hp boost','1','50','2','2','60','SOA');
INSERT INTO `traits` VALUES ('7','max hp boost','1','70','3','2','120','SOA');
INSERT INTO `traits` VALUES ('7','max hp boost','1','90','4','2','180','SOA');
INSERT INTO `traits` VALUES ('7','max hp boost','2','15','1','2','30',null);
INSERT INTO `traits` VALUES ('7','max hp boost','2','35','2','2','60',null);
INSERT INTO `traits` VALUES ('7','max hp boost','2','55','3','2','120',null);
INSERT INTO `traits` VALUES ('7','max hp boost','2','70','4','2','180',null);
INSERT INTO `traits` VALUES ('7','max hp boost','2','86','5','2','240','ABYSSEA');
INSERT INTO `traits` VALUES ('7','max hp boost','2','96','6','2','280','ABYSSEA');
INSERT INTO `traits` VALUES ('7','max hp boost','7','45','1','2','30','SOA');
INSERT INTO `traits` VALUES ('7','max hp boost','7','85','2','2','60','SOA');
INSERT INTO `traits` VALUES ('7','max hp boost','13','20','1','2','30','SOA');
INSERT INTO `traits` VALUES ('7','max hp boost','13','40','2','2','60','SOA');
INSERT INTO `traits` VALUES ('7','max hp boost','13','60','3','2','120','SOA');
INSERT INTO `traits` VALUES ('7','max hp boost','13','80','4','2','180','SOA');
INSERT INTO `traits` VALUES ('7','max hp boost','13','99','5','2','240','SOA');
INSERT INTO `traits` VALUES ('7','max hp boost','22','20','1','2','30','SOA');
INSERT INTO `traits` VALUES ('7','max hp boost','22','40','2','2','60','SOA');
INSERT INTO `traits` VALUES ('7','max hp boost','22','60','3','2','120','SOA');
INSERT INTO `traits` VALUES ('7','max hp boost','22','80','4','2','180','SOA');
INSERT INTO `traits` VALUES ('7','max hp boost','22','99','5','2','240','SOA');
INSERT INTO `traits` VALUES ('8','max mp boost','15','10','1','5','10',null);
INSERT INTO `traits` VALUES ('8','max mp boost','15','30','2','5','20',null);
INSERT INTO `traits` VALUES ('8','max mp boost','15','50','3','5','40',null);
INSERT INTO `traits` VALUES ('8','max mp boost','15','70','4','5','60',null);
INSERT INTO `traits` VALUES ('8','max mp boost','15','76','5','5','80','ABYSSEA');
INSERT INTO `traits` VALUES ('8','max mp boost','15','96','6','5','100','ABYSSEA');
INSERT INTO `traits` VALUES ('8','max mp boost','20','30','1','5','10','WOTG');
INSERT INTO `traits` VALUES ('8','max mp boost','20','88','2','5','20','ABYSSEA');
INSERT INTO `traits` VALUES ('9','auto regen','3','25','1','370','1',null);
INSERT INTO `traits` VALUES ('9','auto regen','3','76','2','370','2','ABYSSEA');
INSERT INTO `traits` VALUES ('10','auto refresh','7','35','1','369','1',null);
INSERT INTO `traits` VALUES ('10','auto refresh','15','25','1','369','1',null);
INSERT INTO `traits` VALUES ('10','auto refresh','15','90','2','369','2','ABYSSEA');
INSERT INTO `traits` VALUES ('11','rapid shot','11','15','1','359','10',null);
INSERT INTO `traits` VALUES ('11','rapid shot','17','15','1','359','10','TOAU');
INSERT INTO `traits` VALUES ('12','fast cast','5','15','1','170','10',null);
INSERT INTO `traits` VALUES ('12','fast cast','5','35','2','170','15',null);
INSERT INTO `traits` VALUES ('12','fast cast','5','55','3','170','20',null);
INSERT INTO `traits` VALUES ('12','fast cast','5','76','4','170','25','ABYSSEA');
INSERT INTO `traits` VALUES ('12','fast cast','5','89','5','170','30','ABYSSEA');
INSERT INTO `traits` VALUES ('13','conserve mp','4','20','1','296','25',null);
INSERT INTO `traits` VALUES ('13','conserve mp','20','25','1','296','25','WOTG');
INSERT INTO `traits` VALUES ('14','store tp','12','10','1','73','10',null); -- ROTZ
INSERT INTO `traits` VALUES ('14','store tp','12','30','2','73','15',null); -- ROTZ
INSERT INTO `traits` VALUES ('14','store tp','12','50','3','73','20',null); -- ROTZ
INSERT INTO `traits` VALUES ('14','store tp','12','70','4','73','25',null); -- ROTZ
INSERT INTO `traits` VALUES ('14','store tp','12','90','5','73','30','ABYSSEA');
INSERT INTO `traits` VALUES ('15','double attack','1','25','1','288','10',null);
INSERT INTO `traits` VALUES ('16','triple attack','6','55','1','302','5',null);
INSERT INTO `traits` VALUES ('16','triple attack','6','96','2','302','6','ABYSSEA');
INSERT INTO `traits` VALUES ('17','counter','2','10','1','291','10',null);
INSERT INTO `traits` VALUES ('17','counter','2','81','2','291','13','ABYSSEA');
INSERT INTO `traits` VALUES ('18','dual wield','6','83','1','259','10','ABYSSEA');
INSERT INTO `traits` VALUES ('18','dual wield','6','87','2','259','15','ABYSSEA');
INSERT INTO `traits` VALUES ('18','dual wield','6','98','3','259','25','ABYSSEA');
INSERT INTO `traits` VALUES ('18','dual wield','13','10','1','259','10',null); -- ROTZ
INSERT INTO `traits` VALUES ('18','dual wield','13','25','2','259','15',null); -- ROTZ
INSERT INTO `traits` VALUES ('18','dual wield','13','45','3','259','25',null); -- ROTZ
INSERT INTO `traits` VALUES ('18','dual wield','13','65','4','259','30',null); -- ROTZ
INSERT INTO `traits` VALUES ('18','dual wield','13','85','5','259','35',null); -- ROTZ
INSERT INTO `traits` VALUES ('18','dual wield','19','20','1','259','10','ABYSSEA');
INSERT INTO `traits` VALUES ('18','dual wield','19','40','2','259','15','ABYSSEA');
INSERT INTO `traits` VALUES ('18','dual wield','19','60','3','259','25','ABYSSEA');
INSERT INTO `traits` VALUES ('18','dual wield','19','80','4','259','30','ABYSSEA');
INSERT INTO `traits` VALUES ('19','treasure hunter','6','15','1','303','1',null);
INSERT INTO `traits` VALUES ('20','gilfinder','6','5','1','0','0',null); -- Not implemented. Remove this note when it is.
INSERT INTO `traits` VALUES ('20','gilfinder','6','85','2','0','0','ABYSSEA'); -- 2nd tier does NOT have its own separate ID in client.
INSERT INTO `traits` VALUES ('21','alertness','11','5','1','0','0',null);
INSERT INTO `traits` VALUES ('22','stealth','13','5','1','358','3',null); -- ROTZ
INSERT INTO `traits` VALUES ('23','martial arts','2','1','1','173','80',null);
INSERT INTO `traits` VALUES ('23','martial arts','2','16','2','173','100',null);
INSERT INTO `traits` VALUES ('23','martial arts','2','31','3','173','120',null);
INSERT INTO `traits` VALUES ('23','martial arts','2','46','4','173','140',null);
INSERT INTO `traits` VALUES ('23','martial arts','2','61','5','173','160',null);
INSERT INTO `traits` VALUES ('23','martial arts','2','75','6','173','180',null);
INSERT INTO `traits` VALUES ('23','martial arts','2','82','7','173','200','ABYSSEA');
INSERT INTO `traits` VALUES ('23','martial arts','18','25','1','173','80','TOAU');
INSERT INTO `traits` VALUES ('23','martial arts','18','50','2','173','100','TOAU');
INSERT INTO `traits` VALUES ('23','martial arts','18','75','3','173','120','TOAU');
INSERT INTO `traits` VALUES ('23','martial arts','18','86','4','173','140','ABYSSEA');
INSERT INTO `traits` VALUES ('23','martial arts','18','97','5','173','160','ABYSSEA');
INSERT INTO `traits` VALUES ('24','clear mind','3','20','1','71','3',null);
INSERT INTO `traits` VALUES ('24','clear mind','3','35','2','71','6',null);
INSERT INTO `traits` VALUES ('24','clear mind','3','50','3','71','9',null);
INSERT INTO `traits` VALUES ('24','clear mind','3','50','3','295','1',null);
INSERT INTO `traits` VALUES ('24','clear mind','3','65','4','71','12',null);
INSERT INTO `traits` VALUES ('24','clear mind','3','80','5','71','15','ABYSSEA');
INSERT INTO `traits` VALUES ('24','clear mind','3','80','5','295','2','ABYSSEA');
INSERT INTO `traits` VALUES ('24','clear mind','3','96','6','71','18','ABYSSEA');
INSERT INTO `traits` VALUES ('24','clear mind','3','96','6','295','3','ABYSSEA');
INSERT INTO `traits` VALUES ('24','clear mind','4','15','1','71','3',null);
INSERT INTO `traits` VALUES ('24','clear mind','4','30','2','71','6',null);
INSERT INTO `traits` VALUES ('24','clear mind','4','45','3','71','9',null);
INSERT INTO `traits` VALUES ('24','clear mind','4','45','3','295','1',null);
INSERT INTO `traits` VALUES ('24','clear mind','4','60','4','71','12',null);
INSERT INTO `traits` VALUES ('24','clear mind','4','75','5','71','15',null);
INSERT INTO `traits` VALUES ('24','clear mind','4','75','5','295','2',null);
INSERT INTO `traits` VALUES ('24','clear mind','4','91','6','71','18','ABYSSEA');
INSERT INTO `traits` VALUES ('24','clear mind','4','91','6','295','3','ABYSSEA');
INSERT INTO `traits` VALUES ('24','clear mind','5','31','1','71','3',null);
INSERT INTO `traits` VALUES ('24','clear mind','5','53','2','71','6',null);
INSERT INTO `traits` VALUES ('24','clear mind','5','75','3','71','9',null);
INSERT INTO `traits` VALUES ('24','clear mind','5','75','3','295','1',null);
INSERT INTO `traits` VALUES ('24','clear mind','5','91','4','71','12','ABYSSEA');
INSERT INTO `traits` VALUES ('24','clear mind','5','91','4','295','1','ABYSSEA');
INSERT INTO `traits` VALUES ('24','clear mind','15','15','1','71','3',null);
INSERT INTO `traits` VALUES ('24','clear mind','15','30','2','71','6',null);
INSERT INTO `traits` VALUES ('24','clear mind','15','45','3','71','9',null);
INSERT INTO `traits` VALUES ('24','clear mind','15','45','3','295','1',null);
INSERT INTO `traits` VALUES ('24','clear mind','15','60','4','71','12',null);
INSERT INTO `traits` VALUES ('24','clear mind','15','70','5','71','15',null);
INSERT INTO `traits` VALUES ('24','clear mind','15','70','5','295','2',null);
INSERT INTO `traits` VALUES ('24','clear mind','15','91','6','71','18','ABYSSEA');
INSERT INTO `traits` VALUES ('24','clear mind','15','91','6','295','3','ABYSSEA');
INSERT INTO `traits` VALUES ('24','clear mind','20','20','1','71','3','WOTG');
INSERT INTO `traits` VALUES ('24','clear mind','20','35','2','71','6','WOTG');
INSERT INTO `traits` VALUES ('24','clear mind','20','50','3','71','9','WOTG');
INSERT INTO `traits` VALUES ('24','clear mind','20','50','3','295','1','WOTG');
INSERT INTO `traits` VALUES ('24','clear mind','20','65','4','71','12','WOTG');
INSERT INTO `traits` VALUES ('24','clear mind','20','76','5','71','15','ABYSSEA');
INSERT INTO `traits` VALUES ('24','clear mind','20','76','5','295','2','ABYSSEA');
INSERT INTO `traits` VALUES ('24','clear mind','20','96','6','71','18','ABYSSEA');
INSERT INTO `traits` VALUES ('24','clear mind','20','96','6','295','3','ABYSSEA');
INSERT INTO `traits` VALUES ('25','shield mastery','5','87','10','485','10',null);
INSERT INTO `traits` VALUES ('25','shield mastery','5','97','20','485','20',null);
INSERT INTO `traits` VALUES ('25','shield mastery','7','25','10','485','10',null);
INSERT INTO `traits` VALUES ('25','shield mastery','7','50','20','485','20',null);
INSERT INTO `traits` VALUES ('25','shield mastery','7','75','30','485','30',null);
INSERT INTO `traits` VALUES ('25','shield mastery','7','96','40','485','40','ABYSSEA');
INSERT INTO `traits` VALUES ('32','beast killer','9','70','1','230','8',null);
INSERT INTO `traits` VALUES ('33','plantoid killer','9','60','1','229','8',null);
INSERT INTO `traits` VALUES ('34','vermin killer','9','10','1','224','8',null);
INSERT INTO `traits` VALUES ('35','lizard killer','9','40','1','227','8',null);
INSERT INTO `traits` VALUES ('36','bird killer','9','20','1','225','8',null);
INSERT INTO `traits` VALUES ('37','amorph killer','9','30','1','226','8',null);
INSERT INTO `traits` VALUES ('38','aquan killer','9','50','1','228','8',null);
INSERT INTO `traits` VALUES ('39','undead killer','7','5','1','231','8',null);
INSERT INTO `traits` VALUES ('41','arcana killer','8','25','1','232','8',null);
INSERT INTO `traits` VALUES ('42','demon killer','12','40','1','234','8',null); -- ROTZ
INSERT INTO `traits` VALUES ('43','dragon killer','14','25','1','233','8',null); -- ROTZ
INSERT INTO `traits` VALUES ('48','resist sleep','7','20','1','240','2',null);
INSERT INTO `traits` VALUES ('48','resist sleep','7','40','2','240','3',null);
INSERT INTO `traits` VALUES ('48','resist sleep','7','60','3','240','5',null);
INSERT INTO `traits` VALUES ('49','resist poison','11','20','1','241','2',null);
INSERT INTO `traits` VALUES ('49','resist poison','11','40','2','241','3',null);
INSERT INTO `traits` VALUES ('49','resist poison','11','60','3','241','5',null);
INSERT INTO `traits` VALUES ('50','resist paralyze','8','20','1','242','2',null);
INSERT INTO `traits` VALUES ('50','resist paralyze','8','40','2','242','3',null);
INSERT INTO `traits` VALUES ('50','resist paralyze','8','60','3','242','5',null);
INSERT INTO `traits` VALUES ('50','resist paralyze','8','75','4','242','6',null);
INSERT INTO `traits` VALUES ('50','resist paralyze','17','5','1','242','2','TOAU');
INSERT INTO `traits` VALUES ('50','resist paralyze','17','25','2','242','3','TOAU');
INSERT INTO `traits` VALUES ('50','resist paralyze','17','45','3','242','5','TOAU');
INSERT INTO `traits` VALUES ('50','resist paralyze','17','65','4','242','6','TOAU');
INSERT INTO `traits` VALUES ('51','resist blind','12','5','1','243','2',null); -- ROTZ
INSERT INTO `traits` VALUES ('51','resist blind','12','25','2','243','3',null); -- ROTZ
INSERT INTO `traits` VALUES ('51','resist blind','12','45','3','243','5',null); -- ROTZ
INSERT INTO `traits` VALUES ('51','resist blind','12','65','4','243','6',null); -- ROTZ
INSERT INTO `traits` VALUES ('52','resist silence','10','5','1','244','2',null);
INSERT INTO `traits` VALUES ('52','resist silence','10','25','2','244','3',null);
INSERT INTO `traits` VALUES ('52','resist silence','10','45','3','244','5',null);
INSERT INTO `traits` VALUES ('52','resist silence','10','65','4','244','6',null);
INSERT INTO `traits` VALUES ('52','resist silence','10','81','5','244','7','ABYSSEA');
INSERT INTO `traits` VALUES ('52','resist silence','20','10','1','244','2','WOTG');
INSERT INTO `traits` VALUES ('52','resist silence','20','40','2','244','3','WOTG');
INSERT INTO `traits` VALUES ('52','resist silence','20','70','3','244','5','WOTG');
INSERT INTO `traits` VALUES ('52','resist silence','20','81','4','244','6','ABYSSEA');
INSERT INTO `traits` VALUES ('53','resist petrify','5','10','1','246','2',null);
INSERT INTO `traits` VALUES ('53','resist petrify','5','30','2','246','3',null);
INSERT INTO `traits` VALUES ('53','resist petrify','5','50','3','246','5',null);
INSERT INTO `traits` VALUES ('53','resist petrify','5','70','4','246','6',null);
INSERT INTO `traits` VALUES ('54','resist virus','1','15','1','245','2',null);
INSERT INTO `traits` VALUES ('54','resist virus','1','35','2','245','3',null);
INSERT INTO `traits` VALUES ('54','resist virus','1','55','3','245','5',null);
INSERT INTO `traits` VALUES ('54','resist virus','1','70','4','245','6',null);
INSERT INTO `traits` VALUES ('55','resist curse','0','0','1','248','2',null);
INSERT INTO `traits` VALUES ('56','resist stun','0','0','1','251','2',null);
INSERT INTO `traits` VALUES ('57','resist bind','13','10','1','247','2',null); -- ROTZ
INSERT INTO `traits` VALUES ('57','resist bind','13','30','2','247','3',null); -- ROTZ
INSERT INTO `traits` VALUES ('57','resist bind','13','50','3','247','5',null); -- ROTZ
INSERT INTO `traits` VALUES ('57','resist bind','13','70','4','247','6',null); -- ROTZ
INSERT INTO `traits` VALUES ('58','resist gravity','6','20','1','249','2',null);
INSERT INTO `traits` VALUES ('58','resist gravity','6','40','2','249','3',null);
INSERT INTO `traits` VALUES ('58','resist gravity','6','60','3','249','5',null);
INSERT INTO `traits` VALUES ('58','resist gravity','6','75','4','249','6',null);
INSERT INTO `traits` VALUES ('58','resist gravity','6','81','5','249','7','ABYSSEA');
INSERT INTO `traits` VALUES ('59','resist slow','9','15','1','250','2',null);
INSERT INTO `traits` VALUES ('59','resist slow','9','35','2','250','3',null);
INSERT INTO `traits` VALUES ('59','resist slow','9','55','3','250','5',null);
INSERT INTO `traits` VALUES ('59','resist slow','9','75','4','250','6',null);
INSERT INTO `traits` VALUES ('59','resist slow','9','81','5','250','7','ABYSSEA');
INSERT INTO `traits` VALUES ('59','resist slow','15','20','1','250','2',null);
INSERT INTO `traits` VALUES ('59','resist slow','15','40','2','250','3',null);
INSERT INTO `traits` VALUES ('59','resist slow','15','60','3','250','5',null);
INSERT INTO `traits` VALUES ('59','resist slow','15','75','4','250','6',null);
INSERT INTO `traits` VALUES ('59','resist slow','18','10','1','250','2','TOAU');
INSERT INTO `traits` VALUES ('59','resist slow','18','50','2','250','3','TOAU');
INSERT INTO `traits` VALUES ('59','resist slow','18','70','3','250','5','TOAU');
INSERT INTO `traits` VALUES ('59','resist slow','18','75','4','250','6','TOAU');
INSERT INTO `traits` VALUES ('59','resist slow','19','20','1','250','2','WOTG');
INSERT INTO `traits` VALUES ('59','resist slow','19','55','2','250','3','WOTG');
INSERT INTO `traits` VALUES ('59','resist slow','19','81','3','250','5','ABYSSEA');
INSERT INTO `traits` VALUES ('60','resist charm','0','0','1','252','2',null);
INSERT INTO `traits` VALUES ('63','resist amnesia','9','15','1','253','2','SOA');
INSERT INTO `traits` VALUES ('63','resist amnesia','9','35','2','253','3','SOA');
INSERT INTO `traits` VALUES ('63','resist amnesia','9','55','3','253','5','SOA');
INSERT INTO `traits` VALUES ('63','resist amnesia','9','75','4','253','6','SOA');
INSERT INTO `traits` VALUES ('63','resist amnesia','17','30','1','253','2','SOA');
INSERT INTO `traits` VALUES ('63','resist amnesia','17','50','2','253','3','SOA');
INSERT INTO `traits` VALUES ('63','resist amnesia','17','70','3','253','5','SOA');
INSERT INTO `traits` VALUES ('63','resist amnesia','18','15','1','253','2','SOA');
INSERT INTO `traits` VALUES ('63','resist amnesia','18','35','2','253','3','SOA');
INSERT INTO `traits` VALUES ('63','resist amnesia','18','55','3','253','5','SOA');
INSERT INTO `traits` VALUES ('63','resist amnesia','18','75','4','253','6','SOA');
INSERT INTO `traits` VALUES ('64','treasure hunter ii','6','45','2','303','1',null);
INSERT INTO `traits` VALUES ('65','treasure hunter iii','6','90','3','303','1','ABYSSEA');
INSERT INTO `traits` VALUES ('66','kick attacks','2','51','1','292','10',null);
INSERT INTO `traits` VALUES ('66','kick attacks','2','71','2','292','13',null);
INSERT INTO `traits` VALUES ('66','kick attacks','2','96','3','292','15','ABYSSEA');
INSERT INTO `traits` VALUES ('67','subtle blow','2','5','1','289','5',null); -- ROTZ
INSERT INTO `traits` VALUES ('67','subtle blow','2','25','2','289','10',null); -- ROTZ
INSERT INTO `traits` VALUES ('67','subtle blow','2','45','3','289','15',null); -- ROTZ
INSERT INTO `traits` VALUES ('67','subtle blow','2','65','4','289','20',null); -- ROTZ
INSERT INTO `traits` VALUES ('67','subtle blow','2','91','5','289','25','ABYSSEA');
INSERT INTO `traits` VALUES ('67','subtle blow','13','15','1','289','5',null); -- ROTZ
INSERT INTO `traits` VALUES ('67','subtle blow','13','30','2','289','10',null); -- ROTZ
INSERT INTO `traits` VALUES ('67','subtle blow','13','45','3','289','15',null); -- ROTZ
INSERT INTO `traits` VALUES ('67','subtle blow','13','60','4','289','20',null); -- ROTZ
INSERT INTO `traits` VALUES ('67','subtle blow','13','75','5','289','25',null); -- ROTZ
INSERT INTO `traits` VALUES ('67','subtle blow','13','91','6','289','27','ABYSSEA');
INSERT INTO `traits` VALUES ('67','subtle blow','19','25','1','289','5','WOTG');
INSERT INTO `traits` VALUES ('67','subtle blow','19','45','2','289','10','WOTG');
INSERT INTO `traits` VALUES ('67','subtle blow','19','65','3','289','15','WOTG');
INSERT INTO `traits` VALUES ('67','subtle blow','19','86','4','289','20','ABYSSEA');
INSERT INTO `traits` VALUES ('68','assassin','6','60','1','0','0','COP');
INSERT INTO `traits` VALUES ('69','divine veil','3','50','1','0','0','COP');
INSERT INTO `traits` VALUES ('70','zanshin','12','20','1','306','15','COP');
INSERT INTO `traits` VALUES ('70','zanshin','12','35','2','306','25','COP');
INSERT INTO `traits` VALUES ('70','zanshin','12','50','3','306','35','COP');
INSERT INTO `traits` VALUES ('70','zanshin','12','75','4','306','45','COP');
INSERT INTO `traits` VALUES ('70','zanshin','12','95','5','306','50','ABYSSEA');
INSERT INTO `traits` VALUES ('71','savagery','1','75','1','0','0','TOAU');
INSERT INTO `traits` VALUES ('72','aggressive aim','1','75','1','0','0','TOAU');
INSERT INTO `traits` VALUES ('73','invigorate','2','75','1','0','24','TOAU');
INSERT INTO `traits` VALUES ('74','penance','2','75','1','0','0','TOAU');
INSERT INTO `traits` VALUES ('75','aura steal','6','75','1','0','0','TOAU');
INSERT INTO `traits` VALUES ('76','ambush','6','75','1','0','0','TOAU');
INSERT INTO `traits` VALUES ('77','iron will','7','75','1','0','0','TOAU');
INSERT INTO `traits` VALUES ('78','guardian','7','75','1','0','0','TOAU');
INSERT INTO `traits` VALUES ('79','muted soul','8','75','1','0','0','TOAU');
INSERT INTO `traits` VALUES ('80','desperate blows','8','75','1','0','0','TOAU');
INSERT INTO `traits` VALUES ('81','beast affinity ','9','75','1','0','0','TOAU');
INSERT INTO `traits` VALUES ('82','beast healer','9','75','1','0','0','TOAU');
INSERT INTO `traits` VALUES ('83','snapshot','11','75','1','0','0','TOAU');
INSERT INTO `traits` VALUES ('84','recycle','11','20','1','305','10','TOAU');
INSERT INTO `traits` VALUES ('84','recycle','17','35','1','305','10','TOAU');
INSERT INTO `traits` VALUES ('85','ikishoten','12','75','1','0','0','TOAU');
INSERT INTO `traits` VALUES ('86','overwhelm','12','75','1','0','0','TOAU');
INSERT INTO `traits` VALUES ('87','ninja tool expert.','13','75','1','308','0','TOAU');
INSERT INTO `traits` VALUES ('88','empathy','14','75','1','0','0','TOAU');
INSERT INTO `traits` VALUES ('89','strafe','14','75','1','0','0','TOAU');
INSERT INTO `traits` VALUES ('90','enchainment','16','75','1','0','0','TOAU');
INSERT INTO `traits` VALUES ('91','assimilation','16','75','1','0','0','TOAU');
INSERT INTO `traits` VALUES ('92','winning streak','17','75','1','0','0','TOAU');
INSERT INTO `traits` VALUES ('93','loaded deck','17','75','1','0','0','TOAU');
INSERT INTO `traits` VALUES ('94','fine-tuning','18','75','1','0','0','TOAU');
INSERT INTO `traits` VALUES ('95','optimization','18','75','1','0','0','TOAU');
INSERT INTO `traits` VALUES ('96','closed position','19','75','1','0','0','WOTG');
INSERT INTO `traits` VALUES ('97','stormsurge','20','75','1','0','0','WOTG');
INSERT INTO `traits` VALUES ('100','tactical parry','8','88','10','486','2','ABYSSEA');
INSERT INTO `traits` VALUES ('100','tactical parry','8','98','20','486','3','ABYSSEA');
INSERT INTO `traits` VALUES ('100','tactical parry','13','77','10','486','2','ABYSSEA');
INSERT INTO `traits` VALUES ('100','tactical parry','13','87','20','486','3','ABYSSEA');
INSERT INTO `traits` VALUES ('100','tactical parry','13','97','30','486','4','ABYSSEA');
INSERT INTO `traits` VALUES ('100','tactical parry','19','77','10','486','2','ABYSSEA');
INSERT INTO `traits` VALUES ('100','tactical parry','19','84','20','486','3','ABYSSEA');
INSERT INTO `traits` VALUES ('100','tactical parry','19','91','30','486','4','ABYSSEA');
INSERT INTO `traits` VALUES ('100','tactical parry','19','97','40','486','5','ABYSSEA');
INSERT INTO `traits` VALUES ('100','tactical parry','22','40','10','486','2',null);
INSERT INTO `traits` VALUES ('100','tactical parry','22','60','20','486','3',null);
INSERT INTO `traits` VALUES ('100','tactical parry','22','97','30','486','4',null);
INSERT INTO `traits` VALUES ('106','skillchain bonus','2','85','1','174','8','ABYSSEA');
INSERT INTO `traits` VALUES ('106','skillchain bonus','2','95','2','174','12','ABYSSEA');
INSERT INTO `traits` VALUES ('106','skillchain bonus','12','78','1','174','8','ABYSSEA');
INSERT INTO `traits` VALUES ('106','skillchain bonus','12','88','2','174','12','ABYSSEA');
INSERT INTO `traits` VALUES ('106','skillchain bonus','12','98','3','174','16','ABYSSEA');
INSERT INTO `traits` VALUES ('106','skillchain bonus','13','85','1','174','8','ABYSSEA');
INSERT INTO `traits` VALUES ('106','skillchain bonus','13','95','2','174','12','ABYSSEA');
INSERT INTO `traits` VALUES ('106','skillchain bonus','19','45','1','174','8','ABYSSEA');
INSERT INTO `traits` VALUES ('106','skillchain bonus','19','58','2','174','12','ABYSSEA');
INSERT INTO `traits` VALUES ('106','skillchain bonus','19','71','3','174','16','ABYSSEA');
INSERT INTO `traits` VALUES ('106','skillchain bonus','19','84','4','174','20','ABYSSEA');
INSERT INTO `traits` VALUES ('106','skillchain bonus','19','97','4','174','23','ABYSSEA');
INSERT INTO `traits` VALUES ('110','mag. burst bonus','4','45','1','487','5','ABYSSEA');
INSERT INTO `traits` VALUES ('110','mag. burst bonus','4','58','2','487','7','ABYSSEA');
INSERT INTO `traits` VALUES ('110','mag. burst bonus','4','71','3','487','9','ABYSSEA');
INSERT INTO `traits` VALUES ('110','mag. burst bonus','4','84','4','487','11','ABYSSEA');
INSERT INTO `traits` VALUES ('110','mag. burst bonus','4','97','5','487','13','ABYSSEA');
INSERT INTO `traits` VALUES ('110','mag. burst bonus','5','85','1','487','5','ABYSSEA');
INSERT INTO `traits` VALUES ('110','mag. burst bonus','5','95','2','487','7','ABYSSEA');
INSERT INTO `traits` VALUES ('110','mag. burst bonus','13','80','1','487','5','ABYSSEA');
INSERT INTO `traits` VALUES ('110','mag. burst bonus','13','90','2','487','7','ABYSSEA');
INSERT INTO `traits` VALUES ('110','mag. burst bonus','20','79','1','487','5','ABYSSEA');
INSERT INTO `traits` VALUES ('110','mag. burst bonus','20','89','2','487','7','ABYSSEA');
INSERT INTO `traits` VALUES ('110','mag. burst bonus','20','99','3','487','9','ABYSSEA');
INSERT INTO `traits` VALUES ('114','tranquil heart','3','21','1','0','0','ABYSSEA');
INSERT INTO `traits` VALUES ('114','tranquil heart','5','26','1','0','0','ABYSSEA');
INSERT INTO `traits` VALUES ('114','tranquil heart','20','30','1','0','0','ABYSSEA');

-- --- RUNE FENCER --- -- (Tenacity needs verifying)
-- Tenacity Tier I
INSERT INTO `traits` VALUES ('117','tenacity','22','5','1','240','5','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','5','1','241','5','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','5','1','242','5','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','5','1','243','5','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','5','1','244','5','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','5','1','245','5','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','5','1','246','5','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','5','1','247','5','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','5','1','248','5','SOA');
-- Tenacity Tier II
INSERT INTO `traits` VALUES ('117','tenacity','22','25','2','240','7','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','25','2','241','7','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','25','2','242','7','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','25','2','243','7','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','25','2','244','7','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','25','2','245','7','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','25','2','246','7','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','25','2','247','7','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','25','2','248','7','SOA');
-- Tenacity Tier III
INSERT INTO `traits` VALUES ('117','tenacity','22','45','3','240','9','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','45','3','241','9','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','45','3','242','9','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','45','3','243','9','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','45','3','244','9','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','45','3','245','9','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','45','3','246','9','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','45','3','247','9','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','45','3','248','9','SOA');
-- Tenacity Tier IV
INSERT INTO `traits` VALUES ('117','tenacity','22','75','4','240','11','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','75','4','241','11','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','75','4','242','11','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','75','4','243','11','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','75','4','244','11','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','75','4','245','11','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','75','4','246','11','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','75','4','247','11','SOA');
INSERT INTO `traits` VALUES ('117','tenacity','22','75','4','248','11','SOA');
-- Magic Def Tiers I ~ IV --
INSERT INTO `traits` VALUES ('6','magic def. bonus','22','10','1','29','10','SOA');
INSERT INTO `traits` VALUES ('6','magic def. bonus','22','30','2','29','12','SOA');
INSERT INTO `traits` VALUES ('6','magic def. bonus','22','50','3','29','14','SOA');
INSERT INTO `traits` VALUES ('6','magic def. bonus','22','70','4','29','16','SOA');
-- Auto Regen Tiers I ~ II --
INSERT INTO `traits` VALUES ('9','auto regen','22','35','1','370','1','SOA');
INSERT INTO `traits` VALUES ('9','auto regen','22','65','2','370','2','SOA');

-- --- GEOMANCER --- --
-- Conserve MP Tiers I ~ V --
INSERT INTO `traits` VALUES ('13','conserve mp','21','10','1','296','25','SOA');
INSERT INTO `traits` VALUES ('13','conserve mp','21','25','2','296','28','SOA');
INSERT INTO `traits` VALUES ('13','conserve mp','21','40','3','296','31','SOA');
INSERT INTO `traits` VALUES ('13','conserve mp','21','55','4','296','34','SOA');
INSERT INTO `traits` VALUES ('13','conserve mp','21','70','5','296','37','SOA');
-- Clear Mind Tiers I ~ III
INSERT INTO `traits` VALUES ('24','clear mind','21','20','1','71','3','SOA');
INSERT INTO `traits` VALUES ('24','clear mind','21','40','2','71','6','SOA');
INSERT INTO `traits` VALUES ('24','clear mind','21','60','3','71','9','SOA');
INSERT INTO `traits` VALUES ('24','clear mind','21','60','3','295','1','SOA');
-- Max MP Boost Tiers I ~ II
INSERT INTO `traits` VALUES ('8','max mp boost','21','30','1','5','10','SOA');
INSERT INTO `traits` VALUES ('8','max mp boost','21','60','2','5','20','SOA');
