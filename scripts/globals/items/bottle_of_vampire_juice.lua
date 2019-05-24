-----------------------------------------
-- ID: 4512
-- Item: Vampire Juice
-- Item Effect: Restores 60 HP and MP over 90 seconds.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local worked = false
    if (not target:hasStatusEffect(dsp.effect.REGEN)) then
        target:addStatusEffect(dsp.effect.REGEN,2,3,90)
        worked = true
    end
    if (not target:hasStatusEffect(dsp.effect.REFRESH)) then
        target:addStatusEffect(dsp.effect.REFRESH,2,3,90)
        worked = true
    end
    if (not worked) then
        target:messageBasic(dsp.msg.basic.NO_EFFECT)
    end
end
