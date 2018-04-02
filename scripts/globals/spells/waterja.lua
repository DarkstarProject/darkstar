-----------------------------------------
-- Spell: Waterja
-- Deals water damage to enemies within area of effect.
-- Successive use enhances spell potency.
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
    spellParams.V0 = 800;
    spellParams.V50 = 1080;
    spellParams.V100 = 1317;
    spellParams.V200 = 1712;
    spellParams.M0 = 5.6;
    spellParams.M50 = 4.75;
    spellParams.M100 = 3.95;
    spellParams.M200 = 3;

    return doElementalNuke(caster, spell, target, spellParams);
end;
