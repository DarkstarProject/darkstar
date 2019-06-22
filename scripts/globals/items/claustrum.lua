-----------------------------------------
-- ID: 18330, 18331, 18648, 18662, 18676, 19757, 19850, 21135, 21136, 22060
-- Item: Claustrum
-- Additional Effect: Dispel
-----------------------------------------
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 15
    if math.random(100) <= chance then
        local effect = target:dispelStatusEffect()
        if effect ~= dsp.effect.NONE then
            return dsp.subEffect.DISPEL, dsp.msg.basic.ADD_EFFECT_DISPEL, effect
        end
    end

    return 0, 0, 0
end