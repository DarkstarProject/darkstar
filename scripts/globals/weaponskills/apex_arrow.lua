-----------------------------------   
-- Apex Arrow
-- Archery weapon skill   
-- Skill level: 357   
-- Merit
-- RNG or SAM
-- Aligned with the Thunder & Light Gorget.   
-- Aligned with the Thunder Belt & Light Belt.   
-- Element: None
-- Modifiers: AGI:20%
-- 100%TP    200%TP    300%TP   
-- 3.00      3.00      3.00
-----------------------------------   

require("scripts/globals/status");   
require("scripts/globals/settings");   
require("scripts/globals/weaponskills");   
-----------------------------------   

function OnUseWeaponSkill(player, target, wsID)   

	local params = {};
	params.numHits = 1;
	params.ftp100 = 3; params.ftp200 = 3; params.ftp300 = 3;
	params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0;
	params.agi_wsc = 0.2; params.int_wsc = 0.0; params.mnd_wsc = 0.0;
	params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;

	-- needs ignore defense. param

	damage, tpHits, extraHits = doRangedWeaponskill(player, target, params);

	return tpHits, extraHits, damage;

end;