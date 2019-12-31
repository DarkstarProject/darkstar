-----------------------------------
-- Area: Fei'Yin
--   NM: Southern Shadow
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.EVA_DOWN)
end

function onMobDeath(mob, player, isKiller)
end