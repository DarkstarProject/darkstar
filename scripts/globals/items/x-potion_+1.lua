-----------------------------------------
-- ID: 4121
-- Item: X-Potion +1
-- Item Effect: Restores 160 HP
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
        target:addHP(160*ITEM_POWER);
	target:messageBasic(24,0,160);
end;
