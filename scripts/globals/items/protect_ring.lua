-----------------------------------------
-- ID: 15838
-- Item: Protect Ring
-- Item Effect: Protect II
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    if (target:addStatusEffect(tpz.effect.PROTECT, 40, 0, 1800)) then
        target:messageBasic(tpz.msg.basic.GAINS_EFFECT_OF_STATUS, tpz.effect.PROTECT)
    else
        target:messageBasic(tpz.msg.basic.NO_EFFECT)
    end
end
