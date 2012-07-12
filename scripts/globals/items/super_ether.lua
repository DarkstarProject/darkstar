-----------------------------------------
-- ID: 4136
-- Item: Super Ether
-- Item Effect: Restores 100 MP
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
	mMP = target:getMaxMP();
	cMP = target:getMP();
		
	dif = mMP - cMP;
	if(dif > 100) then
		heal = 100;
	else
		heal = dif;
	end
	
	target:addMP(heal*ITEM_POWER);
	target:messageBasic(25,0,heal);

	
end;
