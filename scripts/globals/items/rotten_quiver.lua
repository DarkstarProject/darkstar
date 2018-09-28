-----------------------------------------
-- ID: 4196
-- Rotten Quiver
-- When used, you will obtain 18 Old Arrows
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(17331,99);
end;