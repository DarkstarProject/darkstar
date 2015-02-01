-----------------------------------------
--	ID: 19246
--	Item: Moggiebag
--	Effect: Moogles Secret Cache
--	Charges: 8
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0;
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addGil(math.random(2000,10000);
end;