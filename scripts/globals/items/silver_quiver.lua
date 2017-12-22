-----------------------------------------
-- ID: 4226
-- Silver Quiver
-- When used, you will obtain one stack of Silver Arrows
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(17321,99);
end;