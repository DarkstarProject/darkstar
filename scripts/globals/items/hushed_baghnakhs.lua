-----------------------------------------
-- ID: 18355
-- Item: Hushed Baghnakhs
-- Additional Effect: Silence
-- TODO: Enchantment: Ensilence
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 10

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,dsp.magic.ele.WIND,0) <= 0.5) then
        return 0,0,0
    else
        target:addStatusEffect(dsp.effect.SILENCE, 5, 0, 30)
        return dsp.subEffect.SILENCE, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.SILENCE
    end
end

function onItemCheck(target)
end

function onItemUse(target)
end