-----------------------------------	
-- Rock Crusher	
-- Staff weapon skill	
-- Skill Level: 40	
-- Delivers an earth elemental attack. Damage varies with TP.	
-- Aligned with the Thunder Gorget.	
-- Aligned with the Thunder Belt.	
-- Element: Earth	
-- Modifiers: STR:20% ; INT:20%	
-- 100%TP    200%TP    300%TP	
-- 1.00      2.00      2.50	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 1;
	ftp100 = 1; ftp200 = 2; ftp300 = 2.5;
	str_wsc = 0.2; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.2; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return tpHits, extraHits, damage;
	
end	
