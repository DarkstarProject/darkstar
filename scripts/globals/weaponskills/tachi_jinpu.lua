-----------------------------------	
-- Tachi Jinpu	
-- Great Katana weapon skill	
-- Skill level: 150	
-- Two-hit attack. Deals Physical and wind elemental damage to enemy. Additonal Effect Damage varies with TP.	
-- Will stack with Sneak Attack and Souleater.	
-- Aligned with the Breeze Gorget & Shadow Gorget.	
-- Aligned with the Breeze Belt & Shadow Belt.	
-- Element: Wind	
-- Modifiers: STR:40%	
-- 100%TP    200%TP    300%TP	
-- 1.00      1.00      1.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	local params = {};
	params.numHits = 2;
	params.ftp100 = 1; params.ftp200 = 1; params.ftp300 = 1;
	params.str_wsc = 0.4; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	
	return tpHits, extraHits, damage;
	
end	
