-----------------------------------
-- Area: North Gustaberg [S]
--  MOB: Coppercap
-- Note: PH for Gloomanita
-----------------------------------
local ID = require("scripts/zones/North_Gustaberg_[S]/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob,ID.mob.GLOOMANITA_PH,10,3600) -- 1 hour
end
