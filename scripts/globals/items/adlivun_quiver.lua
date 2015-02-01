-----------------------------------------
--	ID: 6200
--	Item: Adlivun Quiver
--	Description: When used, you will
--	obtain one stack of Adlivun arrows.
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
	target:addItem(21306,99);
end;