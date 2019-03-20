-----------------------------------------
-- ID: 5436
--  Dusty Reraise
--  grants Reraise 3
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    if target:hasStatusEffect(dsp.effect.RERAISE) then
        target:delStatusEffect(dsp.effect.RERAISE)
    end
    target:addStatusEffect(dsp.effect.RERAISE,3,0,1800)
end
