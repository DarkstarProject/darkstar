-----------------------------------------
-- Spell: Holy
-- Deals light damage to an enemy.
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    -- doDivineNuke(V,M,caster,spell,target,hasMultipleTargetReduction,resistBonus)
    local params = {};
    params.dmg = 125;
    params.multiplier = 1;
    params.hasMultipleTargetReduction = false;
    params.resistBonus = 0;
    dmg = doDivineNuke(caster, target, spell, params);
    return dmg;
end;