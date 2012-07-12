-----------------------------------------
-- ID: 4112
-- Item: Potion
-- Item Effect: Restores 50 HP
-----------------------------------------

require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0;
mHP = target:getMaxHP();
cHP = target:getHP();

if (mHP == cHP) then
	result = 56; -- Does not let player use item if their hp is full
end
	
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:messageBasic(24,0,target:addHP(50*ITEM_POWER));
end;