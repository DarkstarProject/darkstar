-----------------------------------
-- Area: East Ronfaure [S]
--   NM: Melusine
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(7200 + math.random(0, 10) * 60)
end
