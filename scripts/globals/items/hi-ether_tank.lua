-----------------------------------------
-- ID: 13689
-- Hi-Ether Tank
-- When used, you will obtain one hi-ether
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(4132,1);
end;

