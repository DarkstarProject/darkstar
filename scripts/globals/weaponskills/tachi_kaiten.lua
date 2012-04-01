-----------------------------------	
-- Tachi Kaiten	
-- Great Katana weapon skill	
-- Skill level: N/A	
-- Additional effect: temporarily increases amount of TP stored with each hit.	
-- Grants Store TP+7 for the duration of time that it is active. Length of time depends on TP.	
-- 100 TP = 20s	
-- 200 TP = 40s	
-- 300 TP = 60s	
-- This weapon skill is only available with the stage 5 relic Great Katana Amanomurakumo or within Dynamis with the stage 4 Totsukanotsurugi.	
-- Also available as a Latent effect on Ame-no-ohabari	
-- Aligned with the Breeze Gorget, Thunder Gorget & Light Gorget.	
-- Aligned with the Breeze Belt, Thunder Belt & Light Belt.	
-- Element: None	
-- Modifiers: STR:60%	
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
	str_wsc = 0.6; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return damage;
	
end	
