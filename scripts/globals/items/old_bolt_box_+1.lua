-----------------------------------------
-- ID: 5279
-- Old Bolt Box +1
-- When used, you will obtain one partial stack of Dogbolt +1
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
    target:addItem(18190,quantity)
end
