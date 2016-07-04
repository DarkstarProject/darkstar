-----------------------------------
-- Area: Meriphataud Mountains (119)
--  NM:  Waraxe_Beak
-----------------------------------

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    -- Set Waraxe_Beak's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(75600,86400));

end;

