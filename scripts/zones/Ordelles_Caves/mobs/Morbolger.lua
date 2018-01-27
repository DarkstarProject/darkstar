-----------------------------------
-- Area: Ordelles Caves (193)
--  MOB: Morbolger
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(MORBOLBANE);
end;

function onMobDespawn(mob)

    -- Set Morbolger's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(75600,86400));

end;
