-----------------------------------------
-- ID: 4158
-- Item: Venom Potion
-- Item Effect: Removes 300 HP over 180 seconds
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    if (not target:hasStatusEffect(dsp.effect.POISON)) then
        target:addStatusEffect(dsp.effect.POISON,5,3,180)
    else
        target:messageBasic(dsp.msg.basic.NO_EFFECT)
    end
end
