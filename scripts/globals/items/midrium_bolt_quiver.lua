-----------------------------------------
--	ID: 6139
--	Item: Midrium Bolt Quiver
--	Description: When used, you will
--	obtain one stack of Midrium Bolts.
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
	target:addItem(21324,99);
end;