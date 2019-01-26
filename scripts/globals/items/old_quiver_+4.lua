-----------------------------------------
-- ID: 5274
-- Old Quiver +4
-- When used, you will obtain one partial stack of Crude Arrows +4
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:getFreeSlotsCount() == 0) then
        result = 308
    end
    return result
end

function onItemUse(target)
    local quantity = math.random(99)
    target:addItem(18185,quantity)
end
