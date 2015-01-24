-----------------------------------------
--	ID: 6204
--	Item: Adlivun Bolt Quiver
--	Description: When used, you will
--	obtain one stack of Adlivun Bolts.
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
	target:addItem(21320,99);
end;