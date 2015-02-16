-- ---------------------------------------------------------------------------
-- This file adds onto, modifies, or removes portions of the table "mob_droplist"
-- created by the file mob_droplist.sql and must be imported/executed AFTER that file.
--
-- For new entries DarkStar does not have, use "INSERT INTO"
-- For changing entries that already exist use "REPLACE INTO"
-- REPLACE tells MySQL to delete the old line and insert the new one.
-- Using the wrong 1 of these 2 commands will result in errors.
--
-- To REMOVE a drop that DarkStar has we don't want in Legion, use:
-- DELETE FROM `mob_droplist` WHERE `dropid`=0 and `type`=0 and `itemid`=0 `droprate`=0;
-- Where the zero is replaced by whatever values DarkStar was using.
--
-- Please comment what is dropping from what mob on each line:
-- REPLACE INTO '`mob_droplist` VALUES (dropid,type,itemid,droprate); -- Item name from NM name
-- ---------------------------------------------------------------------------

-- Examples
-- DELETE FROM `mob_droplist` WHERE 'dropid'=1 and 'type'=2 and 'itemid'=3 'droprate'=4;
-- INSERT INTO `mob_droplist` VALUES (5,6,7,8);
-- REPLACE INTO `mob_droplist` VALUES (9,10,11,12);

DELETE FROM `mob_droplist` WHERE `dropId`=92 and `type`=0 and `itemId`=3089 and `rate`=100; -- Orobon Cheekmeat from Ancient Orbon
DELETE FROM `mob_droplist` WHERE `dropId`=92 and `type`=0 and `itemId`=5563 and `rate`=100; -- Orobon Meat from Ancient Orbon
INSERT INTO `mob_droplist` VALUES (92,0,3172,60); -- Orison seal leg from Cep-Kamuy to Ancient Orbon
INSERT INTO `mob_droplist` VALUES (92,0,3181,60); -- Unkai seal leg from Cep-Kamuy to Ancient Orbon
INSERT INTO `mob_droplist` VALUES (92,0,3177,60); -- Bale seal leg from Cep-Kamuy to Ancient Orbon
INSERT INTO `mob_droplist` VALUES (92,0,3185,60); -- Mavi seal leg from Cep-Kamuy to Ancient Orbon

DELETE FROM `mob_droplist` WHERE `dropId`=186 and `type`=0 and `itemId`=3176 and `rate`=100; -- Creed seal leg from Asanbosam
DELETE FROM `mob_droplist` WHERE `dropId`=186 and `type`=0 and `itemId`=3179 and `rate`=100; -- Aoidos seal leg from Asanbosam
DELETE FROM `mob_droplist` WHERE `dropId`=186 and `type`=0 and `itemId`=3180 and `rate`=100; -- Sylvan seal leg from Asanbosam
DELETE FROM `mob_droplist` WHERE `dropId`=186 and `type`=0 and `itemId`=3185 and `rate`=100; -- Mavi seal leg from Asanbosam
INSERT INTO `mob_droplist` VALUES (186,0,3176,450); -- Creed seal leg from Asanbosam
INSERT INTO `mob_droplist` VALUES (186,0,3176,480); -- Creed seal leg from Asanbosam
INSERT INTO `mob_droplist` VALUES (186,0,3179,460); -- Aoidos seal leg from Asanbosam
INSERT INTO `mob_droplist` VALUES (186,0,3179,490); -- Aoidos seal leg from Asanbosam
INSERT INTO `mob_droplist` VALUES (186,0,3180,430); -- Sylvan seal leg from Asanbosam
INSERT INTO `mob_droplist` VALUES (186,0,3180,460); -- Sylvan seal leg from Asanbosam
INSERT INTO `mob_droplist` VALUES (186,0,3185,410); -- Mavi seal leg from Asanbosam
INSERT INTO `mob_droplist` VALUES (186,0,3185,430); -- Mavi seal leg from Asanbosam

DELETE FROM `mob_droplist` WHERE `dropId`=198 and `type`=0 and `itemId`=3171 and `rate`=600; -- Tantra seal leg from Athamas
DELETE FROM `mob_droplist` WHERE `dropId`=198 and `type`=0 and `itemId`=3171 and `rate`=300; -- Tantra seal leg from Athamas
DELETE FROM `mob_droplist` WHERE `dropId`=198 and `type`=0 and `itemId`=3171 and `rate`=200; -- Tantra seal leg from Athamas
DELETE FROM `mob_droplist` WHERE `dropId`=198 and `type`=0 and `itemId`=3171 and `rate`=150; -- Tantra seal leg from Athamas
DELETE FROM `mob_droplist` WHERE `dropId`=198 and `type`=0 and `itemId`=3171 and `rate`=120; -- Tantra seal leg from Athamas
DELETE FROM `mob_droplist` WHERE `dropId`=198 and `type`=0 and `itemId`=3175 and `rate`=320; -- Raider's seal leg from Athamas
DELETE FROM `mob_droplist` WHERE `dropId`=198 and `type`=0 and `itemId`=3175 and `rate`=160; -- Raider's seal leg from Athamas
DELETE FROM `mob_droplist` WHERE `dropId`=198 and `type`=0 and `itemId`=3175 and `rate`=110; -- Raider's seal leg from Athamas
DELETE FROM `mob_droplist` WHERE `dropId`=198 and `type`=0 and `itemId`=3175 and `rate`=80; -- Raider's seal leg from Athamas
DELETE FROM `mob_droplist` WHERE `dropId`=198 and `type`=0 and `itemId`=3182 and `rate`=460; -- Iga seal leg from Athamas
DELETE FROM `mob_droplist` WHERE `dropId`=198 and `type`=0 and `itemId`=3182 and `rate`=230; -- Iga seal leg from Athamas
DELETE FROM `mob_droplist` WHERE `dropId`=198 and `type`=0 and `itemId`=3182 and `rate`=150; -- Iga seal leg from Athamas
DELETE FROM `mob_droplist` WHERE `dropId`=198 and `type`=0 and `itemId`=3182 and `rate`=110; -- Iga seal leg from Athamas
DELETE FROM `mob_droplist` WHERE `dropId`=198 and `type`=0 and `itemId`=3182 and `rate`=90; -- Iga seal leg from Athamas
DELETE FROM `mob_droplist` WHERE `dropId`=198 and `type`=0 and `itemId`=3188 and `rate`=320; -- Charis seal leg from Athamas
DELETE FROM `mob_droplist` WHERE `dropId`=198 and `type`=0 and `itemId`=3188 and `rate`=160; -- Charis seal leg from Athamas
DELETE FROM `mob_droplist` WHERE `dropId`=198 and `type`=0 and `itemId`=3188 and `rate`=110; -- Charis seal leg from Athamas
DELETE FROM `mob_droplist` WHERE `dropId`=198 and `type`=0 and `itemId`=3188 and `rate`=80; -- Charis seal leg from Athamas
DELETE FROM `mob_droplist` WHERE `dropId`=198 and `type`=0 and `itemId`=3188 and `rate`=60; -- Charis seal leg from Athamas
INSERT INTO `mob_droplist` VALUES (198,0,3171,600); -- Tantra seal leg from Athamas
INSERT INTO `mob_droplist` VALUES (198,0,3171,630); -- Tantra seal leg from Athamas
INSERT INTO `mob_droplist` VALUES (198,0,3175,320); -- Raider's seal leg from Athamas
INSERT INTO `mob_droplist` VALUES (198,0,3175,350); -- Raider's seal leg from Athamas
INSERT INTO `mob_droplist` VALUES (198,0,3182,460); -- Iga seal leg from Athamas
INSERT INTO `mob_droplist` VALUES (198,0,3182,490); -- Iga seal leg from Athamas
INSERT INTO `mob_droplist` VALUES (198,0,3188,320); -- Charis seal leg from Athamas
INSERT INTO `mob_droplist` VALUES (198,0,3188,350); -- Charis seal leg from Athamas

INSERT INTO `mob_droplist` VALUES (534,0,11434,60); -- Sapientia Sabots From Div-e Sepid to Clammy Imp
INSERT INTO `mob_droplist` VALUES (534,0,3206,60); -- Navarch's seal feet From Div-e Sepid to Clammy Imp
INSERT INTO `mob_droplist` VALUES (534,0,3192,60); -- Orison seal feet From Div-e Sepid to Clammy Imp
INSERT INTO `mob_droplist` VALUES (534,0,3208,60); -- Charis seal feet From Div-e Sepid to Clammy Imp
INSERT INTO `mob_droplist` VALUES (534,0,3190,60); -- Ravager's seal feet From Div-e Sepid to Clammy Imp

DELETE FROM `mob_droplist` WHERE `dropId`=551 and `type`=0 and `itemId`=2150 and `rate`=380; -- Colibri Feather from Coastal Colibri
DELETE FROM `mob_droplist` WHERE `dropId`=551 and `type`=2 and `itemId`=2171 and `rate`=0; -- Colibri Beak from Coastal Colibri
DELETE FROM `mob_droplist` WHERE `dropId`=551 and `type`=0 and `itemId`=2171 and `rate`=80; -- Colibri Beak from Coastal Colibri
DELETE FROM `mob_droplist` WHERE `dropId`=551 and `type`=0 and `itemId`=3092 and `rate`=200; -- Mocking Beak from Coastal Colibri
INSERT INTO `mob_droplist` VALUES (551,0,3183,60); -- Lancer seal leg from Avalerion to Coastal colibri
INSERT INTO `mob_droplist` VALUES (551,0,3179,60); -- Aoidos seal leg from Avalerion to Coastal colibri
INSERT INTO `mob_droplist` VALUES (551,0,3189,60); -- Savant's seal leg from Avalerion to Coastal
INSERT INTO `mob_droplist` VALUES (551,0,3171,60); -- Tantra seal leg from Avalerion to Coastal colibri

DELETE FROM `mob_droplist` WHERE `dropId`=1774 and `type`=0 and `itemId`=3194 and `rate`=100; -- Estoqueur`s Seal Feet from Iktomi
DELETE FROM `mob_droplist` WHERE `dropId`=1774 and `type`=0 and `itemId`=3195 and `rate`=100; -- Raider`s Seal Feet from Iktomi
DELETE FROM `mob_droplist` WHERE `dropId`=1774 and `type`=0 and `itemId`=3196 and `rate`=100; -- Creed Seal Feet from Iktomi
DELETE FROM `mob_droplist` WHERE `dropId`=1774 and `type`=0 and `itemId`=3201 and `rate`=100; -- Unkai Seal Feet from Iktomi
INSERT INTO `mob_droplist` VALUES (1774,0,3194,320); -- Estoqueur`s Seal Feet from Iktomi
INSERT INTO `mob_droplist` VALUES (1774,0,3194,350); -- Estoqueur`s Seal Feet from Iktomi
INSERT INTO `mob_droplist` VALUES (1774,0,3195,330); -- Raider`s Seal Feet from Iktomi
INSERT INTO `mob_droplist` VALUES (1774,0,3195,360); -- Raider`s Seal Feet from Iktomi
INSERT INTO `mob_droplist` VALUES (1774,0,3196,490); -- Creed Seal Feet from Iktomi
INSERT INTO `mob_droplist` VALUES (1774,0,3196,520); -- Creed Seal Feet from Iktomi
INSERT INTO `mob_droplist` VALUES (1774,0,3201,480); -- Unkai Seal Feet from Iktomi
INSERT INTO `mob_droplist` VALUES (1774,0,3201,510); -- Unkai Seal Feet from Iktomi
INSERT INTO `mob_droplist` VALUES (1841,0,3191,60); -- Tantra Seal Feet from Iku-Turso to Jasconius
INSERT INTO `mob_droplist` VALUES (1841,0,3202,60); -- Iga Seal Feet from Iku-Turso to Jasconius
INSERT INTO `mob_droplist` VALUES (1841,0,3195,60); -- Raider`s Seal Feet from Iku-Turso to Jasconius
INSERT INTO `mob_droplist` VALUES (1841,0,3208,60); -- Charis Seal Feet from Iku-Turso to Jasconius
INSERT INTO `mob_droplist` VALUES (1841,0,19057,60); -- Caucus Grip from Iku-Turso to Jasconius

INSERT INTO `mob_droplist` VALUES (2473,0,20762,150); -- ukudyoni

INSERT INTO `mob_droplist` VALUES (2487,0,28440,150); -- Windbuffet Belt +1

DELETE FROM `mob_droplist` WHERE `dropId`=3299 and `type`=0 and `itemId`=3107 and `rate`=180; -- Shockshroom used to spawn Armillaria
INSERT INTO `mob_droplist` VALUES (3299,0,3203,60); -- Lancer`s Seal Feet from Armillaria to Speltercap
INSERT INTO `mob_droplist` VALUES (3299,0,3190,60); -- Ravager`s Seal Feet from Armillaria to Speltercap
INSERT INTO `mob_droplist` VALUES (3299,0,3195,60); -- Raiders`s Seal Feet from Armillaria to Speltercap
INSERT INTO `mob_droplist` VALUES (3299,0,3208,60); -- Charis Seal Feet from Armillaria to Speltercap
INSERT INTO `mob_droplist` VALUES (3299,0,18803,60); -- Pax Grip from Armillaria to Speltercap

-- ----------
-- SORT ME
INSERT INTO `mob_droplist` VALUES (222,0,3292,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (3106,0,2967,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (1966,0,2932,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (52,0,3291,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (424,0,2966,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (962,0,2931,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (1810,0,3290,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (529,0,2965,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (466,0,2930,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (151,0,3289,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (3273,0,2964,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (396,0,2929,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (2721,0,3287,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (1812,0,2962,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4527,0,2927,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (788,0,3288,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (3648,0,2963,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (222,0,3292,200); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (3106,0,2967,200); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (1966,0,2932,200); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (52,0,3291,200); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (424,0,2966,200); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (962,0,2931,200); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (1810,0,3290,200); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (529,0,2965,200); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (466,0,2930,200); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (151,0,3289,200); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (3273,0,2964,200); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (396,0,2929,200); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (2721,0,3287,200); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (1812,0,2962,200); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4527,0,2927,200); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (788,0,3288,200); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (3648,0,2963,200); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4523,0,2928,200); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (788,0,10255,240); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (3648,0,19399,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (3241,0,19410,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (1812,0,19400,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (2732,0,18574,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4519,0,19401,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (838,0,19407,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (424,0,19409,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (3273,0,19408,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (75,0,19405,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (529,0,19406,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (1621,0,16192,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (3632,0,19403,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (1786,0,19404,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (3106,0,19398,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (727,0,19402,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (1645,0,19397,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (231,0,12097,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (3632,0,12096,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (838,0,12091,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4519,0,12103,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4531,0,12104,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (229,0,12106,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (1668,0,12095,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4542,0,12101,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4543,0,12089,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (2080,0,12100,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (32,0,12094,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (83,0,12105,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (321,0,12098,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (1794,0,12092,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (3529,0,12099,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4071,0,12107,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (203,0,12102,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (1786,0,12093,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (1966,0,12088,340); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (962,0,12090,340); -- COMMENT ME
-- SORT ME!!!!!
-- -----------

INSERT INTO `mob_droplist` VALUES (4516,0,19302,330); -- COMMENT ME


DELETE FROM `mob_droplist` WHERE `dropId`=4519 and `type`=0 and `itemId`=17854 and `rate`=133; -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4519,0,13791,420); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4519,0,11733,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4519,0,11637,700); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4519,0,3225,550); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4519,0,3224,550); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4519,0,20787,108); -- COMMENT ME
DELETE FROM `mob_droplist` WHERE `dropId`=4520 and `type`=0 and `itemId`=11409 and `rate`=167; -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4520,0,11525,520); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4521,0,11594,108); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4521,0,11735,631); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4523,0,2928,245); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4523,0,2928,82); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4522,0,11642,250); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4523,0,11509,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4523,0,12741,796); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4523,0,14888,186); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4523,0,3225,193); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4523,0,3223,217); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4523,0,20553,101); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4523,0,2928,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4524,0,11595,102); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4524,0,17185,592); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4524,0,2933,830); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4524,0,2933,91); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4524,0,646,500); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4524,0,646,130); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4525,0,17626,373); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4525,0,11592,55); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4525,0,2939,620); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4525,0,2939,120); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4526,0,19249,300); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4526,0,3223,217); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4526,0,3225,193); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4527,0,11508,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4527,0,11523,250); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4527,0,3222,288); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4527,0,3225,266); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4527,0,21013,104); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4527,0,2927,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4527,0,2927,420); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4528,0,12388,500); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4529,0,11564,420); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4530,0,19250,386); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4531,0,11521,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4531,0,11729,92); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4531,0,11507,231); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4531,0,3224,142); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4531,0,3222,142); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4531,0,20641,103); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4532,0,11604,250); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4532,0,11737,420); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4532,0,11596,415); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4532,0,18510,320); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4532,0,3222,288); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4532,0,3224,230); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4533,0,15019,386); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4533,0,11597,84); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4533,0,20833,103); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4534,0,18510,654); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4534,0,11596,141); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4535,0,11596,286); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4536,0,17113,152); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4536,0,11548,200); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4536,0,11517,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4536,0,3222,150); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4536,0,3223,151); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4537,0,15429,252); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4538,0,11551,174); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4538,0,11605,230); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4539,0,11741,474); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4539,0,3225,274); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4539,0,3223,370); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4539,0,3224,234); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4539,0,3222,434); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4540,0,11641,320); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4541,0,11640,420); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4542,0,28576,225); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4542,0,11646,200); -- Sirona's Ring from Pascerpot
INSERT INTO `mob_droplist` VALUES (4542,0,3196,350); -- Creed seal feet from Pascerpot
INSERT INTO `mob_droplist` VALUES (4542,0,3196,380); -- Creed seal feet from Pascerpot
INSERT INTO `mob_droplist` VALUES (4542,0,3202,280); -- Iga seal feet from Pascerpot
INSERT INTO `mob_droplist` VALUES (4542,0,3202,310); -- Iga seal feet from Pascerpot
INSERT INTO `mob_droplist` VALUES (4542,0,3206,330); -- Navarch's seal feet from Pascerpot
INSERT INTO `mob_droplist` VALUES (4542,0,3206,360); -- Navarch's seal feet from Pascerpot
INSERT INTO `mob_droplist` VALUES (4542,0,3191,400); -- Tantra seal feet from Pascerpot
INSERT INTO `mob_droplist` VALUES (4542,0,3191,430); -- Tantra seal feet from Pascerpot
INSERT INTO `mob_droplist` VALUES (4543,0,28404,225); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4543,0,11361,87); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4543,0,19255,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4543,0,19256,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4543,0,11750,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4544,0,18551,230); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4544,0,19132,240); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4544,0,15959,300); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4544,0,11625,300); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4544,0,16259,250); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4544,0,11363,200); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4544,0,11798,200); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4544,0,11362,200); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4544,0,3925,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4544,0,3925,100); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4545,0,15807,140); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4545,0,4023,1000); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4545,0,4023,250); -- COMMENT ME
INSERT INTO `mob_droplist` VALUES (4545,0,4023,50); -- COMMENT ME


-- -------- Begin Legion Drop-- In Progress - Jewels-Trophy-MainGear Only ATM -----


INSERT INTO `mob_droplist` VALUES (9000,0,3925,200);


INSERT INTO `mob_droplist` VALUES (9001,0,3925,200);


INSERT INTO `mob_droplist` VALUES (9002,0,3925,200);


INSERT INTO `mob_droplist` VALUES (9003,0,3925,200);


INSERT INTO `mob_droplist` VALUES (9004,0,3925,200);


INSERT INTO `mob_droplist` VALUES (9005,0,3925,200);

INSERT INTO `mob_droplist` VALUES (9006,0,3925,1000); -- Harpia - Feet
INSERT INTO `mob_droplist` VALUES (9006,0,3529,1000);
INSERT INTO `mob_droplist` VALUES (9006,0,3925,200);
INSERT INTO `mob_droplist` VALUES (9006,0,28345,100);
INSERT INTO `mob_droplist` VALUES (9006,0,28344,100);
INSERT INTO `mob_droplist` VALUES (9006,0,28342,100);
INSERT INTO `mob_droplist` VALUES (9006,0,28327,100);
INSERT INTO `mob_droplist` VALUES (9006,0,28328,100);
INSERT INTO `mob_droplist` VALUES (9006,0,28329,100);


INSERT INTO `mob_droplist` VALUES (9020,0,3925,200);


INSERT INTO `mob_droplist` VALUES (9021,0,3925,200);


INSERT INTO `mob_droplist` VALUES (9022,0,3925,200);


INSERT INTO `mob_droplist` VALUES (9023,0,3925,200);


INSERT INTO `mob_droplist` VALUES (9024,0,3925,200);

INSERT INTO `mob_droplist` VALUES (9025,0,3925,200);

INSERT INTO `mob_droplist` VALUES (9026,0,3925,1000); -- Mantis - Legs
INSERT INTO `mob_droplist` VALUES (9026,0,3530,1000);
INSERT INTO `mob_droplist` VALUES (9026,0,3925,200);
INSERT INTO `mob_droplist` VALUES (9026,0,28205,100);
INSERT INTO `mob_droplist` VALUES (9026,0,28204,100);
INSERT INTO `mob_droplist` VALUES (9026,0,28203,100);
INSERT INTO `mob_droplist` VALUES (9026,0,28188,100);
INSERT INTO `mob_droplist` VALUES (9026,0,28189,100);
INSERT INTO `mob_droplist` VALUES (9026,0,28190,100);

INSERT INTO `mob_droplist` VALUES (9030,0,3925,400);
INSERT INTO `mob_droplist` VALUES (9030,0,3925,200);

INSERT INTO `mob_droplist` VALUES (9031,0,3925,400);
INSERT INTO `mob_droplist` VALUES (9031,0,3925,200);

INSERT INTO `mob_droplist` VALUES (9032,0,3925,400);
INSERT INTO `mob_droplist` VALUES (9032,0,3925,200);

INSERT INTO `mob_droplist` VALUES (9033,0,3925,400);
INSERT INTO `mob_droplist` VALUES (9033,0,3925,200);

INSERT INTO `mob_droplist` VALUES (9034,0,3925,400);
INSERT INTO `mob_droplist` VALUES (9034,0,3925,200);

INSERT INTO `mob_droplist` VALUES (9035,0,3925,400);
INSERT INTO `mob_droplist` VALUES (9035,0,3925,200);

INSERT INTO `mob_droplist` VALUES (9036,0,3925,1000); -- Nakara - Hands
INSERT INTO `mob_droplist` VALUES (9036,0,3925,1000);
INSERT INTO `mob_droplist` VALUES (9036,0,3531,1000);
INSERT INTO `mob_droplist` VALUES (9036,0,3925,200);
INSERT INTO `mob_droplist` VALUES (9036,0,28065,100);
INSERT INTO `mob_droplist` VALUES (9036,0,28064,100);
INSERT INTO `mob_droplist` VALUES (9036,0,28061,100);
INSERT INTO `mob_droplist` VALUES (9036,0,28046,100);
INSERT INTO `mob_droplist` VALUES (9036,0,28047,100);
INSERT INTO `mob_droplist` VALUES (9036,0,28048,100);

INSERT INTO `mob_droplist` VALUES (9040,0,3925,500);
INSERT INTO `mob_droplist` VALUES (9040,0,3925,200);

INSERT INTO `mob_droplist` VALUES (9041,0,3925,500);
INSERT INTO `mob_droplist` VALUES (9041,0,3925,200);

INSERT INTO `mob_droplist` VALUES (9042,0,3925,500);
INSERT INTO `mob_droplist` VALUES (9042,0,3925,200);

INSERT INTO `mob_droplist` VALUES (9043,0,3925,500);
INSERT INTO `mob_droplist` VALUES (9043,0,3925,200);

INSERT INTO `mob_droplist` VALUES (9044,0,3925,500);
INSERT INTO `mob_droplist` VALUES (9044,0,3925,200);

INSERT INTO `mob_droplist` VALUES (9045,0,3925,500);
INSERT INTO `mob_droplist` VALUES (9045,0,3925,200);

INSERT INTO `mob_droplist` VALUES (9046,0,3925,1000); -- Iron Clad - Heads
INSERT INTO `mob_droplist` VALUES (9046,0,3925,1000);
INSERT INTO `mob_droplist` VALUES (9046,0,3532,1000);
INSERT INTO `mob_droplist` VALUES (9046,0,3925,200);
INSERT INTO `mob_droplist` VALUES (9046,0,27785,100);
INSERT INTO `mob_droplist` VALUES (9046,0,27784,100);
INSERT INTO `mob_droplist` VALUES (9046,0,27782,100);
INSERT INTO `mob_droplist` VALUES (9046,0,27763,100);
INSERT INTO `mob_droplist` VALUES (9046,0,27762,100);
INSERT INTO `mob_droplist` VALUES (9046,0,27761,100);

INSERT INTO `mob_droplist` VALUES (9050,0,3925,1000);
INSERT INTO `mob_droplist` VALUES (9050,0,3925,1000);
INSERT INTO `mob_droplist` VALUES (9050,0,3925,200);
INSERT INTO `mob_droplist` VALUES (9050,0,3529,200);

INSERT INTO `mob_droplist` VALUES (9051,0,3925,1000);
INSERT INTO `mob_droplist` VALUES (9051,0,3925,1000);
INSERT INTO `mob_droplist` VALUES (9051,0,3925,200);
INSERT INTO `mob_droplist` VALUES (9051,0,3530,200);

INSERT INTO `mob_droplist` VALUES (9052,0,3925,1000);
INSERT INTO `mob_droplist` VALUES (9052,0,3925,1000);
INSERT INTO `mob_droplist` VALUES (9052,0,3925,200);
INSERT INTO `mob_droplist` VALUES (9052,0,3531,200);

INSERT INTO `mob_droplist` VALUES (9053,0,3925,1000);
INSERT INTO `mob_droplist` VALUES (9053,0,3925,1000);
INSERT INTO `mob_droplist` VALUES (9053,0,3925,200);
INSERT INTO `mob_droplist` VALUES (9053,0,3532,200);

INSERT INTO `mob_droplist` VALUES (9054,0,3925,1000); -- Gallu - Bodies
INSERT INTO `mob_droplist` VALUES (9054,0,3925,1000);
INSERT INTO `mob_droplist` VALUES (9054,0,3925,200);
INSERT INTO `mob_droplist` VALUES (9054,0,4851,200);
INSERT INTO `mob_droplist` VALUES (9054,0,27925,200);
INSERT INTO `mob_droplist` VALUES (9054,0,27924,200);
INSERT INTO `mob_droplist` VALUES (9054,0,27922,200);
INSERT INTO `mob_droplist` VALUES (9054,0,27907,200);
INSERT INTO `mob_droplist` VALUES (9054,0,27908,200);
INSERT INTO `mob_droplist` VALUES (9054,0,27909,200);

INSERT INTO `mob_droplist` VALUES (9055,0,3925,1000);
INSERT INTO `mob_droplist` VALUES (9055,0,3925,1000);
INSERT INTO `mob_droplist` VALUES (9055,0,3925,200);
INSERT INTO `mob_droplist` VALUES (9055,0,4851,200);

INSERT INTO `mob_droplist` VALUES (9056,0,3925,1000);
INSERT INTO `mob_droplist` VALUES (9056,0,3925,1000);
INSERT INTO `mob_droplist` VALUES (9056,0,3925,200);
INSERT INTO `mob_droplist` VALUES (9056,0,4851,200);

INSERT INTO `mob_droplist` VALUES (9057,0,3925,1000);
INSERT INTO `mob_droplist` VALUES (9057,0,3925,1000);
INSERT INTO `mob_droplist` VALUES (9057,0,3925,200);
INSERT INTO `mob_droplist` VALUES (9057,0,4851,200);

INSERT INTO `mob_droplist` VALUES (9058,0,3925,1000);
INSERT INTO `mob_droplist` VALUES (9058,0,3925,1000);
INSERT INTO `mob_droplist` VALUES (9058,0,3925,200);
INSERT INTO `mob_droplist` VALUES (9058,0,4851,200);

INSERT INTO `mob_droplist` VALUES (9059,0,3925,1000);
INSERT INTO `mob_droplist` VALUES (9059,0,3925,1000);
INSERT INTO `mob_droplist` VALUES (9059,0,3925,200);
INSERT INTO `mob_droplist` VALUES (9059,0,4851,200);

-- ------ End Legion


-- New 7 HNM
INSERT INTO `mob_droplist` VALUES (9084,0,20548,225);
INSERT INTO `mob_droplist` VALUES (9084,0,27774,70);
INSERT INTO `mob_droplist` VALUES (9084,0,27766,70);
INSERT INTO `mob_droplist` VALUES (9084,0,21389,350);
INSERT INTO `mob_droplist` VALUES (9084,0,21429,350);
INSERT INTO `mob_droplist` VALUES (9084,0,20818,450);
INSERT INTO `mob_droplist` VALUES (9085,0,10597,72);
INSERT INTO `mob_droplist` VALUES (9085,0,20738,220);
INSERT INTO `mob_droplist` VALUES (9085,0,27781,66);
INSERT INTO `mob_droplist` VALUES (9085,0,28201,63);
INSERT INTO `mob_droplist` VALUES (9085,0,28463,70);
INSERT INTO `mob_droplist` VALUES (9085,0,28663,370);
INSERT INTO `mob_droplist` VALUES (9089,0,20861,225);
INSERT INTO `mob_droplist` VALUES (9089,0,27779,67);
INSERT INTO `mob_droplist` VALUES (9089,0,28381,325);
INSERT INTO `mob_droplist` VALUES (9089,0,28062,66);
INSERT INTO `mob_droplist` VALUES (9089,0,28579,69);
INSERT INTO `mob_droplist` VALUES (9090,0,21176,220);
INSERT INTO `mob_droplist` VALUES (9090,0,28050,70);
INSERT INTO `mob_droplist` VALUES (9090,0,28331,70);
INSERT INTO `mob_droplist` VALUES (9090,0,28389,350);
INSERT INTO `mob_droplist` VALUES (9090,0,28449,320);
INSERT INTO `mob_droplist` VALUES (9090,0,20819,420);
INSERT INTO `mob_droplist` VALUES (9091,0,20618,350);
INSERT INTO `mob_droplist` VALUES (9091,0,20997,369);
INSERT INTO `mob_droplist` VALUES (9091,0,27780,67);
INSERT INTO `mob_droplist` VALUES (9091,0,28343,65);
INSERT INTO `mob_droplist` VALUES (9091,0,28401,69);
INSERT INTO `mob_droplist` VALUES (9093,0,21052,220);
INSERT INTO `mob_droplist` VALUES (9093,0,27767,72);
INSERT INTO `mob_droplist` VALUES (9093,0,28201,72);
INSERT INTO `mob_droplist` VALUES (9093,0,28354,332);
INSERT INTO `mob_droplist` VALUES (9093,0,28535,336);
INSERT INTO `mob_droplist` VALUES (9105,0,20762,220);
INSERT INTO `mob_droplist` VALUES (9105,0,20905,220);
INSERT INTO `mob_droplist` VALUES (9105,0,21421,360);
INSERT INTO `mob_droplist` VALUES (9105,0,27781,60);
INSERT INTO `mob_droplist` VALUES (9105,0,28337,80);


