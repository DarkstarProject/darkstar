-----------------------------------
-- Area: West Ronfaure(100)
--  Mob: Scarab Beetle
-- Note: Place holder for Fungus Beetle
-----------------------------------
local ID = require("scripts/zones/West_Ronfaure/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 3, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 4, 2, dsp.regime.type.FIELDS)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.FUNGUS_BEETLE_PH, 10, math.random(900, 10800)) -- 15 minutes to 3 hours
end
