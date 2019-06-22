-----------------------------------------
-- ID: 4513
-- Item: Amrita
-- Item Effect: Restores 500 HP and MP over 300 seconds.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local worked = false
    if (not target:hasStatusEffect(dsp.effect.REGEN)) then
        target:addStatusEffect(dsp.effect.REGEN,5,3,300)
        worked = true
    end
    if (not target:hasStatusEffect(dsp.effect.REFRESH)) then
        target:addStatusEffect(dsp.effect.REFRESH,5,3,300)
        worked = true
    end
    if (not worked) then
        target:messageBasic(dsp.msg.basic.NO_EFFECT)
    end
end
