-----------------------------------------
-- ID: 16791
-- Item: Death Scythe +1
-- Additional Effect: Drains HP
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 10

    if (math.random(0,99) >= chance) then
        return 0,0,0
    else
        local power = 10
        local params = {}
        params.bonusmab = 0
        params.includemab = false
        power = addBonusesAbility(player, dsp.magic.ele.DARK, target, power, params)
        power = power * applyResistanceAddEffect(player,target,dsp.magic.ele.DARK,0)
        power = adjustForTarget(target,power,dsp.magic.ele.DARK)
        power = finalMagicNonSpellAdjustments(player,target,dsp.magic.ele.DARK,power )

        if (power < 0) then
            power = 0
        else
            player:addHP(power)
        end

        return dsp.subEffect.HP_DRAIN, dsp.msg.basic.ADD_EFFECT_HP_DRAIN, power
    end
end