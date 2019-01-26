-----------------------------------
-- Area: North Gustaberg [S]
--  MOB: Huge Spider
-- Note: Place holder for Ankabut
-----------------------------------
local ID = require("scripts/zones/North_Gustaberg_[S]/IDs")
require("scripts/globals/mobs")

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob,ID.mob.ANKABUT_PH,10,3600) -- 1 hour
end
