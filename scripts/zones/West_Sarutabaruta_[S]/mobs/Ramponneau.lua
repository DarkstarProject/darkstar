-----------------------------------
-- Area: West Sarutabaruta (S)
--   NM: Ramponneau
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
    mob:addStatusEffect(dsp.effect.SHOCK_SPIKES, 10, 0, 0)
    mob:getStatusEffect(dsp.effect.SHOCK_SPIKES):setFlag(dsp.effectFlag.DEATH)
end

function onMobFight(mob,target)
    mob:SetMobAbilityEnabled(false)
end

function onAdditionalEffect(mob,target,damage)
    local power = math.random(4, 15)
    local params = {}
    params.bonusmab = 0
    params.includemab = false
    power = addBonusesAbility(mob, dsp.magic.ele.ICE, target, power, params)
    power = power * applyResistanceAddEffect(mob, target, dsp.magic.ele.ICE, 0)
    power = adjustForTarget(target, power, dsp.magic.ele.ICE)
    power = finalMagicNonSpellAdjustments(mob, target, dsp.magic.ele.ICE, power)

    local message = dsp.msg.basic.ADD_EFFECT_DMG
    if power < 0 then
        message = dsp.msg.basic.ADD_EFFECT_HEAL
    end

    return dsp.subEffect.ICE_DAMAGE, message, power
end

function onMobDeath(mob, player, isKiller)
end
