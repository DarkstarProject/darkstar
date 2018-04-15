-- Change rare/ex gear to normal gear

-- Argus
DELETE FROM `mob_droplist` WHERE dropId=174 and dropType=0 and itemId=15515 and itemRate=230; -- Peacock Amulet
INSERT INTO `mob_droplist` VALUES (174,0,0,1000,13056,80); -- Peacock Charm
-- Leaping Lizzy
DELETE FROM `mob_droplist` WHERE dropId=2036 and dropType=0 and itemId=15351 and itemRate=70; -- Bounding Boots
INSERT INTO `mob_droplist` VALUES (2036,0,0,1000,13014,70); -- Leaping Boots
-- Valkrum Emperor
DELETE FROM `mob_droplist` WHERE dropId=3678 and dropType=0 and itemId=15224 and itemRate=160; -- comment me
INSERT INTO `mob_droplist` VALUES (3678,0,0,1000,12486,72); -- Emperor Hairpin
-- Mee Deggi the Punisher
DELETE FROM `mob_droplist` WHERE dropId=2238 and dropType=0 and itemId=14986 and itemRate=50; -- Ochimusha Kote
INSERT INTO `mob_droplist` VALUES (2238,0,0,1000,13952,74); -- Ochiudo's Kote
-- Simurgh
DELETE FROM `mob_droplist` WHERE dropId=3208 and dropType=0 and itemId=15736 and itemRate=100; -- Trotter Boots
INSERT INTO `mob_droplist` VALUES (3208,0,0,1000,14080,76); -- Strider Boots
-- Stroper Chyme
DELETE FROM `mob_droplist` WHERE dropId=3387 and dropType=0 and itemId=15551 and itemRate=20; -- Shikaree Ring
INSERT INTO `mob_droplist` VALUES (3387,0,0,1000,13514,35); -- Archer Ring
-- Quu Domi the Gallant
DELETE FROM `mob_droplist` WHERE dropId=2916 and dropType=0 and itemId=15737 and itemRate=70; -- Sarutobi kyahan
INSERT INTO `mob_droplist` VALUES (2916,0,0,1000,13054,77); -- Fuma Kyahan
-- Eastern Shadow
DELETE FROM `mob_droplist` WHERE dropId=835 and dropType=0 and itemId=18714 and itemRate=90; -- Vali's Bow
UPDATE mob_droplist SET itemId = 17187 WHERE itemId = 18714; -- Euryto's Bow
-- King Arthro
DELETE FROM `mob_droplist` WHERE dropId=1935 and dropType=0 and itemId=15899 and itemRate=80; -- comment me
INSERT INTO `mob_droplist` VALUES (1935,0,0,1000,13189,80); -- Speed Belt


