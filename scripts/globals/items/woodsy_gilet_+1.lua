-----------------------------------------
-- ID: 10266
-- Woodsy Gilet +1
-- Dispense: Berry Snowcone
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
    target:addItem(5710,1)
end