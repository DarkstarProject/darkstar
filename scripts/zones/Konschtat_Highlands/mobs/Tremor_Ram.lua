-----------------------------------
-- Area: Konschtat Highlands
--   NM: Tremor Ram
-----------------------------------
local ID = require("scripts/zones/Konschtat_Highlands/IDs")
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    if not dsp.mob.phOnDespawn(mob, ID.mob.STEELFLEECE_PH, 5, math.random(75600, 86400)) then -- 21-24 hours
        dsp.mob.phOnDespawn(mob, ID.mob.RAMPAGING_RAM_PH, 5, 3600) -- 1 hour
    end
end