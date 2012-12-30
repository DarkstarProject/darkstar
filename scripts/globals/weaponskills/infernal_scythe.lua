-----------------------------------	
-- Infernal Scythe
-- Scythe weapon skill	
-- Skill Level: 300
-- Deals darkness elemental damage and lowers target's attack. Duration of effect varies with TP.
-- Attack Down effect is -25% attack.
-- Aligned with the Shadow Gorget & Aqua Gorget.
-- Aligned with the Shadow Belt & Aqua Belt. 
-- Element: None	
-- Modifiers: STR: 30% INT: 30%
-- 100%TP    200%TP    300%TP	
-- 3.50   	 3.50      3.50	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	local params = {};
	params.numHits = 1;
	params.ftp100 = 3.5; params.ftp200 = 3.5; params.ftp300 = 3.5;
	params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.3; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	
	if damage > 0 then
		tp = player:getTP();
		duration = (tp/100 * 180)
		if(target:hasStatusEffect(EFFECT_ATTACK_DOWN) == false) then
			target:addStatusEffect(EFFECT_ATTACK_DOWN, 25, 0, duration);
		end
	end		
	
	return tpHits, extraHits, damage;
	
end	
