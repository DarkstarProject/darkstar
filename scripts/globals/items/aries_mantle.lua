-----------------------------------------
-- ID: 13693
-- Item: Aries Mantle
-- Enchantment: Sleep
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    if (hasSleepEffects(target)) then
        target:messageBasic(dsp.msg.basic.NO_EFFECT)
    else
        target:addStatusEffect(dsp.effect.SLEEP_I, 0, 0, 30)
    end
end
