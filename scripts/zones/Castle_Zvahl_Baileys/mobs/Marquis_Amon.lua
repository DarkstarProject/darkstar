-----------------------------------
-- Area: Castle Zvahl Baileys (161)
--   NM: Marquis_Amon
-----------------------------------

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    -- Set Marquis_Amon's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(75600,86400));

end;

