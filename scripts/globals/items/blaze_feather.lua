-----------------------------------------
-- ID: 5257
-- Item: Fire Feather
-- Status Effect: Blaze Spikes
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.BLAZE_SPIKES, 10, 0, 180) -- This is a guess, no potency or duration info is known
end
