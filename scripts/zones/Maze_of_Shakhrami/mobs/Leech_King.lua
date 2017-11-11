-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Leech King (NM)
-----------------------------------
require("scripts/zones/Maze_of_Shakhrami/MobIDs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    if (math.random(2)==1) then
        DisallowRespawn(LEECH_KING, true);
        DisallowRespawn(ARGUS, false);
        UpdateNMSpawnPoint(ARGUS);
        GetMobByID(ARGUS):setRespawnTime(math.random(64800, 108000)); -- 18-30 hours
    else
        DisallowRespawn(ARGUS, true);
        DisallowRespawn(LEECH_KING, false);
        UpdateNMSpawnPoint(LEECH_KING);
        GetMobByID(LEECH_KING):setRespawnTime(math.random(64800, 108000)); -- 18-30 hours
    end
end;
