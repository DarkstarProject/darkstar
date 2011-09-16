SET NAMES 'utf8';

USE dspdb;

DELIMITER $$

DROP TRIGGER IF EXISTS account_delete $$
CREATE TRIGGER account_delete
	BEFORE DELETE ON accounts
	FOR EACH ROW
BEGIN
	DELETE FROM `accounts_banned` WHERE `accid` = OLD.id;
	DELETE FROM `chars` WHERE `accid` = OLD.id;     
END
$$

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
	DELETE FROM `char_bazaar_msg` WHERE `charid` = OLD.charid;
END
$$

DELIMITER ;