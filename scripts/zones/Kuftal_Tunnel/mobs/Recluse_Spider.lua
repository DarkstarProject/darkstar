-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Recluse Spider
-- Note: Place Holder for Arachne
-----------------------------------
local ID = require("scripts/zones/Kuftal_Tunnel/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 737, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 739, 2, dsp.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.ARACHNE_PH, 5, math.random(7200, 28800)) -- 2 to 8 hours
end
