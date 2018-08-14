-----------------------------------------
-- ID: 15838
-- Item: Coated Shield
-- Item Effect: Shell
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    if (target:addStatusEffect(dsp.effect.SHELL, 9, 0, 1800)) then
        target:messageBasic(dsp.msg.basic.GAINS_EFFECT_OF_STATUS, dsp.effect.SHELL)
    else
        target:messageBasic(dsp.msg.basic.NO_EFFECT)
    end
end
