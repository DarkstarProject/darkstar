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
    if (target:addStatusEffect(tpz.effect.SHELL, 9, 0, 1800)) then
        target:messageBasic(tpz.msg.basic.GAINS_EFFECT_OF_STATUS, tpz.effect.SHELL)
    else
        target:messageBasic(tpz.msg.basic.NO_EFFECT)
    end
end
