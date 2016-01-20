-----------------------------------------
-- Spell: Thundaga 
-- Deals thunder damage to enemies within area of effect.
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
    spellParams.V0 = 200;
    spellParams.V50 = 300;
    spellParams.V100 = 375;
    spellParams.V200 = 475;
    spellParams.M0 = 2;
    spellParams.M50 = 1.5;
    spellParams.M100 = 1;
    spellParams.M200 = 0;

    return doElementalNuke(caster, spell, target, spellParams);
end;
