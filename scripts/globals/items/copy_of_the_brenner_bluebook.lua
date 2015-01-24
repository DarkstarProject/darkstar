-----------------------------------------
-- ID: 5323
-- Item: Copy of the Brenner Bluebook
-- When used, you will obtain one
-- Bluebook page
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
	target:addItem(5323,1);
	target:addItem(5324,1);
end;