-----------------------------------
-- Area: Jugner_Forest
--   NM: Sappy Sycamore
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
    mob:addMod(dsp.mod.SLEEPRES, 20)
    mob:addMod(dsp.mod.BINDRES, 20)
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.SLOW, {power = 1500, duration = math.random(15, 25)})
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(3600, 4200)) -- repop 60-70min
end
