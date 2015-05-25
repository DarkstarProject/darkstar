-----------------------------------------
-- Spell: Water III
-- Deals water damage to an enemy.
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
    spellParams.V0 = 230;
    spellParams.V50 = 415;
    spellParams.V100 = 560;
    spellParams.V200 = 755;
    spellParams.M0 = 3.7;
    spellParams.M50 = 2.9;
    spellParams.M100 = 1.95;
    spellParams.M200 = 1;

    return doElementalNuke(caster, spell, target, spellParams);
end;
