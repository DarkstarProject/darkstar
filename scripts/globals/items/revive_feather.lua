-----------------------------------------
-- ID: 5258
-- Item: Revive Feather
-- Status Effect: Reraise
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local duration = 7200
    target:delStatusEffect(dsp.effect.RERAISE)
    target:addStatusEffect(dsp.effect.RERAISE, 1, 0, duration)
    target:messageBasic(dsp.msg.basic.GAINS_EFFECT_OF_STATUS, dsp.effect.RERAISE)
end
