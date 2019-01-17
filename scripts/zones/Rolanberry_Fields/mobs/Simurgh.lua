-----------------------------------
-- Area: Rolanberry Fields (110)
--  HMN: Simurgh
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/titles")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.SIMURGH_POACHER)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(75600, 86400)) -- 21 to 24 hours
end
