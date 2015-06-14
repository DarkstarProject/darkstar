-----------------------------------
-- Cyclone
-- Dagger weapon skill
-- Skill level: 125
-- Delivers an area attack that deals wind elemental damage. Damage varies with TP.
-- This weapon skill is ranged and can be used from a distance (Up to 15').
-- Directly affected by Magic Attack Bonus.
-- Aligned with the Breeze Gorget & Thunder Gorget.
-- Aligned with the Breeze Belt & Thunder Belt.
-- Element: Wind
-- Modifiers: DEX:30% ; INT:25%
-- 100%TP    200%TP    300%TP
-- 1.00      2.38      2.88
-----------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID)

	local params = {};
	params.ftp100 = 1; params.ftp200 = 2.375; params.ftp300 = 2.875;
	params.str_wsc = 0.0; params.dex_wsc = 0.3; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.25; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.ele = ELE_WIND;
	params.skill = SKILL_DAG;
	params.includemab = true;

	if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
		params.dex_wsc = 0.4; params.int_wsc = 0.4;
	end

	local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, params);
	damage = damage * WEAPON_SKILL_POWER
	return tpHits, extraHits, criticalHit, damage;

end
