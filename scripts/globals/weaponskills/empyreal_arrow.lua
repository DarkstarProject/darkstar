-----------------------------------	
-- Empyreal Arrow	
-- Archery weapon skill	
-- Skill level: 250	
-- In order to obtain Empyreal Arrow, the quest From Saplings Grow must be completed.	
-- Delivers a single-hit attack. Damage varies with TP.	
-- Aligned with the Flame Gorget & Light Gorget.	
-- Aligned with the Flame Belt & Light Belt.	
-- Element: None	
-- Modifiers: STR:16% ; AGI:25%	
-- 100%TP    200%TP    300%TP	
-- 2.00      2.75      3.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 1;
	ftp100 = 2; ftp200 = 2.75; ftp300 = 3;
	str_wsc = 0.16; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.25; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage, tpHits, extraHits = doRangedWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return tpHits, extraHits, damage;
	
end	
