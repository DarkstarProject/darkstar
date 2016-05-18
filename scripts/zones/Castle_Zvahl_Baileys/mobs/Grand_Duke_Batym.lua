-----------------------------------
-- Area: Castle Zvahl Baileys (161)
--   NM: Grand_Duke_Batym
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Grand_Duke_Batym's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(75600,86400));

end;
