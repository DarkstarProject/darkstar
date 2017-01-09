-----------------------------------------
-- ID: 4129
-- Item: Ether +1
-- Item Effect: Restores 25 MP
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
    target:addMP(25*ITEM_POWER);
    target:messageBasic(25,0,25);
end;
