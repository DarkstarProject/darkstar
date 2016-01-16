-----------------------------------------
-- Spell: Fire III
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
    spellParams.V0 = 290;
    spellParams.V50 = 445;
    spellParams.V100 = 580;
    spellParams.V200 = 765;
    spellParams.M0 = 3.1;
    spellParams.M50 = 2.7;
    spellParams.M100 = 1.85;
    spellParams.M200 = 1;

    return doElementalNuke(caster, spell, target, spellParams);
end;
