-----------------------------------------
-- ID: 5604
-- Item: Elshimo Pachira Fruit
-- Item Effect:  Poison 1HP / Removes 40 HP over 120 seconds
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    if (not target:hasStatusEffect(dsp.effect.POISON)) then
        target:addStatusEffect(dsp.effect.POISON,1,3,120)
    else
        target:messageBasic(dsp.msg.basic.NO_EFFECT)
    end
end
