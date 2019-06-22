-----------------------------------------
-- ID: 5272
-- Old Quiver +2
-- When used, you will obtain one partial stack of Crude Arrows +2
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
    target:addItem(18183, math.random(99))
end
