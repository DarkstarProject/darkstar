-----------------------------------------
--	ID: 15927
--	Pinwheel Belt
--	When used, you will obtain 1 Stack of Pinwheels
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
	target:addItem(17309,99);
end;