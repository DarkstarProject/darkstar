-----------------------------------
-- Area: Jugner Forest
--   NM: Fraelissa
-----------------------------------
local ID = require("scripts/zones/Jugner_Forest/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    if not dsp.mob.phOnDespawn(mob, ID.mob.FRADUBIO_PH, 10, math.random(75600, 86400)) then -- 21-24 hours
        mob:setRespawnTime(math.random(3600, 4500)) -- 60 to 75 minutes
    end
end