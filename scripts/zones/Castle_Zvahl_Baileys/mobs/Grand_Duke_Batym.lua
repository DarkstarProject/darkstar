-----------------------------------
--  Area: Castle Zvahl Baileys (161)
--    NM: Grand_Duke_Batym
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    -- Set Grand_Duke_Batym's spawnpoint and respawn time (21-24 hours)
    Grand_Duke_Batym = mob:getID();
    UpdateNMSpawnPoint(Grand_Duke_Batym);
    mob:setRespawnTime(math.random((75600),(86400)));

end;
