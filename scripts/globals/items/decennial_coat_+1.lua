-----------------------------------------
-- ID: 10253
-- Decennial Coat +1
-- Dispense: Moogurt
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(5935,1);
end;