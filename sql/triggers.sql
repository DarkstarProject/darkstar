SET NAMES 'utf8';

USE dspdb;

DELIMITER $$

DROP TRIGGER IF EXISTS auction_house_buy $$
CREATE TRIGGER auction_house_buy
	BEFORE UPDATE ON auction_house
	FOR EACH ROW
BEGIN
	IF NEW.sale != 0 THEN INSERT INTO delivery_box VALUES (NEW.seller, 0, 0, x'FFFF', NEW.itemid, NEW.sale, 0, 'AH-Jeuno'); END IF;
END $$

DROP TRIGGER IF EXISTS delivery_box_insert $$
CREATE TRIGGER delivery_box_insert
	BEFORE INSERT ON delivery_box
	FOR EACH ROW
BEGIN
	SET @slot := 0;
	SELECT MAX(slot) INTO @slot FROM delivery_box WHERE box = NEW.box AND charid = NEW.charid;
	IF @slot IS NULL OR @slot < 10 THEN SET NEW.slot := 10; ELSE SET NEW.slot := @slot + 1; END IF;
END $$


DROP TRIGGER IF EXISTS account_delete $$
CREATE TRIGGER account_delete
	BEFORE DELETE ON accounts
	FOR EACH ROW
BEGIN
	DELETE FROM `accounts_banned` WHERE `accid` = OLD.id;
	DELETE FROM `chars` WHERE `accid` = OLD.id;     
END $$

DROP TRIGGER IF EXISTS char_delete $$
CREATE TRIGGER char_delete
	BEFORE DELETE ON chars
	FOR EACH ROW
BEGIN
	DELETE FROM `char_exp`        WHERE `charid` = OLD.charid;
	DELETE FROM `char_jobs`       WHERE `charid` = OLD.charid;
	DELETE FROM `char_equip`      WHERE `charid` = OLD.charid;
	DELETE FROM `char_effects`    WHERE `charid` = OLD.charid;
	DELETE FROM `char_look`       WHERE `charid` = OLD.charid;
	DELETE FROM `char_stats`      WHERE `charid` = OLD.charid;
	DELETE FROM `char_skills`     WHERE `charid` = OLD.charid;
	DELETE FROM `char_titles`     WHERE `charid` = OLD.charid;
	DELETE FROM `char_inventory`  WHERE `charid` = OLD.charid;
	DELETE FROM `char_vars`       WHERE `charid` = OLD.charid;
END $$

