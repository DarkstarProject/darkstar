-----------------------------------------
-- ID: 17116
-- Item: Misery Staff
-- Additional Effect: Curse
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
        target:addStatusEffect(dsp.effect.CURSE_I, 5, 0, 30)
        return dsp.subEffect.CURSE, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.CURSE_I
    end
end