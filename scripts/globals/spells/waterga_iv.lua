-----------------------------------------
-- Spell: Waterga IV
-- Deals water damage to enemies within area of effect.
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
    local spellParams = {};
    spellParams.hasMultipleTargetReduction = true;
    spellParams.resistBonus = 1.0;
    spellParams.V0 = 540;
    spellParams.V50 = 775;
    spellParams.V100 = 970;
    spellParams.V200 = 970;
    spellParams.M0 = 4.7;
    spellParams.M50 = 3.9;
    spellParams.M100 = 2.95;
    spellParams.M200 = 2.95;

    return doElementalNuke(caster, spell, target, spellParams);
end;