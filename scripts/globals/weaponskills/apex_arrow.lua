-----------------------------------
-- Apex Arrow
-- Archery weapon skill
-- Skill level: 357
-- Description: Delivers an attack that deals triple damage and ignores target's defense. Amount ignored varies with TP.
-- To obtain Apex Arrow, the quest Martial Mastery must be completed and it must be purchased from the Merit Points menu.
-- Aligned with the Breeze Gorget, Thunder Gorget & Light Gorget.
-- Properties
-- Element: None
-- Skillchain Properties: Fragmentation-IconFragmentation/Transfixion-IconTransfixion
-- Modifiers: AGI:73~85%, depending on merit points upgrades.
-- 100%TP    200%TP    300%TP
-- 3.00      3.00      3.00
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID)

	local params = {};
	params.numHits = 1;
	params.ftp100 = 3; params.ftp200 = 3; params.ftp300 = 3;
	params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0;
	params.agi_wsc = 0.85; params.int_wsc = 0.0; params.mnd_wsc = 0.0;
	params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;

	params.ignoresDef = true;
	params.ignored100 = 0.15;
	params.ignored200 = 0.35;
	params.ignored300 = 0.5;

	local damage, tpHits, extraHits = doRangedWeaponskill(player, target, params);

	return tpHits, extraHits, criticalHit, damage;

end;