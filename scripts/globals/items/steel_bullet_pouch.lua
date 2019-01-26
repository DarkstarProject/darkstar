-----------------------------------------
-- ID: 5416
-- Steel Bullet Pouch
-- When used, you will obtain one stack of Steel Bullets
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:getFreeSlotsCount() == 0) then
        result = 308
    end
    return result
end

function onItemUse(target)
    target:addItem(18723,99)
end