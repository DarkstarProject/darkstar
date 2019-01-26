-----------------------------------
-- Area: Caedarva Mire
--  MOB: Wild_Karakul
-- Note: PH for Peallaidh
-----------------------------------
local ID = require("scripts/zones/Caedarva_Mire/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.PEALLAIDH_PH, 5, 3600) -- 1 hour
end
