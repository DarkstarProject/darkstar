-----------------------------------------
-- Spell: Firaga III
-- Deals fire damage to enemies within area of effect.
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
    spellParams.V0 = 620;
    spellParams.V50 = 830;
    spellParams.V100 = 1015;
    spellParams.V200 = 1300;
    spellParams.M0 = 4.2;
    spellParams.M50 = 3.7;
    spellParams.M100 = 2.85;
    spellParams.M200 = 2;

    return doElementalNuke(caster, spell, target, spellParams);
end;
