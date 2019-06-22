-----------------------------------------
-- ID: 5822
-- Oberon Bullet Pouch
-- When used, you will obtain one stack of Oberon Bullets
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
    target:addItem(19199,99)
end