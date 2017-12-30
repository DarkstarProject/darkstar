-----------------------------------------
-- ID: 5880
-- Item: Poison Screen
-- Effect: 2 Mins of immunity to "Poison" effects.
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    if (target:hasStatusEffect(EFFECT_NEGATE_POISON)) then
        return 56;
    end
    return 0;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_NEGATE_POISON,1,0,120);
end;