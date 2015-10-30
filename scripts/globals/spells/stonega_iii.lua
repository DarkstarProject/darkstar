-----------------------------------------
-- Spell: Stonega III
-- Deals earth damage to enemies within area of effect.
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
    spellParams.V0 = 500;
    spellParams.V50 = 750;
    spellParams.V100 = 950;
    spellParams.V200 = 1250;
    spellParams.M0 = 5;
    spellParams.M50 = 4;
    spellParams.M100 = 3;
    spellParams.M200 = 2;

    return doElementalNuke(caster, spell, target, spellParams);
end;
