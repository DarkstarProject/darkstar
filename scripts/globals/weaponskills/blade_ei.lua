-----------------------------------
-- Blade Ei
-- Katana weapon skill
-- Skill Level: 175
-- Delivers a dark elemental attack. Damage varies with TP.
-- Aligned with the Shadow Gorget.
-- Aligned with the Shadow Belt.
-- Element: Dark
-- Modifiers: STR:30% ; INT:30%
-- 100%TP    200%TP    300%TP
-- 1.00      1.50      2.00
-----------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID)

	local params = {};
	params.ftp100 = 1; params.ftp200 = 1.5; params.ftp300 = 2;
	params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.3; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.ele = ELE_DARK;
	params.skill = SKILL_KAT;
	params.includemab = true;

	if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
		params.str_wsc = 0.4; params.int_wsc = 0.4;
	end

	local damage, tpHits, extraHits = doMagicWeaponskill(player, target, params);
	damage = damage * WEAPON_SKILL_POWER
	return tpHits, extraHits, damage;

end
