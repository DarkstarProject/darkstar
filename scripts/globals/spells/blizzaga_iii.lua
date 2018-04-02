-----------------------------------------
-- Spell: Blizzaga III
-- Deals ice damage to enemies within area of effect.
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
    spellParams.V0 = 660;
    spellParams.V50 = 855;
    spellParams.V100 = 1035;
    spellParams.V200 = 1315;
    spellParams.M0 = 3.9;
    spellParams.M50 = 3.6;
    spellParams.M100 = 2.8;
    spellParams.M200 = 2;

    return doElementalNuke(caster, spell, target, spellParams);
end;
