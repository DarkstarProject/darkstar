-----------------------------------------
-- ID: 5362
-- Rainbow Powder
-- When applied, it makes things invisible.
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    if (target:hasStatusEffect(dsp.effect.MEDICINE)) then
        return dsp.msg.basic.ITEM_NO_USE_MEDICATED
    end
    return 0
end

function onItemUse(target)
    local duration = 180
    target:delStatusEffect(dsp.effect.INVISIBLE)
    target:addStatusEffect(dsp.effect.INVISIBLE, 0, 10, math.floor(duration * SNEAK_INVIS_DURATION_MULTIPLIER))
    target:addStatusEffect(dsp.effect.MEDICINE,0,0,180)
end
