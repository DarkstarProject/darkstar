-----------------------------------
--  Area: Bostaunieux Oubliette (167)
--   Mob: Phanduron_the_Condemned
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    -- Set Phanduron_the_Condemned's spawnpoint and respawn time (60-72 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((216000),(259200)));

end;

