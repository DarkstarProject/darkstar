-----------------------------------	
-- Decimation	
-- Axe weapon skill	
-- Skill level: 240	
-- In order to obtain Decimation, the quest Axe the Competition must be completed.	
-- Delivers a three-hit attack. Accuracy varies with TP.	
-- Will stack with Sneak Attack.	
-- Aligned with the Flame Gorget, Light Gorget & Aqua Gorget.	
-- Aligned with the Flame Belt, Light Belt & Aqua Belt.	
-- Element: None	
-- Modifiers: STR:50%	
-- 100%TP    200%TP    300%TP	
-- 1.25      1.25      1.25	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 3;
	ftp100 = 1.25; ftp200 = 1.25; ftp300 = 1.25;
	str_wsc = 0.5; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.8; acc200= 0.9; acc300= 1;
	atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return tpHits, extraHits, damage;
	
end	
