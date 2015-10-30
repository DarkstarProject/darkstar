-----------------------------------
-- Metatron Torment
-- Hand-to-Hand Skill level: 5 Description: Delivers a threefold attack. Damage varies wit weapon skill
-- Great Axe Weapon Skill
-- Skill Level: N/A
-- Lowers target's defense. Additional effect: temporarily lowers damage taken from enemies.
-- Defense Down effect is 18.5%, 1 minute duration.
-- Damage reduced is 20.4% or 52/256.
-- Lasts 20 seconds at 100TP, 40 seconds at 200TP and 60 seconds at 300TP.
-- Available only when equipped with the Relic Weapons Abaddon Killer (Dynamis use only) or Bravura.
-- Also available as a Latent effect on Barbarus Bhuj
-- Since these Relic Weapons are only available to Warriors, only Warriors may use this Weapon Skill.
-- Aligned with the Flame Gorget & Light Gorget.
-- Aligned with the Flame Belt & Light Belt.
-- Element: None
-- Modifiers: STR:60%
-- 100%TP    200%TP    300%TP
-- 2.75      2.75      2.75
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID)

	local params = {};
	params.numHits = 1;
	params.ftp100 = 2.75; params.ftp200 = 2.75; params.ftp300 = 2.75;
	params.str_wsc = 0.6; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;

	if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
		params.str_wsc = 0.8;
	end

	local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	if damage > 0 and (target:hasStatusEffect(EFFECT_DEFENSE_DOWN) == false) then
		target:addStatusEffect(EFFECT_DEFENSE_DOWN, 18.5, 0, 120);
	end
	if ((player:getEquipID(SLOT_MAIN) == 18294) and (player:getMainJob() == JOB_WAR)) then
		if (damage > 0) then
			if (player:getTP() >= 100 and player:getTP() < 200) then
				player:addStatusEffect(EFFECT_AFTERMATH, -21, 0, 20, 0, 5);
			elseif (player:getTP() >= 200 and player:getTP() < 300) then
				player:addStatusEffect(EFFECT_AFTERMATH, -21, 0, 40, 0, 5);
			elseif (player:getTP() == 300) then
				player:addStatusEffect(EFFECT_AFTERMATH, -21, 0, 60, 0, 5);
			end
		end
	end
	damage = damage * WEAPON_SKILL_POWER
	return tpHits, extraHits, criticalHit, damage;

end
