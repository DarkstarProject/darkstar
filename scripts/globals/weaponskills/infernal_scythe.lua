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
	
	numHits = 1;
	ftp100 = 3.5; ftp200 = 3.5; ftp300 = 3.5;
	str_wsc = 0.3; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.3; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	if damage > 0 then
		tp = player:getTP();
		duration = (tp/100 * 180)
		if(target:hasStatusEffect(EFFECT_ATTACK_DOWN) == false) then
			target:addStatusEffect(EFFECT_ATTACK_DOWN, 25, 0, duration);
		end
	end		
	
	return tpHits, extraHits, damage;
	
end	
