-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Fallen Knight
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 619, 1, tpz.regime.type.GROUNDS)
end
