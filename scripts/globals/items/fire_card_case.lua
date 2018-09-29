-----------------------------------------
-- ID: 5402
-- Fire Card Case
-- When used, you will obtain one stack of Fire Cards
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(2176,99);
end;
