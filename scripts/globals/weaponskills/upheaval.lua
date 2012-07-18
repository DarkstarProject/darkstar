-----------------------------------	
-- Upheaval
-- Great Axe weapon skill	
-- Skill Level: 357	
-- Delivers a four-hit attack. Damage varies with TP. 	
-- In order to obtain Upheaval, the quest Martial Mastery must be completed. 
-- Aligned with Flame Gorget, Light Gorget & Shadow Gorget. 	
-- Aligned with Flame Belt, Light Belt & Shadow Belt. 
-- Element: None	
-- Modifiers: VIT: 20~100%, depending on merit points ugrades. 
-- 100%TP    200%TP    300%TP	
-- 1.00   	 1.50      2.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 4;
	ftp100 = 1.0; ftp200 = 1.5; ftp300 = 2.0;
	str_wsc = 0.0; dex_wsc = 0.0; vit_wsc = 0.85; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = true;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return damage;
	
end	
