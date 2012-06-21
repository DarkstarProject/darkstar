-----------------------------------------
-- ID: 4116
-- Item: Hi-Potion
-- Item Effect: Restores 100 HP
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
        target:addHP(100*ITEM_POWER);
	target:messageBasic(24,0,100);
end;
