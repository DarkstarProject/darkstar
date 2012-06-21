-----------------------------------------
-- ID: 4113
-- Item: Potion +1
-- Item Effect: Restores 60 HP
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
	target:addHP(60*ITEM_POWER);
	target:messageBasic(24,0,60);
end;