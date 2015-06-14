-----------------------------------------
-- Spell: Water IV
-- Deals water damage to an enemy.
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
    spellParams.V0 = 440;
    spellParams.V50 = 675;
    spellParams.V100 = 870;
    spellParams.V200 = 1165;
    spellParams.M0 = 4.7;
    spellParams.M50 = 3.9;
    spellParams.M100 = 2.95;
    spellParams.M200 = 2;

    return doElementalNuke(caster, spell, target, spellParams);
end;
