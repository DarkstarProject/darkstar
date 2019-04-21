create table trust_list 
(
trustid smallint(4) unsigned not null auto_increment,
trust_name varchar(30) not null, 
trust_name_prefix tinyint(4) not null default 32,
trust_look binary(20) not null,
trust_minLevel tinyint(2) unsigned not null default 1,
trust_maxLevel tinyint(2) unsigned not null default 99,
trust_mobfamilyid smallint(4) unsigned not null, 
trust_mJob tinyint(2) unsigned not null,
trust_sJob tinyint(2) unsigned not null default 0,
trust_mainSlot smallint(5) unsigned not null,
trust_subSlot smallint(5) unsigned not null default 0,
trust_rngSlot smallint(5) unsigned not null default 0,
PRIMARY KEY(trustid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


insert into trust_list values (1, 'Shantotto', 32, 0x0000B80B00000000000000000000000000000000, 1, 99, 153, 4, 0, 0, 0, 0);
insert into trust_list values (2, 'Naji', 32, 0x0000B90B00000000000000000000000000000000, 1, 99, 149, 1, 0, 16520, 0, 0);
insert into trust_list values (3, 'Kupipi', 32, 0x0000BA0B00000000000000000000000000000000, 1, 99, 153, 3, 0, 17043, 0, 0);
insert into trust_list values (4, 'Excenmille', 32, 0x0000BB0B00000000000000000000000000000000, 1, 99, 145, 7, 0, 16848, 0, 0);
insert into trust_list values (5, 'Ayame', 32, 0x0000BC0B00000000000000000000000000000000, 1, 99, 150, 12, 0, 18452, 0, 0); 
insert into trust_list values (6, 'Nanaa Mihgo', 32, 0x0000BD0B00000000000000000000000000000000, 1, 99, 152, 6, 0, 16476, 0, 0);
insert into trust_list values (7, 'Curilla', 32, 0x0000BE0B00000000000000000000000000000000, 1, 99, 145, 7, 0, 16579, 12313, 0);
insert into trust_list values (8, 'Volker', 32, 0x0000BF0B00000000000000000000000000000000, 1, 99, 149, 1, 0, 16578, 0, 0); 
insert into trust_list values (9, 'Ajido-Marujido', 32, 0x0000C00B00000000000000000000000000000000, 1, 99, 154, 4, 5, 0, 0, 0);
insert into trust_list values (10, 'Trion', 32, 0x0000C10B00000000000000000000000000000000, 1, 99, 145, 7, 1, 16571, 16172, 0);
-- insert into trust_list values (11, 'Zeid', 32, 0x0000C20B00000000000000000000000000000000, 1, 99, TODO...);
-- insert into trust_list values (12, 'Lion', 32, 0x0000C30B00000000000000000000000000000000, 1, 99, TODO...);
-- insert into trust_list values (13, 'Tenzen', 32, 0x0000C40B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (14, 'Mihli Aliapoh', 32, 0x0000C50B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (15, 'Valaineral', 32, 0x0000C60B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (16, 'Joachim', 32, 0x0000C70B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (17. 'Naja Salaheem', 32, 0x0000C80B00000000000000000000000000000000, 1, 99, TODO...) 
-- insert into trust_list values (18, 'Prishe', 32, 0x0000C90B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (19, 'Ulmia', 32, 0x0000CA0B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (20, 'Shikaree Z', 32, 0x0000CB0B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (21, 'Cherukiki', 32, 0x0000CC0B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (22, 'Iron Eater', 32, 0x0000CD0B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (23, 'Gessho', 32, 0x0000CE0B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (24, 'Gadalar', 32, 0x0000CF0B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (25, 'Rainemard', 32, 0x0000D00B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (26, 'Ingrid', 32, 0x0000D10B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (27, 'Lehko Habhoka', 32, 0x0000D20B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (28, 'Nashmeira', 32, 0x0000D30B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (29, 'Zazarg', 32, 0x0000D40B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (30, 'Ovjang', 32, 0x0000D50B00000000000000000000000000000000, 1, 99, TODO...) 
-- insert into trust_list values (31, 'Mnejing', 32, 0x0000D60B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (32, 'Sakura', 32, 0x0000D70B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (33, 'Luzaf', 32, 0x0000D80B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (34, 'Najelith', 32, 0x0000D90B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (35, 'Aldo', 32, 0x0000DA0B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (36, 'Moogle', 32, 0x0000DB0B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (37, 'Fablinix', 32, 0x0000DC0B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (38, 'Maat', 32, 0x0000DD0B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (39, 'D. Shantotto', 32, 0x0000DE0B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (40, 'Star Sibyl', 32, 0x0000DF0B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (41, 'Karaha-Baruha', 32, 0x0000E00B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (42, 'Cid', 32, 0x0000E10B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (43, 'Gilgamesh', 32, 0x0000E20B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (44, 'Areuhat', 32, 0x0000E30B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (45, 'Semih Lafihna', 32, 0x0000E40B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (46, 'Elivira', 32, 0x0000E50B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (47, 'Noillurie', 32, 0x0000E60B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (48, 'Lhu Mhakaracca', 32, 0x0000E70B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (49, 'Ferreous Coffin', 32, 0x0000E80B00000000000000000000000000000000, 1, 99, TODO...) 
-- insert into trust_list values (50, 'Lilisette', 32, 0x0000E90B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (51, 'Mumor', 32, 0x0000EA0B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (52, 'Uka Totlihn', 32, 0x0000EB0B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (53, 'Excenmille (S)', 32, 0x0000EC0B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (54, 'Klara', 32, 0x0000ED0B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (55, 'Romaa Mihgo, 32, 0x0000EE0B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (56, 'Kuyin Hathdenna', 32, 0x0000EF0B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (57, 'Rahal', 32, 0x0000F00B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (58, 'Koru-Moru', 32, 0x0000F10B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (59, 'Pieuje', 32, 0x0000F20B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (60, 'Flaviria', 32, 0x0000F30B00000000000000000000000000000000, 1, 99, TODO...)
-- insert into trust_list values (61, 'Invincible Shield', 32, 0x0000F30B00000000000000000000000000000000, 1, 99, TODO...)