-----------------------------------	
-- Quietus
-- Scythe weapon skill	
-- Skill Level: N/A
-- Delivers a triple damage attack that ignores target's defense. Amount ignored varies with TP. Redemption: Aftermath. 
-- Available only when equipped with Redemption (85)/(90)/(95)/(99) or Penitence +1/+2/+3/Umiliati.
-- Aligned with the Shadow Gorget, Aqua Gorget & Snow Gorget.
-- Aligned with the Shadow Belt, Aqua Belt & Snow Belt. 
-- Element: None	
-- Modifiers: STR: 40% MND: 40%
-- 100%TP    200%TP    300%TP	
-- 3.00   	 3.00      3.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 1;
	ftp100 = 3.0; ftp200 = 3.0; ftp300 = 3.0;
	str_wsc = 0.4; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.4; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 3;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return tpHits, extraHits, damage;
	
end	
