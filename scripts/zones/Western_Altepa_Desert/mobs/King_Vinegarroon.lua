-----------------------------------
-- Area: Western Altepa Desert
--   NM: King Vinegarroon
-----------------------------------
require("scripts/globals/weather")
require("scripts/globals/titles")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onMobDrawIn(mob, target)
    -- todo make him use AoE tp move
    mob:addTP(3000)
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.PETRIFY, {chance = 100})
end

function onMobDisengage(mob, weather)
    if weather ~= dsp.weather.DUST_STORM and weather ~= dsp.weather.SAND_STORM then
        DespawnMob(mob:getID())
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.VINEGAR_EVAPORATOR)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(75600, 86400)) -- 21 to 24 hours
end
