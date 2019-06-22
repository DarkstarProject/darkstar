-----------------------------------
-- Area: Outer Horutoto Ruins
--  MOB: Stink Bats
-- Note: PH for Desmodont
-----------------------------------
local ID = require("scripts/zones/Outer_Horutoto_Ruins/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.DESMODONT_PH, 10, 3600) -- 1 hour
end
