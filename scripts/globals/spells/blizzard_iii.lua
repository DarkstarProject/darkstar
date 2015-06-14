-----------------------------------------
-- Spell: Blizzard III
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
    spellParams.V0 = 320;
    spellParams.V50 = 460;
    spellParams.V100 = 590;
    spellParams.V200 = 770;
    spellParams.M0 = 2.8;
    spellParams.M50 = 2.6;
    spellParams.M100 = 1.8;
    spellParams.M200 = 1;

    return doElementalNuke(caster, spell, target, spellParams);
end;
