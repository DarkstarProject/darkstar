-----------------------------------------
-- Spell: Aero
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
    spellParams.V0 = 40;
    spellParams.V50 = 120;
    spellParams.V100 = 170;
    spellParams.V200 = 170;
    spellParams.M0 = 1.6;
    spellParams.M50 = 1;
    spellParams.M100 = 0;
    spellParams.M200 = 0;

    return doElementalNuke(caster, spell, target, spellParams);
end;
