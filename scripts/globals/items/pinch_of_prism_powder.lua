-----------------------------------------
-- ID: 4164
-- Prism Powder
-- When applied, it makes things invisible.
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local duration = math.random(60, 180)
    if (target:hasStatusEffect(dsp.effect.INVISIBLE)) then
        target:delStatusEffect(dsp.effect.INVISIBLE)
    end
    target:addStatusEffect(dsp.effect.INVISIBLE, 0, 10, math.floor(duration * SNEAK_INVIS_DURATION_MULTIPLIER))
end
