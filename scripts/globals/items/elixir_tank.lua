-----------------------------------------
--	ID: 16249
--	Elixir Tank
--	When used, you will obtain one Elixir
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
	target:addItem(4145,1);
	target:messageBasic(100,1,1,1,1);
end;