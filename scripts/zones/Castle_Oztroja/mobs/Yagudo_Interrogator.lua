-----------------------------------
-- Area: Castle Oztroja (151)
--  MOB: Yagudo_Interrogator
-- Note: PH for Mee Deggi the Punisher
-----------------------------------
local ID = require("scripts/zones/Castle_Oztroja/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob,ID.mob.MEE_DEGGI_THE_PUNISHER_PH,5,3000) -- 50 minutes
end