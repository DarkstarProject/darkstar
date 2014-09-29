/*
 *   Allows the ability to pass an ip address to the procedure to
 *   to automatically calculate the decimal value
 */

DROP PROCEDURE IF EXISTS `update_zoneip`;

DELIMITER //
CREATE PROCEDURE `update_zoneip`(IN v_ip VARCHAR(15))
BEGIN

  UPDATE zone_settings
     SET zoneip = (
                    SELECT z.a + (z.b * 256) + z.c * power(256, 2) + z.d * power(256, 3)
                      FROM (
                             SELECT substring_index(substring_index(y.ip, '.', 1), '.', -1) a,
                                    substring_index(substring_index(y.ip, '.', 2), '.', -1) b,
                                    substring_index(substring_index(y.ip, '.', 3), '.', -1) c,
                                    substring_index(substring_index(y.ip, '.', 4), '.', -1) d
                               FROM (
                                      SELECT v_ip AS ip
                                    ) y
                           ) z
     );

END //
DELIMITER ;