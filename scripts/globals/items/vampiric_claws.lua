-----------------------------------------
-- ID: 17510
-- Item: Vampiric Claws
-- Additional effect: HP Drain
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 10

    if (math.random(0,99) >= chance or target:isUndead()) then
        return 0,0,0
    else
        local drain = math.random(3,15)
        local params = {}
        params.bonusmab = 0
        params.includemab = false
        -- drain = addBonusesAbility(player, dsp.magic.ele.DARK, target, drain, params)
        drain = drain * applyResistanceAddEffect(player,target,dsp.magic.ele.DARK,0)
        drain = adjustForTarget(target,drain,dsp.magic.ele.DARK)
        drain = finalMagicNonSpellAdjustments(player,target,dsp.magic.ele.DARK,drain)

        return dsp.subEffect.HP_DRAIN, dsp.msg.basic.ADD_EFFECT_HP_DRAIN, player:addHP(drain)
    end
end