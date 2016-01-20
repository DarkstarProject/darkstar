-----------------------------------
-- Area: Yhoator Jungle (124)
--  MOB: Woodland_Sage
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)

    -- Set Woodland_Sage's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(75600,86400));

end;

