-----------------------------------
-- Area: Bhaflau Thickets
--   NM: Nis Puk
-- !pos -155.319 -15.959 -599.366 52
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.ENAERO)
end

function onMobDeath(mob, player, isKiller)
end