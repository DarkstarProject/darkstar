-----------------------------------------
-- ID: 21966
-- Item: Zanmato +1
-- Additional Effect: Dispel (Current dispel rate is guesstimate)
-----------------------------------------
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 5
    if math.random(100) <= chance then
        local effect = target:dispelStatusEffect()
        if effect ~= dsp.effect.NONE then
            return dsp.subEffect.DISPEL, dsp.msg.basic.ADD_EFFECT_DISPEL, effect
        end
    end

    return 0, 0, 0
end