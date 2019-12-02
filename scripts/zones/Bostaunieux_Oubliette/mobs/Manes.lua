-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--   NM: Manes
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.TERROR)
end

function onMobDeath(mob, player, isKiller)
end
