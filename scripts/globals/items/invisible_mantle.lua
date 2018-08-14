-----------------------------------------
-- ID: 13685
-- Item: Invisible Mantle
-- Item Effect: gives invisible
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    if (target:hasStatusEffect(dsp.effect.INVISIBLE)) then
        target:messageBasic(dsp.msg.basic.NO_EFFECT)
    else
        target:addStatusEffect(dsp.effect.INVISIBLE, 0, 10, math.floor(180 * SNEAK_INVIS_DURATION_MULTIPLIER))
    end
end