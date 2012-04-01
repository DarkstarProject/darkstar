-----------------------------------	
-- Cyclone	
-- Dagger weapon skill	
-- Skill level: 125	
-- Delivers an area attack that deals wind elemental damage. Damage varies with TP.	
-- This weapon skill is ranged and can be used from a distance (Up to 15').	
-- Directly affected by Magic Attack Bonus.	
-- Aligned with the Breeze Gorget & Thunder Gorget.	
-- Aligned with the Breeze Belt & Thunder Belt.	
-- Element: Wind	
-- Modifiers: DEX:30% ; INT:25%	
-- 100%TP    200%TP    300%TP	
-- 1.00      2.38      2.88	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 1;
	ftp100 = 1; ftp200 = 2.38; ftp300 = 2.88;
	str_wsc = 0.0; dex_wsc = 0.3; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.25; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return damage;
	
end	
