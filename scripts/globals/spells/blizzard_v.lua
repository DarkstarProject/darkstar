-----------------------------------------
-- Spell: Blizzard V
-- Deals ice damage to an enemy.
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
    spellParams.V0 = 850;
    spellParams.V50 = 1070;
    spellParams.V100 = 1270;
    spellParams.V200 = 1650;
    spellParams.M0 = 4.4;
    spellParams.M50 = 4;
    spellParams.M100 = 3.8;
    spellParams.M200 = 3;

    return doElementalNuke(caster, spell, target, spellParams);
end;
