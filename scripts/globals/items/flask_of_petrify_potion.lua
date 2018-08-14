-----------------------------------------
-- ID: 4160
-- Item: Petrify Potion
-- Item Effect: This potion induces petrify.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    if (not target:hasStatusEffect(dsp.effect.PETRIFICATION)) then
        target:addStatusEffect(dsp.effect.PETRIFICATION,1,3,180)
    else
        target:messageBasic(dsp.msg.basic.NO_EFFECT)
    end
end
