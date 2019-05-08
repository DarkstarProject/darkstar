-----------------------------------
-- Area: Bhaflau Thickets
--   NM: Mahishasura
-- !pos 206.510 -16.320 357.724 52
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.PLAGUE)
end

function onMobDeath(mob, player, isKiller)
end