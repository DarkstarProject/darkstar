-----------------------------------	
-- Scourge	
-- Great Sword weapon skill	
-- Skill level: N/A	
-- Additional effect: temporarily improves critical hit rate.	
-- Critical hit rate boost duration is based on TP when the weapon skill is used. 100% TP will give 20 seconds of critical hit rate boost; this scales linearly to 60 seconds of critical hit rate boost at 300% TP. 5 TP = 1 Second of Aftermath.	
-- Parses show the critical hit rate increase from the Scourge Aftermath is between 10% and 15%.	
-- This weapon skill is only available with the stage 5 relic Great Sword Ragnarok or within Dynamis with the stage 4 Valhalla.	
-- Aligned with the Light Gorget & Flame Gorget.	
-- Aligned with the Light Belt & Flame Belt.	
-- Element: None	
-- Modifiers: MND:40% ; CHR:40%	
-- 100%TP    200%TP    300%TP	
-- 3.00      3.00      3.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 1;
	ftp100 = 3; ftp200 = 3; ftp300 = 3;
	str_wsc = 0.0; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.4; chr_wsc = 0.4;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return tpHits, extraHits, damage;
	
end	
