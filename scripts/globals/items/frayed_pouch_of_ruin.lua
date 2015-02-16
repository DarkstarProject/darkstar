-----------------------------------------
-- ID: 5858
-- Item: Frayed Pouch (R)
-- Effect: When used, you will obtain 1-12 Coins of Ruin
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
	target:addItem(2607,amount);
end;

