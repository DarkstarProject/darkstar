-----------------------------------------
--  ID: 16224
--  Apple au lait Tank
--  When used, you will obtain one Apple au lait
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
    target:addItem(4300,1)
end