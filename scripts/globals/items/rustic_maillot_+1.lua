-----------------------------------------
-- ID: 27805
-- Item: Rustic Maillot +1
-- Effect: When used, you will obtain 1 
-- Orange Snowcone.
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
	target:addItem(5713,1);
end;