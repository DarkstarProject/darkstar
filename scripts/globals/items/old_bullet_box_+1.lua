-----------------------------------------
-- ID: 5285
-- Old Bullet Box +1
-- When used, you will obtain one partial stack of Antique Bullets +1
-----------------------------------------
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if target:getFreeSlotsCount() == 0 then
        result = dsp.msg.basic.ITEM_NO_USE_INVENTORY
    end
    return result
end

function onItemUse(target)
    target:addItem(17276, math.random(99))
end
