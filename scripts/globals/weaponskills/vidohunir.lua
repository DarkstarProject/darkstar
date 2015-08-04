-----------------------------------
-- Vidohunir
-- Staff weapon skill
-- Skill Level: N/A
-- Lowers target's magic defense. Duration of effect varies with TP. Laevateinn: Aftermath effect varies with TP.
-- Reduces enemy's magic defense by 10%.
-- Available only after completing the Unlocking a Myth (Black Mage) quest.
-- Aligned with the Breeze Gorget, Thunder Gorget, Aqua Gorget & Snow Gorget.
-- Aligned with the Breeze Belt, Thunder Belt, Aqua Belt & Snow Belt.
-- Element: Darkness
-- Modifiers: INT:30%
-- 100%TP    200%TP    300%TP
-- 1.75      1.75      1.75
-----------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID)

	local params = {};
	params.ftp100 = 1.75; params.ftp200 = 1.75; params.ftp300 = 1.75;
	params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.3; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.ele = ELE_DARK;
	params.skill = SKILL_STF;
	params.includemab = true;

	if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
		params.int_wsc = 0.8;
	end

	local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, params);

	if damage > 0 then
		local tp = player:getTP();
		local duration = (tp/100 * 60);
		if (target:hasStatusEffect(EFFECT_MAGIC_DEF_DOWN) == false) then
			target:addStatusEffect(EFFECT_MAGIC_DEF_DOWN, 10, 0, duration);
		end
	end


	if ((player:getEquipID(SLOT_MAIN) == 18994) and (player:getMainJob() == JOB_BLM)) then
		if (damage > 0) then

--		AFTERMATH LV1

		if ((player:getTP() >= 100) and (player:getTP() <= 110)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV1, 10, 0, 180, 0, 2);
	elseif ((player:getTP() >= 111) and (player:getTP() <= 120)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV1, 11, 0, 180, 0, 2);
	elseif ((player:getTP() >= 121) and (player:getTP() <= 130)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV1, 12, 0, 180, 0, 2);
	elseif ((player:getTP() >= 131) and (player:getTP() <= 140)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV1, 13, 0, 180, 0, 2);
	elseif ((player:getTP() >= 141) and (player:getTP() <= 150)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV1, 14, 0, 180, 0, 2);
	elseif ((player:getTP() >= 151) and (player:getTP() <= 160)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV1, 15, 0, 180, 0, 2);
	elseif ((player:getTP() >= 161) and (player:getTP() <= 170)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV1, 16, 0, 180, 0, 2);
	elseif ((player:getTP() >= 171) and (player:getTP() <= 180)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV1, 17, 0, 180, 0, 2);
	elseif ((player:getTP() >= 181) and (player:getTP() <= 190)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV1, 18, 0, 180, 0, 2);
	elseif ((player:getTP() >= 191) and (player:getTP() <= 199)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV1, 19, 0, 180, 0, 2);



--		AFTERMATH LV2

	elseif ((player:getTP() >= 200) and (player:getTP() <= 210)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV2, 24, 0, 180, 0, 3);
	elseif ((player:getTP() >= 211) and (player:getTP() <= 219)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV2, 28, 0, 180, 0, 3);
	elseif ((player:getTP() >= 221) and (player:getTP() <= 229)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV2, 32, 0, 180, 0, 3);
	elseif ((player:getTP() >= 231) and (player:getTP() <= 239)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV2, 36, 0, 180, 0, 3);
	elseif ((player:getTP() >= 241) and (player:getTP() <= 249)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV2, 40, 0, 180, 0, 3);
	elseif ((player:getTP() >= 251) and (player:getTP() <= 259)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV2, 44, 0, 180, 0, 3);
	elseif ((player:getTP() >= 261) and (player:getTP() <= 269)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV2, 48, 0, 180, 0, 3);
	elseif ((player:getTP() >= 271) and (player:getTP() <= 279)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV2, 52, 0, 180, 0, 3);
	elseif ((player:getTP() >= 281) and (player:getTP() <= 289)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV2, 56, 0, 180, 0, 3);
	elseif ((player:getTP() >= 291) and (player:getTP() <= 299)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV2, 59, 0, 180, 0, 3);


--		AFTERMATH LV3

		elseif ((player:getTP() == 300)) then
			player:addStatusEffect(EFFECT_AFTERMATH_LV3, 45, 0, 120, 0, 1);

			end
		end
	end
	damage = damage * WEAPON_SKILL_POWER
	return tpHits, extraHits, criticalHit, damage;

end
