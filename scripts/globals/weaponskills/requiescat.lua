-----------------------------------
-- Requiescat
-- Sword weapon skill
-- Skill level: MERIT
-- Delivers a five-hit attack. Attack power varies with TP.
-- Element: None
-- Modifiers: MND:73~85%
-- 100%TP    200%TP    300%TP
-- 		ALL 1.0
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID)

	local params = {};
	params.numHits = 5;
	params.ftp100 = 1; params.ftp200 = 1; params.ftp300 = 1;
	params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.85 + (player:getMerit(MERIT_REQUIESCAT) / 100); params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 0.7 + player:getTP()/1000;

	if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
		params.mnd_wsc = 0.7 + (player:getMerit(MERIT_REQUIESCAT) / 100);
	end

	local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	damage = damage * WEAPON_SKILL_POWER
	return tpHits, extraHits, criticalHit, damage;

end
