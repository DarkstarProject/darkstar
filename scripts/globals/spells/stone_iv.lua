-----------------------------------------
-- Spell: Stone IV
-- Deals earth damage to an enemy.
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
    spellParams.V0 = 400;
    spellParams.V50 = 650;
    spellParams.V100 = 850;
    spellParams.V200 = 1150;
    spellParams.M0 = 5;
    spellParams.M50 = 4;
    spellParams.M100 = 3;
    spellParams.M200 = 2;

    return doElementalNuke(caster, spell, target, spellParams);
end;
