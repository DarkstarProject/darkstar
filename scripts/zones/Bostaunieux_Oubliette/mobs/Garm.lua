-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--  Mob: Garm
-- Note: PH for Shii
-----------------------------------
local ID = require("scripts/zones/Bostaunieux_Oubliette/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 612, 1, dsp.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.SHII_PH, 5, 3600) -- 1 hour
end
