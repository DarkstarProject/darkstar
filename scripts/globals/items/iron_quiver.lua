-----------------------------------------
-- ID: 4225
-- Iron Quiver
-- When used, you will obtain one stack of Iron Arrows
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:getFreeSlotsCount() == 0) then
        result = 308
    end
    return result
end

function onItemUse(target)
    target:addItem(17320,99)
end