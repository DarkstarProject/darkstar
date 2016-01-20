-----------------------------------------
-- Spell: Stone V
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
    spellParams.V0 = 650;
    spellParams.V50 = 950;
    spellParams.V100 = 1200;
    spellParams.V200 = 1600;
    spellParams.M0 = 6;
    spellParams.M50 = 5;
    spellParams.M100 = 4;
    spellParams.M200 = 3;

    return doElementalNuke(caster, spell, target, spellParams);
end;
