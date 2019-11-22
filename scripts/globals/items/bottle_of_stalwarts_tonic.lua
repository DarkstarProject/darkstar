-----------------------------------------
-- ID: 5839
-- Item: Bottle of Stalwart's Tonic
-- Item Effect: Temporarily increases atk power and acc
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.ATTACK_BOOST, 25, 3, 300)
    --player:addStatusEffect(dsp.effect., 25, 3, 60) -- TODO: add a status effect that increases ranged attack
    target:addStatusEffect(dsp.effect.ACCURACY_BOOST, 50, 3, 300)
    target:addStatusEffect(dsp.effect.SHARPSHOT, 50, 3, 300)
end