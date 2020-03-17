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
        target:messageBasic(tpz.msg.basic.NO_EFFECT)
    else
        target:addStatusEffect(tpz.effect.SLEEP_I, 0, 0, 30)
    end
end
