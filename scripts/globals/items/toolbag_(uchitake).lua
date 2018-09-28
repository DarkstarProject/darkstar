-----------------------------------------
-- ID: 5308
-- Toolbag Uchi
-- When used, you will obtain one stack of uchitake
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(1161,99);
end;

