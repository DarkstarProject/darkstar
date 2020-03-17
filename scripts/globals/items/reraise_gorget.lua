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
    target:delStatusEffect(tpz.effect.RERAISE)
    target:addStatusEffect(tpz.effect.RERAISE,2,0,duration)
    target:messageBasic(tpz.msg.basic.GAINS_EFFECT_OF_STATUS, tpz.effect.RERAISE)
end
