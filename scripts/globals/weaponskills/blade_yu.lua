-----------------------------------	
-- Blade Yu
-- Katana weapon skill	
-- Skill Level: 290
-- Delivers a water elemental attack. Additional effect Poison. Durration varies with TP.	
-- Aligned with the Aqua Gorget & Soil Gorget.	
-- Aligned with the Aqua Belt & Soil Belt.	
-- Element: Water	
-- Modifiers: DEX:50% ; INT:50%	
-- 100%TP    200%TP    300%TP	
-- 2.25      2.25      2.25	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	local params = {};
	params.numHits = 1;
	params.ftp100 = 2.25; params.ftp200 = 2.25; params.ftp300 = 2.25;
	params.str_wsc = 0.0; params.dex_wsc = 0.5; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.5; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	local damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);

	if damage > 0 then
		local tp = player:getTP();
		local duration = (tp/100 * 15) + 75;
		if(target:hasStatusEffect(EFFECT_POISON) == false) then
			target:addStatusEffect(EFFECT_POISON, 10, 0, duration);
		end
	end	
	
	return tpHits, extraHits, damage;
	
end	
