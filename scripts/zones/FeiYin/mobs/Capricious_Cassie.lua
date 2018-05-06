-----------------------------------
-- Area: Fei'Yin
--  NM:  Capricious_Cassie
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.CASSIENOVA);
end;

function onMobDespawn(mob)

    -- Set Capricious_Cassie's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(75600,86400));

end;
