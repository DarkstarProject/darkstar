-----------------------------------  
-- Jishnu's Radiance
-- Archery weapon skill  
-- Skill level: 357  
-- Empyrean Weapon Skill
-- RNG Main Job Required
-- Aligned with the Thunder & Breeze Gorget.  
-- Aligned with the Thunder Belt & Breeze Belt.  
-- Element:
-- Modifiers: DEX:60%
-- 100%TP    200%TP    300%TP  
-- 1.75      1.75      1.75
-----------------------------------  
require("scripts/globals/status");  
require("scripts/globals/settings");  
require("scripts/globals/weaponskills");  
-----------------------------------  

function OnUseWeaponSkill(player, target, wsID)  

	local params = {};
	params.numHits = 3;
	params.ftp100 = 1.75; params.ftp200 = 1.75; params.ftp300 = 1.75;
	params.str_wsc = 0.0; params.dex_wsc = 0.60; params.vit_wsc = 0.0;

	params.agi_wsc = 0.00; params.int_wsc = 0.0; params.mnd_wsc = 0.0;

	params.chr_wsc = 0.0;
	params.crit100 = 0.15; params.crit200 = 0.2; params.crit300 = 0.25;
	params.canCrit = true;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	damage, tpHits, extraHits = doRangedWeaponskill(player, target, params);

	return tpHits, extraHits, criticalHit, damage;

end;