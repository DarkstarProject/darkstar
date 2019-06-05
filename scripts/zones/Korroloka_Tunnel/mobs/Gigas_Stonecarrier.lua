-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Gigas Stonecarrier
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 733, 1, dsp.regime.type.GROUNDS)
end