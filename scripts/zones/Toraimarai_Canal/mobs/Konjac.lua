-----------------------------------
-- Area: Toraimorai Canal
--   NM: Konjac
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    if math.random(100) > 20 then
        return 0, 0, 0
    else
        local power = math.random(10, 20)
        local params = {}
        params.bonusmab = 0
        params.includemab = false
        power = addBonusesAbility(mob, dsp.magic.ele.DARK, target, power, params)
        power = power * applyResistanceAddEffect(mob,target,dsp.magic.ele.DARK,0)
        power = adjustForTarget(target,power,dsp.magic.ele.DARK)
        power = finalMagicNonSpellAdjustments(mob,target,dsp.magic.ele.DARK,power)
        if power < 0 then
            power = 0
        end

        return dsp.subEffect.HP_DRAIN, dsp.msg.basic.ADD_EFFECT_HP_DRAIN, mob:addHP(power)
    end
end

function onMobDeath(mob, player, isKiller)
end
