-----------------------------------------
-- ID: 5112
-- Item: Frayed Sack of Mortality +2
-- Effect: When used, you will obtain
-- 12 Ghastly Stones +2
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
	target:addItem(3956,12);
end;