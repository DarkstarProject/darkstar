-----------------------------------------
-- ID: 4134
-- Item: Hi-Ether +2
-- Item Effect: Restores 60 MP
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
	mMP = target:getMaxMP();
	cMP = target:getMP();
		
	dif = mMP - cMP;
	if(dif > 60) then
		heal = 60;
	else
		heal = dif;
	end
	
	target:addMP(heal*ITEM_POWER);
	target:messageBasic(25,0,heal);
	
end;