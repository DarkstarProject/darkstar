-----------------------------------   
-- Wildfire
-- Marksmanship weapon skill   
-- Skill level: 357   
-- Empyrean Weapon Skill
-- COR Main Job Required
-- Aligned with the Light Gorget & Flame Gorget.   
-- Aligned with the Light Belt & Flame Belt.   
-- Element:
-- Modifiers: AGI:60%
-- 100%TP    200%TP    300%TP   
--  5.5      5.5      5.5
-----------------------------------   
require("scripts/globals/status");     
require("scripts/globals/settings");   
require("scripts/globals/weaponskills");       
-----------------------------------   
       
function OnUseWeaponSkill(player, target, wsID)
       
    local params = {};
    params.numHits = 1;
    params.ftp100 = 5.5; params.ftp200 = 5.5; params.ftp300 = 5.5;
    params.str_wsc = 0.16; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.6; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;
    damage, tpHits, extraHits = doRangedWeaponskill(player, target, params);
	local crticalHit = false;
        
	local main = player:getEquipID(SLOT_MAIN);
	local aftermath = 0;
	local tp = player:getTP();
	local duration = 0;
	
	if (main == 19469) then
		aftermath = 1;
	elseif (main == 19547) then
		aftermath = 1;
	elseif (main == 19645) then
		aftermath = 1;
	elseif (main == 19818) then
		aftermath = 1;
	elseif (main == 19866) then
		aftermath = 1;
	elseif (main == 21264) then
		aftermath = 1;
	elseif (main == 21265) then
		aftermath = 1;
	end
		
	if (aftermath == 1) then
		if (tp == 300) then
			duration = 90;
			player:delStatusEffect(EFFECT_AFTERMATH_LV1);
			player:delStatusEffect(EFFECT_AFTERMATH_LV2);
			player:delStatusEffect(EFFECT_AFTERMATH_LV3);
			player:addStatusEffect(EFFECT_AFTERMATH_LV3,1,0,duration);
		elseif (tp >= 200) then
			duration = 60;
			if (player:hasStatusEffect(EFFECT_AFTERMATH_LV3) == false) then
				player:delStatusEffect(EFFECT_AFTERMATH_LV1);
				player:delStatusEffect(EFFECT_AFTERMATH_LV2);
				player:addStatusEffect(EFFECT_AFTERMATH_LV2,1,0,duration);
			end
		else
			duration = 30;
			if (player:hasStatusEffect(EFFECT_AFTERMATH_LV3) == false) then
				if (player:hasStatusEffect(EFFECT_AFTERMATH_LV2) == false) then
					player:delStatusEffect(EFFECT_AFTERMATH_LV1);
					player:addStatusEffect(EFFECT_AFTERMATH_LV1,1,0,duration);
				end
			end
		end
	end
	
    return tpHits, extraHits, criticalHit, damage;
       
end