-----------------------------------	
-- Exenterator	
-- Skill level: 357 
-- Terpsichore: Aftermath effect varies with TP. 
-- In order to obtain Exenterator, the quest Martial Mastery must be completed. 
-- Description: Delivers a fourfold attack that lowers enemy's accuracy. Effect duration varies with TP.
-- Aligned with the Breeze Gorget, Thunder Gorget & Soil Gorget. 
-- Aligned with the Breeze Belt, Thunder Belt & Soil Belt. 
-- Notes: Stacks with itself allowing continuous acc down
-- Acc down isn't the same as the spell Blind or sources which are the same as blind allowing both to stack 
-- Element: None	
-- Modifiers: AGI:20~100%, depending on merit points ugrades.
-- 100%TP    200%TP    300%TP	
-- 1.0        1.0       1.0
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 4;
	ftp100 = 1.0; ftp200 = 1.0; ftp300 = 1.0;
	str_wsc = 0.0; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.85; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1.375;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);

	if damage > 0 then
		tp = player:getTP();
		duration=(tp/100*30)+90;
		if(target:hasStatusEffect(EFFECT_ACCURACY_DOWN) == false) then
			target:addStatusEffect(EFFECT_ACCURACY_DOWN, 1, 0,duration);
		end
	end
	return tpHits, extraHits, damage;
end	
