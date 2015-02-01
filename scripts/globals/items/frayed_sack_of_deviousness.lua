-----------------------------------------
-- ID: 5946
-- Item: Frayed Sack of Deviousness
-- Effect: When used, you will obtain
-- 5-20 Devious Die
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
	local amount = math.random(5,20);
	target:addItem(3511,amount);
end;