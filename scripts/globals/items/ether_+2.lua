-----------------------------------------
-- ID: 4130
-- Item: Ether +2
-- Item Effect: Restores 30 MP
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
    target:addMP(30*ITEM_POWER);
    target:messageBasic(25,0,30);
end;
