-----------------------------------
-- Area: Korroloka Tunnel
--  Mob: Land Worm
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 727, 1, dsp.regime.type.GROUNDS)
end