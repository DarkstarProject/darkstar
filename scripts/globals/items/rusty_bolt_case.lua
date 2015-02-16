-----------------------------------------
--	ID: 4197
--	Rusty Bolt Case
--	When used, you will obtain 12 Rusty Bolts
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0;
	if (target:getFreeSlotsCount() == 0) then
		result = 308;
	end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addItem(17335,12);
end;