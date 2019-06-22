-----------------------------------------
-- ID: 6266
-- Toolbag Furu
-- When used, you will obtain one stack of Furusumi
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
    target:addItem(8804,99)
end

