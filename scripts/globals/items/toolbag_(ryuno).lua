-----------------------------------------
-- ID: 5865
-- Toolbag Ryuno
-- When used, you will obtain one stack of ryuno
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
    target:addItem(2644,99)
end

