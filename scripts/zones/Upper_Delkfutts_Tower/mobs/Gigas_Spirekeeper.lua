-----------------------------------
-- Area: Upper Delkfutt's Tower
--  Mob: Gigas Spirekeeper
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 785, 1, tpz.regime.type.GROUNDS)
end