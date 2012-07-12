-----------------------------------------
-- ID: 4139
-- Item: Super Ether +3
-- Item Effect: Restores 120 MP
-----------------------------------------

require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0;
mMP = target:getMaxMP();
cMP = target:getMP();

if (mMP == cMP) then
	result = 56; -- Does not let player use item if their hp is full

end
	
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:messageBasic(25,0,target:addMP(120*ITEM_POWER));
end;
