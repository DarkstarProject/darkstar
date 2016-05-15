-----------------------------------
-- Area: Batallia Downs (105)
--  MOB: Ahtu
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Ahtu's spawnpoint and respawn time (2-4 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((7200),(14400)));

end;