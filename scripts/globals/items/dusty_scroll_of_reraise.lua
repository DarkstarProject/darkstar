-----------------------------------------
-- ID: 5436
--  Dusty Reraise
--  Brings you back from the dead~!
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    if target:hasStatusEffect(dsp.effect.RERAISE) then
        target:delStatusEffect(dsp.effect.RERAISE)
        target:addStatusEffect(dsp.effect.RERAISE,3,0,1800)
    else
        target:addStatusEffect(dsp.effect.RERAISE,3,0,1800)
    end
end
