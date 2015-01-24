-----------------------------------------
--	ID: 6205
--	Item: Titanium Bolt Quiver
--	Description: When used, you will
--	obtain one stack of Titanium Bolts.
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
	target:addItem(21319,99);
end;