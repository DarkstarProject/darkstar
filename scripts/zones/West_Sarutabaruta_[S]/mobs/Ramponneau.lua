-----------------------------------
-- Area: West Sarutabaruta [S]
--   NM: Ramponneau
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
    mob:addStatusEffect(dsp.effect.SHOCK_SPIKES, 10, 0, 0)
    mob:getStatusEffect(dsp.effect.SHOCK_SPIKES):setFlag(dsp.effectFlag.DEATH)
end

function onMobFight(mob,target)
    mob:SetMobAbilityEnabled(false)
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.ENBLIZZARD)
end

function onMobDeath(mob, player, isKiller)
end
