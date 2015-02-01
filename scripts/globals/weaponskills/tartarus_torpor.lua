-----------------------------------	
-- Tartarus Torpor
-- Staff weapon skill	
-- Skill level: NA	
-- Puts to sleep enemies within the area of effect and lowers their magical defense and magical evasion.
-- Duration of effect varies with TP.	
-- Only avaliable during Campaign Battles while wielding Samudra
-- Element: None	
-- Modifiers: INT:30% STR:30%
-- 100%TP    200%TP    300%TP	
-- 2.75      4.00      5.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	local params = {};
	params.numHits = 1;
	params.ftp100 = 2.75; params.ftp200 = 4; params.ftp300 = 5;
	params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.3; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	local damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);

	if damage > 0 then
		local tp = player:getTP();
		local duration = (tp/100 * 60);
		if(target:hasStatusEffect(EFFECT_MAGIC_DEF_DOWN) == false) then
			target:addStatusEffect(EFFECT_MAGIC_DEF_DOWN, 10, 0, duration);
		end
		if(target:hasStatusEffect(EFFECT_MAGIC_EVASION_DOWN) == false) then
					target:addStatusEffect(EFFECT_MAGIC_EVASION_DOWN, 10, 0, duration);
		end
		if(target:hasStatusEffect(EFFECT_SLEEP) == false) then
					target:addStatusEffect(EFFECT_SLEEP, 100, 0, duration);
		end
	end	
	
	return tpHits, extraHits, damage;
	
end	
