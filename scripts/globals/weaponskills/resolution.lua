-----------------------------------	
-- Resolution
-- Great Sword weapon skill	
-- Skill Level: 357
-- Delivers a fivefold attack. Damage varies with TP.
-- In order to obtain Resolution, the quest Martial Mastery must be completed.
-- This Weapon Skill's first hit params.ftp is duplicated for all additional hits.
-- Resolution has an attack penalty of -8%. 	
-- Aligned with the Breeze Gorget, Thunder Gorget & Soil Gorget. 	
-- Aligned with the Breeze Belt, Thunder Belt & Soil Belt. 	
-- Element: None
-- Modifiers: STR 20~100%, depending on merit points ugrades.
-- 100%TP    200%TP    300%TP	
-- 0.71875   0.71875   0.71875
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	local params = {};
	params.numHits = 5;
	params.ftp100 = 0.71875; params.ftp200 = 0.71875; params.ftp300 = 0.71875;
	params.str_wsc = 0.85; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	local damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	
	return tpHits, extraHits, damage;
	
end	
