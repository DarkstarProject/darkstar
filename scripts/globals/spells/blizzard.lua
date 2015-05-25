-----------------------------------------
-- Spell: Blizzard
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
    spellParams.V0 = 70;
    spellParams.V50 = 130;
    spellParams.V100 = 180;
    spellParams.V200 = 180;
    spellParams.M0 = 1.2;
    spellParams.M50 = 1;
    spellParams.M100 = 0;
    spellParams.M200 = 0;

    return doElementalNuke(caster, spell, target, spellParams);
end;
