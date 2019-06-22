----------------------------------
-- Area: Kuftal Tunnel
--   NM: Yowie
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.ENSTONE, {chance = 20}) -- "Enstone's frequency is mildly low"
end

function onMobDeath(mob, player, isKiller)
end