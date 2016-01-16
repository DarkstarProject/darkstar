-----------------------------------------
-- Spell: Tornado II
-- Deals wind damage to an enemy and lowers its resistance against ice.
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
    spellParams.V0 = 800;
    spellParams.V50 = 900;
    spellParams.V100 = 1000;
    spellParams.V200 = 1200;
    spellParams.M0 = 2;
    spellParams.M50 = 2;
    spellParams.M100 = 2;
    spellParams.M200 = 2;

    return doElementalNuke(caster, spell, target, spellParams);
end;
