-----------------------------------------
-- ID: 6265
-- Toolbag Ranka
-- When used, you will obtain one stack of Ranka
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:getFreeSlotsCount() == 0) then
        result = 308
    end
    return result
end

function onItemUse(target)
    target:addItem(8803,99)
end

