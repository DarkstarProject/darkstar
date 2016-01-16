-----------------------------------------
-- ID: 4128
-- Item: Ether
-- Item Effect: Restores 20 MP
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
    target:addMP(20*ITEM_POWER);
    target:messageBasic(25,0,20);
end;