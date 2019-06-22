-----------------------------------------
-- ID: 18300, 18301, 18643, 18657, 18671, 19752, 19845, 20925, 20926, 21857
-- Item: Gungnir
-- Additional Effect: Weakens Defense
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 10

    if math.random(100) <= chance and applyResistanceAddEffect(player, target, dsp.magic.ele.WIND, 0) > 0.5 then
        target:delStatusEffect(dsp.effect.DEFENSE_BOOST)
        target:addStatusEffect(dsp.effect.DEFENSE_DOWN, 17, 0, 60) -- Power and duration needs verification
        return dsp.subEffect.DEFENSE_DOWN, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.DEFENSE_DOWN
    end

    return 0, 0, 0
end