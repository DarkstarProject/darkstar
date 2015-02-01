-----------------------------------------
-- ID: 5854
-- Item: Frayed Pouch of Birth
-- Effect: When used, you will obtain
-- 1-12 Coins of Birth
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:getFreeSlotsCount() == 0) then
		result = 308;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,12);
	target:addItem(2603,amount);
end;