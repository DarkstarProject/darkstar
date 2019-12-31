-----------------------------------
-- Area: Castle Oztroja [S]
--  Mob: Yagudo Sentinel
-- Note: PH for Aa Xalmo the Savage and Zhuu Buxu the Silent
-----------------------------------
local ID = require("scripts/zones/Castle_Oztroja_[S]/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.AA_XALMO_THE_SAVAGE_PH, 10, 7200) -- 2 hour
    dsp.mob.phOnDespawn(mob, ID.mob.ZHUU_BUXU_THE_SILENT_PH, 10, 7200) -- 2 hour
end
