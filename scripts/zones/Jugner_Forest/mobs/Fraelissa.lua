-----------------------------------
-- Area: Jugner Forest (104)
--   NM: Fraelissa
-- !pos 9.320 -0.493 -371.654 104
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(3600, 4500)) -- 60 to 75 minutes
end