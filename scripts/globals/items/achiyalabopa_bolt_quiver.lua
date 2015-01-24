-----------------------------------------
--	ID: 6203
--	Item: Achiyalabopa Bolt Quiver
--	Description: When used, you will
--	obtain one stack of Achiyalabopa
--	Bolts.
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
	target:addItem(21321,99);
end;