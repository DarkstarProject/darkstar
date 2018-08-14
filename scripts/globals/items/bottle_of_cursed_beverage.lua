-----------------------------------------
-- ID: 4157
-- Item: Cursed Beverage
-- Item Effect: Removes 25 HP over 180 seconds
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    if (not target:hasStatusEffect(dsp.effect.POISON)) then
        target:addStatusEffect(dsp.effect.POISON,25,3,180)
    else
        target:messageBasic(dsp.msg.basic.NO_EFFECT)
    end
end
