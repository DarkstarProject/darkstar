-----------------------------------
-- Area: Uleguerand Range
--  MOB: Buffalo
-- Note: PH for Bonnacon
-----------------------------------
local ID = require("scripts/zones/Uleguerand_Range/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    phOnDespawn(mob, ID.mob.BONNACON_PH, 5, 3600) -- 1 hour
end
