-----------------------------------
-- Area: Upper Delkfutt's Tower
--  Mob: Jotunn Gatekeeper
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 786, 2, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 788, 1, tpz.regime.type.GROUNDS)
end