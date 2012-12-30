-----------------------------------	
-- Dark Harvest	
-- Scythe weapon skill	
-- Skill Level: 30	
-- Delivers a dark elemental attack. Damage varies with TP.	
-- Aligned with the Aqua Gorget.	
-- Aligned with the Aqua Belt.	
-- Element: Dark	
-- Modifiers: STR:20% ; INT:20%	
-- 100%TP    200%TP    300%TP	
-- 1.00      2.00      2.50	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	local params = {};
	params.numHits = 1;
	params.ftp100 = 1; params.ftp200 = 2; params.ftp300 = 2.5;
	params.str_wsc = 0.2; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.2; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	
	return tpHits, extraHits, damage;
	
end	
