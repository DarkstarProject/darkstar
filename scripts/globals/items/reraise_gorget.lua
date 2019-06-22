-----------------------------------------
-- ID: 13171
-- Reraise Gorget
--  This necklace functions in the same way as the spell Reraise II.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local duration = 7200
    target:delStatusEffect(dsp.effect.RERAISE)
    target:addStatusEffect(dsp.effect.RERAISE,2,0,duration)
    target:messageBasic(dsp.msg.basic.GAINS_EFFECT_OF_STATUS, dsp.effect.RERAISE)
end
