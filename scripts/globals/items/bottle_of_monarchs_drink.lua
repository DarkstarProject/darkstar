-----------------------------------------
-- ID: 5393
-- Item: bottle of Monarchs Drink
-- Item Effect: Restores 30 TP over 180 seconds.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    if not target:hasStatusEffect(dsp.effect.REGAIN) then
        target:addStatusEffect(dsp.effect.REGAIN,3,3,180)
    else
        target:messageBasic(dsp.msg.basic.NO_EFFECT)
    end
end
