-----------------------------------	
-- Resolution
-- Great Sword weapon skill	
-- Skill Level: 357
-- Delivers a fivefold attack. Damage varies with TP.
-- In order to obtain Resolution, the quest Martial Mastery must be completed.
-- This Weapon Skill's first hit fTP is duplicated for all additional hits.
-- Resolution has an attack penalty of -8%. 	
-- Aligned with the Breeze Gorget, Thunder Gorget & Soil Gorget. 	
-- Aligned with the Breeze Belt, Thunder Belt & Soil Belt. 	
-- Element: None
-- Modifiers: STR 20~100%, depending on merit points ugrades.
-- 100%TP    200%TP    300%TP	
-- 0.71875   0.71875   0.71875
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 5;
	ftp100 = 0.71875; ftp200 = 0.71875; ftp300 = 0.71875;
	str_wsc = 0.85; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return damage;
	
end	
