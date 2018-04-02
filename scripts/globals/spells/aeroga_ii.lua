-----------------------------------------
-- Spell: Aeroga II
-- Deals wind damage to enemies within area of effect.
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
    spellParams.V0 = 310;
    spellParams.V50 = 480;
    spellParams.V100 = 620;
    spellParams.V200 = 810;
    spellParams.M0 = 3.4;
    spellParams.M50 = 2.8;
    spellParams.M100 = 1.9;
    spellParams.M200 = 1;

    return doElementalNuke(caster, spell, target, spellParams);
end;
