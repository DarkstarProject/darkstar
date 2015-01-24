-----------------------------------------
--	ID: 6202
--	Item: Raaz Quiver
--	Description: When used, you will
--	obtain one stack of Raaz arrows.
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
	target:addItem(21304,99);
end;