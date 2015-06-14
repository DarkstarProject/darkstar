-----------------------------------------
-- Spell: Water
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
    spellParams.V0 = 80;
    spellParams.V50 = 220;
    spellParams.V100 = 315;
    spellParams.V200 = 415;
    spellParams.M0 = 2.8;
    spellParams.M50 = 1.9;
    spellParams.M100 = 1;
    spellParams.M200 = 0;

    return doElementalNuke(caster, spell, target, spellParams);
end;
