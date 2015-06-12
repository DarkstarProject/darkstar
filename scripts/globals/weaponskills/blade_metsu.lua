-----------------------------------
-- Blade Metsu
-- Katana weapon skill
-- Skill Level: N/A
-- Additional effect: Paralysis
-- Hidden effect: temporarily enhances Subtle Blow effect.
-- One hit weapon skill, despite non single-hit animation.
-- This weapon skill is only available with the stage 5 relic Katana Kikoku or within Dynamis with the stage 4 Yoshimitsu.
-- Weaponskill is also available with the Sekirei Katana obtained from Abyssea NM Sedna.
-- Aligned with the Shadow Gorget, Breeze Gorget & Thunder Gorget.
-- Aligned with the Shadow Belt, Breeze Belt & Thunder Belt.
-- Element: None
-- Modifiers: DEX:60%
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
	params.str_wsc = 0.0; params.dex_wsc = 0.6; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;


	if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
		params.dex_wsc = 0.8;
	end


	local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	if damage > 0 and (target:hasStatusEffect(EFFECT_PARALYSIS) == false) then
		target:addStatusEffect(EFFECT_PARALYSIS, 10, 0, 60);
	end
		if((player:getEquipID(SLOT_MAIN) or (SLOT_SUB) == 18312) and (player:getMainJob() == JOB_NIN)) then
		if(damage > 0) then
			if(player:getTP() >= 100 and player:getTP() <200) then
				player:addStatusEffect(EFFECT_AFTERMATH, 5, 0, 20, 0, 1);
			elseif(player:getTP() >= 200 and player:getTP() <300) then
				player:addStatusEffect(EFFECT_AFTERMATH, 5, 0, 40, 0, 1);
			elseif(player:getTP() == 300) then
				player:addStatusEffect(EFFECT_AFTERMATH, 5, 0, 60, 0, 1);
			end
		end
	end
	damage = damage * WEAPON_SKILL_POWER
	return tpHits, extraHits, criticalHit, damage;
end
