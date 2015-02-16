-----------------------------------------
-- ID: 5856
-- Item: Frayed Pouch (G)
-- Effect: When used, you will obtain 1-12 Coins of Glory
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
	local amount = math.random(1,12)
	target:addItem(2605,amount);
end;

