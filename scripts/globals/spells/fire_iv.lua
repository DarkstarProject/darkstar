-----------------------------------------
-- Spell: Fire IV
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
    spellParams.V0 = 520;
    spellParams.V50 = 730;
    spellParams.V100 = 915;
    spellParams.V200 = 1200;
    spellParams.M0 = 4.2;
    spellParams.M50 = 3.7;
    spellParams.M100 = 2.85;
    spellParams.M200 = 2;

    return doElementalNuke(caster, spell, target, spellParams);
end;
