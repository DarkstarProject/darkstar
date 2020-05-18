-----------------------------------------
-- ID: 5843
-- Item: Bottle of Champion's Tonic
-- Item Effect: Temporarily increases potency
-- Duration: 60
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.POTENCY, 25, 3, 60)
end