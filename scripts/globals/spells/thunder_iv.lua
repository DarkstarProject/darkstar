-----------------------------------------
-- Spell: Thunder IV
-- Deals lightning damage to an enemy.
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
    spellParams.V0 = 600;
    spellParams.V50 = 780;
    spellParams.V100 = 955;
    spellParams.V200 = 1230;
    spellParams.M0 = 3.6;
    spellParams.M50 = 3.5;
    spellParams.M100 = 2.75;
    spellParams.M200 = 2;

    return doElementalNuke(caster, spell, target, spellParams);
end;
