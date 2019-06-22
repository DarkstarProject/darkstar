-----------------------------------------
--  ID: 15698
--  Sneaking Boots
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    target:delStatusEffect(dsp.effect.SNEAK)
    target:addStatusEffect(dsp.effect.SNEAK, 1, 0, math.floor(180 * SNEAK_INVIS_DURATION_MULTIPLIER))
end
