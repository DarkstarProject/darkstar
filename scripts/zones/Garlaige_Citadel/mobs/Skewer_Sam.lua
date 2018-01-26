---------------------------------
-- Area: Garlaige Citadel (200)
--   NM: Skewer_Sam
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)

    -- Set Skewer_Sam's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(75600,86400));

end;