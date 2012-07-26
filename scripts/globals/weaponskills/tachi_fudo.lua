-----------------------------------	
-- Tachi: Fudo	
-- Great Katana weapon skill	
-- Skill Level: N/A	
-- Deals double damage. Damage varies with TP. Masamune: Aftermath.	
-- Available only when equipped with Masamune (85), Masamune (90), Masamune (95), Hiradennotachi +1 or Hiradennotachi +2.
-- Aligned with Light Gorget, Snow Gorget & Aqua Gorget.	
-- Aligned with Light Belt, Snow Belt & Aqua Belt. 	
-- Element: None	
-- Modifiers: STR:60%	
-- 100%TP    200%TP    300%TP	
-- 3.75      4.75      5.75	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 1;
	ftp100 = 3.75; ftp200 = 4.75; ftp300 = 5.75;
	str_wsc = 0.60; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 2;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return tpHits, extraHits, damage;
	
end	
