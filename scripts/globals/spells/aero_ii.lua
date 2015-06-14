-----------------------------------------
-- Spell: Aero II
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
    spellParams.V0 = 140;
    spellParams.V50 = 270;
    spellParams.V100 = 360;
    spellParams.V200 = 460;
    spellParams.M0 = 2.6;
    spellParams.M50 = 1.8;
    spellParams.M100 = 1;
    spellParams.M200 = 0;

    return doElementalNuke(caster, spell, target, spellParams);
end;
