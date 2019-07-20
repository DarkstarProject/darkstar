-----------------------------------
-- Area: Qufim Island
--  Mob: Giant Ranger
-- Note: PH for Slippery Sucker
-----------------------------------
local ID = require("scripts/zones/Qufim_Island/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 44, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 45, 2, dsp.regime.type.FIELDS)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.SLIPPERY_SUCKER_PH, 10, 600) -- 10 minutes
end
