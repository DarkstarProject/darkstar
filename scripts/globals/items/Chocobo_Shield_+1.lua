-----------------------------------------
-- ID: 10812
-- Item: Chocobo Shield +1
-- Dispense: Sakura Biscuit
-----------------------------------------
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    if target:getFreeSlotsCount() == 0 then
        return dsp.msg.basic.ITEM_NO_USE_INVENTORY
    end
    return 0
end

function onItemUse(target)
    target:addItem(6010, 1)
end
