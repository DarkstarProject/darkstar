-----------------------------------------
-- ID: 5403
-- Ice Card Case
-- When used, you will obtain one stack of Ice Cards
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(2177,99);
end;
