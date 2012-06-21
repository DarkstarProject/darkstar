-----------------------------------------
-- ID: 4123
-- Item: X-Potion +3
-- Item Effect: Restores 180 HP
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
        target:addHP(180*ITEM_POWER);
	target:messageBasic(24,0,180);
end;
