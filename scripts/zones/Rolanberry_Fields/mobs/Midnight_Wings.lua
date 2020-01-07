-----------------------------------
-- Area: Rolanberry Fields
--  Mob: Midnight Wings
-- Note: PH for Black Triple Stars
-----------------------------------
local ID = require("scripts/zones/Rolanberry_Fields/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.BLACK_TRIPLE_STARS_PH, 10, 3600) -- 1 hour
end
