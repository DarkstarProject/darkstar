-----------------------------------	
-- Blast Shot	
-- Marksmanship weapon skill	
-- Skill Level: 200	
-- Delivers a melee-distance ranged attack. Accuracy varies with TP.	
-- Aligned with the Snow Gorget & Light Gorget.	
-- Aligned with the Snow Belt & Light Belt.	
-- Element: None	
-- Modifiers: AGI:30%	
-- 100%TP    200%TP    300%TP	
-- 2.00      2.00      2.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 1;
	ftp100 = 2; ftp200 = 2; ftp300 = 2;
	str_wsc = 0.0; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.3; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.8; acc200= 0.9; acc300= 1;
	atkmulti = 1;
	damage = doRangedWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return damage;
	
end	
