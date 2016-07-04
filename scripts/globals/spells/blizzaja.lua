-----------------------------------------
-- Spell: Blizzaja
-- Deals ice damage to enemies within area of effect.
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
    spellParams.V0 = 950;
    spellParams.V50 = 1170;
    spellParams.V100 = 1370;
    spellParams.V200 = 1750;
    spellParams.M0 = 4.4;
    spellParams.M50 = 4;
    spellParams.M100 = 3.8;
    spellParams.M200 = 3;

    return doElementalNuke(caster, spell, target, spellParams);
end;
