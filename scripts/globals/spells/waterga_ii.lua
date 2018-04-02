-----------------------------------------
-- Spell: Waterga II
-- Deals water damage to enemies within area of effect.
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0;
end;

function onSpellCast(caster, target, spell)
    local spellParams = {};
    spellParams.hasMultipleTargetReduction = true;
    spellParams.resistBonus = 1.0;
    spellParams.V0 = 280;
    spellParams.V50 = 465;
    spellParams.V100 = 610;
    spellParams.V200 = 805;
    spellParams.M0 = 3.7;
    spellParams.M50 = 2.9;
    spellParams.M100 = 1.95;
    spellParams.M200 = 1;

    return doElementalNuke(caster, spell, target, spellParams);
end;
