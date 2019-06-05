-----------------------------------------
-- ID: 16910
-- Item: Mamushito
-- Additional Effect: Stun
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 5

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,dsp.magic.ele.LIGHTNING,0) <= 0.5) then
        return 0,0,0
    else
        target:addStatusEffect(dsp.effect.STUN, 1, 0, 3)
        return dsp.subEffect.STUN, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.STUN
    end
end

