-----------------------------------------
-- ID: 5278
-- Old Bolt Box
-- When used, you will obtain one partial stack of Dogbolt
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
    target:addItem(18189, math.random(99))
end
