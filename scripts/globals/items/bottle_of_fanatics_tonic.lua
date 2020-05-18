-----------------------------------------
-- ID: 5845
-- Item: Bottle of Fanatic's Tonic
-- Item Effect: Temp nullifies 50% physical dmg
-- Duration: 60 secs
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.PHYSICAL_SHIELD, 1, 3, 60)
end
