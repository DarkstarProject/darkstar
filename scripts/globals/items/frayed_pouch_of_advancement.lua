-----------------------------------------
-- ID: 5855
-- Item: Frayed Pouch of Advancement
-- Effect: When used, you will obtain
-- 1-12 Coins of Advancement
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
	target:addItem(2604,amount);
end;