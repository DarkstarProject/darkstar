create table trust_list 
(
trustid smallint(4) unsigned not null auto-increment,
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
trust_rngSlot smallint(5) unsigned not null default 0
PRIMARY KEY(trustid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


insert into trust_list values (1, 'Shantotto', 32, 0x0000B80B00000000000000000000000000000000, 1, 99, 153, 4, 0, 0, 0, 0)
insert into trust_list values (2, 'Naji', 32, 0x0000B90B00000000000000000000000000000000, 1, 99, 149, 1, 0, 16520, 0, 0)
insert into trust_list values (3, 'Kupipi', 32, 0x0000BA0B00000000000000000000000000000000, 1, 99, 153, 3, 0, 17043, 0, 0)
insert into trust_list values (4, 'Excenmille', 32, 0x0000BB0B00000000000000000000000000000000, 1, 99, 145, 7, 0, 16848, 0, 0)