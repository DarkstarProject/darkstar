-----------------------------------
-- Area: Castle Oztroja (151)
--  MOB: Yagudo_Theologist
-- Note: PH for Moo Ouzi the Swiftblade
-----------------------------------
local ID = require("scripts/zones/Castle_Oztroja/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob,ID.mob.MOO_OUZI_THE_SWIFTBLADE_PH,5,3600) -- 1 hour
end
