-----------------------------------------
-- ID: 5109
-- Item: Frayed Sack of Abundance +1
-- Effect: When used, you will obtain
-- 12 Verdigris Stones +1
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
	target:addItem(4034,12);
end;