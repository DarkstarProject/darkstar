-----------------------------------------
-- ID: 5443
-- Item: Magnus Stone Pouch
-- Effect: When used, you will obtain one stack of Magnus stones
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
    target:addItem(19262,99);
end;

