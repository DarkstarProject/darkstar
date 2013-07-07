-----------------------------------
--  Area: Castle Zvahl Baileys (161)
--    NM: Duke_Haborym
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    -- Set Duke_Haborym's spawnpoint and respawn time (21-24 hours)
    Duke_Haborym = mob:getID();
    UpdateNMSpawnPoint(Duke_Haborym);
    mob:setRespawnTime(math.random(75600, 86400));

end;
