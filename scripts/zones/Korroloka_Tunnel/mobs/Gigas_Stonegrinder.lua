-----------------------------------
-- Area: Korroloka Tunnel
--  Mob: Gigas Stonegrinder
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 733, 1, tpz.regime.type.GROUNDS)
end