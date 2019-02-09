-----------------------------------------
-- ID: 17486
-- Item: Stun Claws +1
-- Additional Effect: Stun
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 10

    if math.random(100) <= chance and applyResistanceAddEffect(player,target,dsp.magic.ele.LIGHTNING,0) > 0.5 then
        target:addStatusEffect(dsp.effect.STUN, 1, 0, 3)
        return dsp.subEffect.STUN, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.STUN
    end
    
    return 0, 0, 0
end