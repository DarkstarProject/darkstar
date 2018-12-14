-----------------------------------------
-- ID: 18288, 18289, 18641, 18655, 18669, 19750, 19843, 20790, 20791, 21750
-- Item: Guttler
-- Additional Effect: Choke
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 10

    if math.random(100) <= chance and applyResistanceAddEffect(player, target, dsp.magic.ele.ICE, 0) > 0.5 then
        target:addStatusEffect(dsp.effect.CHOKE, 17, 0, 60)
        return dsp.subEffect.CHOKE, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.CHOKE
    end
    
    return 0, 0, 0
end