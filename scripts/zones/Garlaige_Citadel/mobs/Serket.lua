-----------------------------------
-- Area: Garlaige Citadel (200)
--  NM:  Serket
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(SERKET_BREAKER);
end;

function onMobDespawn(mob)

    -- Set Serket's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(75600,86400));

end;
