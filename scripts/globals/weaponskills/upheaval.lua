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
	
	local params = {};
	params.numHits = 4;
	params.ftp100 = 1.0; params.ftp200 = 1.5; params.ftp300 = 2.0;
	params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.85; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = true;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	
	return tpHits, extraHits, damage;
	
end	
