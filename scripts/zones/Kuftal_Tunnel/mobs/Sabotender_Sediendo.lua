-----------------------------------
-- Area: Kuftal Tunnel
--  Mob: Sabotender Sediendo
-- Note: Place Holder for Sabotender Mariachi
-----------------------------------
local ID = require("scripts/zones/Kuftal_Tunnel/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 738, 2, dsp.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.SABOTENDER_MARIACHI_PH, 5, math.random(10800, 28800)) -- 3 to 8 hours
end
