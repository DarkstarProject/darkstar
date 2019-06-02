-----------------------------------
-- Area: Korroloka Tunnel (173)
--  Mob: Bogy
-- Note: PH for Dame Blanche
-----------------------------------
local ID = require("scripts/zones/Korroloka_Tunnel/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 732, 1, dsp.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.DAME_BLANCHE_PH, 5, math.random(7200, 28800)) -- 2 to 8 hours
end
