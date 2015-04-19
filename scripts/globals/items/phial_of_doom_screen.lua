-----------------------------------------
-- ID: 5879
-- Item: Doom Screen
-- Effect: 2 Mins of immunity to "Doom" effects.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    if (target:hasStatusEffect(EFFECT_NEGATE_DOOM)) then
        return 56;
    end
    return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_NEGATE_DOOM,1,0,120);
end;