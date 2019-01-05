-----------------------------------
-- Area: Rolanberry Fields (110)
--  HMN: Simurgh
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/titles")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.SIMURGH_POACHER);
end;

function onMobDespawn(mob)

    -- Set Simurgh's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(75600,86400));

end;
