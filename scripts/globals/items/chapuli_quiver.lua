-----------------------------------------
--	ID: 6137
--	Item: Chapuli Quiver
--	Description: When used, you will
--	obtain one stack of Chapuli Arrows.
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
	target:addItem(21309,99);
end;