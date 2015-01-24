-----------------------------------------
--	ID: 6140
--	Item: Damascus Bolt Quiver
--	Description: When used, you will
--	obtain one stack of Damascus Bolts.
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
	target:addItem(21322,99);
end;