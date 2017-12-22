-----------------------------------------
-- ID: 16226
-- Pamama Tank
-- When used, you will obtain one Pamama au lait
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(4302,1);
end;