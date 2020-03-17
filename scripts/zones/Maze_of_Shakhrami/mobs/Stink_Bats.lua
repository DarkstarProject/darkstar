-----------------------------------
-- Area: Maze of Shakhrami
--  Mob: Stink Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 695, 2, tpz.regime.type.GROUNDS)
end
