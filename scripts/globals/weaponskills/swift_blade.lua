-----------------------------------	
-- Swift Blade	
-- Sword weapon skill	
-- Skill Level: 225	
-- Delivers a three-hit attack. params.accuracy varies with TP.	
-- Will stack with Sneak Attack.	
-- Aligned with the Shadow Gorget & Soil Gorget.	
-- Aligned with the Shadow Belt & Soil Belt.	
-- Element: None	
-- Modifiers: STR:30% ; MND:30%	
-- 100%TP    200%TP    300%TP	
-- 1.50      1.50      1.50	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	local params = {};
	local params = {};
	params.numHits = 3;
	params.ftp100 = 1.5; params.ftp200 = 1.5; params.ftp300 = 1.5;
	params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.3; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.8; params.acc200= 0.9; params.acc300= 1;
	params.atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	
	return tpHits, extraHits, damage;
	
end	
