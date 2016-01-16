-----------------------------------------
--    ID: 15863
--    Samsonian Belt
--  This Belt boosts Stats
--  STR+3
-----------------------------------------


require("scripts/globals/status");


-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return 0;
end;
-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    local duration = 900;
    target:delStatusEffect(EFFECT_STR_BOOST);
    target:addStatusEffect(EFFECT_STR_BOOST,3,0,duration);
end;
