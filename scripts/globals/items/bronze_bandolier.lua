-----------------------------------------
--	ID: 15926
--	Bronze Bandolier
--	When used, you will obtain 1 Stack Bronze Bullets
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
	target:addItem(17343,99);
end;