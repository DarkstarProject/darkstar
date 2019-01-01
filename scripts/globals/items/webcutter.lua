-----------------------------------------
-- ID: 18040
-- Item: Webcutter
-- Additional Effect vs. vermin: Stun
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 40

    if math.random(100) <= chance and applyResistanceAddEffect(player, target, dsp.magic.ele.LIGHTNING, 0) > 0.5 then
        target:addStatusEffect(dsp.effect.STUN, 1, 0, 3)
        return dsp.subEffect.STUN, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.STUN
    end
end