-----------------------------------------
-- Spell: Water V
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
    spellParams.V0 = 700;
    spellParams.V50 = 980;
    spellParams.V100 = 1217;
    spellParams.V200 = 1612;
    spellParams.M0 = 5.6;
    spellParams.M50 = 4.74;
    spellParams.M100 = 3.95;
    spellParams.M200 = 3;

    return doElementalNuke(caster, spell, target, spellParams);
end;
