-----------------------------------------
--	ID: 19181
--	Item: Moogle's Largess
--	Effect: Moogle's generous gift
--	Charges: 9
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