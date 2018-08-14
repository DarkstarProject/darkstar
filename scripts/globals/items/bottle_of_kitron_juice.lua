-----------------------------------------
-- ID: 5932
-- Item: Bottle of Kitron Juice
-- Item Effect: Restores 180 MP over 180 seconds.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    if (not target:hasStatusEffect(dsp.effect.REFRESH)) then
        target:addStatusEffect(dsp.effect.REFRESH,3,3,180)
    else
        target:messageBasic(dsp.msg.basic.NO_EFFECT)
    end
end
