-----------------------------------
-- Area: RoMaeve
--  Mob: Magic Flagon
-- Note: PH for Nightmare Vase and Rogue Receptacle
-----------------------------------
local ID = require("scripts/zones/RoMaeve/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 120, 1, dsp.regime.type.FIELDS)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.NIGHTMARE_VASE_PH, 10, 3600) -- 1 hour
    dsp.mob.phOnDespawn(mob, ID.mob.ROGUE_RECEPTACLE_PH, 10, 7200) -- 2 hour
end
