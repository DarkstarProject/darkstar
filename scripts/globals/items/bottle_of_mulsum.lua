-----------------------------------------
-- ID: 4128
-- Item: Ether
-- Item Effect: Restores 10 MP
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/msg")

function onItemCheck(target)
    if (target:getMP() == target:getMaxMP()) then
        return dsp.msg.basic.ITEM_UNABLE_TO_USE
    end
    return 0
end

function onItemUse(target)
    target:messageBasic(dsp.msg.basic.RECOVERS_MP,0,target:addMP(10*ITEM_POWER))
end
