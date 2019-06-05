-----------------------------------------
-- ID: 16429
-- Item: Silence baghnakhs
-- Additional Effect: Silence
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 10

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,dsp.magic.ele.WIND,0) <= 0.5) then
        return 0,0,0
    else
        if (not target:hasStatusEffect(dsp.effect.SILENCE)) then
            target:addStatusEffect(dsp.effect.SILENCE, 1, 0, 60)
        end
        return dsp.subEffect.SILENCE, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.SILENCE
    end
end