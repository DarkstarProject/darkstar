-----------------------------------------
-- ID: 4114
-- Item: Potion +2
-- Item Effect: Restores 75 HP
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
	target:addHP(75*ITEM_POWER);
	target:messageBasic(24,0,75);
end;