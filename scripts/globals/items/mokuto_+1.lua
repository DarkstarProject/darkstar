-----------------------------------------
-- ID: 16925
-- Item: Mokuto +1
-- Additional Effect: Silence
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 15
    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,dsp.magic.ele.WIND,0) <= 0.5) then
        return 0,0,0
    else
        target:addStatusEffect(dsp.effect.SILENCE, 10, 0, 30)
        return dsp.subEffect.SILENCE, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.SILENCE
    end
end