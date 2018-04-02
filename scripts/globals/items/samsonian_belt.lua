-----------------------------------------
-- ID: 15863
-- Samsonian Belt
--  This Belt boosts Stats
--  STR+3
-----------------------------------------


require("scripts/globals/status");

-----------------------------------------

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    local duration = 900;
    target:delStatusEffect(EFFECT.STR_BOOST);
    target:addStatusEffect(EFFECT.STR_BOOST,3,0,duration);
end;
