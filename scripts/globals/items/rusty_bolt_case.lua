-----------------------------------------
--	ID: 4197
--	Item: Rusty Bolt Case
--	Description: When used, you will
--	obtain 99 Rusty Bolts
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
	target:addItem(17335,99);
end;