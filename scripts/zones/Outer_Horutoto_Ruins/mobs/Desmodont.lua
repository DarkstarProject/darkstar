-----------------------------------
-- Area: Outer Horutoto Ruins
--   NM: Desmodont
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.BLIND)
end

function onMobDeath(mob, player, isKiller)
end
