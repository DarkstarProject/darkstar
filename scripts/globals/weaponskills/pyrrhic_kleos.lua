-----------------------------------	
-- Pyrrhic Kleos	
-- Dagger weapon skill	
-- Skill Level: N/A	
-- Delivers a fourfold attack that lowers target's evasion. Duration of effect varies with TP. Terpsichore: Aftermath effect varies with TP.	
-- Available only after completing the Unlocking a Myth (Dancer) quest.	
-- Aligned with the Soil Gorget, Aqua Gorget & Snow Gorget.	
-- Aligned with the Soil Belt, Aqua Belt & Snow Belt.	
-- Element: Unknown	
-- Modifiers: STR:20% ; DEX:30%	
-- 100%TP    200%TP    300%TP	
-- 1.50      1.50      1.50	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 4;
	ftp100 = 1.5; ftp200 = 1.5; ftp300 = 1.5;
	str_wsc = 0.2; dex_wsc = 0.3; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return damage;
	
end	
