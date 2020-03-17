-----------------------------------
-- Area: Korroloka Tunnel (173)
--   NM: Cargo Crab Colin
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.POISON, {power = 10})
end

function onMobDeath(mob, player, isKiller)
end