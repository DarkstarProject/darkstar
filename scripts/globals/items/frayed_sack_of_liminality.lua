-----------------------------------------
-- ID: 5947
-- Item: Frayed Sack of Liminality
-- Effect: When used, you will obtain
-- 5-20 Liminal Residue
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
	local amount = math.random(5,20);
	target:addItem(3501,amount);
end;