-----------------------------------------
-- Spell: Blizzaga II
-- Deals ice damage to enemies within area of effect.
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
    spellParams.V0 = 370;
    spellParams.V50 = 510;
    spellParams.V100 = 640;
    spellParams.V200 = 820;
    spellParams.M0 = 2.8;
    spellParams.M50 = 2.6;
    spellParams.M100 = 1.8;
    spellParams.M200 = 1;

    return doElementalNuke(caster, spell, target, spellParams);
end;
