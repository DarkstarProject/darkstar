-----------------------------------------
-- ID: 4112
-- Item: Potion
-- Item Effect: Restores 50 HP
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
    target:messageBasic(24,0,target:addHP(50*ITEM_POWER));
end;