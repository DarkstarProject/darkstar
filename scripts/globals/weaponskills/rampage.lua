-----------------------------------	
-- Rampage	
-- Axe weapon skill	
-- Skill level: 175	
-- Delivers a five-hit attack. Chance of params.critical varies with TP.	
-- Will stack with Sneak Attack.	
-- Aligned with the Soil Gorget.	
-- Aligned with the Soil Belt.	
-- Element: None	
-- Modifiers: STR:30%	
-- 100%TP    200%TP    300%TP	
-- 0.50      0.50      0.50	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	local params = {};
	params.numHits = 5;
	params.ftp100 = 0.5; params.ftp200 = 0.5; params.ftp300 = 0.5;
	params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.10; params.crit200 = 0.30; params.crit300 = 0.50;
	params.canCrit = true;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	
	return tpHits, extraHits, damage;
	
end	
