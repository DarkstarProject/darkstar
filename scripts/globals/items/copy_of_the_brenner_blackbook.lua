-----------------------------------------
-- ID: 5325
-- Item: Copy of the Brenner Blackbook
-- When used, you will obtain one
-- Blackbook page
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
	target:addItem(5325,1);
	target:addItem(5326,1);
end;