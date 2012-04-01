-----------------------------------	
-- Blade Ku	
-- Katana weapon skill	
-- Skill level: 250	
-- Delivers a five-hit attack. Accuracy varies with TP.	
-- In order to obtain Blade: Ku, the quest Bugi Soden must be completed.	
-- Will stack with Sneak Attack.	
-- Aligned with the Shadow Gorget, Soil Gorget & Light Gorget.	
-- Aligned with the Shadow Belt, Soil Belt & Light Belt.	
-- Element: None	
-- Modifiers: STR:10% ; DEX:10%	
-- 100%TP    200%TP    300%TP	
-- 1.00      1.00      1.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 5;
	ftp100 = 1; ftp200 = 1; ftp300 = 1;
	str_wsc = 0.1; dex_wsc = 0.1; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.8; acc200= 0.9; acc300= 1;
	atkmulti = 1;
	damage = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return damage;
	
end	
