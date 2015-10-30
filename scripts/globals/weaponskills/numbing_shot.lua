-----------------------------------
-- Numbing Shot
-- Marksmanship weapon skill
-- Skill level: 290
-- Main of sub must be Ranger or Corsair
-- Aligned with the Thunder & Breeze Gorget.
-- Aligned with the Thunder Belt & Breeze Belt.
-- Element: Ice
-- Modifiers: AGI 80%
-- 100%TP    200%TP    300%TP
-- 3.00      3.00      3.00
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID)

	local params = {};
	params.numHits = 1;
	params.ftp100 = 3; params.ftp200 = 3; params.ftp300 = 3;
	params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.6; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;

	if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
		params.agi_wsc = 0.8;
	end

	local damage, tpHits, extraHits = doRangedWeaponskill(player, target, params);

	if damage > 0 then
		local tp = player:getTP();
		local duration = (tp/100 * 60)
		if (target:hasStatusEffect(EFFECT_PARALYSIS) == false) then
			target:addStatusEffect(EFFECT_PARALYSIS, 30, 0, duration);
		end
	end
	damage = damage * WEAPON_SKILL_POWER
	return tpHits, extraHits, criticalHit, damage;

end
