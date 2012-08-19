-----------------------------------	
-- Ruinator	
-- Axe weapon skill
-- Skill level: 357
-- Description: Delivers a four-hit attack. Accuracy varies with TP
-- In order to obtain Ruinator, the quest Martial Mastery must be completed.
-- This Weapon Skill's first hit fTP is duplicated for all additional hits
-- Aligned with the Aqua Gorget, Snow Gorget & Breeze Gorget
-- Aligned with the Aqua Belt, Snow Belt & Breeze Belt.
-- Element: None	
-- Modifiers: STR:20~100%, depending on merit points ugrades.
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
	str_wsc = 0.85; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.8; acc200= 0.9; acc300= 1.0;
	atkmulti = 1.375;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return tpHits, extraHits, damage;
	
end	
