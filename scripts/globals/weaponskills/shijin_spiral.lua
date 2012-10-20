-----------------------------------	
-- Shijin Spiral	
-- Hand-to-Hand weapon skill	
-- Skill Level: N/A	
-- Delivers a fivefold attack that Plagues the target. Chance of inflicting Plague varies with TP.	
-- In order to obtain Shijin Spiral, the quest Martial Mastery must be completed.
-- Aligned with the Flame Gorget, Light Gorget & Aqua Gorget.	
-- Aligned with the Flame Belt, Light Belt & Aqua Belt.	
-- Element: None	
-- Modifiers: DEX: 85% //actually 17~100%
-- 100%TP    200%TP    300%TP	
-- 1.0625    1.0625    1.0625	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 5;
	ftp100 = 1.0625; ftp200 = 1.0625; ftp300 = 1.0625;
	str_wsc = 0.0; dex_wsc = 0.85; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);

	if damage > 0 then
		tp = player:getTP();
		duration = (tp/100) + 4;
		if(target:hasStatusEffect(EFFECT_PLAGUE) == false) then
			target:addStatusEffect(EFFECT_PLAGUE, 5, 0, duration);
		end
	end	
	
	return tpHits, extraHits, damage;
	
end	
