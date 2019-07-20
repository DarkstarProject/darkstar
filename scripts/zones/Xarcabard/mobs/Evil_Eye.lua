-----------------------------------
-- Area: Xarcabard
--  Mob: Evil Eye
-- Note: PH for Shadow Eye
-----------------------------------
local ID = require("scripts/zones/Xarcabard/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 53, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 54, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 55, 3, dsp.regime.type.FIELDS)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.SHADOW_EYE_PH, 5, 3600) -- 1 hour
end
