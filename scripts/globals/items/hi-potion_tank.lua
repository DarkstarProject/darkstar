-----------------------------------------
-- ID: 13688
-- Hi-Potion Tank
-- When used, you will obtain one Hi-Potion
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(4116,1);
end;