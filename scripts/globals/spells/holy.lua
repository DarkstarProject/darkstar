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
    local dmg = doDivineNuke(125,1,caster,spell,target,false,0);
    return dmg;
end;