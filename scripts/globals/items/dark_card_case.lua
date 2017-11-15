-----------------------------------------
-- ID: 5409
-- Dark Card Case
-- When used, you will obtain one stack of Dark Cards
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(2183,99);
end;
