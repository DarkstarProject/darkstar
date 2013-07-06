-----------------------------------
--  Area: Castle Zvahl Baileys (161)
--    NM: Marquis_Allocen
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    -- Set Marquis_Allocen's spawnpoint and respawn time (21-24 hours)
    Marquis_Allocen = mob:getID();
    UpdateNMSpawnPoint(Marquis_Allocen);
    SpawnMob(Marquis_Allocen, '', math.random((75600),(86400)));

end;
