-----------------------------------
-- Area: Korroloka Tunnel
--  Mob: Greater Pugil
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 731, 2, tpz.regime.type.GROUNDS)
end