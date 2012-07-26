-----------------------------------	
-- Realmrazer	
-- Club weapon skill	
-- Skill Level: 357	
-- Delivers a seven-hit attack. Accuracy varies with TP.	
-- Will stack with Sneak Attack.	
-- Aligned with the Shadow Gorget & Soil Gorget.	
-- Aligned with the Shadow Belt & Soil Belt.	
-- Element: None	
-- Modifiers: MND:85%	
-- 100%TP    200%TP    300%TP	
-- 0.59375
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 7;
	ftp100 = 0.59375; ftp200 = 0.59375; ftp300 = 0.59375;
	str_wsc = 0.0; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.85; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.8; acc200= 0.9; acc300= 1;
	atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return tpHits, extraHits, damage;
	
end	
