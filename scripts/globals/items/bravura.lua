-----------------------------------------
-- ID: 18294, 18295, 18642, 18656, 18670, 19751, 19844, 20835, 20836, 21756
-- Item: Bravura
-- Additional Effect: Impairs evasion
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 10

    if math.random(100) <= chance and applyResistanceAddEffect(player, target, dsp.magic.ele.ICE, 0) > 0.5 then
        target:delStatusEffect(dsp.effect.EVASION_BOOST)
        target:addStatusEffect(dsp.effect.EVASION_DOWN, 15, 0, 60)
        return dsp.subEffect.EVASION_DOWN, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.EVASION_DOWN
    end

    return 0, 0, 0
end