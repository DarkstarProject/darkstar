-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--  MOB: Phanduron_the_Condemned
-----------------------------------

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    -- Set Phanduron_the_Condemned's spawnpoint and respawn time (60-72 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(216000,259200));

end;

