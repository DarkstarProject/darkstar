-----------------------------------------
-- ID: 4223
-- Scorpion Quiver
-- When used, you will obtain one stack of Scorpion Arrows
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(18155,99);
end;