-----------------------------------------
-- ID: 18033
-- Item: Adder Jambiya +1
-- Additional Effect: Impairs evasion
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 15

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,dsp.magic.ele.ICE,0) <= 0.5) then
        return 0,0,0
    else
        target:delStatusEffect(dsp.effect.EVASION_BOOST)
        target:addStatusEffect(dsp.effect.EVASION_DOWN, 12, 0, 60)
        return dsp.subEffect.EVASION_DOWN, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.EVASION_DOWN
    end
end