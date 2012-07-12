-----------------------------------------
-- ID: 4135
-- Item: Hi-Ether +3
-- Item Effect: Restores 70 MP
-----------------------------------------

require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
value = 0;
mMP = target:getMaxMP();
cMP = target:getMP();

if (mMP == cMP) then
	value = 56; -- Does not let player use item if their hp is full
end
	
return value;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:messageBasic(25,0,target:addMP(70*ITEM_POWER));
end;
