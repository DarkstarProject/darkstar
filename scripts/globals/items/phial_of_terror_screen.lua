-----------------------------------------
-- ID: 5877
-- Item: Terror Screen
-- Effect: 2 Mins of immunity to "Terror" effects.
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    if (target:hasStatusEffect(dsp.effects.NEGATE_TERROR)) then
        return 56;
    end
    return 0;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.NEGATE_TERROR,1,0,120);
end;