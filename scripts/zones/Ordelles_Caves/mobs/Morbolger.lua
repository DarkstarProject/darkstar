-----------------------------------
-- Area: Ordelles Caves (193)
--   NM: Morbolger
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ALWAYS_AGGRO, 1) -- "Aggros regardless of level"
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.MORBOLBANE)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(75600, 86400)) -- 21 to 24 hours
end
