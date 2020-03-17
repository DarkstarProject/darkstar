-----------------------------------
-- Area: Upper Delkfutt's Tower
--  Mob: Jotunn Hallkeeper
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 787, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 788, 2, tpz.regime.type.GROUNDS)
end