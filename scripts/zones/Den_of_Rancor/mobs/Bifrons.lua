-----------------------------------
-- Area: Den of Rancor
--  MOB: Bifrons
-- Note: PH for Friar Rush
-----------------------------------
local ID = require("scripts/zones/Den_of_Rancor/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.FRIAR_RUSH_PH, 10, 3600) -- 1 hour
end
