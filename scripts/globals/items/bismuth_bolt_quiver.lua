-----------------------------------------
--	ID: 6206
--	Item: Bismuth Bolt Quiver
--	Description: When used, you will
--	obtain one stack of Bismuth Bolts.
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
	target:addItem(21318,99);
end;