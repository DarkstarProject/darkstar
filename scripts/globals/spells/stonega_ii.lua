-----------------------------------------
-- Spell: Stonega II
-- Deals earth damage to enemies within area of effect.
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
    spellParams.V0 = 250;
    spellParams.V50 = 450;
    spellParams.V100 = 600;
    spellParams.V200 = 800;
    spellParams.M0 = 4;
    spellParams.M50 = 3;
    spellParams.M100 = 2;
    spellParams.M200 = 1;

    return doElementalNuke(caster, spell, target, spellParams);
end;
