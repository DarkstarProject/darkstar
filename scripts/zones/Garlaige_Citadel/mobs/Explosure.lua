-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Explosure
-- Note: PH for Hazmat
-----------------------------------
local ID = require("scripts/zones/Garlaige_Citadel/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 706, 2, dsp.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.HAZMAT_PH, 10, 3600) -- 1 hour
end
