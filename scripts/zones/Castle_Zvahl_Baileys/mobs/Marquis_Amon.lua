-----------------------------------
--  Area: Castle Zvahl Baileys (161)
--    NM: Marquis_Amon
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    -- Set Marquis_Amon's spawnpoint and respawn time (21-24 hours)
    Marquis_Amon = mob:getID();
    UpdateNMSpawnPoint(Marquis_Amon);
    mob:setRespawnTime(math.random((75600),(86400)));

end;

