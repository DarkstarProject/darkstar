-----------------------------------------
-- ID: 5829
-- Item: Lucid Ether III
-- Item Effect: Restores 750 MP
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

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
	target:addMP(750*ITEM_POWER);
	target:messageBasic(25,0,750);
end;
