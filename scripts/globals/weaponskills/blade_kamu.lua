-----------------------------------	
-- Blade Kamu	
-- Katana weapon skill	
-- Skill Level: N/A	
-- Lowers target's accuracy. Duration of effect varies with TP. Nagi: Aftermath effect varies with TP.	
-- Effect lasts 60 seconds @ 100 TP, 90 seconds @ 200 TP, and 120 seconds @ 300 TP	
-- Available only after completing the Unlocking a Myth (Ninja) quest.	
-- Aligned with the Shadow Gorget, Thunder Gorget & Breeze Gorget.	
-- Aligned with the Shadow Belt, Thunder Belt & Breeze Belt.	
-- Element: None	
-- Modifiers: STR:50% ; INT:50%	
-- 100%TP    200%TP    300%TP	
-- 1.00      1.00      1.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 1;
	ftp100 = 1; ftp200 = 1; ftp300 = 1;
	str_wsc = 0.5; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.5; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return damage;
	
end	
