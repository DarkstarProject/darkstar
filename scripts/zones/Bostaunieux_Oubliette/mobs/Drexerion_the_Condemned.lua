-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--  MOB: Drexerion_the_Condemned
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)

    -- Set Drexerion_the_Condemned's spawnpoint and respawn time (60-72 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(216000,259200));

end;

