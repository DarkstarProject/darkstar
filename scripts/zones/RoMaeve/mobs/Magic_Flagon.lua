-----------------------------------
-- Area: RoMaeve
--  MOB: Magic Flagon
-- Note: PH for Nightmare Vase
-----------------------------------
local ID = require("scripts/zones/RoMaeve/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 120, 1, dsp.regime.type.FIELDS)
end

function onMobDespawn(mob)
    phOnDespawn(mob, ID.mob.NIGHTMARE_VASE_PH, 10, 3600) -- 1 hour
end
