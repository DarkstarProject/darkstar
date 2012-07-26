-----------------------------------	
-- Dancing Edge	
-- Dagger weapon skill	
-- Skill level: 200 	
-- Delivers a fivefold attack. Accuracy varies with TP.	
-- Will stack with Sneak Attack.	
-- Will stack with Trick Attack.	
-- Aligned with the Breeze Gorget & Soil Gorget.	
-- Aligned with the Breeze Belt & Soil Belt.	
-- Element: None	
-- Modifiers: DEX:30% ; CHR:40%	
-- 100%TP    200%TP    300%TP	
-- 1.19      1.19      1.19	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 5;
	ftp100 = 1.19; ftp200 = 1.19; ftp300 = 1.19;
	str_wsc = 0.0; dex_wsc = 0.3; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.4;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.8; acc200= 0.9; acc300= 1;
	atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return tpHits, extraHits, damage;
	
end	
