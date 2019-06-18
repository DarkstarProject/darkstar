-----------------------------------
-- Area: Konschtat Highlands
--   NM: Rampaging Ram
-----------------------------------
local ID = require("scripts/zones/Konschtat_Highlands/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.STEELFLEECE_PH, 10, math.random(75600, 86400)) -- 21-24 hours
end