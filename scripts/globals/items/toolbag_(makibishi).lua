-----------------------------------------
-- ID: 5311
-- Toolbag Maki
-- When used, you will obtain one stack of makibishi
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(1170,99);
end;

