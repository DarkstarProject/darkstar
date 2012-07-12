-----------------------------------------
-- ID: 4120
-- Item: X-Potion
-- Item Effect: Restores 150 HP
-----------------------------------------

require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
value = 0;
mHP = target:getMaxHP();
cHP = target:getHP();

if (mHP == cHP) then
	value = 56; -- Does not let player use item if their hp is full
end
	
return value;
end;
-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	mHP = target:getMaxHP();
	cHP = target:getHP();
		
	dif = mHP - cHP;
	if(dif > 150) then
		heal = 150;
	else
		heal = dif;
	end
	
	target:addHP(heal*ITEM_POWER);
	target:messageBasic(24,0,heal);
	
end;