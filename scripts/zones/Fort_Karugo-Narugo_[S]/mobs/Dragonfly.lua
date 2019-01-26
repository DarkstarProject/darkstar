-----------------------------------
-- Area: Fort Karugo-Narugo [S]
--  Mob: Dragonfly
-- Note: PH for Demoiselle Desolee
-----------------------------------
local ID = require("scripts/zones/Fort_Karugo-Narugo_[S]/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.DEMOISELLE_DESOLEE_PH, 5, 3600) -- 1 hour
end
