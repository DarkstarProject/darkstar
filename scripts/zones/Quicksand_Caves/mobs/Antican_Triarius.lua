-----------------------------------
-- Area: Quicksand Caves
--  Mob: Antican Triarius
-- Note: PH for Triarius X-XV and Hastatus XI-XII
-----------------------------------
local ID = require("scripts/zones/Quicksand_Caves/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 812, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 813, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 814, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 815, 1, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 816, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 817, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 818, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 819, 2, dsp.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.TRIARIUS_X_XV_PH, 10, 7200) -- 2 hours
    dsp.mob.phOnDespawn(mob, ID.mob.HASTATUS_XI_XII_PH, 10, 3600) -- 1 hour
end
