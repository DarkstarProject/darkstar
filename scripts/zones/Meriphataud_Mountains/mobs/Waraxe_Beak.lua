-----------------------------------
--  Area: Meriphataud Mountains (119)
--  Mob:  Waraxe_Beak
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    -- Set Waraxe_Beak's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((75600),(86400)));

end;

