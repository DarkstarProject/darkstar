-----------------------------------
-- Area: Korroloka Tunnel
--  Mob: Land Worm
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 727, 1, tpz.regime.type.GROUNDS)
end