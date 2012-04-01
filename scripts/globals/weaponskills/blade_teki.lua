-----------------------------------	
-- Blade Teki	
-- Katana weapon skill	
-- Skill Level: 70	
-- Decription: Deals water elemental damage. Damage varies with TP.	
-- Aligned with the Aqua Gorget.	
-- Aligned with the Aqua Belt.	
-- Element: Water	
-- Modifiers: STR:20% ; INT:20%	
-- 100%TP    200%TP    300%TP	
-- 0.50      0.75      1.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 1;
	ftp100 = 0.5; ftp200 = 0.75; ftp300 = 1;
	str_wsc = 0.2; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.2; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return damage;
	
end	
