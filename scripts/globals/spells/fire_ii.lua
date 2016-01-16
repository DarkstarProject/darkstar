-----------------------------------------
-- Spell: Fire II
-- Deals fire damage to an enemy.
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
    spellParams.V0 = 160;
    spellParams.V50 = 280;
    spellParams.V100 = 365;
    spellParams.V200 = 465;
    spellParams.M0 = 2.4;
    spellParams.M50 = 1.7;
    spellParams.M100 = 1;
    spellParams.M200 = 0;

    return doElementalNuke(caster, spell, target, spellParams);
end;
