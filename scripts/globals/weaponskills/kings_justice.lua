-----------------------------------	
-- Kings Justice	
-- Great Axe weapon skill	
-- Skill Level: N/A	
-- Delivers a threefold attack. Damage varies with TP. Conqueror: Aftermath effect varies with TP.	
-- Available only after completing the Unlocking a Myth (Warrior) quest.	
-- Aligned with the Breeze Gorget, Thunder Gorget & Soil Gorget.	
-- Aligned with the Breeze Belt, Thunder Belt & Soil Belt.	
-- Element: None	
-- Staff weapon skill Skill level: 10 Delivers a single-hit attack. Damage varies with TP. Element: Non	
-- Modifiers: STR:50%	
-- 100%TP    200%TP    300%TP	
-- 1.00      1.25      1.50	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 3;
	ftp100 = 1; ftp200 = 1.25; ftp300 = 1.5;
	str_wsc = 0.5; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return damage;
	
end	
