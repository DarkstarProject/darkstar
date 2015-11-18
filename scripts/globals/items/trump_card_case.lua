-- Trump Card Case
-- Lua By Reefed406
-- ItemID : 5870

function onItemCheck(target)
	local result = 0;
	if (target:getFreeSlotsCount() == 0) then
		result = 308;
	end
return result;
end;

-- OnItemUse
function onItemUse(target)
	target:addItem(2974, 99);
end;