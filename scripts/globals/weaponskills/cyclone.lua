-----------------------------------	
-- Cyclone	
-- Dagger weapon skill	
-- Skill level: 125	
-- Delivers an area attack that deals wind elemental damage. Damage varies with TP.	
-- This weapon skill is ranged and can be used from a distance (Up to 15').	
-- Directly affected by Magic Attack Bonus.	
-- Aligned with the Breeze Gorget & Thunder Gorget.	
-- Aligned with the Breeze Belt & Thunder Belt.	
-- Element: Wind	
-- Modifiers: DEX:30% ; INT:25%	
-- 100%TP    200%TP    300%TP	
-- 1.00      2.38      2.88	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	local params = {};
	params.numHits = 1;
	params.ftp100 = 1; params.ftp200 = 2.38; params.ftp300 = 2.88;
	params.str_wsc = 0.0; params.dex_wsc = 0.3; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.25; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	local damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	
	return tpHits, extraHits, damage;
	
end	
