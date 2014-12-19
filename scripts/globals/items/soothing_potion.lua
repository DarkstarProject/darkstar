-----------------------------------------
-- ID: 4125
-- Item: Soothing Potion
-- Item Effect: Restores 250 HP
-----------------------------------------

require("scripts/globals/status");
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
    target:messageBasic(24,0,target:addHP(250*ITEM_POWER));
end;