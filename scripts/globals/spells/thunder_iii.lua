-----------------------------------------
-- Spell: Thunder III
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
    spellParams.V0 = 350;
    spellParams.V50 = 475;
    spellParams.V100 = 600;
    spellParams.V200 = 775;
    spellParams.M0 = 2.5;
    spellParams.M50 = 2.5;
    spellParams.M100 = 1.75;
    spellParams.M200 = 1;

    return doElementalNuke(caster, spell, target, spellParams);
end;
