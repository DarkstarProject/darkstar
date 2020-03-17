-----------------------------------
-- Area: Maze of Shakhrami
--  Mob: Combat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 696, 2, tpz.regime.type.GROUNDS)
end
