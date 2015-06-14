-----------------------------------------
-- Spell: Stone II
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
    spellParams.V0 = 100;
    spellParams.V50 = 250;
    spellParams.V100 = 350;
    spellParams.V200 = 450;
    spellParams.M0 = 3;
    spellParams.M50 = 2;
    spellParams.M100 = 1;
    spellParams.M200 = 1;

    return doElementalNuke(caster, spell, target, spellParams);
end;
