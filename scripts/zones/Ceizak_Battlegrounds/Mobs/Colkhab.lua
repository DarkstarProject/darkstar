-----------------------------------
--  Area: Ceizaki Battlegrounds
--   Mob: Colkhab
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

    -- Set Ahtu's spawnpoint and respawn time (2-4 hours)
    --UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((7200),(14400)));

end;

