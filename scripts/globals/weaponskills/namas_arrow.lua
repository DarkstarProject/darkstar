-----------------------------------
-- Skill Level: N/A
-- Description: Additional Effect: Temporarily improves Ranged Accuracy
-- Aligned with the Light Gorget, Snow Gorget & Aqua Gorget.
-- Properties
-- Element: N/A
-- Skillchain Properties: Light/Distortion
-- Modifiers: STR: 40% AGI: 40%
-- Damage Multipliers by TP:
-- 100%TP	200%TP	300%TP
--   2.75	2.75	2.75
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID)

	local params = {};
	params.numHits = 1;
	params.ftp100 = 2.75; params.ftp200 = 2.75; params.ftp300 = 2.75;
	params.str_wsc = 0.4; params.dex_wsc = 0.0; params.vit_wsc = 0.0;
	params.agi_wsc = 0.4; params.int_wsc = 0.0; params.mnd_wsc = 0.0;
	params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;

	local damage, tpHits, extraHits = doRangedWeaponskill(player, target, params);
		if ((player:getEquipID(SLOT_RANGED) == 18348) and (player:getMainJob() == JOB_RNG or JOB_SAM)) then
		if (damage > 0) then
			if (player:getTP() >= 100 and player:getTP() < 200) then
				player:addStatusEffect(EFFECT_AFTERMATH, 20, 0, 20, 0, 12);
			elseif (player:getTP() >= 200 and player:getTP() < 300) then
				player:addStatusEffect(EFFECT_AFTERMATH, 20, 0, 40, 0, 12);
			elseif (player:getTP() == 300) then
				player:addStatusEffect(EFFECT_AFTERMATH, 20, 0, 60, 0, 12);
			end
		end
	end
	damage = damage * WEAPON_SKILL_POWER
	return tpHits, extraHits, criticalHit, damage;

end;
