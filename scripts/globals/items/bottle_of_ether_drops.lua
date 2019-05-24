-----------------------------------------
-- ID: 5357
-- Item: Ether Drop
-- Item Effect: Restores 15 MP
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    if (target:hasStatusEffect(dsp.effect.MEDICINE)) then
        return dsp.msg.basic.ITEM_NO_USE_MEDICATED
    end
    return 0
end

function onItemUse(target)
    target:addMP(15*ITEM_POWER)
    target:addStatusEffect(dsp.effect.MEDICINE,0,0,300)
end
