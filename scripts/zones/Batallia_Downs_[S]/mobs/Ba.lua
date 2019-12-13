-----------------------------------
-- Area: Batallia Downs [S]
--  Mob: Ba
-- Note: PH for Habergoass
-----------------------------------
local ID = require("scripts/zones/Batallia_Downs_[S]/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.HABERGOASS_PH, 10, 5400) -- 90 minutes
end
