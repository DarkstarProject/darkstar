-----------------------------------------
-- ID: 5256
-- Item: Fire Feather
-- Status Effect: Enfire
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.ENFIRE, 10, 0, 180) -- This is a guess, no potency or duration info is known
end
