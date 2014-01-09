/*
MySQL Data Transfer
Source Host: localhost
Source Database: dspdb
Target Host: localhost
Target Database: dspdb
Date: 7/9/2013 8:48:45 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for blue_spell_list
-- ----------------------------
DROP TABLE IF EXISTS `blue_spell_list`;
CREATE TABLE `blue_spell_list` (
  `spellid` smallint(3) NOT NULL,
  `mob_skill_id` smallint(4) unsigned NOT NULL,
  `set_points` smallint(2) NOT NULL,
  `trait_category` smallint(2) NOT NULL,
  `trait_category_weight` smallint(2) NOT NULL,
  `primary_sc` smallint(2) NOT NULL,
  `secondary_sc` smallint(2) NOT NULL,
  PRIMARY KEY (`spellid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `blue_spell_list` VALUES ('513','1316','3','4','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('515','206','5','4','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('517','192','1','10','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('519','196','3','18','1','1','4');
INSERT INTO `blue_spell_list` VALUES ('521','165','4','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('522','181','2','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('524','170','2','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('527','257','3','7','1','6','0');
INSERT INTO `blue_spell_list` VALUES ('529','427','2','7','1','3','0');
INSERT INTO `blue_spell_list` VALUES ('530','313','4','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('531','420','3','13','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('532','279','4','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('533','253','3','14','2','0','0');
INSERT INTO `blue_spell_list` VALUES ('534','267','4','10','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('535','1390','1','14','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('536','210','1','4','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('537','233','2','14','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('538','274','4','6','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('539','219','3','11','1','2','5');
INSERT INTO `blue_spell_list` VALUES ('540','1522','4','8','1','4','6');
INSERT INTO `blue_spell_list` VALUES ('541','229','2','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('542','177','2','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('543','23','2','12','1','7','0');
INSERT INTO `blue_spell_list` VALUES ('544','403','2','6','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('545','554','4','20','1','2','0');
INSERT INTO `blue_spell_list` VALUES ('547','90','1','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('548','108','3','4','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('549','79','1','5','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('551','82','1','12','1','5','0');
INSERT INTO `blue_spell_list` VALUES ('554','97','5','8','1','2','5');
INSERT INTO `blue_spell_list` VALUES ('555','535','3','13','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('557','293','4','6','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('560','1455','3','16','1','7','0');
INSERT INTO `blue_spell_list` VALUES ('561','245','3','14','2','0','0');
INSERT INTO `blue_spell_list` VALUES ('563','304','3','10','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('564','389','4','15','1','8','0');
INSERT INTO `blue_spell_list` VALUES ('565','565','4','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('567','366','2','0','1','1','0');
INSERT INTO `blue_spell_list` VALUES ('569','139','4','9','1','8','0');
INSERT INTO `blue_spell_list` VALUES ('570','138','2','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('572','154','1','6','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('573','1445','3','4','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('574','146','2','19','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('575','0','4','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('576','1457','3','5','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('577','1','2','3','1','6','0');
INSERT INTO `blue_spell_list` VALUES ('578','67','3','5','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('579','1451','4','14','3','0','0');
INSERT INTO `blue_spell_list` VALUES ('581','31','4','2','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('582','397','2','17','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('584','8','2','2','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('585','10','4','3','1','12','0');
INSERT INTO `blue_spell_list` VALUES ('587','17','2','3','1','4','0');
INSERT INTO `blue_spell_list` VALUES ('588','241','2','4','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('589','190','5','16','1','1','8');
INSERT INTO `blue_spell_list` VALUES ('591','544','4','6','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('592','36','2','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('593','39','3','5','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('594','328','3','8','1','3','8');
INSERT INTO `blue_spell_list` VALUES ('595','66','5','1','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('596','73','2','0','1','3','0');
INSERT INTO `blue_spell_list` VALUES ('597','431','2','1','1','5','0');
INSERT INTO `blue_spell_list` VALUES ('598','178','4','4','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('599','54','2','0','1','2','0');
INSERT INTO `blue_spell_list` VALUES ('603','46','3','1','1','1','0');
INSERT INTO `blue_spell_list` VALUES ('604','63','5','22','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('605','260','3','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('606','130','2','4','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('608','121','3','17','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('610','116','4','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('611','1128','5','16','1','10','0');
INSERT INTO `blue_spell_list` VALUES ('612','1185','4','14','4','0','0');
INSERT INTO `blue_spell_list` VALUES ('613','0','5','6','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('614','1096','3','11','1','0','0');
-- INSERT INTO `blue_spell_list` VALUES ('615','1102','5','14','4','0','0');
INSERT INTO `blue_spell_list` VALUES ('616','1111','5','8','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('617','1191','3','11','1','9','0');
INSERT INTO `blue_spell_list` VALUES ('618','392','2','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('620','353','3','8','1','8','0');
-- INSERT INTO `blue_spell_list` VALUES ('621','1471','2','4','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('622','409','2','11','1','7','0');
INSERT INTO `blue_spell_list` VALUES ('623','356','3','0','1','8','0');
INSERT INTO `blue_spell_list` VALUES ('626','335','3','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('628','825','3','15','1','8','0');
INSERT INTO `blue_spell_list` VALUES ('629','104','3','15','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('631','521','3','9','1','5','0');
INSERT INTO `blue_spell_list` VALUES ('632','1488','3','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('633','1489','5','21','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('634','529','5','14','2','0','0');
INSERT INTO `blue_spell_list` VALUES ('636','1478','4','4','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('637','1477','5','17','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('638','361','3','9','1','1','0');
INSERT INTO `blue_spell_list` VALUES ('640','1515','4','20','1','5','0');
INSERT INTO `blue_spell_list` VALUES ('641','1510','5','18','1','6','0');
INSERT INTO `blue_spell_list` VALUES ('642','1565','3','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('643','1562','3','0','1','11','0');
INSERT INTO `blue_spell_list` VALUES ('644','1707','4','4','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('645','1699','4','5','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('646','1702','4','6','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('647','1466','2','17','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('648','1897','1','19','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('650','0','4','1','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('651','1930','4','4','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('652','1925','3','12','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('653','1920','2','21','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('654','2180','4','22','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('655','0','3','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('656','2306','3','24','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('657','2308','3','25','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('658','1913','4','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('659','1845','4','24','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('660','1905','3','27','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('661','0','5','25','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('662','269','3','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('663','75','4','27','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('664','205','2','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('665','80','1','26','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('666','334','3','23','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('667','132','2','16','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('668','299','3','10','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('669','258','2','26','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('670','2373','4','23','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('671','964','4','22','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('672','2375','5','13','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('673','485','4','25','1','10','0');
INSERT INTO `blue_spell_list` VALUES ('674','0','1','20','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('675','1561','3','8','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('677','974','3','24','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('678','45','3','6','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('679','999','3','18','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('680','0','4','28','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('681','989','5','14','4','0','0');
INSERT INTO `blue_spell_list` VALUES ('682','1898','2','25','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('683','0','4','28','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('684','0','4','27','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('685','0','3','15','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('686','0','4','25','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('687','0','2','17','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('688','0','2','24','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('689','0','3','21','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('690','0','5','2','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('692','0','4','20','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('693','0','5','23','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('694','0','3','10','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('695','0','4','15','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('696','0','5','21','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('697','0','4','28','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('698','0','2','22','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('699','0','2','25','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('736','0','0','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('737','0','0','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('738','0','0','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('739','0','0','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('740','0','0','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('741','0','0','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('742','0','0','0','1','0','0');
INSERT INTO `blue_spell_list` VALUES ('743','0','0','0','1','0','0');
