-----------------------------------
-- Bora Axe
-- Axe weapon skill
-- Skill level: 290
-- Delivers a single-hit ranged attack at a maximum distance of 15.7'. Chance of binding varies with TP
-- Bind doesn't always break from hitting mob.
-- Not natively available to RNG
-- Aligned with the Breeze Gorget and Soil Gorget.
-- Aligned with the Breeze Belt and Soil Belt.
-- Element: Ice
-- Modifiers: DEX 100%  --http://wiki.bluegartr.com/bg/Bora_Axe
-- 100%TP    200%TP    300%TP
-- 4.5        4.5      4.5

-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID)

	local params = {};
	params.numHits = 1;
	params.ftp100 = 4.5; params.ftp200 = 4.5; params.ftp300 = 4.5;
	params.str_wsc = 0.0; params.dex_wsc = 1.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1.0;
	local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);

	if damage > 0 and (target:hasStatusEffect(EFFECT_BIND) == false) then
		target:addStatusEffect(EFFECT_BIND, 1, 0, 20);
	end

	return tpHits, extraHits, criticalHit, damage;

end
