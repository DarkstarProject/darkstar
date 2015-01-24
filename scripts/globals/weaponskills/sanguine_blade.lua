-----------------------------------
-- Weaponskill: Sanguine Blade
-- Sword weapon skill
-- Skill Level: 300
-- Drains a percentage of damage
-- dealt to HP varies with TP.
-- Will not stack with Sneak Attack.
-- Not aligned with any "elemental
-- gorgets" or "elemental belts"
-- due to it's absence of
-- Skillchain properties.
-- Element: Dark
-- Modifiers: STR:30% ; MND:50%
-- 100%TP    200%TP    300%TP
-- 2.75      2.75      2.75
-- HP Drained by TP:
-- 100%TP    200%TP    300%TP
-- 50%	     75%	100%
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");

-----------------------------------

function OnUseWeaponSkill(player, target, wsID)
	local tp = player:getTP();
	local drain = 0;
	if(tp >= 100 and tp <=199) then
		drain = 50;
	elseif(tp >= 200 and tp <= 299) then
		drain = 75;
	elseif(tp == 300) then
		drain = 100;
	end
	local params = {};
	params.numHits = 1;
	params.ftp100 = 2.75; params.ftp200 = 2.75; params.ftp300 = 2.75;
	params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.5; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	player:addHP(damage/drain);
	return tpHits, extraHits, criticalHit, damage;

end