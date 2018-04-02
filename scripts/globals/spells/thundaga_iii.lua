-----------------------------------------
-- Spell: Thundaga III
-- Deals lightning damage to enemies within area of effect.
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
    spellParams.V0 = 700;
    spellParams.V50 = 880;
    spellParams.V100 = 1055;
    spellParams.V200 = 1330;
    spellParams.M0 = 3.6;
    spellParams.M50 = 3.5;
    spellParams.M100 = 2.75;
    spellParams.M200 = 2;

    return doElementalNuke(caster, spell, target, spellParams);
end;
