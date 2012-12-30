-----------------------------------	
-- Blade To	
-- Katana weapon skill	
-- Skill Level: 100	
-- Deals ice elemental damage. Damage varies with TP.	
-- Aligned with the Snow Gorget & Breeze Gorget.	
-- Aligned with the Snow Belt & Breeze Belt.	
-- Element: Ice	
-- Modifiers: STR:30% ; INT:30%	
-- 100%TP    200%TP    300%TP	
-- 0.50      0.75      1.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	local params = {};
	params.numHits = 1;
	params.ftp100 = 0.5; params.ftp200 = 0.75; params.ftp300 = 1;
	params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.3; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	
	return tpHits, extraHits, damage;
	
end	
