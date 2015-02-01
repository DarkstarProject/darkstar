-----------------------------------------
-- ID: 5111
-- Item: Frayed Sack of Mortality +1
-- Effect: When used, you will obtain
-- 12 Ghastly Stones +1
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
	target:addItem(3955,12);
end;