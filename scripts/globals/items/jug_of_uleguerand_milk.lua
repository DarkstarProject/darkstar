-----------------------------------------
-- ID: 5703
-- Item: Uleguerand Milk
-- Item Effect: Restores 80 HP over 120 seconds
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    if (not target:hasStatusEffect(dsp.effect.REGEN)) then
        target:addStatusEffect(dsp.effect.REGEN,2,3,120)
    else
        target:messageBasic(dsp.msg.basic.NO_EFFECT)
    end
end
