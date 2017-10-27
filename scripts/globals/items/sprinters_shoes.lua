-----------------------------------------
-- ID: 15754
-- Item: Sprinter's Shoes
-- Item Effect: Quickening for 60 minutes
-----------------------------------------
require("scripts/globals/settings");
require("scripts/globals/msg");

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
    target:addStatusEffect(EFFECT_QUICKENING, 10, 0, 3600);
    target:messageBasic(msgBasic.GAINS_EFFECT,0, EFFECT_QUICKENING);
end;
