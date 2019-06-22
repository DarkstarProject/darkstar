-----------------------------------------
-- ID: 21314
-- Item: Abrasion Bolt
-- Additional Effect: Weakens Defense
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 95
    if (target:getMainLvl() > player:getMainLvl()) then
        chance = chance - 5 * (target:getMainLvl() - player:getMainLvl())
        chance = utils.clamp(chance, 5, 95)
    end
    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,dsp.magic.ele.WIND,0) <= 0.5) then
        return 0,0,0
    else
        target:delStatusEffect(dsp.effect.DEFENSE_BOOST)
        target:addStatusEffect(dsp.effect.DEFENSE_DOWN, 1, 0, 60)
        return dsp.subEffect.DEFENSE_DOWN, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.DEFENSE_DOWN
    end
end