ALTER TABLE char_points
	ADD COLUMN `fire_crystals` smallint(5) unsigned NOT NULL DEFAULT 0,
    ADD COLUMN `ice_crystals` smallint(5) unsigned NOT NULL DEFAULT 0,
    ADD COLUMN `wind_crystals` smallint(5) unsigned NOT NULL DEFAULT 0,
    ADD COLUMN `earth_crystals` smallint(5) unsigned NOT NULL DEFAULT 0,
    ADD COLUMN `lightning_crystals` smallint(5) unsigned NOT NULL DEFAULT 0,
    ADD COLUMN `water_crystals` smallint(5) unsigned NOT NULL DEFAULT 0,
    ADD COLUMN `light_crystals` smallint(5) unsigned NOT NULL DEFAULT 0,
    ADD COLUMN `dark_crystals` smallint(5) unsigned NOT NULL DEFAULT 0;