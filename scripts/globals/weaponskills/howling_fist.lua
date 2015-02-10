-----------------------------------
-- Howling Fist
-- Hand-to-Hand weapon skill
-- Skill Level: 200
-- Damage varies with TP.
-- Will stack with Sneak Attack.
-- Ignores some defense.
-- Aligned with the Light Gorget & Thunder Gorget.
-- Aligned with the Light Belt & Thunder Belt.
-- Element: None
-- Modifiers: STR:20% ; VIT:50%
-- 100%TP    200%TP    300%TP
-- 2.50      2.75      3.00
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID)

	local params = {};
	params.numHits = 2;
	params.ftp100 = 2.5; params.ftp200 = 2.75; params.ftp300 = 3;
	params.str_wsc = 0.2; params.dex_wsc = 0.0; params.vit_wsc = 0.5; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;

	if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
		params.ftp200 = 4.75; params.ftp300 = 8;
		params.str_wsc = 0.2; params.dex_wsc = 0.5; params.vit_wsc = 0.0;
	end

	local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	damage = damage * WEAPON_SKILL_POWER
	return tpHits, extraHits, criticalHit, damage;

end
