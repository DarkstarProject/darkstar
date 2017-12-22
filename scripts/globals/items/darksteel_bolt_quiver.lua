-----------------------------------------
-- ID: 4229
-- Darksteel Bolt Quiver
-- When used, you will obtain one stack of Darksteel Bolts
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(17338,99);
end;