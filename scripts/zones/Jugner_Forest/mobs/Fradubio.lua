----------------------------------
-- Area: Jugner_Forest
--  NM:  Fradubio
-- !pos 76.573 -0.901 -246.241 104
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)

    -- Set Fradubio spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(75600,86400));

end;