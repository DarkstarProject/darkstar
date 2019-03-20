-----------------------------------------
-- ID: 5431
-- Item: Dusty Potion
-- Item Effect: Restores 300 HP
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/msg")

function onItemCheck(target)
    if (target:getHP() == target:getMaxHP()) then
        return dsp.msg.basic.ITEM_UNABLE_TO_USE
    end
    return 0
end

function onItemUse(target)
    target:messageBasic(dsp.msg.basic.RECOVERS_HP,0,target:addHP(300))
end
