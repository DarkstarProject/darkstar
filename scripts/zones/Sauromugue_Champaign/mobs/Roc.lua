-----------------------------------
-- Area: Sauromugue Champaign (120)
--  HNM: Roc
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/titles")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.ROC_STAR);
end;

function onMobDespawn(mob)

    -- Set Roc's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(75600,86400));

end;
