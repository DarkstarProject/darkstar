-----------------------------------
-- Area: Middle Delkfutt's Tower
--  Mob: Tower Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 782, 2, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 783, 2, tpz.regime.type.GROUNDS)
end