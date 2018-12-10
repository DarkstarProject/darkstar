-----------------------------------
-- Area: Castle Oztroja (S)
--  MOB: Yagudo Sentinel
-- Note: PH for Aa Xalmo the Savage
-----------------------------------
local ID = require("scripts/zones/Castle_Oztroja_[S]/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    phOnDespawn(mob, ID.mob.AA_XALMO_THE_SAVAGE_PH, 10, 7200) -- 2 hour
end
