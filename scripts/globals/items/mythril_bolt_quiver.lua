-----------------------------------------
-- ID: 4228
-- Mythril Bolt Quiver
-- When used, you will obtain one stack of Mythril Bolts
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(17337,99);
end;