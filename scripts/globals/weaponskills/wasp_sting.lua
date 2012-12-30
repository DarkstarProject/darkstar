-----------------------------------	
-- Wasp Sting	
-- Dagger weapon skill	
-- Skill level: 5	
-- Poisons target. Duration of effect varies with TP.	
-- Will stack with Sneak Attack.	
-- Aligned with the Soil Gorget.	
-- Aligned with the Soil Belt.	
-- Element: None	
-- Modifiers: :	
-- 100%TP    200%TP    300%TP	
-- 1.00      1.00      1.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	local params = {};
	params.numHits = 1;
	params.ftp100 = 1; params.ftp200 = 1; params.ftp300 = 1;
	params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);

	if damage > 0 then
		tp = player:getTP();
		duration = (tp/100 * 15) + 75;
		if(target:hasStatusEffect(EFFECT_POISON) == false) then
			target:addStatusEffect(EFFECT_POISON, 1, 0, duration);
		end
	end	
	
	return tpHits, extraHits, damage;
	
end	
