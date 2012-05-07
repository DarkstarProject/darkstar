-----------------------------------	
-- Chant du Cygne
-- Sword weapon skill	
-- Skill level: EMPYREAN
-- Delivers a three-hit attack. Chance of critical varies with TP.	
-- Will stack with Sneak Attack.	
-- Element: None	
-- Modifiers: DEX:60%	
-- 100%TP    200%TP    300%TP	
-- 		ALL 2.25	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 3;
	ftp100 = 2.25; ftp200 = 2.25; ftp300 = 2.25;
	str_wsc = 0.0; dex_wsc = 0.6; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.1; crit200 = 0.3; crit300 = 0.5;
	canCrit = true;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return damage;
	
end	
