-----------------------------------------
-- Spell: Aero IV
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
    spellParams.V0 = 480;
    spellParams.V50 = 700;
    spellParams.V100 = 890;
    spellParams.V200 = 1180;
    spellParams.M0 = 4.4;
    spellParams.M50 = 3.8;
    spellParams.M100 = 2.9;
    spellParams.M200 = 2;

    return doElementalNuke(caster, spell, target, spellParams);
end;
