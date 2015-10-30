-----------------------------------
-- Skill Level: N/A
-- Description: Deals light elemental damage. Damage varies with TP. Gastraphetes: Aftermath effect varies with TP.
-- Available only after completing the Unlocking a Myth (Ranger) quest.
-- Does not work with Flashy Shot.
-- Does not work with Stealth Shot.
-- Aligned with the Breeze Gorget, Thunder Gorget & Soil Gorget.
-- Aligned with the Breeze Belt, Thunder Belt & Soil Belt.
-- Properties
-- Element: Light
-- Skillchain Properties: Fragmentation/Scission
-- Modifiers: AGI:30%
-- Damage Multipliers by TP:
--  100%TP	200%TP	300%TP
--   4.0	4.25	4.75
-----------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID)

	local params = {};
	params.ftp100 = 4; params.ftp200 = 4.25; params.ftp300 = 4.75;
	params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0;
	params.agi_wsc = 0.3; params.int_wsc = 0.0; params.mnd_wsc = 0.0;
	params.chr_wsc = 0.0;
	params.ele = ELE_LIGHT;
	params.skill = SKILL_MRK;
	params.includemab = true;

	if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
		params.ftp100 = 3.8906; params.ftp200 = 6.3906; params.ftp300 = 9.3906;
		params.agi_wsc = 1.0;
	end

	local damage, tpHits, extraHits = doMagicWeaponskill(player, target, params);

	if ((player:getEquipID(SLOT_RANGED) == 19001) and (player:getMainJob() == JOB_RNG)) then
		if (damage > 0) then

--		AFTERMATH LV1

		if ((player:getTP() >= 100) and (player:getTP() <= 110)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV1, 10, 0, 180, 0, 3);
	elseif ((player:getTP() >= 111) and (player:getTP() <= 120)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV1, 11, 0, 180, 0, 3);
	elseif ((player:getTP() >= 121) and (player:getTP() <= 130)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV1, 12, 0, 180, 0, 3);
	elseif ((player:getTP() >= 131) and (player:getTP() <= 140)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV1, 13, 0, 180, 0, 3);
	elseif ((player:getTP() >= 141) and (player:getTP() <= 150)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV1, 14, 0, 180, 0, 3);
	elseif ((player:getTP() >= 151) and (player:getTP() <= 160)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV1, 15, 0, 180, 0, 3);
	elseif ((player:getTP() >= 161) and (player:getTP() <= 170)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV1, 16, 0, 180, 0, 3);
	elseif ((player:getTP() >= 171) and (player:getTP() <= 180)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV1, 17, 0, 180, 0, 3);
	elseif ((player:getTP() >= 181) and (player:getTP() <= 190)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV1, 18, 0, 180, 0, 3);
	elseif ((player:getTP() >= 191) and (player:getTP() <= 199)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV1, 19, 0, 180, 0, 3);



--		AFTERMATH LV2

	elseif ((player:getTP() >= 200) and (player:getTP() <= 210)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV2, 24, 0, 180, 0, 4);
	elseif ((player:getTP() >= 211) and (player:getTP() <= 219)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV2, 28, 0, 180, 0, 4);
	elseif ((player:getTP() >= 221) and (player:getTP() <= 229)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV2, 32, 0, 180, 0, 4);
	elseif ((player:getTP() >= 231) and (player:getTP() <= 239)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV2, 36, 0, 180, 0, 4);
	elseif ((player:getTP() >= 241) and (player:getTP() <= 249)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV2, 40, 0, 180, 0, 4);
	elseif ((player:getTP() >= 251) and (player:getTP() <= 259)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV2, 44, 0, 180, 0, 4);
	elseif ((player:getTP() >= 261) and (player:getTP() <= 269)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV2, 48, 0, 180, 0, 4);
	elseif ((player:getTP() >= 271) and (player:getTP() <= 279)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV2, 52, 0, 180, 0, 4);
	elseif ((player:getTP() >= 281) and (player:getTP() <= 289)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV2, 56, 0, 180, 0, 4);
	elseif ((player:getTP() >= 291) and (player:getTP() <= 299)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV2, 59, 0, 180, 0, 4);


--		AFTERMATH LV3

		elseif ((player:getTP() == 300)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV3, 45, 0, 120, 0, 2);

			end
		end
	end
	damage = damage * WEAPON_SKILL_POWER
	return tpHits, extraHits, criticalHit, damage;

end;
