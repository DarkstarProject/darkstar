-----------------------------------	
-- Primal Rend	
-- Axe weapon skill	
-- Skill Level: N/A	
-- Deals light elemental damage. Damage varies with TP. Aymur: Aftermath effect varies with TP.	
-- Available only after completing the Unlocking a Myth (Beastmaster) quest.	
-- Aligned with the Shadow Gorget, Soil Gorget & Aqua Gorget.	
-- Aligned with the Shadow Belt, Soil Belt & Aqua Belt.	
-- Element: Light	
-- Modifiers: CHR:30%	
-- 100%TP    200%TP    300%TP	
-- 4.00      4.25      4.75	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 1;
	ftp100 = 4; ftp200 = 4.25; ftp300 = 4.75;
	str_wsc = 0.0; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.3;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return tpHits, extraHits, damage;
	
end	
