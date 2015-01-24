-----------------------------------------
-- ID: 5432
-- Item: Dusty Ether
-- Item Effect: Restores 150 MP
-----------------------------------------

require("scripts/globals/settings");
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
        target:addMP(150*ITEM_POWER);
	target:messageBasic(25,0,150);
end;
