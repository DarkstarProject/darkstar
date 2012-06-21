-----------------------------------------
-- ID: 4136
-- Item: Super Ether
-- Item Effect: Restores 100 MP
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
        target:addMP(100*ITEM_POWER);
	target:messageBasic(25,0,100);
end;
