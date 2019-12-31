-----------------------------------
-- Area: Xarcabard
--  Mob: Lost Soul
-- Note: PH for Timeworn Warrior
-----------------------------------
local ID = require("scripts/zones/Xarcabard/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 51, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 52, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 53, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 54, 3, dsp.regime.type.FIELDS)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.TIMEWORN_WARRIOR_PH, 5, 5400) -- 90 minutes
end
