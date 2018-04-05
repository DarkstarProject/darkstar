-----------------------------------------
-- ID: 5879
-- Item: Doom Screen
-- Effect: 2 Mins of immunity to "Doom" effects.
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    if (target:hasStatusEffect(dsp.effects.NEGATE_DOOM)) then
        return 56;
    end
    return 0;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.NEGATE_DOOM,1,0,120);
end;