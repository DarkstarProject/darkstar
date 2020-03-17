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

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,tpz.magic.ele.DARK,0) <= 0.5) then
        return 0,0,0
    else
        target:addStatusEffect(tpz.effect.CURSE_I, 5, 0, 30)
        return tpz.subEffect.CURSE, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.CURSE_I
    end
end