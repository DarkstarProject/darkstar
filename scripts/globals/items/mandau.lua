-----------------------------------------
-- ID: 18270, 18271, 18638, 18652, 18666, 19747, 19840, 20555, 20556, 20583
-- Item: Mandau
-- Additional Effect: Poison
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 10

    if math.random(100) <= chance and applyResistanceAddEffect(player,target,dsp.magic.ele.WATER,0) > 0.5 then
        target:addStatusEffect(dsp.effect.POISON, 10, 3, 30) -- Power and Duration needs verified.
        return dsp.subEffect.POISON, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.POISON
    end
    
    return 0, 0, 0
end