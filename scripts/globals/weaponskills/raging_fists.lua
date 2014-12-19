-----------------------------------	
-- Raging Fists	
-- Hand-to-Hand weapon skill	
-- Skill Level: 125	
-- Delivers a fivefold attack. Damage varies with TP.	
-- Will stack with Sneak Attack.	
-- Aligned with the Thunder Gorget.	
-- Aligned with the Thunder Belt.	
-- Element: None	
-- Modifiers: STR:20% ; DEX:20%	
-- 100%TP    200%TP    300%TP	
-- 1.00      1.50      2.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function onUseWeaponSkill(player, target, wsID)	
	
	local params = {};
	params.numHits = 5;
	params.ftp100 = 1; params.ftp200 = 1.5; params.ftp300 = 2;
	params.str_wsc = 0.2; params.dex_wsc = 0.2; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	
	return tpHits, extraHits, criticalHit, damage;
	
end	
