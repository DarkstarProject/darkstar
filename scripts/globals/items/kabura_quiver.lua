-----------------------------------------
-- ID: 5332
-- Kabura Quiver
-- When used, you will obtain one stack of Kabura Arrows
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(17325,99);
end;