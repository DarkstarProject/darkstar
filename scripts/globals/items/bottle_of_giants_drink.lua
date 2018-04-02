-----------------------------------------
-- ID: 4172
-- Item: Reraiser
-- Item Effect: +100% HP
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    local duration = 900;
    target:delStatusEffect(dsp.effects.MAX_HP_BOOST);
    target:addStatusEffect(dsp.effects.MAX_HP_BOOST,100,0,duration);
end;
