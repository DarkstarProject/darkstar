-----------------------------------------
-- ID: 4118
-- Item: Hi-Potion +2
-- Item Effect: Restores 120 HP
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
        target:addHP(120*ITEM_POWER);
	target:messageBasic(24,0,120);
end;
