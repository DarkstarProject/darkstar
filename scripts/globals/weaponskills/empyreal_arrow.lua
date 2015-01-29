-----------------------------------
-- Empyreal Arrow
-- Archery weapon skill
-- Skill level: 250
-- In order to obtain Empyreal Arrow, the quest From Saplings Grow must be completed.
-- Delivers a single-hit attack. Damage varies with TP.
-- Aligned with the Flame Gorget & Light Gorget.
-- Aligned with the Flame Belt & Light Belt.
-- Element: None
-- Modifiers: STR:20% ; AGI:50%
-- 100%TP    200%TP    300%TP
-- 1.5        2.5       5.00
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID)

	local params = {};
	params.numHits = 1;
	params.ftp100 = 1.5; params.ftp200 = 2.5; params.ftp300 = 5;
	params.str_wsc = 0.20; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.50; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 2;
	local damage, tpHits, extraHits = doRangedWeaponskill(player, target, params);

	return tpHits, extraHits, criticalHit, damage;

end
