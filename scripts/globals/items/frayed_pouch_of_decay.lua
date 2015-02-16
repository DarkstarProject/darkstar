-----------------------------------------
-- ID: 5857
-- Item: Frayed Pouch (D)
-- Effect: When used, you will obtain 1-12 Coins of Decay
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
	target:addItem(2606,amount);
end;

