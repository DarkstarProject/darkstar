-----------------------------------------
-- ID: 15754
-- Item: Sprinter's Shoes
-- Item Effect: Quickening for 60 minutes
-----------------------------------------

require("scripts/globals/settings");

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
    target:delStatusEffect(EFFECT_QUICKENING);
    target:addStatusEffect(EFFECT_QUICKENING, 10, 0, 3600);
    target:messageBasic(266,0, EFFECT_QUICKENING);
end;