-----------------------------------
-- Area: Bhaflau Thickets
--  MOB: Harvestman
-- @pos 398.130 -10.675 179.169 52
-----------------------------------


-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Ahtu's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(75600,86400));

end;
