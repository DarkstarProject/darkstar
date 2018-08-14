-----------------------------------------
-- ID: 16905
-- Item: Bokuto
-- Additional Effect: Blindness
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
function onAdditionalEffect(player,target,damage)
    local chance = 10

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,dsp.magic.ele.DARK,0) <= 0.5) then
        return 0,0,0
    else
        target:addStatusEffect(dsp.effect.BLINDNESS, 10, 0, 30)
        return dsp.subEffect.BLIND, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.BLINDNESS
    end
end