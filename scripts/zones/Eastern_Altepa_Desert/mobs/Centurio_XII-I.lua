-----------------------------------
-- Area: Eastern Altepa Desert (114)
--   NM: Centurio_XII-I
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)    

    -- Set Centurio XII-I's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((75600),(86400)));
    
end;

