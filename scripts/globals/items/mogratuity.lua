-----------------------------------------
--	ID: 19776
--	Item: Moggratuity
--	Effect: Festive funds furnished by merry moogles
--	Charges: 10
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