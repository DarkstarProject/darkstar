-----------------------------------------
-- ID: 18312, 18313, 18645, 18659, 18673, 19754, 19847, 20970, 20971, 21906
-- Item: Kikoku
-- Additional Effect: Paralysis
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 10

    if math.random(100) <= chance and applyResistanceAddEffect(player, target, dsp.magic.ele.ICE, 0) > 0.5 then
        target:addStatusEffect(dsp.effect.PARALYSIS, 17, 0, 30) -- Power needs verification/adjustment.
        return dsp.subEffect.PARALYSIS, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.PARALYSIS
    end
    
    return 0, 0, 0
end