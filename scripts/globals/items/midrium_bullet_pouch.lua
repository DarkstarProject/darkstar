-----------------------------------------
--	ID: 6142
--	Item: Midrium Bullet Pouch
--	Description: When used, you will
--	obtain one stack of Midrium Bullets.
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
	target:addItem(21339,99);
end;