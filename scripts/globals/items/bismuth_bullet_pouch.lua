-----------------------------------------
--	ID: 6210
--	Item: Bismuth Bullet Pouch
--	Description: When used, you will
--	obtain one stack of Bismuth Bullets.
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
	target:addItem(21333,99);
end;