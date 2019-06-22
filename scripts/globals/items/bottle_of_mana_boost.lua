-----------------------------------------
-- ID: 4172
-- Item: Reraiser
-- Item Effect: +50% HP
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local duration = 900
    target:delStatusEffect(dsp.effect.MAX_MP_BOOST)
    target:addStatusEffect(dsp.effect.MAX_MP_BOOST,50,0,duration)
end
