-----------------------------------------
-- ID: 5821
-- Fusion Bolt Quiver
-- When used, you will obtain one stack of Fusion Bolts
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(19197,99);
end;