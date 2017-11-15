-----------------------------------------
-- ID: 5313
-- Toolbag Mizu
-- When used, you will obtain one stack of mizu-deppo
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(1176,99);
end;

