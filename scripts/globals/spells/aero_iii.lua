-----------------------------------------
-- Spell: Aero III
-- Deals wind damage to an enemy.
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
    spellParams.hasMultipleTargetReduction = false;
    spellParams.resistBonus = 1.0;
    spellParams.V0 = 260;
    spellParams.V50 = 430;
    spellParams.V100 = 570;
    spellParams.V200 = 760;
    spellParams.M0 = 3.4;
    spellParams.M50 = 2.8;
    spellParams.M100 = 1.9;
    spellParams.M200 = 1;

    return doElementalNuke(caster, spell, target, spellParams);
end;
