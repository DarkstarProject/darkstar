-----------------------------------------
-- ID: 5910
-- Item: Heavy Metal Pouch
-- Effect: When used, you will obtain 3-19 Heavy Metal Sheets
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
	local amount = math.random(3,19)
	target:addItem(3509,amount);
end;

